Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.57])
 by mx.groups.io with SMTP id smtpd.web11.31003.1615170013404257430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 18:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ubrc839A;
 spf=pass (domain: windriver.com, ip: 40.107.93.57, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvN4z6G2e2cCcBhs04GYTV2yO8X+cBxWoD01VylQvcWkqNzRSsHdcxKi/1pfTSSt3IAhBbN7x9Grma5dKQ3StyQDPoRb909GMkv1JBX7If65cO+XygisFRwhMdbUg7LBs0kC9EIoljIQwwRLi1kSC7j+9Hx3NHSPboKOFZn+nE1Sx0XI9tRBjc38y29SoNMvBsnA5n8Kyl20H9AA956x6U2Q/N5zGDspqFwkkug3qyov967MgGqAqjOmLsusU3nuWohDIKqInjFJjlcPrs1VKwu+XTLU8iZkXeaXMXB1ubWXFXONpNygNzl92685zggXAX5/3lSdjTmfJG1cyw8Q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxHVEAu1NTGHF1H/P5jGLTujZFP8Zcer8NeUxR1T3Ek=;
 b=gBxEgY13PQ6Yi687C+7U/2+QrOVCUiNbdsqCFX4r7JhAtxZ5vEINH0gKzji64NaMYjvhuT6fl+8WeFFmQL9fslVsTcv+j8s+W4oljit1K8PglkUwu2LNfLCm6fjFqMD62AkiqyLVg5Jo6J//77L9dTNbOmSDbUcy+RTMfBcaplfrzlC3qmXl5mKexJD6k7HoqzMnB7OcBYCzzha7Uei32K8pMkt8AdZrr6u84HxcSuC/CnFzREmGcrH2kc6hY/AM4RbABOTQqsoUOXXbYq/yPwm7QK5RLcT90NsDOULrKnhau9aZuxgptQ7a6AjlboUVque1K0FVKkhMW0HD3/4H2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxHVEAu1NTGHF1H/P5jGLTujZFP8Zcer8NeUxR1T3Ek=;
 b=Ubrc839A0x/Bzv/l1oT7zYxDXkIxkLkItOiREcKNlYxcFXodUTAa2WNdE+dOYMSW8tDmr64oi1O1kVyfjaTqqe9EO+sNK+YflVpfKnM72QnNrvO2JDu0ZspCECUR36c/JfELPVjWaYtlVDsHwzCs/StYSGtot78RflaO6SPWOT0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 02:20:11 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 02:20:11 +0000
Subject: Re: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210305101040.822-1-Qi.Chen@windriver.com>
 <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <b92ce8d7-0faf-88c1-9e23-32d25365fdb0@windriver.com>
Date: Mon, 8 Mar 2021 10:30:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0187.apcprd02.prod.outlook.com
 (2603:1096:201:21::23) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0187.apcprd02.prod.outlook.com (2603:1096:201:21::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 02:20:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c7bef7-5d6f-4c11-063d-08d8e1d8b36d
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951EB459A580D016BF73584ED939@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X/lwBPu4Moufr5CBQMpewhZoaTA7JmWp8D3vuGv5ZQot0bsdPb+rY+k0od3GPHLaRG5Cgq3riwJnxQyKeQ1LGwQOFSGXQlbEk1I8homUEKMonNPJJwu2MM83fcRtHDHsDCq/scrWPhfTTq6fQrGVJyBqtx0aVGyvabOBRwXxDmVWVJSr+2cSvW3LEmvj59w/8PiNlrz+ivBCTZnS1O9SloJ9p/dgJmRO/4dCvrMQ7iSlpz1rIwAA7GweYN1uYYpqkExbTYI3f2IRtTBMgjfI2zh4jG7c0Tw8XCJGN1hpD1ojUPS45QbYZxCQx1jjj8VK4kzMDiHRcMsL/PHhExIvJbhhZS7M6Vf53sjTL7u4HXX9U+0J3jjh1pRj1egmS2Jukbjqr3Wm/97IBGgk1bZ8bEI78U5UBKcdcuXg3+ttsdy99kSnuNXRrfwkjqDdBdxH9XPkyTsiq7GfE/OtQmPzG5sGNx6OdMfud7/2vGpsHn85hwkLn4BHrijDZiN0mu//yfcFBdZFh80WIIdLo6H/z85lhGSPIa1fezrq72MshY+q1tfyj+xiHPpAFMkkbtvhnqLfNmOLhsaHRY6VfLTVC+CV1ovE5ZVEjIaiQfHOwYH6to96WYBAFDrDn9OcHUz5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39830400003)(396003)(66556008)(6706004)(53546011)(8676002)(66946007)(8936002)(66476007)(52116002)(33964004)(2906002)(5660300002)(2616005)(31696002)(31686004)(16526019)(26005)(86362001)(956004)(186003)(478600001)(6486002)(83380400001)(316002)(36756003)(16576012)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bHJFSVlPbmNpRUFhZTRLQVN5UHJrdFVhd0k1emQ3T1g2K2hJM2srWGlZRjBT?=
 =?utf-8?B?SFZsbHlpR3B3aHFvQktyZXlLTHE5MTNpajA3ZnR5WE9LbTZ2U3BPaDlnR2dr?=
 =?utf-8?B?WVZMZEVyV1d3ZzhmY1RUQUZvUE1CdXpFSDVIeGdTS0tJYjRlZVcyd0gxVFVV?=
 =?utf-8?B?UmpTeW5oM291Njg3SU1rT3lhbE51M3Q0OFdUUmNmRFRuOEhRa1ZaNVd6ZW92?=
 =?utf-8?B?UUxxZXVyUldvaUx6TndRZWFtSXp1Tk4yaUNieTlZNkFWSzVrRFdEbEFvcFND?=
 =?utf-8?B?RjNPM1p6akQ1a2J0blZtY3NSc2ZkOTlnZmZBTWduQ0J1YmRsOGl2aTZXVmJV?=
 =?utf-8?B?WTVpVDU5RTl4VGdOenVpUUJDd2FMZlBzRlovYUo0eTdnSUd4WkpIL29UWVRm?=
 =?utf-8?B?VVk0S0NCSXZ2U3VxOHpSSUtlSWxjdE9ROXlKS01HY01SYlpUSXVvNXY1ZWpo?=
 =?utf-8?B?WG02Uy9NUUlpOWQ1S1NScVZnMnVFN1hieGxrd0RHanlzT0tlbFY1djl1K21X?=
 =?utf-8?B?QzVQYWNmOG51T1NTcm1FZ0pSWTZPZ0ppbmJqTjExWmNHeUdKaDkyMVZnYks5?=
 =?utf-8?B?TGJWbmtmMDRqWUNoeUlZMXFUajgyNjBBbTZKNy8vZWVVQlVjVGZVQnpzK0Zz?=
 =?utf-8?B?NHphdkdPK2FPaWt5MGxOMDNIWkZZWVc1a0ZiMjRvK0o2ZFFsOTR4blI1VVdw?=
 =?utf-8?B?dXkrVHVxZ01OSCtSTHhEeG8ya2JnLzVEV1hoL2QzcGkvQmRvaFJybTdTYmVI?=
 =?utf-8?B?bmNTdmpvdkNRcWN5eU04eVV5OWZSbHlyb0ZaTzB0WUgxSGtwa01aRDZLUS91?=
 =?utf-8?B?cEhtZ0g2dkNrM1dNMzFNbGlKS0taWHIwK0hDcHcyZllBd3orNDRoWCs5Yndm?=
 =?utf-8?B?MkNYcmZrZFhuMTB1eHZNZi84Q1RZaGZrS3FpdFBaeE5IWWNCLzRLQVdrdGtB?=
 =?utf-8?B?VjJjRkxYS09MS2JyMDlySTZTcHBISTdWcEg0MUNzc1F5RHlhT0NDYWdzTUJU?=
 =?utf-8?B?Rk1Tc3p3am1TZllVTFJJU0RnNktwaitQZkNQRGUwWDY5V0xHSEozWGJkQ2lO?=
 =?utf-8?B?dkNTZnVFNll3bnBFZnZpMm84N1BJOW4zQm0rUWVmMVRmNURmNlFhMlRqOXZQ?=
 =?utf-8?B?R2ZGbFpPeHN6UFlGYTVseEdHQzFDeS9xK1BOS3dCWWN5NUZWWGlueDQ1T1RE?=
 =?utf-8?B?RmdZS3puek5oSHB4MFBYNmJkY01YemNiK1hGNTdHaUluNzc5NzVvbnhwSnQ2?=
 =?utf-8?B?dDd5MklON1NoZm9OanVhcWdPek5ZYXhSRTFxTi9iSWt1blRoWVhuYnQ5bGpq?=
 =?utf-8?B?em9OSHQ3MjRVRHdycTJuUHQ1Z3BLYWp4NUE2bWZEYXVreDg3STZsWkZ3SzlC?=
 =?utf-8?B?cXdQSjBucmd0NHRVczNYUzdBOVZzSmlxR2Q2MEFVdDZuNWdhRGh4TzNVYzgw?=
 =?utf-8?B?cjlpT3FxRlhjd2c5d25xa2srN2xwcmZFbGxHekpnWW1aNkJ4WEkySnBDMFF2?=
 =?utf-8?B?TnUxNmxvMTUwdXFVY0hFbVpVZnNOYUlOcEt3S1VVK2RTUzVzVmlDZ2VFZU5x?=
 =?utf-8?B?NzMvRzVERVRocVRHSmpHQkVtNjN6NUEzTzI4Umc0Y2N2dXFHL1VLZm1scUcz?=
 =?utf-8?B?Q2FBUDA0d3U4KzFJeTJZMDNadDRTMXNxOUh1SU1Fa0Y5bzJmNDlSMUlKOUNX?=
 =?utf-8?B?Z0dVbDRUR21wdWMyanhPZ00xZTVFM2hjOXE5Q2cxWjJ6N0FMNFBoTzJuK3dy?=
 =?utf-8?Q?+wlHN1jNU8/kaa0sIyQODZUzJG3mIc23PAurnYL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c7bef7-5d6f-4c11-063d-08d8e1d8b36d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 02:20:11.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phtBTtn2fsQTqjoIuXoD/PD+uzQAsJHPm7IcvlLSZZbFDKl9PD+d7hn14brwzY630HzYRjBzi7ufo1gVDMb0+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------7DFBAD8ACDB27075D486ED49"

--------------7DFBAD8ACDB27075D486ED49
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2021 07:29 AM, Richard Purdie wrote:
> On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
>> As we delete the .git/ directory, it's impossible to get METADATA_REVISION
>> inside eSDK. Because of this, we meet the following warning when installing eSDK.
>>
>>    WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
>>    but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64
>>
>> So we record METADATA_REVISION in eSDK generation time to fix this problem.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/populate_sdk_ext.bbclass | 3 +++
>>   1 file changed, 3 insertions(+)
> I have to wonder why base-files is depending on the metadata-revision? That
> implies that base-files and hence anything that depends upon it would rebuild
> each time you update to a new revision. Is that really what you want?
>
> Cheers,
>
> Richard
>
>
>
>
Hi Richard,

I tested it on pure yocto project. No extra layer or configuration.
I'm also wondering why base-files do_install depends on 
METADATA_REVISION. The strange thing is that things do not rebuild at 
eSDK installation time. There's only a warning about base-files 
do_install signature.

In fact, this is a problem I found when I was dealing with another 
problem with eSDK.
*Yocto's current eSDK cannot be successfully installed on a different 
distro.* For example, you build esdk on ubunt18 and install the esdk on 
ubuntu20, then you'll get an error of pseudo do_fetch task re-run 
unexpectedly.
I think it might be related to NATIVELSBSTRING, but I haven't found out why.
Manually setting NATIVELSBSTRING to some fixed string such as 'Linux' 
will solve the above problem.

I'm still checking the codes. If you have some idea/suggestion, please 
let me know.

Best Regards,
Chen Qi

--------------7DFBAD8ACDB27075D486ED49
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/06/2021 07:29 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org" type="cite">
      <pre wrap="">On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">As we delete the .git/ directory, it's impossible to get METADATA_REVISION
inside eSDK. Because of this, we meet the following warning when installing eSDK.

&nbsp;&nbsp;WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
&nbsp;&nbsp;but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64

So we record METADATA_REVISION in eSDK generation time to fix this problem.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
&nbsp;meta/classes/populate_sdk_ext.bbclass | 3 +++
&nbsp;1 file changed, 3 insertions(+)
</pre>
      </blockquote>
      <pre wrap="">
I have to wonder why base-files is depending on the metadata-revision? That
implies that base-files and hence anything that depends upon it would rebuild
each time you update to a new revision. Is that really what you want?

Cheers,

Richard




</pre>
    </blockquote>
    Hi Richard,<br>
    <br>
    I tested it on pure yocto project. No extra layer or configuration.<br>
    I'm also wondering why base-files do_install depends on
    METADATA_REVISION. The strange thing is that things do not rebuild
    at eSDK installation time. There's only a warning about base-files
    do_install signature.<br>
    <br>
    In fact, this is a problem I found when I was dealing with another
    problem with eSDK.<br>
    <b>Yocto's current eSDK cannot be successfully installed on a
      different distro.</b> For example, you build esdk on ubunt18 and
    install the esdk on ubuntu20, then you'll get an error of pseudo
    do_fetch task re-run unexpectedly.<br>
    I think it might be related to NATIVELSBSTRING, but I haven't found
    out why.<br>
    Manually setting NATIVELSBSTRING to some fixed string such as
    'Linux' will solve the above problem.<br>
    <br>
    I'm still checking the codes. If you have some idea/suggestion,
    please let me know.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------7DFBAD8ACDB27075D486ED49--
