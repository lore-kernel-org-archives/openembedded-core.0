Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33353.1793881858249002146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 04:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Ttjlo6YC;
 spf=pass (domain: est.tech, ip: 52.101.84.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtLf3rddLTf4oMLsq4kjYPwYjZ2lP9tb4c5JqhaZ0e7m5JfePk0dPc6E3wt+CX5bid+P6yExmKk9uf3njStMwzGfSvVhkUeR+vdHsEuIqCiAz8kdhCK5dQjVw2prEweDOMK81y/rrywzbChs4k0/XgAzdKoa5I8hVbZ9aI7LqNJdGR+b3NXk+mejuzOjSHm5lKz9E7v+73ltSXgA3cOWv6fIfRjLdVTBPodAWh1llEe4XSZqJ7h1Mx1l2RSYRR/E4WkeU+W6kKdQorzqbs6zJQA+Ezb03t7faqaoPWUxhKV4Iri3kIMPyzIdH1ZG8DVsXf2wbVjTYnUTPxcNQeb+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKP82pieopdBdpSLZddqwMGSDTRbUc7WBJYKHK/+YkQ=;
 b=a3WS/yV7CR8rxRlDSucyxiG8AzVG82xvGNqNAEVXMuWI9EE8ht7bfctJplLgR4Dm9SWJ1GCxM8ZzpsmX7CZsBXaZNSnkqdC74+OqPpehdqDaq8yjqkiUvbetbFhplBCd8F2nr/qzRUO6U6pjtZeqjJrwmH+IuhMhT9EACm/E4mTgNUtCd9orzDBTTRb1z9ZegvUFIwCwrVpKDNm0lURSvifFnRdZey2gM3wIPIfhVy/9iHmj5KybDksQEbq+nvWk8JQsKsxmmWgoAYw317MMRuTxNS34R6YFStjYSJcN4fV2CxMEksrudBzBpE472FgVqvMeb5QRSrzSI6C3UnJ5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKP82pieopdBdpSLZddqwMGSDTRbUc7WBJYKHK/+YkQ=;
 b=Ttjlo6YCR91CFMpeyBA4+1r5SN6R3yYHS/6ygsixDvm+yG/QOB8YKvKRbULWUhligH4D7v6Hukg3FjqwU7udGiYwVcQD2MCyqHr1m0vdpqkXNYgZIMlkvJvx7Ix6e1o401fuv6hnIzzhy/6RQLUR57ZbRuL8vKgT2sBaiQKmnywT+ksZZQBcDcHHLEpQl6mu8/3miLK8X/QTrYimquhTQaPB05lt8VRldwEwnNkWb/Oie1/tROyHGxVL5mJx8bG+nCri/PbRnfSedjckfMJ0OGQm8fJ5KdchGWrscHaL5Jex2ozklVrgNQkm0tXpdbhJVx/rqsB7Od0F8xQPByYkkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AMBP189MB3280.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:30:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:30:53 +0000
Message-ID: <3f4ecbe3-ac6d-4777-887b-ff53d472c40e@est.tech>
Date: Thu, 5 Nov 2026 13:30:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 1/2] python3-setuptools: Upgrade 84.0.0 ->
 84.2.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261104152808.47533-1-jaipaul.cheernam@est.tech>
 <DMN1WOF5JJRS.39L1YDSXCL7V1@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMN1WOF5JJRS.39L1YDSXCL7V1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AMBP189MB3280:EE_
X-MS-Office365-Filtering-Correlation-Id: 0544c9a4-2579-4bd8-6f4b-08df3b38a24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261022105027099003|261102123227099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Jz6CxUKSd0/gz8E8xhJUqarr5bpG6xGcAfLsATl6rLFmPoRmIRmPf3gfZuF5tAZi/46NkSZ5AtqOwuBTcFq3sS2q3f9shsaYxAxf/9J5mwfDlnTrNBSnVeO3XrEhBSfcKAHvJOGUZ6Wtg9ZNHBMiuLLZeBRWpZofnu2zAfQviyzSAzW1Q1sqNChAAaCAtsfQGkszz6emTFt0dkT3T3vkTil3HwQrZncuNtw7R7ONDK2SxhzpxZgVfMkI840bkNKrPZpfGu5wPNu39LCe1TR0qqEFdCcG+eILaVKwX39A7UkIsSx83jLqmBZME05kgRSKjsmwA0nPtM4nYLGsIv7Qigcwc/qwstCEU5rceoFVRv63Jt0MDFDd5v+dEz8lXNzRehd7Oeao54nvB3lji296ax2oDzHvzMtDkohx813MEc4+8jRTbqRzt3vOIx72wBmAoRL5qdbtVIBkZ1ayVOum4wkQEecIA3+SrOo+R7LkSywBRi52ipSorWezkshd9UgUW4I9JNWerqNcq3/+Vfx0K0JbMpL8V/rXfS752364V5xLQHXtmUuXa9cYU6gDjQQ3SJR5u3u7qh7YKSX4wmTmTuy7W2VBMi/UgTGGUSdRY+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261102123227099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVJuUUFkNGoxVk5GSW9jaVYzRWVQaTNLcEtDYm9YREpEQUFTZGdRbXVicytI?=
 =?utf-8?B?d1VBVit5K2xjM3JBajd5UUordHpqUXpvNjNwL0VwTlFGSlFoR1hySFhTakhJ?=
 =?utf-8?B?WjVUQUZ1NytOMFIrWCtFdVJnc1NiS2FzT2h2anhYQXRkSDlkMFB5aCtnb3Vk?=
 =?utf-8?B?azlIZGwvaCtiODJ1ayt6WEpzaTZVZlRTbkxtYWtRcWhnUHJESVJDOFdtdWNK?=
 =?utf-8?B?a1N0L1REdXgrOU1iWlBhcktoSE9KRUlqT3lDL1h2VjhNcm1QYWZ3Ris0Qndj?=
 =?utf-8?B?Tk5uemdibm9MQWJmTEM4NzdUL3pZeGlTWlBSV3NLMDJJaGd5NXhJNjFSa29r?=
 =?utf-8?B?Snl4QndXR0dwUmZVbmhHemRHbmh5Z1h0UkQ5YXIvSFdSMW5hUm5LSFpCMlky?=
 =?utf-8?B?YTVLWkVja0k0dExJZVdIVXZCYU03TFBLSDUvMXhxOHlaOEhGWmw4cW5RdUd2?=
 =?utf-8?B?enM1OVBkTXIxT3NFcFJIMStjTUhGOVBWM0RVaFczaXZERzAxNFRGdkM1dnBW?=
 =?utf-8?B?amFOSTRGQktWZGphbmgxdm1WMGxuMmlQYmZZeXREVXRnUVdBczlXRWRCMnZ3?=
 =?utf-8?B?NWRxc0dnczdsL0F0OTlVdTFiOEVlYzVOK2lyNnk4WXU3YURKc0dSZSt0NmNK?=
 =?utf-8?B?ZHFtM1Z3OW1aRVlrN3ZWcXorZkxnMUltVXN5aVRSaXF4QXM2UTJBV3RBVldT?=
 =?utf-8?B?NnpKbEN4Q2NHWXRyLzdHUlN4NU50T05TVDdwYUdWd1NkS0RldDFMMllrc0Uz?=
 =?utf-8?B?cmtqeVZ0TndFZTNsdDFlK2V0M3hmbmY5Q0xmZmdPWEZQM2xLV0xkdE92YlFk?=
 =?utf-8?B?Q0Fwa1ZpN1ZCLytYd3pFcFNnc1hJdE0zcGhEOWtwVloyT2dISm5XMTc3TG1t?=
 =?utf-8?B?SUg0YW83Q3JrMCtXdHBsUFR0cnpmYUxJMlBBMkZlK1p6dzZPTEdmbm1lQUlX?=
 =?utf-8?B?NFRNNHZCekZBd3JyODF3RGkzdXZKbVk0OFJTeG8zRG0wdktsZEZQZWZwR3hy?=
 =?utf-8?B?V3M5SEpFWkR6THcyWWZESVBGMWNzck9Ha2pHeTJjRWZ0U0ViNXBzUzhlWHM4?=
 =?utf-8?B?L05wakpzNmpoZmdBbzFjdWN3dEFHY0RBWEtsS1hHR0I2STBtcnpESW5SSG9B?=
 =?utf-8?B?akFFWG0ySTF0REJkUk43QndxdlFBR1I5Y1RyV3hHRVZWcVJ1eis4emNNNjFE?=
 =?utf-8?B?N3hnRHh5N0x4TEJFdy9mUzN2RjdTVXpXTEZWbmtFemZFd2tJTTZWS0xwS0Ra?=
 =?utf-8?B?VlZQV2FzWnZNVGVFbTNpR3hTWVR2L2d1RU55b210NCtFc3BXYWNCcGV0ejk3?=
 =?utf-8?B?d1hVYWNRWTEwM1B5VklTRlZVZ2gwS2trNDdaYTBnakFDRkhzdTdYV28vZjFX?=
 =?utf-8?B?WTg3Qm1yNS9DMTg0Ry95bDExcC8raS9ZREtlZGdadVJLM290QzFhTFVQSGUv?=
 =?utf-8?B?dTFPU1NoRlNreitNN0c3bnBPVXBqR3RyMUsyUzk1WE4weG1DRmgrblpXREVm?=
 =?utf-8?B?ZFplVU93RzBPampJaFVKYkhCNTdvWEQ2TUhobVZDMkFTQWQvWlh6azArekhI?=
 =?utf-8?B?NDNDcjVnekZCV1ZuYi9WTUpMZVhFRjM2dGF4V09VclVKN2lFWTcvNzcrR1JN?=
 =?utf-8?B?ZUc0bWEwZFlCeW9kdGVSaEJKK0tzUTg1SUtVY3hjS2E4ZWNKTzlSbTkrZ1E1?=
 =?utf-8?B?Mk5yd2Uxd3dMMG1hcU9yVyt6WG1PTm1JQjFDcmlyOU01YXlHOVVWU1RuNmNX?=
 =?utf-8?B?NDRPK2c4SG5JcjFsRnI2S1VDKzZ6eUVOdmNlWDV2ZnRHSWtoWFBvUlEzQWN0?=
 =?utf-8?B?TDRDMU42dXRGblRQUGxDS0QyVTFVT1JFUDk5K096d0s4QU94M0hCSFVidDZh?=
 =?utf-8?B?eEJjdmg2WmNINEZ4VkpmSW52WUZGZXJ5V2UrVkNOTHJtZnlpd2M0M21ocjds?=
 =?utf-8?B?VEhKYkI2ZjZRU1JPRm1JSmxMN2txTGNNM0FvaU5ad1VDRHBhbC92RDVOVmxU?=
 =?utf-8?B?YzZneHRFcjB5ZUJxQjNhTjFaN2ZlN3pYK3FZNTluaCtWTy9nVnQ3K1FXelNC?=
 =?utf-8?B?NkdET0xxaDBDbVgzdTVPQ3JQVUwwNnpxMGpIMUdBL0gzS0E4U09jaGRnMUxG?=
 =?utf-8?B?VDdiczkwcUNpczlrRHZOZ3pDZEFlWjFHc2RCRjRQTnhJeHNkVXJoWWZicWp2?=
 =?utf-8?B?Ny9IZnR3WVNULzBONWJoYTc2Wi9ycUlpNk11a3hXd3NHMEovQXArbUYvV3FR?=
 =?utf-8?B?RWxNMUo3ZUdwS0FNRXZ0OTkvVlFWTk4yak84bC9RSFdBalJCby9rOUxlam1E?=
 =?utf-8?B?Y3MwS21qUngyYU1LZ3krU2p3RlEyWmhhN1JqWk40NDJ5b3dkWnF0UT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0544c9a4-2579-4bd8-6f4b-08df3b38a24d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:30:53.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjdEgqs9t3lRJpr9Ge5Tvdm48bDKjpbNvdAqyJaqxFt56ES60QOinrj4HR6cY5iCU8gY/p0ACKEfx/kjZfQ5qv1VzZuWbncLR4d1+J+5dHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249549


On 2026-11-05 07:08, Mathieu Dubois-Briand wrote:
> I suspect this one in now breaking some other package:
>
> ERROR: lib32-systemtap-5.6-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183' failed with exit code 1
> ...
>   ERROR: helpersdt-0.1.0-cp315-cp315-linux_i686.whl is not a supported wheel on this platform.
> | make[3]: *** [Makefile:631: install-exec-local] Error 1
> | make[3]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/build/python'
> | make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/build/python'
> | make[2]: *** [Makefile:499: install-am] Error 2
> | make[1]: *** [Makefile:2290: install-recursive] Error 1
> | make[1]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/build'
> | make: *** [Makefile:2689: install] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183:227 exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> | 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, line 227
> | 	#2: die, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, line 211
> | 	#3: oe_runmake, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, line 206
> | 	#4: autotools_do_install, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, line 189
> | 	#5: do_install, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, line 166
> | 	#6: main, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, line 240
> NOTE: recipe lib32-systemtap-5.6-r0: task do_install: Failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4802
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4945

Hi Mathieu,


Thanks for testing this upgarde and now I have sent v7 which includes 
fix for abouve systemtap failure.


Regards,

Jaipaul

