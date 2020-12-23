Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.60])
 by mx.groups.io with SMTP id smtpd.web09.8694.1608729208350973284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 05:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gBLueTMp;
 spf=pass (domain: windriver.com, ip: 40.107.94.60, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyxadihI1RekIk6Q6HYLgkg5DR88gyj48cpYy2pVZYbCTbCnQgP1u8MnPAm5HafchUhyk6FP2kz+Bs81+iPyUkt5PM7C4QJrlV7vcQSsaskiIGHD+at7BGjg494klhVHKL46pkCS50zWMRj8gJU32dwMwPJ7Xx0719C5OC87yc/T6pe5jp+GfosaMmwFbA4qwvoPtoQQcsF8MCORR5YOjB5rvHgKNrdlzk56667M3QDGcta47CIFqpYAo1B61AEZqBEwMtXnFTk7Q8Fx7zYRWXcOyASP7acv3nP2NwYH5EirrRXbw4619IVtpR7chTQzCPwK9Son7CpfoVoX2M2hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a48vMLafzdd7cGSHQTOptPavwHI54Pw9PhnZgZGeRf0=;
 b=Fy5TpB4I+U/53GbGsLOHux5FTGZZUZWi5n/c4exrFhvy5pQud9pOJvHCpAtOACIEWuiEInADXyxRPpDvr9bRxrG5TWi8wq+VrVQnnF8dHKb24i1OGs4CaLvA0jzGoF/cjEsviXfH3UONkqtEQ8bVN2s5mJK1FlNM3rDfBU+Dq8O4nKxsPgwNQXri187GIKp8PUd0TJwHObkUSB/jspn1it+auqFIQYOGXqShsdvt+/hJu6KZP7o3elfVuIo2rcYZ8POq596nEm5rSFGwQDN1h8SI1C1jLoycgCIL0PI6IneF/srOF9O2nWSZ9qo1b5tFVDdgLOUoMtP9eIMuYEQVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a48vMLafzdd7cGSHQTOptPavwHI54Pw9PhnZgZGeRf0=;
 b=gBLueTMpXeiwoqPht5dQFXXMV/8KcSAOEDsJlnSxcqUflVD0UP9OslvKMfZyYXnixpscENZUbrhFFrsobEQZeLzedX/lBy94uqpz2xVVok/fgX62vSxGfhAw+5vzU2g59OkN3Kmw9IFarjLDhzb9x9bf1H1g1fAX5d2Hga6l2KU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 13:13:27 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%5]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 13:13:27 +0000
Subject: Re: [OE-core] [PATCH] kernel-devicetree: Introduce KERNEL_DEVICETREE_FLAGS to pass dtc flags
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201222104124.39262-1-ovidiu.panait@windriver.com>
 <CADkTA4PYk-jM7jqEBj008zGysEcf6UUVr3RfZuzkANp38-FkZQ@mail.gmail.com>
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
Message-ID: <cea4639b-2439-03d0-949c-a6557189f5b3@windriver.com>
Date: Wed, 23 Dec 2020 15:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4PYk-jM7jqEBj008zGysEcf6UUVr3RfZuzkANp38-FkZQ@mail.gmail.com>
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR0501CA0007.eurprd05.prod.outlook.com
 (2603:10a6:800:92::17) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.125.152] (46.97.150.20) by VI1PR0501CA0007.eurprd05.prod.outlook.com (2603:10a6:800:92::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 13:13:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7362ca27-c035-4003-61ab-08d8a7448919
X-MS-TrafficTypeDiagnostic: MN2PR11MB4567:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4567AC0E03C10D6739EC8B8AFEDE0@MN2PR11MB4567.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VlbhahIT5FwSSUWAqRdyxITBUOdaM3BsduatauQs12BIFiQF0oKkOSApkWgTIjNA/zE6n53qcAApBfehupXFzm0MeWJM9Ux9kcxsqiijLwIGrJJWHQskbk2Tu6lGFgsmxYIfU+Xz0yhBtzJ93Bc37EckqTRbjmXy0jtWPDg2BKeNPd5vk2g2r7wPG4+jHfjVhaDtJuyIS2tDMpzaf9VAgZV6K+ie1vW6gLioJN5rTy7hVoz55d1xHhP0yRprDYIcUwIArCJ1/0/K0OwI+rizC8s+eXevzjXwEtewlvwHnDyhQtrJLx1VaI6Ht1ksKYyE5xiJDEMSSz1j9UHFQkuIJvQFaNbg1s9L+SbRcsJQyHXPcuP3bLSxju+xUjtCRRHL+p8ChziMxHHg3dd5fcw9MJVfPQuhvmNEgju0zB37/QZii2+CNEHLeSh3uYg/ehebOBRG5s7JhwzeV8HJC1+EQz3G/S/CmLQxEmHJL2VzKrs6F9FU1lZE2/t12J1oGyxsXdMImEcwTwQXMozPD9uV6XISQ1xY2sD59la7gXcAt1eRZ67F6qxzPwfHvqWoJLjEXEr54ilzv4pTRlBPo+Veug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(26005)(31696002)(8676002)(36756003)(44832011)(2616005)(4326008)(6666004)(956004)(16576012)(316002)(2906002)(66476007)(186003)(16526019)(478600001)(52116002)(66946007)(5660300002)(966005)(86362001)(6486002)(83380400001)(53546011)(6706004)(6916009)(31686004)(8936002)(66556008)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TnJkMTV0TXdoLzMwcjlpd2pJVVFVQWM2cGdxZ1JmRlQyOWR1bWQ4QldqREhE?=
 =?utf-8?B?T3hRZXZNNDJEalZLb0VtRnhROXBRRW5lUVp5YzJXWk85Nlk0U2pxR0Y1RUMr?=
 =?utf-8?B?ZTdwWU9jMHc3RkdkN0hXRGxSWklGTjliSXJ3byt2Qk1adkgyTWxVdElpRm5m?=
 =?utf-8?B?ZnkvNTcrYmhoTE1sWmEvVXdNZzlQWitPRnkvTWdudmp6eUx0eitsWFcvNlh6?=
 =?utf-8?B?b3hjSFU2YThXOU9ENHRSUExQaWluSkVXZUVsdVVITTAvdVphMjJ4U1lIZXc4?=
 =?utf-8?B?VDFBRUN3ajg4VFBYMkx4UGVRNDU3U3dSZDJGZ2dMYW92OWg4elhxUXZEc2JN?=
 =?utf-8?B?QTJRNjN3alZDcTRCMmNNU1dRTHd0NDJhZFovNDUxY25YUXZUc0FaM0gzTEo5?=
 =?utf-8?B?MnI4dGo4U29qbXNGdDdURDZjeUpjbmJqMEhyZk90ZHRJRHdDamE5dmxjY3dt?=
 =?utf-8?B?TmdjNkgyL3VNN3RIbnUwZWozK2J2a3lHWVlYTDZuQlVzdzdic1krSi9jdTc0?=
 =?utf-8?B?bGoyVXBqclIvRkd2U0dMYk9kelRnZVdPMnF2dzRlZVVGTFZpWHJMem03TkdX?=
 =?utf-8?B?WmpIRTlscEx3NXpxNmpUWGtpZnpLbHR4UVNwZXl5UW05MzI1RnpWeU1na2ov?=
 =?utf-8?B?UERoWUZXMmxTSWdaTHl2NnNVMTMva0RpeFZjZFYrZU0zbERyOVhHZXUzNHRW?=
 =?utf-8?B?WEVVV2Zsa3RER3h2Ykdmc0k5NnhUbUJ2cmVoZ1ZVUThpYjhZNVBDaUdGZmp1?=
 =?utf-8?B?YlBJSCs2WkVZUXhMZjVCNGh4MUNHL1l1K2ZXWDZBdFR3WUpVNkc5c04yQ1Za?=
 =?utf-8?B?MElPbjNUQUY5WE1UOGtJcC9RaldaOG45R1RFYkI3aUlKN1lzUGRZbDBhRExp?=
 =?utf-8?B?RTg1N3VqUFVmR3RpRjQwK2U2YjBKamw4Nzg2SDFHakFhcDRxYzhTYnVFaGxL?=
 =?utf-8?B?WFVSa2JJNktTRUtlcDRyYWpkSDZVZVNLNlhLaFBheUlyY1phc1YxTEg3alhj?=
 =?utf-8?B?Z2tmcHNZekM0NFR1RTMyWnEzTHkvaVgzd2lGV2E4L2lUTXBucytNYzFYMStR?=
 =?utf-8?B?TnVmcEMreFpBSmgvUk8zQUtaWnd4SmlqVjhEOVpncTlaZkViSkIrWlNTTTM3?=
 =?utf-8?B?Zk15cXp0VHhKdTZDZEI2bjREcklDdWExTTUzclMzdjBKMnh5Zlo0TCtiL2JQ?=
 =?utf-8?B?MjR6eUd4ejNueHZtSWVzYURjbGlDbmNKek5SazY2MFdmMGR4UjBWVVZKZXcz?=
 =?utf-8?B?WGY1ZEV3akdKWTkzMlJWR05hc1FvNFJ2TlN0UjIxdnNLUExLamtHL3laUEg1?=
 =?utf-8?Q?YUmd8+tQDvQPA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 13:13:27.1632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7362ca27-c035-4003-61ab-08d8a7448919
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0Ls9PnH5F4vdzIT0Yj6PP9xgAfPs5Xg3tgM3l4Hfsd9Zf5xXdfwgZGbcgvZ3dqQnGl0nwqrLaoWBM8ZQCM8utYqT0db7q/CZK9q3pmeD0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Bruce,

On 22.12.2020 15:49, Bruce Ashfield wrote:
> On Tue, Dec 22, 2020 at 5:43 AM Ovidiu Panait
> <ovidiu.panait@windriver.com> wrote:
>> Currently DTC_FLAGS kernel makefile parameter can be specified directly on the
>> command line by adding it to KERNEL_EXTRA_ARGS. However, this prevents
>> scripts/Makefile.lib logic from appending flags that silence dtc warnings (all
>> assignments done from within a makefile, to a variable specified on the command
>> line, are ignored).
>>
>> Because of this, the do_compile log is cluttered with dtc warnings that should
>> only be printed when compiling with W="123":
>> ...
>> /soc: node has a reg or ranges property, but no unit name
>> /soc/gpu: missing or empty reg/ranges property
>> /soc/firmware/gpio: missing or empty reg/ranges property
>> ...
>>
>> To fix this, introduce the dedicated KERNEL_DEVICETREE_FLAGS variable to hold
>> dtc flags and export DTC_FLAGS in the environment before generating the dtbs
>> (make allows "+=" operations on variables that come from the environment, so
>> the warnings are silenced properly).
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>   meta/classes/kernel-devicetree.bbclass | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
>> index 81dda8003f..2066096a9a 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -9,6 +9,9 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
>>   # Generate kernel+devicetree bundle
>>   KERNEL_DEVICETREE_BUNDLE ?= "0"
>>
>> +# dtc flags passed via DTC_FLAGS env variable
>> +KERNEL_DEVICETREE_FLAGS ?= ""
> We should also be updating the docs with the new variable.  I don't
> know how well the other parts of this are documented, but the state of
> the current docs shouldn't prevent this from being documented.
>
>> +
>>   normalize_dtb () {
>>          dtb="$1"
>>          if echo $dtb | grep -q '/dts/'; then
>> @@ -50,6 +53,10 @@ do_configure_append() {
>>   }
>>
>>   do_compile_append() {
>> +       if [ ! -z "${KERNEL_DEVICETREE_FLAGS}" ]; then
> Does -n work here ? Having a positive test "does this exist ?", is
> almost always easier to read / maintain than "does this not exist ?".
> But someone can correct me, if there's a compatibility concern with -n
> (and if so, I have a lot of scripts to change ;))
>
> Bruce

I sent v2 for this. Also, the documentation patch:

https://lists.yoctoproject.org/g/docs/message/803

>> +               export DTC_FLAGS="${KERNEL_DEVICETREE_FLAGS}"
>> +       fi
>> +
>>          for dtbf in ${KERNEL_DEVICETREE}; do
>>                  dtb=`normalize_dtb "$dtbf"`
>>                  oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> --
>> 2.17.1
>>
>>
>> 
>>
>
