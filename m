Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B6BC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 05:05:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3561.1720069506786936995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 22:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915b856ae=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46450eQc021388
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 05:05:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsg3re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:05:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVWjTNlEVMR2Xg4hy06sDtbq+xk5HN/uWMZO7tSSx0FxxvmwYn2PW1LkmI7MXOsEXc5wEfU95d1b9QEcPiHosQcNwM8ESuIK+o7lCr8u54hCpa54rnhl3s9Vpw1ZJaPrDaxZAikr8IHYfYKx+6igf3oU4Wx/Qe9nmHKHdH6w3kz6sRal+1mqLtdq4XFnmOz7WGOi1a2jTwzZOMy6pH4mnDsszoCeRKV3UoxxJAbO7FtuJeICpNPMlCQMb1FqeBHO+eeNiFgtm91OtGSV+8EsHbCLTpJBH/2mVrMsEHKU00d5Kp6VKKidm5d5+TPgQQt1kP5VaSFjzaUixBe79vrjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/9tTs9Opd8iAWSHUwaGWuo09o05DKOsXh1suDR7hbs=;
 b=VZhdr54ldPva0mjmUNvb1T6il0VXu6soj/3z9miwNbYQAApQXxEw2XXoSFp9wW43yH0grOkmVZ+OXYsdLHd3P7m7Pu7V4e6/H33v+42FUZBkhedaB0waZSzudKoZmEjvPeIFHzVIDHd1fqFmzhKSm0zmId0cce7T+NbEADtZKHtFZwgnVSQksm/4LOpP5S4pDFLcEZibV6+w/swBSOdtf2XEvbAvEovCT8559zwEEatmFstyWhy2ns4Dg6x2QlyGw2b3w1ydNBWfIaTJ+4BeIAE8k8+mskA9CKNoV/ARZdK+4a3PfQ4iMF9oHoxhxBN5N3vEC9KXPyVekQk0aqoWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 4 Jul
 2024 05:05:03 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 05:05:02 +0000
Content-Type: multipart/alternative;
 boundary="------------Ecpijbt24DZMPVElAuk1D2rg"
Message-ID: <beeb3ef4-f2f1-4de8-9ddd-d63ebbe39a06@windriver.com>
Date: Thu, 4 Jul 2024 13:04:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH v2 2/2] apt: runtime error:
 filename too long (tmpdir length)
To: openembedded-core@lists.openembedded.org
References: <17D9FBA6511B427C.27929@lists.openembedded.org>
 <17DA13C5DEE6F556.1999@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17DA13C5DEE6F556.1999@lists.openembedded.org>
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e713e3-1aea-453b-a62c-08dc9be6dc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0dJUDhEQlA0Qm43Z0E5c1V2TmVjUEtnbDB4QUd4dGFyZExsNEE1eEhxM2hV?=
 =?utf-8?B?amNpWks5MUJ2T3lhSnJrYS9Ua2QwQlZlOXRUeFJaYXZWVmVHUjFYbjJzZUhZ?=
 =?utf-8?B?dE5GVTZVSi9NUXBnV05CcmRiZGZHUnplWXJTWDRoUE9kQ1ZEa1NaTTIzVjh1?=
 =?utf-8?B?NWo5QytSNHVyTWdIMjNTajlrZUNGMEZVN1BiNEVGdDdDSGFzdHFjMlhNalYv?=
 =?utf-8?B?aWFPMWlLSHFNMVdIL2xIVkl6OG82M1dCbDFZTFhYZHVvWi9qbmVNRWs4dW1v?=
 =?utf-8?B?NUtVSmd2b3A1NnV4U2FjdVNHdFNUdmlrRVM5WEVNZlE5OEdXTVpsYnVBWXZK?=
 =?utf-8?B?QnpvWndQWVRmc3pDaStoOVBRUFBCeDY2NzdGTkxKS09QWXIyUjJ5SzN3UXE1?=
 =?utf-8?B?UTRNUXNYdXhDZ3oydWw4SU9RaXY2OXBUQ0hzejJpc1FYbVpBOWdjZVRtc1pN?=
 =?utf-8?B?SVVqTkxhQXU4L1ZvNEtOU1NuVGMzRlVRMzFWbmtsMFNvU1pvNFRBQno5TmNP?=
 =?utf-8?B?cjVpSVdhRTVNQ05TZTlkMHJLZjQ5akpXZkNrUFBDMGFVaWJxTGdWL3p5V0U2?=
 =?utf-8?B?ZlBOZnFwK0kwRmRmQXpaOTFzeEhlNFJMbmpLeFA5aXZtNG82aWZDK0VqT2wz?=
 =?utf-8?B?Vi9FZ2JNY2dCSlZlTjhZL1hqK2loK1o4QU42U21mNm5jeXRNTng0NmVkZEtX?=
 =?utf-8?B?K054TXdOQUNwY0c0RkNzSE9kVUFwTkxQaGUrV2d5OURiS2JZeVZFVE1wbjUr?=
 =?utf-8?B?dVZ1bHpzMTVjcVl3MFRvRUNLdSs5cjhSREgvRTRzcWEyQTY0WFJ1Z2dteEJV?=
 =?utf-8?B?cS80SmlBRU1JZExIY05DT0tyRXdHSklqOUFvbWxIWXRyQlNsM1dvaDBaNU5k?=
 =?utf-8?B?aWhIWkhEdmRLRGVPY01nem5ZYWJ6ODVnbHU5VnJBVkZHMlVyWmRTcytxMzdN?=
 =?utf-8?B?RmY0Q01jMUZvZnNadVBYQjBhN0FaQWFJWFdoeDMySEZuS2tWNmFFbDNjNjl5?=
 =?utf-8?B?OEZWQ2MzZlJmQ0duZitFN3R4ZWpPeHFiUjd0TGdUeExBMHpaY3p2bmc1eS9C?=
 =?utf-8?B?cVJ5NGg1SVBYelpVbGdIdzBnTlhPTjFrUUNmZHBEV1hlbzRNVUxKNGZ4dlll?=
 =?utf-8?B?SHBVaWhoeWROb2Y1ZzZhaGplWExaZ3pMQ2laeTRFM0hnK1BYdDZQaVptV0hw?=
 =?utf-8?B?WGNZYngyRlVxWUpTWCs4K3FBSFNWZG9TeU1uV1U4MUZtRkJhb2JGUUROamRY?=
 =?utf-8?B?WjUybVk1Rjc0OXZiOVZ2MExONzFia1RUVGNId0VxMEdjenc2MzFmNHMrQUpE?=
 =?utf-8?B?V0lCZEpwelI1MXdGVHpJZjhVN1BwY0h6UEM1ZkxBUm9aS0VqV1QvUmpLL2RH?=
 =?utf-8?B?WnBqcFFaRjEwSW9wMVZRd2w4RGVsWW9FM3hteDlSVEVNS1kzYzl6Skl4Umdv?=
 =?utf-8?B?U0pZaHEyL3NnT0dmZ3kvY2pPTVRBcEpwTlZKckRqMGJZMG13c3Y2MXg1aDlG?=
 =?utf-8?B?VFViYXUrLzFWSFJsL2x1OCtYNCtBSXBHZUNLMTdxZFRUdW1LY2N1NGRNbmV1?=
 =?utf-8?B?QzNudnA2ZFBZU1NuQXN3dDdkTllRSUt1VHdZTHQzUzVXUS9keUlEWjJ2NmVK?=
 =?utf-8?B?b0VLWW1kT0RUT1NVMXY4dndEQjlZUnlLTUxCS1k1ZTN0amZabHNJZGhWWlpI?=
 =?utf-8?B?M0pJNVpRTmttZzRVSFJKOEs3M2FRMDRJZERRUXB1UEl2L0ZhQjAxSmJPSXEz?=
 =?utf-8?Q?8TO58V1NFk6M+o9DBs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UElMMXJhSWJ6TjFNL2tGbGtxYkZ3Vy95YUh6VmNlNVlWM0FxOTNxS002RFpB?=
 =?utf-8?B?TFhxOUY0eDRSMk1Mam5yL3RlNjNhR2Z6cFl5d2pLaGZtQ25McTNjc0VjUlpD?=
 =?utf-8?B?WU45REFvWWk1ZUQwUVFJZG9ISGs3WE5kbXA1NitOdHZpZjVmWDZ2dTVCZXd4?=
 =?utf-8?B?L0VKTmVJblMzWjJZeWlTbHBrUGdIOENVbkhFVWNaaXY5b1l4WWpUZ2k2WnNG?=
 =?utf-8?B?Q0NWTkpqMXBKZU03ai9tVVMxclYycUJEdlVxMlU0UEJWaHJyTTBFUUwyZnZV?=
 =?utf-8?B?SGlpenMvYmVYcEJyNmFxMXo1eU1Uc3dvcjJKV1hKdG05T0ZkUEl2SVVYMExz?=
 =?utf-8?B?MUtXYUNhYWZRbklIWWZFcTlFUTMyMlRnWE5ZK1o0Z3M4WVV6aGQyQTFWWFpq?=
 =?utf-8?B?YlMvaG53eDh0d0RHWTRabVVWR2dqU2ZPR0Y1M29QckI2M0pKWEx1cUVOQ1pk?=
 =?utf-8?B?V3R2T0Fqd2x4V1k1eTVwbmtmbzIrNnFTVFRQM1diTE1OdCsxLzlyc0Vjelox?=
 =?utf-8?B?cmVxNU44UVJVMXprdWJhN2d1dGNnVDlINmJVcm82QUUwNkhLVXM2aUl3YVBS?=
 =?utf-8?B?bStiSXVRSlhwTGcwamJRbFJzaUZXcEdxTlNqbGIwU3BxTGc5SGdZRCtyRldy?=
 =?utf-8?B?TkJvZWdQc2MzbEpTaEZYUFBMd3lxaHduVEFHczZCZVZMeFB4RHFoZVljM0d4?=
 =?utf-8?B?akY0cFRwRWhPYVFSY09zWTVPSzFPZnVDWDJhQUViK3REeThDOEp0dzdPVktN?=
 =?utf-8?B?dDFwRlo1d0lRRE5HVnNYRUZtTHlZcTJGS044ZHJYaDE1bUlSMDVTTVdQdmd5?=
 =?utf-8?B?aGs3QWJkRHBMRi9lVWxZejNvaHYwQTZDejlaeC92MTFoN2tGM212WUg3aW5S?=
 =?utf-8?B?T0NQdWpSb2ZVUnpHNVY2c0liaytucGF0OCthN1g5NEVnYVE3bDFIL0VnV2hR?=
 =?utf-8?B?c0VmcjJCaXFvWGZndk5rK09zejB0cnIvcURDWi85UVJGanNlQUxlR0FJL0Fs?=
 =?utf-8?B?QS9iMiswbnYzM0tDVUhhOCtuOUxVM1BRMGR3Vm1pYTlNb1YrUDFXWjJ0OW5l?=
 =?utf-8?B?Q3BLa05KZTFESVY3ZkN0OExjbVV0VDBVMWtERXRzVHN6eEN1V1dhTXlYOXRY?=
 =?utf-8?B?QSt0Uk4yek9jWjA4emNNUDc2OEF6Y1VhRXM5d056SHl4SkNodWppWTRwdUFw?=
 =?utf-8?B?czJVMEUvcXpwc3g3SFJaSlB3OXErQnUvTG9FdlpwemlJUW5jNjdJRGhkVWZ6?=
 =?utf-8?B?Z1ZPN1B5enpiWllvTldZclc5aU13NHBoQ0FHbm5mUmZPczYwdDdmTG9CaDNo?=
 =?utf-8?B?NzNFeUU5SWRaS3FlR0hBSHR3Y0JlVnFBUTRWbkI4ZFhQT1JBeXRYOVhrYzZE?=
 =?utf-8?B?SEpMQVgyZWhwSCtZK2poYW9KcWFSVk9nNlo3YWtmQkdpMnNySTMyYmYwVkow?=
 =?utf-8?B?TUVoaG9BcXNCWXQ0bS85NjBoVG9rRmoxbjQyUmZtRWM1cXg3bisyQU1kQzI4?=
 =?utf-8?B?a0NsRHhXM1dTLzhDV1dsNmh6QjM2OVdVcXpIRHltNnNvRVBlYkhUZ1hBenJP?=
 =?utf-8?B?bHRtRlZwSlduaDZORVNZNFdwQUNMa2JaTFFuUDNmUlBFS2hKSmxhcnpQSDBo?=
 =?utf-8?B?Z3M2OTB5bnpWNXdBdU8rQ1dZaDg0VHA1Q3B4UlJVSlNYeDNnM0Fkclc5UlVq?=
 =?utf-8?B?a1RSdXMzY1ZJWU1nTzRRbU1hK04reTVxa2dKOWk5UGJlUGUxWTJ1WGlpc1J1?=
 =?utf-8?B?bVJuRFRldExQaFhwRUM2Q3NTM0lPQ284SENac3B1NUZGUmdQS2l3VmF6YXJl?=
 =?utf-8?B?eCtGTEZvN2U5T2U4cjF5OVZGWVo4cjYva2hWZHR1UFBGeXNGRmwxSG0xbFY0?=
 =?utf-8?B?Q2JDWTVuTHNvZ3NhaHU2WWszMzcwZm5KaUpYN3g5MEVreVJHRkRpc0xWQXBX?=
 =?utf-8?B?TDB1dU4zTXNHUlhKRUZrVGMxUHVIdDdwRXllSGUvTmI4L25pVnl0eEs1WlZi?=
 =?utf-8?B?TEw4WWJ3YnRENU9zSDlFMDhDVnZUdTR2c2FiTEh2TG9ta1VnVWF3TDdjRWhB?=
 =?utf-8?B?K0ZtSWlaRXNXUDZJYm5WZ01wYkhFMUt4clZIR3JtQmkySmhjaG44aVR3Q1JD?=
 =?utf-8?B?WjZLdTJsRXBrRFI3RGVBVjhnbGtQTGwzNy9EeU9mT2dlN2p6bjdKdU04MFM0?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e713e3-1aea-453b-a62c-08dc9be6dc57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:05:02.2563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+0tSa2x88vFvwcO9SIvMpnKKVN0TYPIgzusO589G114tUJf6fNR/l9dboMGT+Y2LQ8Ze7zFWlE1hDW/b7xxRWD9aYATTYBk5i5/aqPi+io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
X-Proofpoint-GUID: whUoIYYFJteJ5T6WhqezSVCtfUhEKUVo
X-Proofpoint-ORIG-GUID: whUoIYYFJteJ5T6WhqezSVCtfUhEKUVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=639 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201502

--------------Ecpijbt24DZMPVElAuk1D2rg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 6/18/24 18:52, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> when the tmpdir dir is longer than 220, there is no files saved in
> tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
> this is because apt-get uses the path as the file name, but the file
> name can't be longer than 255 according to /usr/include/linux/limits.h.
>
> [YOCTO #2688]
>
> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>
> Take back fromhttps://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
>   meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
>
> diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
> new file mode 100644
> index 0000000000..c88efa3aae
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
> @@ -0,0 +1,40 @@
> +From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Tue, 18 Jun 2024 10:32:55 +0800
> +Subject: [PATCH] strutl.cc: the filename can't be longer than 255
> +
> +The URItoFileName translates the path into the filename, but the
> +filename can't be longer than 255 according to
> +/usr/include/linux/limits.h.
> +
> +Truncate it when it is longer than 240 (leave some spaces for
> +".Packages" and "._Release" suffix)
> +
> +Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1073591]
> +Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + apt-pkg/contrib/strutl.cc | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
> +index 67100f1..5076b35 100644
> +--- a/apt-pkg/contrib/strutl.cc
> ++++ b/apt-pkg/contrib/strutl.cc
> +@@ -565,7 +565,12 @@ string URItoFileName(const string &URI)
> +    // "\x00-\x20{}|\\\\^\\[\\]<>\"\x7F-\xFF";
> +    string NewURI = QuoteString(U,"\\|{}[]<>\"^~_=!@#$%^&*");
> +    replace(NewURI.begin(),NewURI.end(),'/','_');
> +-   return NewURI;
> ++
> ++   // Truncate from the head when it is longer than 240
> ++   if(NewURI.length() > 240)
> ++       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
> ++   else
> ++       return NewURI;
> + }
> + 									/*}}}*/
> + // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
> index 26a6d99f84..b6b56c0010 100644
> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
> +++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
> @@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
>              file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch  \
>              file://0001-aptwebserver.cc-Include-array.patch  \
>              file://0001-Remove-using-std-binary_function.patch  \
> +file://0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch  \
>              "
>   
>   SRC_URI:append:class-native = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200867):https://lists.openembedded.org/g/openembedded-core/message/200867
> Mute This Topic:https://lists.openembedded.org/mt/106738366/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------Ecpijbt24DZMPVElAuk1D2rg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 6/18/24 18:52, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17DA13C5DEE6F556.1999@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

when the tmpdir dir is longer than 220, there is no files saved in
tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
this is because apt-get uses the path as the file name, but the file
name can't be longer than 255 according to /usr/include/linux/limits.h.

[YOCTO #2688]

Signed-off-by: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>

Take back from <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf">https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf</a>
Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
new file mode 100644
index 0000000000..c88efa3aae
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
@@ -0,0 +1,40 @@
+From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 18 Jun 2024 10:32:55 +0800
+Subject: [PATCH] strutl.cc: the filename can't be longer than 255
+
+The URItoFileName translates the path into the filename, but the
+filename can't be longer than 255 according to
+/usr/include/linux/limits.h.
+
+Truncate it when it is longer than 240 (leave some spaces for
+&quot;.Packages&quot; and &quot;._Release&quot; suffix)
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1073591">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1073591</a>]
+Signed-off-by: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ apt-pkg/contrib/strutl.cc | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 67100f1..5076b35 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -565,7 +565,12 @@ string URItoFileName(const string &amp;URI)
+    // &quot;\x00-\x20{}|\\\\^\\[\\]&lt;&gt;\&quot;\x7F-\xFF&quot;;
+    string NewURI = QuoteString(U,&quot;\\|{}[]&lt;&gt;\&quot;^~_=!@#$%^&amp;*&quot;);
+    replace(NewURI.begin(),NewURI.end(),'/','_');
+-   return NewURI;
++
++   // Truncate from the head when it is longer than 240
++   if(NewURI.length() &gt; 240)
++       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
++   else
++       return NewURI;
+ }
+ 									/*}}}*/
+ // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 26a6d99f84..b6b56c0010 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,6 +14,7 @@ SRC_URI = &quot;${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch">file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-aptwebserver.cc-Include-array.patch">file://0001-aptwebserver.cc-Include-array.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Remove-using-std-binary_function.patch">file://0001-Remove-using-std-binary_function.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch">file://0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch</a> \
            &quot;
 
 SRC_URI:append:class-native = &quot; \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200867): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200867">https://lists.openembedded.org/g/openembedded-core/message/200867</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106738366/3616873">https://lists.openembedded.org/mt/106738366/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Ecpijbt24DZMPVElAuk1D2rg--

