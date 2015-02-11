<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bc="urn:com.workday/bc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xtt="urn:com.workday/xtt"
    xmlns:wd="urn:com.workday.report/CR_INT0064_Health_Efx_Outbound"
    xmlns:etv="urn:com.workday/etv" xmlns:out="http://www.workday.com/integration/output"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0" exclude-result-prefixes="xsd xsl bc out">


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 21, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0064 Health Efx Outbound Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes"/>

    <xd:doc>
        <xd:desc>
            <xd:p>General Description of the template</xd:p>
        </xd:desc>
    </xd:doc>
    
    

    <xsl:template match="wd:Report_Data">
        
        <File >
         
            <xsl:for-each select="wd:Report_Entry">
              
                <!--Detail Record-->
                <DetailRecord xtt:endTag="&#xA;" xtt:separator="|">
                    <EEID><xsl:value-of select="wd:Employee_ID"/></EEID>
                    <SSN><xsl:value-of select="wd:Worker/wd:Social_Security_Number"/></SSN>
                   <FirstName><xsl:value-of select="wd:Worker/wd:Legal_Name_-_First_Name"/></FirstName>
                   <LastName><xsl:value-of select="wd:Worker/wd:Legal_Name_-_Last_Name"/></LastName>
                    <Addressline1><xsl:value-of select="wd:Worker/wd:Primary_Address_-_Formatted_Line_1"/></Addressline1>
                    <Addressline2><!--<xsl:value-of select="wd:Worker/wd:Primary_Address_-_Formatted_Line_2"/>--></Addressline2>
                    <city><xsl:value-of select="wd:Worker/wd:Primary_Address_-_City"/></city>
                    <statecode><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Home_State_ISO__Worker_"/></statecode>
                    <postalcode><xsl:value-of select="wd:Worker/wd:Primary_Address_-_Postal_Code"/></postalcode>
                    <DOB><xsl:value-of select="wd:Worker/wd:dateOfBirth"/></DOB>
                    <DOH><xsl:value-of select="wd:Worker/wd:Hire_Date"/></DOH>
                    <TermDate><xsl:value-of select="wd:Worker/wd:termination_date"/></TermDate>
                    <Position><xsl:value-of select="wd:Worker/wd:Position/@wd:Descriptor"/></Position>
                    <TimeType><xsl:value-of select="wd:Worker/wd:Time_Type"/></TimeType>
                    <EmpStatus><xsl:value-of select="wd:Worker/wd:Emp_Status"/></EmpStatus>
                    <LeaveStart><xsl:value-of select="wd:Worker/wd:First_Day_of_Leave"/></LeaveStart>
                    <ReturnfromLeave><xsl:value-of select="wd:Worker/wd:Last_Day_of_Leave_-_Actual"/></ReturnfromLeave>
                    <PayRateType><xsl:value-of select="wd:Worker/wd:Pay_Rate_Type"/></PayRateType>
                    <HoursWorked><xsl:value-of select="wd:Worker/wd:Scheduled_Weekly_Hours"/></HoursWorked>
                    <GrossYTD><xsl:value-of select="wd:Gross_YTD"/></GrossYTD>
                    <RegularEarnings><xsl:value-of select="wd:Regular_Current_Period"/></RegularEarnings>
                    
                    <HourlyRate><xsl:value-of select="wd:Worker/wd:Hourly_Rate_-_Amount"/></HourlyRate>
                    <PeriodStart><xsl:value-of select="wd:Period_Start_Date"/></PeriodStart>
                    <PeriodEnd><xsl:value-of select="wd:Period_End_Date"/></PeriodEnd>
                   
                   
               </DetailRecord>
                   
                   
            <!--       
                   
                   <!-\-Dependent1 Record-\->
                <xsl:for-each select="wd:Worker/wd:Dependents">
                 
                <DependentRecord xtt:endTag="&#xA;" xtt:separator="|">
                    <EEID><xsl:value-of select="./wd:Employee_ID"/></EEID>
                    <FirstName><xsl:value-of select="wd:Legal_Name_-_First_Name"/></FirstName>
                    <LastName><xsl:value-of select="Legal_Name_-_Last_Name"/></LastName>
                    <SSN><xsl:value-of select="wd:Social_Security_Number"/></SSN>
                    <DOB><xsl:value-of select="wd:dateOfBirth"/></DOB>
                </DependentRecord>
                        
                </xsl:for-each>
                -->
                
                
               <!-- <!-\-Dependent2 Record-\->
                <xsl:choose>
                    <xsl:when test="wd:Worker/wd:CF_INT0064_ESI_Dependent_2__Worker_ != '' ">
                        
                        <DependentRecord xtt:endTag="&#xA;" xtt:separator="|">
                            <FirstName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_2_First_Name__Worker_"/></FirstName>
                            <LastName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_2_Last_Name__Worker_"/></LastName>
                            <SSN><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_2_SSN__Worker_"/></SSN>
                            <DOB><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_2_DOB__Worker_"/></DOB>
                        </DependentRecord>
                        
                    </xsl:when>
                </xsl:choose>-->
                
                <!--<!-\-Dependent3 Record-\->
                <xsl:choose>
                    <xsl:when test="wd:Worker/wd:CF_INT0064_ESI_Dependent_3__Worker_ != '' ">
                        
                        <DependentRecord xtt:endTag="&#xA;" xtt:separator="|">
                            <FirstName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_3_First_Name__Worker_"/></FirstName>
                            <LastName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_3_Last_Name__Worker_"/></LastName>
                            <SSN><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_3_SSN__Worker_"/></SSN>
                            <DOB><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_3_DOB__Worker_"/></DOB>
                        </DependentRecord>
                        
                    </xsl:when>
                </xsl:choose>
                
                <!-\-Dependent4 Record-\->
                <xsl:choose>
                    <xsl:when test="wd:Worker/wd:CF_INT0064_ESI_Dependent_4__Worker_ != '' ">
                        
                        <DependentRecord xtt:endTag="&#xA;" xtt:separator="|">
                            <FirstName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_4_First_Name__Worker_"/></FirstName>
                            <LastName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_4_Last_Name__Worker_"/></LastName>
                            <SSN><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_4_SSN__Worker_"/></SSN>
                            <DOB><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_4_DOB__Worker_"/></DOB>
                        </DependentRecord>
                        
                    </xsl:when>
                </xsl:choose>
                
                <!-\-Dependent5 Record-\->
                <xsl:choose>
                    <xsl:when test="wd:Worker/wd:CF_INT0064_ESI_Dependent_5__Worker_ != '' ">
                        
                        <DependentRecord xtt:endTag="&#xA;" xtt:separator="|">
                            <FirstName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_5_First_Name__Worker_"/></FirstName>
                            <LastName><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_5_Last_Name__Worker_"/></LastName>
                            <SSN><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_5_SSN__Worker_"/></SSN>
                            <DOB><xsl:value-of select="wd:Worker/wd:CF_INT0064_LRV_Dependent_5_DOB__Worker_"/></DOB>
                        </DependentRecord>
                        
                    </xsl:when>
                </xsl:choose>
                -->
                
               
            </xsl:for-each>
           
            
        </File>
    </xsl:template>

    
</xsl:stylesheet>