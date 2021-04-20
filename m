Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.59])
 by mx.groups.io with SMTP id smtpd.web10.4811.1618885161389063464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 19:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PNcTUoGH;
 spf=pass (domain: windriver.com, ip: 40.107.237.59, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1dhQ/xfTf/SkN0ESdii/qbMpsOSPxfqrETW5CqXyp2aquifkb1gUSwoikty+x80IBC91ytYpgWBYvLDRjnKXc/gpfWYhJSYjWbYqDwunhdHJqXVO5YyYP6oJHr8/dAAM2G3WA0u+Rms8F/EXA27+VPOM8mPMQDN5DeUAVsJy6jet8I2N66fKKSU+sfLX9WxSAVp+xp+0x/H5G9nMkIVdiDcoxFJj5KW5N+sPbdbcXvhpROGS96NW7Xb1btN84Zao+aD51pBenT+djtGZkDW4Ldo6NfUSQBade2HMqJ8+8xBqJQjwMTmL0XN5HSLQGeCUL88eRfT8W+Zwd85ITR7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+d/KilneBWn0T805xzKjxr+6vzk9WH4rjISlhrK5bI=;
 b=R6xV/hhtdmAVMrz/evHKpItZ8FhbGyIVIf+pX+dVDH7p/xferdxcxg5pjD9sV9w0f/pmzcTHrWAiVmBtz2tYALxPYChLSgHp76F/LMEUpqz7imYAxXQLP6Gn7k9d6BCvmEPAcfdf+bolE0Y5gpCRhxBk/9NqD5CbXDVYjYKyfx+RSZx7lDyBgAIPFjIsgj2S8gGpYJTsBWJ2Tr8EtKNJRhbODWf2JE9O+VjjnK5EYYLKFr2nEAzgaFmKiOykNU9FJh/vrVRfIvTuCI2LDla+Ve4/q0pBim9lz51DhZW2ZohtmVnpldpdltPxnQdhB375rhcpXtY/BwDyzbIa5hnu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+d/KilneBWn0T805xzKjxr+6vzk9WH4rjISlhrK5bI=;
 b=PNcTUoGHZ0OQL6iNYOQ9ZoUT6x0OAcBUodBgcAXIdpq69khACmZODcKirKZt63mzHEDjIQpG5PgIPWzja1ErCpVrI3nA/mGUCKRcLatT/w4pYfrtMbOptKIrKRuAnlvXAqxps06GeDtD43oX/lQd/wfHwCu8yDfl/rQ5L5aPPQg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3349.namprd11.prod.outlook.com (2603:10b6:a03:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 02:19:19 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 02:19:19 +0000
Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
To: "zhengrq.fnst@fujitsu.com" <zhengrq.fnst@fujitsu.com>,
 "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
References: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <YH0qTWrdEX5VH3eS@korppu>
 <OS3PR01MB6241D19197EB67173486060E8B489@OS3PR01MB6241.jpnprd01.prod.outlook.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <64ee209f-542e-9b79-fa4b-03faa4a7903a@windriver.com>
Date: Tue, 20 Apr 2021 10:27:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <OS3PR01MB6241D19197EB67173486060E8B489@OS3PR01MB6241.jpnprd01.prod.outlook.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BL0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:207:3c::47) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by BL0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:207:3c::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 02:19:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db12a647-260e-42e5-b933-08d903a2b3f8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3349:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3349297EC527BAA85319691FED489@BYAPR11MB3349.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wFUdqAlDmFxa1zEYm8AqRMLplOOIX2uUKGxr34mIx4Roe6PQ4DaTBkXDyMu5GCcolJN97yC96qp1rkfJsaVRKD+sWRlMFnpKeWOyR8Yv/mLCxu5WqhFn9oUAL/n5LlBP5G1GcszZIU7DGtzqT6XOtMctW02gzg3lUVF4qilq+1EZHTyCNTEXU05y3cREKmj6o22uFLH9uUY7Pi5kltZp9gIycQHozqCCMVni0+47YT3BFeX1L+nEH0zZdRTrcurdEf3J5lep3bVvLG0Or303CqglAu5Q4ON8Qnoh8AFPyAdxZKXLkraqEOQxuqRufYSL79lzaQ8bXEU5kRg06Ey6jFskKEw6lPRBLswEijlH36lTrqQtok+ftbJDGhIeTHAXb8Ur0Rz5JOe6sxJ2vbYayHHk60n5d59XqAEsxq8nG+GSK2922e4qFpEXLf1woxjzy2n5y836tw7HUHjbKJv1q050Mx71sDdOv91kKdsIydKlgY7vcWMtEYPCbeQN7rHega/n4PmBg3KMHO9MT+AKNqySaLpcLxNTLYzrZbG1c/IvnOizlirM9B7KInslJ1KvlMz2Jv6su5+fxCIUulWsUJZsiXCN1c6HTo3xNSbew2NHzWOXVEB48WqHkGJLOkbXy/yAF2UJx4UqPXQQ7cmrI2ZdYS83tgyl2Nmg5fRPem4e9soWr/Px+iWqQz9w/hcefNDrXiodd60lmJDveW0eaL9XCutJE5Z+TKJ1/y7tM52o8ECoYq63IHkz/RPizpmk0J1x5eMNUPogRXss1Q0vAUUbqbTLSWPCu9gRPkRDGlBq6lU5LlpDhhIo28PNvHxu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(6666004)(31696002)(53546011)(83380400001)(5660300002)(66946007)(956004)(52116002)(66476007)(2906002)(66556008)(316002)(38100700002)(16576012)(966005)(26005)(86362001)(8676002)(31686004)(110136005)(8936002)(38350700002)(4326008)(478600001)(6486002)(6706004)(186003)(2616005)(16526019)(36756003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4EsOKQoBvXb+J24oOpUjVtMhAeM8dvd9Lh7guSNzptY5UrsPy+0jUa/IgtZe?=
 =?us-ascii?Q?1kODzpfuECI3vQ9RTTaqCbaEpqQdL7Px0vk7XVjcdYCQo1I3KPLn3ujlfl9U?=
 =?us-ascii?Q?W9nvbDiij/HdSGRIIPxh6RKh5FLqtPnLVUFEiimpLCzjrb1n5vpdqYp9FDzq?=
 =?us-ascii?Q?rrmBQ5o1tX2gaw9k/PjpjfGMD/2Hgplx0pEVWRtIC42XxQgmeElX25SVu/P5?=
 =?us-ascii?Q?EN8I5DTfw0/up0MdQw9JOHfZOV+fziuhCHAV9iwcBRtxQpCjYeY4OdoVkj+W?=
 =?us-ascii?Q?gXrvZoCzXHur2BIKTdTgF6f4jFnxVYsYzUs/nwtRDCeRsv1s39a2twyRbIjM?=
 =?us-ascii?Q?XzW4GUIpvi5mWM7MDwJpvDp9zN3dyImwpXE+GkSY71MFSu4tP4PYpXFMSFdO?=
 =?us-ascii?Q?tjHet1xz55XjFZ6XurKUSp2fle+GEKJnLqt8QhVnsTl8J23TsxNYDsRy0Lm7?=
 =?us-ascii?Q?dA+5KoxGusiuEeotOgSUL0iospnf7ZNfkajR3WBN28V3Vfczg+nIu6FK/JdO?=
 =?us-ascii?Q?0FWgUO5HW/k75crLzFU23AQ9gOhvqAYljNUQYJfXNFFqlIcePdwPvMtJOKNf?=
 =?us-ascii?Q?mohGy4B+XUvHsTK7dcs39s9YOL+fvDZgCe26Xnv2gdILz9b42lNxVHglRCxM?=
 =?us-ascii?Q?dCBbIPQOm/DKPpV1Sx7WP39xMNe81u9dww4JZOE9uCvy/WQPnRWiX2cg3Dx5?=
 =?us-ascii?Q?KWcuVzQgQ9F70jY1ejryxNKsgycV/fpT10aeGZrjKE8/Ss1ctc71qZrxZX0m?=
 =?us-ascii?Q?FTBjWfZ2e/xgSkxuRKGhrrjTYekRIgSJRxbCA8UWuHyTJ2Lugsg29J/Ese0X?=
 =?us-ascii?Q?I0TAl3MbFvZeTRfKPQn/rjToYB7fArkwqwo9xlnK09uIne3AmWhxod/1LUjO?=
 =?us-ascii?Q?jQFZiGDSC3DECuucF/uzsKEXAiiJgXzD/nWD5jwo9PQ1qeYC6aZ86tgecZ8X?=
 =?us-ascii?Q?AiZyuBDqGeMB9Hc0o5hv/gHf4+nv6zOaZKu44xyGjKVhD8zorYtIc+ZsIRBL?=
 =?us-ascii?Q?sW/eX4ba2n7Gzee3CsGh0qIsDIcknK97VUgyHnYwnCSVa+BJmyQwIV+/8Uub?=
 =?us-ascii?Q?fuWP/ZS8bz7QtCnEWAUgQ3yfoqBOHw2pD8YfeHX8bzCDikVSgzDPSoqEUdpk?=
 =?us-ascii?Q?I7siCI4YQbhREEkUoI9XoYLZjcjpn9P6lQrrV5TC1ruV4Rrh+qAEAbP1VUfK?=
 =?us-ascii?Q?0g85kxp48GTYSiAtLcBUbayqXHAz65qThfSSAR228KjYYM0QSmi7E9/hlC3i?=
 =?us-ascii?Q?DDJ6zPUDA49h3Wi34wctLRNh/AfcbZQJicOQ5z9kPDBsYsLe1gn18bsDuquw?=
 =?us-ascii?Q?ls6o2bpb9R81uCyV6IpomhvC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db12a647-260e-42e5-b933-08d903a2b3f8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 02:19:19.0711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjqAkStbE2nk9R3dbF7jR1WXVvleliZTfCjmqdTl0q7dL79rcUUtKiYknKk1ykbGq9w5NPO9q9MKYl5lOx9TEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3349
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: quoted-printable

I think they are two different projects.
https://www.ibm.com/products/db2-database
https://www.oracle.com/database/technologies/related/berkeleydb.html

You can also use the original json file to check.

e.g.
$ grep -l 'cpe:.*:oracle:oracle_berkeley_db:' ~/.cvedb/nvdcve-1.1-*.json
/home/qichen/.cvedb/nvdcve-1.1-2016.json
/home/qichen/.cvedb/nvdcve-1.1-2017.json
$ grep -l 'cpe:.*:ibm:db2:'=20
~/.cvedb/nvdcve-1.1-*.json/home/qichen/.cvedb/nvdcve-1.1-2005.json
/home/qichen/.cvedb/nvdcve-1.1-2010.json
/home/qichen/.cvedb/nvdcve-1.1-2012.json
/home/qichen/.cvedb/nvdcve-1.1-2013.json
/home/qichen/.cvedb/nvdcve-1.1-2014.json
/home/qichen/.cvedb/nvdcve-1.1-2015.json
/home/qichen/.cvedb/nvdcve-1.1-2016.json
/home/qichen/.cvedb/nvdcve-1.1-2017.json
/home/qichen/.cvedb/nvdcve-1.1-2018.json
/home/qichen/.cvedb/nvdcve-1.1-2019.json
/home/qichen/.cvedb/nvdcve-1.1-2020.json
/home/qichen/.cvedb/nvdcve-1.1-Modified.json

Best Regards,
Chen Qi

On 04/20/2021 09:55 AM, zhengrq.fnst@fujitsu.com wrote:
> Hi, Mikko, Chen
>
> Now, cve_check can't checkout any cve issues of db. I read new nvdcve_1.=
1.db and guess the name of CVE_ PRODUCT should be corrected.
> ps: I don't have the old nvdcve_1.1.db, so, I can't make sure that the o=
ld name of db is "oracle_berkeley_db".
>
> $ grep oracle_berkeley_db SELECT_FROM_PRODUCTS.log
> $
> $ grep "|db2|" SELECT_FROM_PRODUCTS.log
> CVE-2010-0462|ibm|db2|9.1|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp1|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp2|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp2a|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp3|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp3a|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp4|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp4a|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp5|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp6|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp6a|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp7|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp7a|=3D||
> CVE-2010-0462|ibm|db2|9.1_fp8|=3D||
> CVE-2010-0462|ibm|db2|9.5|=3D||
> CVE-2010-0462|ibm|db2|9.5_fp1|=3D||
> CVE-2010-0462|ibm|db2|9.5_fp2|=3D||
> CVE-2010-0462|ibm|db2|9.5_fp2a|=3D||
> CVE-2010-0462|ibm|db2|9.5_fp3|=3D||
> CVE-2010-0462|ibm|db2|9.5_fp3a|=3D||
> CVE-2010-0462|ibm|db2|9.5_fp3b|=3D||
> ......
>
> Best regards
> Zheng
>
>
>> -----Original Message-----
>> From: Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de>
>> Sent: Monday, April 19, 2021 2:59 PM
>> To: Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5 <zhengrq.fnst@fujitsu.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
>>
>> On Mon, Apr 19, 2021 at 09:45:01PM +0800, zhengruoqin wrote:
>>> In the CVE database, now it use db2 instead of oracle_berkeley_db.
>>> So, in order to be handled correctly by CVE check, modify CVE_ PRODUCT=
.
>> Which CVEs, please add an example? In the past oracle_berkeley_db was u=
sed.
>> I wonder if both would need to be there, or if using the new value is s=
ufficient
>> from now on.
>>
>> -Mikko
>>
>>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
>>> ---
>>>   meta/recipes-support/db/db_5.3.28.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>>> b/meta/recipes-support/db/db_5.3.28.bb
>>> index 9cb57e6a53..05720053f4 100644
>>> --- a/meta/recipes-support/db/db_5.3.28.bb
>>> +++ b/meta/recipes-support/db/db_5.3.28.bb
>>> @@ -15,7 +15,7 @@ HOMEPAGE =3D
>>> "https://www.oracle.com/database/technologies/related/berkeleydb.html
>>>   LICENSE =3D "Sleepycat"
>>>   RCONFLICTS_${PN} =3D "db3"
>>>
>>> -CVE_PRODUCT =3D "oracle_berkeley_db"
>>> +CVE_PRODUCT =3D "db2"
>>>   CVE_VERSION =3D "11.2.${PV}"
>>>
>>>   PR =3D "r1"
>>> --
>>> 2.25.1
>>>
>>>=20
>>>

