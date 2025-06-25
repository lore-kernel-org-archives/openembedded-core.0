Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A512C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:28:29 +0000 (UTC)
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
Date: Wed, 25 Jun 2025 15:58:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: Upgrade 1.86.0 -> 1.87.0
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
 <20250624091403.2469860-2-Yash.Shinde@windriver.com>
 <a2aa5a51-61fb-4fa6-a061-205d456b0be3@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <a2aa5a51-61fb-4fa6-a061-205d456b0be3@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55P5U9OQ008046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219315


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

https://github.com/rust-lang/rust/commit/e9853961452b56997cc127b51308879b=
9cd09482
https://github.com/llvm/llvm-project/commit/c9f27275c1330a325661bdf14fb3b=
c444a5e3648

>> * Rebase existing patches with v1.87.0.
>>
>> * Two tests from the `ui` and `codegen` modules now fail only on riscv=
64.
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
> Can you also comment on the build time and FS footprint changes if any =
?
>
The build time and filesystem usage remain similar to the previous versio=
n.


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
>>   .../rust/files/rust-oe-selftest.patch         | 147 ++++++++++------=
--
>>   .../rust/files/triagebot.patch                |  32 ++++
>>   ...ibstd-rs_1.86.0.bb =3D> libstd-rs_1.87.0.bb} |   0
>>   ....86.0.bb =3D> rust-cross-canadian_1.87.0.bb} |   0
>>   ...ust-llvm_1.86.0.bb =3D> rust-llvm_1.87.0.bb} |   4 +-
>>   meta/recipes-devtools/rust/rust-snapshot.inc  |  78 +++++-----
>>   meta/recipes-devtools/rust/rust-source.inc    |   3 +-
>>   .../rust/{rust_1.86.0.bb =3D> rust_1.87.0.bb}   |   4 +-
>>   14 files changed, 186 insertions(+), 131 deletions(-)
>>   rename meta/recipes-devtools/rust/{cargo_1.86.0.bb =3D> cargo_1.87.0=
.bb} (100%)
>>   create mode 100644 meta/recipes-devtools/rust/files/triagebot.patch
>>   rename meta/recipes-devtools/rust/{libstd-rs_1.86.0.bb =3D> libstd-r=
s_1.87.0.bb} (100%)
>>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.86.0.bb =3D=
> rust-cross-canadian_1.87.0.bb} (100%)
>>   rename meta/recipes-devtools/rust/{rust-llvm_1.86.0.bb =3D> rust-llv=
m_1.87.0.bb} (96%)
>>   rename meta/recipes-devtools/rust/{rust_1.86.0.bb =3D> rust_1.87.0.b=
b} (99%)
>>
>> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/cla=
sses-recipe/rust-target-config.bbclass
>> index 906a5083d7..cac6e90a9e 100644
>> --- a/meta/classes-recipe/rust-target-config.bbclass
>> +++ b/meta/classes-recipe/rust-target-config.bbclass
>> @@ -171,7 +171,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] =3D "64"
>>   FEATURES[armv7-eabi] =3D "+v7,+vfp2,+thumb2"
>>  =20
>>   ## aarch64-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[aarch64] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32=
:64-S128-Fn32"
>> +DATA_LAYOUT[aarch64] =3D "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8=
:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
>>   TARGET_ENDIAN[aarch64] =3D "little"
>>   TARGET_POINTER_WIDTH[aarch64] =3D "64"
>>   TARGET_C_INT_WIDTH[aarch64] =3D "32"
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc
>> index e943ca77d1..c506bb3ad5 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>>   GCCVERSION ?=3D "15.%"
>>   SDKGCCVERSION ?=3D "${GCCVERSION}"
>>   GLIBCVERSION ?=3D "2.41%"
>> -RUSTVERSION ?=3D "1.86.0%"
>> +RUSTVERSION ?=3D "1.87.0%"
>>  =20
>>   PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>>   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
>> diff --git a/meta/recipes-devtools/rust/cargo_1.86.0.bb b/meta/recipes=
-devtools/rust/cargo_1.87.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/cargo_1.86.0.bb
>> rename to meta/recipes-devtools/rust/cargo_1.87.0.bb
>> diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_step=
s-tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/file=
s/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
>> index 5e0f5912a1..a7da69dce3 100644
>> --- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.=
rs-switch-off-lto-for-rust.patch
>> +++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.=
rs-switch-off-lto-for-rust.patch
>> @@ -24,9 +24,9 @@ diff --git a/src/bootstrap/src/core/build_steps/tool=
.rs b/src/bootstrap/src/core
>>   index 087df2f8a..00790affb 100644
>>   --- a/src/bootstrap/src/core/build_steps/tool.rs
>>   +++ b/src/bootstrap/src/core/build_steps/tool.rs
>> -@@ -1,14 +1,11 @@
>> - use std::path::PathBuf;
>> - use std::{env, fs};
>> +@@ -15,14 +15,12 @@
>> + #[cfg(feature =3D "tracing")] + use tracing::instrument; -use=20
>> crate::core::build_steps::compile::is_lto_stage; use=20
>> crate::core::build_steps::toolstate::ToolState; @@ -36,18 +36,20 @@=20
>> index 087df2f8a..00790affb 100644 - Builder, Cargo as CargoCommand,=20
>> RunConfig, ShouldRun, Step, cargo_profile_var, -}; -use=20
>> crate::core::config::{DebuginfoLevel, RustcLto, TargetSelection}; ++=20
>> +use crate::core::builder::{Builder, Cargo as CargoCommand,=20
>> RunConfig, ShouldRun, Step}; +use=20
>> crate::core::config::{DebuginfoLevel, TargetSelection}; use=20
>> crate::utils::channel::GitInfo; use=20
>> crate::utils::exec::{BootstrapCommand, command}; use=20
>> crate::utils::helpers::{add_dylib_path, exe, t}; -@@ -658,19 +655,7=20
>> @@ - SourceType::InTree, - features.as_slice(), +@@ -148,20 +146,7 @@=20
>> + &self.extra_features, ); -- -- // rustdoc is performance sensitive,=20
>> so apply LTO to it. -- if is_lto_stage(&build_compiler) { + +- if=20
>> path.ends_with("/rustdoc") &&
>> +-            // rustdoc is performance sensitive, so apply LTO to it.
>> +-            is_lto_stage(&self.compiler)
>> +-        {
>>   -            let lto =3D match builder.config.rust_lto {
>>   -                RustcLto::Off =3D> Some("off"),
>>   -                RustcLto::Thin =3D> Some("thin"), @@ -60,14 +62,14 =
@@ index 087df2f8a..00790affb 100644 - } +=20
>> cargo.rustflag("-Clto=3Doff");
>>   =20
>> -         let _guard =3D builder.msg_tool(
>> -             Kind::Build,
>> +         if !self.allow_features.is_empty() {
>> +             cargo.allow_features(self.allow_features);
>>   diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/s=
rc/core/builder/mod.rs
>>   --- a/src/bootstrap/src/core/builder/mod.rs
>>   +++ b/src/bootstrap/src/core/builder/mod.rs
>> -@@ -11,7 +11,7 @@
>> -
>> - use clap::ValueEnum;
>> +@@ -13,7 +13,7 @@
>> + #[cfg(feature =3D "tracing")]
>> + use tracing::instrument;
>>   =20
>>   -pub use self::cargo::{Cargo, cargo_profile_var};
>>   +pub use self::cargo::Cargo;
>> diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-t=
imeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeq=
a-selftest-Increase-timeout-in-process-sigpipe-ru.patch
>> index bb27ca35ff..5bd1abffb4 100644
>> --- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-=
in-process-sigpipe-ru.patch
>> +++ b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-=
in-process-sigpipe-ru.patch
>> @@ -22,10 +22,10 @@ index 11f363d62..c12d66016 100644
>>   +++ b/tests/ui/process/process-sigpipe.rs
>>   @@ -23,7 +23,7 @@ use std::thread;
>>    fn main() {
>> -     // Just in case `yes` doesn't check for EPIPE...
>> +     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
>>        thread::spawn(|| {
>>   -        thread::sleep_ms(5000);
>>   +        thread::sleep_ms(50000);
>>            process::exit(1);
>>        });
>> -     let output =3D process::Command::new("sh")
>> +     // QNX Neutrino does not have `yes`. Therefore, use `while-echo`=
 for `nto`
>> diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statical=
ly-in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/rever=
t-link-std-statically-in-rustc_driver-feature.patch
>> index 20a49d46dc..9bbbce0182 100644
>> --- a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-r=
ustc_driver-feature.patch
>> +++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-r=
ustc_driver-feature.patch
>> @@ -200,11 +200,10 @@ diff --git a/src/bootstrap/src/core/build_steps/=
compile.rs b/src/bootstrap/src/c
>>   index 27bbc8bd8f..a6fc4df2eb 100644
>>   --- a/src/bootstrap/src/core/build_steps/compile.rs
>>   +++ b/src/bootstrap/src/core/build_steps/compile.rs
>> -@@ -1940,24 +1940,8 @@ impl Step for Assemble {
>> -         let src_libdir =3D builder.sysroot_target_libdir(build_compi=
ler, host);
>> +@@ -2158,23 +2158,7 @@
>>            for f in builder.read_dir(&src_libdir) {
>>                let filename =3D f.file_name().into_string().unwrap();
>> --
>> +
>>   -            let is_proc_macro =3D proc_macros.contains(&filename);
>>   -            let is_dylib_or_debug =3D is_dylib(&f.path()) || is_deb=
ug_info(&filename);
>>   -
>> @@ -214,8 +213,7 @@ index 27bbc8bd8f..a6fc4df2eb 100644
>>   -            let can_be_rustc_dynamic_dep =3D if builder
>>   -                .link_std_into_rustc_driver(target_compiler.host)
>>   -                && !target_compiler.host.is_windows()
>> -+            if (is_dylib(Path::new(&filename)) || is_debug_info(&fil=
ename)) && !proc_macros.contains(&filename)
>> -             {
>> +-            {
>>   -                let is_std =3D filename.starts_with("std-") || file=
name.starts_with("libstd-");
>>   -                !is_std
>>   -            } else {
>> @@ -223,6 +221,7 @@ index 27bbc8bd8f..a6fc4df2eb 100644
>>   -            };
>>   -
>>   -            if is_dylib_or_debug && can_be_rustc_dynamic_dep && !is=
_proc_macro {
>> -                 builder.copy_link(&f.path(), &rustc_libdir.join(&fil=
ename));
>> ++            if (is_dylib(Path::new(&filename)) || is_debug_info(&fil=
ename)) && !proc_macros.contains(&filename) {
>> +                 builder.copy_link(&f.path(), &rustc_libdir.join(&fil=
ename), FileType::Regular);
>>                }
>>            }
>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b=
/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> index 49d85072cb..b7ef806e65 100644
>> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> @@ -47,61 +47,85 @@ diff --git a/library/std/tests/sync/rwlock.rs b/li=
brary/std/tests/sync/rwlock.rs
>>   index 1a9d3d3f12f..0a9cfc48806 100644
>>   --- a/library/std/tests/sync/rwlock.rs
>>   +++ b/library/std/tests/sync/rwlock.rs
>> -@@ -47,6 +47,7 @@ fn frob() {
>> - }
>> -
>> +@@ -74,6 +74,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_rw_arc_poison_wr() {
>>        let arc =3D Arc::new(RwLock::new(1));
>>        let arc2 =3D arc.clone();
>> -@@ -72,6 +73,7 @@ fn test_rw_arc_poison_mapped_w_r() {
>> - }
>> -
>> +@@ -87,6 +88,7 @@
>> +
>> + #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>> ++#[ignore]
>> + fn test_rw_arc_poison_mapped_w_r() {
>> +     let arc =3D Arc::new(RwLock::new(1));
>> +     let arc2 =3D arc.clone();
>> +@@ -101,6 +103,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_rw_arc_poison_ww() {
>>        let arc =3D Arc::new(RwLock::new(1));
>>        assert!(!arc.is_poisoned());
>> -@@ -100,6 +102,7 @@ fn test_rw_arc_poison_mapped_w_w() {
>> +@@ -115,6 +118,7 @@
>>    }
>> -
>> +
>> + #[test]
>> ++#[ignore]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>> + fn test_rw_arc_poison_mapped_w_w() {
>> +     let arc =3D Arc::new(RwLock::new(1));
>> +@@ -131,6 +135,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_rw_arc_no_poison_rr() {
>>        let arc =3D Arc::new(RwLock::new(1));
>>        let arc2 =3D arc.clone();
>> -@@ -127,6 +130,7 @@ fn test_rw_arc_no_poison_mapped_r_r() {
>> - }
>> -
>> +@@ -160,6 +165,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_rw_arc_no_poison_rw() {
>>        let arc =3D Arc::new(RwLock::new(1));
>>        let arc2 =3D arc.clone();
>> -@@ -192,6 +196,7 @@ fn test_rw_arc() {
>> - }
>> -
>> +@@ -227,6 +233,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_rw_arc_access_in_unwind() {
>>        let arc =3D Arc::new(RwLock::new(1));
>>        let arc2 =3D arc.clone();
>> -@@ -275,6 +280,7 @@ fn drop(&mut self) {
>> - }
>> -
>> +@@ -326,6 +333,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_into_inner_poison() {
>>        let m =3D new_poisoned_rwlock(NonCopy(10));
>> -
>> -@@ -299,6 +305,7 @@ fn test_get_mut() {
>> - }
>> -
>> +
>> +@@ -362,6 +370,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_get_mut_poison() {
>>        let mut m =3D new_poisoned_rwlock(NonCopy(10));
>> +
>> +@@ -567,6 +576,7 @@
>> +
>> + #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>> ++#[ignore]
>> + fn panic_while_mapping_write_unlocked_poison() {
>> +     let lock =3D RwLock::new(());
>>  =20
>>   diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
>>   --- a/library/test/src/tests.rs
>> @@ -117,52 +141,22 @@ diff --git a/library/test/src/tests.rs b/library=
/test/src/tests.rs
>>   diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/syn=
c/mutex.rs
>>   --- a/library/std/tests/sync/mutex.rs
>>   +++ b/library/std/tests/sync/mutex.rs
>> -@@ -193,6 +193,7 @@
>> - }
>> -
>> +@@ -312,6 +312,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn test_mutex_arc_poison_mapped() {
>>        let arc =3D Arc::new(Mutex::new(1));
>>        assert!(!arc.is_poisoned());
>> -diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync=
/mutex.rs
>> ---- a/library/std/tests/sync/mutex.rs
>> -+++ b/library/std/tests/sync/mutex.rs
>> -@@ -272,6 +272,7 @@
>> - }
>> -
>> +@@ -391,6 +392,7 @@
>> +
>>    #[test]
>> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwind=
ing support")]
>>   +#[ignore]
>>    fn panic_while_mapping_unlocked_poison() {
>>        let lock =3D Mutex::new(());
>>  =20
>> -diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/tests=
/sync/rwlock.rs
>> ---- a/library/std/tests/sync/rwlock.rs
>> -+++ b/library/std/tests/sync/rwlock.rs
>> -@@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {
>> - }
>> -
>> - #[test]
>> -+#[ignore]
>> - fn test_rw_arc_poison_mapped_w_r() {
>> -     let arc =3D Arc::new(RwLock::new(1));
>> -     let arc2 =3D arc.clone();
>> -@@ -86,6 +87,7 @@ fn test_rw_arc_poison_ww() {
>> - }
>> -
>> - #[test]
>> -+#[ignore]
>> - fn test_rw_arc_poison_mapped_w_w() {
>> -     let arc =3D Arc::new(RwLock::new(1));
>> -     let arc2 =3D arc.clone();
>> -@@ -431,6 +433,7 @@ fn panic_while_mapping_read_unlocked_no_poison() =
{
>> - }
>> -
>> - #[test]
>> -+#[ignore]
>> - fn panic_while_mapping_write_unlocked_poison() {
>> -     let lock =3D RwLock::new(());
>> -
>>   diff --git a/library/coretests/benches/num/int_log/mod.rs b/library/=
coretests/benches/num/int_log/mod.rs
>>   index 3807cd5d76c..018c5c04456 100644
>>   --- a/library/coretests/benches/num/int_log/mod.rs
>> @@ -199,10 +193,10 @@ index 9d4f52a092..d425e5f7b7 100644
>>    fn thread_current_in_dtor() {
>>        // Go through one round of TLS destruction first.
>>        struct Defer;
>> -diff --git a/library/alloc/tests/sort/tests.rs b/library/alloc/tests/=
sort/tests.rs
>> +diff --git a/library/alloctests/tests/sort/tests.rs b/library/allocte=
sts/tests/sort/tests.rs
>>   index 14e6013f96..b670f27ab4 100644
>> ---- a/library/alloc/tests/sort/tests.rs
>> -+++ b/library/alloc/tests/sort/tests.rs
>> +--- a/library/alloctests/tests/sort/tests.rs
>> ++++ b/library/alloctests/tests/sort/tests.rs
>>   @@ -915,12 +915,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
>>    macro_rules! instantiate_sort_test_inner {
>>        ($sort_impl:ty, miri_yes, $test_fn_name:ident) =3D> {
>> @@ -234,10 +228,10 @@ diff --git a/tests/assembly/dwarf-mixed-versions=
-lto.rs b/tests/assembly/dwarf-m
>>   index 5b8e5ff4f4a..e558fbd7bd7 100644
>>   --- a/tests/assembly/dwarf-mixed-versions-lto.rs
>>   +++ b/tests/assembly/dwarf-mixed-versions-lto.rs
>> -@@ -1,6 +1,11 @@
>> - // This test ensures that if LTO occurs between crates with differen=
t DWARF versions, we
>> +@@ -2,6 +2,11 @@
>>    // will choose the highest DWARF version for the final binary. This=
 matches Clang's behavior.
>> -
>> + // Note: `.2byte` directive is used on MIPS.
>> +
>>   +//@ only-x86
>>   +//@ only-x86_64
>>   +//@ only-arm
>> @@ -259,3 +253,30 @@ index 0e712bc3a4e..93965d990d0 100644
>>    //@ revisions: OPT2 OPT3
>>    //@[OPT2] compile-flags: -Copt-level=3D2
>>    //@[OPT3] compile-flags: -C opt-level=3D3
>> +diff --git a/tests/codegen/uninhabited-transparent-return-abi.rs b/te=
sts/codegen/uninhabited-transparent-return-abi.rs
>> +index face1577c3f..d69e5e34a7b 100644
>> +--- a/tests/codegen/uninhabited-transparent-return-abi.rs
>> ++++ b/tests/codegen/uninhabited-transparent-return-abi.rs
>> +@@ -1,4 +1,8 @@
>> + //@ compile-flags: -Copt-level=3D3
>> ++//@ only-x86
>> ++//@ only-x86_64
>> ++//@ only-arm
>> ++//@ only-aarch64
>> +
>> + // Seehttps://github.com/rust-lang/rust/issues/135802
>> +
>> +diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests=
/ui/abi/rust-cold-works-with-rustic-args.rs
>> +index 57027364699..3faa7ea035e 100644
>> +--- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>> ++++ b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>> +@@ -1,5 +1,9 @@
>> + //@build-pass
>> + //@compile-flags: -Clink-dead-code=3Dtrue --crate-type lib
>> ++//@ only-x86
>> ++//@ only-x86_64
>> ++//@ only-arm
>> ++//@ only-aarch64
>> + // We used to not handle all "rustic" ABIs in a (relatively) uniform=
 way,
>> + // so we failed to fix up arguments for actually passing through the=
 ABI...
>> + #![feature(rust_cold_cc)]
>> diff --git a/meta/recipes-devtools/rust/files/triagebot.patch b/meta/r=
ecipes-devtools/rust/files/triagebot.patch
>> new file mode 100644
>> index 0000000000..715664d081
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rust/files/triagebot.patch
>> @@ -0,0 +1,32 @@
>> +Skip tidy triagebot linkcheck if triagebot.toml doesn't exist
>> +
>> +Distribution tarballs won't include triagebot.toml, which
>> +causes tidy checks to fail with the following error:
>> +
>> +   tidy error: triagebot.toml file not found
>> +   some tidy checks failed
>> +
>> +Drop the triagebot.toml check which is mostly to catch broken
>> +path filters *within* `triagebot.toml` and not enforce
>> +the existence of it.
>> +
>> +Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/142=
666/commits]
>> +
>> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> +---
>> +diff --git a/src/tools/tidy/src/triagebot.rs b/src/tools/tidy/src/tri=
agebot.rs
>> +--- a/src/tools/tidy/src/triagebot.rs
>> ++++ b/src/tools/tidy/src/triagebot.rs
>> +@@ -6,8 +6,11 @@
>> +
>> + pub fn check(path: &Path, bad: &mut bool) {
>> +     let triagebot_path =3D path.join("triagebot.toml");
>> ++
>> ++    // This check is mostly to catch broken path filters *within* `t=
riagebot.toml`, and not enforce
>> ++    // the existence of `triagebot.toml` itself (which is more obvio=
us), as distribution tarballs
>> ++    // will not include non-essential bits like `triagebot.toml`.
>> +     if !triagebot_path.exists() {
>> +-        tidy_error!(bad, "triagebot.toml file not found");
>> +         return;
>> +     }
>> +
>> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb b/meta/rec=
ipes-devtools/rust/libstd-rs_1.87.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
>> rename to meta/recipes-devtools/rust/libstd-rs_1.87.0.bb
>> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb =
b/meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
>> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
>> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb b/meta/rec=
ipes-devtools/rust/rust-llvm_1.87.0.bb
>> similarity index 96%
>> rename from meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
>> rename to meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
>> index 327e8e6b69..d70aa350ab 100644
>> --- a/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
>> +++ b/meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
>> @@ -2,9 +2,9 @@ SUMMARY =3D "LLVM compiler framework (packaged with ru=
st)"
>>   LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
>>   HOMEPAGE =3D"http://www.rust-lang.org"
>>  =20
>> -# check src/llvm-project/cmake/Modules/LLVMVersion.cmake for llvm ver=
sion in use
>> +# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
>>   #
>> -LLVM_RELEASE =3D "19.1.7"
>> +LLVM_RELEASE =3D "20.1.1"
>>  =20
>>   require rust-source.inc
>>  =20
>> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recip=
es-devtools/rust/rust-snapshot.inc
>> index 445390fcaf..87b39a2cc2 100644
>> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
>> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
>> @@ -4,56 +4,56 @@
>>   ## The exact (previous) version that has been used is specified in t=
he source tarball.
>>   ## The version is replicated here.
>>  =20
>> -SNAPSHOT_VERSION =3D "1.85.0"
>> +SNAPSHOT_VERSION =3D "1.86.0"
>>  =20
>> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "e742b768f67303010b002b=
515f6613c639e69ffcc78cd0857d6fe7989e9880f6"
>> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "8af1d793f7820e9ad0e=
e23247a9123542c3ea23f8857a018651c7788af9bc5b7"
>> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "cdebe48b066d512d664c13=
441e8fae2d0f67106c2080aa44289d98b24192b8bc"
>> -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "f3b8e769021a6bcee8174=
ac49a60c367effb6d97af0f2a6c44dc9ea39ff2bda9"
>> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "ccece9e59546d2e6ff3fc3=
b8f4b033aab21631c271eefbe814b3cbace6628c6e"
>> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "176129577a5d560bbd9=
4bcd2d24c0228bb495b73219df02556b4e4b4f0815bf7"
>> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "37156542b702e8b4ffd1c5=
c75017632582343e93ca378285cdc92196c85c77e3"
>> +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "e70edcf560e6b50861618=
d7045d2b38cae9e2a555f489062570e2e7041563f42"
>>  =20
>> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "c5a5751f3cfa027b53fee83d0=
1dec8e555f3622b6993335aed12b1747aa9543c"
>> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "401571adfe1223d83ed041=
e5a8c54c1f3afb3010d1d5b0c1fd79e7da1ab0a0de"
>> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "3832027242911ab96fd861285=
87fc563596a5b10e8e38a073facf61c1ac9668f"
>> -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "74ed13a67c6ea0452c0d9e86=
97c6cfdd8280f983b207187ac93c287f72b65066"
>> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "976f4604d949d722738a9fe95=
313035226571128396e942b0fc678180be487b0"
>> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "ce9f0fa4b0760730e26bf3=
15cebe099f0b883436e095c5fc4b94ba20bd9f121a"
>> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "24f20bdc1bb14f4ffbdc2f540=
488bebc3340437418725c3162215ae03cdad480"
>> +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "6788449fa0eceebe4ea8c797=
bbaf27495dad152087b3085d58dc05cacab0617a"
>>  =20
>> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "d43d2119ff25d879b2=
d280d3e5a03fcd21c57a32d479ad5626500c32432f18c9"
>> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "2d05f5e13e7cb3e=
e6b0ca0dcd13a231a28eeb0faa4d15257a35cf7284149cd6a"
>> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "9aa447eefcd3ba2f9d=
bab77596c8669849899ab243543fc8f1914089707081ac"
>> -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "d437b39465343a71f=
f475a65acb6c03bc0f800861f293f48accf1fa170458432"
>> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "970089ad61f8ca8201=
7b59444aee483c1fc005e3f7a6af63cd5f146df8287cce"
>> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "2f528377f57fbf8=
1da35e2f08ec7ba50daddabebdce2cc86b6ec909fee157a33"
>> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "c3b8ab03b64c824f2e=
a25db578b5760d44302be3fd1e4a78404c98cba39301f4"
>> +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "1ab711423497a1d02=
408a240da28ad366450574dd7f528ffaee80d1d5ed10550"
>>  =20
>> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "fbe7154abc641d6cacfdc6=
239ed4701fc7a09b5046c6d1bd209b59e7f2b2d0f0"
>> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "ab2d5ac7cd295adaa4d=
959e8abbf42b372292c95d1a9f18aad64951ad6e2ab2b"
>> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "e67c30a72f969c51ad1990=
84b3ce0cdc573a4e21f732b2cc39dafbcb9807a5ce"
>> -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "497104d49803598cd3801=
749ac86cb26c88a2bd9c3a8c7bdc18fdf487f4650c0"
>> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "21ea61181ba7daa04f61be=
c6a295ad76ce34bfbd74ad1d679c4548977bd82eb9"
>> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "e5ed58a861619bcc89f=
c3f969174c84fd6ed8a26b5d4b196f06efb868653c1c1"
>> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "fd832c269af81dd1ee9f38=
31991fccdc2c7312e9a9069908510eefe7c313d144"
>> +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "c94578d31e4145a4169ab=
5761537a2a0133818278fb62ee76251ef8ef45228c8"
>>  =20
>> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f8e38291ba4241bc28e9=
c118d7a449ce3601abdeb2076f2f618858679fb3b929"
>> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "e9ff89e759125ad27=
86ad2f6c40e820095720ea00fba66819d15fba79489430a"
>> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "73cf850f6715acbf0029=
c7e5d4694825f61bd4e193e6413e65a78bcb13df97b7"
>> -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "29b63f23cd9af95846a=
246c9cc8349e514c3fb92ec0c840a38155e252d6cc668"
>> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "a54bbe16e6a405f137a0=
dc51fd570140c80077ba769d29d885a60e74cb3196bb"
>> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "06538b41a9351c449=
d215498d4ec2f072f728bd18df8fac7ef8534a0d0f34e27"
>> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "4d398cd8da17d1a5f267=
34b39cb17e791b243ac3570f8da2e5e5580a9dfad578"
>> +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0abf31a8cb2762a7a81=
dbee8a5798e43e11a83326711ce00ad16c5587bcf5e49"
>>  =20
>> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "371e40f9d6d82aecb0=
56f70f82868d98ddc1c20510aa7d388442ac8d2d86a6ca"
>> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "d0cfda4e18623d1=
7922eb367e44ac9549ab3d5fe1c0bdbe0c2c95754255fa705"
>> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "e1469f4249a7e21f87=
2af487dcd1bd10ce388b5b3679bdab0cb0965e1e30fe47"
>> -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "d8c590bc2e6fc7580=
0e41516427f5095ba0e15d7633167689499fcf6523dc61a"
>> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "7585a20b02b7dd497e=
393a2e7552a0c6aabb51556fcf7507c6f7ffde530f8c88"
>> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "fcf940c0553a04c=
b9bd85cce524729c2f54b000b554fee95c7aa218d608b7e3d"
>> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "8fefd2317023716a01=
8986c4a62558a7b543ccf34e4e6d1104afc66edcae1c9c"
>> +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "8cc65649396ccad73=
cecd17b972ab8d4c34837136cf374425be63d697b541469"
>>  =20
>> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "2da33044f17a8bc49a14=
78dc1eb2536df491a44d6e6bb0ec7c86f46877d44e98"
>> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "0f5ecfe54859bbe71=
5821f982b1a5396784fdf55605d00ece05d3e57a965ed16"
>> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "c9f28b519799fc2d8089=
865e30fad04bb5339604d13725365fcd7ad7ee6c1489"
>> -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "9d21bc180196bccdb30=
1e7e03034d3fd0df14b0c6520da0317bba7b1ce385fe8"
>> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "4d1106b576221182f844=
12f3377a5148eab6950d20e45e4274cd8b58df46f26b"
>> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "b28b9c2f183521a20=
4f2899610253c11c86ee4aa903fe66d8410dfaa22c926e6"
>> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "7825556908e10a48320c=
fb2d812851271d7cf549977173e028a0dd23af9d7eac"
>> +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "c39c53a82fdaaa97413=
728a4f3f9feb5b31bdf3e3e563c64651bd01713e79166"
>>  =20
>> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "308361737ed522aa77dd8b4e=
a91b5db244113ada5fa234d3ed008b526d07e2e8"
>> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d25053fbee1a0cb899bac=
8c8e4968aa35f9c3637e486cb5bb2c79ad43a78f3e7"
>> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "7e1defd60095c91ded161219=
4f811ec5f2fc2e83bb914d35594d01fa3c54049d"
>> -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "9780d8c4cfef9d05460b3e5=
40aad142391b2e3994accf8cfc8afb87fefac6cf0"
>> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "18caf22fbfc4d26c80b39b4c=
6b1cd5fb42dba3e32d5d3600c22eae6f688d7f4c"
>> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "3919f6962d0aefdd2cd75=
d8dba749ed826936065b64c9a8d54d1d85c2685fd66"
>> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "1c6eb1be254574881a611a3b=
8904cdcfe43c79a285875673e59c890dcd5766c2"
>> +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c87183b52ddb4085ddf2524=
a775fd255d5fd11ad2fdd6424574f08750a8cf378"
>>  =20
>> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7436f13797475082cd87aa6=
5547449e01659d6a810b4cd5f8aedc48bb9f89dfb"
>> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "285e105d25ebdf501341=
238d4c0594ecdda50ec9078f45095f793a736b1f1ac2"
>> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "0aff33b57b0e0b102d762a2=
b53042846c1ca346cff4b7bd96b5c03c9e8e51d81"
>> -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "0dc3ca1708a6c9eed05d08=
02364377572b79ff079815b7bcbe8e3991f77c4117"
>> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "4438b809ce4a083af31ed17=
aeeedcc8fc60ccffc0625bef1926620751b6989d7"
>> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "67be7184ea388d8ce0fe=
af7fdea46f1775cfc2970930264343b3089898501d37"
>> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "c5c1590f7e9246ad9f4f97c=
fe26ffa92707b52a769726596a9ef81565ebd908b"
>> +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "02aaff2c1407d2da8dba19=
aa4970dd873e311902b120a66cbcdbe51eb8836edf"
>>  =20
>> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "3cb7318da10876de140765=
49d79410a8441923a92d62b616d8c105f5f5cd831b"
>> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "f0bddc6dba7d719b8ba131=
bcd634a8379e00fc825a51c0f17abf424c9cb5c052"
>>  =20
>> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "65cd47af46a5b74e61f=
f6ae4cce8a979ee8670a57b8aa61e732828d1da073f73"
>> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "722238ae13e6e101d1b=
698d2b3a7915d59bb7f485b594e8d833cce8b9460383b"
>>  =20
>>   SRC_URI +=3D " \
>>       ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust=
-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
>> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes=
-devtools/rust/rust-source.inc
>> index 30b159a84f..ed15d9c763 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -9,8 +9,9 @@ SRC_URI +=3D"https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n=20
>> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchd=
ir=3D${RUSTSRC}=20
>> \=20
>> file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;pa=
tchdir=3D${RUSTSRC}=20
>> \=20
>> file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patch=
dir=3D${RUSTSRC}=20
>> \ + file://triagebot.patch;patchdir=3D${RUSTSRC} \ "
>> -SRC_URI[rust.sha256sum] =3D "d939eada065dc827a9d4dbb55bd48533ad14c16e=
7f0a42e70147029c82a7707b"
>> +SRC_URI[rust.sha256sum] =3D "8623b8651893e8c6aebfa45b6a90645a4f652f7b=
18189a0992a90d11ac2631f4"
>>  =20
>>   RUSTSRC =3D "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
>>  =20
>> diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-=
devtools/rust/rust_1.87.0.bb
>> similarity index 99%
>> rename from meta/recipes-devtools/rust/rust_1.86.0.bb
>> rename to meta/recipes-devtools/rust/rust_1.87.0.bb
>> index b13ec116be..5d804c7398 100644
>> --- a/meta/recipes-devtools/rust/rust_1.86.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.87.0.bb
>> @@ -266,7 +266,7 @@ rust_do_install:class-nativesdk() {
>>  =20
>>       install -d ${D}${bindir}
>>       for i in cargo-clippy clippy-driver rustfmt; do
>> -        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rele=
ase/$i ${D}${bindir}
>> +        cp build/${RUST_BUILD_SYS}/stage1-tools/${RUST_HOST_SYS}/rele=
ase/$i ${D}${bindir}
>>           patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
>>       done
>>  =20
>> @@ -301,7 +301,7 @@ rust_do_install:class-target() {
>>  =20
>>       install -d ${D}${bindir}
>>       for i in ${EXTRA_TOOLS}; do
>> -        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rele=
ase/$i ${D}${bindir}
>> +        cp build/${RUST_BUILD_SYS}/stage1-tools/${RUST_HOST_SYS}/rele=
ase/$i ${D}${bindir}
>>           patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
>>       done
>>  =20
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

--=20
Regards,
Yash Shinde


