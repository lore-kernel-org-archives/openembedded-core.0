Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10482.1794406905714309371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=b/UH9Pf/;
 spf=pass (domain: est.tech, ip: 52.101.70.19, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRyPMuHvwdRiYT2qMSodOnRJGdX1t1l9SK2OWPw3fSt+AByD1y+AakIzMa8juJ3/stxWS7g1kTzemiYET3cuz7BOeI846zj/+F4sPsOqcWl4OobVO2aZaUAHn9Nm/rPCcn1f6X/ETSljsY7wlh0bqeQRKrMDrQLR4JmKOaIlHjzBQ7yUsoMqMiFUOYZ2lSBjZ087rRpDUK/pUmilPsiTG7hF9bMugoRKRKmSNWpSYRlREhm02+2W2j80Kj1Z2oJ1Sv2ZVef/qwB99AxPykA7r/W+TjYzw9A0uibsQSOU+WV/4NzUZTk+4scTH0c+mtZ1ez0lwLdjdipF7aquOrkK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWKix8YYAEiUDbCJcDLLghgvkO2/M1nHbrWpabje7zI=;
 b=dIYqvtQeD9LKArV6Hno+nB0WyTn6e7+ynoJeVyPszvz16QzF7e8luEqSIoQOwX1OdfqFbiwp+spynwWh4BJcyvgimrA4STmXp4lQv6QMFGk2dyi96tLKwxzYmEXA5k4GYEODUpst3iST4UEGL1ikWc8qmHmRJtUIhuxIkmXHHlBLU8MNZMnV/U1Zjf4r6v8LgfImDaxdtVBzGxCKeIbUdizqR3HrydWGzEjFn3NtNvdKEupVfdF5hDE4JTnqsB/uKzUX6J90QbUqRVc9zOd1OvuOxeETtd3KKRNMWkUrXZrK5cCiOR5m+bx5DwetccvN8HUrZxXrI8RJXmQ7GkBysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWKix8YYAEiUDbCJcDLLghgvkO2/M1nHbrWpabje7zI=;
 b=b/UH9Pf/jrU+//VbPWWsQDgjsiRodS+rKXeYIBCwz3+Q9SZPsdDXx1WnrQPIekueKk4uNRkUikGmmBjjWjtt+2412hwvvoumlQKD/OUC8EXSWEQQ631S6dBpuvXshKhn12KSKpoaCPAZ50+qBr5+pKRGqL+77DVJT1q3SXzblYXsRbEbRGnXZ4zlq1a77eFlZGNzvRwZW13ltvTWVksmYect7dNJtI+18yimZirc3kLVYMx44hFLGxjKIIZMFHK+qPxrGcHIvTzbioEZinyDFMy9C9bBMnLd9mzVk66HUnxdl1SHWtBL+/GKwZgkROi2cQ6YULUwNpMeOhf2fl5yZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB2044.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Wed, 11 Nov
 2026 14:21:41 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:21:41 +0000
Message-ID: <3715c2b8-3ee0-4733-aff1-6b484818654e@est.tech>
Date: Wed, 11 Nov 2026 15:21:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] dev-manual/packages.rst: document gpg-agent
 configuration for parallel signing
To: openembedded-core@lists.openembedded.org
References: <18E7026FD5159910.826602@lists.openembedded.org>
Content-Language: en-US
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
In-Reply-To: <18E7026FD5159910.826602@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::20) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU0P189MB2044:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6fc475-7569-477a-1bc1-08df3fff1aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|23010399003|261102123227099003|56012099006|11063799006|261021121427099003|261009223027099003|261022075727099003|261026140227099003|261022105027099003|261026121527099003|10067099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: WGcTi/0YuVhskrRjfLZN+Nin1KyHop4LbYDWFdQCXTg1M13Q11e8g1U3SDEpFl6NbAbsp8Klj+WxMEH1xOl1/uEEmX8XryrRD3w1XRPSVf9MHVPjMwCQIb8OEZOhcjQnW44K7f5YvfLe0zVbS0tn5J7dW0G7nG0upr7/tj7jrWBflYqpGkL6srwThZ9gjbX4nz6bLkf7ZGC4ZwdmPv2ulvtZoJ7UgZWsVElqjGph1tRopOGMyLvd4MGt8p5EKJVq7Z4aJri/1TRMTJyXhScCPqPMti3aQy94Rfp2uCUeJq86NuEBqd+ydvQu4m4eXChQ3cAsGM3r4+r1BOk6IRYu0NzESv5aKd8fZtI26IuUYlzrAXndhcilG9avhY/cm4eKxW/Kn2yFwqrvIfHNj2RSLCaqpcHLTkqQNWasj0fdH3rAq0ujwCj14e+jOQyGI4N+hijVWBGcPIzJiS2dzmbuhOKcHJW/pv0mtr6nU6Mj8GlcLkuYdcpdhMsUQLcdCVIsUfwKkEwQmPB+y0h5MKsbpEi5zNVdsTn9BxnD5ehdrVrkQGkpgyKU8eKM5bZEQNFAG1Bh4juMZJ3MTNf030t/S0Zc/QKiNzFgXc85jc4czoWfSdJ8ZKYoYS2XeSedWSBZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(23010399003)(261102123227099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261022075727099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmpnUGxDeElmYmtTdGNFVVpjZE9uWlVuc0c5N1lmRUxLMk43QTZUV3IyL1NP?=
 =?utf-8?B?WFk3R1BhVk1JZ3dCd1hjUVY1MmdFVWoxODFyNExOeUdsUURQb3EyRlJOVHpN?=
 =?utf-8?B?VHdmUUxmdzIweG5PMW9PekpRdVJIdTcrR0NQN3BITnFBY2R1MnRkck1heTk0?=
 =?utf-8?B?MzRVcldJdSsvbnpPQWJnZEt3WVZqcXlETjBxSHd4eGd0NHdlaERxSi82cjZ4?=
 =?utf-8?B?aTRNSDBqSzVpeWVRaS9OOStFc3lnZ2dhYWp6L2FqWXp4SHNxL0tDT0xXT0Fq?=
 =?utf-8?B?b25wc3o3eVhCZVRNUTRQd25QZjRTTWJDRXBraHVmS28vak5rN0JWeERIa2sr?=
 =?utf-8?B?b2l2Z2RZOXlFY09zTDlBcXhpdUk3dFBGTWpDMC9pejJOQXpXK3EzczJQdzNv?=
 =?utf-8?B?L01VZHp4c0RPdm0xRGpxZkdrTDlzWnp6VmVqYlVxb3Mvdm9nVGZZaGt2N3Jq?=
 =?utf-8?B?bUhuV1QwMythRlJpczR2N3dRUUdDY0JRenpvak1IR3hoNGJRZnBqUmlqemxD?=
 =?utf-8?B?aFBONGZsdFhOTmQvN1NtM3lGYmFCMXh6b3ZySmRLNmhFM0hBTTRrSi9lbnJt?=
 =?utf-8?B?OTR3RGx1L2Z1UktuN21ocHdpZEhDdERrbWZWbHNLYXBGeDdQdngwV280Nmp5?=
 =?utf-8?B?eWpWaFNXeW1TRDQvTnFpdEZGYzRST0dBTnJ2MVcvbzNpcEpBbEJoelJmdWo2?=
 =?utf-8?B?bEEybXQ2eVR5Z3NhdjJkS3NQdHZucXcxcWlBMndBZXlKNHNLTDlPMi8rQ0xv?=
 =?utf-8?B?UGVVK0ErM1JRSWNhQXRvTkV1VnMzNkpoc0ZwYmFwTnc0ZUhpd3BtK2RqdUYr?=
 =?utf-8?B?dlZUMUUyNnFBOE1mM3VKOG9aYVFNU2JXNEJuRS9XVjVSTnlSMnRKVFhQelpJ?=
 =?utf-8?B?aEY1L3hNWjJ1VEE5NUFHQVRZN3JKYmE4aTJoSDlDd2xlUmFWemU4TE1Oamwv?=
 =?utf-8?B?VFV2VWV5M0RQczJUMDhCZUo5d0dEQ3ZZNUxUeTdjbHNPMVdHRzZXRkhPdFQ0?=
 =?utf-8?B?SUdxVGRnUmJpK3d0SnZ0S1NnZEFoN2RPV0J1Q2drVVlIWTBnaEpWUENOeDRv?=
 =?utf-8?B?YTYvT3hZcER4WEx2SUY0dnhDMjl3U3ZnNEtQR3ZsR2I3QzRMK2lvMUUrbFFY?=
 =?utf-8?B?c3FhMDBZQzBCaUcwOGZJYU5NTkUwK01ubkFaSEdlZmZrYWthRHlNQ1FmdDll?=
 =?utf-8?B?VGx0amdKb2FGdm5aUEdlaHgxME5zb2x5eFlPcmRtY3JQcXNyL0VtcmNqMHVj?=
 =?utf-8?B?aUFHTWhrbnF4UDc0b1cxeDhhZXhPL0k2RkZrckhROVZITUV0b3pGb0Y4SjEr?=
 =?utf-8?B?eHhxVTRzRk5aSzZpTzd1SG8yd0xScEFBdThYVWc0ZUdHT3NzZTBhWU9NM1RQ?=
 =?utf-8?B?TTV2SlZLUFk2Q0lna2dmWFlxTkE3RHNOdjFhTHUvRU04ai9hc0RHQ2FwblVK?=
 =?utf-8?B?Qms2MFJjYnovSVJYVWpENENxM3lyWEk4bzdDejVtRFlHRTVyN3h5SlNRYURC?=
 =?utf-8?B?QmhtRnVOcTZZVDRGZnl0aDJMM21nalljNWpjVktCRDVGbWs5dVRvTENmaFVy?=
 =?utf-8?B?TEJsMWJUejRXTnVxR3FVWUVrZnE1ZTBiVDM5N2tETm5NU2xndi9abk43YVAy?=
 =?utf-8?B?S0ZKYjFHYzhOeXUzRld6TFQzZ2tlYUlxamthd0l0Tm9zcy9QRzJtWlpLdysx?=
 =?utf-8?B?bVJuNlpvejdzRDBzOE5FdmZjQ2lrWm1qQldsaVR5QVBkeWpld0toT0dJejZD?=
 =?utf-8?B?MU5ZVHQveU5EN1hFSTU5OUlrclp6d2tvZWFNNE5KSitVSjcrWmFLS09zSkVq?=
 =?utf-8?B?QXMzMXBWSVRRbHpYRmNkZjVMcGZ0YW9JOG5kOGJxSEJqTnl0TUkvZFJ5eFh0?=
 =?utf-8?B?NWRnVWFycjZTRFpic1lPczZVamI0M1NwRTRnWjZlMUJXVWg4UCt5cFdNWkJ3?=
 =?utf-8?B?a3VWdXNLckY4MHVYa3k2eXppeTJyc0h3MjkrQmVsZWYvUXdhbFNqaG9SUnZU?=
 =?utf-8?B?M3lub2IvS2NLem1nRUdjU3pRWXFFUlBJbUNGZGM0YXRrcnNoTnI0by9lOU9u?=
 =?utf-8?B?WTcrNmtSeVBDRmlBRXZ1Y1VQRUY1L2JhbXJtTjNUYTZkdVBTQlp5VUhIREhi?=
 =?utf-8?B?MzhJLzArcitwY1I3UzVuYnlGa2pCN2haK1RTcWZMZEdNVldBYW9PZmF5QzVB?=
 =?utf-8?B?ZUxlRkNpYmp4Vjh5bXAzcFFQUnBVb3owVDh0TjJuNjVvemNxMlcyczFOcnZM?=
 =?utf-8?B?RGh4NjdVeGhqNW5OVW9SaFR3cDlGL2NLaXdhUlgyeDNLS3QyK1N2bm81eE5M?=
 =?utf-8?B?d0xtelUvaktjbVA1cHVOT2ZrU08yMUxnbVJwT3hZS0pvZVNpbVlOTmRLaERv?=
 =?utf-8?Q?VQrou/mhZCg5ttSA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6fc475-7569-477a-1bc1-08df3fff1aed
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:21:41.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+jew+AuluRqM//FJSBm5zu/cVbGOJ2XvM6HnvQTDWC77ZuHhjp+dh6lMkDC1QwAPiltf8xuTwZbER2mb02Unyi6hta7PsH5eIv4wiBGOgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250037


On 11/11/26 15:00, Adarsh Jagadish Kamini via openembedded-core wrote:
> OE-Core no longer passes auto-expand-secmem through --agent-program.
> Document how to enable it in gpg-agent.conf and restart the agent to
> avoid secure-memory exhaustion during parallel signing.
>
> [YOCTO #16480]
>
> AI-Generated: Uses Kiro (claude-opus-5.5)
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>   documentation/dev-manual/packages.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
> index 380d806be..f05ade8b4 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -905,6 +905,26 @@ related to signed package feeds are available:
>      "ASC", which is the default and specifies ascii armored, and "BIN",
>      which specifies binary.
>   
> +Configuring the GnuPG Agent
> +---------------------------
> +
> +Parallel signing can exhaust ``gpg-agent``'s secure memory, causing
> +"Cannot allocate memory" errors. Add the following to ``gpg-agent.conf``
> +in the GnuPG home directory used for signing (``GPG_PATH`` if set, or
> +GnuPG's default home directory, normally ``~/.gnupg``)::
> +
> +   auto-expand-secmem
> +
> +The OpenEmbedded build system does not set this option. Stop any running
> +agent for that directory so the next signing operation starts it with
> +the new configuration:
> +
> +.. code-block:: console
> +
> +   $ gpgconf --homedir /path/to/gpg/home --kill gpg-agent
> +
> +Omit ``--homedir /path/to/gpg/home`` to use GnuPG's default home directory.
> +
>   Testing Packages With ptest
>   ===========================
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250026): https://lists.openembedded.org/g/openembedded-core/message/250026
> Mute This Topic: https://lists.openembedded.org/mt/122211768/10182374
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [adarsh.jagadish.kamini@est.tech]
> -=-=-=-=-=-=-=-=-=-=-=-


Hi,
Please ignore this patch, I will send it to the documentation mailing list.

Thanks!

