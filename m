Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C14C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:54:20 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.13])
 by mx.groups.io with SMTP id smtpd.web11.8379.1749131654762874797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RotPWjtB;
 spf=pass (domain: cherry.de, ip: 52.101.71.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjatPXsdbVaHzXje2phLpMg2kFIMI8TFkDnT/JBEJu8GaVcsmae0/fpBwZH8fz4to3mNlpPtcd+xy2YjWXXJB0IZNe1yMDKp+PFfQTW/0RizUT4oQn4GtUf2KCbOnC9bS1EKkqJ89HERuyFSrZC/I4uMpnag5yaWm3lWV27QBARrxjzlhcv6gW8vdytldj1biQLad5TTGLB6dYbj+nfCvrJ4z7Vp6AawlAv5EcpwNf858nAY63q6BcKbFpTr1PHC8LT7gBlLSRdvs8lvYB0QImThwutPmpbIkX/esPaxc0jneUMKGAs5i6EyZLPmovSLMA5g9uS3hVvHf722sLI7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDKQbR9g1FGJcDS4aGODAUSjOHPdN9wBG9/URHUxpVU=;
 b=v5+T9Tzhv2RJOs38xsfobpOkQyV8BgP3cZ7do6L2hNpsqerutoRHskKJFHFL8s9dOM+60BGh/g5Zcd9MDCivO7IuR9PcLw8X2I+Onf49z72lVxQeRt5r7+2uQ1em8BNxq7zg0cOl0KjHIbYHSpSH0nh366CQdd9xtfmTZcwRudeZFi0D4AeYUL4ra0Qud4Jn1f8LPD+7audUqNNKZS5hna+bJ14D4CXjkvuuEUUvXGpWOfKbaFD5mhxvwUVzXLaM9qVlLGgBqh9SwBD34Y4edXTmhC/gZBZmmEfHPLnmLzj10YmCnVmZHSqVMvaIvynH96ZwUQU7TxgRXjLvaRS19A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDKQbR9g1FGJcDS4aGODAUSjOHPdN9wBG9/URHUxpVU=;
 b=RotPWjtBPluBhVkUXSjEN3sh2fhozxtGEOauexSBaMZ6ZUEc9KC6wA0sH36GRkFTdvqJXf8iiIsaR7xjEYPulJEgxnhQVWM3HWoJ2mMtFYnAIBBjmfhTVmU/VoKNoLEvXaq+B0sBP+zOftQdgIeG4JvHNWAsoJ8ZzxvDuIXOio0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10473.eurprd04.prod.outlook.com (2603:10a6:150:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 13:54:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 13:54:08 +0000
Message-ID: <5621aff1-9f53-438c-a7f8-2acb66d52a4e@cherry.de>
Date: Thu, 5 Jun 2025 15:54:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES
 variable
To: dixitparmar19@gmail.com, openembedded-core@lists.openembedded.org
References: <20250605133429.367629-1-dixitparmar19@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250605133429.367629-1-dixitparmar19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10473:EE_
X-MS-Office365-Filtering-Correlation-Id: fd672db9-a29d-4b05-bdb8-08dda4387166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGR6dGFXK3llNk1yUndyQmNLclJIWThSUEpyZklWY0ViMXNFVG9mRkxYa3FL?=
 =?utf-8?B?K1FuK2lJRXc0WWNuQjJBZ0VydWhZVGFIcFBsK3RheTFLVGtTSVFwSWxCbG1q?=
 =?utf-8?B?bnJoUzlHeEdMcm9MTTBKWTNoRHN2NW8zRzNRRHJPL280Z2NSUEdSNWtiNGYx?=
 =?utf-8?B?NGVRblJUV0FtZHc5LysrUUJBQmJMUDd0VnhWbCtnWGQ4UHRjRU9NMGpoVkgr?=
 =?utf-8?B?S2k3WXBMQ3l2T3QzdFEzbXJTR2NsOVhLMklDK2Y2WXo0Q1M5d1pvN3V6Qm9j?=
 =?utf-8?B?Y1NRZjFhZUdyaWZaT2M1bXl6bzFad25XWW14M25GZko1VGxDRktwTlNVWnNO?=
 =?utf-8?B?Z2U2K0QwMEFZeUlyaFZFRXIxS1VJdktjZTVGTUJadlJTajJoY3M1R21YcENV?=
 =?utf-8?B?ZjdDUzkyajRmVkxrRzd0U2thcW8wQ3RjQXVOZ1BkUjF3NE5xdHBUVTVBaWFo?=
 =?utf-8?B?RnlTdFVnYTNqaWMvbmE3SS9KTENPVWlLNnJOOEZkeHRiQXd4aUFuMi9Bdisy?=
 =?utf-8?B?SXJoTHVmQXNPckFGYkVrUS8zY2pkc096SUU1QUJYWkpxMGo4MmpydkYvbVpN?=
 =?utf-8?B?NTFzZ0EzS2psbEMwYm9WYTlodHYzMjNjZkRvQUtXTXVBVjVnV29Rd2xHanlj?=
 =?utf-8?B?TTE3Mk9KZS9SVmZTTU5tNXNzVS85TmoxRmk5MEFFWE5PdklqWmJFQnBJSXJ3?=
 =?utf-8?B?bXJMZXpLTmFpRThRWkhWRVRHaGFBTnRwdXJGdWJIdHBKVVJ1ejdLV1pLN1pK?=
 =?utf-8?B?T3ZSV0ZSemNIK0VSaGNoRGlGK3krRnh1UkxWMWpwU0FtaUw0cnRPZkhyOTYx?=
 =?utf-8?B?NXdFeHQxYU81SitVQW9ybkdkaVg0Yktvd3VSZGpMTzcweTNWWEtBT2pmTlpM?=
 =?utf-8?B?R0tOT3RSakN2bm1YQnVNMEdocTdvYnBleHdpS1RMZkhYeGpQVnBISDZTZTVI?=
 =?utf-8?B?YWpUQ1VySXdZbW5QYW8wSUxHVjJMVDFtaXltYU5LNDE5NHlzckNDU2FFNVc0?=
 =?utf-8?B?UVFxbjVBbXpnZjc2UE9HQktTbFZNa29mMmpoL2JmU3BpUmRUWnNZK1FHRmwx?=
 =?utf-8?B?d3MzSmVyTHN0NFU2VzdPYVp1R0FQazFGVndEWnhXSldQdXp1VmRISXlIUmlQ?=
 =?utf-8?B?MUo0aGVYV3RzKzM4K2Zpck8rQjhYdWxpTk5Jdk5ONXlzS0hjRktMMmVXMGJS?=
 =?utf-8?B?NiszeURENkFTRHpkMFBoeWdhY08wUFAxemhwVjkzbHJsa0EvK3BycmJ2WVht?=
 =?utf-8?B?UGMvd01xZmVZZHZiMVlDV0VicDArS1FpR2JXc2hoSmF0bVYzdVBzZ1VxUFFs?=
 =?utf-8?B?VWp5djMvZUJ3UGdtOWswSTNISkZtYVhHOHVhMmpKQXpJSU9IUXJyS2JjSzhB?=
 =?utf-8?B?akp1cThhd3hSZmg0YWpzVnlMdjlPYjFZMzBreTNzK1FvSEgrdEcrcFNkcTl3?=
 =?utf-8?B?RVArbXJVdE1zTlZuNEI2Uzg5d1ljS1psMkVJNVh3WTNaWWVybEtzaU1DZElv?=
 =?utf-8?B?aWJKU1Y5Um4rbVZ6azljM0wxSktCVFhVSG04UXRzQjh0WDBSMC9zdmNUaERr?=
 =?utf-8?B?UGhIWVdmVUw3em4wcW9kdkEvTDRtQXhKaTNpU2VzVnBjeUZsRUhoaDk5Y0J6?=
 =?utf-8?B?dTcyZ0Zvak1UMy9uVzhiNFgwbVMxRXU3TDBjU3BUd3U1Q0VnZEozZ0JFZzUr?=
 =?utf-8?B?RGV4NDVBaTRIdndjUUYydjNsVldGM3YwTzREL053NlV1aHcxM0pVbVJVOUll?=
 =?utf-8?B?blhyU1d6M1A5WE5lTnk5Qis3bUJscWhLNThOblo0bWhtZnVON2o0cUZYZE9K?=
 =?utf-8?Q?ZtE7PUwAJdDblXBG5kB37srYYxZe5e0bBf0+M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M0JOdFhET281SzBrMDFSSFVWWnRudDZkd0M4ckNOQXMxUmZId3VXbGxGMCtC?=
 =?utf-8?B?SVZ0YW5LMEhMbjh0S09UUkp5Ky9icG13UnBEa0VWd1NkZVdQWWxpQW1yNjhJ?=
 =?utf-8?B?MXh0Z1p6RC96R21icTlNOXJTQVoyQW9iV3NPV0gvZjA2YmFtd0dQWWJpRXFU?=
 =?utf-8?B?a1M4eTA5VWFtSElSQU5ZUXBPUFZESGVsdWNxVktLTE81R0JPRWVZekxnT0h1?=
 =?utf-8?B?aWJGRVpmbkorUWNjRTI1M0FIa3hLTmFFTzRybGVBWnNlNXJEN0UvVlcxc09m?=
 =?utf-8?B?amd5RzlhWWJJY2xvbmFsUTNCTGFUUk9ReTl4T0ZUUmFsMTd3MGlKaVpZbGRH?=
 =?utf-8?B?OWxvQjhOWmh6bmVyT2xNYnN3bjJ1RE1aZTE5TDdhYzNoY1d4NWhINXZKeUUx?=
 =?utf-8?B?VHlSMUtOREZuZkxtVHhiN3NpQkJJVFpuc1dXTTllTDhjRFU1NU1URDFFK0ha?=
 =?utf-8?B?U3RmOUV0RC9aM2JrdkZOVnI5emFXQllUZ0lsTThXV3ZSaDlJWFh4RWdrVmR0?=
 =?utf-8?B?bFNKdGxFRFNYL0kvUkoyUWRSQnpIWmFVNzB0dkhoQW5XOHZGRmJ6cDYyOUsw?=
 =?utf-8?B?TTI1UUhjM2p3ZFhmYUNjaC81U25jS2VXWTVnWXF4amU5RTZkZzI0MHdib3Zv?=
 =?utf-8?B?WGhZYjcyVlIwNUpvWmVoSW9ZRGM0VGUrKzY2dFpLUkdXSWhOak5naDZiVHZu?=
 =?utf-8?B?eDc1NEtSVFdGSHJCejFCYlpraFdMUitYVVFrc3hhVjBVT3kyQ29sR3pGQjBY?=
 =?utf-8?B?V1pDcmwxZW40d1ZjUVVkdGExUlorK1RrbVo1dGprTmx3WWRDd1lLNzMyR29V?=
 =?utf-8?B?cGc1bmxZT3FjYVA5MjNQMEVvWFhWeWlPWGQ0SFlPeHZxQlF0MndrTjRxUGxN?=
 =?utf-8?B?alh1Z21mWWxTV2x1S2FaekVpcXd0QlF5YVhwQktVTTErclFyMVpCdW5kOVNx?=
 =?utf-8?B?UlAyZ3FFZU9jUW5Sd2I4Uzc5ZTVLOFg5Njd2ejAzSi84elZJTFNZRUtDWVZU?=
 =?utf-8?B?anJUZTlVcTV3ckpXRTFrdHhsYmgvdTk2TFlZdXNiRHhVQUV0Nit1SEdoZzVB?=
 =?utf-8?B?Q29FWGRQMHBTYXJXcVRaa2FSRzRKWFpHNjgrQzJEREpCNm9kbXYxbjR1SGlx?=
 =?utf-8?B?QlFscTVyK1U0ckNNbmJ3M09CVTRIVncvVGxXVVJZd2RMV0FHbzkzaW1aWDda?=
 =?utf-8?B?bXFlakpkUUVvOC9VeE5nKzJjVDExajI2MVM4Q0QvT3dRR1ZRZGtQOXZ5WmZD?=
 =?utf-8?B?Vnd3Q3VQSTAvQkcwelV6OGZMWDVObXI2S3ZZSmVFaXNZbUJEd1R6YXJ2Ujgz?=
 =?utf-8?B?SzhiY2daeURuWm55OFg4R1VNWU5pWWlXbk9WMHNWMGF2SFUyZjdtSkhTNUU0?=
 =?utf-8?B?VkpQS1Y4ZGVIeUhlZTFnSTZVaDV3WEdKQ29qZ1kyMVdLWmZPLzJBZUNtRUpN?=
 =?utf-8?B?bFRyOUZtbWdQdlBGVnEwVnhuZGRuZWhtZlp2cStWUEsyZ0NyemhBSFQ3N2R3?=
 =?utf-8?B?N3Q2UWZ4MnM2Sndlc2ZPcGJxUXZOc25RQll5b2Q1YU1STlUxRWR3T2V5Zkth?=
 =?utf-8?B?ODB3T1pzc2pkL1ZrRDRKNmU4VzdTTEliL1ptQnAxU3JNeHRGZmJzTm5heCtn?=
 =?utf-8?B?YUlWdHBWRTI4SktkK2FHYmdIRythVU40a0xRZEpidzNMTHBxZjF3RGl5MGx1?=
 =?utf-8?B?aVJJSm8yZ3BqbWhJWHlPN29IdHJLQTJpMGZ4eUdpWGc3TXRuaXFQbmYxNXhO?=
 =?utf-8?B?cEkvdFJwZElsTllBejRmcFptRFZVTEZHVjlJaHlSNmM3Nml3cUt1eCt1ajEr?=
 =?utf-8?B?UHRCaDg5czhpQWpSRkMxcEdPUzBuUzFQMGtuWTRIZ0NEbHFydmxwdUIwUGlN?=
 =?utf-8?B?T3ZZRitqRXRCTStHNkRNRnlvYlRMbnhaa0k0VmNVeG81N3dZSFM3S1BoNFhu?=
 =?utf-8?B?YVJJbTIvalBxZmFyRXgrV0c1bjVPdUViYVowOXVPWWkzKyt5TW5zQU9ObEJ4?=
 =?utf-8?B?M1UwVFVLZ0xXUmhzTXVhdVJBbFR6czVxY0taNmNoZFNkblhhNFIvM2c3czdh?=
 =?utf-8?B?aC9IR3lnSGhNaGNmT01Hc2l5MUt3MDg0OWdSYjdMcEsySjlxenRqTHNOWGRT?=
 =?utf-8?B?Yzl3R1FwTVFkUTdOTSsxcnRFK2xtNG00UDk2eU5aVUJRWVVvdStrVUZMMXY3?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fd672db9-a29d-4b05-bdb8-08dda4387166
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:54:08.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naRXBNd9qA0kHViGoWOTNJuoT+OkKn7BHP01gwVB/XX+aKnc6mK1ISsy+r2pNMCvW4AKiMejCEqBFp6Eks6LfvQBN5SDQZnTwqvkEghrRBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218023

Hi Dixit,

On 6/5/25 3:34 PM, Dixit Parmar via lists.openembedded.org wrote:
> This variable controls the kernel module spliting.
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 9 +++++++++

This is for the yocto-docs mailing list.

How to know?

https://git.openembedded.org/openembedded-core/tree/ clearly doesn't 
have the file you're modifying, so not OE-Core.

Now... poky does have it, but the documentation/README says 
(https://git.yoctoproject.org/poky/tree/documentation/README#n406)
"""
Please see the top level README file in this repository for details of where
to send patches.
"""

but in poky that file doesn't exist, though README.md specifies:
https://git.yoctoproject.org/poky/tree/meta-poky/README.poky.md#n57

I'll work on making this easier to find out. (Namely adding the 
contribution information in documentation/README instead of making the 
latter point at README, and making README a symlink to 
documentation/README).

Will review once on the proper ML :)

Thanks!
Quentin

