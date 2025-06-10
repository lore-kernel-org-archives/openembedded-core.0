Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32475C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 18:04:29 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.70])
 by mx.groups.io with SMTP id smtpd.web10.94130.1749578659954579610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 11:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=jb3S8ejr;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.70, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri18Wulqx/4QwUaz5OANBzdSlaCP5mW0m7Eu2epsL9Dmb6TeB3e+oSKQ2/suVEbNn5elesctEuY2bMNRMGuSt5meG/jH/2r/GXFjko1TsYmRZyGUwXP6zt0ox2ueaiPGwllQBSNPiHj4DR5iMrgZSvjuw0wAcburWZ7zFug9NSVlzpNlRDI0o7Lt8/YnTL4d8zO0n5+l7TZQrVPqRdqTV0dROEN8ySgXjZaSnXpPaVCtdd4UYJeLZek7Brm7rkH86R1H/hA6sVHaRMrjssnW3bmKLkogSZhG35678DRAFG62PYHf8VaBV+HBA8oX36ztb+1+SOorQzDRQzqmJTq5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0Tj/XhuiVg8oOgVeb7nVWxaPw3biJ9Op0M5fqmMnqE=;
 b=qI4d0lkJihPj8IKL3xCUcVKKpuCZlgSH7vFECH0gPMQ8/tfwG9ykJIIKcLpVk2SFoepocp8etxk4iJ1WtT2l7dV6p3lYCsm3PeD84yc/sYx+XhKJvdBnHSAOWe7GSr+os+2xMPxZTJFyQcSByA+0vth1MXZI4lyuTNQcTs/G20pPixtgv8IuVxsl2/vruRK9F513LVwyUwf9mPESzBqdgDrcdgpFfvmMIdXWF66rbxl9M/L3Q/APZ5aeQMskdL/bywknU3XaKglUs+XAVg89MnGNoonyyksJbonCiQnTeiSkMx0FnbvKxaDqD+HF6I7dIHSLi7UZPjgnZ9/tc1us7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0Tj/XhuiVg8oOgVeb7nVWxaPw3biJ9Op0M5fqmMnqE=;
 b=jb3S8ejr+vDVEofI/d5VzWZNAqtF9cnYxd53Ll+wvy6TiDWYIdYdWX4SQq9fiShMcS9wxgnNne3U1v3c5adthmO5+0OahuABY355dcaBMTrQsSCFyIHDd+7wmBzJtTc17ZzeSYihKBoB2mmZo5qgiBNBm8Tk6nWMAkkhq71/rPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Tue, 10 Jun
 2025 18:04:14 +0000
Received: from MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe]) by MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe%7]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 18:04:14 +0000
Content-Type: multipart/alternative;
 boundary="------------kjATwlgv05zH6NS3Ld02fK4I"
Message-ID: <6d496800-a9eb-4e13-a3bf-e84a9e971a16@amd.com>
Date: Tue, 10 Jun 2025 12:04:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 00/32] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <cover.1749571556.git.steve@sakoman.com>
 <742e6867-f955-4db7-a6a2-6bacbd613c55@amd.com>
 <CAOSpxdZK=sCu1JzqVq1RKhpMjx+tVHNV2ryty03HNEmjWR5zFw@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CAOSpxdZK=sCu1JzqVq1RKhpMjx+tVHNV2ryty03HNEmjWR5zFw@mail.gmail.com>
X-ClientProxiedBy: CP5P284CA0185.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22c::20) To MN2PR12MB4357.namprd12.prod.outlook.com
 (2603:10b6:208:262::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: a76a03ae-6e61-4646-a4d6-08dda8493593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ajRDTG9vOFFHdEF0OHk0OEJQOFFLNDJHWVlSMG1CTVZ1TzRJRDZENlM0OExz?=
 =?utf-8?B?N2xwTlFZV3NsdFZEUVJ4Sit0dVNNRUYySk5xRStxMGVmTEpRRDNFanliUVgy?=
 =?utf-8?B?NUxFVG9obEw5eTJLK0hYTExVaEhNU2daVkthRlgwMnFDWGc0UHVYc2tvTHA5?=
 =?utf-8?B?cEJFOXJCTXJBR2h6a3phOTVWNU9EQUJFN3N2enVmOU5jRWFsQ3hicGJqakw1?=
 =?utf-8?B?TEl5M1g4L3E1aGx6aHZFZ1ZXVW9CR0F2QzVlNXRLYXFyb2NSSm9wcjZpUUZy?=
 =?utf-8?B?cldOR2hQTlY2bklRalpGb2YvWW50NXJ1cnRKeTJsRi9VUWx1YTlmQ1RZQmlL?=
 =?utf-8?B?ZG9vWkoveThyckV3ZndyTkk4V2dRYWo2bkJQbWRsUTYzNXFCaHFVWjdUWjZF?=
 =?utf-8?B?THV3ZWVoMGFiejM0ZWpxbDdpVUV0ZVhhT2tXNE1tR1dHa3haMzdjR2dLUmlX?=
 =?utf-8?B?WVVaYXZ4aDZuU0xwQWJRU29ZM1JGN2hXOXJTY0dIVzlIYmkwdFhkTG1RUnFs?=
 =?utf-8?B?VjdOUXVaQjB2OUUyZ29JSXRZSTFraENwSTdDalVhSGo2L2ZlT09XL29IUHpu?=
 =?utf-8?B?eXYyaURjaWhFdFVLa0swdHBiem03S3RJQW1BSVpBKytKM3lFc3c2S2EwMlZ3?=
 =?utf-8?B?blZ0cUkzdkl6WWhPeE1ZY3R4OFh4TjVPRW5ydENmQUF5ZTBlY1hHR1hTK0k2?=
 =?utf-8?B?dTlqdkxqZGZtVnNMaFFod212RVNzVk1oQnJJZCtUckRXUmM1Z0FFSkNhOGlC?=
 =?utf-8?B?RWxKb3BuUzhUak9hbmkyeStqaVFYcm1FeUJLSFpzeTR4SkRkUFJ5YlpTOEFo?=
 =?utf-8?B?RG9pV3JxcnlrZCt2cXJvRGRHNU91MGhSTnZuQkJ5VTh2ZFB0WHVGcHljVE9y?=
 =?utf-8?B?aGJtaUJTdVlSK0R1VGYrYWJhSTF4NHpDWXBDanN6VG01YzFzQWlKTEZjOWVu?=
 =?utf-8?B?UzJ0cFdETmpKZDFBbUg2QzV1cVNLcHFNUk1SUlRrdkVDaFZmR0NkS2tHb2lq?=
 =?utf-8?B?NFNzYlJlMkhLL3Fmd2I3K1JoN05lMitERnpkOEVDTU1FNmpKbmJ2a1RhRkVm?=
 =?utf-8?B?bUMzU2RSMWtYWkZHRmhZY1hJMzZiTmlmaDJmL3dmZVJZRThzVGtna1Z2Mng3?=
 =?utf-8?B?UE9idEM4ck04MVZOb3lWZkVjaTJWWk1NS0t1MVAyR200eXNOR2M3LzQ3ODVk?=
 =?utf-8?B?bFluTWZ2dDMwd1V6ZGJkVE5OVjRCOFlhWC9wRGpOdzZIdGU5L2RDQmVNaU5W?=
 =?utf-8?B?aE9sem13Q2VsRDlhOEtrU2tPcDFTK3FTd2JtZDRuSHhLSlZrU3RKOHc4N21p?=
 =?utf-8?B?UlNQczZLUFV1eTNTWkkwVEw5NWZXb2oxbkdLWExyUmhnTkloa0ViT3EyVGF5?=
 =?utf-8?B?RXU3OVkxL2g4U3Bvd0ZCVkJTNFVnSkZnNkRidXlqaGZBVlg1eVFnbWxqeTBn?=
 =?utf-8?B?UUc2TDd4VVZqbVV4RTNsa1hZRnAxT0phdjhIK2JwR3lRSEZPYVU2YU5PaEg3?=
 =?utf-8?B?aENyNHRVOXNGL1hUcEtDalJqUlZ2YUlHeThwc2RkWEwzV1VpdFR1a1JqZkRI?=
 =?utf-8?B?TytjRzZSdE1hRzZuT2xneVVPb2VLbkdHUWQ4Yzg0cXFCMllkTzRJQU12U2FJ?=
 =?utf-8?B?a0c5UW52WnVxeXpINTBYNlBCcUtqZitvelVpU3o5Ukg0ZzBWWGsxL1FQb0R0?=
 =?utf-8?B?SzlaREZUYXhlSWJoV3QzWHlXQUp3dlVtQnlSaUgvcWZYM2V6ZUZLM2J1amVM?=
 =?utf-8?B?cFdpcU5udlZ2OVh1RWI1TEE2MHlLMkZNNDVjVUxZRHpzV2QrWTY5RTYzZGxX?=
 =?utf-8?Q?q9MlQf9B7Tiho9lBFoJO3aA88iGwZienJc6aA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4357.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MS96cWFRQmhHQlBCK1cwcS9Tdy9BY1dVUDJadUpUTE10QjRieWlVaWIvWDIr?=
 =?utf-8?B?OUQxNjRSSEVLTE9iQkIzZ3VnMUhDb0RGbkV3NmxBZ1hyNjByQ2kxYk8zVFFN?=
 =?utf-8?B?TUdkSFAwRzczK1FBR1l2YnFmVjAwV1JNVHR4YmVQS3craTdGNWkzVXcvZXpQ?=
 =?utf-8?B?ZDRGVFlyTHdadzMvaVVySXhRNUswNDdXWmtvUUdtSzhMZlcvRzNMSUZIUldu?=
 =?utf-8?B?dXBwUkVyZGNSS3E5Um9VeTVNTzdCL3ZVV04zQ3BJdmpRVnk0VkZ1MlZzSXFS?=
 =?utf-8?B?aU5vQklrL1dSZTF1UDBNd2x1RndPL25xMXJCbVR4dkEvQUQ4TW0zaFJSRWdo?=
 =?utf-8?B?Q0h2Ym52a0xnbTBIcDUyR1Y4UjNTWEVXMzFmQlRxeWNzOHIyVnh4WVFORUFH?=
 =?utf-8?B?UnM2dkVGL0VMS2NVMjlvVkk5ZSs1QTZBN25ZWlJGS0xsdUtiTTBWejNaUVdK?=
 =?utf-8?B?MWdZdDJxM1hOQTMrZEprQXNJT1BqM2U3TVpnNHp4bGdOeUo2R3A0YzhUKzJW?=
 =?utf-8?B?OGxseEFmTFExWGVXSnNKVlB6eVVXRk55Zmd3eUNEcUx1Y2NXNzc0eFhSamQw?=
 =?utf-8?B?Ny9KU05FVDZhc1dyM2RQRzVnREVneElMYlFzbGxvZGNXMld3ZmlINFRKcjV5?=
 =?utf-8?B?ZEhsM3FpSU5pUmltd1VKVGN0VlIyWGhQSHd4RzI0Vk1RK3IrTUFRT0lielFl?=
 =?utf-8?B?MlViTVR2UnE1NXQwMVpIdTAxM01Va1liS3ZYOG9Lcnk4OEpYVGV3aGVEclZa?=
 =?utf-8?B?L3o5NlpLSFVOVGplb0ZnaEF0bTk0UWd4aGprR2xTMDR4WmE5MUxzR1VIVlJa?=
 =?utf-8?B?MlJkQXZWNUlhMnBSRnZZTldVUU1DWWtGaGMzUlhTV1J0VEVIcktacHJiR1dT?=
 =?utf-8?B?SFkzL3VKRktadlhOaTM4RVlybWYvK1pkK09CTFJXdnVRV0hGVkxieXVSSWFN?=
 =?utf-8?B?V0RFbVZZYUhuRVJJYUU3UjJ3YjVGWjVRTlU0djZtVmo5c05mLzRQYnVaUFZN?=
 =?utf-8?B?UEFEbE9SSUVxZXR1ZWg3MStKM0dydVBJUzhTRVFmalAvOHdkQWhrWW5VZXh0?=
 =?utf-8?B?NXU1TVpNTVM4Q0RXTzhWcXl2M3BHZXpoL0tsRU9mNThUcUJwS2RHOHRsbGkx?=
 =?utf-8?B?aVBpNXdhSkZlNEcxYmhSQ2wrNFBKMmw3T2FwUk5wV2xjV1piUXo0UzFUOHlD?=
 =?utf-8?B?SzRMeDdYOVBlby9sbHRJd1Vvd3I4L2diaHVtWkdSNU9vYXZrcXF5Ym8yRWlE?=
 =?utf-8?B?VnVBSGFqalZpRlZoc0lEaXI4QmNxQjM3RnJlT25NNlhPbUJ3M0pISTZnR1U1?=
 =?utf-8?B?aVgzQ0dZRG5KVFlrQU5PL2Y1RkxqWFhrSUNjT0g3WUlRNGRTRWVUaUlQc01i?=
 =?utf-8?B?VG85V2VOOTN1MHNxbXVpSmRUMnVCM3c2YTZqWG44NExoc090TmFkU0NGTVdF?=
 =?utf-8?B?L0haWUY4cXkydmVBbVZWSWRwZnBRV2tBSmptWkxoUHg4eTVEY1JKd09UUEJP?=
 =?utf-8?B?bWxWbkdsS2pVY080RGsrVlA0NzlKYTk4OHBrYm1Uc0RYUEh5Yy8zWGVIR1Ra?=
 =?utf-8?B?MExocTVibUVDREtQZ1NRakgxMXVZUmNzU2IrZDByZWttckM3NFRBR0lPNXZK?=
 =?utf-8?B?a0pJY20wVjJNTUwzd3FSbkZGclhCclowUm16WVBPWjdxTzREVmpYaVluTEhG?=
 =?utf-8?B?a0xCaE1lTE9pZkVmN1lOMW5xbE9la2ZpUU5pVjZWQzJsZUxrdEhDNG1VZ1J5?=
 =?utf-8?B?ZDdaVGhkZ2syTEVaU1BCNGNJQklEOUtONHdGUTg0bEY4RTd1Wmh6OThNWlA5?=
 =?utf-8?B?a0R1UnlmM0hsQUw0OSt3UjM0ZEFMb1MvazZYdDF0T2RPTkxIaUllbHE5SEJl?=
 =?utf-8?B?K3ZZa2JpVnBidjQyM3NyNzkyQlRUU1h5VFozRTRQd3pKRU9KNWh6aU94dWZp?=
 =?utf-8?B?OHJOZERZbVJPZUF3dEw3U0ZwUW5lRmNtU2NyM1FxMnM0anUxcG1PZUpHODJv?=
 =?utf-8?B?QWJrcVVhWkdIUVJzd0FQWWE5TWpnelhhdVlURzZQbytGbXR6QXRLKzdHNVVj?=
 =?utf-8?B?NGY1RmNjY3BmM0VSOEZVelJoZTFRV2xZWEs3Q0lESWp1azF4Q1NXbVdHZWMr?=
 =?utf-8?Q?byMdVl7xtCC490qSE1ZPLjyMw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76a03ae-6e61-4646-a4d6-08dda8493593
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 18:04:14.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUtx/8UmKpMLKyjsCdom/ysnkQhTWe3q3xHkcWLCPTuvxHmdAFMPjj+rghDAFnasvWpXWLjRdcL4Xz2x5YTltw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 18:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218404

--------------kjATwlgv05zH6NS3Ld02fK4I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry I keep forgetting this, Sure I will do next time.

Thanks,
Sandeep

On 6/10/2025 11:34 AM, Steve Sakoman wrote:
> Ok, will add it to the next batch.
>
> In the future it would be helpful to me if you wouldn't send patches 
> targeted for more than one branch. When you do this I need to remember 
> to keep checking the master branch to see if it is accepted. This 
> greatly increases the odds that I'm going forget about it! So best to 
> submit for master and then send a version for any other branches after 
> it is already in master.
>
> Thanks!
>
> Steve
>
>
> On Tue, Jun 10, 2025, 10:11 AM Gundlupet Raju, Sandeep 
> <sandeep.gundlupet-raju@amd.com> wrote:
>
>     Hi Steve,
>
>     Below patch is missing in your merge, Can you add it?
>
>     [OE-core][scarthgap,walnascar,master][PATCH v3] tune-cortexr52:
>     Remove
>     aarch64 for ARM Cortex-R52
>
>     Thanks,
>     Sandeep
>
>     On 6/10/2025 10:08 AM, Steve Sakoman via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > Please review this set of changes for walnascar and have
>     comments back by
>     > end of day Thursday, June 12
>     >
>     > Passed a-full on autobuilder:
>     >
>     >
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768
>     >
>     > The following changes since commit
>     a7322472e41c3cac922e29d867ae3f2f74318279:
>     >
>     >    sstatetests: Switch to new CDN (2025-05-30 06:32:58 -0700)
>     >
>     > are available in the Git repository at:
>     >
>     > https://git.openembedded.org/openembedded-core-contrib
>     stable/walnascar-nut
>     >
>     https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut
>     >
>     > Changqing Li (25):
>     >    libsoup-2.4: update patch 0001-CVE-2025-32911.patch
>     >    libsoup-2.4: fix CVE-2025-32053
>     >    libsoup-2.4: fix CVE-2025-2784
>     >    libsoup-2.4: fix CVE-2024-52530
>     >    libsoup-2.4: fix CVE-2025-32906
>     >    libsoup-2.4: fix CVE-2025-32914
>     >    libsoup-2.4: fix CVE-2025-46420
>     >    libsoup-2.4: fix CVE-2025-46421
>     >    libsoup-2.4: fix CVE-2025-32050
>     >    libsoup-2.4: fix CVE-2025-32052
>     >    libsoup-2.4: fix CVE-2025-32909
>     >    libsoup-2.4: fix CVE-2025-32910
>     >    libsoup-2.4: fix CVE-2025-32912
>     >    libsoup-2.4: fix CVE-2024-52531
>     >    libsoup-2.4: fix CVE-2025-4476
>     >    libsoup: upgrade 3.6.4 -> 3.6.5
>     >    libsoup-2.4: fix CVE-2025-32907
>     >    libsoup-2.4: fix CVE-2025-4948
>     >    libsoup-2.4: fix CVE-2025-4969
>     >    libsoup: fix CVE-2025-32914
>     >    libsoup: fix CVE-2025-4476
>     >    libsoup: fix CVE-2025-32907
>     >    libsoup: fix CVE-2025-32908
>     >    libsoup: fix CVE-2025-4948
>     >    libsoup: fix CVE-2025-4969
>     >
>     > Deepesh Varatharajan (2):
>     >    binutils: Fix CVE-2025-1181
>     >    binutils: Fix CVE-2025-5244
>     >
>     > Patrick Williams (1):
>     >    systemd.bbclass: generate preset for templates
>     >
>     > Peter Marko (1):
>     >    python3: upgrade 3.13.3 -> 3.13.4
>     >
>     > Ross Burton (2):
>     >    python3: remove obsolete deletion of non-deterministic .pyc files
>     >    python3: backport the full fix for importlib scanning invalid
>     >      distributions
>     >
>     > Trevor Gamblin (1):
>     >    python3: upgrade 3.13.2 -> 3.13.3
>     >
>     >   meta/classes-recipe/systemd.bbclass           |  11 +-
>     >   .../binutils/binutils-2.44.inc                |   3 +
>     >   .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
>     >   .../binutils/0016-CVE-2025-5244.patch         |  25 ++
>     >   .../binutils/0017-CVE-2025-1181-2.patch       | 337
>     ++++++++++++++++++
>     >   ...shebang-overflow-on-python-config.py.patch |   2 +-
>     >   ...-use-prefix-value-from-build-configu.patch |   2 +-
>     >   ...-qemu-wrapper-when-gathering-profile.patch |  14 +-
>     >   ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
>     >   ..._fileno-test-due-to-load-variability.patch |   2 +-
>     >   ...ctive_children-skip-problematic-test.patch |   2 +-
>     >   ...t_readline-skip-limited-history-test.patch |  10 +-
>     >   ...orlines-skip-due-to-load-variability.patch |   2 +-
>     >   .../python3/deterministic_imports.patch       |  39 --
>     >   .../python/python3/makerace.patch             |   2 +-
>     >   .../python/python3/valid-dists.patch          | 160 +++++++++
>     >   .../{python3_3.13.2.bb <http://python3_3.13.2.bb> =>
>     python3_3.13.4.bb <http://python3_3.13.4.bb>}  |  18 +-
>     >   .../libsoup-2.4/0001-CVE-2025-32911.patch     |   2 +-
>     >   .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++
>     >   .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 ++
>     >   .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 +++++++
>     >   .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ++++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 ++
>     >   .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ++
>     >   .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 +++++
>     >   .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 ++++
>     >   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 +++
>     >   .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++
>     >   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 ++
>     >   .../libsoup/libsoup-2.4_2.74.3.bb
>     <http://libsoup-2.4_2.74.3.bb>      |  23 +-
>     >   .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 +++++++++++
>     >   .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++
>     >   .../libsoup/libsoup/CVE-2025-32908-1.patch    |  89 +++++
>     >   .../libsoup/libsoup/CVE-2025-32908-2.patch    |  53 +++
>     >   .../libsoup/libsoup/CVE-2025-32914.patch      | 112 ++++++
>     >   .../libsoup/libsoup/CVE-2025-4476.patch       |  39 ++
>     >   .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++
>     >   .../libsoup/libsoup/CVE-2025-4969.patch       |  78 ++++
>     >   .../{libsoup_3.6.4.bb <http://libsoup_3.6.4.bb> =>
>     libsoup_3.6.5.bb <http://libsoup_3.6.5.bb>}    |  13 +-
>     >   48 files changed, 2541 insertions(+), 77 deletions(-)
>     >   create mode 100644
>     meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
>     >   create mode 100644
>     meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
>     >   create mode 100644
>     meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
>     >   delete mode 100644
>     meta/recipes-devtools/python/python3/deterministic_imports.patch
>     >   create mode 100644
>     meta/recipes-devtools/python/python3/valid-dists.patch
>     >   rename meta/recipes-devtools/python/{python3_3.13.2.bb
>     <http://python3_3.13.2.bb> => python3_3.13.4.bb
>     <http://python3_3.13.4.bb>} (95%)
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
>     >   create mode 100644
>     meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
>     >   rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb
>     <http://libsoup_3.6.4.bb> => libsoup_3.6.5.bb
>     <http://libsoup_3.6.5.bb>} (83%)
>     >
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#218369):
>     https://lists.openembedded.org/g/openembedded-core/message/218369
>     > Mute This Topic: https://lists.openembedded.org/mt/113572634/3619217
>     > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [sandeep.gundlupet-raju@amd.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>
--------------kjATwlgv05zH6NS3Ld02fK4I
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Sorry I keep forgetting this, Sure I will do next time.</p>
    <p>Thanks,<br>
      Sandeep<br>
    </p>
    <div class="moz-cite-prefix">On 6/10/2025 11:34 AM, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAOSpxdZK=sCu1JzqVq1RKhpMjx+tVHNV2ryty03HNEmjWR5zFw@mail.gmail.com">
      
      <div dir="auto">
        <div>Ok, will add it to the next batch.&nbsp;
          <div dir="auto"><br>
          </div>
          <div dir="auto">In the future it would be helpful to me if you
            wouldn't send patches targeted for more than one branch.&nbsp;
            When you do this I need to remember to keep checking the
            master branch to see if it is accepted. This greatly
            increases the odds that I'm going forget about it! So best
            to submit for master and then send a version for any other
            branches after it is already in master.&nbsp;</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Thanks!&nbsp;</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Steve</div>
          <br>
          <br>
          <div class="gmail_quote gmail_quote_container">
            <div dir="ltr" class="gmail_attr">On Tue, Jun 10, 2025,
              10:11 AM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi
              Steve,<br>
              <br>
              Below patch is missing in your merge, Can you add it?<br>
              <br>
              [OE-core][scarthgap,walnascar,master][PATCH v3]
              tune-cortexr52: Remove <br>
              aarch64 for ARM Cortex-R52<br>
              <br>
              Thanks,<br>
              Sandeep<br>
              <br>
              On 6/10/2025 10:08 AM, Steve Sakoman via <a href="http://lists.openembedded.org" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">lists.openembedded.org</a> wrote:<br>
              &gt; Please review this set of changes for walnascar and
              have comments back by<br>
              &gt; end of day Thursday, June 12<br>
              &gt;<br>
              &gt; Passed a-full on autobuilder:<br>
              &gt;<br>
              &gt; <a href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768</a><br>
              &gt;<br>
              &gt; The following changes since commit
              a7322472e41c3cac922e29d867ae3f2f74318279:<br>
              &gt;<br>
              &gt;&nbsp; &nbsp; sstatetests: Switch to new CDN (2025-05-30
              06:32:58 -0700)<br>
              &gt;<br>
              &gt; are available in the Git repository at:<br>
              &gt;<br>
              &gt;&nbsp; &nbsp; <a href="https://git.openembedded.org/openembedded-core-contrib" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://git.openembedded.org/openembedded-core-contrib</a>
              stable/walnascar-nut<br>
              &gt;&nbsp; &nbsp; <a href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut</a><br>
              &gt;<br>
              &gt; Changqing Li (25):<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: update patch
              0001-CVE-2025-32911.patch<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32053<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-2784<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2024-52530<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32906<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32914<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-46420<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-46421<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32050<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32052<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32909<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32910<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32912<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2024-52531<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-4476<br>
              &gt;&nbsp; &nbsp; libsoup: upgrade 3.6.4 -&gt; 3.6.5<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-32907<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-4948<br>
              &gt;&nbsp; &nbsp; libsoup-2.4: fix CVE-2025-4969<br>
              &gt;&nbsp; &nbsp; libsoup: fix CVE-2025-32914<br>
              &gt;&nbsp; &nbsp; libsoup: fix CVE-2025-4476<br>
              &gt;&nbsp; &nbsp; libsoup: fix CVE-2025-32907<br>
              &gt;&nbsp; &nbsp; libsoup: fix CVE-2025-32908<br>
              &gt;&nbsp; &nbsp; libsoup: fix CVE-2025-4948<br>
              &gt;&nbsp; &nbsp; libsoup: fix CVE-2025-4969<br>
              &gt;<br>
              &gt; Deepesh Varatharajan (2):<br>
              &gt;&nbsp; &nbsp; binutils: Fix CVE-2025-1181<br>
              &gt;&nbsp; &nbsp; binutils: Fix CVE-2025-5244<br>
              &gt;<br>
              &gt; Patrick Williams (1):<br>
              &gt;&nbsp; &nbsp; systemd.bbclass: generate preset for templates<br>
              &gt;<br>
              &gt; Peter Marko (1):<br>
              &gt;&nbsp; &nbsp; python3: upgrade 3.13.3 -&gt; 3.13.4<br>
              &gt;<br>
              &gt; Ross Burton (2):<br>
              &gt;&nbsp; &nbsp; python3: remove obsolete deletion of
              non-deterministic .pyc files<br>
              &gt;&nbsp; &nbsp; python3: backport the full fix for importlib
              scanning invalid<br>
              &gt;&nbsp; &nbsp; &nbsp; distributions<br>
              &gt;<br>
              &gt; Trevor Gamblin (1):<br>
              &gt;&nbsp; &nbsp; python3: upgrade 3.13.2 -&gt; 3.13.3<br>
              &gt;<br>
              &gt;&nbsp; &nbsp;meta/classes-recipe/systemd.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 11
              +-<br>
              &gt;&nbsp; &nbsp;.../binutils/binutils-2.44.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;3
              +<br>
              &gt;&nbsp; &nbsp;.../binutils/0016-CVE-2025-1181-1.patch&nbsp; &nbsp; &nbsp; &nbsp;| 141
              ++++++++<br>
              &gt;&nbsp; &nbsp;.../binutils/0016-CVE-2025-5244.patch&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 25
              ++<br>
              &gt;&nbsp; &nbsp;.../binutils/0017-CVE-2025-1181-2.patch&nbsp; &nbsp; &nbsp; &nbsp;| 337
              ++++++++++++++++++<br>
              &gt;&nbsp; &nbsp;...shebang-overflow-on-python-config.py.patch |&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;...-use-prefix-value-from-build-configu.patch |&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;...-qemu-wrapper-when-gathering-profile.patch |&nbsp; 14
              +-<br>
              &gt;&nbsp; &nbsp;...sts-due-to-load-variability-on-YP-AB.patch |&nbsp; &nbsp;6
              +-<br>
              &gt;&nbsp; &nbsp;..._fileno-test-due-to-load-variability.patch |&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;...ctive_children-skip-problematic-test.patch |&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;...t_readline-skip-limited-history-test.patch |&nbsp; 10
              +-<br>
              &gt;&nbsp; &nbsp;...orlines-skip-due-to-load-variability.patch |&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;.../python3/deterministic_imports.patch&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 39
              --<br>
              &gt;&nbsp; &nbsp;.../python/python3/makerace.patch&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;.../python/python3/valid-dists.patch&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 160
              +++++++++<br>
              &gt;&nbsp; &nbsp;.../{<a href="http://python3_3.13.2.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">python3_3.13.2.bb</a> =&gt; <a href="http://python3_3.13.4.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">python3_3.13.4.bb</a>}&nbsp; |&nbsp; 18 +-<br>
              &gt;&nbsp; &nbsp;.../libsoup-2.4/0001-CVE-2025-32911.patch&nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2
              +-<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2024-52530.patch&nbsp; | 150
              ++++++++<br>
              &gt;&nbsp; &nbsp;.../libsoup-2.4/CVE-2024-52531-1.patch&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 39
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup-2.4/CVE-2024-52531-2.patch&nbsp; &nbsp; &nbsp; &nbsp; | 133
              +++++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-2784.patch&nbsp; &nbsp;|&nbsp; 56
              +++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32050.patch&nbsp; |&nbsp; 29
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32052.patch&nbsp; |&nbsp; 32
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32053.patch&nbsp; |&nbsp; 39
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32906.patch&nbsp; |&nbsp; 71
              ++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32907.patch&nbsp; |&nbsp; 39
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32909.patch&nbsp; |&nbsp; 38
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup-2.4/CVE-2025-32910-1.patch&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 32
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup-2.4/CVE-2025-32910-2.patch&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 94
              +++++<br>
              &gt;&nbsp; &nbsp;.../libsoup-2.4/CVE-2025-32910-3.patch&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 28
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32912.patch&nbsp; |&nbsp; 32
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-32914.patch&nbsp; |&nbsp; 35
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-4476.patch&nbsp; &nbsp;|&nbsp; 38
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-46420.patch&nbsp; |&nbsp; 61
              ++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-46421.patch&nbsp; |&nbsp; 47
              +++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-4948.patch&nbsp; &nbsp;|&nbsp; 38
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup-2.4/CVE-2025-4969.patch&nbsp; &nbsp;|&nbsp; 37
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/<a href="http://libsoup-2.4_2.74.3.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">libsoup-2.4_2.74.3.bb</a>&nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;|&nbsp; 23 +-<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-32907-1.patch&nbsp; &nbsp; | 200
              +++++++++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-32907-2.patch&nbsp; &nbsp; |&nbsp; 68
              ++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-32908-1.patch&nbsp; &nbsp; |&nbsp; 89
              +++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-32908-2.patch&nbsp; &nbsp; |&nbsp; 53
              +++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-32914.patch&nbsp; &nbsp; &nbsp; | 112
              ++++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-4476.patch&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 39
              ++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-4948.patch&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 97
              +++++<br>
              &gt;&nbsp; &nbsp;.../libsoup/libsoup/CVE-2025-4969.patch&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 78
              ++++<br>
              &gt;&nbsp; &nbsp;.../{<a href="http://libsoup_3.6.4.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">libsoup_3.6.4.bb</a> =&gt; <a href="http://libsoup_3.6.5.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">libsoup_3.6.5.bb</a>}&nbsp; &nbsp; |&nbsp; 13 +-<br>
              &gt;&nbsp; &nbsp;48 files changed, 2541 insertions(+), 77
              deletions(-)<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch<br>
              &gt;&nbsp; &nbsp;delete mode 100644
              meta/recipes-devtools/python/python3/deterministic_imports.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-devtools/python/python3/valid-dists.patch<br>
              &gt;&nbsp; &nbsp;rename meta/recipes-devtools/python/{<a href="http://python3_3.13.2.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">python3_3.13.2.bb</a> =&gt; <a href="http://python3_3.13.4.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">python3_3.13.4.bb</a>} (95%)<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch<br>
              &gt;&nbsp; &nbsp;create mode 100644
              meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch<br>
              &gt;&nbsp; &nbsp;rename meta/recipes-support/libsoup/{<a href="http://libsoup_3.6.4.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">libsoup_3.6.4.bb</a> =&gt; <a href="http://libsoup_3.6.5.bb" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">libsoup_3.6.5.bb</a>} (83%)<br>
              &gt;<br>
              &gt;<br>
              &gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
              &gt; Links: You receive all messages sent to this group.<br>
              &gt; View/Reply Online (#218369): <a href="https://lists.openembedded.org/g/openembedded-core/message/218369" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/message/218369</a><br>
              &gt; Mute This Topic: <a href="https://lists.openembedded.org/mt/113572634/3619217" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/mt/113572634/3619217</a><br>
              &gt; Group Owner: <a href="mailto:openembedded-core%2Bowner@lists.openembedded.org" target="_blank" rel="noreferrer" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a><br>
              &gt; Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/unsub</a>
              [<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>]<br>
              &gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
              &gt;<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------kjATwlgv05zH6NS3Ld02fK4I--

