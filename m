Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17144.1795790792843477559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 06:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=ZVMoR09J;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 52.101.46.5, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Geg5ZlbuaRl1PCbGG5GCiiMIH8aQYD1JnNeoTtH2e8uwRWpMgNZI8ReGHJTuIVGqSe7NGWbCJuTaR66NgApeZcjalzQ8hbJ9Akz7nIOazCrRKiuDYMrNNUyeSrOV7p/gvwpQmQLLji4FhqnDwYDrtrhVBbWVJszDeVbI+DNKO1OjKiQgYSOFVEmJzlh87UEF7IFAgXtwuuCM6765OjApAh79uUtz7WM1MdSrLn04FRzJE7N3+L8P1DmYIrXXhxMpYgjn8hSbAEzn+bpDM3+0s4p3t9f2FKcb5Myr9O8tQUw5nVP+YOlRpUfDK20S47Rf7WBCxi3Hlt0rKnSWAaIuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yosR6vQaQbMe/Xrw9LEVquNZEymQ8igUUlQm8dOLUKo=;
 b=UPhzoSPNpWe0mlqwblRIgy71Mzj5EE/DaAHQPJdArQ2eYqZBpcmxJLrnmGE34XoDS4nTJEevikn6EsZQRQic1cRijN+LRr5yZef3srU60Lg6djGAq+SpoNuKk5cBGGy4hzCTxSzstDoWVmrBHhdreMswfuBxDuuPmCi5hUn2KtMzZ+Y2HMN7ZD8bsOwFZiqo7OavB0TVvIjEUZvycdZ2IhNdf1y5mGZ7eQVQwYdmig6DvopebpkbZIelN6RoTf2AkxlNAb9WVkjBwKotn7eZCFSnxBNEgAWKGiHzjV0r5ALQg4QJ3+zguGCMLtxmpV3nB+ykjKNZxtYJPo22aCIB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yosR6vQaQbMe/Xrw9LEVquNZEymQ8igUUlQm8dOLUKo=;
 b=ZVMoR09JC0m50dBnf+R5X6+zP2pEIZxk4jBB8oGwDqYYZ7cxvSJBHrtO8OX0SRpMNndCLnh6m6mfAzqyhTFWNXgWkxVyvd71tjPKs8ioxhhsCJztWAeJFn1v7sSxpcWmqB1hoh01/kxTQpT8jjovMyK5a+TbcorLJCk/Sbe0iUs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 14:46:28 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::e2bd:c56f:ea1d:9a11]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::e2bd:c56f:ea1d:9a11%2]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:46:28 +0000
Message-ID: <834b79da-f293-431c-aee7-e085d232388a@amd.com>
Date: Fri, 27 Nov 2026 08:46:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] pseudo: Update to 1.99.2 version
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261126021504.2712290-1-mark.hatle@amd.com>
 <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@amd.com>
In-Reply-To: <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:610:cd::23) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
Return-Path: mark.hatle@amd.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f271529-4ea8-4218-22b7-08df4c9537d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|4143699003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261028144727099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 0gHUCT683Nq4Su8ZcaKQCecyHDVVt1R0Djj4DwugEYyZimQbdG6ArwkBJh9692UkDCHlzgYRozpm5Ub/2GIucgTsVqI4TD1eh5chOmn9eb6a8dP1UiQ8yrnFD/yUOY/eMl0tpO++3BG5cbFfrv3xOwcy1FMdkwoPKjVr0+Wy5G9pnfMnEWTXlcWGp34wSA3YtRcwR61U52KPW7xzPQ5/tcaE5DCpTaY32D7BadJQzqbSED8njpNae2mAgYWASCBvnhPd0mU7hNntqgcndttp0eAFPWTi9mdy2okKC5e2SjEmSCj6mtOUjbK+66NcDHVL6WdHreAu1xzoPv5pueqhKGjXOJgv36bQwmN4Y2ly4o5cJwxjoqKEo4bJUaJ8Z1t6PXHbTrV8a6ZbzaIvAlaMjA2V0hydSDSkuxucSBRhXnK7R0t+VQwyQyH3jT/jmI2YOR/YOizpI0L4VrOvO7nY67odm11Ile13o01PTbdFi9+fFnVDl+4xlhTYbl+zFvv0arpeTQcWcKHbZ8CsIzmsyhD5upG784WYbPgzz/PsEIGFU5hFTn1r9jcYzVsiQ5AAFTPljOYZZpAi2hxoL3TqYyk7t0bZQ13hCTwUWRb7qgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261028144727099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1A3c1JNdHZLOElmM21wSFZ1dGs3U0NuSlIxdUlFKzNUNityKzdQbE12bkxr?=
 =?utf-8?B?VlJiKzBiTE0ycy9PR0Z5MXNidll1eE1EbnZpK00rdTRGTEJqV0NFSFZNaTRB?=
 =?utf-8?B?NXdieTRoUmc2TTZETFpjZThqMTQ2alpaeWo4cGluWEJ0c25Ic2dpYjJ3Mks5?=
 =?utf-8?B?YldNbmNMUXdUUHE5VVNDSTMxL3dackIvWjJ4czkzWHFBL1laejR0U253YmJj?=
 =?utf-8?B?ejc1OXRmTnk0V28wV2F6dVVwYmdCeDAyZEQveHBSYVJmSjRyWitLdTBqRGFi?=
 =?utf-8?B?bzZYZklWcHFiK0VqRFY4VEdhR2NwODM0eHJpd1BLK1BNYjV6aUUvSSt3NlZm?=
 =?utf-8?B?Ym9jcEN6dE1KMHo5TVNiUVY3c2d2MUtVeFhVVmtCYzdhemFlNjVMcWRRVEZu?=
 =?utf-8?B?MXVDZFNuc2VFaXpoT0kwY01QQVdrUUNySGI1emFyZlNmY0pSd0FnaU9JcUJL?=
 =?utf-8?B?OWQ3dWQvSndWRzBCTERRaDMvZTVlRldId2c0VUJLOTZlZTI4c3Z0WUpSbEFE?=
 =?utf-8?B?Ui9TU3A0SFcvM0F4WlgzOGV6MnFDK1o2TStUbmg3ZDF1K3czTkJISEJIVDlx?=
 =?utf-8?B?Wld0ek5kSVR3WHBlanUzOXhDK3V5ZWtDdDlDbm43VmNKTDRLTnVkczVjbGFM?=
 =?utf-8?B?dFhzUzg5Wm50SjFqNFZUUnAxNXl5MmhvTUN6MlpnWFZIYUVQc1RaQzZ5d0tp?=
 =?utf-8?B?UUhvdnMvR2xUNzNBOVZ1ME5PKzAveGo0TDlQTm4ydnltV0xvcitJSGs1ZXll?=
 =?utf-8?B?RHBEZnhGZUhuNFZRWUhrd3hPSUJ3aWxwbzVOemZDNGRnV1FQM2padmt6REo3?=
 =?utf-8?B?Y3Vtb0NHTVhVSENvVFRFbEdOU21NbEZzMUxZczFDMGFvQ01rRzI2NzNFYzk1?=
 =?utf-8?B?bGs0VmN2ZHBiM2JGS2syV2RXMnZ0Y2RxS3h4akZRYUcyZy85QytSakkvcTJ3?=
 =?utf-8?B?SFZuTUZSODMvUFQ1aUF5cEtVeTh3TkxGYy83NFh0TFp1alFPcmprYUNMaG9o?=
 =?utf-8?B?RXFOeE80VjVCSEE0aDdaZHVOUGtaZHJ2bU4vSDdFc2JHYmQrMlBlL0dDS2ZI?=
 =?utf-8?B?REhwNjBTNkd6cmJaOGxscWVtMUt4UExsSTh1VW5FS3YzYVFOcitYa09JK3RG?=
 =?utf-8?B?bll1NlBCVDNvMHVDRDJ0OU5MZFpYWTQ5Y2lpN2VyMm5PR1BYbTM0RUhnQW05?=
 =?utf-8?B?SEtjK3FUV2UraEtreXR3bDA4ckJYUXgvL1JNNENEVk4zZFVkMVd6cHEzOEFq?=
 =?utf-8?B?ZURqOFhjYS9Zd1JVc1hpQUpEbnhWcWhyc1k3bDR4Qzh2MjRNUEE5S1IxNnM4?=
 =?utf-8?B?TURQVEhkL2RuOFkxVHVyYW9DSTQxaFNBemlPSnozcFJxNDlYZWNWYjR1QmRn?=
 =?utf-8?B?VW1QSWdoYU1nWlBJamhjSzc2eXNXWkNhVlY4c0F1RVBTMWZmN1kvcTQzb0Zl?=
 =?utf-8?B?cDc2bllFZXN5bVdiRkJiZEVlR09HOS9zUWZZNWZMMGVkOXVISGlnc05aTXFy?=
 =?utf-8?B?MlVGSWFvdXdVVEUwSlJqUmM2SGFlVjFRTE5lakpUb09qQUJVZFVUQ09BWDVO?=
 =?utf-8?B?N3puU2tPMUFQMmZTbERuTEpUODU5RWtycTFDRGFpbyt0OURZU0MvSTJYZWc3?=
 =?utf-8?B?V3lteGxHcklTS1llVDhmTEcvMzZiemcxbzNGY0lMZXhCMFArcm5XNERuNHNP?=
 =?utf-8?B?Tk5qalJjaHByTEoxMGZMTHpUVi83WjlncldaWE50UGxTQmMwYStZdXRQSStF?=
 =?utf-8?B?OEVZSjUwTGNpM3dGdTY5S2Z4cGt0bWdoUC9PSVhxMnM5ZVFaMDhxNmFzT3E0?=
 =?utf-8?B?T09iZVBvK2hYbFlaM2NhUkNzQ1JwTjBDV1pRN1lnakxoU2JObHhiK3lURHQ1?=
 =?utf-8?B?cFE2Tkp2UUtlUHN5RnR1aVF5ZXordGRTNHBsdmRiUVNoNHhNNURzQ3ZwZlZ1?=
 =?utf-8?B?WVlIcEVKY25pRVRyN1ZBamxSai8rZVRHTGJFZWlTck0yWFhhNVQ2emh5d2I3?=
 =?utf-8?B?OW1samdIaCtmbHRmUk05RUV1RzNXSEdGWklqbGlTTU5zVjlVdjI1RmI4ek5h?=
 =?utf-8?B?SDhaMklvbGMvN3g5eFlvT3l4M3AvYXdtWjBrVnFaMmhCKzV0OVpBaE94TXRN?=
 =?utf-8?B?WTBhWjR3bnZ0bWdYVzUwVGR6MlVCMGhCZHQzNy83N3BZZTJMU3IzM09ZbDhs?=
 =?utf-8?B?M3hpNGQ1MGJpbVZrWHNjMEpQT282UFUwZzdZTUhQSTVIUTRyeXBpZGhYSzhz?=
 =?utf-8?B?YnVIOFhCWDE2OURTTGhQWUJpMjNhdmhKSkY4aDFva2RXL0dTbzM3QjdsTmxp?=
 =?utf-8?Q?FbwjFV/3XTWFxEAKVB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f271529-4ea8-4218-22b7-08df4c9537d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:46:28.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAWL+XlyXTup/eLPsg84SPQFmAta5oj6qha6B9Frabg/RJdf4FHNXZKkL3UL3iYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251395

Other changes should not be required for any reason.

I'll go through this and see if I can figure out what host types and such were involved.  It looks like something broke here that I don't see locally.

--Mark

On 11/27/26 1:08 AM, Mathieu Dubois-Briand wrote:
> On Thu Nov 26, 2026 at 3:15 AM CET, Mark Hatle via openembedded-core wrote:
>> Changelog from last version:
> 
> ...
> 
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> ---
>> V3:
>> Remove obsolete 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
>> missed in the V2 patch and detected by patchtest.
>>
>> V2:
>> Corrects the V1 by removing the makewrappers patch
>>
> 
> Hi Mark,
> 
> Thanks for the new version. Now I can see build errors with other
> components. I can't remember if we need to do anything specific on
> pseudo upgrade, do you have any clue about this one?
> 
> ERROR: Failed to spawn fakeroot worker to run /srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_install: [Errno 32] Broken pipe
> 
> I can see that one in most builds, with a few variations.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/5039
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/5059
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/5033
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/5085
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/5071
> ...
> 
> Thanks,
> Mathieu
> 

