Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D632CD5BB1
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:52:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20120.1763027549005537112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 01:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XEbrs7jf;
 spf=pass (domain: cherry.de, ip: 52.101.65.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmQR4FHf6Sbsl6e6quiZuezJ5G4c3OxuRV/kJ1rcO98OoJYOGuL9BmwsOHeCpU6NmF6ALNx1y/ccEW2KnAfuOJuwhKxZyloD/r6yLYM4KLblib6RPwhq6E0AMGq8Nl01oFf758p37AaCJGTar5kTCBphyA8/WF3YIRTqbun3sqSzsaJa3z2nvl60MKGVw8Mtkw9innLYMBl47jlSJzJY5EojOjSBtO98ij+Ry7THwAuOEjtUWBl3GmAsNvpcw0zswJibIDW1nR4xOr4x0gtWNj8/5xEo85xzd1Wqism8bRet0e6KqLVB899u8jhAc1Eofl4ixeiMtrg5vGKwrZn/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkVU175lX9l5cYdIlBY9BjlQK6Dpuf5aXQnajsAdBeU=;
 b=TZQe5kEX6HVEeyxSL1lacyfDJwaQu2hhgc9tn9YAomspegGhi2Bg5MXesHFLOAvR6Dn9BJBPHR6/kl4Tf0NdNIRA+s3axvOvbXhV2nnEqbYn5lcBTrU7zNPLkxGB7djWj5fPcHKfKr7T7gmXJmskX+ggLGvaS/9qlEsK2KJ+q4Wuu0+2noIQpnHnknCWK+fw9fNpOf8qxxRFQqc6L1bD1kc1kur0jbjSc79BNSBHmVfc242RPYdK3nERVYCq3qx2ySE5UxUbivHVrwqEI+q2hOri4NZFUVGYaPOB0A/LfPpXsgg08xnoFz81PXjjdvmz4vHoqLWtbsGy92QXlIAz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkVU175lX9l5cYdIlBY9BjlQK6Dpuf5aXQnajsAdBeU=;
 b=XEbrs7jfUmLHYV/xpmlTCFbsjVogYeUDehpT7eK/WdfO4pveP/Vn2NZ5EST3X1V7XkhgAegNp0XFYQDE27LDmuHoGb4B5+PemRd61oUP+tzZQ4rDhiOefMaeZu/GWKKwEU04+y5jVPpl0DVGTJsIRUMQe3uB7lmnbnOdZHOzS6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 09:52:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 09:52:25 +0000
Message-ID: <f37fbfa0-d3c2-42c6-a6df-8916e2b92af6@cherry.de>
Date: Thu, 13 Nov 2025 10:52:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] go-helloworld: fix license
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20251113081148.32411-1-peter.marko@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251113081148.32411-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 592be733-5e20-4910-75d8-08de229a591f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wlk5OFZCU0hlMG10NjRZeUhtNWNWaHB3K2J2cEZXeE5saVNQQjJPZ1Y4c1Ax?=
 =?utf-8?B?ekdEaEJzWmRybXEvV08vcDFVeGNRQURIZ1BxRmxjUjBxSG8wTGo4WHBZNEJ6?=
 =?utf-8?B?MElXdUdKRWQrYkRtN3BDMlkzZlFQWEV5UHhHME1Jakg5ZXJvVDRlM3IvUFd3?=
 =?utf-8?B?UmgxOWY5LzNGQzluMmhxUFV5WjlBUGtoTkxOYmllaE5tWjVHbjlxajUxL3BL?=
 =?utf-8?B?eUxObEM5cms0T2dURmM1TE5LcVJ1dTZmSkNMQlprcVF3L0dDYWVock9yL2pq?=
 =?utf-8?B?c1F4TEtHUlBrdUxnd3A3aUIrbzY3Zlc3eXVzaVZHSkR2SzF4bzVsazVEV1Ew?=
 =?utf-8?B?dHpkdnRjcmZ3YkRSWUpCazZRMWFRZzBFdlVnZ3o0TGJOWEE3VWZMaWIzSXZY?=
 =?utf-8?B?N1hjS1QvMUZOaU1LMEd2dFFnV3hZazlGcWZoZ3E0VFlHemlTQ2Jwek51NHRr?=
 =?utf-8?B?WENyUXZaeS9DL2swQXpSNDFDWG1ZK2gvaWFaRlh0WVJqVVIvN3Vnemw1NlBF?=
 =?utf-8?B?eWpPc3oxOEVyREh6WVYwMzRBdlp4aEFNNGJGeGxuV3BldCtqVC9sWi85azdY?=
 =?utf-8?B?L1BJSldVRUR1ekhaVjQzYU9jSi9NL1krNWZ1eDlSK3FYUnNRcEJwM2RvQWpQ?=
 =?utf-8?B?YWVVRExZbkRCTzFidGQyMVUzRU5xZHJFMkd4OVlSMlB5ekdhMi9zWXg2alZx?=
 =?utf-8?B?N2d0QWQ2VXFCWWg1Ly92dWFIdXZ1RndDODliUUpnNG5zU3g3dWVHczlkK3li?=
 =?utf-8?B?OW1XR0xTV2JXS0pWajZtbHpGK2QwSDV2NThydlBJdEtoOFA2Tkg0NVZ4WVVR?=
 =?utf-8?B?MzlWMWgxa1cwMVFBZkNqdWlrUStQL2tvNGpsbmhyL1E5clZTczVPaGFiQTdH?=
 =?utf-8?B?VWIxUGJ6QWFrcG9lZy9yaGdmeWdxaWNBTDJGcldrM1htNldUMUgzTk9UcVZp?=
 =?utf-8?B?YXZUeml0cDZLaFhSUXN2dHQ0Qzlqb0FwZlBQUDJiUEUvMFR2Z3lLTlVYQlo1?=
 =?utf-8?B?K25iR1hsNFAyWUREVnpMN0wvRER5ZWx2Q1lLdWgvbE16ZVhFakkraVp2bXZG?=
 =?utf-8?B?NjdPWDZqK2x6M2lYSStWQzhYenpFVXNZN1RZN2V1Zmw2TTNwWm1MUjVoR2Vk?=
 =?utf-8?B?OWZnWHZKWjNWcUNoRTN4anpSWHJSRi9wOTRuc21rWGN6Wm5YblFDWmhneDJZ?=
 =?utf-8?B?b3NtdWRueE1TdnlPZmgwUWpDTE91eGtack9lYWdnOE8vNm9QUSsycHpHVk85?=
 =?utf-8?B?Y1krNmxLUGRENi9ZWEpTV0RkeDh4TTBxYmhEazA3TndIZFFXdXVRMmNyd3Ix?=
 =?utf-8?B?ME41VEkrcEp2dG5wa3N6QjFWNmQ1ejJMcWczZkc5SHJJN0ZJV2MzTitUTDl5?=
 =?utf-8?B?RWdWQXN6ZndaTm5kRlpsNnltNzRoUjNGekYxcWttdDRTcTFVeE1RVzVldVQ0?=
 =?utf-8?B?SDhjMWhHUG5sbFlVeE1RRENERDBqQzBoMUtneUo4QmtzQ0xhK1hpendwNUlw?=
 =?utf-8?B?SlVQV0xEaElOVUJCZDJtR04rZ2FPbXVrb1JQNVUwcnZTSG1LRlNRdjI4MmZG?=
 =?utf-8?B?ejNhT0ZPSUQ2ejN3MHpoYWhhWVBmenJudGNzREhzeUR6Q0FHRUF5bzJLaFdu?=
 =?utf-8?B?dDRPN3FBZWRQbVlGMUd2bXRLTmV4bmc4N1lUUisrSERKbUhMVnJwc3B0dnhr?=
 =?utf-8?B?RWNtT1NKN2Q4VFlBVVJwQ05ZQkc0VXJ0YXFxanpkRWhROU9XaFVvOFBHOEZ0?=
 =?utf-8?B?L0VTYnN1UkV1eG05ZE1RWUhmTmhleDErSEoxcjlhMnBNVW9SU2VuRWF0Z1NG?=
 =?utf-8?B?bk1ubDRWRWl6R1ZlWWxSS0JrVW10dlNaRXJ6d2ZOUmpNeW1HNmlzZnF4T1NV?=
 =?utf-8?B?MWh4NXRpNzROS0lCcTk4azdEZFB4VW8ydEpyY2wwZlM1NzFva0M4ZTFnR2dn?=
 =?utf-8?B?RU84SjBnQnlOb1VpR0VEQ2ZLTkNPUzBZeUo3NjZuT3VwdWxOZm5GMHM0MWoz?=
 =?utf-8?B?d3VRYUpCcUNBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TlpFMVdjWmN5ZnJKRTJmMGptSlBncUJ5cmQ0eFI0N3EzaHBlckYvTmRDeDhS?=
 =?utf-8?B?WmNDRmU0UzFBMGtIQ1Z5Q0d4TktBdk5TaVhscXkzdnZ2S1diSUorUmhVdi9E?=
 =?utf-8?B?S1NIVzAvTTh4Q2txYXRHL3NTQWZEbFEyaEppR2VFMjZ4enVZSGFTTUVGbWdG?=
 =?utf-8?B?cXlFSmJ6VXpmTUQvRWNXRzJudUNEdlhha0d0WWJVOHowSGVWOG9kdUVWbHpn?=
 =?utf-8?B?YVNPWWZENHR6NWNNL1RZU1F1V3BlQm9xM0RJaGtJQkF5QkxwVWVEQVNOQXpJ?=
 =?utf-8?B?SVI2SW54bFVzRjkxU2p3Z3NDVEhMNVpzUGVVZmttMmNWM2JNSTM2OXU1Vm1x?=
 =?utf-8?B?YmVtaUVmdVo5dUszelBhd2xhTGc1TXM1cUlwb0ZFamtkVnVkY3lBN3RZZW5v?=
 =?utf-8?B?N05qYkFXcUNVY2dwY0RsZ1NaZFM2QXlrbHZSdmdwaGtsejZxajIyUW1scjk1?=
 =?utf-8?B?SGdJTWRqQTdlVSsva1N4Y1FGUklURmFiU1dScmxUcWwzY3c1Y2dLM1hsSXJm?=
 =?utf-8?B?V2dlRk5qcWZxQXkweWJuMmtMd28yZkdRV29yaUY5TkszTmxIRkN3WHZDRVdD?=
 =?utf-8?B?d05GRTJiN3VvbE9kSHB2cUpBVUlYZGJ2UGE2NWRiV3lUc0lpcENsa1ZEUkdN?=
 =?utf-8?B?SnFCaDE4Tjl4TVJwSDdmd1VyK3VyRld6Rlp4UzRiOEtNbktOQXpBSlRCYjU0?=
 =?utf-8?B?a3VNMHV0c21VVHdiS1AwOEw3WHlDeUhjSGNIbU1zUVhrNUFjVS9palpnczlY?=
 =?utf-8?B?VGtianphOXAwMkxoZnlyL1FJNUxDUDYvSnFRYmEvcmZ6Q0FycFpkUFZMTUw4?=
 =?utf-8?B?U3dRZyt4UjB4Rmo1VjB6NlNBa2xRbDdyNFZRQUhPczJzKzF3cFN4OFVlZ2xI?=
 =?utf-8?B?VWVzZ3JtWWx6Q1NKa29CakpDR2MyTnUxS3ZjZzFhZGVjSlcwMFhLTkZEaWhi?=
 =?utf-8?B?aENLeGVrYi83VFhVNXVBMkFIdkNBSXE3aFlZR0dLc1Z5MkJWQ3Flc0ZwRTBs?=
 =?utf-8?B?V3dja25ZVnNkL2JNa1dvUHQ2WHpBVGhUUnJoVVJPVTJGUlBhbTJ6VjJqOE9R?=
 =?utf-8?B?NkY3cERod1NPaXVBOVhaL0NyWUtkWUNqZER2c1ZoT1ZBSUxuV2FNVW9ub3Nk?=
 =?utf-8?B?UnlTR2FvT2svZTg5RTJ0Mk1iMmtHUXJnNURUbkJmRzZHUEM1Z2wrTzRYN2xr?=
 =?utf-8?B?aXJRWUQrU2lheW56TU1EUG1XazV5MHRiSC9VSnhoaEtZYjlxTWk0WFhzV0dZ?=
 =?utf-8?B?UHpPNmszWWpBNTYyR1gyNDk2M2lTUTRzazI2QVU1V0xRdVZZYTBzajVDUlVG?=
 =?utf-8?B?a3U5Vit1SVBLTDNheE9LTS9RblN4cVZNVzQ4UHZxcTAxMFd2YzhVekg4cFJI?=
 =?utf-8?B?Y3pHWDFpYytUa016bFVQdndiUW5BY3A3aXRUZ3hrZlhzRnViUTVyZWM2Z0ZL?=
 =?utf-8?B?dTVJTkJOaWZJUEdSM0M1elh0V1I1Q2lsdE96Tm5WNXhocmZGbGFrVXM5NWcx?=
 =?utf-8?B?dmxuajUxTGZmOHRzZDAzRGRVVEo0d1dJeGFiaUFldTA5M3JOSCtSK3VIa1FQ?=
 =?utf-8?B?VTdhbyt5WlBCUzlxTlBlRHJVZTQ2dnNuTzdvRlJFTUg3cEYreGUvNTFQTU5S?=
 =?utf-8?B?K1pPV0dVN0UvdUVBQmdMSGJHN1NWZ2QyTTVkc05ZOVVrTlVhTDZJVXFyTENx?=
 =?utf-8?B?NlZnUG00UUttZyt3OGtJS2tFY1RPRStXMm5jZVhsbGdnU3h4bm5kcWF1aGpO?=
 =?utf-8?B?dnJjRnl6YmExRmwwSzNWRStDODkxSzl4UmFrSHZyZkJjL1JLL2xzREl6YnZO?=
 =?utf-8?B?Wkdoa0VvNVo0ejcxL1pudHB0K25INnd3N3U2Vmo3N0EvdERWK29uTFdSd21K?=
 =?utf-8?B?UVpnQjljNnhDZHNrZGcrUUFQbTVwZFlUdVIvMTZ1MlQ4bUp0b2ZhMjZLQVpw?=
 =?utf-8?B?SFVHUnVYTVp2bHhFbWZubVpDR0dXR09JN0laV0FkYjNCdyt3d2pJNCtBZDlT?=
 =?utf-8?B?N3c5VVlTaFdoMmFkYmZKVW5HNk11ejBLQWYwQ1RPR3Fyam9YaFREbHB6c3o3?=
 =?utf-8?B?bmVpZ3NjSHZmc3FCR2tObTZzd0tvekF1SW5mVUVWdVJmVXVtZVRLTHpoNUNC?=
 =?utf-8?B?OUN2ZVE2VVlYV0pKWkl4bUs2d2tUWXlaSXRTK0k1cTg2c0J0VkpkeC9vWkw0?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 592be733-5e20-4910-75d8-08de229a591f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:52:25.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AC8XLDhayXCHFtkp8y9jTAPe9V8+FsEpq1Fz0jwAOElcmAAIOeSbEIVkmYd0kp35ohuvL2uxlYEvGIH6UuXkbGy3Ew9yrM7NWx+k150IXEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 09:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226232

Hi Peter,

On 11/13/25 9:11 AM, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> The example repo doesn't seem to have ever been under MIT.
> It started with Apache-2.0, later changed to standard go license BSD-3.
> 
> The license file exists in the sources, so use that one instead of
> taking it from the OE-Core license directory.
> 
> Note that this was already fixed in scarthgap and kirkstone, but it was
> not submitted to master. Also the old releases still had Apache, so this
> patch is different now with new versioni of thie component.
> 

It was submitted for master/walnascar but never merged:

https://lore.kernel.org/openembedded-core/20250812-go-helloworld-lic-v1-1-07ce00a0f252@cherry.de/

Cheers,
Quentin

