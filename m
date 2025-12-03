Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8E7D12D5A
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 12:42:06 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14057.1764765710691777485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 04:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FUq83PU/;
 spf=pass (domain: cherry.de, ip: 52.101.83.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIGnlTS9DeAD0VZrEslY2SC16NezxefTc7VAqn7dUiCJCiWx2LLNugPHnpWA3TeKI0C5Zk16MHgjWDxYjo6xD14fzWdAw7VtQZwzMnaD9j+DTIIsv95MS8OYEjDzESaBxcdx4b5jEgtoRpvweuLCQOd90hagK04soxjLuIcp4WbKrDeZcKGnEHE8k0vmofok7xv5D6Zbyx4O2HOq069lcjqyTCg90AjsPPKtFBaUjD/INvVBIs6OTQaGTTTnpf6pIZAudktM3dvNfB6EM1X6u6OYjIFE51vPG7A9AU4HUVE8I9Fq6GNKHTDq2jG9682mKCy0ILSjRgPW/JXLLHfg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtuRYTfl+jx2W5t3umADOIXdV66kOPl+bM7yu1ASMoE=;
 b=YtoJI2jqNhTxnMzCR43e0gdEMXRGijSG/m4dGNCzf2GJVM16SvJ7e/6JpGDbZL7Z6l6rqufuyebv1EeAtMzKqXl3oSedETLJ/90Oz7FX9ky9YESpbx3CPlaW4YvvZojfJz71zPJmWDj0COn0ci56qA9X4DQoNjJ7jUUxRf3HQ/aZxkKPtsyledbr8Y19GErlZfpZNLxIL3mxd4nF1kVQgbMMQgtGX2+ljQ77I+ZRdzP7MSyB/8SwNJfVcVOeSG/SuqsWttphbXKF00Pehh9TxT4aJRfaS4uktB4loLmDuSO80Xjxt327GvEMT9I3SGMGK+haOD3esxcJjBYl6tLf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtuRYTfl+jx2W5t3umADOIXdV66kOPl+bM7yu1ASMoE=;
 b=FUq83PU/6NPxGdjTI+rKFZxs41ggZwPSfhdW6Z3zeAGZdW0prMRYUNn9QD30CmJpX5Nvnyp9uGfUdCXP814cIzsqDu45WJaewy2Uh5MF+X8/Rn6z0Vpf8qd2EDd4wNV9xuPFCQQj/5+zCpoEsnqmjF7oEpcMBgJiZ9Wb2xuYly4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by DU7PR04MB11235.eurprd04.prod.outlook.com (2603:10a6:10:5b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 12:41:44 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 12:41:43 +0000
Message-ID: <51ec8963-34b6-466d-9d16-10cb191036c9@cherry.de>
Date: Wed, 3 Dec 2025 13:41:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] python3-sphinxcontrib-svg2pdfconverter:
 add new recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
References: <20251203-svg2pdf-v3-0-879d05cb101b@cherry.de>
 <20251203-svg2pdf-v3-1-879d05cb101b@cherry.de>
 <DEOKQA0V2JMN.2N90MYX04GK3E@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEOKQA0V2JMN.2N90MYX04GK3E@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|DU7PR04MB11235:EE_
X-MS-Office365-Filtering-Correlation-Id: e5794ead-a658-49da-d735-08de3269506c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDJiTjRWRnlDeXpZRk5XZjZFaFdLbm0zS3FxQ0JLZE00QjRYZHdiS3RvbW01?=
 =?utf-8?B?bzF2YXdHOTBzZmFyMjE4VkNhU2ZCS25JbGxQVy9JM3NDWVl5b3pLZDFRN0g4?=
 =?utf-8?B?VytUTTVvNFF5UHZPNlF0amVYNEhLekFSb0pSV0RIMkJnUnpWbGpXTUNmUE5k?=
 =?utf-8?B?cU1TTkFkdVoyTEQ4QmkraVc2ZWh0bkFDMjBUYWpOZVYvSk5Ib2xVY1lhZm53?=
 =?utf-8?B?NlF2QUNBMUJ5Q0ZFZ2F3d0tuUnVlcEJZN3FNNWZpRG1yWmJRMmF2QzhrWWp2?=
 =?utf-8?B?VUZzMmVzbmQwbTU5UUNmZ3U1QXpwdlBGRFAxV1BlU2t4L3hieEFEVXN6UkFr?=
 =?utf-8?B?V1hJVHR4Slhhb2VwY2RHL2dWTkxSaFRHTVV2am9VMi84V0VWN2ppdUFKQ2Z2?=
 =?utf-8?B?cnVoeTgrRXRHNC9NcW10OWE0cFRYYWhEcHVxaWZ5TTFySEswcG9pUVJ0WThx?=
 =?utf-8?B?YXFnZFg3QUVpV1Q2YmVYZGs3QkkxZXJsanRDMlRkM0MzM2ZiU3NCWC9NZ0Ri?=
 =?utf-8?B?bU1GQ1pSejZUUC9sNERrQTUwaVphYmFpTWZxQkx6RVk3azMvVFd5TU8xRnRz?=
 =?utf-8?B?dWxNNlJuZEpXVkwzLzNFM1pabktUaU9RR0IzRXoyakFPZGw5aFRHMnVqL3lM?=
 =?utf-8?B?UFZRVmVaOVl4N01FRkN0OXh0U3VZWGxWZ05BNi9lR2NtZkNyT1RFdEkvdUpL?=
 =?utf-8?B?alRsazdYY0dBbitZaGdGd3hSSFEzNjFBTjNJazN5bTZYTHpNY3dZY0tHK1JQ?=
 =?utf-8?B?WmRHK3RzSzhkRWRPUG5hNGk1WXVxQnpnZm1Mb1c5T3ZYQ1NRN0F1UVJQcEN5?=
 =?utf-8?B?MVBWaE5qbmNVOC9vTlMvSUhtNU5FSDFLbkx3dVl0bDdKOFJZMmNJeFpHcHZC?=
 =?utf-8?B?K2FLOWN6L1poc0F1V2RhMWN1eExhMklhTVR1VVY1T0tDWE9PMXdGVEp1RFNp?=
 =?utf-8?B?eFlsTUVXK0krU3VWQmJ6TVV6MTBYcTRVL1hvbFFyNEVzSCtmRVJDWTl2ajJJ?=
 =?utf-8?B?bnd5MThIakV3SXQ4Z2xqY3BsS0RBSG51SlZwWC9MRjJZRzBHanN1Wkw4SG00?=
 =?utf-8?B?U2l1eWI5MEtNTWxEajV6bWI5dHhIdzNHRTU2MmtBK29FRnA0Q203bGx4a0xs?=
 =?utf-8?B?UFhaMmc4Nkc0aVJsaGFldk5ESjg2enJnNkNvdUFpTkdsdThoNmQ3NmJXb0pL?=
 =?utf-8?B?S0t5aHQ5ODNVa25OMWk4UUlrSE5GUGtDWjdMdUh1MzB3Uk53cGV0LzUycGFu?=
 =?utf-8?B?Ynk3U25FZHErcFF1NVpJNXQzWE9lZ3pFVk1ZVDhQb05YTkpHSDhnU0xHTkVM?=
 =?utf-8?B?VDZpQnlYSWs1akNSaHZ3Tm1SbDB2ZUZYUlVuY2Nady9DTTNLOVMrSkk1Rlln?=
 =?utf-8?B?bktrNm1mY0R4Q3VRaHVCdVlLSUtLZ0N0NVBldENwSC93aUIvRUV0SC9aWndT?=
 =?utf-8?B?eTB4Tm94VmNGbks4RDEwU3lpcnJ2V0ZHU3ZFME84N2RYNnVkQ3dSRVBES1lu?=
 =?utf-8?B?T2t5VlozS3RJTElqU2xocmNUSzJEN2JjVWQ4UWY4NGJjRjVoTk9NRXE3Y2Q5?=
 =?utf-8?B?YW94MlVmaFludDdGWGlGMTEzY0tBUFVObUdoSDlhQ2pkVndDR1pCTmlLYXI0?=
 =?utf-8?B?MkNuMklmWEpFd2RNaHRjSHdKZzFnczhzZ0pWeGZiZHdPb0xsK1RjZmNZYnlk?=
 =?utf-8?B?LzRoWDFJMllnZXc2czVLTEZtY2luSlhJSWpHenBndWovUUdrWXErOXUzUlJp?=
 =?utf-8?B?ZVFxWlJsRDg5dE91aGdsd0FLZ3NCZmxmdkwxMFUrOThpT2p0VjIyN0gzTlBa?=
 =?utf-8?B?anBGUVRFOUZZOVU2ODh1eTNZR2ZVbVRXRHkvSEgvWUdHL0VxcHdsbDVoSVJV?=
 =?utf-8?B?NFRnMkdObVR0MWZNOGRXWGovU3VvT1l2cmlXMDkzMy9zdmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1NzR0FpY1lramhmWlRib21LWnVhRVlqdjlsbWJ2M1NidkF1WmZ4eHk4NUZV?=
 =?utf-8?B?YXFBc3FGM2NnWWZJRGZ0V3FlKy8ybHYxcE1VS1R1dTFkcDJxZGtBQWh2N3RC?=
 =?utf-8?B?anhPM29Nd0RURVpFMU5pajVNL1luNjBCVjY2Uy85VEtSLzJ0S05icTRrbURt?=
 =?utf-8?B?TG9hMWh4MjNQUjNWYjA2MmZ1dEg1am92RDZaTTlWYitwQld5d0R4WGREcTRI?=
 =?utf-8?B?ZFJOOEVkUnU5MndLM2x5VFFOcnRib0F0alYxTm5vM2NtenlUQzhXSi85b0Rl?=
 =?utf-8?B?QlRKekQ2MXFmQ0srU25jemNrL0pjTFRoVHpkY2haSENpbjkrelBwUzRGajVi?=
 =?utf-8?B?SFhoNUs4emM4N3pXeCtBTUhWQ3kxMkV4K3pBNStSbW5HRWptcEROWlZEOFRX?=
 =?utf-8?B?OTErdHdtNStmeHkwMkhhWUVVMzNyNDJFbC9NR2lRQjkzd3R5M0gxWnZkYmtN?=
 =?utf-8?B?VTcxQkZyM0h5VHBrdUZNMXFBd00wSkd0YU5yMG1qN1FRYVQxQzhkUTJTV2ZW?=
 =?utf-8?B?WDlBV0t1N0VvY0VNUmgwTTBZNHpzMERGUWtTUnhTMENsbnpRWENyVkIzRFIz?=
 =?utf-8?B?U2lMS1BGbUxRQUdzSWg0QmdlcmZsL25kdERqQ3l1czNpVlYwd0xTNHFmRjVp?=
 =?utf-8?B?eEk0Y0pXMytYellvTFp0Um5XZkhhL0hBSS9QUjA3T1cvWUJSNG5jK21RanBh?=
 =?utf-8?B?OFZldWdLQUFRZFFvR2R3ZE1hSmxHd2l6eVV3KzQ2VnM4OFpKYnhiZHEvUDB4?=
 =?utf-8?B?bVNROURVanZCTXpkNXpWdllsMHdHK2dUN2pXWE1mNzBKS2hIM2dzL2dUdXor?=
 =?utf-8?B?K0NkRjlob1RkU1ZZTmc2aDZsMzc4YzdQSFJLKzY5bngwYTE1bjlKWXFwNXh2?=
 =?utf-8?B?NzBGc2NhbTFkcmtERWxiWC92d0ZQdld2ODlZVTg3NDBoZVdwSjBLbXRKUWtW?=
 =?utf-8?B?WnpTTUJpLzJXdTFyU0x2aW5WVkRSVDhEKzBUTmc3NHdlSHljMjF1aE15QUx0?=
 =?utf-8?B?STdHbzZYSGVKN3FmY0dCUHRmOXhUL1BUVmZ5amhrMVlHZVJuYzNKVnNvenlk?=
 =?utf-8?B?NFhXVHo1SSt5RzRDbVA5QW9EczNwb3FqbFdCYmpPOUp5WlgrY1ZuVjNqY0dh?=
 =?utf-8?B?U2R2TEhqemd1ek43dGhOVDRzMkJ3Tk1LR2RKWkhTdUdybk95MGcrVHdCZ21v?=
 =?utf-8?B?NExIbVhLbko4cFBzMHdWSjJBTFM4ZCswdFlITHFYcXk1UGY3dnpueTl5cWdO?=
 =?utf-8?B?ckg4VUZjdzdhanpPYWxTQ0w3OHBjNzRhV1ZzN1h4VHJpeDFoSTlJN0tYOXlO?=
 =?utf-8?B?MmYxV24ydmZ6SkFneTdxZWJaR0xPU3pIUk9ib25GN2txTGV3eFFxZStPZjNq?=
 =?utf-8?B?cm16ZnN3T1FIem5SQkZmbUhmay9peVE4M0FaQ3BKWk5EWURqTzdZaW9LUjNU?=
 =?utf-8?B?YXc1WUtMV09BTEc5TTZnU1ltbTdINnhxdzgzOFVTaE5EcjdWSXhMUWJjQTNw?=
 =?utf-8?B?SG92RmNOMGRLMVI2cTlaRzdwQjVXVlp4bjhNMUNqdDRqSzdBVS9OTU9rR2N4?=
 =?utf-8?B?RGpqQldUWXlZalQ4S1Bvc0F4R2VRZkpSV0EzYTFhdGY1SzRJNG81UTlCMzBH?=
 =?utf-8?B?Z2NkcEQ4a2Y1MmJJOTBwUUVyR1UzaGYxdTJOTVM3NVpIWUJpaDhwdllCeURw?=
 =?utf-8?B?TmZscmlQblh5M1NaMGtiUGNkL0IwUGZGaXN4VmRpNEh2OUlpUWd1Ym03K0FZ?=
 =?utf-8?B?MmtLZVJITXZDL1N0TUZ0UE5pMHVkY2dHcjAyeno5d0JSYmRYQWN0cGJnSDYr?=
 =?utf-8?B?OWNGU09RMFZDajl3VW1PenIvdllsRThLRjJsbTRNallEUHNLU1JtMWJhOEdF?=
 =?utf-8?B?QVcvcmFCdi9pTzVBN1UxS3cxRmNmYXUxM04xVlJwYnpZcUVsbFU4NUJPalZG?=
 =?utf-8?B?SFdFa2h1bzErM3BWQmpFYk9qOTVZM1hnUlVDK3NTRWNGODVZV0E0VE1hcy83?=
 =?utf-8?B?bWd4LzJrVnllL3cxQTBkUHhkZExUS0s4dHVxdjNnRDRrVDJKV2srTVJpMUFF?=
 =?utf-8?B?RHVJNjRBck5vMUZRY3k5UGdpOHNsd1d4d2FQMHp6QjUzRnhNbkFLa0FxRlNx?=
 =?utf-8?B?dVJXTngwaGhBL3BadUkzaEp0Z3grSmcvdFFoMGVqc1o4OFZuV1o3SlhBclZu?=
 =?utf-8?Q?xd9teaf083zpUaMtEaDAelQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e5794ead-a658-49da-d735-08de3269506c
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:41:43.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZSZMAS4V8D3vO9f5RLsanZ2wBbzttbgwSmbWo2ESTUuwHGtaQ6qtCunkt2QaF0sJEj9Wls0AsYMNBEEStCZ6nO/fKAR4usITdQ0vJ1iZbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 12:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227224

Hi Mathieu,

On 12/3/25 1:18 PM, Mathieu Dubois-Briand wrote:
> On Wed Dec 3, 2025 at 12:32 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> This will be a dependency for building the Yocto docs soon, so let's add
>> a recipe for it.
>>
>> This does SVG to PDF (or PNG) conversion for images used in Sphinx
>> projects.
>>
>> It exposes three different Sphinx extensions, each using a different
>> tool for the conversion:
>> - cairosvg, a Python module with no available recipe,
>> - inkscape, only available in seemingly unmaintained 3rd party layer,
>> - rsvg-convert,
>>
>> So we'll only support the last extension for now.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
> 
> Hi Quentin,
> 
> Thanks for your patch.
> 
>>   meta/conf/distro/include/maintainers.inc             |  1 +
>>   .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 9f4e5e2df8..f819a21cce 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -733,6 +733,7 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery = "Tim Orling <tim.orling@kons
>>   RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
>> +RECIPE_MAINTAINER:pn-python3-sphinxcontrib-svg2pdfconverter = "Antonin Godard <antonin.godard@bootlin.com>"
> 
> It looks like this is not enough to make QA happy:
> 
> 2025-12-03 10:53:56,449 - oe-selftest - INFO - FAIL: distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> 2025-12-03 10:53:56,449 - oe-selftest - INFO - ----------------------------------------------------------------------
> 2025-12-03 10:53:56,449 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/distrodata.py", line 105, in test_maintainers
>      self.fail("""
>    File "/usr/lib/python3.10/unittest/case.py", line 675, in fail
>      raise self.failureException(msg)
> AssertionError:
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> python3-sphinxcontrib-svg2pdfconverter (/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb)
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2786
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2681
> 
> Can you have a look at this?
> 

It says "Finished two hours ago" at the top of the provided link but I 
sent v3 more recently than that.

How do I know which patch(es) were applied from the logs? I went into 
"Build properties" and it points at mathieu/master-next branch for 
oe-core from openembedded-core-contrib repo at commit 
687147e96e53a1ddb3842a3d190a683161e82167 but this isn't the proper HEAD 
anymore, so I had to start from commit 
687147e96e53a1ddb3842a3d190a683161e82167 from cgit and then go to its 
parent recursively until I reached 
https://git.openembedded.org/openembedded-core-contrib/commit/?h=mathieu/master-next&id=141b8fdfdc311053d69eab6adbec5c3b09e3acee 
which is v2. Is there any chance we can have an easier way to figure 
this out?

I also ran the test locally with

oe-selftest -r distrodata.Distrodata.test_maintainers

and it passed.

Cheers,
Quentin

