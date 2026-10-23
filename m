Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2232.1792741851656422263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 00:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=nNDaW+AY;
 spf=pass (domain: est.tech, ip: 40.107.159.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiYGF9KBiivxas7I31iocxpDLtUg0O4f9E5qomZ5i9Fqtt/C+xALcNaBL+0XxW8ROGe9zb7jMuugcQI7BgQct40CmumeH8GwkGcOunsqncJmyGjOTpo8Ppyf+ff950DMPxHYvLB/mnwjJGW/yzWKG2EgGWqsv4oR1yf1sWt+fSqEU4fLXSQHzQ+NddqUoBvgT703wilaqqKbK1FpFhROSzuEZg5cqIloahFwY1vULYjhQBH0H0kLDG51+HCDOna7P/iSjOYNfCXEdAdHTUMWptwJm4ZYV571SXfZvE08/vmgH6Y5ii+9WDNSgby4xbqeu2ucK3KGsQ3OdPtGq56O2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CAQ1UjAVeuLN6TbsCe006Av7upGDie0pPm3GzZ9obg=;
 b=SNSSg72bxsJXgPvdLd0yhtTUyl9+rKHNbWmHrvT4fswglPh5jy725EYosmOaO6uvFSqG3ATEL6fI8BMrJST8f3y+9eephGs/3mUC2y8cZKLJtboTs7n98SNRIfQppAj6Fp3b7w1vFEgAQLI47Wnh71bbDRMFQkvjVQaH5k1ZwDrOfQoNVWNEuDFxWnysPhFwc21cQVm57GA/9css1iNadIBKhFX6B98KMaTHFENTCoVNwr6ygaCemw1ZOuUiqlLssXklTtKAf3fCJkWflCOMiNIHaKasDHovg3GhPUSAWvkC57477d8uOl0aq9vUsymltLu5e2KgUkvwiXTJdRlV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CAQ1UjAVeuLN6TbsCe006Av7upGDie0pPm3GzZ9obg=;
 b=nNDaW+AYH1XZJPOJCv2tOiX7qLeJc/l8kKU6ln/EUBLxmlOTmbzk+ZkWNhfw+oK+F7fyaCk1Wkebx4gl5Q7GQChHsEStrkT2JnL0dih/guOBW3y6p5z727Ah1E8cxq4S+CmHUP5XId3rQ1yi2piTvteLyqxOQuDZblaWdE0+qCyGgrCwPqsUv8ZWYfTal2uYzi4c3LCjjs9n1NLOWTXQ5iXkhNJsxTLB4KpFT1axvspW+iEXVNuTdPyGeN0j/tqbzc5Z1Vw3LpQGzEz9McF39hE2p63uGKcrklmW+jX9UE345keWwiigk3uu4mpS9EQ8/Eunpa6tCdMPD6E74NIznA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3464.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 07:50:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 07:50:44 +0000
Message-ID: <cf7ab44c-dafd-49e5-a0dd-35bdcb49e19a@est.tech>
Date: Fri, 23 Oct 2026 09:50:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable glibc 2.39 branch
 uplift
To: peter.marko@siemens.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20261023072904.46982-1-jaipaul.cheernam@est.tech>
 <AS8PR10MB507389BFE1C8CBF1C20588EBFD642@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <AS8PR10MB507389BFE1C8CBF1C20588EBFD642@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::30) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3464:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fb49d7-7551-4e78-d84f-08df30da57e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KYksV5Z4fmkXokrrzwgftWbhP6nGRQCZwoZfo2ktmLDJ3rkzEG5yxnJVmLeUTsyxZZHuOyoDdZEbCLGYCiBzb7DocegFKLy0NrstTewkVeTbVf9J31iT7ppeOBPc1JR7G+CCwats7B0ZK4oe6/m3tVyV/tvwlv2ucK46z3fAOUa9PEmXlNFbD3zuDJXaOHzJgRES9OGhcZloY0jQfIQYaNBDwb6OgcwZSjLkYn3aTlYUL4bMCFQrLS8DKe/wF7LTMWtPdbpvwa/sHE23dDms/OIcb/oGgzzpWBi2IjE3Y4qUR+nBT1LSzdsyCcAy4EWUY6kk/4VkVmzvAJ5o2/kx8Rv+MtsvF6hPlHsIAGUf7/JU54OmdEi9VefYimqZj6emgnOWw3AEIVdmDeUP0jGm4+nTLuAMm6NnUoCb9tY0g8+JoRRDeXhS48K2eKs2uXANUwZ2s0ydH5qWTSOr0AxHzH+QWRqGP6ARNDjfK7JPU6lcWYsBYVJKiP5wqJWYh3ry1yOoulfZ9s8bWZguEHCefTjDvcqdlnXhaOAQSeScKDoRLnojtq8xpcWY4ZEITCfVPUvincawPXumWezgLlMBBA8h2eEagPxXkC3TqMWrpoEtNHmrr5qQiKz7FfNQLHrS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmpNSGRRaXdPenV1N0luTzJrbjAwaGxUV3FTM3F2UlF3Z2MwOHd6cXg4b3Zy?=
 =?utf-8?B?UisvdGF1cFd1QmZGQ1JFbUVXTWI2VVBETUNGRldnQ1FoRzVUcjQvNHNLdzQx?=
 =?utf-8?B?TDNkNlNJYW1LOFJJNVIrNFB2Z0Nvekg1eDhFWThqWjU3VzhPMEVBMVNaOUxO?=
 =?utf-8?B?clNyQ1dDQWNvYndyVFUvWDBNN052MUhiZW1qanVCQjJaQU5McU9CQnNOUVBo?=
 =?utf-8?B?WmQ5RE5XN00zQ2JsZkd1elA0N2Jtb0pjdWdmbW1uRW55ejRqdnF4WXh2VEJ1?=
 =?utf-8?B?TFFEendaV1FCK2RBT01iUkRVak93b0xWL0xJM3Job3B1OTRSOGFLTUVMMDRE?=
 =?utf-8?B?THdodHlWMTUwS0lkMGg4VHJOUUJialRpNENHK3FsYnRoM1NOZHFoQXZZbEZ2?=
 =?utf-8?B?WUVSeFZLYUMzOFJEUm5sOStZeUY1c2NXb0tkTGpmK2VxS2d5eEU1SU1wOW15?=
 =?utf-8?B?NTFUWTdLTFU3ekI5ekZxQ3RoL2tueDQvZW1TYmh5UklVakFHSlk4RXJQRTgz?=
 =?utf-8?B?a1VTa3VqRDRUY0U3WlBaSU0yZWFtZngwcUhKYXlnaG1QQ0puTTRENUdtL1gx?=
 =?utf-8?B?aHNaZ1BJeDJIS2k2T1NiYThITUdDSmZ1b01aUnZVbWpib1kvb0lMOWgvVVJW?=
 =?utf-8?B?dFpJVHJXUmJoTjlmcFE2WmNGUW1RTG1UVFlTNlVoN29iRFRLK0hZTmZqZEgx?=
 =?utf-8?B?UkJTN3ZMVVh4VjgzUjY3ODZmcGlwRHBGTHB6ZDBpVm43ZEN1enNpeTZhb2VB?=
 =?utf-8?B?bGlnMnJHSkhaRGR6R0JMcjA2MXdramg0SFk2azYrQkFwcDBSRzBGWXdSRi9X?=
 =?utf-8?B?S0UveEJ3TEpNc05FNUR4SW1JeFg3VFJnT0FkamgwN0xyTk5DbVFBMks5bDEr?=
 =?utf-8?B?eHVvMW9iL254elFSSzd3a0xPREQ4d0wzSitmZG1kN0xENHNlZGZqQk5SL1JJ?=
 =?utf-8?B?UDVDSVZQR0RtME1nQTJtKzZrajlSOCtvUGF5bERLZy9vL3hnKzZyYmJPM3Vy?=
 =?utf-8?B?WlF3cmtMRWZUWUovRWVSU1pIblBsMjRkeVo2NXQrK2dZU1haQUdGSENqQ3Z6?=
 =?utf-8?B?N2k1RnFvYTRSYWE5Sys4aVJ3c25GNkt6YzVVSFNWMEdsbEs2UlREZzdsZ2RY?=
 =?utf-8?B?SjNiSVpWNEM1SVpUS0x6N2xMckVPdld0cWJ1aisvZlhKbit3LzgrQkE2bTRl?=
 =?utf-8?B?ZFJrOGJDUmpqVWpSK2NlbUJxc1Y0eldid0Z0ZkdXcTNaNk05RUt5QTZ2bllR?=
 =?utf-8?B?Ri9mVForbzlJWHI0RFFPekdSR2RmWmVaL05iVjF5WXZ5MzJCb3RmYk1OemhQ?=
 =?utf-8?B?dFh4WFJ2KzZ5bVhiUjl2Y2xOZDk5ejgrZ3dKdEhjTWlhYjZVWXJQcURqbFR3?=
 =?utf-8?B?b2poSUEvakRQU3B3SVBjdXNqYkZtZHNaMTNmK2JPMlhVZTJRd0puUDhjd3l5?=
 =?utf-8?B?WlVJU0xwRmV3UlJpekt4eW9WTnZZQ1BCdEd3OFFrZlg4eTh2Um50TGlxakVz?=
 =?utf-8?B?QXR5dFFWNjBSVGRXSkNUK3lzK1ZaaFVmclcyd2FhUG1neGNOY0twYldvWEMv?=
 =?utf-8?B?UGpGd2Z4RGZQYiswMmY0aUVQby9pQ3R3NFhacEVRT2tDWG11R2NVTS9FVm1T?=
 =?utf-8?B?VWhJdzBmbTI4THNUc0kvWWtyYlBkeEVUNjNTZHZUZWh6WUhScWtnempVWXo2?=
 =?utf-8?B?blA2K3k5c3dWOUlSTGppd1NUclROYmc0NmpWTWhKamorVlFsR3ZHSWh0NHZ0?=
 =?utf-8?B?WDF4WGtycERBaW5EOExaVyt2UTUwMDN5b2F5N3FhKzVZKzIzNHU0ZnpwdTZp?=
 =?utf-8?B?VklKVkhlRlUwOVJLU0dtbE50cmE1UlRONUtzR0NVWFgxMmRDSmZrZjg1MURP?=
 =?utf-8?B?cHVPWFlna2FRS3lBVXRmOWN5UmlxWWZKNTh1Rm0waFplNytteE5DeCtoaGpO?=
 =?utf-8?B?cnZzWHhIbWtKNU1kM0ZiWGpzeVRCVFFrMGNTSm51cGZRNDBGWW5TZmp4WFJR?=
 =?utf-8?B?WUQvVGFLNmRVTUxKWUVMMFpndDBXK2FNS00xNENvRi92czFoK1R2d053K2dC?=
 =?utf-8?B?Qi9OS0t0NmdRV09VSW1qcXhzTmxPaDV0alF3bjVRMnFPa2YwYjR6STJFcE1J?=
 =?utf-8?B?OEN2K2ducU5IdlI0M3BmamMxSjNHSG45RWFNZElseS9jMWpINkNhWHYwenFZ?=
 =?utf-8?B?Y2dNbmthWDFaOW91UHBqSUNBcnBZTzNkaFFjWlNxQW4zWGtkeG5QSzB6cWtS?=
 =?utf-8?B?QU4zNWdOdVUybGRScjFzZXNkWk41WndkUVRERlFaZXlVcHRPNVd2bkxzdWVN?=
 =?utf-8?B?Y05qK1h6UU1BR0pTRmV3amZxSGFmMkdQMmtyejFheGlvZkNoa0pQdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fb49d7-7551-4e78-d84f-08df30da57e7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:50:44.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZE/U7k8WqSsS3h/qqcaNiBwagW9MtUtNq64bJAThrWA96ugAZV8/FVFez8s5IMUFt81CeF/H1SWqCnuZGFp6XAPtvcUrw7mJdQObheiXs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248490


On 2026-10-23 09:43, Peter Marko via lists.openembedded.org wrote:
> I have sent a comprehensive update consisting of 15 commits 9 hours ago.
> However, there are only 2 new commits available on 2.39 branch, not 7.
>
> I'm not able to see commits you use in this patch under
> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.39/master
>
> Do you have a different git repository source for your commits?
>
> Peter

Hi Peter,

You are right, my local glibc is messed up .

Yoann, please ignore this patch.


Regards,

Jaipaul

