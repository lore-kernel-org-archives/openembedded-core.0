Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.54])
 by mx.groups.io with SMTP id smtpd.web09.3705.1617856889204571130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 21:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JerN5zvw;
 spf=pass (domain: windriver.com, ip: 40.107.93.54, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYLZmuGcorlBnpGftyoSzUrsHYfVTPmjiy6TR/uVpmOFS2cJVzkhI4/4Wo/UvkHBxTlFPw7Uu/OyZuaLhBYLNtMa6vBbo5YVx4k62BnIMs3YKxOuBZC5WoDIcom2oGpPX+Cxnu8vkpJSNqUh0ocuv3zzgZTezPubr1GzGpVg60YxDyZ8BbAnIAqSF4xwObmIvom4sSOPRKAWcrMwvbz9esW8BD4R9i3rmFl75UlhialGutqYWskwQQTu8CTkB0M3RjU4fhrSibpjDFC7gLb4rp8M5degXW9xGIlHcMDfWyRRqYG5J3VW1CQx1HEmydE+WPk4VFNhQH62f4IW06I20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT8KmOOYVBCILzwN2PwuS7BER2/CRO8r8/3k/u67+K8=;
 b=nnVwkr82axMwweKYu0VQtSVJxsJlCk2ulUiHvMBEoXGL541ZcjLgkesDmtnu+aUgd+kSTokGaCb/YyK0GX8yrVgK/J1RZ8gD/TDTDOPaLg1nLiF//I9vP1RLEIs7e79HQlRpZ7GClJ8wGcPtaKQGW3WAy0CoZdhHhwYgsAkSXqPmexhrhurRHeV3PQtP52+8oyo3gri9GI7ynSQgBrnrtu8BmeBx/vbPJsA+Yg8U2Gj45FNPXHJrK5f8PTWr7R5s2Wo4O2WtLr6dWjWW9vFPY3koJEnqr7XsV7s0uKx8wyOjvB9BmBWsMJaSzYmxlIaLrhifcfL95+5XICekvDFjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT8KmOOYVBCILzwN2PwuS7BER2/CRO8r8/3k/u67+K8=;
 b=JerN5zvwI52eHqLOpmqZuZc4yGKKu7RAVDwXexKS7b/FiiKiwjWl40UbSEut1jUuPsNXzltHyMY1ZhmWIbWesr1D4Kalnc/UOdZwKQL8xxcIJf5XjheYQgUu1A1WeSNu7t5xtPbhTLj1uKGIzdVJa9Bmwd7WHdy31n4rD6VAqkg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 04:41:26 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8%3]) with mapi id 15.20.4020.016; Thu, 8 Apr 2021
 04:41:26 +0000
Subject: Re: [OE-core] [PATCH] libxshmfence: Build fixes for riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210407080824.37913-1-mingli.yu@windriver.com>
 <CAMKF1spZrThpGcEBPxto2NZ9PJ5Mzs7fwGPAagLbLsp0m6PgKQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <4555f6b4-5b0c-1efa-d6fb-c230f4c60e47@windriver.com>
Date: Thu, 8 Apr 2021 12:39:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1spZrThpGcEBPxto2NZ9PJ5Mzs7fwGPAagLbLsp0m6PgKQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend Transport; Thu, 8 Apr 2021 04:41:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f667fb3d-246f-40f0-3e2c-08d8fa489140
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21900DCDF39227B39EE219B7F1749@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	njsJkZBNfjOeE4JBgJkUUg0QqnaymF0vg//7bvoksgx3rhusuEPyTftwsfPNHdVlhrfXjQJyfptzKOeRT++PCaGWGaqUC7u9fJkGtMITlA6OvtDPk1Y/OgjFgu+jKEXkzoVrAc+jGaVyWivzppSejuLBkEto0HsoHYwyGLe85GW+SabmR1oYcT8u4NDwXNnLGbxo1q4DDhf+RtPQuMPUuj7Er4oUYxRw5GjVzn/MJrIuBeSIFp4kAch7J/YPaRLMs3r/+Sr9Mvsh+axylQx/Fx2BnOtgpjyog6jZWW2cfhUJ6zUndPb9nXkx/WAeG6AhLjNmD0TewSkgKvcbfZr68DkVPnWNJ8OSqYFfaBSAiX/YPvutLWg9u87wXzU0USNqMYaKNOoZPooBK5+FmWfLq6Xygwb517wLtMopWsXoUzYykIHkHzhBw+xJXi2K7rAR1go74t4xvbEquVi4Eou6bCQS0yS1htH5uePEs8NaliOJ4Qf7KxgZcRA5uoQdw/lJMZliLTOP30uy0zde+qxVcchDYoL849e/oXEEse3OKhdClLld5RBkKuLLBCMpZ4w4y7kTthdv9D26a60kja/lJvithcGfeK7Wg+qBQ9JiiBle9N59K04S/onMHaPCcNk8o3AsgXMgKj/VuEcX+hWDescn8sySJ/uO65x44ubV1fKoT7WlEJ5mpJkW3GY6I9OEAqupUlhAfpkabbWKDRiaJ9SgpnKiXHVeTpiPzunE1Pd++8Acl21byE3fTqC7QvKhBYATwSVFjtbW7UkIeoWdwgkqilDEVhFqsXsN0GvudTjH4BFWOjQBvgwFPk1jWv62w60f9Z51ZohKQGsQjareU52DlpujOV9iGGaRWvA2IQc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(366004)(346002)(52116002)(478600001)(16576012)(83380400001)(8936002)(36756003)(8676002)(38350700001)(6486002)(5660300002)(38100700001)(26005)(16526019)(4326008)(6706004)(66946007)(316002)(186003)(53546011)(86362001)(31686004)(31696002)(966005)(2616005)(956004)(6916009)(2906002)(66556008)(6666004)(66476007)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QXBmSHVxV2taUEMxaUdWdEQyemJPYXhjQ0M0aW1XYmVUeWNDT00xTGxGS3B0?=
 =?utf-8?B?MkNEWUkvUkM3UjQraEhYNmt4TXJZdzVTejJvclROeXBHakQ5RGM5NzBWMHRF?=
 =?utf-8?B?SWx2Y3gzWjJYWU1iKytLSnF5MFB3VEZiTHNNcWJFMjF1QzEvbGVHekhGWkVz?=
 =?utf-8?B?N3UvSDdtV0daQXhnbzJ3Q2NwT2o1Vjk1MDZGMFNnS3g3ZkhsMnNremhqaFMz?=
 =?utf-8?B?cmNqcWo1WUxiaEF2Ukt6L2VCOUJMcDhWVFVYV2lwZGM1ZWtpTUFlVE03aEVE?=
 =?utf-8?B?Z01HYnEzOTZHWEJQVlJQOUFPMlNGd0F4NndneFVkdVErbWdNUXVDWnBuMlhW?=
 =?utf-8?B?ejVXckVjL2pmVGFHTUMxaVpIVXNvRnMxd0xBaEVIUHR4aXNvVzlpQnVYbVhI?=
 =?utf-8?B?Z2ZlQ2ZjWGZTb1BDMUJSaTR3NVV1cE0xNUtra3pMQnBtYlVQbjROVkhxSDhK?=
 =?utf-8?B?V1o1RFg5b3FVRjZjbUNJNW11NkEvOFFmSVAzS3Z2VThEcTAzYWc0VHMvdlJS?=
 =?utf-8?B?ZDlIZ0JESGVXWXdOV2ttdkpMdmRRTFNtTy9CTHgvUGhSYUx3cG9zQmVHSjBx?=
 =?utf-8?B?L0U0VmM0akJ0V2pvU1Z3VGlLTXM5K25oSllMVi80Z21tK0JCSlhmOTF6MXVY?=
 =?utf-8?B?b25xZWVKdlMxSUJPLzRaYkMyaUo4cHVXNnRqa1EyeGpGcnBJM3hOQUwrNG9P?=
 =?utf-8?B?UnFjQTMvZGhzVmNnYXpsSWY3cWlzOWtDSXBjT2kyY1lBb2R6bUw5eFFxclJq?=
 =?utf-8?B?bWNtT0QyaW5Pa1JFUFlNSmFNbzNNTWt1QWhZVlgyYzdhUWc4OEpMSklIZWNQ?=
 =?utf-8?B?eVZzWU03RllkNitGbGR6Mmp5c0cwcWxlYmplT05qMGQ4THdsVGZLNzRyT2Q1?=
 =?utf-8?B?WUlTMUkvQWh5aVNlOWlXUkRTNkV5RjIzTm5kOUpoWXhmUWtrdlZHWm5BM3RB?=
 =?utf-8?B?RThJRU54YmV1dFlPOE9jZG42cWNVOVRmd3pQQmdyeHdsYlZ5aVRFR3Z3MzF6?=
 =?utf-8?B?S3pFVDQwaFlJL1Z4REZmc1FaNXJCblZKQml1dlBxQzQ5MytGNEwvbW9PRk5E?=
 =?utf-8?B?K3JhOWxrcnNyNHhpNGpWcEJZOHNYMXZNVDNhT0dISVpWQk1BQllIVTY5TWdY?=
 =?utf-8?B?ZmxIRUp3MnROMWo3c3hhMHRHM24vOEk1bldhNHBjZ3Nxd0lyVmpMMDR2cm83?=
 =?utf-8?B?OGtDaEhqU0N1czZ5VmpqQTRaL3pxc0VZQmJzY29WV3o3c0s3dDcxUzBRK1I4?=
 =?utf-8?B?OUVFZ3pKVktvZGVra2J3aHo1UUlrbzVmdkY2U2JRTmxFc25oTDdBR2pic3dj?=
 =?utf-8?B?ZXNnZk5EdnRWWHVvZDZWVTNia2RodEdFNmY2NkJZelE4bU1vWDNRS2RhaVdD?=
 =?utf-8?B?bEVLUnM1ZFJ2d1IvcitjckpMVm0xUWM2MmszRE1HeHlkZURNa0NiWVhpN3J4?=
 =?utf-8?B?N3NteTAzaUd1bHNDT2FhYnpsZGdCalZiMHR1MEJrNWhKV2Rra1pMSnhLTnhH?=
 =?utf-8?B?U20xYjNNNW9vU0twSWFEQ1lHb3llbEUxVGFqdVFPM2dwakI1Snd6TUJ4T3hS?=
 =?utf-8?B?TXFmWnUwbTFGdm1Bb3U2TEkyNlJhYzB2RW13bWUyQ3d3dms4QVc1a0poV2tp?=
 =?utf-8?B?R3ZoT0ZRRVlpNG9xaWlyaDdMZDNOZUVkbVpnd0MvaUYxSzQxT2ZJMUNIa3pi?=
 =?utf-8?B?TzVRbDZZWisxNUcvMzZoWlM3ODBUK21kYXM0VG9Ec1ZjVFlhd0Jjc2w1UTBS?=
 =?utf-8?Q?JJ8t2aJ45AZPTao0edYhfSNEcqZb2AUoZC6VAiU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f667fb3d-246f-40f0-3e2c-08d8fa489140
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 04:41:25.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kvtzi2rLvkT3vC3/VPdczIPujw/rEfrsH0nDRq1svnQUtjr4aNoG/L013Klc/ODo4TctNwqyb5bczwaece5Y7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/8/21 1:15 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, Apr 7, 2021 at 1:08 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> NR_futex is not defined by newer architectures e.g. riscv32 as
>> they only have 64bit variant of time_t. Glibc defines SYS_futex
>> interface based on __NR_futex, since this is used in applications,
>> such applications start to fail to build for these newer architectures.
>>
>> Define a fallback to alias __NR_futex to __NR_futex_time64 to make
>> SYS_futex keep working.
>>
>> Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...h-Define-SYS_futex-if-it-does-not-ex.patch | 39 +++++++++++++++++++
>>   .../xorg-lib/libxshmfence_1.3.bb              |  4 +-
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
>> new file mode 100644
>> index 0000000000..3e87794d20
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
>> @@ -0,0 +1,39 @@
>> +From 5827f6389a227157958d14a687fb29223cb3a03a Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Wed, 7 Apr 2021 07:48:42 +0000
>> +Subject: [PATCH] xshmfence_futex.h: Define SYS_futex if it does not exist
>> +
>> +_NR_futex is not defines by newer architectures e.g. riscv32 as
>> +they only have 64bit variant of time_t. Glibc defines SYS_futex
>> +interface based on __NR_futex, since this is used in applications,
>> +such applications start to fail to build for these newer architectures.
>> +This patch defines a fallback to alias __NR_futex to __NR_futex_time64
>> +to make SYS_futex keep working.
>> +
>> +Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + src/xshmfence_futex.h | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
>> +index 673ac0e..a71efa5 100644
>> +--- a/src/xshmfence_futex.h
>> ++++ b/src/xshmfence_futex.h
>> +@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
>> + #include <sys/time.h>
>> + #include <sys/syscall.h>
>> +
>> ++#if !defined(SYS_futex) && defined(SYS_futex_time64)
>> ++#define SYS_futex SYS_futex_time64
>> ++#endif
>> ++
>> + static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
>> + {
>> +       return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
>> +--
>> +2.29.2
>> +
>> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>> index cc45696530..d153c7a603 100644
>> --- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>> @@ -13,7 +13,9 @@ DEPENDS += "virtual/libx11"
>>
>>   EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
>>
>> -BBCLASSEXTEND = "native nativesdk"
>> +SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
>>
>>   SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
>>   SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
> 
>   can you also. send a pull to meta-riscv to remove it from there ?

Sure, will send the patch to meta-riscv once this patch in oe-core is 
merged.

Thanks,

> 
