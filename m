Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8FED1F9D6
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 12:46:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42859.1764852379604008011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 04:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GRKo9WrS;
 spf=pass (domain: cherry.de, ip: 52.101.69.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxcfcnexwW+6k0zYCe0p2jGHbiKiDaqU+IFTQEs/I+3q23SGrrdNlmpClIB5tMMqY2KvvpcqFjhMKry9Sa2tuJIBbATaleLsgoPCXx0iauaG1aQcGr2o5dfTIMCj+vxMIEBJ1I4sTYgMoJl3CnQ87VmMfWaNCZkJ1aSQ8XMW5UritI63+5NbnU19sPBOOlAOQ4HMSjmHCfRvMY4VHPSBMi8wbyneZjJvcnFcd6KPka7zlsyCoCsFqmAM2T3pmx+Kx5whlic77tMNZXGlGK8/7C5w5U+2cXcpvgJmwiRvW77Bs9tFY23pmJ2eKXrzeVr0LOm1QX0hls9yls1gsUyWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol90DgBJvGuLY6CdQ1xfRiFWNSiunIqmYdrXryGOnVk=;
 b=EKOgYz6TkXFJQJmBKwddLUX/aav3oGzwrF2+Jrlaf+wrzeI44XAF5I+GNuMDIQyc0RPL9qVQ3HkOUhmXYBfkhTy92vn5CFOUUvofQyfbwomQru/aTNRyQk5Bik1C+VTnQmCSRwT/LVl7a6AP6rCtbcscnDN3yCCDqAt+WkKLd+5BOni5SL16dawJ6ZNKw0XkSB43JXcw5ehF+PsiFVXTBdKr5OJ7r7gHGs9cLZuwjCURY2EqlMlODhW5sEHAH/sOWIXUJL10i/x4qzu6q9NB5kIkbgoVpjEkAAM7uCZe7d1ojULuJjWnOxxQtSE+VidhXUyncVk69apqN1wBU2e9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol90DgBJvGuLY6CdQ1xfRiFWNSiunIqmYdrXryGOnVk=;
 b=GRKo9WrSrFqfDt1xSBTQYiF78di2fjyaTkXkmXpZCcF5SVPotwjnwTUAWqATI7w1uBJ2fNcPtPwA6SLobOqOXEhvFuFZ2Ar5FN8HU28OAL1eV3Z6Yw1fn+3FVzQR0RQnD4SVaGveVV6N5k6Km2EH0SM7WzMwnXkl1wzLjn8kjNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB10742.eurprd04.prod.outlook.com (2603:10a6:10:58c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 12:46:10 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 12:46:10 +0000
Message-ID: <aa6ddc07-4d7f-4914-b2d6-2731772a8852@cherry.de>
Date: Thu, 4 Dec 2025 13:46:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 25.2.5 -> 25.2.8
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251204124504.287824-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251204124504.287824-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB10742:EE_
X-MS-Office365-Filtering-Correlation-Id: 625f2eea-84c4-4744-fc11-08de33331a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clRiVTJLQTJsc0FWVUdLWitaN2lxSXVtOGhYbGh0VGNKQWtSbytlUTRZdFJD?=
 =?utf-8?B?YWZsMFVmbTNhTStkV2FZa2w4MGpwSnVUWnpPR1hKZ1J3NnhUTFBkcFhmTXhy?=
 =?utf-8?B?UDBaS1RvMFluV05EZW5EMFlLaldYVGliaytsRzZGd0JyUGpOTVdPcHVYaDdX?=
 =?utf-8?B?RTViQ0syYndIYWs2b3hWTUozcmJzUW00VEY0VEYzVFdPU0o2MGtkR3RCVEFM?=
 =?utf-8?B?WTVwSHVSK1lkMGlNMHZtUkF4MEE2M1JldDU3YThwNEl3YVJsTmMwS0drMlhu?=
 =?utf-8?B?T3hGcGZqdUkxVUc0ZExYTngxZitzcGJxQmxIdnUxRG5sTGFuNEZOWW1Jazlo?=
 =?utf-8?B?cFp3MElJekVIQ1BTSUYrSG9lYXN6c0hQcTVyUkJoUVk0a2FUYTZOcGxkcXI3?=
 =?utf-8?B?MkJFMlBFZTAvVDdXQWlWY3lhQXlJK21iSmdrUVIvQnZLSHRsa1EzWENKMk5k?=
 =?utf-8?B?dlV3SElsenRwNUR4S1duc2s3RlUzYW1PMENlVkNMMG9keWllOG9jb3RiQWQ0?=
 =?utf-8?B?V3ZwY1Jac2FaWEJWUTJ5VzZHSmdtQTFBY2wxcDU1RkdaK0Y0R0YwclM2bnRT?=
 =?utf-8?B?bnV2cnNiUm9qcEtSa1F4dWg3cEg3TnBWdlQ0alg4dkRDSFZ0N21VaFR3TjdB?=
 =?utf-8?B?dHNKenJSTmlSNUxIL2lTVExrNktQUGMwVStVWE9CZFVSTW5Rb3VzRWdUNitz?=
 =?utf-8?B?QXFiYmFwT2tKaTRvdE1QRXZOSzZSL2VVMXBQN2g2ZjI1bzhMUmxZUENJWjFZ?=
 =?utf-8?B?WnphMW5pMUVzMWhiSllGUVEzQW91cmVKNkNjQTZYR0FVeitKUWZSeUtvbjBa?=
 =?utf-8?B?QTZURlBSekdzQUJRbW1OYmZHMU8wV3ZuKytsY2hZM2U2ZzdUY3piRTF2TVhv?=
 =?utf-8?B?OTFQVkRiUy9zbWtMazFsOUNBSFh2MVhmem1ZNGt2cmJ3MkFQaFB5WGNtbFdS?=
 =?utf-8?B?bmFza2tlWFd6MHdYOW1HQzMvK3FyVC9EUXNEd0FtQzJkeWh0MU84Qy8wTXVF?=
 =?utf-8?B?S1BabWpmZFZ1Mk0waHdKMVhSa1VlakhEemlEdU82RzRlV2l3bmdXV0JxcFlj?=
 =?utf-8?B?RFVEQk5BZ0N4T1o1OVczQmYzS2FjcVQ3Z1pxSW1DTTJzeDVpZjQ0dFd3MGpx?=
 =?utf-8?B?cUZhTkE5OGNZU2orTHZ4Vm5keU5qaGh5NXNlWDhqUWJweDlRKzVaKzNReXZH?=
 =?utf-8?B?b2J1MXdXdTFhRzF6K0cvWWJkVUtTRUxhaE5BVmRkcWZncXk2ajQ3NStpeFY1?=
 =?utf-8?B?citCcjNyakx2NHFWNW5pN3B4ejBuM21uLzJTSDFxdFpXNDRvaWlOY2xKVU1a?=
 =?utf-8?B?ZmNpWCthajNoM1NKWnJqUkZ1RStmbzROa1BybG91TXNUeHdnVnVENTRoRjNs?=
 =?utf-8?B?RFFuOE9Lb2ZHNERlVE1md3JUdFJKa01nTlMyQ1YwRnJ1ejBpTE96MGFsWHdY?=
 =?utf-8?B?eTlLZTF0YkdqU0VkamhvU1RCUk92ZWQ3VUVhdGU5QjFFNWtrVitYUVEwRFJx?=
 =?utf-8?B?SlR6Rmhmcytueno2U3VDZG9qY0VFZWdjR01jMzJwS1FMb3BKaE5VclA2SUlF?=
 =?utf-8?B?TWNwVkRkWXI5VVNTVURrQVZSL01SZ1I2ZEtvSUVCa0ptUmJrMFNTcURNVEZj?=
 =?utf-8?B?TXg4emFOYWhPUjd3bnVTcUM0UWQySlFDSDJ4WHBJUnlJK21GZjRaTHFzMjFn?=
 =?utf-8?B?bmd6OEFFWDlZQ3BFLzROQnFwLzg0ZzJqdHZCMS9sZStnY1NCdDlZZ1V2NFFT?=
 =?utf-8?B?TXVka2NRSHJkUStsc3JSdkwySnd5VHVXSmZUdFc0Q1NiWm5DWVZ1YVlFdXJm?=
 =?utf-8?B?Q3EvSGlBMFZJa1gwKzdtZXJJT2QrVFlaem41REp6QVdCSVV4ZFh4b3BpdzVO?=
 =?utf-8?B?aVFuTktvVWg2WG9OYlRWayt3eFRnQTdYcThmZDErVWVYWTd5SXVRNEF3TTZI?=
 =?utf-8?Q?EEg2Hy1IA9pC1Lh0IDlFdJI0ETBbgbD1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTdhOVVLTEdldUpkZHBmQW44dkgwV1EvYnVycS9QelE2Sjh0ZVI0a0RwbXU1?=
 =?utf-8?B?RzFGblVTN3JrWlkxUnZqR283MnlXZkVDZURkbElaVXVUb1ZTM3Znd2VBY0FD?=
 =?utf-8?B?bzRnNExQNnEzRmU5QTgvd0k1cUdQaklHbjYwNHNlYWxNOWZDSDMzQjV2MHV2?=
 =?utf-8?B?amhaa010VWo5RGdodVVONVRrcFljcXJtaE1uVVh0TXBqaVFIV2tIM2FDb2F0?=
 =?utf-8?B?cjVocUpxWWNWc2ltSklJaXBpMVovd3RnOWtBOW8wQlFOWFJDekJUNW1SUDF5?=
 =?utf-8?B?QXZmRjF2dnQrRi9mRVgzb1VrZGJFZUhKTlFBMXA5L0lmdHVjb3dRNHBEZ2lS?=
 =?utf-8?B?eGt0Ry9HV2tud0JRMFJEeTFUSTZaZ0lZai8yQzFqUDFsVVdkNzhsQmpraFd3?=
 =?utf-8?B?dkRZR1pGMWx5Y1c4YUxjUS9sYUQ3amlUWEZ5cmlKRVhraFllVjlYMnBkVjJl?=
 =?utf-8?B?NVBReWFkK2E5d3NJOUlvQ21HajNvcDRmaENJTFlDYmswTGYzZEpTYlkvcWxB?=
 =?utf-8?B?ZGVuNEF2WFlYeUlzaS9uRU96VTRsVzRHMWxOZm9VK016Ty85YWhIeDVVYjl5?=
 =?utf-8?B?R0pKWWwvWWdYNkJadmp4T1R0V0QrKzJVdFVOTVdxclMvY05Gbk5mejFEVWJq?=
 =?utf-8?B?c1VpSzhNTHVORXh3K2kxRmlFR2RNZ1NoL1owM2lRSE9UK2xKbEdkbDJaWkl6?=
 =?utf-8?B?NHh6cjBnMzZGVU41V0t3RTRlTXo5L1BPYVpSL3cyeFBaeHBvVEpnYklSRzJT?=
 =?utf-8?B?SFlISVlwWlBFOVp4QXB0WFp5bWNKa2JCeUZKMTM0b0x2Z2hyczBzbnI2aVF4?=
 =?utf-8?B?anBiZ0pTdGQ2UDN3ZGdNUm1TbTRxOStLSW1TdGJsRGI5eTZsck1xQTFNdUxZ?=
 =?utf-8?B?R202MFNJZGFEMmNMQ2MxbExTTi8zallGR25hVFY1K202RWIxRnlyVmszS0da?=
 =?utf-8?B?QXpuZk0zTXJtUkFVVkZidU5zTjdLWk9KUURrM04xbjhkT1RLWFFIUmRDOW9i?=
 =?utf-8?B?T2lYeHlkTUpOWFRjNVRRdkl3UldKQVV1Mm9aQ3NRemtBNEU1K3B2TXJ2ZDkx?=
 =?utf-8?B?MGNiTlMybHZwcVlNVXpuOEkwcnFWc0huVnFGL3JXeWp0V3NIZmt5VFY2VDVH?=
 =?utf-8?B?eFMxWHRNWDJ3QlVDa0pPbmZsd0VNemZnaGcvUjVXNGFNT3R0R2kzd2dHdzdl?=
 =?utf-8?B?MUZHREcwb2dObCtHQlI3TWhadDhJbVNQQXBocS9SRGs5K1NnWDMydU5wRHJl?=
 =?utf-8?B?M0l5dmxMM2FRSXE4alQyc09rSVptV0Y5MWF6cEJzVjFZM29QRzA0WCtIZHM2?=
 =?utf-8?B?VlhxaVRXYVZaZEFTMjE0TzFoOXAxdzBub2pJS1ViVUZsVS9ZWkpFMklXa1Y3?=
 =?utf-8?B?SGJsKzVPRFBJYUt4YzljTjJ3bVBrcjlvanB0T2FMSzNNY0dqSWxDSDF6OEh4?=
 =?utf-8?B?Z1drMXVyazdmQ0tjaVhoQ05mRnhwUFBLK3VGRGdsbmxxZHhyT0tsYUVJVnh0?=
 =?utf-8?B?WXBQaVlwSWNHQlVObC95R3N1LzlMWmxSR1JZVEdpMHA4UmVFc2IxbVBycThq?=
 =?utf-8?B?WXptcVVkaW14L1M1Z29TeU5QdDBOVTlPR3JlNmJOLzA4aWdSU0lOdkJEZE1n?=
 =?utf-8?B?cGtOTVhoWnJDMjlmaDE5QTc0U2VLbzF3U1JaK0hFTnRhNlB1ZVh6RnBnU3Fw?=
 =?utf-8?B?TmpqR1pibGkxdjc1cE5KRUEwYlZ2b1BHVnovcC8wdUhFTTRaTE01MHQyUG0w?=
 =?utf-8?B?bWtNWHhPbEFHTzA0MDNtajBvdUpDQmVXT0dIS1Y1SUFIUmZDOFB1N3g2eXNw?=
 =?utf-8?B?dVFESWZCY2cyYU5FRjcxQTltRGExNEI3c203RGFuUExOTWZFblhvS0R0MFRJ?=
 =?utf-8?B?VVZpMWhDR1BPMVZrekNjNHBmcC83YkJXdkhDTTlPdUhXSWNIazc2RkQ4U25U?=
 =?utf-8?B?OVZBQml0TXQ3MkZrNnFtNVNveFNmbzZUWGwwbVZVeWVlWmdzbUhUa2Q0RXJp?=
 =?utf-8?B?L3hvb2ZCNWlXblMvQWRSZXlkTWVjdDk2U1d2WStIV2hOK2YwS1QzSVZjWlZj?=
 =?utf-8?B?cUlVRkhsdWVTNGVIdHRmdTNPOHpBVXJjdlVZM0ZETUFNa2M5Y2poeVNISnkr?=
 =?utf-8?B?bGU1OTkvVFc1cU1NRW1XUkh3WEVKVndLRUJHQmVQbWw0R1Rwdzg4c2x2SUhO?=
 =?utf-8?Q?asLlPqHsjuq+63lsjn4axSI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 625f2eea-84c4-4744-fc11-08de33331a12
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:46:10.8333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8U8CGPFB/E6gNkmCeB8XfpA0no33ERdtfzfMd9PJXgRUhUGNOjGFsQjounMEnDTFaGrCUj0cB+3M/x6bGd9onbb2wTpAdjpSitjTTrjheoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227291

Hi Dmitry,

On 12/4/25 1:45 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Pick up the latest (and last) release from 25.2 branch, fixing several
> issues with the drivers.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

