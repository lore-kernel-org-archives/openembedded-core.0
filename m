Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F10CD5BBF
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 10:34:37 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20673.1763030071763287400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 02:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Kb1spyEy;
 spf=pass (domain: cherry.de, ip: 52.101.72.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLFGTVcRwo3YBOoTgFf9T9e40CKCm4vwR5K1Ah3iHptQtMZ4o/U11wHxnvCLcSE31hZOblt1rYk5hJP4mlvhg1yN3AYwG+zkJX42+x0Z9AJRmcDXpkLrG8YygIJtM1e4VkQhlLJs4OyL834Wjrq85KHSaYpMsgf7KEAHzvYBgo27JuH2SaBgp1rW7ZO+2eO4EsGN/2zjty/sWCadKTeyFK8eBtiw3yHXl1ZqKz7y/ufaCXQHfGkJtL6DNoXtJLVOqBEnUjYRtbQpqM5TErJwI8WQq+MvMrvLriMIihyGax4PqbU50jon1lH5YMicBPpATSDaIqcz2aiBPoqqZD4QsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBDe4SSVR/ooYL0YW9oO/wRSHRxilYectPW7J9b1ylM=;
 b=CEBqQUwnPFpN1ShvzXIperlLa/Z8rNe1ej/X1NC0EqN8ppvmHWVAdVO9b+DnfwchRDDXemKDwwkU6AKz6HjspIxAbwWOosKscUxTgXYBG5u3wbwOaFoJ346IQZzGSCsds8b5keBdwV5l2VEhX/E6cuvBHk0qWDMMGhhF3sEzIaN+PG5bWBpBcNeodm2PuTHRqraY8vOWM73I0+GqNL3aTA43eAsoVuxKg66z3mb6+V+UVFYdFl9Nd6HKO3sYlUvwZpcNSxpemxAmCGvvEMGY5rYspL/2QWzEKJm0k4d/IhZeoOEZuN6gUMnDqPcXGDWkjwAqdIuLsGsB6YRYfiCpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBDe4SSVR/ooYL0YW9oO/wRSHRxilYectPW7J9b1ylM=;
 b=Kb1spyEyHGb2oxpqsA2wcej9d2VHm1ONFnuhd2HbAqGzpK/CcwDyn7n+XnkXu9zvprnaYzXufD3PG2lDUPdXxvCAG4aibs9IRvmal2hqdTuXLkj1NsTMl0/XVJtM8mjvSHlEKQS5ST5V7Sk96VgiqFKYMm1K+ZkH0a+QuBfXEwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9557.eurprd04.prod.outlook.com (2603:10a6:20b:481::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 10:34:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 10:34:26 +0000
Message-ID: <90d2a0bf-5b88-4c1f-816a-281faf73d50f@cherry.de>
Date: Thu, 13 Nov 2025 11:34:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] go-helloworld: fix license
To: peter.marko@siemens.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251113081148.32411-1-peter.marko@siemens.com>
 <f37fbfa0-d3c2-42c6-a6df-8916e2b92af6@cherry.de>
 <AS1PR10MB569727915AEE60012FA94E07FDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <AS1PR10MB569727915AEE60012FA94E07FDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c0ef05-d5a2-4bb6-4be7-08de22a03849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHRqcGhURkpnaVFhUmR6bi9BcXRxUEpzWElTR2hVbW5pMkFteFg4TDJOY3JW?=
 =?utf-8?B?a1B5TjdDYXFtTUpPc3lmUVF2TmNFblBrVlZDSlM4TTBHcld6TGFmRzhiWVY4?=
 =?utf-8?B?dkNidFJqelFuTFdOMkFWQ01tcTBzWXBOU09sUWdBbFlwelY3RVd0Q2lNTjBt?=
 =?utf-8?B?R29ZSkNkbTNaaWMyeHRTSE1sd05mQ0ZXYTlaRHdodk03cklPR3NFUngrSWgz?=
 =?utf-8?B?WkQ3cTVoMHd5cWNYc1BrOTY3T2tzMkxTMTlUWlcvcTMyZHNPR3NscUthTWly?=
 =?utf-8?B?eVJBRTNkbHpkQUZ2eHlxQXJrZnJMMWdvTWhkOWZ2dU1lanoxbGU3Smt1QTY0?=
 =?utf-8?B?ZGE3bUlPbnJ4QVd5V1luTDRqczlYUis4WGVVUmNHMjhjOU5nSGlDcHpzem5N?=
 =?utf-8?B?c0VwK3JPRlBvakpPSnd6cFpCMjNHQWpINmpvZTJ4SU5TU0FVT2wybkJlUm5j?=
 =?utf-8?B?cXZ3aE92aTJ6ODNhc2FnenhpTGdwcXpDSnN6S1VvaENXbXZrWHNxWXRMSTR0?=
 =?utf-8?B?Skh0RVZpTUM1NGlCZlp0UktpV0d6SjNxOE1lcUw2R0E1emQrSVhZcU8wc3Ns?=
 =?utf-8?B?UjRUZWIxSXI3NldaRGN3RllvamNURGN4Zzh6T0plOWVGZVVOZk1Td3BWYjh6?=
 =?utf-8?B?THdBeU0vbGY5QU1xTHBPTTFDcWpHNHNZdWIyRHJUWS9vMGlnRGlWWGUrTkNX?=
 =?utf-8?B?Z3VJQytGaWZjOFV6d2pvZ0ZNS1dZQlh6aTJWTjllR2h0ZmR6ZUZuU1F1ZGQ0?=
 =?utf-8?B?YWE1RFpQM3p0QkZvNDdzNnNPSHUyZm5jYUROK2kzZ2tFcU9JT2dkTHBoMzMv?=
 =?utf-8?B?U1BOMTh0VTVwNndRZUFGb3lyMFRRVzB0NmFDOTJOYzFvSFA0SHJSZVNsL29y?=
 =?utf-8?B?RzEwKzZ5WVBWRk1CZ21GT0E5ZHN1TFovYWpuVXJNbEJ3WXpWM1ZONHBBOS9l?=
 =?utf-8?B?a3hpUDhsYzIzcFp5ZXFMM1RLeVNOTmMzZzJibk5VQ3JndE50dTMyRklKRFBY?=
 =?utf-8?B?eHBzdUZOWGt1MkR5eWs3VGZ6RVZ1M1RlNEw5bHg1bDdrS3pBcWtUM2hNV3cw?=
 =?utf-8?B?TjFoTzFad3JTZ2ZBM1RFUmdWSWtLQ2YxMWt0dlFSLzZkNVBScmg4bFNYM1NO?=
 =?utf-8?B?N0VSbCtBZGF5N0xkUTQ0aC9XUGVvdjZFWDFUN2gzOXZDb1poRWExUklZTUN3?=
 =?utf-8?B?VGEzNHdQc3dOT3BBRllLQXNaREtUUE1FT0ZYRWFCQ2RLM3ZpM1laT2UzZXMv?=
 =?utf-8?B?UStwNnU4SnVSUmloclVXbU9pZVYvRjczZEFXR2RQQVBINXdrMjFwUjRhY0dY?=
 =?utf-8?B?THV0SVBWbWVWQXN5eGNPVU5DMWZEd2F6VE5TZHpPTVQ3TW1BRnVxWHhqWkRj?=
 =?utf-8?B?bDBDcTZ1MjdQNG9CdjV4K0N0S3dqdWRyMW1GblRXS3pCK2cxNDVEUlNnd0gx?=
 =?utf-8?B?bENJTS9zdERVQktyM2FMRGtGaDBDZlF0eDVKdkh2clNQcHRIbmo4cnhsZk5x?=
 =?utf-8?B?Kzdya3FhY0xaM0pGZzBsZm5OOEM1SE9OMHc5Vml6NXJtZWlUVjh5Z2JJQVo2?=
 =?utf-8?B?UEhrWmJsVUxGYjBSeHpxVEZyTk44ZSt1a1pWa1BhOEhhaGYraEt6MEgvOHk1?=
 =?utf-8?B?Q0NRbC9zTHNRV2IxcDltS3pzdzRIbGJ1RW83K1pjMm9MVFRvTlkzZ2RodjZS?=
 =?utf-8?B?bk1lUVY1Rjcyekh3Umo1ZkErUUxhSTEyak9wUzlJV044c0FGaFAyNHRQMk9p?=
 =?utf-8?B?b0Q3K3B3RE42bHlrcWptc21OdG1XSlp2c2hwK2lNdUc0ZVhTMVNvbFU2Vm9V?=
 =?utf-8?B?a3E3U2lOTjU0RHU5QnV2aTdFWDNDK2UyM3hpc0ZCOE9YeHpNbzU1MzM2dGYw?=
 =?utf-8?B?VWZodVdra2ZXMXAxMUJXSXNpZlovd0NUY0dUenIvVkFuVFNYOEVPRUZiRnpG?=
 =?utf-8?B?S1AvZFJ3SkFnSTU4RVhRWmdsR2pLUXJoWm5CU29YdDhSenlzRXoyanh2MjBs?=
 =?utf-8?B?d0VmNFlYc2VRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzFGaGpHa0kySUFzZ2dWUzZHVklFbUpwL2FtcE9mcCttcm12eGZIYjVOYUJ2?=
 =?utf-8?B?cWhLZS9iUzB3bFpla1ZWWk4xd2twNHBhcWIxVEhTc2JMUERnV0tLRXNZSWk2?=
 =?utf-8?B?QVRMUzFONFFRNmdvcy9FbXkvVzN4cG1taStPaHNXVmppUXNkcVJ2TEQ4aG1j?=
 =?utf-8?B?eWVrMWlKUlJqWnByYmh2TmNQeE1kcnRicEtCTFhZdlJUb254UDZDYVNJM2s2?=
 =?utf-8?B?alZiVDlkbnBWUlh4NmtuNnhTMGUrMmZXZ3hLN2tjWEYwd3NxdHEyNjB0THg0?=
 =?utf-8?B?REx6MGgrcGc5NEc3Y2dCcWhnbWpJWDNjVlFWdXhTOW5NbE9xTVdqeGZPbEMx?=
 =?utf-8?B?UC9KbUM3Mk5uRVRMZ051WHJYeVNHVnJ1NUlNWFEwUm5PMFhCcWJ6dUpYV0VR?=
 =?utf-8?B?UTZGRWI2d0R0ZjlnMFFObFpDRENWZXorUEdoaEVncFFtNUlIMlU5ZjIvOTc2?=
 =?utf-8?B?aHo1N3BNeFV5b0tHRXFmeFdaNFBSMk9pQVZqRkk0M0RUSjBoZXdhMXpCdWNQ?=
 =?utf-8?B?SHB4eE5FTzV4eERFQUY2K2pJbHFmOUVFbmlFT0h5bXZDekVFMlVvQzRnUzN0?=
 =?utf-8?B?cG5ieEJqU0pFaHF4dzlwZSt1OU40QU1IZHY3amxFKzN1eVdjaXNEUFdlZDM4?=
 =?utf-8?B?eFp4NTRpb1EzY2FIeWRLdmZEUHNMeFgzSDlhS1JmWllmSDRqMERoMnR2TTV4?=
 =?utf-8?B?enR4SHBTVnprUHhjRGV1MFl5eG5qYkw5bitHRXVJYUkxYzdYYW1SV21rdlIz?=
 =?utf-8?B?OHY3ckRiTkVYTDhiTE1pT09mWEwrSzdpU24rMUhmcDJYcjNVckVqU0lhKzds?=
 =?utf-8?B?S2pLRXV4c1F4VDQwcm51UjRZRkhmaHQrWXpUTEpudjZOSzV6cjRJTWlXb3l5?=
 =?utf-8?B?eERpczQzZ1dabWJXdmxYc0pIR2FaSVM2QXVTNFlFVXdEdERBWmJYN2crQUx0?=
 =?utf-8?B?SSszY0kvdlQwenc4dlc1SVJmYmMwWVdLZ3VZMzlQbUJ4QkpGalg1NHkvMkYv?=
 =?utf-8?B?NFF3TE1WbEI3NVRnU0JXc0xxVmR3UzNOUzY2Syt1SzNpblloWkRBL202cVZT?=
 =?utf-8?B?MW03c0hObjdOS1plOElaaWVTT3JHSTdWcFhWVUxXTlRUYjF0MUU3SnlEbDFU?=
 =?utf-8?B?V0RTcWNlL1B1WUdJRHM0Sko3ZFFob1czZkVCY1RxdU83Q2dHRmEzVzM5a2M1?=
 =?utf-8?B?SjZTU052TWR5SEE5b2VOUUUrNnRJMUtERnkxRWpqZXV3VGpHaytrMTFaRndj?=
 =?utf-8?B?MDMxNWhLOG9YN0pUcVRFVlUvRTdHS2s3bUtaVmUyWlBYSEMxd1NiS2cyVU1C?=
 =?utf-8?B?dXpUbGRTZmRUemFhdnF3TjE1UjNsN3QxeCtDWVlkNENnSG9SbS8rTWtMTXZm?=
 =?utf-8?B?NExUcElRN3l4LzhNeGI1aHNaZWlPSjNJOEVKcU9iYjY3WXNjYVJWd3Q2cWxT?=
 =?utf-8?B?UElnOHVTTko4cGJGaFV1S2VTRHB0OTBBUDl4S2gzWWNoVkpEejcvdjIyQng0?=
 =?utf-8?B?b0tCcDUrSS9LV2VIVDNxR01QSjFoSHZEeWg2a01jUittblg1V3A2V1JIK0dF?=
 =?utf-8?B?N1JqUkNwMjNjb2N1TGVvbnEvUFRmd25kaXJkeDhDc0ptWExxSlNadnEzVmdv?=
 =?utf-8?B?a040b1dQcUtSeVhtdzBKaVVPWDFneEYyelhJOG5SWng2NGFnR1ZhNGNhMXpz?=
 =?utf-8?B?Q3BvaStsMXdoQmxPQkMybDkzaTNuVUFrR3FhZktRZk92aDZnb0s4UFViZ0hY?=
 =?utf-8?B?MS9Pd2VVRXNQUE9lSC9QdEVLNjMwQnF2d1FrZ0RuamlEeTZjRWt5aEg0c3Vi?=
 =?utf-8?B?alJwaWI2RFplTkhQY1RpUXpndmFjUnZoandtTjNnOUVmWUtXYmpCTC9WTkI5?=
 =?utf-8?B?Y2dPdkU3Mmoramg1ajhNSUN1Mlh6bkRBcUZFeWY5LzRqMmNWd01RYTVhd1BE?=
 =?utf-8?B?VmVIVDh1V2pncWxFRVdmNWswenVkTUFNTnFreUNWTnBhenZCdGRybG1VYmlI?=
 =?utf-8?B?KzY0ZnRYK2JDbTBWbTRKbzFHTHNSMnhHKzVZM2VZejdiT3ZvNzN4eCtaR0Zp?=
 =?utf-8?B?TVlIem9nNFI1Y2xnczJNQ3Z1dkpoUkZHQjR5MzUrTUZWcmQ5ODNjYnlYa09k?=
 =?utf-8?B?NW9hSmtQQlp5Wi9Ca2h3ZDMyVmQ4dlNDR1ZzMjRiL0VLTWZTOFZhZ242NVRy?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c0ef05-d5a2-4bb6-4be7-08de22a03849
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 10:34:26.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52LB8RalY2Wyhm95sd6Z+Mwl72/MKd2XCf35qAfWDkMotIqnxBRMokhXqcwBm2/mfhKZEPCThqCuDapybQVN6ds2aeTTiIRMixxmIRFi61E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9557
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226234

Hi Peter,

On 11/13/25 11:31 AM, Peter Marko via lists.openembedded.org wrote:
> 
> 
>> -----Original Message-----
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>> Sent: Thursday, November 13, 2025 10:52
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][PATCH] go-helloworld: fix license
>>
>> Hi Peter,
>>
>> On 11/13/25 9:11 AM, Peter Marko via lists.openembedded.org wrote:
>>> From: Peter Marko <peter.marko@siemens.com>
>>>
>>> The example repo doesn't seem to have ever been under MIT.
>>> It started with Apache-2.0, later changed to standard go license BSD-3.
>>>
>>> The license file exists in the sources, so use that one instead of
>>> taking it from the OE-Core license directory.
>>>
>>> Note that this was already fixed in scarthgap and kirkstone, but it was
>>> not submitted to master. Also the old releases still had Apache, so this
>>> patch is different now with new versioni of thie component.
>>>
>>
>> It was submitted for master/walnascar but never merged:
>>
>> https://lore.kernel.org/openembedded-core/20250812-go-helloworld-lic-v1-1-
>> 07ce00a0f252@cherry.de/
> 
> OK, sorry, I'll send a v2 with updated comment.

No need to.

Just don't know why it wasn't picked up in the first place (the unusual 
[master walnascar] probably escaped some human or software filtering :) )

And then I forgot to ping :)

Cheers,
Quentin

