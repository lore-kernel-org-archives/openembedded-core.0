Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2FDC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:27:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.7192.1748942850755141663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=awzRKVwY;
 spf=pass (domain: cherry.de, ip: 40.107.20.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3cNsGyuQgiW8rYw2cgKdHWh6nzqedS9Bgpfw0047I8Gxo13GtE4uJjXrULlPGdZo+77KSlKCJxortFCiWboZ6J+28jKKrliTtW5zd5fgrMA/HgFnqH0V4C8Jvxa9CtdneRH1tfZeM2gCDTYwv0xT5/litSYVqI4PLFSTazEtFS3cmD5dKipFnPOUA1rxq6oV88a9Rd0Y0li2loiTtE7lXqm2rgEd2kQpPitEQExjFlC9iqGbFOHYcs3V5rDQySjD9IIH0bHMmaglj1XUZwZKnNN+XmHpm+XWLcVm5voxF2euEXOux/7lW45qaIoJPCf3rYQ3tkKsybSMqgpc1o8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNlN1tB6ReQqFqo4b2FhU98QvUA0Oh2GaSP7x0FJNjc=;
 b=nOOSVJ331bxH5Cg+rRy5/XW3rOrW4O06tgB6RIsS6kexrPiRdSq/LKDp2g/tIxDjN30IEkW6Tx+3SOaZK4aWAmAttZqpn7ao65zjkeV4mZD08fhpJ666mXj3sQTuCbTYMYzwd9D7ukcNWBjkPtuS0GMcVQ/HEmiGk3UvToWoxl+KR4hUSP/KZ/+/knGw2O8cKnGkNeUnyXPbvRbrMoxm8/pBVXnpc/QohGZlG4U7ZfgYPil/qhk/jaITzkMm7F9kw1i/KXunszVtQtf2QO9pryZVsSIqYS/I0yPtCbpCAYMybE4kGci9x5rsilTLnDS6faGFh7KDwEY4oL6XvYx+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNlN1tB6ReQqFqo4b2FhU98QvUA0Oh2GaSP7x0FJNjc=;
 b=awzRKVwYtVuFk7HEuNXQfubtbmrTKYp7M1cz77OJ41VQgJs8Uk3lXv6jVqtrUVpamXRDUbpmi0Jczz0LcEdW6q45iRf4CLL2iEAoqudI6xOgkixWkifbv48QLteSoNGc7VbWJy7wUiyLbZHah9Ec673InzLIoNbZjHAgZj8SvOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 09:27:25 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 09:27:24 +0000
Message-ID: <166b439a-86cd-4bef-816f-c016732236da@cherry.de>
Date: Tue, 3 Jun 2025 11:27:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] util-linux: Improve the package licenses
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
References: <20250603031425.2206714-1-pkj@axis.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250603031425.2206714-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VE1PR04MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd4a586-6817-42f6-aa08-08dda280d9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWVTQjNEV3JRbGVNY2JkYTJQSXlYbFgvZzVHY01mU3BZb1BwdU1oWSt1bkgv?=
 =?utf-8?B?Ty9oVlQ4S0xjU1B1UVcwUE1nYUhtNXdiWVZjTXRaeXBVNVkvb0dXTjdKTnZU?=
 =?utf-8?B?Q1MzSkY1RWoveVltTmJRblZ4QVlIR1M2MXZDWXd6NU1TK2FxRHozbnl6S2Rz?=
 =?utf-8?B?Q2N6RldQOXlJNWY4VUY2UXZaMlJkSUV0UkZnTStFSDgrbjMyV3UrN0RQOEox?=
 =?utf-8?B?K212eGVoMC9BWkpRY05XclJMNUJaNW1NWk9IaTkwdXZyMktSenFIc2xUUTQ3?=
 =?utf-8?B?cEJQcEhjNXRvM0dDaWpjd1JQcm1yQVRsNkI3ajBQY1NMZjBSZ1JiTmtQSDFV?=
 =?utf-8?B?Qm4rbWluTUxGSGY1SU1reGs5UlpXakdQV05IdWg3MHU2c3FQdFAzR3BKSm9s?=
 =?utf-8?B?UTU0ZmhHNDBNbHV4bU5sSlZzc0FjQ3ZoUDVQeWI3S2dBMUdsdWYxWVZ3UjMv?=
 =?utf-8?B?RkdYczlQNjh0bjFPeWtiSGV5UmZzSDY0cWFtL3EzVnBXWkJlcTVsK2o0ZzVn?=
 =?utf-8?B?UVliajkybHNPSDdKSVVwczlaQXRlL3IyTFFlTGxtSHk1YUpNWFp4UThaSDcv?=
 =?utf-8?B?SlovRHVRMWh4MDMzN3Z0VnJ1MFVXZVdJaUplRVlzWHRac0F1VnBRa3NuNHQz?=
 =?utf-8?B?SU16UDdDaWtIbmprWDQ1NUdUZTd4YkpEck4xNGQvUUxSZHBkWStZMWNGWFpR?=
 =?utf-8?B?R2xwTkZ0L1Q0MUt3QUZQY05QNnlabTBUS01IYU1CV3drUnN1c2krZEZtcFBa?=
 =?utf-8?B?RXY0YUlLaUxwZGM1bVFiVjdHWXMxRGJyaUtidXdrb0c0M3NZQnMrY2M2WW8v?=
 =?utf-8?B?Rk5rZGFxUDhmZ0hKdWdpR2Y5VjFlUTh1bERETkpOTXZFRkhpUFVtRjV1NlRP?=
 =?utf-8?B?OCtvbGNSeXBSTGo4bFF0VkxkRVlvWnVwL3FSSnFiL1llZnJ4cVJGcEt5d2JO?=
 =?utf-8?B?dGFYaVBJTE9GZVdxNVlqanBFSkxxbGVyRElkUEsvWVNVVTZsKy83Y0N2TWI0?=
 =?utf-8?B?Ylh1clFsRlBSeFZLZkp5NmpaaDlFZkZ6K252bi9sbndtYk44TzUzdXRWV3NG?=
 =?utf-8?B?VVFaTlVMZ0s4OVlCS25zV1hqcUl3LzRWU2EyTkRZMGZ1M2lFWFlwNERhajVW?=
 =?utf-8?B?M3pFOGFBcVFXd3V6aHUwVisvdHE4OGlyakxPU29KRGlrNnJkVWFVc0pSSEhm?=
 =?utf-8?B?cjgwdTVLdjdYemFZV0NoR2xSR3VYdytlcGJnTkdaNzRoc3JBTVRkMnUybnk0?=
 =?utf-8?B?cDVFYlRSQ08veStLdVZqNVhBcDdBSDFseVZlZDZGZlZvM2VBVVdHbzlKanpa?=
 =?utf-8?B?T3NvV09zT2tvWjVuYXpvUys4anZRdFBUNlFweG5QdFdVeDVYMWRvVCs2Ujhr?=
 =?utf-8?B?Lys3YTU5Qk5EbDR1L1hTcSsyM3ZvNzYvM2MxallkdkdpMXNtWWQ1VlR5NXor?=
 =?utf-8?B?cDg5NDM4aWw5UmY1enhaWXk3a3RtNUJGTTA5RmFnYXhWT3E1V3JHUnpyZHlC?=
 =?utf-8?B?VFBXeGx2UG11L3NtZmFUb05hYjhYM3hqeXhrT090N1FoVkZFaWhGM3F1SFpN?=
 =?utf-8?B?OUpwMkVjUm11Z09WcGdjcUJMVk5xV25KUmM3RXU4M01heVZ5UklHOVVUZ2Jv?=
 =?utf-8?B?QlJoS0lzbm1JTVEra0JmVnN0aHlUZkc0QTBIL0s4WDdBck9LcEVhMmNrWUdi?=
 =?utf-8?B?V1dLYXZvNm5NMjEyNWllTUFWUW1vcDVEOW1aalJjRmkzelBYN25ZVGRqcm1E?=
 =?utf-8?B?b2g5MzUvT2FoNk9JMTQwemxQMXY0MXVHSnFRSjB4dnF1amFUWUxCR21iUlpB?=
 =?utf-8?B?L3RwRjk1SCtocUdKRS9CdHNmb3drMHhrdDVCRWp4K2VtNnJLbWd0NjFvTnhl?=
 =?utf-8?B?eEd1U3ViTDVpOTBBaEMzSHJpekNJMFUxUmNHSU1RZjZEMVNsdElzM0lsK3hs?=
 =?utf-8?Q?ZQifPKjGBFo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWFKVm1PYTJzUFFKK0pnajh2akN2ZzEvdkRwOXhwWmZMaU5VN1JCOVhMQzJL?=
 =?utf-8?B?K3hObnF6MTQrSk9JSDgyTmRaQ2pDRTB5bHBlLzFzaHVrMmVBbjFSOEtTUkUw?=
 =?utf-8?B?UWo4bnNmTWpzY0ZMZ013RXpFZkVPSTBlR0ROV0pzU003Znc1WlJ0NzNMZm1k?=
 =?utf-8?B?UE41RHJHaE1pVlloaU5XaFdmcUQxN1JuWGpJb0F5YlcxakRoc0pyZU9oTGto?=
 =?utf-8?B?akNXcWZ2TXFRZTdqbVJCWlJEemVJa2JYa3ZndnZUWmtGYzNrK3pjU2hkMTlE?=
 =?utf-8?B?eWJCZjFWNUVqdE1uUW1vdHQrNEIza2lXVmxVbHFobEhCMllEbC9RQUg2UUJJ?=
 =?utf-8?B?Q3ZPUWFxQlZ4VTIzM1ZGdmVzQlY2REpRcFNiZDRxWXR3OFpMQUhpUmp1N1N6?=
 =?utf-8?B?TUdFRUdMK2M0MmlrT1Q1M2NQWWFXVnBPMkt2OVZoU1hhV0NOMGtYcXV0NUsv?=
 =?utf-8?B?T21yeVRVRlZOUjlNVy8wQzdsRnhkdmFiWDFwbkNic1dGU0dnTmlRSGlFalNw?=
 =?utf-8?B?ZFBOUlU0UlVxSkN5R2hsclVHYW1TOC9TMjloeGxHV2ZTNXlzZVpIVTZPOEVa?=
 =?utf-8?B?bU51QVpwNmlzTmVsVVZTeFlvME96enE1WFhsS1ZMMUxsMzdYNWxub25sYXRy?=
 =?utf-8?B?aEQyZkd0cjgrSWhBRFhWbHdGTEJkZ0tBdnZURGRxZUcyRkJGb3pnWG5pelBF?=
 =?utf-8?B?WHlTb1owd3B5QVpiQnMwMWdaQ3BkZGpPek45dUYvUDJPSzdnZU1BUkNLZjVO?=
 =?utf-8?B?Mkp5WnRKYVBZVEo0TEYydnlEdEhrYUJZSlVkbm80Nmt4SjVVMm85dWk0TjlW?=
 =?utf-8?B?T21pYURiSG90UmRBMnFLdWNiak9ZMStEUlkyQ05aRXVIMW56OGNaOHE4NHJk?=
 =?utf-8?B?MzQ5VXhDZGFtY2sramxzV0k2YStZY1EzMll6R1BUK0wyMnZFb0tSbkxVN3px?=
 =?utf-8?B?Mm45MXlWdXp5QldlTFYrdWtQZ1d4S1QzVTYrcHFkcEwwSmdNZG9qSHMyRjgw?=
 =?utf-8?B?SGVOQ3JDcnM2bURybG83WGp5dHJETFNpZ3Y5Zm1LNmZuSEJUYnNZOFR2NFkv?=
 =?utf-8?B?VHF1WXpib0dwOGFhT1phTEtuYUo5ZkRhUHU1WWJXM2djRjFzaXRZTFo2Q2xS?=
 =?utf-8?B?Z1Z6RFdlUE1jQzVSOHd4ZXFMWFAwZUtIRHVDMXBBc0pJL3c2QTVsbHZ3K09a?=
 =?utf-8?B?RmwvVWVQd1VRd043L2ZKQXRjYWZEZk5ndWp0V01uRUxPY2dNeklhVXlBenpN?=
 =?utf-8?B?bWU3RUlqNG5POHpuemczaVJyMEt1VWN4VzRKWEsxMzVzSy82OFZZZ2RGWU1F?=
 =?utf-8?B?VExnM0xac1NVbGVDUSs3bU5tRm15dlZwbzJOay9HMHBrWVNNVTdGdGxYVS9T?=
 =?utf-8?B?WXQwQm52TjI2RHZHWDdvNTFla2p3c29ybUVlWlFqbCs4TGh6cWpuYWowVDN0?=
 =?utf-8?B?dm5pNzdhS3BrZkxGM0xvdFhwdVYyY1BJY2VVU2JrbzZxditCWTMwUThmMFow?=
 =?utf-8?B?Q1BvWEN6V2RKY3MvNXJ5MFRxVkhqdENVT055QlQ2aFJ2R0ZJQ0VBdzdIOUgr?=
 =?utf-8?B?MlNMN1ZBRFZLLzRPUitQald2TDhSOGxZS0xTTnJudTFZQStUbjZaSUgxTTRo?=
 =?utf-8?B?SlVnUW5lMTdaRXBPbk9jTmVlN1VQdW4vZlpuSW5QUXZQdG50QUhGZHpBWkh0?=
 =?utf-8?B?ZUZzU3Bpem9ycXJCRjNLNTBZWE1wamFhWTM3OGZDejV0RlBjV2ZqUlRzUSt3?=
 =?utf-8?B?MlE4cW9MZDZzTElGZUxiUU83aUN1UGdQNXZVSGFQRkhuM0huMno4MllBaXVm?=
 =?utf-8?B?dzhQVVJBU2hhL3pIN3pNcnZWNFEzZlRocTFRdHZKd3VzU3VCL2VzNER4T0RL?=
 =?utf-8?B?SWovV2t3ZkhHUDd1Lzgxd3NDa1RoYmZPNXBqRmYyN1FETWZrT2EyUWsrZjM2?=
 =?utf-8?B?OUt0SWNidWs1MnNkK2UvV085S2w2SkwxMWV2czhpMkpMRTNkdXRRYzNRb3ZB?=
 =?utf-8?B?NUthN0Zod1BSTk5MdWFDc3p3Z1BkakdUOWpLSXhsdDR4SFVSTjJheHdDWEpC?=
 =?utf-8?B?d3JGcURlU0YxQ1NIVWxBTUhmTENkL0p1d3RhWEk1QUN2QmErRWFjVkZCZWZx?=
 =?utf-8?B?VWxkS1FmWVBsamJOaGVFY25BUTRxUWRZZUt2Q29lS1I1TnhRdTRrQnEweWlH?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd4a586-6817-42f6-aa08-08dda280d9a5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:27:24.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on8fc7tOnyQuRFtY3ju9BUWRy77Q6faUXVgrJ17k0pMY6G3cmVjXQGG70I4B4mMeWEgKNR2fXgm6ppTM6W14I0mlJ4/BxnPzxtHX4r91KOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217794

Hi Peter,

On 6/3/25 5:14 AM, Peter Kjellerstedt via lists.openembedded.org wrote:
> The default license for util-linux is GPL-2.0-or-later.
> 
> Most of the applications and the libraries are also linked with
> libcommon.la, which uses these licenses:
> LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & MIT
> 
> Set the above licenses for all dynamic packages, unless explicitly
> specified.
> 
> In particular, this avoids setting BSD-4-Clause-UC and EUPL-1.2 on
> packages where they do not belong.
> 
> License-Update: See above
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++++---
>   .../util-linux/util-linux_2.41.bb             |  3 ++
>   2 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index b0f2a9d497..bd7ad10035 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -6,14 +6,43 @@ disk partitioning, kernel message management, filesystem creation, and system lo
>   
>   SECTION = "base"
>   
> +# Most of the applications and the libraries are linked with libcommon.la,
> +# which uses these licenses

Is this something we can detect directly within the binaries in a 
package, so that we could simply add those licenses dynamically to 
LICENSE:${PN}-x instead of having to list them by hand?

Packages without a package-specific LICENSE will take the recipe's 
LICENSE I believe, considering that *.la is part of the -dev package 
should the -dev package have a "more precise" license than the recipe's 
default?

Cheers,
Quentin

