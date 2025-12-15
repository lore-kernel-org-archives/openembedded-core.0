Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01A7D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:12:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45309.1765793529481375894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EFA08Ja7;
 spf=pass (domain: cherry.de, ip: 52.101.69.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnQWcslyfDUJVmVKsNpM5E+jynOFlMsx4IXSoT2NM9X+J1SFyu7vNyaftVjc5UKw+P2Xlz4F50yJfHrUGrtkws6kch1auyEWEAZ+n1kvyNE2At61qAmkD4XggmeNQxZ+GrUc2dT43XQOHQ0Ci5O9KhajumSaCFlMP5jJvrJdiX+OaO22f9LfM6IzsPIP+FK6DHht4y/fWMY1m28yeTzuyan5Kx3Yj7HHusgzfHwBE4XCUG8F0Exhti6M9n6R0u+jx7ETOJXLBFV9eSaX1hRCitwlDGQyoEoYmXqZ9+E0ruuucrInXd64QE0oMXtNDZuPxmjDqKkOBBtfCHnZKZQaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hexi33m+gX9/GtDaPANvKblKYxG67MsfOGdhqkxjMJE=;
 b=sWZVkfNj1Mboo/yHEWpmY29hZteigOZDp6exYfbDlZjN7jVu8ajMTqRj2lDNYKeNF7ny8nD6a5+bDlF191WsOfh4LEvKqudrN46XunKQ6RxvZwdCvlcyzJj8mVxPf9KF6uI9AIuhyuKTce3Im4UWMUqkStFAIgtN7OjwDjU3Rcif9ScvOdh469uR54MoJ/oJbgpMZiVboriELgjRFN+z3LDkUJXaphdaGLEqbhIRvjFcJJCxdjjJ3Bba3DQQ5m+n6nSbugijYOAv4BmQB1YCEAoXrnxyXH8b9nAyBjTiX84jq+jc4/IKKQEsqtprFTtmgTBrg2UBRGdadlghyO0img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hexi33m+gX9/GtDaPANvKblKYxG67MsfOGdhqkxjMJE=;
 b=EFA08Ja7zInAjcBx0BbM53e2puWQ25FZJipTi8Glib3WM+6ryxFDRQDjQqD3e88QaEz7Tjix6EnfY+MbWMimcQUy2IGzsZZWte3ZtykmAQCmTKnlJWEF8+QerTiEzTAtRZORbJTLmF42xXASbQixHKQJ6G8GcnY45A5DscyETVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:12:03 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:12:03 +0000
Message-ID: <ddde9b52-4123-4e1f-884c-77993eb42181@cherry.de>
Date: Mon, 15 Dec 2025 11:11:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 4/4] mesa: upgrade 25.2.5 -> 25.3.1
To: alex.kanavin@gmail.com, dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251213031200.2619204-4-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj98r2YKBoL-f+i+H5Y=xfgz-ag_UPsu1treWwA2vMmqNQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj98r2YKBoL-f+i+H5Y=xfgz-ag_UPsu1treWwA2vMmqNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0031.eurprd03.prod.outlook.com
 (2603:10a6:803:118::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cc25f7-0037-4f30-d24d-08de3bc264f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHdscWxXcjdhQlhJRWNkL1czdUIvdFF2WXNzb3ZFcUhkYTRGVG9ReVBqZER2?=
 =?utf-8?B?NytRNTg1dnNjUWp0QytreXdmUEUrZmtsOVRuMmdHdDF4NWJCYTZtRHhDVlB1?=
 =?utf-8?B?aVJwS0txNlVYMDBSVGIvRlpaLzYzMFppOXBrdkxJWE4vUUpEQlhRY0E5RHAy?=
 =?utf-8?B?NUZqcVd5SVY4WEYxMDM5SWVhNXlSeldXQVlYOWozeTJMZ1YrNFN3T21DU2JG?=
 =?utf-8?B?d3RxNXhkU2xYaDBiQzRLNzU1VGdTanVSTS9TczZzbm1SYlkxY0pEbzg4eXBK?=
 =?utf-8?B?R2pURTdNQnNPWlk5NndXRStKNkNwZVhPdldLQlU0Y3F5cmowZGRUY3lKY3BD?=
 =?utf-8?B?bVFDYjdpeDRwVWF6L01jVHRKbld6c0Y5eDhiT215elJVdGtBM0NobkJaTkhJ?=
 =?utf-8?B?dUZVWmRERnVmVVJWcEhPRTlsdGlDc1ovZE9BUWJ2bVUraXV4VGpXUG9EeGpj?=
 =?utf-8?B?aHR5M2xlc2UxVE9zOGdBdGM4Uk9UQzNwQUI4NHVPM0xQRDdmd0JWaHY0aXhZ?=
 =?utf-8?B?dnRmckVkTXlhQWdZVUJhRGhBeXBXT1luZFlSU2c4aGFvOFo4YStVRkpDWFlP?=
 =?utf-8?B?c0JyUndWaG9WTFEwcFlaQ2padlVMME1VYXVTbDI2c2hjTWQxb3pYeWk0eGdJ?=
 =?utf-8?B?RDhyaWVVRVFLQlJZdFJKSWQzQWJLajJRNERGeE1qU2c1Q2pFQXVGN05CRkkv?=
 =?utf-8?B?Q0xWd2lLZnc0L3NZODRSRDRlWFFPYVVDQ3ExZ3U1S0MxU3BiQWI0WExUanI1?=
 =?utf-8?B?b2h5cDRpK0lNYW5VWm16U0FqSHVmVk56WTcwSGxoSDNZSTJTL1BwUk02UzhX?=
 =?utf-8?B?SUhXNUF5TmczaFRRMWczamlmRUZBTk9qMTVjOG91cXAvVjFFK3gvdElaRnQ4?=
 =?utf-8?B?Q0Z5N1JSdjN4eDB4cjUvMmxjWUtzNmVzQ1ZlTVJNL1o1ZVZ1MmxyMDFhci81?=
 =?utf-8?B?WFJHZC82K1BjUUI5MEtsbnY0VUQxbU1wNkczekp6RGxXelZKZU5oaHcrWUs0?=
 =?utf-8?B?U29CTjlPVEZEaEdHRzg3VGZMTm03ajFnU21zUkFXVlNOK0hlaXI1a2M5a3NC?=
 =?utf-8?B?ekJ3NkRkcFFiUHF0NkdZUnIyOFIwSEwwRGkzK1dsSHNIc041d1R4Qnp4NTZE?=
 =?utf-8?B?aS9oQzRZOGNtQzJKUzJwc05mQUNrdE5KVVdLbHByZVdRdGdBOUc3aVh2VS9K?=
 =?utf-8?B?cThZOFgvNGxibjRRSGM5N2VzZEcrdzFmU1hYKzF1SHMvUGJ4MGs0YnZjWkU2?=
 =?utf-8?B?VkdRZ2NPS2owOFZMcm1kaXRTTktyR0JweXhwdWpaaG9oZUpMUWFlR05PM3o4?=
 =?utf-8?B?NUV3clhrc2hlaVFmRHpuc3k3ZHorcHVyWlY3VzBLYU1FcjVnN0VCYnUrdnZV?=
 =?utf-8?B?OFRWQXM4V1loMUpvWkFBQU1rOTZqYlVUM2tXTDltMjA0TnlKZE9tNGpuYnQ2?=
 =?utf-8?B?WHlTUTB4ekRiQno4RDlrckhITGNLSE5ONjdocHpXSGw1YU9oQjROdUxzcGx4?=
 =?utf-8?B?VDMzTlRwVm42ZHduQWRYL01sbFBlVVJwcWZ2a2pBcGUvdjlielFDMDcwWlJY?=
 =?utf-8?B?dTlBMmZBTmlPbjUvcnE3VmpFaG4veUxBQUxCT3c4Yy9QVnprSjRJT1BWMDE3?=
 =?utf-8?B?eDQrdnBZeWorTlJGMkF3K1BUc1gwMU5FSzgyTkdiZHQ4eFB4aG1RdmRVL1Vn?=
 =?utf-8?B?SzFmQkhLTWZPbThWd0R6eE9YdzFkdmQ5c3ZVVnJuczFzOG95ZlRhZkFGNStG?=
 =?utf-8?B?bTc3SW9BTUhJQndia2FFS0MrTWx3eVJFc05LYlBLWWFNaW1LRjU1d3pGLzVE?=
 =?utf-8?B?eTZmd1pTSHJjK3JIam5zcGZ5WGZNVUZabG11QW9GOS9KTktxUzhQQWEvS01P?=
 =?utf-8?B?UGIzdFFmVjZlZXU1K1V4Rk8rTzlIRnFnckI5YmFCT0RFQjZaVVRyaFV4VWYv?=
 =?utf-8?Q?g0RteLcMMZ+3s2iNjepBkzCm/YFoMJ3j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGpnSVVTTDhEQ1RTYkUvM1Jwb092bkZvQzdDQ2ZNMi9JV3VwWGEycjYremtR?=
 =?utf-8?B?ODN5VWF6T1lBUWJjbWxad2tKa1dzMWRkL1JoWjNCQWl1WnZ2YUJzNTNsTi9N?=
 =?utf-8?B?bWZJT3BsUnFCYlBmQ1JRZnRiaEJOOXd6TEQzQTQ4czdhRTlwbTR4OStzdDRQ?=
 =?utf-8?B?dnM1UDFjQmZHY0p1azhETnRtUnhlcHpZdGJYVGJ1N2JaY1J4NEZlaVl5R0hs?=
 =?utf-8?B?MW1ZNG95WkpNS2t4WXdaWEp6aFA3QzJkcy8wb1lsV3FOak1KTWQ3QXdxSlN5?=
 =?utf-8?B?UldmeG4zVU9GMXBKNVFKNEZPQlFEZ2l6N3B0eFlGa1ptdVJ1a2l1QW83bHZP?=
 =?utf-8?B?V044RUppS01yWmN6RWF3N2wrVkNOSEgvV3kxUUdDYmNrTERtMWhLWFdMK2tQ?=
 =?utf-8?B?SlcwMHc0MU9SMi9ONFNvQnJ4SWtFc1BTU2ZyNGxqNG44ZERobVc3cGVBRDNN?=
 =?utf-8?B?ZGZGSWdpZ0xMc0tQeXNpcTB5Wkxrc3JSTnlyRDUvMkNuL2o5MnkvRHMwVWhz?=
 =?utf-8?B?Uk9PL1R1UXRtczdYblhRZHJnYmJnMG9OaWVzK3RoWlV2NWVXS0ExN25CV3o4?=
 =?utf-8?B?YWlVMlo1bXc4QUN5TkppbUN1SlZ5RlVsVHRUcVhvaXNrRkkwRkJDVG51ZnVX?=
 =?utf-8?B?VUx1SEt6WGRZb01LMDF3bWU3T0Y3ZkVxOUtNcmw3ZUY2ZzlqSnVxdnVsZ3Yz?=
 =?utf-8?B?ajVPZmhJVzJ1VXRmQWhKMStESTFGdDh3SE1rd2ZNNlFqSW9QZzd1THZXanBN?=
 =?utf-8?B?RU9ucEd6ckgzb3RsTUQ5NVdPZTE4SCt3N1N5WklRNTVhd1BHRWhzNEFIbFFC?=
 =?utf-8?B?clN6S1hVeTNkdTdZZjQ1cUd0UHl1VEg1SW5FWkdrS0JoWFFqRVVETTJhdllu?=
 =?utf-8?B?NFRtWnJSVGo2bVljM01aT3psTmRUdVJ1cDcvWFM3b3dDblBYQ0UwZlo1dnpN?=
 =?utf-8?B?V0FucmFRQWlJb1pWaXdZVXdzclRydk5WZ2xUaitEdG1wQzdqaVAva3hhNUFs?=
 =?utf-8?B?M1gyUnpNdDRvUzNRTkx4V3NidE5aUU9PU2xEZkhtenB1cVpzMDV2UnZIUHRq?=
 =?utf-8?B?TzNaWlBEdkVhb1lOYlQ5RVFNZ3ZHZTNoNXpTczVZaHdDU29hQjdsRm93eUdh?=
 =?utf-8?B?aTVQS0YzYWMrUFl1SFlCdlg3eldLRlIxR2VRbkN4NDJVVWhUcGNCZmFjbWRx?=
 =?utf-8?B?Yy91LzdrTThlYjBjMit5dXZVbVRxbE83ZERPdWhoaVBId1E5MXBscjV4K0xv?=
 =?utf-8?B?RDNtZ3lXMlZTbTZXTlJQRnFWRnNQTE5SUGdsanBRV25WMFY0c0F5eWlRZHRj?=
 =?utf-8?B?bTUwYXVuVExpY1pZT0Q2aXBBVDJZRVlzTTFaWllMdTJEN0lMYTYza2ZFM05C?=
 =?utf-8?B?SzFaeUxzczE0eHZOWjF2NnRPVWdIRDliYW5hWXpQTFp0M0RWTFA0bDFTUjA3?=
 =?utf-8?B?dnFTaXc2K0lTQld6TFJVVGdtMmFOVHIyZ1daa0FtaFdWdGQ2bUFkdnM3MHV3?=
 =?utf-8?B?YWxmY1N0VkZySjFvUlJCT3NmMVNEdDVVVlBWbldGWXVTOEhlamJVSEcxbGhz?=
 =?utf-8?B?Yzl1NXMrTGZETjFxdHN5ZHBjaUt6b3hGdC9IU0xoZFI4c0xzWjRVTkVQL3R4?=
 =?utf-8?B?aWw2UXNkaWg1MmxwYWM4WnFJUlVidmxCVklTMHpOdVVpQmwwV1VzSGtXOEp6?=
 =?utf-8?B?UTUxNlppNjlUenNMQ1Mwbklld0VJYmYxVENsTGxHK2d1ZS9MZSt3Mk95Y1lP?=
 =?utf-8?B?bmFKdVRJbEVxWmRQTEhuWmhEZnE3RlhzOW1tYzNiYk9LMDNEaEU3eW5RQkVx?=
 =?utf-8?B?L3hMWWMyWDZqellGWVg3THJseUVzQ2syMUNpYXprN0tRdllYeXY2MnpzbStm?=
 =?utf-8?B?QWZjZWdsTFJsNFZLVXNmMVVzTXNwWmlHc1JFNkVENmdGZlNzMlhYSFB2bEFy?=
 =?utf-8?B?QXJ5c201djZhbW5XRjIzSUtYT1FvUFVnbHMwVmlNZlpDekRpN3pLL0VWYndK?=
 =?utf-8?B?L21xMUtabDNEOUEyK2NzcGhkQ3JINnRuRTYzYVNsVmZsenFkSFVNYm5EU3M3?=
 =?utf-8?B?THZPUGMrTUNsa2pXZTZBNGpzb0NLYjBzRGttUDZqSFdzSEdzRE1BVmRhZzVp?=
 =?utf-8?B?cGJQY0dCTG9ueGJkdnd2L1ZpNG5Zc3lwajU5d2xGVlo3ZzNlU2hHZDNOUSt6?=
 =?utf-8?Q?Xbk/KMcTOR6T3+RerG0aNc4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cc25f7-0037-4f30-d24d-08de3bc264f7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 10:12:03.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRo3evr+DO6ZeomDGInMQ95yJxXMpzIZcw12HaEFeYPbuiInHhYb2ga6en3bPLjbCDOUXOIbQ4CUluFt8iqCvl1xQLoVz9lob3XIOpyGXqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227715

Hi Dmitry, Alex,

Still wrong commit title, please fix for v5. It's updating from 25.2.8 
to 25.3.1.

On 12/15/25 10:46 AM, Alexander Kanavin via lists.openembedded.org wrote:
> On Sat, 13 Dec 2025 at 04:12, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
>> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
>> index 136ed8623bcb..6948abe43952 100644
>> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
>> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
>> @@ -84,27 +84,6 @@ index 98e49b8fcf0e..145e72597eb9 100644
>>
>>    dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
>>    dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
>> -diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen_header.py
>> ---- a/src/freedreno/registers/gen_header.py
>> -+++ b/src/freedreno/registers/gen_header.py
>> -@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
>> - """)
>> -       maxlen = 0
>> -       for filepath in p.xml_files:
>> --              maxlen = max(maxlen, len(filepath))
>> -+              maxlen = max(maxlen, len(os.path.basename(filepath)))
>> -       for filepath in p.xml_files:
>> --              pad = " " * (maxlen - len(filepath))
>> -+              filename = os.path.basename(filepath)
>> -+              pad = " " * (maxlen - len(filename))
>> -               filesize = str(os.path.getsize(filepath))
>> -               filesize = " " * (7 - len(filesize)) + filesize
>> -               filetime = time.ctime(os.path.getmtime(filepath))
>> --              print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
>> -+              print("- " + filename + pad + " (" + filesize + " bytes, from " + filetime + ")")
>> -       if p.copyright_year:
>> -               current_year = str(datetime.date.today().year)
>> -               print()
> 
> This sort of tweak needs a mention in the commit message. Has the
> patched file been removed? Has the issue been addressed? Why is only
> one part of the patch removed?
> 

FYI, done as part of 91ff96b51327 ("freedreno/registers: Remove 
license/etc from generated headers") part of 25.3.0.

Looks good to me otherwise, have yet to test Rocket from a Yocto build.

Cheers,
Quentin

