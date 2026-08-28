Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA2FC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:59:04 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2711.1787929141509026178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 07:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LJB2k0I7;
 spf=pass (domain: cherry.de, ip: 40.107.130.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Puyo20eCOtxrWJJ8yfPtnSd9L6BFGHlVoMUVQg6jJ//ah7gFn2ATaq/r//qiAumY6Ru0nZJ8ySKqaM4SQ/Z65f+EOXLnHC/wtpy52FMCTrrxTu657+UM880w/mv+c1fxt/x3q0/XNwebYfxzcqv9khqLbn6oDBaflREuidOXOXJGalLJKiBqnItrWQ4YKzAy62QIR202uHpc4aG6hJ6szafDrR3Vj1BLjmQSOQMthcp28FU43sqt9PHHSrXOhxzPhPsYy8+2HL0kMjBLl5Z0SJ4bJ47AcSbyqL7zKTugPUKvQuWFUs456YOnP3LhhCl8+kIhk2Sr8cH+BhT4kWToHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYPuZVLO/Ky4rbg+M4zyjnwrnkDxWNl06Hmw82uWuWg=;
 b=OeeA8N4BkAJRk+v4FuAdHwLZlvYVl/lZxQ/Ek1Ud7P+0oLRCcJDiklo/1CnIHwj8KjGgJ039aDMcYRiDAzotGqLAphhQKsrazlDyYjEyya3H/J6QRLVyXQ27W8CO82tx49hT0ztTrRrPIPUX8xIrbz+0brxWL3aIOqfP33xAPzbxGJD7WCZse8RbUIJR9/nCZUHS+p7qkeixZSyXRksUwonPVoRoQ0P3sx42oVMdYCtWM8Hmzy094RPq+G5LuswtslITTOs5LWWyhdDdQBjIAayY+qrcmnTa8ZRB2d+RF+u6dg2Gfwcw75t2vRS81wy7GBJ2wRC1SBdxVAArbAikmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYPuZVLO/Ky4rbg+M4zyjnwrnkDxWNl06Hmw82uWuWg=;
 b=LJB2k0I7fUllod2PJFkC4UZBaL94H+4z2Pn2GjnhCUIifVvWn3kDn/tMOrA+rzgxvluXnVeVuBUMlvEdrMfyqxuwRPbuU6C4UJLqiMcR4E4rcoYUVPtbTaF0wrBfBtW+b/uf5i6acPCsxrSsbdCxOKCmMv7KnE8YHx+tgwFArs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by MI9PR04MB187423.eurprd04.prod.outlook.com (2603:10a6:290:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:58:55 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:58:55 +0000
Message-ID: <b3b26144-af17-4700-ab26-2e8a1d237648@cherry.de>
Date: Fri, 28 Aug 2026 16:58:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: Update the HOMEPAGE entry
To: festevam@gmail.com, openembedded-core@lists.openembedded.org
References: <20260828144859.364618-1-festevam@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260828144859.364618-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0029.eurprd05.prod.outlook.com
 (2603:10a6:803:1::42) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|MI9PR04MB187423:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d96d159-06a3-45e6-7870-08df0514e194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|10070799003|366016|11063799006|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	XgSwz8XJazVAAkF6abL0rivu3k5b3828F6QnIW+V3oYGMLCk0Ja5Tws/g6yj8XUnhA/6TsDxw5uqsat6+dbNCptOK1QcORWEJd9Vlc2x7ZpI3u4RE5ccFKhfVD1jjGV5C9UA9iTjFi0ZvU3JE112Pp1d1DGyZlvLdSJungf7XuVuqQGrMd379SVqdAn5BbG06y6JO8nHnLYYc6YvfNJY6U48EO8TFj8eF8mSxoFJea6jlCNpXR9GFykN6cR/tH9j3sZBaW20n4rrgY6cPnkzFysEIHqY090AwUEQY8fVY3q6caMo8P2IM56jGu/S5cL2Xpv12st/acN3kbtoaxHGHuUCSnrvnuEgrefb8LbDuITxQXUiI/2fme8WFBlYY+Uqq1UkD5GbW0CX0iPNsH4KGJTtMQzlYjStq96FoJFTAAx3YgW1cvra24ccBV1LHsZT+iJyO9pmnAHTqWmZ6mDfGAwkjjGiJQR839igUj3A4jQdIHOVIIZC+mv3oy51Yy20iBk6d3XBFzFqh2kiCatyESImfLhiuj4naBArjlFzQdt4V3uSo9Qmnv6DscClWRp4f5r4OPno9ZFv99Spz6wpm8BoAlafDnBqgMt/y1nGm8siH3/lSJ0fniZXFqtHtF+ds+9mTOkqjD+GpIVwlVme2C0wQ5OY7Xy4EwETCW0B/RM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(366016)(11063799006)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjYvVEdjdTcyYlpFN3ZjT3dpSG1FSVVveXB6bG1oMGRTRlhLbk1jcFZmNm1Z?=
 =?utf-8?B?VFV6TXA4MUJoYXlzaXNmcjUrakcxdURBMWdRQVJMNzJrNXhzeXcrUFpweFhI?=
 =?utf-8?B?ZjR3S3M4QXgxRThveVpNV3EzMW1DcUhUaTZOZit1QXhsVFFHTUMzZGZXQ1pu?=
 =?utf-8?B?b3IrellVT0JEbExkS0hrVml1d2tIMzgzYzJsRDkzZEpraHI3ZWwrekd6dHRX?=
 =?utf-8?B?MkpDTS93RjRnUTlUbDNxNnd1L010YUlOdDVaOS9PTUJYRjAxcGNxeXRrcUVj?=
 =?utf-8?B?SHJncmNOZkZ0QU4zKzI4SmFsVDVFbGxwaWd4Q0g2V2UwRDZWK09wcHQ5NHI1?=
 =?utf-8?B?UmhzWjcxN2pyUjFqdUQrTm1mU0F6Zi9GZWs3YXNpSFltQUs3WEZWd0NHd1Yv?=
 =?utf-8?B?Z2VQT2lxY2RHT0tqWnV5OVNuSXFLeHFBR1htNXcxaE9OTnBpN0tYVkRkUjky?=
 =?utf-8?B?eVBmSUFJR1pGV3F1a2xCckFybk1ITENvb1UxcE5KQm1ad1B2cnBFZ0hUcElr?=
 =?utf-8?B?RGtiNHc3aEpTU3l5WDJOYk9LSGZtRmYyZ3pHNldsaW94c1ZGdkh6SlczQ0JS?=
 =?utf-8?B?M3g5QkNQTU9TRG91a2dFWFFpQ2J3MzN0Q3FVQStmbjcwY3N4WitBWUJzRk9L?=
 =?utf-8?B?VUJDOEdibS9TOEZoQmRKV1BSL2EwNHppdDk3YTJzRlNkTHVKRThLT0pnWEZh?=
 =?utf-8?B?Q21HUW1Eb0FPRXFaQUR4Q1c4NTFGZURnMWtFMmFDSDhDYXU4S2dvMHo1RzBt?=
 =?utf-8?B?RVprMlBzOXMzZy9vUCtYc1NWQUZoU2RnRWs4bWIrMWRoWWRHc2lKTHh1RU03?=
 =?utf-8?B?VzI4SkxGMmdqUnFZNGRZVjBlMUJlaUJUSUR3VWV3QXNYbnBZUHNPOFJ5OWJ2?=
 =?utf-8?B?eFFHU0p2VmZlYjlzbXpkVXFmZzNQck1FdlZjZlNaalBGTFlPRHh0bkQwdUJP?=
 =?utf-8?B?SS8wNUtzMXpCN2M1UmpUaVEzT2VrVWd6WlkyNTVKNk85NDl1aUpFTks2eDFu?=
 =?utf-8?B?enN2L212QjlBN09zUVlMZ1pMSHp5OVVaYm1IVmxKVmtWWittVWNPL1I0bTBx?=
 =?utf-8?B?RHFMaDBjSElHeFpvUC8vQWo3NnNDdlZWd0podzNpVmhIWmV3S1kwNFlIRDRp?=
 =?utf-8?B?RFQ1QzJ1eVNMcmZPMXQ4OFpiNWJKa25vcTRGaUtFcUZGc3ZaTHBWdEVtUmd5?=
 =?utf-8?B?Um9GNWxHNjdMN04rd0hBSmd0SVVBT0tMN1hsRmlIUzBCN2NDbzBYMVV4WGNp?=
 =?utf-8?B?aCtCdGU0T0E2RElwVlNxeUhSbGpXUDdERitzSVU5VmVwdE1RZ0V2cTlNQmx5?=
 =?utf-8?B?d3p6dWQ3NGdTUzZvY2VBbCs5MVlqNU5UMGFPU2UvVkMvZUFtTkkwVDg5cXMv?=
 =?utf-8?B?M1NXNEc4d1cwTWhuMGQ3ZjVoL0pPRzBrQUhyV0xvemYzSzA2cEdiS2JNWEF3?=
 =?utf-8?B?K1cwak9pbnRQOHEvdkJ4ZzF2UXVMaEVBT2RaZjVvVUdIUWE2NlBTV3dxVEVE?=
 =?utf-8?B?bEVBSFVDTFpveWJoM2psVDlVWmVsSnF1RjlDR3gvZE1Cc3JGMUgvRWR5YVh5?=
 =?utf-8?B?OTM1M0NvRkRhakJCZDlUS2tPZDVsSWYyZlpKcHg5b2xXUnErbkJtZDdaTXJQ?=
 =?utf-8?B?VDJFaFhDZGxabExuRTFzY0gyQnFaVHZVZ0YzTm5BSlg3VXNPNjZmTEZzRDlC?=
 =?utf-8?B?YUhPZ0RRVVJoZTJXckFjSFIydWQ2alBpVEZTK0I3bEpnekczdjlQWE9wbXRa?=
 =?utf-8?B?Q0gyMHNES29PWm8rbDBGeGZRMTJhekZyTGdRSDhqMXVvSDFFb2dmR1FPQ0ND?=
 =?utf-8?B?SjAwem52UjVXeENiRTk1Y0RjSFE1Y2x5MFVHOFVyUUhCZG5Lb28yeUtDNGdY?=
 =?utf-8?B?anJqR2w1MVliNzQ2VTQ0TUlIWTQ0bG5INDl3OVZjOVhnVmR3U09jQTliZmxJ?=
 =?utf-8?B?L3ZHLzAxUFp6aHg3RW5pNWZMS2hCaDU0WkNmeS9WNGRkZy8vdVZhQmJteWdV?=
 =?utf-8?B?Nk1oa0xJWU1scyt6VGdSSzJNcFZGLzd4Tkl1c3J0QmcyOHVWaFZWdHpRRHdS?=
 =?utf-8?B?cTdrOU1VMElkaG5zOFJ3ek5hbmVJQktwazdiZHBleEtEVUFobEptVUc3SGVS?=
 =?utf-8?B?Si8xUG93TytOZ2pQRFdhckxkQUZxWUwybmE0UWpmVEltY0RSeDNrR0hsR0k4?=
 =?utf-8?B?NXA4T2Q0SHY2TFRYWDZIUG1wTXVnUndpem5MbEkyUlM1bXpBdWQveURLVkRk?=
 =?utf-8?B?Q1p5U0hVM0ZBditTZGxQdVJjUjRpZ0o4clJ6bGdMNDNlc0loZjBRV3o4U2hy?=
 =?utf-8?B?dWV6YU1HN1QrZ2RRSVg3dlRLWnhkRjMyN2VQb2QrWnFrNTRhN05hUmJqRlVr?=
 =?utf-8?Q?dvkamwTroX3f4+OQGJ5ijj5u4B5+toH6OXFiLFaLofN1h?=
X-MS-Exchange-AntiSpam-MessageData-1: ykGgcS/2opoGimPUt03pwk3cjbeKGbFp/nU=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d96d159-06a3-45e6-7870-08df0514e194
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:58:55.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AauSP1r7Qka7zXNm50jmc7lgYK/A33KiLK16Y+1slXSwTtbrw5udkFscTVZpnTtmWNSiFX8YsFptyjAjL5bNVpj7akjvAGxP72w0AVKbJEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB187423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244550

Hi Fabio,

On 8/28/26 4:48 PM, Fabio Estevam via lists.openembedded.org wrote:
> The official U-Boot project URL has migrated to the
> u-boot-project.org domain.
> 

We have a website at u-boot-project.org, maybe point to that instead of 
the docs directly?

Otherwise, this patch is much welcome as Denx the company doesn't exist 
anymore and we don't know for how long that URL will be redirecting to 
the docs.

Cheers,
Quentin

