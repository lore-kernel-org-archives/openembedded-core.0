Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web12.4908.1618885950619720448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 19:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ebH7Aza7;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIYFkC+k5Y7yiM67VWrMrztqCXzOXWKhPKaZP6OxRo5ulmIZo/oht5ZE1QDr1GNTHLvguakmbP/gLlBLcY6BAd747TbdZp1GCxIrwCbHZZ39QrzRT8gsH+77Io/kW5nkRxiVBKtRl/0gThQZrqSptO6BHQDctO1ZjiRHOlzi8EQjqq6RAZlHTuKoIw6S0Vep4ll2+Cn8HWG79GfB4SeQW8z0H1amI8xlF1CG9u5UgX5OWMspV/Gk/xw6fNl5z7VSnR0dKsUEa9N5ZQYmlBzWoNTlrCjS2G3OSweeJyjY95MDmyGrrlJOtUuNmmxTbInB5LyMt7mwKJ+WBTLGst8XUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EH34jVEmRzK60O82h7rrGGYcTUGEXddAe9/F+GHHGA=;
 b=g6DYIsPoXcMRL8ZF8TMgo+kgx2SrWj3e7Owy29g9RSdbDIgPt8C1L4G2tS/+EeRvcexv8RmfmNoHLBAtLkv6sXDZleJEi69yKIddHeNoteSYP01UZsg//mawuaiwYZGyO/GYcgu2AQgGvBxX+pLvFOyhfsgKyrSj/fH4j253qS5IvZSijcMrYHUWsLaegrVmzNLBxF2umosvyuHrR+LX6zgQdMhsdaez0bVDpZ7tIefV1WtMUIRGMspdAvS7IsqU2vqM5AgwUa8XLi4dHQKG6nN6xhnx9LKfT3/SqYIJDzX/T8DiA4KPyQGZ1bIYJFauBFLrDTwzL3vznK3bQFgz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EH34jVEmRzK60O82h7rrGGYcTUGEXddAe9/F+GHHGA=;
 b=ebH7Aza7mGZ7yzgni91+nlzpZUDrWxnUl4m8HpdZjljB54IRx07qRsYbsWKlYuva/KmF1syl300dg42rZ/sVa+4LF8j2aa6p2VomA7LUUhFvoyws8kn3d3Kpoi8CRD1V9v7Q9rKy9nfyoJKf84f9adN0GEmtI7ltYkPMkmLIwzs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2727.namprd11.prod.outlook.com (2603:10b6:a02:c7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 20 Apr
 2021 02:32:27 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 02:32:27 +0000
Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
To: "zhengrq.fnst@fujitsu.com" <zhengrq.fnst@fujitsu.com>,
 "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
References: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <YH0qTWrdEX5VH3eS@korppu>
 <OS3PR01MB6241D19197EB67173486060E8B489@OS3PR01MB6241.jpnprd01.prod.outlook.com>
 <16776F7A4F5368B1.4443@lists.openembedded.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <a7ddce56-bf9e-0c35-e4a7-86c1b07e19e6@windriver.com>
Date: Tue, 20 Apr 2021 10:40:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <16776F7A4F5368B1.4443@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:203:c9::6) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0019.apcprd03.prod.outlook.com (2603:1096:203:c9::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4065.8 via Frontend Transport; Tue, 20 Apr 2021 02:32:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0cbd6bf-85d4-49e3-dfec-08d903a489b2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2727:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB272771FB62A77C81CE626150ED489@BYAPR11MB2727.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q+48+fnS4CcoClsPjyYyfoxrQ09Q0qa3DGBiVr/c/nBf6TgT8CaJ8AZSVzAnCaif3H6TwfTGYwru6DmkwPuQPpeHdv3CZuOeLy4qKzODyUMYi57SA0ovSzqTGwuKXvuWv/KpC82Ne6xLWN1YTWVRuBxWtmUk1UUzm6+vk5pxoNAGszE3i/sa1iRzFVlAKbZeXl7MDyufDCY2Cehnj8qEjoZw/63sksDGHCCc6Hf2Antekc323Q310VrS+nFHX5Be6rnUz+ReJT60a2ZKGSPKgCvRb46RR/DYoF+n8eWyFKIG0i5dqNGH6dSRHwEAk+xNNm3Ra7yogZO1SUk1fwLa5JO6OsfqstxvHkdR0WJNPX7KewON2kLmm2MmICSkermBUZn9URcBC7ndGD2AN1fihBD2ULd/WzUcVN9meVAd1PIHXD364vx15w7zWoUH3DKUoRMU3YINsbh5isRqX06A2F9HPDnVAShYUF7JWvj6LPCd2ajyqJWjsqtq24g95z+gS9T0CVCneV0FrpS4U52MtrllcYjtBZJz1Tk7KU9BwAC+Dg8ohgY2e3H7NSbXoIWoevrfxqsTlwdNDLVJi2x55j7v/NSdXDbYNzoWgE3s2jWyzL0KByeVOuO5Vy/MtnRJNwawPNVQYccd5GOLQGa/rMS61fJGCSVpN5khb479hDcdbWrxWMVx64+KeHW2L5GUKba/6OYLdF38shls2iImZQc/nxkcpMUmQy/jHbibR4UWc9qsckAgG7u7l79U7y/k7KVK91BxRtbXTo/R/y38b9e+D17YkySg2p799mMvxZ1ppT9tyidPOB63MERV31ph
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(52116002)(2616005)(6486002)(38100700002)(21615005)(6666004)(66556008)(83380400001)(53546011)(478600001)(2906002)(31696002)(6706004)(16576012)(33964004)(316002)(36756003)(4326008)(8936002)(66946007)(8676002)(956004)(86362001)(186003)(16526019)(166002)(31686004)(966005)(5660300002)(110136005)(66476007)(26005)(38350700002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TUFKdGd3OUlSbGxrNzlLM21mdGNVdmZ3RWRjUWVGRVNRSzNuVzZiWVQxSk9W?=
 =?utf-8?B?WXA0VE9mV01hL05IajMwMjA4ckJ2RWg1Z1hMR1hMMTdWd1lqcy85RDlCRUVp?=
 =?utf-8?B?eUo0QlpWWmNRbC9VOVo5MXIwTWFibXltNnRVdHlTNnJwSjhya1hxZW1Ra3k2?=
 =?utf-8?B?bE1TTmpVZ2lYVDQ2d0puampNSlBVd29JYVBjdTIvRjVRcU11K1JCbHV3cmxF?=
 =?utf-8?B?MGpTcnc5eDVrWXN4S3oyUXZ0b1lRQndOODE3UXZJZ2MwOTlUTE1hTjNLbGR3?=
 =?utf-8?B?c3hXVVVmUmYzcnZSWHY1R05tQnVURW5MMkZFbG9EcS9yM2F2RlkwWHovS1lN?=
 =?utf-8?B?SVF3RGh6eG9SQnNvZHRuWUxMSUZuSTBhektJMDR4WVRmZm5VaWk5S2pIZ0dw?=
 =?utf-8?B?eGdTNVFvdndkeVVXdGdPM2QwZ2Fac1oxeG1SSThlUFR3bW1paCtMVlU5Q1FC?=
 =?utf-8?B?NlVFRmZNZDltQXI5cU1MSDdLcjBuSW5oT3FVNEJXd3pyMElZZGFWSDlVWlJq?=
 =?utf-8?B?NSsxYWwwVUQ5L3FlU2JmM004QWdtZ202S2JMTlI2cjFIaFE4a3dVZWt4SGRz?=
 =?utf-8?B?VkVld29QZTRrc2Q1cm5TRTBiWnRZTVRUWmxnVENnNVB0aDZMVzBFMmxBcTht?=
 =?utf-8?B?RFQ3cE9GajFKZmVGRjJuVjVObVBtM3RwT0dRdit2U0VpVk9RbWErak16S0pV?=
 =?utf-8?B?MCttakxmVmxjd3JVUDJnRWdXU21oVEFIaTgrbG1XN29yU3dGMlhaQ0lsVnc1?=
 =?utf-8?B?dHRPUldTcFI0TlJaR0ZraDc5WUtNMFFLZmYrMzlqSG9vOXVPT0R5V2V5TjZJ?=
 =?utf-8?B?L3dZb2FiaXVVZ1pmcnQzSWZYRkVPOUJjUFFMZWp4N3hRZUdUV0wweWk1czBK?=
 =?utf-8?B?ZU9uZVlrQUVSWlVJcmZ2WUZnb0ZOa29TQk9GZUhUb0JEN0FhVjRhV05DbjVV?=
 =?utf-8?B?ZEQzZEk1OG5jTmFDZXFuUHJHd0NvbWs4c29oZzVWcm10eFdsSnR1REZKODJs?=
 =?utf-8?B?Ukhzdk4wcjMxNk5rNHpkTGNxdHpuOHRyQzFXMk1zVnluaGtZbW5qYzgxY0Qw?=
 =?utf-8?B?d3NoZjFTSGwrbGE4RTFkY3ZuY3l5bko1cW14T3dHRXRsaUp1WkNaQnp1VUwy?=
 =?utf-8?B?MlZha3NMU3MvSkRKV1dLK3czbkgvNXNOWUF1WUJUbktjSFFwWUpWb1A2NG00?=
 =?utf-8?B?WjRTQ3NDeVhwRlZnaDBnei9XaGhsL05HSHZTMTdLdFJMVHRMS1RzL0Fmc0pY?=
 =?utf-8?B?TGh5ZGFlalhwS1VwdjBvcEdNTGxmYngyLzNJQ2FhSytSd21RRXR6ZHlEMDB6?=
 =?utf-8?B?TzNsT3hicHZyUFBGWDlJRkZBQXZ4MW85K2xtRnJUQXBOVnlTV1FLMmZBNXhX?=
 =?utf-8?B?OU9TQm8ycWhtNkVpcWEyS0xjTHlVaFRoVWswYXVERXMrSVpGb0RUM1dtVFlx?=
 =?utf-8?B?NjlZUHRwUjh4MkxZQTBjdHFVQSs5UEh0VGdJNFRiVzhlaVFYeFNvSmtLZjBv?=
 =?utf-8?B?a21OMmJKaTIyVzdEOUovVklRdnZaMFRrMnE4clptMUVaWVFHZSs3NlYxMldn?=
 =?utf-8?B?TThld3lpRGE3RStUNWl5NWJmcnBSY1VUZDk3Zk4xQkRLaDRnMGtVVEpYUDVh?=
 =?utf-8?B?THlWdlRVcThJbXFEbzhqb3owaDlLclpjRzNrWnkxRTVpbE9pLzFkdmsyQWZi?=
 =?utf-8?B?VWpOb1oyUnk2dDdXTWlKa25waUV4WCtSd1UvaVdOSTNoRmJGbHpleDNBeUlt?=
 =?utf-8?Q?jIfuZnIoFIfbBg3B+SC9T3IP+H1Vya86fVdxmxy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cbd6bf-85d4-49e3-dfec-08d903a489b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 02:32:27.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laCyy2Q6SVJFi6teONwVmOqy49rxCcWZ7uH3RmLEoA2mvB9P9iAKkLHTkkKOmRw1BDyArQHmZgCl+lqv3fSjRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2727
Content-Type: multipart/alternative;
 boundary="------------B534655663921321C892DD54"

--------------B534655663921321C892DD54
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Zheng,

Looking at it further. I have to say that your observation is correct. 
The CVE_PRODUCT for 'db' recipe is not complete.
Both 'oracle_berkeley_db' and 'berkeley_db' are used.
I've sent out a patch to fix it.

Best Regards,
Chen Qi

On 04/20/2021 10:27 AM, Chen Qi wrote:
> I think they are two different projects.
> https://www.ibm.com/products/db2-database
> https://www.oracle.com/database/technologies/related/berkeleydb.html
>
> You can also use the original json file to check.
>
> e.g.
> $ grep -l 'cpe:.*:oracle:oracle_berkeley_db:' ~/.cvedb/nvdcve-1.1-*.json
> /home/qichen/.cvedb/nvdcve-1.1-2016.json
> /home/qichen/.cvedb/nvdcve-1.1-2017.json
> $ grep -l 'cpe:.*:ibm:db2:' 
> ~/.cvedb/nvdcve-1.1-*.json/home/qichen/.cvedb/nvdcve-1.1-2005.json
> /home/qichen/.cvedb/nvdcve-1.1-2010.json
> /home/qichen/.cvedb/nvdcve-1.1-2012.json
> /home/qichen/.cvedb/nvdcve-1.1-2013.json
> /home/qichen/.cvedb/nvdcve-1.1-2014.json
> /home/qichen/.cvedb/nvdcve-1.1-2015.json
> /home/qichen/.cvedb/nvdcve-1.1-2016.json
> /home/qichen/.cvedb/nvdcve-1.1-2017.json
> /home/qichen/.cvedb/nvdcve-1.1-2018.json
> /home/qichen/.cvedb/nvdcve-1.1-2019.json
> /home/qichen/.cvedb/nvdcve-1.1-2020.json
> /home/qichen/.cvedb/nvdcve-1.1-Modified.json
>
> Best Regards,
> Chen Qi
>
> On 04/20/2021 09:55 AM, zhengrq.fnst@fujitsu.com wrote:
>> Hi, Mikko, Chen
>>
>> Now, cve_check can't checkout any cve issues of db. I read new 
>> nvdcve_1.1.db and guess the name of CVE_ PRODUCT should be corrected.
>> ps: I don't have the old nvdcve_1.1.db, so, I can't make sure that 
>> the old name of db is "oracle_berkeley_db".
>>
>> $ grep oracle_berkeley_db SELECT_FROM_PRODUCTS.log
>> $
>> $ grep "|db2|" SELECT_FROM_PRODUCTS.log
>> CVE-2010-0462|ibm|db2|9.1|=||
>> CVE-2010-0462|ibm|db2|9.1_fp1|=||
>> CVE-2010-0462|ibm|db2|9.1_fp2|=||
>> CVE-2010-0462|ibm|db2|9.1_fp2a|=||
>> CVE-2010-0462|ibm|db2|9.1_fp3|=||
>> CVE-2010-0462|ibm|db2|9.1_fp3a|=||
>> CVE-2010-0462|ibm|db2|9.1_fp4|=||
>> CVE-2010-0462|ibm|db2|9.1_fp4a|=||
>> CVE-2010-0462|ibm|db2|9.1_fp5|=||
>> CVE-2010-0462|ibm|db2|9.1_fp6|=||
>> CVE-2010-0462|ibm|db2|9.1_fp6a|=||
>> CVE-2010-0462|ibm|db2|9.1_fp7|=||
>> CVE-2010-0462|ibm|db2|9.1_fp7a|=||
>> CVE-2010-0462|ibm|db2|9.1_fp8|=||
>> CVE-2010-0462|ibm|db2|9.5|=||
>> CVE-2010-0462|ibm|db2|9.5_fp1|=||
>> CVE-2010-0462|ibm|db2|9.5_fp2|=||
>> CVE-2010-0462|ibm|db2|9.5_fp2a|=||
>> CVE-2010-0462|ibm|db2|9.5_fp3|=||
>> CVE-2010-0462|ibm|db2|9.5_fp3a|=||
>> CVE-2010-0462|ibm|db2|9.5_fp3b|=||
>> ......
>>
>> Best regards
>> Zheng
>>
>>
>>> -----Original Message-----
>>> From: Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de>
>>> Sent: Monday, April 19, 2021 2:59 PM
>>> To: Zheng, Ruoqin/郑 若钦 <zhengrq.fnst@fujitsu.com>
>>> Cc: openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
>>>
>>> On Mon, Apr 19, 2021 at 09:45:01PM +0800, zhengruoqin wrote:
>>>> In the CVE database, now it use db2 instead of oracle_berkeley_db.
>>>> So, in order to be handled correctly by CVE check, modify CVE_ 
>>>> PRODUCT.
>>> Which CVEs, please add an example? In the past oracle_berkeley_db 
>>> was used.
>>> I wonder if both would need to be there, or if using the new value 
>>> is sufficient
>>> from now on.
>>>
>>> -Mikko
>>>
>>>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
>>>> ---
>>>>   meta/recipes-support/db/db_5.3.28.bb | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>>>> b/meta/recipes-support/db/db_5.3.28.bb
>>>> index 9cb57e6a53..05720053f4 100644
>>>> --- a/meta/recipes-support/db/db_5.3.28.bb
>>>> +++ b/meta/recipes-support/db/db_5.3.28.bb
>>>> @@ -15,7 +15,7 @@ HOMEPAGE =
>>>> "https://www.oracle.com/database/technologies/related/berkeleydb.html
>>>>   LICENSE = "Sleepycat"
>>>>   RCONFLICTS_${PN} = "db3"
>>>>
>>>> -CVE_PRODUCT = "oracle_berkeley_db"
>>>> +CVE_PRODUCT = "db2"
>>>>   CVE_VERSION = "11.2.${PV}"
>>>>
>>>>   PR = "r1"
>>>> -- 
>>>> 2.25.1
>>>>
>>>>
>>>>
>
>
>
> 
>


--------------B534655663921321C892DD54
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Zheng,<br>
      <br>
      Looking at it further. I have to say that your observation is
      correct. The CVE_PRODUCT for 'db' recipe is not complete.<br>
      Both 'oracle_berkeley_db' and 'berkeley_db' are used.<br>
      I've sent out a patch to fix it.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 04/20/2021 10:27 AM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:16776F7A4F5368B1.4443@lists.openembedded.org" type="cite">I think they are two different projects.
      <br>
      <a class="moz-txt-link-freetext" href="https://www.ibm.com/products/db2-database">https://www.ibm.com/products/db2-database</a>
      <br>
<a class="moz-txt-link-freetext" href="https://www.oracle.com/database/technologies/related/berkeleydb.html">https://www.oracle.com/database/technologies/related/berkeleydb.html</a>
      <br>
      <br>
      You can also use the original json file to check.
      <br>
      <br>
      e.g.
      <br>
      $ grep -l 'cpe:.*:oracle:oracle_berkeley_db:'
      ~/.cvedb/nvdcve-1.1-*.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2016.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2017.json
      <br>
      $ grep -l 'cpe:.*:ibm:db2:'
      ~/.cvedb/nvdcve-1.1-*.json/home/qichen/.cvedb/nvdcve-1.1-2005.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2010.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2012.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2013.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2014.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2015.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2016.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2017.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2018.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2019.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-2020.json
      <br>
      /home/qichen/.cvedb/nvdcve-1.1-Modified.json
      <br>
      <br>
      Best Regards,
      <br>
      Chen Qi
      <br>
      <br>
      On 04/20/2021 09:55 AM, <a class="moz-txt-link-abbreviated" href="mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.com</a> wrote:
      <br>
      <blockquote type="cite">Hi, Mikko, Chen
        <br>
        <br>
        Now, cve_check can't checkout any cve issues of db. I read new
        nvdcve_1.1.db and guess the name of CVE_ PRODUCT should be
        corrected.
        <br>
        ps: I don't have the old nvdcve_1.1.db, so, I can't make sure
        that the old name of db is &quot;oracle_berkeley_db&quot;.
        <br>
        <br>
        $ grep oracle_berkeley_db SELECT_FROM_PRODUCTS.log
        <br>
        $
        <br>
        $ grep &quot;|db2|&quot; SELECT_FROM_PRODUCTS.log
        <br>
        CVE-2010-0462|ibm|db2|9.1|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp1|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp2|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp2a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp3|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp3a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp4|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp4a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp5|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp6|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp6a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp7|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp7a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.1_fp8|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5_fp1|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5_fp2|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5_fp2a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5_fp3|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5_fp3a|=||
        <br>
        CVE-2010-0462|ibm|db2|9.5_fp3b|=||
        <br>
        ......
        <br>
        <br>
        Best regards
        <br>
        Zheng
        <br>
        <br>
        <br>
        <blockquote type="cite">-----Original Message-----
          <br>
          From: <a class="moz-txt-link-abbreviated" href="mailto:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a> <a class="moz-txt-link-rfc2396E" href="mailto:Mikko.Rapeli@bmw.de">&lt;Mikko.Rapeli@bmw.de&gt;</a>
          <br>
          Sent: Monday, April 19, 2021 2:59 PM
          <br>
          To: Zheng, Ruoqin/郑 若钦 <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@fujitsu.com">&lt;zhengrq.fnst@fujitsu.com&gt;</a>
          <br>
          Cc: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <br>
          Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
          <br>
          <br>
          On Mon, Apr 19, 2021 at 09:45:01PM +0800, zhengruoqin wrote:
          <br>
          <blockquote type="cite">In the CVE database, now it use db2
            instead of oracle_berkeley_db.
            <br>
            So, in order to be handled correctly by CVE check, modify
            CVE_ PRODUCT.
            <br>
          </blockquote>
          Which CVEs, please add an example? In the past
          oracle_berkeley_db was used.
          <br>
          I wonder if both would need to be there, or if using the new
          value is sufficient
          <br>
          from now on.
          <br>
          <br>
          -Mikko
          <br>
          <br>
          <blockquote type="cite">Signed-off-by: Zheng Ruoqin
            <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@fujitsu.com">&lt;zhengrq.fnst@fujitsu.com&gt;</a>
            <br>
            ---
            <br>
            &nbsp; meta/recipes-support/db/db_5.3.28.bb | 2 +-
            <br>
            &nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)
            <br>
            <br>
            diff --git a/meta/recipes-support/db/db_5.3.28.bb
            <br>
            b/meta/recipes-support/db/db_5.3.28.bb
            <br>
            index 9cb57e6a53..05720053f4 100644
            <br>
            --- a/meta/recipes-support/db/db_5.3.28.bb
            <br>
            +++ b/meta/recipes-support/db/db_5.3.28.bb
            <br>
            @@ -15,7 +15,7 @@ HOMEPAGE =
            <br>
&quot;<a class="moz-txt-link-freetext" href="https://www.oracle.com/database/technologies/related/berkeleydb.html">https://www.oracle.com/database/technologies/related/berkeleydb.html</a>
            <br>
            &nbsp; LICENSE = &quot;Sleepycat&quot;
            <br>
            &nbsp; RCONFLICTS_${PN} = &quot;db3&quot;
            <br>
            <br>
            -CVE_PRODUCT = &quot;oracle_berkeley_db&quot;
            <br>
            +CVE_PRODUCT = &quot;db2&quot;
            <br>
            &nbsp; CVE_VERSION = &quot;11.2.${PV}&quot;
            <br>
            <br>
            &nbsp; PR = &quot;r1&quot;
            <br>
            --
            <br>
            2.25.1
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------B534655663921321C892DD54--
