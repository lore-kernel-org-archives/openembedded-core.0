Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.78])
 by mx.groups.io with SMTP id smtpd.web10.895.1615429859730877743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 18:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R+Ai7HUd;
 spf=pass (domain: windriver.com, ip: 40.107.243.78, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2VAt9m69KPs7RKal37W6LUSn0dfSwEV+PV2JO3bNbp3DbgjGzV5gOC+g12J0O/Vp81XbxRc2mFwV5TEPPX90gQ7/CIPRKfckeI0Js6GPzW2rvzPWzZNY4zA8rABVkN6P9GMQaBUAN94ZiQfZi/j2GP23a7dEYPb7xdrBVeINrsPnj0xuxlNDn9XYbpI+9wkxFNN7qu0yuvI5MiKkDNmAtYXYLC4ltlIPo2UJtj44GVtuQ5AMD9qntBgpdKc7ix3YByeM6t543xUrvNOJWZyDEtHZLdtfNcsAO42LvrZ8ue/FmnklVqtAgE6MvSJRR3C52SpleFWw2wToKffymU4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7yGx4cW9Tgi6wGWeZjt4SWse4d7hcVzXdDYRogth50=;
 b=Ra/Pk4hjxntbNu1iyidZslM4kccCtgRBwSJFZgW6NHV5SgX3f8ZMX4lcYSY7nyFtBGcW7bgrFrJJswuuOisUcSY/dsJG9ElNg+IPtiASRnTuhrj2dvHPEGLBLAHJRSM1k9kHvrrmikUxvi46aYIhkQ5RCzuKxRYFlvzu4k7Jl+4yhscNxkrEpo7JeNok8y+maUqFq9DDb8jEjjXKZrE/Nz6ZvSM2pIcXX8OPso6jWfqS/vWKfl1Km2qjXK9hOh2+S5xbMCMJleHNMJnMivc4hpa/PTafUheIy8a1CJsPvZMtdwjJjW264r01/hfsD2IzR7o+D8QBW9P7XrMWFpHZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7yGx4cW9Tgi6wGWeZjt4SWse4d7hcVzXdDYRogth50=;
 b=R+Ai7HUd0wKofpfLqL/aSX3r1YmOgGdSIOaFYWMg7sCxWiwawm12PxJ6C0zG4wRRyAO7YRPLPye1bFD9uXUV7S+TuMosbQcWymjJNQcuOcSUb8P/oVi3JMsiPOVp1ppI+botyCC4KimKAfUSboq1aAnaaz6G02sEpdJIH8VG4zw=
Authentication-Results: seebs.net; dkim=none (message not signed)
 header.d=none;seebs.net; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4289.namprd11.prod.outlook.com (2603:10b6:a03:1ce::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 02:30:57 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.038; Thu, 11 Mar 2021
 02:30:57 +0000
Subject: Re: [OE-core][PATCH] Revert "uninative: Don't use single sstate for pseudo-native"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, seebs@seebs.net
References: <20210310090638.14640-1-Qi.Chen@windriver.com>
 <a2679c8472231f12d2b22d5f4db5a99eb10bfe75.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <15c72d47-ce1b-8321-8e28-7bb23cf8c305@windriver.com>
Date: Thu, 11 Mar 2021 10:41:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <a2679c8472231f12d2b22d5f4db5a99eb10bfe75.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:202::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3955.9 via Frontend Transport; Thu, 11 Mar 2021 02:30:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 402e9764-b320-4977-39ad-08d8e435b3bb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4289:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB428987471672F11F35B1A5F0ED909@BY5PR11MB4289.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p06mfJ0KTGQAK0nMi/enPdoHgDFngdG6k6EsIUddtVfgpf7utsRS3kLwqI5sncsijqAZ+TFyUTpCF0/q27qOjXgTUETC/sjLi1WhghxdrcJKQZGe7pId6MELOUOWxuk0EVpBvWBcE1cL6Z5LDWjWDOp/h9tm7uEqMtufZrjjHGbdNipYbDnFaoJIiEUh3fySLN6n/ta0Z5PSX8t53kKRHKmF4my01akYyfGxehdbzDaw2AlpdEtvUUpJ4UXuPvSk3gz6LjKohrZHKoxTDUHpUFjK9bTsiLcIMsFwCqCX4h2n6JJDtqMI2aKB7lkeWufp9nrdNyKM2eswMU1vTgi+Ec8VeSEWVs6FnOhmJUNKsdv8rrs2h7rPNL7gwika2GY6gNjsg7rAM0LLA/SB7vNCUrNI/YlOwqRJK8ea6v/A3R8X5zPn8ay0zsteyhiUB8wpTJwsKTrly8hoPUhx4BPVVOZzw1tUfW6EeH8cx+QgeKmx8S5K/kjFbB3BGb9r/NjDyS5Ypg8i1LMlhUJIPD5VR/lwjc41nkm2VtVZS3MlZ1TLkN+U4Wn1zWU77AXZ0WhSW7W2TnVHkYJWk0yMYEEvDjhx3h2r7PzIwcmkC3hqNoTMG/YsALUJUtB1/6lKN3gG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(16576012)(8936002)(36756003)(6486002)(956004)(2906002)(86362001)(66556008)(66476007)(316002)(16526019)(66946007)(8676002)(6666004)(31696002)(6706004)(5660300002)(83380400001)(26005)(2616005)(31686004)(53546011)(478600001)(52116002)(186003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QWh5OEJyZFN4RFluUmV0WTFKQTlhd2E2Uk5ZeVk3cnE1Vi84N2ZUWTJoSGZ2?=
 =?utf-8?B?OVNaQm1BYXBTcHl1cUUrcURlR0cyZVlCUDNpcXgxYzUwS1RTME9MSDRLT243?=
 =?utf-8?B?UTNnVVhPUkluaysxczhXMU9SNlpjYVcvd3dVek5UOW80WlpxOFRrLzRNVC9T?=
 =?utf-8?B?aGFIS2tKbXo4VTQwRjZqRzF6NVExTXIzZGxKc0N0ZzRiQmxOWVR6YmMxSW5v?=
 =?utf-8?B?emUwblRLTGJjSmtLR0pBTDVyZTFDdlZIbmVJcmlzSkhhU3ZWd0dkVVdrUy9K?=
 =?utf-8?B?ODM3a3ZLanppbHBjU05sTXZ3cTdtV2ZYaFJ1cGgyNUI2MzhkNDF0L0E1YXA2?=
 =?utf-8?B?VW00ZGFtUnZvcXZRT1BVSDU5REpqMXF2RWVYdnFtRm1nR2ltVHEyS0l4MnNH?=
 =?utf-8?B?L0lMRm0rQ0VPRE1hZE9aekRxbkUrWVJLY0VnajNFY0Y1Njdwb1RjWUpqQUp5?=
 =?utf-8?B?S29yQzNtcjRtckJsTzR3OWJBeDJRNjAxKzFSazBoSXUwUFpnNVVUOUM0WjZN?=
 =?utf-8?B?UStxNHoxblRicGxmWmFlMDVKajJ1WVhBSkdSdDZlOGR2OG02SkRoTzJOeU1Q?=
 =?utf-8?B?STlLRmRNOGRpZm56UmFzSm1FeXJJWngxNTVuOURUQ1ltaWE5Sy9xL0UvSlFH?=
 =?utf-8?B?RGsrcVFwbzRTUFdWRThRNFl5TkFoRnZmRmI1UHZVR0hJY0h3S1RScTU0SFFv?=
 =?utf-8?B?T2tDcmRYSW1ZcWd5K04xZ1J0SkdidUwxVWV1Q1IzdmNyRVdQWldjZGtuMVQx?=
 =?utf-8?B?QTlscG5JeXUvRjBaRytNYTBEOE80SmxkZFRkckxiaVNIU29xTWZSTjhzak9z?=
 =?utf-8?B?bDhLVmhMWTIrT2pCY3Y4K3k4MXJ6U3duRDVrSlpoRTI1WXRrMTFMMlZBcDh2?=
 =?utf-8?B?cjRGaUhyK2h0WlAwck9aZHB3STh0VTl4RE5sV2FON3NrR21pNUJmczJVQzlB?=
 =?utf-8?B?M1UzWm9Dc0VDSjNlaHRwRjFhOURiYzdSY2FsT0hGVHRIUWFIWDlULzdDUVVI?=
 =?utf-8?B?V2o2MkJWc0ZWYlhmMU5Ed2RNM3kvd0I1OGJkeEFTSXhORDJiYVZiRWFyUlJF?=
 =?utf-8?B?S01NM0p6MnRuRkpVVThxWVVoK0tQcWk0bytham1iRThLWmlxODkzUElPT3pK?=
 =?utf-8?B?THJqZ1I1RUI5YmR3WEdEWGhTTjA3bis0MlRvcXhUZGdCSGgyNXFNWHBEWFBP?=
 =?utf-8?B?by9wYlJscmNMV3Q2d3JQNTA3Ni9RaHBkYWs3UC9Bb08yZlpwZUJ5bUlSOGVv?=
 =?utf-8?B?bXE5Y1RVR1BmK0Z2QVJ5RjZqWERud0hmYlVzTXNVL1JzN1VGZ1JZb1pXdlgx?=
 =?utf-8?B?Tm5uVS9Mb3MwMTA3RzY2Nklqdmk0M3ZiWkNCZE9NeUMwNXI4aFFXc0pOSi9y?=
 =?utf-8?B?dVJvOWkvWkJUWVBQUGMyZEhnUjErQXJGNHRrWVNSNHZkY0RZdzNhdEdMTWlv?=
 =?utf-8?B?QWdaZkRweUFxckNEZUdKNGwzWHVvcG5Pc2RXbU5yTmtZT1BtQU10YVNmSm1Y?=
 =?utf-8?B?OGtkSHFlb2tkNDNlNStCT2NMWjdOelRWdXFNREdCOXFTYU5RanlFQjludmFZ?=
 =?utf-8?B?blRqZlY2aG5Mam1CR2Vxcm03L2Y5a1VCS0pySUE4TnNacjhMbHJXM0doNFRj?=
 =?utf-8?B?eDlMWW9CaSt0Z0I1OFlmTkdFSlhpakZjclptalBZRGNubDRWUjU5anArZlhz?=
 =?utf-8?B?SkFOWExtc0RQMHRhMmdTTVpTVStpQnFBbnliRm5hWmxFcEFkbkhCMUxZN0hr?=
 =?utf-8?Q?p6T1wdee8DgWRKkNm5pYimbz7sG2Yhy1mVqVIdD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402e9764-b320-4977-39ad-08d8e435b3bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 02:30:57.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geldjQ2r21ucHav5rv5YdDfeQMEHMkUFrCzBylazqNKjKs40pczVSuHcBxuTEigBGnK0f/PvWlMuwsuP1NVDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4289
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2021 06:20 PM, Richard Purdie wrote:
> On Wed, 2021-03-10 at 17:06 +0800, Chen Qi wrote:
>> This reverts commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292.
>>
>> The above commit causes a regression, making eSDK not able to be
>> installed on a different host. For example, build eSDK on ubuntu18
>> and install the eSDK on ubunt20, then we'll get an error at installation
>> time. This is because the pseudo-native's sstate cache could not be shared
>> among different distros.
>>
>> In addition, according to the pseudo recipe, pseudo-native always has attr
>> support compiled in. And if people change the PSEUDO_EXTRA_OPTS, the signature
>> should also change.
> The issue is the code in ports/linux/subports, I had evidence that those
> values differ depending upon which OS pseudo-native was built upon.

Hi Peter,

Do you have some idea how to fix this problem?
Are the checks in ports/linux/subports the only place that could lead to 
different build results on different hosts?

Best Regards,
Chen Qi

>
> We'd need to be able to show that those values don't differ in order
> to be able to revert this change.
>
> Ensuring struct statx x is available for example was a harder problem.
> I didn't really want to hardcode chunks of libc into pseudo.
>
> Cheers,
>
> Richard
>
>

