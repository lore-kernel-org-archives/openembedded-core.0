Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793E4D41C2A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:07:02 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7794.1765454819205826736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 04:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SRkQ3GDW;
 spf=pass (domain: cherry.de, ip: 52.101.72.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdIZDGA0KrN9BmrX7alR1GhXsyYubM7sKtNZlaMkL6VHGXvZoBAqAiIkmW/gn3ZIbLKECaFb3b2NvQqL9IlD/ZyAnHhfzLWHixhmHxL8BHd9Hfjo2HMwtCECK7v/ujZB9/Y9lJvpcqChH+lLH9PVsXSXdyGEscK76D7JL8VMa7eSwojMmItuzoyIjy1f5rh5HcdNAvUIfF+9HM0ypRdn21J8u4uPOYvHIg1UzbFlqQm31VrBnFfAIhcgFqzRiqft4GAIyG77CI2ae/knDeetNcfBw1GxAx0S+DvJ3+CbF9Bpbj33RE1IUQw8yyVFBT7VrGJxXDxR2rPuoQ+g7tz2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N93T/Jg9bFytKF17Vq4gGXh5Yuk1k4QZtFnfBzPIW48=;
 b=Hmj8bdk0WVaULpkHxvoOCKaKH4pCTfc639iQZY6lUyTs1SikhDQ+2hZTyVnmdlwOFCjQmuw640VaRQUrXgrma4lvh2tFluSUqVXdmDwZXhVwQvSMIIGmnUu98z/JXcnZSdQ8p3uaPD+badmB0+y9jbVs/iInLkVvm2cGdrw2EsQpNrc/AQNZDd4k0tOBwGnI2dchxscZYGeFnw1tzGBKGhXPcawMJx+1RwnXw8GkMwvVx1lfkBJuXl0s1z7BBIhK/wquOpElIuNddtOreHzTzU6YHAJgE1SEZuMq/BdDhi9TiAzefyUgKfs0zYbjPGPYb8nceMK3OwWmNM4ry9yMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N93T/Jg9bFytKF17Vq4gGXh5Yuk1k4QZtFnfBzPIW48=;
 b=SRkQ3GDWxd90LI/4nw3tTgK6xPqX+Gp0amofCBo2IUKDBwuCFpcHSdRdiO6dosB5NKFvB/sW1Qx82e46BJdcs4Kn70l5Zs2+66FaBweQGto0+sDYEqEg7nnj9JYJE9Q/e+P3CQq0vcpGAlmgIXrYmFFbf/dVwX0ft1RPwUrMya8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10304.eurprd04.prod.outlook.com (2603:10a6:150:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 12:06:53 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 12:06:53 +0000
Message-ID: <0fcda498-b051-4129-a496-032204bd71e6@cherry.de>
Date: Thu, 11 Dec 2025 13:06:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 4/4] mesa: upgrade 25.2.5 -> 25.3.1
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251210175849.1989610-4-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251210175849.1989610-4-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::36) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e80e6b-e452-46b6-d3c4-08de38adc5dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RE4xSmE5OTNteTlkZUY1cTFXbG1NMjZscnpvODBBQVl4WUpTSEhNYklzRU5a?=
 =?utf-8?B?eG1HRDFBbFllOEJvYUJoUENWblhTVzFKVSt1eVVpenAzbWdxN1JXZVoxc0Fl?=
 =?utf-8?B?WFVGWFVDMk0vcUEra0YyVnMrOW9tTVNxUHFWQ3B1Qmt1cTAxVlJOckN3ZS9a?=
 =?utf-8?B?V3dSdWdwWmtwTGVHWTMzdVQ0SlQwWFdtamFmRzdEWjc5OXdLaWtJWTV4c2l1?=
 =?utf-8?B?Q0hCMzI3TVM2T3pNU1BvSU5QVENOZzdGOW1lR0htZUtXLzVzZGhDMUJ2TFBJ?=
 =?utf-8?B?Wm41dVpYUFQ4cFFQcUs2RlM3QXRQNVJPdGxhRTd6Nk84RGZvMVVUUUxHSyt0?=
 =?utf-8?B?NTJaMm9HclV0a29JY1gvTGVjWWRmOS85Zmo2VDZZM00yUXhNeXlub0pkQzhU?=
 =?utf-8?B?YUR4UnpubUdJK0NGZjVCaUNpK0tNRFVqb0FKZXFqQlZ0Tm1qSjRFanl2TXVM?=
 =?utf-8?B?ay9UYUhLK2NRVmxIRTFwRW9XVVFYRDVnTmlKUnAzUGRrRWpiSEFuWlhmTUF5?=
 =?utf-8?B?V2J3K1dCbWdhNkpHL2dqQWtpSFd5dGpKbDI1andRVVpESy96NGdXcDJSK2dQ?=
 =?utf-8?B?cVhWZXMweXZFM2Zwek9ZbXBUdXFNamcwVDF4Nm9MdGZMY2xrbXY0N1NjWkJW?=
 =?utf-8?B?TjR3V091Y0NrNkdZbExJRUlPZWcvQVR1T3RWek94YURNQ1hpYmVUTWg5dWlU?=
 =?utf-8?B?L0hYU2QxOXdUMzczMXl5OFRGdTlHb1ZTbm40ZnJXZW1PVnhBM1BNUDc2VFlW?=
 =?utf-8?B?MUg3c3Y5cGI4UDBmRjhzcTFSWGZDTWtJVDAweENlbzJFYlA5UWl3RmpXK2h0?=
 =?utf-8?B?S21GbDdlTjBxbWlKcitEZVpHc1d5QzRQd2RxbUd6SmhZZkxwRGhxeDZqSzBn?=
 =?utf-8?B?aXA1ekhvMGtZNFJjNU8ySmFUWDgvZGF5RDkxZ2Q4MXk1OE5hQWlxRXNWL3dS?=
 =?utf-8?B?ZUZrdjQ5SkQvVk9kVjlUaGx3b0l1NFdmNk1VOGY4ckFTMm1VWmNoY01qUUVD?=
 =?utf-8?B?Rm9hKzdMUDgzYzhSM2NyakYwMDZTS05qblYrUWY4blQyMUJITFNXL0xDMm1o?=
 =?utf-8?B?Myt2MTZUYjBNSlBOU3JZemhXZGlLSW5XYXJqOFFkSmJrWFNTZjlBSERlMUhW?=
 =?utf-8?B?REx3Njk5ZUF5RVo4NTFoZEc4MWtJa2piWDlPbVgrZnc1ajBUM3VaaW9tbytF?=
 =?utf-8?B?VU5uVEZUa0kvYy81ZE1VQjdQLzJaSWIxZWJSajVDVkM0R2YzbjJwRVJWREtW?=
 =?utf-8?B?eDlXOElma1ZablErMUNnbEZUWHdhMlIxNGJnaS9ETVAzTU80Y0hlRTlRM21E?=
 =?utf-8?B?MlJGVnNiWVlsV3VwQlBuemIralpseUlOZTFyaG9JcVpwSi8xSWhqakxFdGpW?=
 =?utf-8?B?TENTeTNSM2xsZzJwVndITDFqdHhXOHhzMStqNFk1QkZWK0NXWHdrTzQ2T2s5?=
 =?utf-8?B?QzlGMm1oVW42ektrMk5pVnZSRzFhTlVRQ1dnVmRMWWJ6SStKcExIZzB2K2Jp?=
 =?utf-8?B?VHdSRkI4b0FReHF1clJzVEUyZXVaT0tnVmNkbkVhTk5UZXNld1J2aUFFdHFB?=
 =?utf-8?B?YU1qcmRCa0w2LzJ5ckRGYjYvTXJTOVNvUEdySlJPNFFBelFYdmVjdFhmY3Zi?=
 =?utf-8?B?bUYwWnZBbmNIaHpZSjJFaHNUYjU3TkJzam5UMVh6R1VtaGt6WjhQeml1YXJN?=
 =?utf-8?B?Z3BlcTlxaWxBTzhLZEtaWS9vN1FRUkNlRzhzUjVDTHdzeHZ5VnRqRXRhTTMy?=
 =?utf-8?B?K3ErdHZWV2tnNzRDRS8vbGVaMjQwWjJpVUhVTXBEOHZDN2MzTHc4VWdIY2sz?=
 =?utf-8?B?UVpiSDQxUTVscDZNQlZQR3F3THpsYXludGJoSXhvclViSyt1NmUzcVNLMEV1?=
 =?utf-8?B?a0t2NmRCcXlocmNNaitKYmxWbHZpV2NvM2c2MCtjWUN5UzZVYk8rajdic0RT?=
 =?utf-8?Q?QgA5ERzChac5TG5fuS4gK3Bv9DZhrRF4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3dnRjgxV29KSFFhVlhSRUd1cWVLTTR1YnJza1FVZU54M1dwZlk3Zk9IQ1g2?=
 =?utf-8?B?MGlydTM2VWg3RnN4Uk5QSFJkaHFPZnZRQTRyOGFsZjRlTWxPc0lGSU9EeFpi?=
 =?utf-8?B?NDEyUEtTVXIzZDd2VWpWZjNYVGh6L2dUWCt4K09oenI3VktQWFlwNE41dEJ5?=
 =?utf-8?B?UlAyM3p0bVVIaEt0NjR3QkxFM0ZlOFFDdFhmR2R1aVJ5cjVQTytLc3UxM3ZG?=
 =?utf-8?B?K21wbyt4SEdIL0hBOWk4Zk1IMWxJcTlZcWFjaDZiREhmWGhCdkZ5UHBWYkRl?=
 =?utf-8?B?aHc1dTA3VmtYeFE1WnRjL2RBN0ZPK0Z1czRYVWRiN1Q4UTRqdklsMTdCbHZI?=
 =?utf-8?B?ZkhzaFBBQW1DT1NrSGh6UTRJRTVpc1YwNUVvZlM4ODVndURwY0FnRTErU1ZB?=
 =?utf-8?B?SEtRb2xKdm12eWw1SHJmcG1SOGJRKzE3KzlMaS92aXBRMG1zOHJZSGtvZlIy?=
 =?utf-8?B?SWpqMXB2Y1M2Vkx6bEZRUWRVTEZ4Rmk1WFgraHZPK0I4UFZRTTJqMUNpSmFV?=
 =?utf-8?B?WHBIR05jWXBKdnoyQzREVnpXMkt1NDBLSFlTeVVsYkFxY05JdTJsendKajFu?=
 =?utf-8?B?dkZBRTlPSWVXQ2pYeEM3ZCs4dWdua0lkVm9LZERXemxCT1ptdWxCOFp0RjBu?=
 =?utf-8?B?SnNOQi9zQTllTXJHc05GUlh2RTRhc0FpWEp0WHNrOEFSNURWMTJqRWFVVGZF?=
 =?utf-8?B?djZhL1k2ZnZWb1pmQzlPZGJ0eWRTdW9GL1AvLzhkUUVkdjl0QUd6d2xqM0dr?=
 =?utf-8?B?cXk2NjVLYnZnbXVrWWlSWjI5NENpM2tudXYwRFYwRk14azQxdUtkSGJyeGp0?=
 =?utf-8?B?Z2xGNnlzNEx6NkRINFNFTmpsUVZqYXNrb3lJbXVZY1ViaEU4Y0pZeWlxamgz?=
 =?utf-8?B?KzJOQ3FzelRGdm55UngwTmtJT1NuZW5VNUFWNStvS0x5MDhnbW5SOE1IZEN0?=
 =?utf-8?B?V0I1SWZyaVlMSjJTbitFbVI1UXFZSXdLc3JTSDBHREtpN0ZhVW1saGtZWWE3?=
 =?utf-8?B?a1AxL0xndVZlOVVPMzY3K3lpYUlZdy9GcmR0SGZSNXdaaUd1elVXNm1nU2gy?=
 =?utf-8?B?OWVBZk5KUHkxaGZZbTVaSFJ0SlhqVVJlSmdSa002VXJ1eE4zcUkzK0VLT0Ro?=
 =?utf-8?B?aHliL3pGS0tHQnE2SXl6ZGZ3YlI4b0xJVkg4ZUVjRlZJV0QvcVRQZC9MeUFo?=
 =?utf-8?B?ZURFeU1CQWRsU0t4dGJqYUNvN21YTHpUZTQwVUx2NS9CaTVweW1pUDM5aWZi?=
 =?utf-8?B?b2kwU3dBbHoyODF1UjlKUC9JZGN6YWh6bzZxQzBEbkxvOU1mc3NWbEozNzZS?=
 =?utf-8?B?SDRzNnRlSWpDMEZ6eXZIaGtjRTNEMXhUblUyaHoyVmhCTEFnNUJQNmt5ckJY?=
 =?utf-8?B?Ukt0c2F4M2UrTUphMFF0Sm5kQ1dmZmk5ZGlkdkpoN0tSUGpOeVlVeStpemVq?=
 =?utf-8?B?TGJZZ2FMcmRvZ3Y3OUZJK2d1elNEcVVhRXlZblVUN0VqZ011NTI2SGpMWkwy?=
 =?utf-8?B?VFFmR3d3T0xaRTNOZEpJcnRLbHVjOENuM2JQQllGdDhSbXBIaFJocXlmUDBi?=
 =?utf-8?B?UzI0Sm9zMVd5N1hEN21UUDlJVmZhOFhJeVB0aW9ISEZyZFlMaU9IREpGa3VB?=
 =?utf-8?B?SFRkalg5cDd1aDR6T0x6OVhzRVVyY3dtUzcxNWVZZi85d2psYjRFUnFLcHJR?=
 =?utf-8?B?SEtLekg4SGQ0NnFENlN6VGk2TitoZXhVWUhQV01EUldJWm10YWlKUzdZZGFK?=
 =?utf-8?B?RnhpQXpEbWxnNjQ2bEs1bER3UmtPanF0M1FjV3pCV2xydnNiN0dCaTNzdy93?=
 =?utf-8?B?SUhmOEY1ZUtVSGZ5WXQ4TnRGM3dWNW5hU01iejRqNlFBelZ2eVAwN0xYMVd2?=
 =?utf-8?B?MllMQVNPSHNLV3gySkxldUMzRFVZQUI0L05hanN5RHYzYlBXd21CM3VCQkkr?=
 =?utf-8?B?Ui85YUpuWng3ckdxaExOSkpLZ1NpdXgyOE1xdTAybXVwbWNDclk2QndiT1Av?=
 =?utf-8?B?QjYvT05ZTkt5T29oa2dWZVpVU0J1dDRmcWN3K1pjM05adGJTZ1lXSXRkZFpO?=
 =?utf-8?B?cE9rVHk3NE5OT0NOYnZoRnV5eEVOYW02VnRNRlJGb2tibDYxT3hIUHZkajY2?=
 =?utf-8?B?d05IelpBZytJdW9EVzFqbEtIL2hUZWwzQjBzRUhtSmc1ZjE1aVQwMDdEZkJU?=
 =?utf-8?Q?YOh2TwlVYnjbCUZUrGBGkGA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e80e6b-e452-46b6-d3c4-08de38adc5dc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:06:53.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZd0EnuWx4+/EYhf+k5KwZSQt8CTWyVlCfGcFvkju0qLJEhU6EDPo7/rXIgkJVkj9YsuI1Zj1pvg0vMq2lmIfbHBZZgSPaQNkobbogaILig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 12:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227524

Hi Dmitry,

Misleading commit title, it's from 25.2.8 to 25.3.1 now.

On 12/10/25 6:58 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
[...]
> @@ -134,7 +138,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
> -VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
> +VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
> @@ -172,6 +176,7 @@ GALLIUMDRIVERS = ""
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
> +GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
> @@ -182,6 +187,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
> +GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'rocket', ',rocket', '', d)}"

We need teflon for this to make sense I believe, so

${@bb.utils.contains('PACKAGECONFIG', 'rocket teflon', ',rocket', '', d)}

maybe?

I assume the same needs to be done for ethosu (but the other NPU driver, 
etnaviv, is controlled by an option that is for more than just the NPU 
so it's fine as is I guess).

Cheers,
Quentin

