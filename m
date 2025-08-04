Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99DEC87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 23:25:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9787.1754349907084396152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 16:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03117c3097=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 574Mb9xc3644285
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Aug 2025 16:25:06 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gsxac-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 16:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6mUz1gs2rT98c/tpefIgnZlWJsRfVzJkkyYB9QofhaA0TKnv4FRYP8BWlSm9IhXt6msPDRI/8Cyj7Cl/JwcQalN4MCkgu/Y3FvXjPxEJ8qVXBRSUaPWia05HPFqkN5dQH/BFHT/NWNvf/WrV4Qgp4w6ta49ETJrRQpcpLZJk9z/x2lKNIbv6wZzJTHIawHiNZKKjZ/hAkG3RA4UDrT5tP0to5G8+N9XhOE9mnp0SEjf1NLgMGPhrSg5FmYgedzFp+GMza+pWbTjnFVdvkFuvnfGw4HWQNK1yUrYlpLJrWWIHO6UJQMUkfAfOTR3TGoUGQPG8x8fOa2tI79TpjA0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebwr6xrs3tWwRVRpyhQ8FLyIy4AIlhKM8SMcH+wSI8Q=;
 b=YfVSjhfqqBr8s8Zoyg7rAj/g4/SUY0MZsQXHQZ9hxxaNEvTCaGBlsy19dLehWU+hGJo/ktFqje7hFXn3U4wVMvORULcd9sa/oSOgt54YPTZaCbOMFfWqYC3SITDdJ489Bv6M21tmH7pq9lsKfTZoxBJMFw1vdLEurIEa1Ni1Xyk4TestAnLJYxFAZ35VS67au20cgnxkg3Mp2TjNLEkGkfCFXfsnncRMr3JUFoIv62WDldroIAg+E2Gt8A0miNR4nhDhEaZMZUDsVfXSLepQVinqYSMMJGKO8xaxdgEx8sgzOlXh9wRwoLqUmLC1FlVl2G0vNx57hxOlBWZD+8RDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 23:25:03 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 23:25:03 +0000
Content-Type: multipart/alternative;
 boundary="------------DBSHfOiT21ncr0yu960UJ0Fn"
Message-ID: <c8c2ff89-70bf-4937-b4b4-26e18709e529@windriver.com>
Date: Mon, 4 Aug 2025 19:25:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][RESEND][PATCH] oe-pkgdata-util: avoid glibc-locale
 being mapped out by glibc packages
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
References: <20250731073934.916831-1-Qi.Chen@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250731073934.916831-1-Qi.Chen@windriver.com>
X-ClientProxiedBy: YQXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::33) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CO1PR11MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e229de-4127-44d8-7b9c-08ddd3ae2378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVZwa0lUc3lWQjJVMVM4RG9ma0RBTGtWUlNYZHdzWml2T2lTN09TQXRSSHhp?=
 =?utf-8?B?Uk5yNlo1ZkhVQ2ZXQWQ2am40UjROQlZhOUtOazdBUHdoblFTSktlTGsvN1NV?=
 =?utf-8?B?RXpRS1MrK3liQTBhZjVLa0svMEF2U1lFQmFiank5eXI3UDNaSEU2ZDNKVlh1?=
 =?utf-8?B?a3U4akpQQSswejIxVU5zRnpaR1pYbmF4N2ZRa2ZrRFRSMkh5NEtROCtVVHNh?=
 =?utf-8?B?ZmY1VTMwMjBHR1d3MFRuTmZRNUdVK3RETDVqZDhNcjV2Z0s2Qlg2eiticjBD?=
 =?utf-8?B?MVdLZ2xUdTcvaUl1ajZybE5IUkZHVkJMYWRMTFltYlNRaW12cjUzUWx2TnIr?=
 =?utf-8?B?SUxKNXBhTUkxaFpDaDJIeUhGZElOTjQ1VXlFVHZjcGdSTmZpbU9wRHcyTEJx?=
 =?utf-8?B?Rk5IUmFLcDBGeFN1U3RHTjZERnhEQnRjNnZWRFhGSmJUZEtDUTIrYTh2Y0hQ?=
 =?utf-8?B?eHRLVmZzcVBNZ0dCSEtlVHJPMGVVK3dHWEo4RzM0U3dLM2FmSVQ1WGNHcVE0?=
 =?utf-8?B?enkyQUlyR0RnTDB1SUpsaGU4UlQ2VVpsTVBjdlkrbUhDTUpWdVlRQzVudmZy?=
 =?utf-8?B?STVvNlNhTHdWdTJ3MmRsekxCc1ZTMHhmUC92QTlMY0VuT24xZEhvaldRWjJp?=
 =?utf-8?B?bjZrTnVPdFJuRzY3REZSSHplaXozcUlabGxvNW1kSlhhbDB0c2lzTkhpUjNx?=
 =?utf-8?B?ZHZHbVdzWU5YeDBrT2tIaUpybDFFTXJESzZXcnpJZFFsTm50NUJhTUppMzJt?=
 =?utf-8?B?cnBtWFhVS1hpaDA0MGRqUDVQbU1UYkViSUZFVSs2aTJmaUxNdWduVEVYcWU2?=
 =?utf-8?B?Rmt6S3RwT3pneFJKdzZILzgwUnY3SzFzb0E4OTVBWnJHMWFudFVkdkpmdTN5?=
 =?utf-8?B?L0xpeFltQ016L1BBazBRamYyLzRSWlZGR1JVQ3lndjhrSkxTZE1xR0lxNWJP?=
 =?utf-8?B?eGlicWY4YmpqelUvcHpTd0FMUHdYYzU4MFh6VkpTdzBpZm9SS3A0RitrcjN6?=
 =?utf-8?B?V2lyN2x5UmFLOGpzWmk5UzFkQlF6b1o4MlRiR2NxT3JRNTZRWU9FcnlKaGFP?=
 =?utf-8?B?d21FUTBIaXk2Wm83Tm0zYzc3YXU0VUY1Z3M5Z25tOFh4MGhQL3FwdnFFWDVQ?=
 =?utf-8?B?MU1pMFQ2ZlZPelNwWFdFcUhRRFg0dHlvOXBFcmVqYzkvZDBRMEpkYUI3R0lQ?=
 =?utf-8?B?QThleXZRejR1VVNUQVBrN0E3bkxsNytwdXM2Q1F6OVlwRVk3YmN2MVRDdDYr?=
 =?utf-8?B?KzJnSVVTOGx0dExFcFFVWktjUTNkcEZxMURGWFpGd0VoUENlOXFSditMdTJr?=
 =?utf-8?B?ZWVBSXd2NkJEZWVaSHA0U1ozZGlXVCtlVUxHNWF0aGhTaWVxcGdac2NHeUE2?=
 =?utf-8?B?VTQxS200UEtMYXpqY2FLYUpxOVBtL1AzMDNpSE13dmdvdEdPRnM4OTNWR281?=
 =?utf-8?B?cStuSmNVc2h4eDNEVFhCeHFBemJONWVCa0NDQXlFc0hKTzFDQ25maUVoaElH?=
 =?utf-8?B?bVk4TUt0bDlIeENmd2FFb2NMUG0zU0xTQVltRHFqN3Z2cE1aNEJhclNwYjI5?=
 =?utf-8?B?SWtTb2ZMWnVUaXJHMHFSdzBtOVMxRWJFR3pCaUdjd1lSUk9URGE3S1dGWndw?=
 =?utf-8?B?Ri9VQk5xSjZwbXZJSkpLMUk0TnVyN1FFaGg5Um9NSVBRQzF0ZUhGVDhnVHVU?=
 =?utf-8?B?M0lRcS8vaXpYeU1vcTdtekErSE9oNk81ZGJEa2pISUxTdjFRQXZvcEQyazJZ?=
 =?utf-8?B?R0tiallBNjZxbXJhUU9PZThqR21wZnJ1YkVBUkNyK3M0TTduVXFBc0FQMjlW?=
 =?utf-8?B?ajhsbFBUcVI3VFV3WFJlUURUTHpxWVVkZnVnTEQ2VHJXYU9FdkhYVjNaZXd0?=
 =?utf-8?Q?UDfzct0rBgdez?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGxRZXMwdGdOcWkyUGExbGY0SmZYM2lhZlp0OS9DYTNtRUFSeGpKOUJqa09q?=
 =?utf-8?B?RzBhYXlBckxsQjk0WkNIWHo5dlZQc3g4QytzYXYwWVlRbzhoZ1VGMm9BYkJ6?=
 =?utf-8?B?TzVCUnpyTjdPKzFoVy9vekdCenlGYlhTOTNhOVdNaSt6L1ZncjdqNVJBSkFq?=
 =?utf-8?B?SktUSEVpQTEyajVqa3RJd3RVUUpFU1dDbzFRRGlmWWxJcFhFNlh2QUtKREJw?=
 =?utf-8?B?OWlMT2txNlN1WDQ4KysxQStGaG45U0g1MzRJQlhWOFpGd0YzQTNwRUJ6c1h2?=
 =?utf-8?B?NkhvOG8zaHlrejhXeSsvNS9LaWZ4M0tkZ2kyelpSTkVad1J1dU5WbFpaeUxx?=
 =?utf-8?B?RlVXZjRTVytLQkJFMzh3SXR5eG1uQXJOU3Q2UTBGdVlOSmxPeGxodXJPV2JN?=
 =?utf-8?B?bkJ1emdHbWxSRmkwc3hXcFhmQ2VicEJvT0JVcXlxbTd0RnVRYzVQZkViNmJI?=
 =?utf-8?B?cnVrNjRsSGxjTERUWUV0K2x4R3NSKzJkNFkrTytYUHU4d05LZVZhUnQvR081?=
 =?utf-8?B?MFVjL3RJbGJnTW1XQUJCVGc2aXlMcXBjeGJDc1licHNzYktVQzdHd09kVVFQ?=
 =?utf-8?B?eVVxU25SQUZRVWtKSmRkZTkrSURzRmFGNHZUSHRCL0ZxSlFkZTlmYUYwbEkw?=
 =?utf-8?B?WVBlTlNzbnoyWFdFTkVKbnhWbVBGQWFMaFliK3BNQ0I2eCtLVGU5cXNRTDlq?=
 =?utf-8?B?Y1JkalN2KzNhbVd5SHNhT3QyT3FwZkVwSklKVW50aFdiOGdBNU03WmJzdFFJ?=
 =?utf-8?B?TlR4K1lneWJOMmJ1NzhQWURwc2ltQWZOQndqM2lYbmFGUlF5NlNRdGJZZDNq?=
 =?utf-8?B?SG5KMDFNd1B1dHV5SUNyL015TEhyb29hNEc2RmhtdTU4S3NiS0xvbDE0WS93?=
 =?utf-8?B?WWpzNlVxVERVWHZuY0JtODU2MERlZ2pkUE4wVGhPRjdnS3JMMjVsb1hkbGVo?=
 =?utf-8?B?MGljRlMrdk1JSzJQZzkrUzRSUjJzbWRMZHVzbmZSZTJseUtNWkM1dE40Mmhk?=
 =?utf-8?B?V1ZqeWxKQWx6Z1BaOGt1MktiWTB6Y2VPMGNRRXI0TzFPT3dGd3lyTXJ2RFh0?=
 =?utf-8?B?YUxhaGF3UllwbHJrZEkxZmJFOUZ2WFkxWFJrY2hJak4zRmMvOWVwcGk4Wk8z?=
 =?utf-8?B?d2YzNkk4OHl0bGE1Q0dXWklSMXFhcnB5RFhJc1U1MXFuSXhCMzVXdzRqejBP?=
 =?utf-8?B?Mmx3SFA4aUlITFpRNFJJSlBVaTd4cE5xak1hRTlOUHVsM1lySUVoWXdLMnp0?=
 =?utf-8?B?U1RVTGZNNHVtR2dZRWVCRXBzTVVod1R0N29DbXBleHRJOHh1cUZBVDFjQ3B2?=
 =?utf-8?B?TjhOdzlZclB5YnNDZVBSU2pINFRFTmJxdkNIenlFR1drTVFyeUlxYXgyRGxS?=
 =?utf-8?B?c0dFaHkxUEhJclZXaUpkQTk4ek04bW9TWHh4b2hSN3dGLzYzazNZOHpSSUVW?=
 =?utf-8?B?Q21INWpuTmZFbnBwbWJxWndFY0oxTVJJem9aWlh4ZGU2U0Y5ekFVTjhOSnp5?=
 =?utf-8?B?eDhLeGNtWkhKWWNRU0tZYTlFeTFzZGd4SU5xbjNoSnhBa3h6VWlXbytBblhY?=
 =?utf-8?B?ZlhZdHZIbGRKbW9aZ3k1TlNHbFpkZkV4blA3cHpmMzliLzlPUUVoOFpZVWhK?=
 =?utf-8?B?RkhncVB1Z1dtSW1GWUM3NEdQYWdZRjlpZk1pZzg1bnR4anhPSnZQVWlUdGpM?=
 =?utf-8?B?aW9PRXFuZTJ5bVMvbUFnTDZVQVZWUlVReGU5aXJBSysxMDFqNmtPYzIzTHpM?=
 =?utf-8?B?c1N4S21LNEhhNWZIZ2xxamFhLzZpYVQ0NkFtYXU2cE5hQ0FjY3pveGVwSU4x?=
 =?utf-8?B?QlZrbzdsZThqaDg3M2xQQjNWOGUrVGdKWXlES0NZaC8rcVVzWnRKbndkcFpq?=
 =?utf-8?B?QXlCUGZHKzFxZW4rOHZpblBJSTVZR1NzU2E5RmhEOFFVUWs0dmRDcWpKaHMz?=
 =?utf-8?B?K2RBTHFCL08xbGdwdkxLalY2R2hlM1BqdjJFenEwY1hlbGxBQjlHMGZLVUJO?=
 =?utf-8?B?aEt5TTJkaDQvdnVLRW9YOHVSMXR5bzE1RUdENmZvWkY3OUZLNElzVUVSVmx0?=
 =?utf-8?B?UWVESlU0cGdkM2p3RmxrakJIZ0U5VjNXZWh2QUtsejBQdEozUVFqVTVYaUdu?=
 =?utf-8?B?cEdvQ0ZBRC9yUUpXWGN5UnNYenFGdFptUFkwWm8wQytsQmlZalZxaE5YcnJG?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e229de-4127-44d8-7b9c-08ddd3ae2378
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 23:25:03.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcDRmKq7LcsmSvc4sqEi6v0UCFqnMYxquRjIxaKGcMYolB4L/vTTu4JNiAVnrlRh/zX7Q5zK6Cc52OQRglDSSNRzOvOGU48IvFeoCsVSqS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
X-Authority-Analysis: v=2.4 cv=d5n1yQjE c=1 sm=1 tr=0 ts=68914152 cx=c_pps
 a=XrVoQjrxkcyhe5D+LDNSXQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=tiZj2a2k4fl5LHjmwZsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=s5YGssjuQLqAVNXd95cA:9 a=JPjOhlUXvzaDiFd7:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KkSkFPwCpF4YiZhJqkpNd7CZPS-UL4pl
X-Proofpoint-ORIG-GUID: KkSkFPwCpF4YiZhJqkpNd7CZPS-UL4pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDE0MiBTYWx0ZWRfX9G/NF5+VQbea
 6GLPJHtNPlGb5oyi7z1N/qBBzrJ3dU9zoXBZo14NXgwqsdW3BVkei8s+G7wnGDe3IAMcHuiQ2Iy
 iFhbQFzbBc8/AzPS9nRC9guWW3eeeiJ5HzbnFGHf6isxdhJbdzpVZOTYiwnsfTOsrfXAk538H5n
 bWvy5smk79VsAX/1T/OjZiF1Poq1W1KrjOZAOuWO9uQ0a6RaZheDwTaXZKlPJxxW6oBZPMO6DHM
 CENGP2eVtI1YhxLV3jDl8SOB7NMzXEap0OKZrGBdwHrzDXKJpStWH63kTxoN1EpebSEfipNc4Ou
 RIptxewPH/to4W0bzWeXZ0LQchYpLgRjrdFCiLG759iQj2XfWx+BIDxXbIGLFwnY7fbbYGK11Xm
 5mcSDpnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 23:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221449

--------------DBSHfOiT21ncr0yu960UJ0Fn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 574Mb9xc3644285

On 2025-07-31 3:39 a.m., Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi<Qi.Chen@windriver.com>
>
> oe-pkgdata-util's glob command will output different results depending
> on whether glibc-locale is built or not. This in turn results in do_roo=
tfs
> error when multilib is enabled.
>
> The error message is like below:
>
>    No match for argument: lib32-glibc-locale-en-gb
>    Error: Unable to find a match: lib32-glibc-locale-en-gb
>
> Here are the steps to reproduce the issue:
> 1. Enable multilib and install a lib32 application by adding the follow=
ing
>     lines to local.conf:
>     require conf/multilib.conf
>     MULTILIBS ?=3D "multilib:lib32"
>     DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
>     IMAGE_INSTALL:append =3D " lib32-sysstat"
> 2. bitbake lib32-glibc-locale
>     Note that people usually don't deliberately build lib32-glibc-local=
e,
>     but they will do world build. And when so do so, the following step=
 fails.
> 3. bitbake core-image-full-cmdline
>
> This above steps are how to reproduce the issue in oe-core. There are t=
hree
> steps there. So it gives people the impression that it's not easy to re=
produce
> the issue. But in fact, with some image, it could be reproduced by just
> doing `bitbake lib32-<image>', as long as that <image> brings glibc-loc=
ale
> into its build dependency but not runtime dependency.
>
> The problem happened because do_rootfs will first form its own repo by =
finding
> dependencies. glibc-locale will be brought in because of IMAGE_LINGUAS.=
 But
> lib32-glibc-locale will not be brought in. And in install_complementary=
,
> oe-pkgdata-util will use its glob command to find all complememtary pac=
kages
> for IMAGE_LINGUAS, such as "*-locale-en-gb". Then we get the above erro=
r.
>
> glibc-locale has its own recipe and which to install into an image is
> determined by IMAGE_LINGUAS. So let's not map any glibc packages out
> to glibc-locale in oe-pkgdata-util.
>
> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> ---
>   scripts/oe-pkgdata-util | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 44ae40549a..9fb7952c58 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -136,6 +136,10 @@ def glob(args):
>                           logger.debug("%s is not a valid package!" % (=
pkg))
>                           break
>  =20
> +                # we don't want glibc-locale to be mapped out by any g=
libc package, filter it out
> +                if "glibc-locale" in mappedpkg:
> +                    mappedpkg =3D ""
> +

Hi Qi,

During a brief discussion in the patch review meeting,
people didn't like the idea of changing a generic script to deal with a=20
specific recipe problem
even if it's glibc and locales.

Can you review/re-explain the discussion from:
https://lore.kernel.org/openembedded-core/PH0PR11MB5611F2E7A0B97861D193A6=
0AED132@PH0PR11MB5611.namprd11.prod.outlook.com/
in a follow-up email=C2=A0 and discuss with co-workers and the list to tr=
y to=20
come up with an alternative approach.

I can eventually try to help brainstorm ideas once I've dug out from=20
under this mountain of email that accumulated while I was on holiday.

../Randy


>                   if mappedpkg:
>                       logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg=
))
>                       mappedpkgs.add(mappedpkg)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221175):https://lists.openembedded.org/g/openembedd=
ed-core/message/221175
> Mute This Topic:https://lists.openembedded.org/mt/114463019/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------DBSHfOiT21ncr0yu960UJ0Fn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-07-31 3:39 a.m., Chen Qi via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250731073934.916831-1-Qi.Chen@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

oe-pkgdata-util's glob command will output different results depending
on whether glibc-locale is built or not. This in turn results in do_rootfs
error when multilib is enabled.

The error message is like below:

  No match for argument: lib32-glibc-locale-en-gb
  Error: Unable to find a match: lib32-glibc-locale-en-gb

Here are the steps to reproduce the issue:
1. Enable multilib and install a lib32 application by adding the following
   lines to local.conf:
   require conf/multilib.conf
   MULTILIBS ?= &quot;multilib:lib32&quot;
   DEFAULTTUNE:virtclass-multilib-lib32 ?= &quot;core2-32&quot;
   IMAGE_INSTALL:append = &quot; lib32-sysstat&quot;
2. bitbake lib32-glibc-locale
   Note that people usually don't deliberately build lib32-glibc-locale,
   but they will do world build. And when so do so, the following step fails.
3. bitbake core-image-full-cmdline

This above steps are how to reproduce the issue in oe-core. There are three
steps there. So it gives people the impression that it's not easy to reproduce
the issue. But in fact, with some image, it could be reproduced by just
doing `bitbake lib32-&lt;image&gt;', as long as that &lt;image&gt; brings glibc-locale
into its build dependency but not runtime dependency.

The problem happened because do_rootfs will first form its own repo by finding
dependencies. glibc-locale will be brought in because of IMAGE_LINGUAS. But
lib32-glibc-locale will not be brought in. And in install_complementary,
oe-pkgdata-util will use its glob command to find all complememtary packages
for IMAGE_LINGUAS, such as &quot;*-locale-en-gb&quot;. Then we get the above error.

glibc-locale has its own recipe and which to install into an image is
determined by IMAGE_LINGUAS. So let's not map any glibc packages out
to glibc-locale in oe-pkgdata-util.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 scripts/oe-pkgdata-util | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549a..9fb7952c58 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -136,6 +136,10 @@ def glob(args):
                         logger.debug(&quot;%s is not a valid package!&quot; % (pkg))
                         break
 
+                # we don't want glibc-locale to be mapped out by any glibc package, filter it out
+                if &quot;glibc-locale&quot; in mappedpkg:
+                    mappedpkg = &quot;&quot;
+</pre>
    </blockquote>
    <p>Hi Qi,<br>
      <br>
      During a brief discussion in the patch review meeting,&nbsp;<br>
      people didn't like the idea of changing a generic script to deal
      with a specific recipe problem<br>
      even if it's glibc and locales. <br>
      <br>
      Can you review/re-explain the discussion from:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/openembedded-core/PH0PR11MB5611F2E7A0B97861D193A60AED132@PH0PR11MB5611.namprd11.prod.outlook.com/">https://lore.kernel.org/openembedded-core/PH0PR11MB5611F2E7A0B97861D193A60AED132@PH0PR11MB5611.namprd11.prod.outlook.com/</a><br>
      in a follow-up email&nbsp; and discuss with co-workers and the list to
      try to come up with an alternative approach.<br>
      <br>
      I can eventually try to help brainstorm ideas once I've dug out
      from under this mountain of email that accumulated while I was on
      holiday.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250731073934.916831-1-Qi.Chen@windriver.com">
      <pre wrap="" class="moz-quote-pre">
                 if mappedpkg:
                     logger.debug(&quot;%s (%s) -&gt; %s&quot; % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg)
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#221175): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/221175">https://lists.openembedded.org/g/openembedded-core/message/221175</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/114463019/3616765">https://lists.openembedded.org/mt/114463019/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------DBSHfOiT21ncr0yu960UJ0Fn--

