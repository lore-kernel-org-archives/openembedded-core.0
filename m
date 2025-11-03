Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3212CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:54:30 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18702.1762170865445938304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UPzLw/Tr;
 spf=pass (domain: cherry.de, ip: 40.107.159.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOz1YtHPZbI1qm/NLUbCWmPVxHJmvOQa32XW0shCLaOnj03JyHT0hJygw8peVzjM2Z9CCscEpqUqTeozPE7yVhm9jaXTlkOwwh0hLgz2KtmXWyzHVY3WKLp7sP9WIZ4HY6KEWUCrPBlkDSNGYOAR0mIRsIzCI3VqUiExggpo/00T1DvoK+XPIbuGzrk3L/lNbrjep7eEqtSJKcMZ4pd7MXNG9bIzHLBVRXP5kJVn5PGpG3YNklqf/JCHbAMJ+GAflc+ZBGUWjff6y+XaWlior/5gtHml9BKHZC9frHNyWk6REJNbJ1262LWXgyDSIm4+wgZp9/WbuMSiczCMH56flw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3PxtqnCoEARFFcAEAtX3+IaxBrABMmloGHJn5ls1Pw=;
 b=QQqKxp3rk+1hqLKScB8KTl3AB1/MwG/bNSxyvd5VA7fPbmeAQQQtpAv7C0ndA+yERptBEMWRUTFpQwL2BicNxphMPzutc4hFm4EOQCDsCmahL/QYuGNukpngvkIyVCEza3YllNbzNSiuX0c/X6nGgom7fsjKgHoEaWS/qFWY4eqzcEcG3xuBBHgIrTCtb01ic9N+TneCNKA9oq15wvV4ROuqMjbd7w7gDh+Euf4vZSNIbDqZ8vb4d25EQ6qx1mdiHspzhPkMcT/uyb/eteo+NQcB+bGOifJZMuTX2eQcDn5b+c0+xgRLLXjGMHYRZvMjCPb8Me9gH5WhF3FJyTmYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3PxtqnCoEARFFcAEAtX3+IaxBrABMmloGHJn5ls1Pw=;
 b=UPzLw/TrWfWfCSrm++9/tLV7eE6paCDncvVw1fsvCe4fABAS28MWQEsmQosHdmrWXhdTdoyavhvPYvgCwWuShOdmGbzxjVLRWX8sVKFCblp7YIE9oRNgh9+8Q7ryOEk+X2arexgncOzEkamWFz3jP4BJcp39cAhiz923b1AKlJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10202.eurprd04.prod.outlook.com (2603:10a6:150:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 11:54:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 11:54:19 +0000
Message-ID: <3b94e0a5-6dd1-4a0e-8610-a0f60e797528@cherry.de>
Date: Mon, 3 Nov 2025 12:54:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][master][PATCH] socat: Update LICENSE field
To: skandigraun@gmail.com, nmjain23@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
References: <20251030044211.607841-1-namanj1@kpit.com>
 <ce4ea336-52f5-4da4-8180-f535039dc4b1@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ce4ea336-52f5-4da4-8180-f535039dc4b1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10202:EE_
X-MS-Office365-Filtering-Correlation-Id: b444db5e-5595-49f4-44c2-08de1acfb8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnBiRjNTQmdxNUhWVUJra2g4dDduWnQ5RUtjNDNGMTNhNGxMNGM1bFJ1YTJt?=
 =?utf-8?B?ZWRjb3BNNUtnRlVOK2x6cGVHTC9YNmxWZzB6VVNYTUxzV0xqZzlNeTFoRTZ3?=
 =?utf-8?B?LzlMNHovaUNzQmF2Unc1NEhudEJEdWhOMjlGazFOUE5Dc21jNVlIYURzM3No?=
 =?utf-8?B?Y294UXh6K2NlSkJYaVoxZk96aVJXUHVrbDNrUVZLZUd4YUhKUG5qWmFtbFho?=
 =?utf-8?B?VitQS2RmQnRWZ2FoSnh1Vks4MjdZSExEakFMT3FXcWU3YjZJazV0S0loME92?=
 =?utf-8?B?Y2p4d3J2Q3VwYWgzcnFiaSs4RW8vOXRiSGJwQWdTR3g3ZHFna2xEdHB6SWpm?=
 =?utf-8?B?SnlESFhSL2pUcXNaY3Y4MnlBWkVGNzFjOEE2b1dvdlQxZFBtS1B3SDV5clpU?=
 =?utf-8?B?SlAxTUZuMlFnZ3RESjVHY3RGdDcvT2dIUkJHdE1HZzdnT1VMK2g5czkrblZw?=
 =?utf-8?B?VnU1OUNka0laNWFueGtteFZJWWFzVnBNQXBBbjY0NVRDUWkrcUlpOFZVaEk1?=
 =?utf-8?B?bEZMQ1JSWFViVTk1RHJzNGpzQ2pVbm1KNExJRGpLRXVBSFFUbXVURld4UVhH?=
 =?utf-8?B?Y3Y2eVFWNUZpVFBWUHkyTFdaQy91SEM1SGNUSzQ2aWZpamc4YzlJYXQrODhD?=
 =?utf-8?B?aFhXaFNpYUsrcXR4aGQ1SXZQcmJQR0pvNlE2NndIVWJUbjZUUTFFamRvSzlU?=
 =?utf-8?B?dGNwYlUxTkNVdVg1K0l4aUp4MEJlamtFWjRvNGxGR01JT0plbmVmYnhCZSsw?=
 =?utf-8?B?SnlueGQ0Y1ltVUtKZ3p4MG83V1J2MU0xWFZJNjI0dU4vK1ZYeTRBRCtMSFJI?=
 =?utf-8?B?S3MyZGFPU29CRnFwOGhGc3ZwSkVLbFp5QTIwVFl2L0pmeEgvMitCZHY3K2to?=
 =?utf-8?B?dE5lbXpWYU1SSTFOd2p4NkZqU1BKWFhnZmRmL1UwcEQ0b1E2TGtZRFFoV3ZI?=
 =?utf-8?B?TmhHREM5a0IrRFU4ZXNDZGw3QktqYzg1S0NlMkxvOEtENDd5R056UENDYWo3?=
 =?utf-8?B?QWdtV3NkZWpqQlQ1RzVEZHIrcUFLQzFHMWtSb2pKMGxrUEJhY0h0aTBLN0pB?=
 =?utf-8?B?QjJjMGZqWUJ0SU0zYVB5WmNmRDZ0QlRDNGR3bmw4RHVDTmdIbld5eTZrbytK?=
 =?utf-8?B?aXhWLzhFaDgya0tKNThTT3JpdW4ybGRiQU1oNCtwdmdERUV5TGhpeTRITndN?=
 =?utf-8?B?QitlUXpyd3JiM0ZUUXdOZlhmTnJZTnBVTXZ5Q0ZWOTBuZVEzZ2RoM01DMGRN?=
 =?utf-8?B?c1BhcHFPdHFJN0F6T0JPaU9BeS9IdVJubEZiWmFGZEF4NTRRdCt2QzFua1pH?=
 =?utf-8?B?R1ZTOWVZYVEzOFFVUnhWUHNma0RtYmtZaVgxY3FhZVBvbm92QjNzbjlqZlNK?=
 =?utf-8?B?cE9vNG5jc1ZsTHlsWHJvSkRxV2U1WnFRWExoNkg5OUJpRFpHN2kySFZ5Vno1?=
 =?utf-8?B?Ny9FOG1mZjV1SVdxSUNXNFJCdS9oQ1ZQM3FDTnFkc0oyL29pb01qMGdOZXpv?=
 =?utf-8?B?T25VMWRZOEFXV3l1RnZBVFViR29GQndNUythd1p0QkV0L2FmSjE2ZVJEbzVG?=
 =?utf-8?B?NXZSbGZTcWk2R2xJNisvUlcyU2p0OE1mb1BsSnlUTG1aS1ZEVVRkLzlKbjhD?=
 =?utf-8?B?cGpiU2c2K2JrdmFsdlRyNnhxMStUbkREUEFhUFdZdHF3d1c4TUlZTlNzMjVS?=
 =?utf-8?B?VkhRUVlYallsTWVkUlNtd3A2eDBFS1g2WWdXVWRTTEttdmgwVkErUndtaFpM?=
 =?utf-8?B?MW9XWUc3czFHSFlrSjlrd0p4dTQyYnJBTEJvRFlDVFZiaGxlK0gyOERNRzNt?=
 =?utf-8?B?N25NS2VJck1JN0pheXZyc2FzTHZWYjhQZFJnT0w1d2h5SjFOc0owRjVVQmd5?=
 =?utf-8?B?TU5hcUJKM2poTDluQ1lFVzJkejJSWXpjbGxzTnFiOEx2UGUyUVdmdjVGS2o0?=
 =?utf-8?Q?PEIh9fWSbTHCicEwojZu5WqmJcjQ9vPk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUFRcW9md2xLaDEwZUlJR28wV1QyL0JiQ3Iram9pQ3ZVcExOSm5aNm9OYy9u?=
 =?utf-8?B?SUQ3ck9tTkYvWmhQYmVmQldUbXQrTEh4QWZ5ZzVFOUgzN2k1UVlReTQ5MEFQ?=
 =?utf-8?B?QkhmV2dCVGJoWU8vaW16TEJ2Nzg5WXR6VWVoUkUwWDNaZkR4bjJIb1FhU29s?=
 =?utf-8?B?VGlNd1k1T21TRVByTXgycWptamx4N3puUWxPS1NuMGljMzZKWkxTOVRWMUdY?=
 =?utf-8?B?NUNUOWdscXlQcGljMnFQZnAzMFF0d1RXcFFCSEZ4SzZRSGNiQmhNUGNXb3Jq?=
 =?utf-8?B?Qlh4V0UrbURoRnZkT3ovaXhEZDdRdXdPbkE0QXFWT095bHRLK1BiNzkwWmVw?=
 =?utf-8?B?MWJhOTNKSEFFemRqRDlBeWl0Y3kxWVZ3T282UkdYTWlGOWJmc2dRV3ljMmJN?=
 =?utf-8?B?eitCeFhZYUY1QjkvK21GM2VmZWR0eXQrVWVGSkEyUFdDZnZzSDhJVXlNRU80?=
 =?utf-8?B?V1FTNWR0YitLRzIxVVhEbmhaSWhiUUQxYk1VZ1FYc1BLSTRhMHpFVlZ3aEsw?=
 =?utf-8?B?UHJrREN0NjBYT3o3eXpnZEd1eW02c1l3Z0dtZU50NkRQTzRZeXRSMEpIWlhN?=
 =?utf-8?B?ZjlIeXhxYndlQ2FsTWszVzBQbmZtcUVaTk90ck1RYlRZaXdtNUNaVWpLZ2ty?=
 =?utf-8?B?NlZxejBXQngyV2ZmMVNYV0lvcVc4YUNRSlpPOTdPNTRNaEZzZ2wxUHQ0N0dW?=
 =?utf-8?B?MkRhNS96K2d3emw1RVhFVG9HdnJDWStGUFRvYjlOUVU3cHJUQzV1VHkvdEc3?=
 =?utf-8?B?dlh4VjRXdVdRQVpZN05XQ01GYUpsY2hkMno1L2NIdTV3N0RKeDI0WC9WN3pP?=
 =?utf-8?B?cHNsNXlWemVocmtqeUoyWkt0ZkFYY1RJS2dMQlowODNlamRXRUZZTUN4cjFR?=
 =?utf-8?B?aE5GeHdPS1UwNjdRZituWHU4WnJSMzREYVJiN2g5UFF6TUFNL0JmSnFBVm5p?=
 =?utf-8?B?MGFWc3JGL3FFNU1OL1ZGWTBJaGQ1WDdTNmJqckIycDFNWDEyd0c3T1dJWXdq?=
 =?utf-8?B?NS83S1VRM3hqdzM5K3hRNmQ3WHhnZ3hXTElnTkJUVVgzQUZ3RFBwQ0VIZ011?=
 =?utf-8?B?dTMvd3NEWWVZNzRnc3d2TTdMY05LV3hncGh5YVlhV2pyNDB1WEs1V1d2clVM?=
 =?utf-8?B?b2JiaVd6MFlENitESzJQZXNiSW01bEdUcVNjV3lSYkZPeVVFcEFZUURMdS9E?=
 =?utf-8?B?UGxNVVB4RVpSSGdhOWxJaEF6QmM4TnVMVWo1dmtDVHAyM2paVnlFUlJsV3FX?=
 =?utf-8?B?S0NDRnRsckJjTVZEUmtNTUk1WkYrayt6bFBWZFgvSERyb0xRU3pjWDRKVCtF?=
 =?utf-8?B?STg3ekNtWll2Yi9FcXBxRGdmOGdQZWJyZGovOEh2V1gvSVZoTmZOekgzYnd4?=
 =?utf-8?B?cEJEME1uTm12SmxpWXFDT044SEd4OE1hQXRhN2xXWFZnY0JJT1E2d3BnbGxP?=
 =?utf-8?B?M0NNOGdRMGFQd1Q5QWZKOEQ4MGkrMXNhL3pvNTRIZjYrdkZFdWh5NnBUdW96?=
 =?utf-8?B?NFA3L3pmZmQwdTI4MklMdFMxVk1vNHRmWWxvZUwxL1RkL3VzQXEwQlQ3WUY1?=
 =?utf-8?B?K25jSzlrZTVLYmRxTS83TzY4WjdHUnlOS0FvNldGZURiYWoyc2x0ZkRONEJp?=
 =?utf-8?B?aFJ2UTJzekRRcEV3OUNsY3grcE1HRGZqQmFWeEdQaVp3ZitQVkRSeUlPV1pO?=
 =?utf-8?B?Y1lwc0l3UktBaHF4MmF0VUROVVNXWXVXaUFBMEsvL0xCclJabkJJak1IQ1lP?=
 =?utf-8?B?MEk3a1ZIV01Ld3NoOW95UEM4YXU2bk1ubHNTREFJSHZBM2FKdGhiSzB3WDhQ?=
 =?utf-8?B?UGE4aHBZN3k5cEZuVFRVWW5sbWNyd3AydVJUdXFLZGM5K1h5YkRyZUd6U1l0?=
 =?utf-8?B?OG10c0UvWkt4ZitZYjVMa2RJOXpOYXM5eGUwN2VsWkRmT2hIV1BaQkNPTTlL?=
 =?utf-8?B?VDE5WHpkTU1wcVZ2Yi9hb3NocTlvL2FtS1QvZERGelF5TklFS1A5eFlpSUJQ?=
 =?utf-8?B?R3Qyejh0NlRmTzlFemtUVmtpWmMvSEV3ODByeTIrZDVZTGpqQmxhb0x6QXMr?=
 =?utf-8?B?TXBaMGcwYlpXUzYzVjJKajBYMkkwRmdseTM1dW8vbG5FTXlFT0d1Sk5CSVY3?=
 =?utf-8?B?N0dlVmdDcjZtcnpWZE50WnRVQ3lzRDVzS0YxUWFDZ3BXbEIrWnA1ZkhZWmdT?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b444db5e-5595-49f4-44c2-08de1acfb8dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 11:54:19.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvVnkkAvGlaOxljLu5qLTmU35U8tPVsnkm/SYlYCl4KDpljwQespr6QOeZ0vPD4Ldm7w4P2XqLRMQ2cFzNFCgalG8vvjQ/XTuPrVJZVZTDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225651

Hi Naman Jain,

On 10/30/25 4:40 PM, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 10/30/25 05:42, Naman Jain via lists.openembedded.org wrote:
>> The below reference clearly states that GPL-2.0-with-OpenSSL-exception
>> is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
>> Therefore, update the correct license. Also add LGPL-2.1-or-later as
>> socat uses it.
> 
> Is socat under LGPL? The only LGPL part I could find is some .c code
> which is shipped embedded in an android specific shell script - but
> maybe I'm searching wrong.
> 

I don't think the GPL-2.0-or-later is correct either.

The files have a top comment

/* Published under the GNU General Public License V.2, see file COPYING */

According to the COPYING file, the "or later" part only applies if the 
files actually do mention "any later version", which isn't the case here 
so should be GPL-2.0-only with the OpenSSL exception, but IANAL.

There's been a release this year, so the project is still somewhat 
active, maybe asking for confirmation would be best here.

Cheers,
Quentin

