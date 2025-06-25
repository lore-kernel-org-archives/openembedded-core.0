Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6336AC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:29:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12251.1750847305040598975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 03:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271525806=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5U9OQ008046
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:28:24 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14v4aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5nTCNflbRsGIS8EjOpE5cpMztTmMGFE5K0WcYrxEcBzow4Q325tCMfAZlqaM6MX/XboybhSp5wWvS2kybUDPEl+LTZzvILWYAQffz6EJ5LkPwwMqxDUuZa+oEcAsIj1ZWc0mq7xPe9zv3rk+b0F4fq5sZdx0f1zPjk82IT7NFlWJOo28Bio+37C2qjtxvL+I1BzNglCNqqr72Lii4XJqDnBrb4+Lw+siRv20fEwiXliHIcZQOFcEk/Q6woWHqYHK6ozeQmOfDTsAr0ADIA5mikwiRaeMxtOgCWbrG1MYB4REYnwmUwjWIYZU/ghzq1oyP3mAUUJx6clUtnUXICcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oanBfpoSp8Bj96ILjGDuR3DozFW1USCPNBnEmQxmkN8=;
 b=vWxYTPdFD7Zy5CSgLsGwI8UEOLa6ngZex6+qT4UplQqLDPf4QVmAzmckKYG1DTgFqd/P05ayl4LK30vLP4eFH9j61oaA0UR6CF1tqHoO+Z502kMOazQQXeCYMPmEfgO2dY7ZUzYEX+BEZvltIBYgCU7U3xK8YSKXbE9HlBv/5Wj7G/ZpS01laJJlKXhSqHQsMq0eHEkBR3wcGZMpfNzeVJ4kGvbmN0kdaVT0NLW/IJKJEzZXM32RO9knSVnJ6xYNIbccxyKFWxB8gBsn4uEaBsKbDfabKgvPmiqthw1NnqXwuyV9ovB1l91/2m30x5u+0tQ5T38wYN4H4tfFt51YFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 10:28:21 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 10:28:21 +0000
Message-ID: <aef3eb78-670f-4cd8-833b-d86cf3030e47@windriver.com>
Date: Wed, 25 Jun 2025 03:29:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: Upgrade 1.86.0 -> 1.87.0
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
 <20250624091403.2469860-2-Yash.Shinde@windriver.com>
 <a2aa5a51-61fb-4fa6-a061-205d456b0be3@windriver.com>
From: "Yash Shinde" <Yash.Shinde@windriver.com>
In-Reply-To: <a2aa5a51-61fb-4fa6-a061-205d456b0be3@windriver.com>
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a83041-4736-4b75-8f52-08ddb3d30216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFJUMzMzRHJMWkhYZDBjQ29QdU1uQXlCMDZHMmthcjl5bFBneEV6THNMbGdX?=
 =?utf-8?B?cVNpWkZNUjJ1SStBVlVETE5kdkt1ayt6Q2U2bFhpTUptRXlIYkRySWRNc0J1?=
 =?utf-8?B?NzRJMXVmOEF6OVQrT05vbmFqcHVaOGxSWkI4VmwrOHhsZmoyUTVPaTJac0FR?=
 =?utf-8?B?ZmJyaUltbFViWkgwNXI2RzRsQzlNV2M1cmVnd2tQTjVEd01GVlJPaGQzd1lG?=
 =?utf-8?B?REdFZ204YlVIMjhFWktXQWl4S0d1V2pWTkREWFMxRXErYWFlVFU0QlpzL3ZR?=
 =?utf-8?B?aHhCRFhVSTVNaXgwT1QxVlBJaVp2cTV5R2U4UXJIMUdoQ1FvM3Z5V2VMQUpT?=
 =?utf-8?B?VzBpWTBIQVVyOHBURk5kWlJqRzRtc0N0S3JndEJWb2ZOOVdyRFZxYnQ3MEo0?=
 =?utf-8?B?TkhOOGQzMkh2QkJrNjFseGszM3NLUm55aW5Tai9sN3lMSktIazNGYXZxSGJs?=
 =?utf-8?B?SmpRVnN0S0JHYjh0b0pZdlJHSUQ1b2JDMTJaNTRZQXNGZXhZbmRMaFpkaWJK?=
 =?utf-8?B?OVY3amZQVWhmbTJqdGdBT0pIQnJXcHhJelJ3RnNrK1o0MGFod3ljbVA0RWlL?=
 =?utf-8?B?c292a1VTUW52Zk5NYWpGM1hMOFN0YVFyYVNNK3hGV2FJZXZSSXdqQUpwdGpL?=
 =?utf-8?B?NkVHbjNibXMvUUZQL21DM1kxeWJtNlVLR0RuN3FzL041UmJUTmVsRzduSDZO?=
 =?utf-8?B?N0VlUnRXTkRpNkhTTmZ0a3Y3YXl0bFpoKzBuSUVYay8vVzlOc0NvWEhRNVRT?=
 =?utf-8?B?OENzNnFyb1Avc21YREEwQjBURWQ0NGJZeG1IKzdyNDNDS2F1dE02eWhoN3Zs?=
 =?utf-8?B?Wm9EM2d2cmVaMmZLYTJjWkE0S3cwcTgydVZPNUxiOE5KY3lSeHQ0N2hPdkZ4?=
 =?utf-8?B?SDdMOG0zdzFQU2E4SW01eGcvY3NhaS9lTFFYREs2RXEzSVFXQ2hTNHdybzZV?=
 =?utf-8?B?d1FUNVF4U0V3c0FEUjB6QlU5OWUrSEJ4cjZaODJlVzNwVzNablVVSDZIUkZp?=
 =?utf-8?B?LzBjMGxDS0RhNUZNd3l1TFcrVFZXK00vSmlzKzhwOVYzSTZicnlPRlNLVno2?=
 =?utf-8?B?ZGpBOTZqZkJQSVcvQi8wRUNsQURwZkl3RzVHVStYbXpUR1ZIV1dITUxrSmh4?=
 =?utf-8?B?NTRzOE9rOFdwQmFmVWtvbDNGT0FINzZTMDkwbU9YS0xtSmNVVTF6UStsVnQ4?=
 =?utf-8?B?RnZFS3pad1ZENmZCbWIwUUdicnNjWmFQY3JaTkVKaTUrTWJhNDFyQlhQYnc4?=
 =?utf-8?B?ekZiZjJ2WEFjL2hmdWI2MGs1ZnV4ZVJNY3lXcXVGK0pTNlg4Ym9GY3hucjk5?=
 =?utf-8?B?QlNibkxoMTcrRUZyZWlkYlFIbXlWZW5xK3B2cTMzT0FEdjYvNHZJUmErS01Q?=
 =?utf-8?B?Y0R3dnl1WENDbEJtK2J6YlZYK0Q4R2NFMUxiRU9idGFGQ1o2eEEyNkpJbVgv?=
 =?utf-8?B?bzlBci96a0VVUWhXUDlkUHJiWXQySEFBYkdZMVIzMk5SZ3B5WDdQQmhXdTZI?=
 =?utf-8?B?UXkvTFU3YTdwVHdLck1kZWxvWDhNWXBITFdaRXVYU0JhQzdyaVcyeTBWMTVB?=
 =?utf-8?B?Ukp2bFVtdlpBQjE2WG9VSTlQWXRhSmhtcVJuakFvdVV0WFVLR0IwamFMaWpw?=
 =?utf-8?B?clZleHZtdUlvUHBWeFViY3lVYm9VVXVBbThGZ3lLUFNOWWdMcmpRcTVBOHo3?=
 =?utf-8?B?SzV3cDFDSjNvM21Zdis4OENyQnA3em9lTXhMTWg2V3hsbXUxb1NUYkxtcWxV?=
 =?utf-8?B?dTNtYWFWSzAwVUxjdWZORDJKa20xNnpHcURJai9mK3pyeWIzWEpldXlmZ2Uz?=
 =?utf-8?B?eDc3UXFFc3RpZmI2a0t4dGFsR0U2aWg4NjBpa1FHbURoMDJDT0U0MGxvZGVX?=
 =?utf-8?Q?YcvLQrwtCLCpA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1U1M29oZDlJVmx6bFZwZUZqNjFaczFWSXlkVXYyNlZjbmxPRnlEZkxpYkZq?=
 =?utf-8?B?emo3WTA3SGxvM0dsQ3ptanBMK3o5YVl4RWk4WWFoaFMwR2pOVzgvT2h2dEh3?=
 =?utf-8?B?Z1hQc3RYZ3FvZklCV3RsN2FPaUU3djZmSVhndTl4WWcwMUQ4YlF3U0Jxd29S?=
 =?utf-8?B?cDJXSTBldEwyU0k4MnBNczJWQ1ladjJGM1psQzdKb1pDQ2JQTDZHTEVpakF5?=
 =?utf-8?B?Vkl0Q1pZRC8zY1dFdVdDZCtWa0hwZ25UeU55TmRhMDJzZVF3bzV4WkY4dHpn?=
 =?utf-8?B?dWpOVStwMzQzditaSjVRQUU1MzVnQlN3RktEUGw5WlROdC9pb1BlajRLZ01M?=
 =?utf-8?B?ZEdWNkFwb2dDWDcyYmprTWJwb0dmeloxSXdmbndqZGVyUGFvcUZZS1o5SjUv?=
 =?utf-8?B?S2ZnSEtHSDYxWGpuRHVnY0VRUW85c3hDQ1RMcjR0c3paakUzMHYvYTh5QTIz?=
 =?utf-8?B?ZmQvUnljZlZkbzdpcks3RkRxOHlDdUFCaURISHdDSnRsTExVK3RUaFlJWXZU?=
 =?utf-8?B?RDNWcGdPbjlHU1JkS2V4eEl0MG1ZUkxMV2pjRGk1RU05TG12MnlmOFg5MXR5?=
 =?utf-8?B?RVROVmpnV3UxWXBZRWFFU3Y1YkFHYVVJUm9keUl0Q0piWk82WXhxenJzUzhC?=
 =?utf-8?B?OW15STZVaVRnenBkV1ZsTTl1SlE3K0lIQTZLR0VBU2k4Y2p0VEpGckJtdXBy?=
 =?utf-8?B?V1dJaGZDTUpSYUsySjJ4RXdvYzFCcXVUR1hUZmR2SUI1MmI0UUJ4VlloU0hu?=
 =?utf-8?B?M0pEaWxma2c5R2VsUmZMZVI4czNyUFhMbHNrdkNhK29STWQ1cjZ1Ly9TdW1H?=
 =?utf-8?B?c3NHSGMrYnV4UUNrMkJsUi9xTjh4cFMvVHZnMHhxNDBaMWJ4R21vRHgwZmxh?=
 =?utf-8?B?K1VnNTk5RVpwaGlOTmpWKzYwMUlsRlhpbWVJUU9uYjFLMVNCZlZ1STBLZnEy?=
 =?utf-8?B?UmVGY0pGdmtjVysyclVyQnN6cXFHYmdzUXJsWnZaM0l3bFIzTzIzK1d0Sjdu?=
 =?utf-8?B?OGNMMVFLR3RWcmU1NFhPRG80VFgvNEQrTXlGZ1hjeDVjMEpsenlWN2tmYkJZ?=
 =?utf-8?B?TmdXTVRSYXM0RGU5YWtERkZ6V1FSaEozcDJhOWxNZUdQLzNEMG91WElGY3gx?=
 =?utf-8?B?MEw3SUQ5a1ZKVDhMU3pHK1BxakQ1TEtGOEpONnBxWGhiYjhQcEZZT0JJcjJB?=
 =?utf-8?B?b2dMcGtIM0NzYkdkZE1mNGh6eGVOQzJGNHJsbWp5K296Y3dpMFFhUXNVY2g2?=
 =?utf-8?B?TjBFSm9INnovRVNkWmluSjNuOTVYb3cyUUVwdFBuME1IT0srWUp2RVpNNlE5?=
 =?utf-8?B?NXR0clYwRHVBNmphQkY2dEJSZ0lFdEVqZkhlWUtDS0hHTzlHSm8xQmZwWDNh?=
 =?utf-8?B?R3ZHREgzMzZVTzlVenc5NzlBajFzYmM2SnNaL1E1d0VJdmZRUWVHNTVzcU55?=
 =?utf-8?B?bS9WOHBZb29SbG51WU5iTVhhNnJnY0E1dkxvY3BxZDEvSHg1QXRjN0FEc3Yx?=
 =?utf-8?B?aDNwWHQzQVJJVVRQK0o1aU5RbStsNjNkVHBOV2xVa0d0cnpuUUVCb2YreGZR?=
 =?utf-8?B?Z2ozWkNLRUNTT3ZIdjBrYnJQTkdsbkppRW9COWlObXlDdk9BZGNGc0xKTWNX?=
 =?utf-8?B?ajJEeXJrYUd3Qk5nMG1NR20vN0dlN0cwaVc2cmxnMUp2UldBN2c0L3Jmc2xJ?=
 =?utf-8?B?YjhnZko2dllIS2VSVDRQeGFMQU1LOTFlSjVnREFmS3krQzhLang4bUJEUnJ2?=
 =?utf-8?B?cnRoOGs2WFdHWjNsS29ON2YvNk1vY2JhY0lRQWROWjNML2VvS0h3ZlE3UVFr?=
 =?utf-8?B?VjRkMFNWV0tXalZkNEhvbXBBcE1NQlZ5dERHWFFSNnRWK09wb3BCdVlSSGVi?=
 =?utf-8?B?Vyt6eEVuSzR1MENSV0s2alh1dEhMaGZXTjdKVHlRUkpwcmMzK0dOc0ZYcnBR?=
 =?utf-8?B?QkVMWkpEVlFtUmVMbUErenpia2hNZGpuN3RlaTBTYVp4eGlHb251dTA5QWFt?=
 =?utf-8?B?dmZWcXh6d3pFSmNQSGJhRzRENi9TVVAvUEJqdU5HYTB1QXVTRjBNNmNFNits?=
 =?utf-8?B?UVljS3V0UEVoTXd3ejlBTW10blNsNVRCd21YNkVGMHNBL1F0TDBKWmpLUkgw?=
 =?utf-8?B?RG1iSGFHdTM1NGp6dFFZMFBJb3ZaU215RXNuL3NKeEJiY010NEhOZm5FdHdx?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a83041-4736-4b75-8f52-08ddb3d30216
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:28:21.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AW4ThPDlgYqm3kM2w1SQvsJi2JtaAUoEtFmcySst7mmgKxqbWWdRnEL4DQlL/jpvQOrrROAkDvalsyaBaRG7FykXyTCiGRHxnmtu6HOVic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
X-Proofpoint-ORIG-GUID: NxpsLGcJ6Px6hDJcb15imvf6sDTmwiSo
X-Proofpoint-GUID: NxpsLGcJ6Px6hDJcb15imvf6sDTmwiSo
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685bcf48 cx=c_pps a=HV6YmhhQopcmGlS8XJ+vpA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=QgTs8lMBrFI9gbAJMAoA:9 a=ykBlsHF7U1WOCMx3:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfX2SyYOKu+ru/X V8foxA0TH2s9ash+E/P5Aa1DATQpWm/7QvFA/10KcoGKjO4Y/lkfiCEDvGpA+4fK+7AeZ+GbyHi A87suyHj+7K8XAdQBlrDSvD2EkTs3iJfVtFBGOtADnbAorgVrxvaaMIIG52/DQRRDm0v4FPc7x7
 X3Xd2mtZ3dgfaEprHAvlX5kbciA0YVfnxGRUzPuffwdADV800n0/mnX1TrU56U9fgpil10vi+SY B16MSjSiy6m6cpqqrYCq1bIQjL9uJkjy0ogV8elFjEb6YReWLxIr9Gvb22ytFLBapJcXb30+M8D 7LmX4X8iSXTR7LwRddFOS06GQugKMg7xsXFqe3vxO7nxQpCteUk8dcO1YgEiu2Wz7RT4nttuEj1
 tLj6RftS57nW02zeoHYu4msqBTPZNOhueyKKyM1MNwMmm73z9/9evHXPm4BMzrH8Dp5vdVRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250078
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55P5U9OQ008046
X-Old-Date: Wed, 25 Jun 2025 15:58:13 +0530
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219315
Message-ID: <20250625102943.hIjIiAl5DvT0ngOirTeJlqpaxHCyTnY7C5iUCxrBTQg@z>


On 24-06-2025 22:17, Randy MacLeod wrote:
> On 2025-06-24 5:14 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Rust stable version updated to 1.87.0.
>> https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/
>>
>> * Update LLVM data-layout for arm64.
> Expand this section. Why are you doing this?
> How did you decide on this data-layout?
The do_compile task of the recipe informs about the new llvm data-layout:

error: data-layout for target `aarch64-poky-linux-gnu`,=20
`e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32`,
differs from LLVM target's `aarch64-poky-linux-gnu` default layout,=20
`e-m:e-p270:32:32-p2=20
71:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32`

The aarch64 llvm data-layout was updated to to allow using 32-bit=20
signed/unsigned pointers
when building 64-bit targets using 270, 271 and 272 address spaces.

https://github.com/rust-lang/rust/commit/e9853961452b56997cc127b51308879b9c=
d09482
https://github.com/llvm/llvm-project/commit/c9f27275c1330a325661bdf14fb3bc4=
44a5e3648

>> * Rebase existing patches with v1.87.0.
>>
>> * Two tests from the `ui` and `codegen` modules now fail only on riscv64=
.
>>    Enable them on arm32/64 and x86-32/64 targets, while restricting
>>    them on riscv64 via `only-<target_arch>` tags.
> Nice! Can you mention the overall testsuite status briefly in the v2=20
> commit log?
>> * Add triagebot.patch file to keep running tidy checks.
>
> Could you expand this sentence to explain what these checks do, please?
>
> Is this a new feature in 1.87.0? Ah, I read the patch and think you=20
> should just
>
> include something like the first part of the patch in the commit log:
>
> +Skip tidy triagebot linkcheck if triagebot.toml doesn't exist
> +
> +Distribution tarballs won't include triagebot.toml, which
> +causes tidy checks to fail with the following error:
> +
> +=C2=A0=C2=A0 tidy error: triagebot.toml file not found
> +=C2=A0=C2=A0 some tidy checks failed
>
> but format it properly and mention that it's a backport.
>
>
Amended commit message in v2:
https://lists.openembedded.org/g/openembedded-core/message/219310
>
>> * During rust installation, some binaries were installed from
>>    'stage2-tools' built path to '${D}${bindir}'. However, from
>>    v1.87 the stage2-tools are no longer built by default.
>>    Update logic to install from `stage1-tools` instead.
>
> Okay. It would be nice to understand why but that's not essential, I=20
> suppose.
>
>
> Generally, this is a good commit message, albeit a bit terse as=20
> pointed out above.
>
>
> Can you also comment on the build time and FS footprint changes if any ?
>
The build time and filesystem usage remain similar to the previous version.


Regards,
Yash.
>
> I've looked through the changes below and I don't have any comments.
>
> ../Randy
>
>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   .../classes-recipe/rust-target-config.bbclass |   2 +-
>>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>>   .../rust/{cargo_1.86.0.bb =3D> cargo_1.87.0.bb} |   0
>>   ...teps-tool.rs-switch-off-lto-for-rust.patch |  30 ++--
>>   ...crease-timeout-in-process-sigpipe-ru.patch |   4 +-
>>   ...d-statically-in-rustc_driver-feature.patch |  11 +-
>>   .../rust/files/rust-oe-selftest.patch         | 147 ++++++++++--------
>>   .../rust/files/triagebot.patch                |  32 ++++
>>   ...ibstd-rs_1.86.0.bb =3D> libstd-rs_1.87.0.bb} |   0
>>   ....86.0.bb =3D> rust-cross-canadian_1.87.0.bb} |   0
>>   ...ust-llvm_1.86.0.bb =3D> rust-llvm_1.87.0.bb} |   4 +-
>>   meta/recipes-devtools/rust/rust-snapshot.inc  |  78 +++++-----
>>   meta/recipes-devtools/rust/rust-source.inc    |   3 +-
>>   .../rust/{rust_1.86.0.bb =3D> rust_1.87.0.bb}   |   4 +-
>>   14 files changed, 186 insertions(+), 131 deletions(-)
>>   rename meta/recipes-devtools/rust/{cargo_1.86.0.bb =3D> cargo_1.87.0.b=
b} (100%)
>>   create mode 100644 meta/recipes-devtools/rust/files/triagebot.patch
>>   rename meta/recipes-devtools/rust/{libstd-rs_1.86.0.bb =3D> libstd-rs_=
1.87.0.bb} (100%)
>>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.86.0.bb =3D> =
rust-cross-canadian_1.87.0.bb} (100%)
>>   rename meta/recipes-devtools/rust/{rust-llvm_1.86.0.bb =3D> rust-llvm_=
1.87.0.bb} (96%)
>>   rename meta/recipes-devtools/rust/{rust_1.86.0.bb =3D> rust_1.87.0.bb}=
 (99%)
>>

