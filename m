Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EA2C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:27:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.web10.18195.1738326456297870789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dcY+rzBp;
 spf=pass (domain: cherry.de, ip: 52.101.66.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYxlS/DkRNFvCVvYd+xRCVH9dXNSz6K7d70PgjAoD0Co8LEgX5bc274EAPFgFZBneOkOkrkX73MnA4CLkE8vs6/RwAZLRWu2T3wTOM0Ouw7ldU1Q65IWQ8paCW3IHz3OSrs/D4Q48blcKaY6NoqDWpad7unCNTksh4k/DOUZ+24hfbEcwWpM3ElpLFYzLCEAruFnTogLR4UYw13c1F47FDAZfmZD/R1GFJbLHfgYQ/bAph9UDJBTvBVBJ8ISFghG7nPG933hraMGxt/cwTpTFcY9d1Xcn7f2tC0nHrAKYK/9XKsi5Lo72PVRaA75rYcR8K3TKH5GmT0SPny5sKONyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JhCrUBtRmyT89vxyrd6UyKB9jdzI7yZm1cA11gn3Rg=;
 b=RFc6y5KeHWKbuEqogOmvMrBTTCE3l7sU921FZOYfbAKf7ZQXO66lpgnyf+WpvGDInwRfcTfuDgqDnl5UUFBM1gvq4YpmcCTFhxrCYSN7nfbbTZWjMxTkT4UVIDJSk/nJEoD/Ycz/x+1wG8kzdIERF3onEMAw3UJtSIOUo8+SiPqUdA2TrGXZQYGuZJl3q3ytyS4Hb8EG9oISzOLGZ4sPAMfixOQ3gSe28EWOfZBn+z64GpKnzJYthKSByw1lw3Dz+ZSuZ3955r1V0hwqiYXFc1QYRkuAxvAmWGhkOHHKL28gUcm57+9j4dQ3tM7O6PVWeoy+EuQt0HeZMPRqAl/5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JhCrUBtRmyT89vxyrd6UyKB9jdzI7yZm1cA11gn3Rg=;
 b=dcY+rzBpNfH/Hu38A9a8HbkoWPlfHOql5FIFKCIWHqPOr/4knBRoXNIUnHdMeNEji6iezf8zPVAyrIj+xI5irecOa9hnqIyBoB1DuG+iaFkFbAATqgJRQ6kY2UjrJwvueTjkAFvy2VCzadZsJ7MqsbjKxW6AQpVmch0ZRNYy3LQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8356.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Fri, 31 Jan
 2025 12:27:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 12:27:33 +0000
Message-ID: <04763987-9590-40c8-b679-7a54ec0dc030@cherry.de>
Date: Fri, 31 Jan 2025 13:27:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta/meta-selftest: Fix variable assignment
 whitespace
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20250131120626.3035131-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250131120626.3035131-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: c8548cee-595f-45ba-1c04-08dd41f2a30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDVQRWMvVUg1bm1yZkxTU2RVbzlFM1Y2dXoxeWQ4N1Z1RmNYdGx0bE5YRlo4?=
 =?utf-8?B?b0YzVjB4TEhlNnNUNFpWeGEycFlITE1SaG1nVHRWb0RyVWNuWWo2SzFORU1i?=
 =?utf-8?B?Q3VGRGo4RnRPWEpVYnBBRURMeGtjRFQwZWZMNGxxdmg1Qk13MHMrSDllTXpI?=
 =?utf-8?B?eU1vQ2N5OXp4RXFxTDJvcWNESWM3dVM4c0l3aDJlRFZmQmNFT3B1RkVtSzBK?=
 =?utf-8?B?VUh2U0xpeGJmWDRPbDhNdHM1S2w2b1QwbDd6Vks5R1Q3V3FydThUVTJEWFY5?=
 =?utf-8?B?eWNTUXVqV1dFY1ppN1ZMTjMrZks0VGZGWVJoOWNsVVlqcGxKY285eUZuQmxS?=
 =?utf-8?B?QUVQbXE3TFhLVUZ6ajlTZFZsMHdOWDg5MVlicTNLNXV1NE5rTTB4Z2FybExj?=
 =?utf-8?B?Y0QvUTVOcDVIRjhENWhiV0R4Q2ROMWpKWEJYbHA4SDFsSVQrcVA5a0U5SDR0?=
 =?utf-8?B?RTVUdCtKU05JNjV5WitFbnpmOHVhbXM4OUdzYlVIc3JkWEd2UnZKUGwvZHBN?=
 =?utf-8?B?OVFJU0J3Tkh2cmY5UkZFblRRaGlPbHhlelpnNERXMTJOc3BZalNCRUdXSDNx?=
 =?utf-8?B?OU15RG1YQVVHckMvWEduVkVaOE04OGpjNWRvTjh1cFZXalB1VjJSU2NtOTR2?=
 =?utf-8?B?bkZpRnJROG52dnVLOW8zRThxWWV6L3FsWGV1OUkrcnJMWlR0R0kwZ3JIdGl6?=
 =?utf-8?B?UUtXMGpVbm1GY3lIcEhnTjlSOHdJajVpSGhacUJySU9jOENYamV1S3V6T3R6?=
 =?utf-8?B?UXpvNmh2aEY1OE1ienN2SStHbEVyOU5rMzBCbGxRVVpwU0d1MVYyUjUrSmdZ?=
 =?utf-8?B?OTZDT3lvdUpRN1BsWVNHZStjVHB6bGRJRzh6L1Freks0bXVqYUJkSkNBcGIx?=
 =?utf-8?B?WUM2Q1RzalBZYy82dlYzYkZ0K2k1ald5MGZ1T0x4MjhyNkRnRnJiaEhTc0xj?=
 =?utf-8?B?T3FXcUxqREZOcXBCcmVISWR5bVZuM1hrcEtxVjJ4RWlFSnFQL0NlOXl4aGRG?=
 =?utf-8?B?N3h1U0ttODgzcUQ1OFJndExDYldTelQ3WkJvbXo5WkpmejliRVRwQ2EwV1Zv?=
 =?utf-8?B?UmZaZUxyZ0RzVHR0Vk91QjBtUVN4MmRkeWtTcGhnd0dWblBVb25iTkRiUmoz?=
 =?utf-8?B?OTR4WmFyL3lidTJiWHp6dzlobmdPYkhTSTVRMzdwSklWa2lqOEtDMW9kc3RY?=
 =?utf-8?B?OThvSHEvTUhGN2xiRE5kU0ZsOE1UK01NV2NwU2JSTjkzYUdCUFRqRFFvUWNI?=
 =?utf-8?B?bUE0RXZla3R2Q3N3Y2swWUR6QVM5VVZkSGpSbWw5dUF4bjluVWhVS0twOGRM?=
 =?utf-8?B?T3YzR1hPV3p3NnJnK0VWeEI0MjRrN2o2ZzlMelBSOUdQOS9HQm5RYXVyMjB2?=
 =?utf-8?B?cEdUQWI4cjdFbTZPSGo1cXljTWhMaUpPWnpGVGxvbXowT2hGbENnbUk1S2p0?=
 =?utf-8?B?L05pbTRseTRxaFJMQ2x2L2VhdEUxcFFXczYwa1JoMUNnSmpDb05RRDVkZlRp?=
 =?utf-8?B?MG5ackhPOXowN1htZ2daQTBKa2tPNDhTZ012bnZnUVVmNHQ2TnpiTUptYUxB?=
 =?utf-8?B?TWNXUmdFbmx4dStQbU5BaXRLSkhzY2I3ZkJwcXpaVWhIcHZCYnQ5QUpqbUpy?=
 =?utf-8?B?TEtMZ1BvQXUraW1FWDYvNWlIeVNjT0czVUlaNkJSQTAyc280K01MdWZFRXVN?=
 =?utf-8?B?QUNoelJpUjBKamxuRGpuRXJRR3VpSGN1eG5SUi9rZHVQamc3WjZ3c3RaUmFM?=
 =?utf-8?B?NjRLNjIxQVI4NmZoVjNqSm91d1Q1QXlMN3RXU1RqV3FFQ1ZDMzZxY3hoK3ZR?=
 =?utf-8?B?NE9mOXdHU0xtSHZ1L0UvQ1NuQTVIVTRmelNIcWRTNzJtNTVXWkRCSnUwQkRM?=
 =?utf-8?Q?z4UYLJ6UqUPAo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEdUY1U0Q0RkTkFXRHhQemhLc2x5SmVTSkYwWTZmOU8rTytBdEZGbjBHUW44?=
 =?utf-8?B?OWhOcTNwRk9iTHVPRGEwcmRPd2NwRmZ6aUxDcWNTSDFQeE1DZUlhSFoxZys5?=
 =?utf-8?B?d3Z3anBTMVVlOThOMExYR2JDUm9nTWh3bmtXamlxWCtPNlJqamp2Wjl1dDZl?=
 =?utf-8?B?c2RZUC94WkhjbldmNXVjMjdBNnZONUEvdllOY2FJN2dQRnM5dFZMNTlteEtu?=
 =?utf-8?B?L1BPN0xNcjRlUU1Dck54cmgvOVc4a1l5NkkzRVV1Q2R3M3JwNzV6aldPNWh2?=
 =?utf-8?B?OVEzWmNZZzRJNTlSTEZUK0hFYVF1bHdJWGJQTE9tbVlsSmVnSzJEd3RDbjlj?=
 =?utf-8?B?b2NvaUVHQ1hGc2NOaGtiN2kxUFFOeDMrM1BBeHhUM0NPS0h1Sm83d3lvY0VJ?=
 =?utf-8?B?a1dYK1hyTklRajB4Ty9BVFV4NWM4YmNzdUVvcm5pMEo5cDdEUjNMRGY2SmFG?=
 =?utf-8?B?ZTFZenFKZmtlQUM5K1pkeXd0ZXlLOFVDNnE3dmRvalUrTHpReWpVeDU2ajhY?=
 =?utf-8?B?clRsQUlqRXhaY0MvM2tEbkxIcXQzd2lqZkEyRnhVNlpNeHl0cHFwWTlVOWYw?=
 =?utf-8?B?emF0WDlTVkVZQkllQU1GS2swd3RpakdwMklkazJobC9BS3laYmQ1QW9wODY0?=
 =?utf-8?B?QkZGcEpaalJubXhVVld3RDB3ZVBVM1pvUDI3MU5vQ29ENGRxT0srMUprbWVE?=
 =?utf-8?B?WTJOVUNFNStsY2UvYUxuYVBMNzlkamZTSlBoT25oSDUwR0sxZlYxb2krWnhB?=
 =?utf-8?B?Y29meDFZVEFweXhMOEZ4ZW5aVEdrK0dsY0t3ZTltN085YWp5eGhqM1NSN2ts?=
 =?utf-8?B?SnlmU1dIa1NyYVIrdFo2WU1NY0o3OWhsbEt1NHc4QjBBc2ZTQUV1UUpPSVl0?=
 =?utf-8?B?aUJmVXM4OUFuN2J0TEJXR052UDVnQTcvNlFHTU5sR3ozTVU4U1lvV1Izajg1?=
 =?utf-8?B?ck1mZ0xsWXdWZmJZb1Nyd1ZPZVhEeHR5dkJ3YklBS2NBemsyTTN1RmlUbm8z?=
 =?utf-8?B?UEpUUGY1SWF6WTNsa2ZIZXpvek1lU1J2NllPTmU3Rm4wMklBNXdyQkVQRVJl?=
 =?utf-8?B?WFZnMTZVaEZXajBLcUQxdXpJQmhjc254OWZIcWM3REk5SG94UURXb3ZURGtO?=
 =?utf-8?B?bGoyS0tGMjcrZzRXdUUrR3FnZnhkY1F0SzhFUWRhNVBOa3VoekloQ0FiUDZp?=
 =?utf-8?B?b0xPbjVQcWFUS0VqbUR4OFpzRUwvMFg2M2xZajR2b1VZNVNIVmpJWGNjUXZy?=
 =?utf-8?B?aENra2dTdGpza3AxbkpIQnQrbEwyTzZjNjkvajBsYVRlNmxZSm5vdjNhbzR0?=
 =?utf-8?B?ZmE0Y3ZrM2lYak01eWR3VWE5MTBZdHk5alk0blNhd2JqMXRMUUZsc3ArU01M?=
 =?utf-8?B?MGZQMmJUOW8yaVRSSnhqVnBFUVNQKzlMVWs0MXZDZFJrOEwrWDVjRDNQRjNh?=
 =?utf-8?B?SzlsY3hWdGFxczBYUkNvdzZJZ2t4emZUK2M5RTYxWG5pZ3NoQ2ErOHVRTVNC?=
 =?utf-8?B?ZUJscjEwYWM4OVlDdHRxdE50c2tJdTNwd09wNG9TdGxjQWdxc1NlRSs3L3hy?=
 =?utf-8?B?VEt6WnNGS0V3YVU2elBmNnZNVURDOWhOb2pNZHFmMzNITVNaUjBWZkZkUzZW?=
 =?utf-8?B?NDlrUUFTQ1BZWFpQYzVMblNXM0lzSHJNbzlKdkVYZnQzcnFYeDJWdzhGeTdK?=
 =?utf-8?B?eFQzbWZRVXVhNUxIbEFRTTZ2eVlQNVVvbUdRekJVZVMrZUJBT0lFQk9rMzJX?=
 =?utf-8?B?bnYvMUQ3VTRoeVhxTWlmcTNHWGEvOEhxNnpJRytTdVZiQXBhVllrYTZTcUh2?=
 =?utf-8?B?ZHBhMnM1TE9Lb1pNZnBtbHA1RWtOaG1kanA5Y3pKNG1YOWxWeVlxeHNzT2hx?=
 =?utf-8?B?OUVEbFU0UEN3YThRZ2FNT0tKbVFUcyt0OFZZWFJ2UEZoT1crbS82MjkxRHJH?=
 =?utf-8?B?d1E2K0pJeXJyRlorZ09jWjJIUkVndHJNek81OWR0TFEvZTNWbGtiU3M3SjNF?=
 =?utf-8?B?WnlCek1qclFzTWptZVFQeVIrS2hRTHd3Mysxd3RsTlR4SlNnTG5icUNXeDR4?=
 =?utf-8?B?T1BGS3IxSktHTkFQclQ1ZWxCQ2VhUnZwaFlwcW1RRm96SXBjZTBLZHNjMHVJ?=
 =?utf-8?B?dkNUekFCVXExM0RWTVhwaDl1Rk1mT1oyMFNmSWRDU2dkZXJCVG5vRXlzb3VP?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8548cee-595f-45ba-1c04-08dd41f2a30d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:27:33.1154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tliDhA983viGahMBPJsFC6/N2qXXV3ZqJ4PY+sq/3nd0ZVlVZxxmKvrD3ZgTIsTk2tsLxp8W1wNN6ELcnOlIfpj9ckHYzhK8cafn1q5LTUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8356
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 12:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210478

Hi Richard,

On 1/31/25 1:06 PM, Richard Purdie via lists.openembedded.org wrote:
> Recipes are much more readable with whitespace around the assignment operators.
> Fix various assignments in OE-Core to show this is definitely the preferred
> formatting.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

