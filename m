Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE2BC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 17:11:38 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.84])
 by mx.groups.io with SMTP id smtpd.web11.92237.1749575493564291296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 10:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=C6mF/vnN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.84, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDiz0tJMd5YKSJ4bzbakwMbxli0FYo8brK8HoDzm+n/wkmDK24O52EGA5/TedAV2FGszNKc+7ChmSqiV+F5KGDMqcd7rOm5xbSMYaRMT2amUXO/EmP4PtypH+9PHSXVkb814M9hvme391WMfNQDVreNx5NlG0+oIvjkppHh8ZzzMMSN3z6cJNXqaKf67gmA4r4Yi/VZRH0N44LPMD7gC4xnfmPPmtEff58M6MZ1aWfGbH4zi3nCQ2xnkvUXh3wGa+kEVutKGP1LiIVfH4fMQiZjur0J0+yooQzjw9F4PLVkxfPWzimLXzNZFcgIpZ79romQGz35N2tqjSQhxcZEGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIijUHQCqd3hQSaSKN98efysteAtzIDNarMHPHlsMAg=;
 b=blIw94YhSdaEMS1eUK6pBrJOsf8fA9GQtu4Odg0DWU94EbZdWyU0QDl3jZxN0+o41f4V0k6cpnCTbzTFWppNkh2rIwWnZD18fSLJo4r5EY6yeiPESV1h/J5FBDvJF0MzHEpLMDjmEqyleAe7vj1xEzHepLA70+drYhf7gydVupzn0a4/L1ssFmhgEN4hU2qqOzIGjOE4ifP6n9sHTrhSCD5c2gpoDBj+SYTdlQtLhEFLAl89TZB0IsB2fiE9HDcd7eq8zJFWHafzSYXomE65XyOVlWn6JPde6wy6O5NQultjB1qGS36wZbI2Mngf25Y9tTIR6+OH2xhmXcNeTTic8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIijUHQCqd3hQSaSKN98efysteAtzIDNarMHPHlsMAg=;
 b=C6mF/vnNmzfkXuJTP5aPlN3FSpMkZxlCrFt8wHx7YoC1euhl64nWfbUtGMJMHgp5tv+kWBHd9XZH96dJpxCZRpgUr5mhBZIKian3Beh0NHZuooJBt3ewnlhxTA3yiykvUE0YMH9aaNF+0FmKbIfEHT9oPC4rF29yOn7LyuMGPQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 by DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Tue, 10 Jun
 2025 17:11:29 +0000
Received: from MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe]) by MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe%7]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 17:11:29 +0000
Message-ID: <742e6867-f955-4db7-a6a2-6bacbd613c55@amd.com>
Date: Tue, 10 Jun 2025 11:11:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 00/32] Patch review
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1749571556.git.steve@sakoman.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:806:126::11) To MN2PR12MB4357.namprd12.prod.outlook.com
 (2603:10b6:208:262::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:EE_|DM6PR12MB4452:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f38fb2d-1e43-47d6-4a3b-08dda841d714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXZmSS9oM2JqR1kvRW1NanppWU54NXd3M3FreFBMazZIY24wNjBLaGRhTjhD?=
 =?utf-8?B?K3FYVnR2ZXFVaWUxNFluRUhCVVh2T2RCUE1YWnlLK0h3V1Y1KzhMRHdrVFlL?=
 =?utf-8?B?cjJqaUFuajE3QjNodll2SzE3a292VXlkU2ZTQ0pXc2ttYTFqdWxmcmZXMmhZ?=
 =?utf-8?B?N2lycGVnMEVqY0dCSjVhaE9EbTFlMk9lY0ZGUXhNRXZjalRzNHNkMkd6c1Y1?=
 =?utf-8?B?T1BoMUFmYzhVUEhLNUNCaFV0YTRpalphei9ZU09leEJ3MnZoQXZSbFh4RDQx?=
 =?utf-8?B?eG9MTFZVZExGZTFIdC84ZmZNbTJvMFBuY3lqUU9xQW9BcFFZcXY5MTJWY1R3?=
 =?utf-8?B?K0Z5RzdKS1VXSk5NaW1SNGNkQkFxVEF0RFZRZUFaVjMvT3VzTFRwOVZmTFJl?=
 =?utf-8?B?OCtFaFN5dHJVcUlLTlgzalBNMldLaXlleGNnekNBWmozZTZGRWN1WW80MXpH?=
 =?utf-8?B?Nk0zLzVEeFE2TFU3cE1mMDJiWmxmMDA2KzNDZ25pTmdOQS82OWlZMUczQmpJ?=
 =?utf-8?B?V0hXa1M0bUhuVmxRVlRwZkVGMzJ3OGRKSXB5a3Z2b1EzS01sT0VINGhmbEQ3?=
 =?utf-8?B?am1XeVViS21LUS9BYmVCOWlmY09oeFc2dmtuTFZSemRDRmd1WkFOZjQyS3d3?=
 =?utf-8?B?bDhRWU5peUNEK1NwWE40aERXaDgzK2xxOEtXb0kyVXZVSHNxTEFEL2x0VFNi?=
 =?utf-8?B?RTZrdHFvZy9oeWxmS0lkM1FweFVYVnZiN1p4NXc3bExLTEtMY0xWZzd1WktJ?=
 =?utf-8?B?ZUZlKzBkSnkzSTBrL21GckdtWGlVL3VoQWMrMUtEbWgrdkYvTjBhM0dMZ1A5?=
 =?utf-8?B?eTRSbjBGeHlCcXBWNlpMcWhFYy9UN09BTEM5MkM1eEhpak5nSXVEMzZqRGZI?=
 =?utf-8?B?UnFjWit1bzEwakttM2pNcEtOWEx0ZHN2M3NvYWVsMHRqZVVqWEJuV01rc3Z4?=
 =?utf-8?B?QnJldkF3OGh0Y2FaZUtIbXZyN2tKVUlLRDkyb3hTRklSSVNBRHVoNFQvNXVQ?=
 =?utf-8?B?SjVNUHdRenFLeFhIQVBqNHZXZElKaG0vK3ZJYUxVSDhKR2pyVXpiQnZ3VTZH?=
 =?utf-8?B?WEZpREQzVUpTTEtuYU1ML1Y0QStyYUhlNmEwTHFmUXkxSGpJZDE5STFpM0pR?=
 =?utf-8?B?d1ZiK3FOUVlqWCs5cDFReDRScWRBMURXUU5FSUs0SzRMeHNKRG1jU3JPbVRN?=
 =?utf-8?B?aHo1Y3lNWThEc0pmY3FjTWFhVk9YbVNqZS9GUlA2bjFlMm1jczV5UFlHWDVx?=
 =?utf-8?B?RGtHNlV3dytENDQvRGlBbW5xNzJ3bEcrdFprRk5mTFlMY3RBeFFlb2wzVVVE?=
 =?utf-8?B?cGFoNGNISEdHRncwL0RTaVVmaTAxaEIvOEZLN2p3TmliL25MMXRNUE5nVUFw?=
 =?utf-8?B?MytJeDdSdkVMbTVteEl2T2ZzNEpqUkVTc1FiYzh0SkFhZE5KbE5ndCtzdnRL?=
 =?utf-8?B?cWc1ZjJRYk9NSUEveVEyNThaU0l6SXk2cEJzVzA5OU9TZUVwalBWYTlLU0E4?=
 =?utf-8?B?eUt6VXhpNFJLYStnN20xN3huRFFVZ1FhaWE2L2FYajNNSXBjdzY1eWpNMVB3?=
 =?utf-8?B?a2RwTWg1Z1U3SFcvdGZvVHdIWEFFQnhJTEVmS2dhYUVoa1pMZ3FxTEJIbTBv?=
 =?utf-8?B?SmlxOFFPOEVRZ25iUUU4SUdieDV6SmdWTDdRT0dFNUM1bm9wS0ZadjRsNEwx?=
 =?utf-8?B?V1JYWFFXS0l1M1hYS1BDZE1yM1Vma0lqa0hFL200YjBuRUljQVFXWW5lRC9D?=
 =?utf-8?B?dVdtWFdYWW1EbkZKSXo1SGo0bG9WSHF5VzI0V1pRaFZKTXQ4RDVxTjBMZ3hz?=
 =?utf-8?B?dzAzSkkxTEpGWEVkMU1UdzVIMFNtU1A5a3hrVnBvNHhubXRSNlk1QmpKaHNS?=
 =?utf-8?Q?+NnvttiNFtZPw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4357.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkJNdFBHekt3cHh4VHdkZHNTOUNta05nbklBb2pZMUNUSVdTZWNBOGxIRE1h?=
 =?utf-8?B?YzRQVFpWbFJVOTB6T0RxSVFWREgzZUQ1Wm9PTGhVVU9uV25taTIxejZGaFJT?=
 =?utf-8?B?YnR6NXVtYWZSa05sKyt2N05nMFpaeUF1dHAyUzBnVmxManFSajJneTRQV2c5?=
 =?utf-8?B?bWMvQmRQazVpTVRWQUNwVjc1d3ZyS2FiRHl1a2Q0cHJ3MDVVamQ5eThTWS80?=
 =?utf-8?B?aHVIT1JGQkZLR1Q3R2lwQ215UzFHdlNHM2xiWStDZFhyTjhuMkxkRW5iTEtW?=
 =?utf-8?B?RHVNZzJpZkEyQ280L0twZ3pOaC9BYnFvSFp4aXhNblQxSXNWQ1hNZ0VueGpJ?=
 =?utf-8?B?MDdiOE5FcldSZ2JQMkJ3KzZXMUtPdUZDaTlxTmFkWXlyWkR1Mkk2clEyZWRG?=
 =?utf-8?B?Nml4alZGVkU2VjU2TTJSOGNwTnFnRGpvalVoVGF5U01LdGhFRVlHYnVyaGd2?=
 =?utf-8?B?dXpOaE95aEczV2RsVFErRlpxSllpN0RJTTFrTUpERlAzQzBuMWRoYW8yK0dN?=
 =?utf-8?B?NkY1OFVYeTJ3ekVkNmlNbE5FTnhuNnNvQmxlbVY4RjVqSEZ5SDhleTZtYXVR?=
 =?utf-8?B?c0Z4ZlNzektucE9SamlGUkFIT3BucXdRZ25lU0hycG1iVy9HY0ladktLS01x?=
 =?utf-8?B?WURXdElRNVpnMzlHczNmMXRkdjJjc1FaaVg1L2JDc1M2K0NyR2R4L0MvREZM?=
 =?utf-8?B?UGpsZkdJN2NZK2tueWN1NUF6RkU0OU9pV3VQa0VHWlA3K3hQdEdGQnlWT3NP?=
 =?utf-8?B?VnhsVi9Velp2Q0RFNlFaTmprWHlyY2tkSUJNbk12MnJlZ0p0YXIyZzczMTlF?=
 =?utf-8?B?cDU4ZnBjRHFONVg5UXQ0d2ZDMGhRN0IvVks4VU02VFBPYWc0M2YwK2pHNjFi?=
 =?utf-8?B?WjNteWhzbHRYQ08wTjljbXIxbUtwYVpQTTdhcnhNNWtsWnF3RUFPVTVkVXpV?=
 =?utf-8?B?YVFhemtSSU5PYlhORFVrTzA5RyszcWhVNms3NEdVQUJxT1NBVmFlczBGWkZ5?=
 =?utf-8?B?Z0ZJQ3g1SXJ0ZTdUaW5SOG15aVBGRGMyZmxPNWp2MFkyaE9vNHNXV0c4U1BO?=
 =?utf-8?B?dUR3bUhweW5iVWF0bzF3cEVSa2NueUhwUFNiSnkyb1Y3dlRwejNDcmJ3Smxs?=
 =?utf-8?B?UG9VZ0VNeFRLd1dBSUtFdWhYakpmNGR0YUlWREVZeGYrdXJHWTVtdXZlKzVC?=
 =?utf-8?B?eTFtUVZuWFRpRnNTUTdIcUtCSkNqK1hsSU51eTNqU2prYWVsYlpKUFdIL0Mw?=
 =?utf-8?B?YWVUdVVUb3NTdEowczlwQ3lMall0WnBxR29abkdMYmVxdTIySlY4TGdoNllY?=
 =?utf-8?B?UWxKYlNPRnhDYUIxV1k0QVlwejJFV0M3QjhRNVI5M1VuTlIxdnVJZjh2ZzRK?=
 =?utf-8?B?Q0hwWGVLbEU4OExxUDZoRElPNms1ellxaCtVNSs3ZHpEbXJNOU03UHNUdHhS?=
 =?utf-8?B?NnlQKzZ3RC8waVdvZzNaZWRFVUdGOEk1M2YzWFJxN0Y3YnVhNnNqa1QzMFRl?=
 =?utf-8?B?NUhQR1dKakpqS0ZDZWxHYU1yejkrYnhtNmtRUlFwREVpdkw2eWthR25rcjI5?=
 =?utf-8?B?Vk1ObytoRTBHTld6a1A5WEkxd2htNEl6anh3ZUlhQk8vN05QbmNUYlZtRzMy?=
 =?utf-8?B?V0l2UkpjV1J1S2c2NFU0UVdsSk91bHBLTFlaRGZ0UVEzblVpdklxNlErQy9P?=
 =?utf-8?B?aFpBVDNHS1h6R0hnbG55YkxRR0ZDVmpLUEVNbVVkaUJjcjNrRWdIalZSK3or?=
 =?utf-8?B?cXJmK2tnd1JsS2gxNHBETUh2d3NmNFBwellPM3ErU0U0ZGFqK1VhZ2Rna1NV?=
 =?utf-8?B?b0xtSUdTL3JRSWh2VERIZmN0ZjAvNjRCb2hZK3R1VUw1L084NkNobnRPajJG?=
 =?utf-8?B?SWN4MFRWRCtBKzgzWGkxSDRiZXpiZ2RyWVBJL0JFWlZBdC93bjNJSUN4djdJ?=
 =?utf-8?B?Qnd5RjROb0ZJaDdlMmpmQWFDVXl0VTN0cVNnc2RDQSswUWtOV2xzREdaU3dp?=
 =?utf-8?B?dHp2SDBBclVic1hXMUw4dE43VlBDcUVieXRvMXZmSGRXbEFla1ZlSm5mdTc1?=
 =?utf-8?B?YWRRUDZzYnU0T0pmS2FycUZNOS81RG43Y29HbnZaOU1TWlVjcXBwRjZMY0xl?=
 =?utf-8?Q?d3xXmcVZQg+1LdxlCiAzVbn90?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f38fb2d-1e43-47d6-4a3b-08dda841d714
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 17:11:29.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNpfF/b5yif3vFI/VRxqGORX3giAnFRPYXdc6a7dRmXPwRx9PQpEUbeHMc+sXZVqGf/spOwy2kgblzYwlX0HhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 17:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218402

Hi Steve,

Below patch is missing in your merge, Can you add it?

[OE-core][scarthgap,walnascar,master][PATCH v3] tune-cortexr52: Remove 
aarch64 for ARM Cortex-R52

Thanks,
Sandeep

On 6/10/2025 10:08 AM, Steve Sakoman via lists.openembedded.org wrote:
> Please review this set of changes for walnascar and have comments back by
> end of day Thursday, June 12
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768
>
> The following changes since commit a7322472e41c3cac922e29d867ae3f2f74318279:
>
>    sstatetests: Switch to new CDN (2025-05-30 06:32:58 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
>    https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut
>
> Changqing Li (25):
>    libsoup-2.4: update patch 0001-CVE-2025-32911.patch
>    libsoup-2.4: fix CVE-2025-32053
>    libsoup-2.4: fix CVE-2025-2784
>    libsoup-2.4: fix CVE-2024-52530
>    libsoup-2.4: fix CVE-2025-32906
>    libsoup-2.4: fix CVE-2025-32914
>    libsoup-2.4: fix CVE-2025-46420
>    libsoup-2.4: fix CVE-2025-46421
>    libsoup-2.4: fix CVE-2025-32050
>    libsoup-2.4: fix CVE-2025-32052
>    libsoup-2.4: fix CVE-2025-32909
>    libsoup-2.4: fix CVE-2025-32910
>    libsoup-2.4: fix CVE-2025-32912
>    libsoup-2.4: fix CVE-2024-52531
>    libsoup-2.4: fix CVE-2025-4476
>    libsoup: upgrade 3.6.4 -> 3.6.5
>    libsoup-2.4: fix CVE-2025-32907
>    libsoup-2.4: fix CVE-2025-4948
>    libsoup-2.4: fix CVE-2025-4969
>    libsoup: fix CVE-2025-32914
>    libsoup: fix CVE-2025-4476
>    libsoup: fix CVE-2025-32907
>    libsoup: fix CVE-2025-32908
>    libsoup: fix CVE-2025-4948
>    libsoup: fix CVE-2025-4969
>
> Deepesh Varatharajan (2):
>    binutils: Fix CVE-2025-1181
>    binutils: Fix CVE-2025-5244
>
> Patrick Williams (1):
>    systemd.bbclass: generate preset for templates
>
> Peter Marko (1):
>    python3: upgrade 3.13.3 -> 3.13.4
>
> Ross Burton (2):
>    python3: remove obsolete deletion of non-deterministic .pyc files
>    python3: backport the full fix for importlib scanning invalid
>      distributions
>
> Trevor Gamblin (1):
>    python3: upgrade 3.13.2 -> 3.13.3
>
>   meta/classes-recipe/systemd.bbclass           |  11 +-
>   .../binutils/binutils-2.44.inc                |   3 +
>   .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
>   .../binutils/0016-CVE-2025-5244.patch         |  25 ++
>   .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++++
>   ...shebang-overflow-on-python-config.py.patch |   2 +-
>   ...-use-prefix-value-from-build-configu.patch |   2 +-
>   ...-qemu-wrapper-when-gathering-profile.patch |  14 +-
>   ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
>   ..._fileno-test-due-to-load-variability.patch |   2 +-
>   ...ctive_children-skip-problematic-test.patch |   2 +-
>   ...t_readline-skip-limited-history-test.patch |  10 +-
>   ...orlines-skip-due-to-load-variability.patch |   2 +-
>   .../python3/deterministic_imports.patch       |  39 --
>   .../python/python3/makerace.patch             |   2 +-
>   .../python/python3/valid-dists.patch          | 160 +++++++++
>   .../{python3_3.13.2.bb => python3_3.13.4.bb}  |  18 +-
>   .../libsoup-2.4/0001-CVE-2025-32911.patch     |   2 +-
>   .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++
>   .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 ++
>   .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 +++++++
>   .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++
>   .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++
>   .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++
>   .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++
>   .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ++++
>   .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++
>   .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 ++
>   .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ++
>   .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 +++++
>   .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ++
>   .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ++
>   .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ++
>   .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++
>   .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 ++++
>   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 +++
>   .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++
>   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 ++
>   .../libsoup/libsoup-2.4_2.74.3.bb             |  23 +-
>   .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 +++++++++++
>   .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++
>   .../libsoup/libsoup/CVE-2025-32908-1.patch    |  89 +++++
>   .../libsoup/libsoup/CVE-2025-32908-2.patch    |  53 +++
>   .../libsoup/libsoup/CVE-2025-32914.patch      | 112 ++++++
>   .../libsoup/libsoup/CVE-2025-4476.patch       |  39 ++
>   .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++
>   .../libsoup/libsoup/CVE-2025-4969.patch       |  78 ++++
>   .../{libsoup_3.6.4.bb => libsoup_3.6.5.bb}    |  13 +-
>   48 files changed, 2541 insertions(+), 77 deletions(-)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
>   delete mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch
>   create mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
>   rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.4.bb} (95%)
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
>   rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb} (83%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218369): https://lists.openembedded.org/g/openembedded-core/message/218369
> Mute This Topic: https://lists.openembedded.org/mt/113572634/3619217
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sandeep.gundlupet-raju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

