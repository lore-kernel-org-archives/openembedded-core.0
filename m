Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EF8C54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:29:52 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.50])
 by mx.groups.io with SMTP id smtpd.web11.75401.1724758188414780181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Q+Z8Nzds;
 spf=pass (domain: cherry.de, ip: 52.101.70.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFYRnrfALYPx/sbrg+sQvDBbbnnYp635eTgPmUXW96EiNH27OPFrdE2puhMXP6bNzRpLy429eZ6xpZ6NzzESh6c6Q6R5hD5Y2DYKpW/LGlzoUrOgg2uWn1GnIxuICeMF2qwjSW2jRiHditzOXk7fo3b2UD6Lp6iDHaeATgNjckFJbuHqvQmRs2UdfRgajZS709coHkLST+qCgqB3PHYfWhAPSp8NiLcmaldO41YiADUIEP/u94HJxjHZEYIOUiZzPwMSISnamixrfxsALwi/PZOlHBjUMhV8dYv6iRiiUgADWHPTNYCa9dClB3R7N1Q7OVxaqzycjB/MfZo8LvrWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3vI7vSSM64rDHdNS52a9j+G22ISALOp/qti9XM01qA=;
 b=DCChuNyyQV44zpe3Qbz7P/aIcOLcmFUeyD339hBQllagYB/GD2rq/cBe5V8xQTxqkiyl4Ey9hgmmCuGZwSX/ZLRStp2OrzxFn/uIQWJcXnfpOtxWI8PNrKZwWmtncUTG5o5eesz//mRE3vSdIXK3xAeejmsTWwH58MuBaP0GO5uzAEMuM8Ju6gC+eIqFm7HApEIpDK93xgdRNdmjJcinD2INb5xPu2Q8M4Xk14NW6i3xo5aWTO3jkVeCHBIdDzDw0kkql6eskgFwGrJCv3OzOjr7KlDscKH771vlID7NS/cbObWoocozQieJftWATOqPc4zGsCAcdrAtNDrNt2dAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3vI7vSSM64rDHdNS52a9j+G22ISALOp/qti9XM01qA=;
 b=Q+Z8NzdsgmjPHi3cJAb+KkKkxrY9xUTBMGyqTujIZI31U7+e8srUSYQt4aVRR7x3L9PrRT2p0gr8RujmhNrb/azF777qxdesYJAuQ1v15qIvsBSAgTMuV3HW3vDRvLhi8bfnztNyHwR3gxtWUud8nG7tCZvVcajS8wo8/9CrgSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 11:29:43 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 11:29:42 +0000
Message-ID: <ad2dfd20-4471-498d-a733-61334230efd2@cherry.de>
Date: Tue, 27 Aug 2024 13:29:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] linux-firmware: make
 qcom-sc8280xp-lenovo-x13s-audio install Linaro licence
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
References: <20240827101232.127612-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240827101232.127612-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::18) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: f8077c91-7891-4382-62cf-08dcc68b8afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cWR5RWJVRmg0SG5KU2JWZEJ3SkNJMUtEaHpKbWRGUmxTY2xlWi9jMDAzWVpa?=
 =?utf-8?B?WGJLUTcvbmo1Wk1ma0JNazlFck5pVVE5Q1YxeWJQM3gzclN4NkhSdDRkTjF5?=
 =?utf-8?B?UUpKVjdEdkQwZXdlQ2RHUVRxM1pDM2FUWjdhSWJjczllbTd3K2VWblZJY1Bi?=
 =?utf-8?B?Yndwb2FZZnJTeWlEdndRTzNMbTdPeWNDZTYrMVQ5SFZsd3RKcE5qU0RoM1cv?=
 =?utf-8?B?VmV3UzZUOGJVcUw3THpwMW54QVpFSWZSVCtCU21lTjl6RUM2M2hVQVptejNL?=
 =?utf-8?B?aTA0N2ZxOC9ybXIrSFk3dXhCbTd0UGlubk1sS3V2Z0lUOEQ1L1hydVBONkw1?=
 =?utf-8?B?am1KMFVVNDhOT3ZocEMxYTluYytrUjFLMTBZa0YzNjFNYjIvbWdnaU15M3Vr?=
 =?utf-8?B?NTk4YTBwdno1MzgvSFJoVkJrTk13WUgwc3lqZDVnclk5dTVuNks3blhaY3lS?=
 =?utf-8?B?K1BoajZiZUJmNkZZNjBZSitwUjlNb2JRdWEyQjg3dnpKek05cU9EaXZaYjRU?=
 =?utf-8?B?VFFjNnFhYSsvZXQrdTJDY3N6NlNBYzZKMGswN3FVc3VEWFF0WmlVczA0cDN4?=
 =?utf-8?B?dWxQSm5LbVVkeVJuZlJCNU1kWFQ5VU9HYzg2RTJkNXZsMFU4THh0VTdtczNv?=
 =?utf-8?B?WkV3dUViNWZjcU1yTEZiVjRqSWxwUTA4bGU5cW1zTUkxbkt4RTkzSXJKcmxu?=
 =?utf-8?B?TlBYY25YVWpPOXluaVFLSXNCWk5UQW9kNnNhZUxpYmY1aE1ibU42ditzVzNs?=
 =?utf-8?B?Tnp4a2ZmTjRHL2hYTmhWdVltQ3ErQThzOG9JY0ZUMWtMSXpjT1lCMU8wWXQ3?=
 =?utf-8?B?VXh6MmRja3pYQ2RXWlJRR1dFcWdqTDlvYU5zK21ublBXZTRqT1BTNlRMNVZ1?=
 =?utf-8?B?RFIvcko0RTdnM0FyRkhvZDYyZ3p1T1VrcHhqQzhpZ284NWVlWmF3eGZlcVV0?=
 =?utf-8?B?Z1ZxanphMjFvVVhjMkRsckh2WDhnWHlsdGRpd3phbmg0WGNlR21RTHBPQ3Bu?=
 =?utf-8?B?SnN4TDJWRGc2MmxVYjFSNm5lUmNELzF4cW5qM1ZwL2pFU05QZW9RMTlrUU0v?=
 =?utf-8?B?Q20vMmZIblVOY0FPNzJXNUowaUI3YXAyMTkydGFRbW0rcVp5M1VSL1VsbTRE?=
 =?utf-8?B?STFkR08xNW96RXZ1Q2xtOHBvVGdrRlVFUm5yMC9sNzlXSExNT2l6ZVBzQmZk?=
 =?utf-8?B?RFg5bmRiUFFTb2lKT3JvbzlPcGc3aWZSUk5relZ1YWdLT0xtSUdRMDJEVHpH?=
 =?utf-8?B?TEVzb2o5elZoMzlFd1l6QlF6L2MwOG5YbnBiOXJQT0tGQ2NlcEkwQ2NrRWNF?=
 =?utf-8?B?NjdwM204QjZQZHI2L09SU2JTL29oRG80cklnL3QvaWJHU3BNYTdsd0lkNFl2?=
 =?utf-8?B?QlZra1dWZzFsWVdEeVNTRTlFMFBiR3VGVXhUQ3EzSzFtWCtUQ1l4UnZQYmxw?=
 =?utf-8?B?VElPV3BlUkt0V0RRMjZyZS9pN2tRL3hsSUNQNVBFMGI4QmJ1QUlRTnlqQjRJ?=
 =?utf-8?B?dTBaSUgzd1prVVhIWSswdDhVaCthakZ0R0JhczRtWityYjJwMlBaVXFRQWVh?=
 =?utf-8?B?Nk12THB0a0tjbE5kbTBnY2FmdFk1aDBSSnBVQ25KdXNCQXVmZDRhRlBuSnVG?=
 =?utf-8?B?RmR2SlBzU3lES2FhQ2J2NFMzOERJblB1UjhRM256Q0x2U2VTR2VIVlBEdW5n?=
 =?utf-8?B?OU5UeVlkMmhjU1p5aWQva0VEZFdXNks5Z1cvYWhyTGQ2OStESG1OdFFHYWtI?=
 =?utf-8?B?SlNZNHdUTDM1ZlJtS1pGdlZPeFkvejdUbjRtOFNyNVkveXhTNUVMNmRJYjBZ?=
 =?utf-8?B?UUV2K2doSEZGVERZZ2NrUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2JBQ3UyVHJJWVhKMWZaeVE2Zldyemc5a1l4V3EwWmxpVFdRdUFPMXRKNkRa?=
 =?utf-8?B?cTE3Y2JOVTM0K3QwZGtxcWduS3ROcG5yb0ViOHc4elovNlFZU2hvdHZsbDgv?=
 =?utf-8?B?OGNUMXg4Sm01T2JuTTBvdFBCWWJsckVLVklvcFdrNGVMalRZNXRtOTVxN29x?=
 =?utf-8?B?SWR5YmhYNWJSVGRmYkRkTlNIa3I5RE5PUExBS2VlVjdnL0E0VkUveHlLMTNi?=
 =?utf-8?B?YVJjVWlQQVJTQkZyWkxMNFpQb1U5L0ZNeHRnWFNtNEJtaFo5a1VCS2RwRlNr?=
 =?utf-8?B?QitkTEQ4b2NkUkJ2TjVpQjJSVUdPWStUencvMno5Mlg1dXYzYXY2RmswQ1oy?=
 =?utf-8?B?SGlTMUVqRXpRSjdaaXVTbkVtL3E0L1pBcmZ3ZW1oQjNVTnpOR2NZUk9NSXFR?=
 =?utf-8?B?NzhGZ3hXMzkwMEYvZ00rRTJOeTZZa1RTYk05RDkyMEZhNWtaNGtOLzA3ZEl0?=
 =?utf-8?B?dDVtWnBmUFlValdnVEFtdEV0NXE2VTlCOXpCbFh1TUd4OElPVXdYeFE4NHRI?=
 =?utf-8?B?cGFjOHlSTUh2dkloL2dFVnlEeklWWWhVeFNPRnU5YUhYM0VvSGhxU2trQm94?=
 =?utf-8?B?SEtRS0VsL1RCTjErWXZZdVFTODRieW5QdDNDTVh3NW51ZG1NS0R3Z2d5RUJp?=
 =?utf-8?B?NDMyY3BCeExvZ0o5MTI3bWlyTk1lQnNxMG9ZMUlIR2Q3K2ttbHlpbEZPWVJy?=
 =?utf-8?B?YzJVeW56RXZZaXRyOFEzbkRQV0szOEVnSGd5anI4Q2EwbGhDQ1FWOGcxMmdl?=
 =?utf-8?B?b0U0UTB5RlBsdFl2ZDNKeEVSVVBjdTFLdHE1SUQxZ1M2M3p6SFV3RjN3R0RY?=
 =?utf-8?B?NHBic29paWJha3hMMVB2bi92enlTUXNxOExxYmpLM2NwajlEaGFCcS9pdkpv?=
 =?utf-8?B?ZjFxM3ppRVZLSXJaSVhLUk05Kyt5SGYrQ2hvMmovdDFZd3E5ZWZKaHFFbHZo?=
 =?utf-8?B?VUhUYXZpSzQyS3QxYW5hZGdXNFpJRnJKUk1ZVkhLckRnVkVGR1NyZ3RtdXU4?=
 =?utf-8?B?cnc1MzkvZnJrNDE0Tys4NzZORkg5SzhFVDFUMEJMY0d3Sjl1Q0hHN3RFZ0ZT?=
 =?utf-8?B?MGE3UjBVK2xJR1VhZ2dVNnJubFZTVzkvYm13elQxYld2WU1DN0RzTTVHSmV3?=
 =?utf-8?B?TUZobHVTZGtYaXpyMlp2TTBqVTRPR1hrQXBDZnZLN2w3L2RnL2NWbGhDNVk5?=
 =?utf-8?B?QXZnTnRBTGxad3IycUdzSDFUL21NbmtiTlFaN2VpLzREdE4vREdMRW9QU0h0?=
 =?utf-8?B?T3lBQndJaFc5WnlyUkZOZHErdG9XNlJkZ3lNZU1TaG4zaWdlZHoyMHNhSDNx?=
 =?utf-8?B?RTRuUWpQb3JoaG8yMmdwQXJPTnNTV080NkZNZXIxLzdIa2JQYlZVczNGam9V?=
 =?utf-8?B?TVZWN0w5WEx4TnBEUFV6dlVzeDhtcHIxekxQUUo0WEFubW9janIycjVNWWNr?=
 =?utf-8?B?N1lwM2d2TDZSWXUrRHBpVXBLeUJlcnduV2pHcHJOZTdaeHhYQ1Q4NFk4eHAv?=
 =?utf-8?B?NGZQWXJqODdEVDFrZUQvckZSc05NanFBTEcxdU5Bc0NDVjZMUUFhRXducjVr?=
 =?utf-8?B?bC85cHU3TE1nR2g3azhKOEdMeFgxZHhhRUlJQjRNT3ZlVk5oUjNLY2hGamhn?=
 =?utf-8?B?cVVGaG43QUlsbTFGdWpRd0tjTHV2RytpMU56VUFObUdnem5wUWZlaEsxdUxR?=
 =?utf-8?B?cy8zdHlRYVBrbTlqK1hOaDBmKytTdkE2MkhWNzRydU9nanV0RXJzbnZvUWZK?=
 =?utf-8?B?VGVuNjN5a1NUS3hCL2JFclV6WW1qRnZJNzk0NlhYaDlBWXcrMytaK2YwQ2pP?=
 =?utf-8?B?bHprQ3lqQ0RkZDM0cURjTi8rb0xmZEhheEtLTWpFZkRRWlJjOEc5c2RycGIw?=
 =?utf-8?B?QjhOWnV6VjA5Mnd4Z2RZMjhRRnNHSHYxcW9FRU5Bd2FvNnFKMmZHYmpCcjZW?=
 =?utf-8?B?NnNMeWMzMlM3TlVoSTVzaGw1L2tHMVNYUmxDZzBkRE1IME8rMzJjc2FjRGxC?=
 =?utf-8?B?eis2V1lkek5pODRTajlxUWRadUF1QmJSbTVIcDVYcDU1VjFDam1MZ0FmVE5F?=
 =?utf-8?B?UTFHUlkxREw4NENIRGV5V25qQmgvT3lsQzh2QzFTaDdGUU9Qa1Q4bW0wdE80?=
 =?utf-8?B?SGxtV2tkNEpRdmNHeDRQLzMxejhzdXFTWnA5N2t3NWswdURvdzlUM2s0WXFv?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f8077c91-7891-4382-62cf-08dcc68b8afa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:29:42.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSzYcBy8CeG//RcoyBWFAwY4gp8D1hIpHgHek2IoFfUGt65q8Ax1Yut4E1DHz1xtVRY/Y7r24VHUxZ37wj2VIUuL4sxjPrhoxiuVmuDUXDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 11:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203830

Hi Dmitry,

On 8/27/24 12:12 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> The linux-firmware-qcom-sc8280xp-lenovo-x13s-audio package includes
> audio topology file which has separate licensing terms. Make this
> package RDEPEND on the corresponding licence package.
> 
> Fixes: 958d6a209edf ("linux-firmware: package audio topology for Lenovo X13s")

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

