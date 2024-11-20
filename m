Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96396D6E2B2
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 04:40:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6071.1732077599372809765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 20:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1054b6dcf8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK4bGra027937
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 20:39:59 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7us3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 20:39:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R78qbiCVsvnFC/uhn6+FEPrNuSatLmHw/goHpSY/luTyp9cFA3/nJxJ76/o9aphBZuxAfexL8l5+/lXeH7ikUk/fuXjy4+a9dGIpzcXMGGmIgqiTswsdfp5SCXZb+GZCWqd+RljY8uk8HNINXyWo0i+A3upV7dV9lImHiWuOkPm7SGfD95y009Xf5Rk1h9UBKz25IUEno2w2EsnsFqeheUdeFb0k3MEgcxU8zJO4vNMdobogDmHzRdBB7Xh5G/k9B9syfbHJ4utAMt5LdjLhWDA57Z1ZRKUQiWcvINWBBNFO0Qtt5bq6xWB6zlQBLhMfvc45tuz07dnT4qT0Ke4XEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/QHfPJRlzfu+7SSyDoREoOzQc/eosmWzhktL6j1ox0=;
 b=ORppJNPbsgdxPlFxwUFoMmH4wJqqlfLU2NZelvZRMWFN9huI8MVcATr0UUQpzNGHKqpBnKqOuizryiabukdLrPS3yaN6AIMWmRPKHtydmz31GqJAweA/S4hOr7g6wCg90PNXfasglTg64E31yYl1oKWExMpAy3XIHRIiRaPfUc54N88u8QkpSIu1BdmV/hO8xnbhsz9Boy5APhv5t3peX3klN+jrT0eZ7NeNm+Y5UamaHtEmknWoy4IS39gOMc81ftqbwMUFkdZiNypX2RoP9d7K3o5yC89Pk/h/IdPJ9GL9ePigfRIs9E2+MTbG/8wBD6NYlNCAAC+AQhuWVDOTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 04:39:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Wed, 20 Nov 2024
 04:39:55 +0000
Content-Type: multipart/alternative;
 boundary="------------2sMD4ghGb2YFU0vJc0JgrZea"
Message-ID: <6a85cfbb-421a-4e9a-b945-506cd13101b1@windriver.com>
Date: Wed, 20 Nov 2024 12:39:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] sysvinit: backport patch for fixing
 one issue of pidof
To: openembedded-core@lists.openembedded.org
References: <1809933D052F7165.32520@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1809933D052F7165.32520@lists.openembedded.org>
X-ClientProxiedBy: SG2PR03CA0093.apcprd03.prod.outlook.com
 (2603:1096:4:7c::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 97efa9b7-9727-4b10-2017-08dd091d61b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVRQa2UzUXlNaE1NUmVKSE5iSWFkWEFka1J0TkdES1FxSlhBQU84YlRheTRi?=
 =?utf-8?B?K0VTSGFtTCtjK2pEMU9mSlk4UGFqRC9vUldKQ1Mwd0duVDQ4SVBDN2tPaE5H?=
 =?utf-8?B?QllSeVRoMVR6d1VEbDE1MG5ubjB1SlRBMzRLVUYxVFR1VnpKd1FiNjRWbEF1?=
 =?utf-8?B?eGJwRnpOVityM1A2OCtOcklyWjc5RkpsTGkwaFBOaFV6RDNubUVEcjQ2ZFVC?=
 =?utf-8?B?VXQrK29ObkxTemtsSU5UdDdJWWNDU1VZMW1TanJjbS95YlA2bEozbWJKREt0?=
 =?utf-8?B?TEhaNHV1Vk0yUWFUR3gxYVpGQ0YyMWdhM2ZRUXl2dWtWYThjdXc4eVZjM21t?=
 =?utf-8?B?bElua0V5Q2puVlpNQS96ZGY5ekQ3d1AwU1krZWovbm9LQTdjNnRGTHY5Tm0z?=
 =?utf-8?B?NkFhTGxCY2lSdXRFcEtIRm54czVhejRjempuQllvQVA2aWl5WWxsQ0JQWkRt?=
 =?utf-8?B?dHpzOEdyaDlDMmhma2FDZWJjTHFFNmVtMG94WHQwemJ0bHJ6YUJrZlhIWm0v?=
 =?utf-8?B?RWNQRHg3Q25MNUtIb3B3ZVROTWsvNWp6ZC9uNWtVMWVOaUNnTlM2bWpqQjBr?=
 =?utf-8?B?OUdrb0pUWjRPWmZ5dUcrS1AwOUZNQitwMXUzNW1uR2pCUTR3RFNwWjJiZkpX?=
 =?utf-8?B?STNaOTY2WDNZUjRuOWxFVTY2MmxGYXdzdmZub0R4eWNPaFFiZXVIQWF5ckZN?=
 =?utf-8?B?aWRVY2ZxL1N0OUNlcmVsK2FpRlVVV3RoM1d2MzEyZUEwNzRyN3MzdUtGSmxp?=
 =?utf-8?B?YTR2LzFmTE85c0VORnFIQmE4MTl5TTZJMURYRjRGOGdnU291Z3VEZ25TM2hZ?=
 =?utf-8?B?QlljbDRvWit6RWpsV3BJMHJGWGlYMG9EaFhIYXY2Mks0MDlsSGNTOW1uOUJO?=
 =?utf-8?B?U3NrNlhGNzR5TzlGdVU1WW9ETjdsdlhSWlpITnVmNE1uS1Z1RW81L2RkVEc3?=
 =?utf-8?B?UVZnOXMxS0NneWFrQnRQVXpDNkI5NzR6OWZHZGlQZVBCZGwwZGpCaHgzenRD?=
 =?utf-8?B?MDNkMXNmeEJWU3pJN2oyR0pyaVdQVFdETnJKS3dicWpRYmRwc0ZhaGYrWXpP?=
 =?utf-8?B?dUdPL0U1RnZqUHZ0NHg5Y2w2dFdXdzZNNysvTWNVWXFqelZaTmM4Rm5BTGFK?=
 =?utf-8?B?R2dwRXVZWDZ4NEZ2QmdpUVVOTVdSWk4yMllTdFRrTWZzKzE3UkhNVG1xNEU3?=
 =?utf-8?B?WmRydUFBUjlldkNLWWFmSDBSNlBmaGtTWmtzQ2wxWW1Jd2lDQUZGazdyM042?=
 =?utf-8?B?OCtJTlpKdG9EenhOTU1TUzNWZjRYMWs0TmpOUkxqUnJ1QkI4aG05NUlGZ080?=
 =?utf-8?B?WW5EdFFpalprdVJzaUhVNndLM3E4STBxbEdOT1U3RC9DWlFUOXhuTDFERmxF?=
 =?utf-8?B?ek1Qa2FGaGRFdWEzV21kdUJaNjlIaVJvMVVPNFR1N21PYThVc2FKcnJDR1ZI?=
 =?utf-8?B?RllBK3dYRVp2NnJYRjRWQUdXU2pzWFAzc2VUMkkvREM3UXc3Wm9ESnJ4OTU1?=
 =?utf-8?B?UkxTWHhhWDB3V0Y1Tk5aYjl5N1FkNyszYXhISGRSa2lqK2FsUnlTeUNOcjBG?=
 =?utf-8?B?UEt6M1krVFJaOU5Ib2NYS0RjaEZLUlIxTDZtc2FiZHU1WXkxT1h5Z0Q4bDgr?=
 =?utf-8?B?SWZoRkxWWUcxM0FwY1RXNSszOUZYQkRiRVg5enJORk9Rd3NEeVNiOC8xN2Jp?=
 =?utf-8?B?Nk1xZjQwN1QwS25GZ3YrR3hndXAzWWNSUXBobldYTzZQeFVSOUllNW53PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzlRVWQwUU9jQkhEQ3dLcEFFbFFrQUFPd201VkJzWnR3WklLQ1h2b3FrZ2pT?=
 =?utf-8?B?SEIxQ0p3NnpDa2M3dGloUFJHdjE1WitaRFZjSExHVnBsalQ0bW8yc1I0M1BW?=
 =?utf-8?B?MldVeHZPQ01TRk1kVCsxK2lPM21rcDNkUUlDbzd5c1NsUE9kYzhOSjNkMTRO?=
 =?utf-8?B?dkVrQkFSZFF6b0pPTFNwQ1dQTGJCaWJOaE0vbG4vZGZxUEZjNGJNeVl1aDMy?=
 =?utf-8?B?QnAwU2dEVDJQMUdORXJzV2JEeU1mc1FDdHZFSUxkVkdGb3Uva2xzcFpOSkdS?=
 =?utf-8?B?QVlnSUpzYmxzSDhaODQ3b1p5dmpWMkdhZDZOaVFkckZCcVJiZ3VoS2NzbGJH?=
 =?utf-8?B?eXJUUGJVZWc1Mm0ySWtTTkNXZzBFeU5YakpLR1BhSVkzQS9sK1N2ZGtjaTJz?=
 =?utf-8?B?d254am1PTXhPVlJuT0FmR3NPSmUwWFI2Z21Ed1F6V3lOU2JuMmI3Z0NQd281?=
 =?utf-8?B?QUZtczgvcjZmSzlCQWdmSGNLSGtjQ3QyMnFCUDlZc25HODUyTXBndDI2dXBP?=
 =?utf-8?B?WFYvRW0rZ3l5SkVOWG51bzR3MXFIY1RXRlFlNjlUWHI1KzZkWDB6akhlWGI0?=
 =?utf-8?B?L1UwNU1TL2F5Tng0NFI3aS81R0YraGVsdy8yYS9zS3dnVWZNL2dKcmlJd29O?=
 =?utf-8?B?MUxJclFhaEY5NlVZbW5WOUtQLzNpVVlmdkkyMktrVGtOS2ZRTTAvYnl5YnRO?=
 =?utf-8?B?MmVlKytkbS9lWllNWmcxaXlZWjVDQ2tiNGFyWldiVnRGc2V5TXUzWGtuMStw?=
 =?utf-8?B?ek01MWJlQlZuSnc1b1owOWQ5OWdvTzlCUXA4K2drb1UzLzlpa1RiMHRxUnZ4?=
 =?utf-8?B?Qm12VS83Y2hMRzhyclFlelVaaG8wSTR1SmVrSUg3WXNYL2hoVEV2N0toRXk3?=
 =?utf-8?B?U3JxNDdxNFlWQ0JsQ1VjOWxRU3pTY3hGUWRhQ29BZ1NrNW42TnVuL1lQRUFV?=
 =?utf-8?B?cXRqQ3FlaXZ6YTh0WnQ3UkN3eW95MENvTEF4SWw5bldOaWQrMVV0dE9BbzhM?=
 =?utf-8?B?bHRJZDErQ1VKSGNOYzZoQjFmbmMzNzlzNHpmZW9rYXFjd2JPbTFBclNBSS9t?=
 =?utf-8?B?TWpnZmJ0SzJTQXZlWEx5NG5tMTFzNEgzZHV2Z2RlZFZxSVFXa0ttRFJVMFJH?=
 =?utf-8?B?aTJjMlhHSmFEL2FOUGs2M1I0VWF6N2syZTVxMDdBT1BMbWpxU1FRd2k0b2kv?=
 =?utf-8?B?VUY0WSs2REd3VzNRb2VCU2pFSS9ia0JJSkpiaDVhOFFMTWR5R0FQWjE2RlRn?=
 =?utf-8?B?MWNVbFRBdytRZ292RnB4NnRxS25CYnBmakNQSzh0c1g5bGZvaUEyemxYQ2cw?=
 =?utf-8?B?SllIaGRuNm9xd25RSk9uVGVNVFdKQnhBZkdkeGExemhTZXRacFFod3RzZFpB?=
 =?utf-8?B?cXZ6T2VFUHJZL056QkpEQWRPd0UxOFFodm1MSUFIeW9qTzVMWDQzYzEwSkc5?=
 =?utf-8?B?Z2o5Rkdid2tXREJ4cTdMaU5HK0tnSDAwa045N2ZTZGhacTFCNE91bEgra01F?=
 =?utf-8?B?dm0vUkljQ0pBN3Y1Y2huZDRVV1lxZEJRTEJGZjdRN2ZzOFF2YjRYaUlKME5r?=
 =?utf-8?B?ZmpKZ3hOUWowTCs1djJ2ajlqTm43Y3lSeFpsVHhIbmFyLzVTalRtTnJmM2p1?=
 =?utf-8?B?MU8waEsxQWc4bEEyK0dsR0k1b2ZRS2MvZXkydFlQMWFJeVVQVWt6QmRmWVZW?=
 =?utf-8?B?a3hjWk8vM1ZZV25nU3IwdXZFRVBXcTVoYVZaV2ovYTBLL3c4alI5eXA0T2pL?=
 =?utf-8?B?TlB6VGVjOG5pL3BsRW9meUphNnNJMkxjZGR4bmdmOFBUZG5vaktSTjR2YnIx?=
 =?utf-8?B?cmFzamNLb25DMnZsbE5OMUlOU2VnQUFiZU1QQi80N2hpTCtKc1ljWnVwWTJt?=
 =?utf-8?B?anFoNHBzMUp5V1NTeGNpbXVjSWp0KzBEZnZRVE1lazJFNnpTdGlWakkzMlZ4?=
 =?utf-8?B?cUc0amw1TEc3bVhVeFdMNTVqY1ZTUTA3M2QveUtSWUVQUXpENDVYbkQyekRT?=
 =?utf-8?B?MEhYZmRTcFRQcTVBcVZxanJkVThqNC9FQkRmRTZJeURXSmhuN2p6OWFkUXlx?=
 =?utf-8?B?MmNRVVFWajM0VkgyQmtEWmlXL3lBNXBGZHlZNnd2cGIzSkg1b3M4am02a25H?=
 =?utf-8?B?Z0dlR08rWW1kak1jQ0J3bzRkRFV2dExSY3ZNR0pvMUJnd1E0NVk1WnEzYjcr?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97efa9b7-9727-4b10-2017-08dd091d61b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 04:39:55.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BnSbQerU3/NCeiUsnzt3yEso/8YQLrdYQOMWBtQBdQY+7ePXlr65BLhNU/nfo55WFBE3nGG8BFXp2e7Z9YC4MfUyKdyxLIKjhSU1HkQCec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
X-Proofpoint-ORIG-GUID: Z5LPg_zVz1zYwZWy6MsfS4495cbv2Hx9
X-Proofpoint-GUID: Z5LPg_zVz1zYwZWy6MsfS4495cbv2Hx9
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673d681e cx=c_pps a=p6j+uggflNHdUAyuNTtjyw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=t-8_O1zyAAAA:8 a=gry-nM5ROQLlC3S0GioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=BWYcR_WkShiImLWFw1MA:9 a=XRz2Th1Tuphv_-x1:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=yfEXjMlvih_vmE0eOnXP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_01,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 04:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207410

--------------2sMD4ghGb2YFU0vJc0JgrZea
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AK4bGra027937

master branch also has this issue,=C2=A0 plan to upgrade sysvinit to fix =
it.

//Changqing

On 11/20/24 12:36, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> When a program is a link to an executable, and this executable is
> handled by update-alternatives, renamed to a different name, cmd
> `pidof full_path_of_program` will not work.
>
> Eg:
> /usr/sbin/httpd -> /usr/sbin/httpd.apache2
> `pidof /usr/sbin/httpd` cannot get pid of the process httpd
>
> Backport the patch to fix above issue.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   ...rom-Mark-Hindley-which-avoids-cleari.patch | 31 ++++++++++++++++++=
+
>   meta/recipes-core/sysvinit/sysvinit_3.04.bb   |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Accepted-=
patch-from-Mark-Hindley-which-avoids-cleari.patch
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-fr=
om-Mark-Hindley-which-avoids-cleari.patch b/meta/recipes-core/sysvinit/sy=
svinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
> new file mode 100644
> index 0000000000..33c9f62eac
> --- /dev/null
> +++ b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark=
-Hindley-which-avoids-cleari.patch
> @@ -0,0 +1,31 @@
> +From 5be52641a10ad6cd89bc7cdb80318e32be7e6662 Mon Sep 17 00:00:00 2001
> +From: Jesse<jsmith@resonatingmedia.com>
> +Date: Wed, 29 Mar 2023 10:34:45 -0300
> +Subject: [PATCH] Accepted patch from Mark Hindley which avoids clearin=
g
> + realpath information in pidof when trying to find matching executable=
s.
> +
> +Upstream-Status: Backport [https://github.com/slicer69/sysvinit/commit=
/c06458e1c1822a2c8ff89fbdd29262ca97dd18b1#diff-4244fa301bd80b0a8f553ce075=
1fb0fcde1a45ee9dee71db85135cffde8ac712R13]
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +
> +---
> + src/killall5.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/killall5.c b/src/killall5.c
> +index 86866b0..f7a401e 100644
> +--- a/src/killall5.c
> ++++ b/src/killall5.c
> +@@ -766,8 +766,8 @@ PIDQ_HEAD *pidof(char *prog)
> + 		return NULL;
> +
> + 	/* Try to stat the executable. */
> ++	memset(real_path, 0, sizeof(real_path));
> + 	if ( (prog[0] =3D=3D '/') && ( realpath(prog, real_path) ) ) {
> +-		memset(&real_path[0], 0, sizeof(real_path));
> + 		dostat++;
> + 	}
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes=
-core/sysvinit/sysvinit_3.04.bb
> index 1dd5f575d2..d3f77d8150 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.=
tar.xz \
>              file://bootlogd.init  \
>              file://01_bootlogd  \
>              file://0001-hddown-include-libgen.h-for-basename-API.patch=
  \
> +file://0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch=
  \
>              "
>   SRC_URI[sha256sum] =3D "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395=
c0c5bae817bd2b7e3a5"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207409):https://lists.openembedded.org/g/openembedd=
ed-core/message/207409
> Mute This Topic:https://lists.openembedded.org/mt/109679455/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------2sMD4ghGb2YFU0vJc0JgrZea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>master branch also has this issue,&nbsp; plan to upgrade sysvinit to
      fix it.</p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 11/20/24 12:36, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1809933D052F7165.32520@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

When a program is a link to an executable, and this executable is
handled by update-alternatives, renamed to a different name, cmd
`pidof full_path_of_program` will not work.

Eg:
/usr/sbin/httpd -&gt; /usr/sbin/httpd.apache2
`pidof /usr/sbin/httpd` cannot get pid of the process httpd

Backport the patch to fix above issue.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...rom-Mark-Hindley-which-avoids-cleari.patch | 31 +++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
new file mode 100644
index 0000000000..33c9f62eac
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
@@ -0,0 +1,31 @@
+From 5be52641a10ad6cd89bc7cdb80318e32be7e6662 Mon Sep 17 00:00:00 2001
+From: Jesse <a class="moz-txt-link-rfc2396E" href="mailto:jsmith@resonatingmedia.com">&lt;jsmith@resonatingmedia.com&gt;</a>
+Date: Wed, 29 Mar 2023 10:34:45 -0300
+Subject: [PATCH] Accepted patch from Mark Hindley which avoids clearing
+ realpath information in pidof when trying to find matching executables.
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/slicer69/sysvinit/commit/c06458e1c1822a2c8ff89fbdd29262ca97dd18b1#diff-4244fa301bd80b0a8f553ce0751fb0fcde1a45ee9dee71db85135cffde8ac712R13">https://github.com/slicer69/sysvinit/commit/c06458e1c1822a2c8ff89fbdd29262ca97dd18b1#diff-4244fa301bd80b0a8f553ce0751fb0fcde1a45ee9dee71db85135cffde8ac712R13</a>]
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+
+---
+ src/killall5.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/killall5.c b/src/killall5.c
+index 86866b0..f7a401e 100644
+--- a/src/killall5.c
++++ b/src/killall5.c
+@@ -766,8 +766,8 @@ PIDQ_HEAD *pidof(char *prog)
+ 		return NULL;
+ 
+ 	/* Try to stat the executable. */
++	memset(real_path, 0, sizeof(real_path));
+ 	if ( (prog[0] == '/') &amp;&amp; ( realpath(prog, real_path) ) ) {
+-		memset(&amp;real_path[0], 0, sizeof(real_path));
+ 		dostat++;
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 1dd5f575d2..d3f77d8150 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -23,6 +23,7 @@ SRC_URI = &quot;${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://bootlogd.init">file://bootlogd.init</a> \
            <a class="moz-txt-link-freetext" href="file://01_bootlogd">file://01_bootlogd</a> \
            <a class="moz-txt-link-freetext" href="file://0001-hddown-include-libgen.h-for-basename-API.patch">file://0001-hddown-include-libgen.h-for-basename-API.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch">file://0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch</a> \
            &quot;
 SRC_URI[sha256sum] = &quot;2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#207409): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/207409">https://lists.openembedded.org/g/openembedded-core/message/207409</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109679455/3616873">https://lists.openembedded.org/mt/109679455/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------2sMD4ghGb2YFU0vJc0JgrZea--

