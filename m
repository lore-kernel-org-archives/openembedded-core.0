Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B043C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 19:22:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56457.1744053718101178167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 12:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6192cbf472=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5374x1Cx012820
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 12:21:57 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4ajh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 12:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvqb5fIOOfICM3nyfBz5//+3XLVrOdXDOO6TAxujSg2rH6ieUgIsKUVkZcxy+Wd82nzqkbDGm0G/3VFNTV+pM/PPDwCtBkFfZNDp6W1oIjp7D93/z/RS0d1YT1QpoW1DscJGipO0gA6gl6ohFFrLJINMTxLrME0nJI98BBklKxZgvsEDNybxS4Obnk3r611zulgN4pQsUv/U5eyyvQn4GiK+D4dHk3byUIHhIm1B/+jEonnN82f7Lucw4AOJbqnWRl4f/ScPFFIHPr1bQ3gbuZdDW8vqghyka56D4ifvP1R3cie4tlDMKdSvbWqRfGA5t6koIa9ujs8CMBRRSVIYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVdWTQoKRXuUdhZ+0W6j/5tZ5Tz1bBfedClOB9DiqAU=;
 b=KKorL5bl+hCXJbj1BJGeSaNLq+lpWC6sdbPaTGOG4o4Lr6QwFb+tZKLL/++xAa2RGP4//KvqPSROX67rlcCK5ueKhszWaZhdHXr5TQ05b8BNENHPA09g6OUPbOThUPy4ejaTdoNpZDmVBCT259Kp5iTMbVPdygdokTAMdu+CFXQHD+8zj0j7qyiUpveLQu1aS87NIRrxxCQvp1o+DTLLl5ycLLNL7+FOOn6RvwKXJ7So01w3lISG+6wYYY1taE2/UdY/4BIyuLZTpwaq/IlddIPDLNPkfkRRYEEOVVehgUYWXfhUlmDfBmI6DRhisbBUtFuGEPLbK7ZBbPOEH53hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:21:54 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:21:53 +0000
Content-Type: multipart/alternative;
 boundary="------------VpCgzfq1yniINws401CNcmz4"
Message-ID: <70560a18-cf98-40e8-a71a-6d3f90905d44@windriver.com>
Date: Mon, 7 Apr 2025 15:21:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] initscripts: add function
 log_success_msg/log_failure_msg/log_warning_msg
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <20250403085305.3667237-1-changqing.li@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250403085305.3667237-1-changqing.li@windriver.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1ec1ed-1223-4c2b-a339-08dd7609744f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UVJScmZWL1VzZmpzaGVmUU1OTWJWY1JCbmQ1YzBuRkUrVHArVTU4WUw5ZHl2?=
 =?utf-8?B?cmNPVzZFL2ZmRUt5U1ZkbFN6NmVWaVMzdk83U1UrTHhrcERmejliWTRhb3Bs?=
 =?utf-8?B?NzlOVldyMnFkSzZadlRSZDVMbldpWUNHSWlERGFlZWxnRmFKaHhUTDRVK1Jn?=
 =?utf-8?B?UnNubXBWaUdRcmRoNUdGRm9BVWpVaCtPeis4aGo4bFRvTlN0UmpYSGxybzlw?=
 =?utf-8?B?RTJlRlQvUERocGh1Ui9oNjJFdzJiK0hOYWJRZ0l0UVlZTWFaVCszRng2Tm13?=
 =?utf-8?B?bXJpN1J2WjJVcm9ZaytiVGJIelBiQkYxKzQ0ZlQzUGNNaXVtS0x1WEVNNW9l?=
 =?utf-8?B?cVdJQW5KSitldXhVc1AxVFVlT1lJSjE2aUp2cThiZGRiakp0Q2xsRDgrR0VB?=
 =?utf-8?B?YS9NaEFWSUNZZGluK2J0YUpkZXJGYk9sTHVkTEdqYjQvSnRoTVlOMHNZSUZB?=
 =?utf-8?B?anRqbVpCYXhZWDF0U3lsdGtTOW9OSlFGTmQxeFZJb0FJMVRqNFRqNlF1aFFT?=
 =?utf-8?B?V1ZNb2FFTGdvMnJlUnN3L1JyUkNISnZjWU5QWUs2VEVjYmZPazVoKzZNaU9q?=
 =?utf-8?B?WEQ4OVRFVktTTU1NVkFrNUQvRVpFeXpRVVR0VlkzWFdOY2ZvNzk0RjJFcjEv?=
 =?utf-8?B?cUhtSy96eWczN0pMMUR4Z3JQSnV1OXhBWGl0bzJzc0Z3aFEyeEhRbmlQc0Rk?=
 =?utf-8?B?U2NkUW52ZERvMnIvNmFUWkROSE1lcHorbk1xdjdrbzkwZzdOZ3J4QmpPK01M?=
 =?utf-8?B?S21SOWpONldKTEFXdG1mNXdKUUhaZXZKeGxpcnpub1Jub091Yk10cStJbzRL?=
 =?utf-8?B?cHZvOE1Wbk1keHdTMFpGVmg5dzBXLzlZa2JZWDZYTWtDN0dCR3VSYlZoKzFC?=
 =?utf-8?B?NXJyMUhRZmFrWVVJMXJkelNhaXNjbXFwc1RCRUFnT21zaUlSWDVzTXRpVDJF?=
 =?utf-8?B?dFVrbTVaVU9ZTEZsTFFOYXdUTVRxcHAweTRwNFUzWTJtNGF1ZDBrWXhvRm1a?=
 =?utf-8?B?Y29sUEhRd0lJQWt5TGZ2YVEwWVBmckRxNStTcFowL0QrMFAybU5pYWJUMi9j?=
 =?utf-8?B?emVhTjNXSXhKZkFxUm91OUdCdytqVVJ1Y1R5cXNQSjhyQlV5T09pQ1l5ZTdr?=
 =?utf-8?B?L3EraVI4a054S0JqZzJDRjNxQlI3MVdtV3ZnUmVyazVvQmtHU21JOGRrTVg0?=
 =?utf-8?B?ZDlvelZVOVA1SHZhQ2VlbWdmcm5sRUdvejJPVXlGQlk3QjJGUXVESlFDVjJN?=
 =?utf-8?B?QXQ1NERCWS9PejBCQU4ydDh1ZVVHOGVwLzJtNXB0V2xHUjdlQ1JqVmxHU2ZB?=
 =?utf-8?B?ZWEzRDNWQ3FHeWRTTXVQVnV5MUxVOVBQMk9DTVg4NFh1VDNLaWt0OStxUXdW?=
 =?utf-8?B?OEc2d2xZaFhxbWlVS0tudGl6OUZhUWpLRGZWN241UXZtaEpaMEZxNm1kYzl0?=
 =?utf-8?B?amtSaFRtLzNKT3BwdUExek12SVpaNWM5T2o3UVV3TWV2OUxKMlpXR0xTSEtw?=
 =?utf-8?B?MzlhbmVyL1RWMk1YRHozdzBnaW0zaVR2WHdFaU4wSUdaNHYveTgrZ3NyT3hh?=
 =?utf-8?B?Sld2UW5VV1czVFoyMDJlbm9mMjAraGdzV2g4ZHFiRHlaMFBocWxxbVNTVVhO?=
 =?utf-8?B?QnV3bFYxR2ZWdHhmOUVkQ016b2M4MVBBczdZZzNpZWZiQUlSaktMYWpRV2pa?=
 =?utf-8?B?MlFySDFVZEYvQ2sxQllZVlFMbUFqMlY0MXRFNnpRNjhVMFJoU1NGdHZ4MDdR?=
 =?utf-8?B?d2NvLzF6ZjY0VXV3VXl4dDJXZkpTd2tiWXkwL3VGUEc1aUM0enhHMUE3Q09L?=
 =?utf-8?B?VmIwNHBCNlFHOUJyYzlMUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVpDalBnVmxYVi9rckp1QStrOVpOcmlXZ2R0dVFzZ3FacW83WXNNTmlldFMr?=
 =?utf-8?B?a0VWQWV4ZEZOcndyVnN1dVBrM1FIbDA5Q2VJQWI4ZlFoY01jWkxabC9ETHli?=
 =?utf-8?B?NU5wdGhXRUxYN1BiaGxFZmZqektWRTl2QlR2MjZOSXlCN2tZRmh4ZmhTOHg1?=
 =?utf-8?B?N2NxSDhUckkwWGRTc2Q0ZUtnaEE0L09uMWs1b0d3akxzTnl3Kzk4NVlKOXQ1?=
 =?utf-8?B?QlB4ZWs2WU1GVE5KRnhwT0VWNEJGN3NXcHJ1b2lZbVc5bVRpLzlVSFBxeEFh?=
 =?utf-8?B?ckMyV205ODNkK3dsMmxBdHZhck41cUdLK1dxS2pYZlE5WlYvV0Yrd2ptWlZl?=
 =?utf-8?B?UHdiNVlJRlF2QVlSa3c5Y054OGZUVStsMUN5Q3ZBSzZPczlzOU8rbHhVWnZo?=
 =?utf-8?B?eXpDTGNjNGlnNnFGaTNnUTFFajdvWElWZU5tODlVM3M5OVFtQXlEcXFQZGFj?=
 =?utf-8?B?NFlJeGZoZUtSZmxPbVFwZy8vb3ZocUlUcVZkMEQxMkFiM2FvUzQ3REJyVVk2?=
 =?utf-8?B?QWZNbGxjK2RQbS9hTFFYbFd3OVo0bXJvVndtOHFWekk2NFpkNk15VDhSTUwx?=
 =?utf-8?B?Qk5UbmR1ZG04VnBLS1hEbmpNM1pnQkVPRDNRa3plMDc2RmNPWXdTRTBVa3g4?=
 =?utf-8?B?M3V6TXVZK2RxdHhwekEvemFtVnl5T2lGWWtCWEt4ZkpwSG9DR0JKNzNtTlZq?=
 =?utf-8?B?NS95NDh1YThJTVhUMmUvdUdEYUprZUNHTEJTL3R3dHJpNDNGN2l1bEpQWjJ6?=
 =?utf-8?B?TWFKdHhqQ29teWVScEFoczM3dmxTTWhibmduaVVSVmZFK1N2S25kcU9zWkNR?=
 =?utf-8?B?dC85Ym1IdTNldVBsR25NMlVVSWcvMGtUMGZPRzRYSEQycnNSY2VQaU9yY2sy?=
 =?utf-8?B?MWxZMUVhNlhTTnM0eGU3aVFIcG5nVllydXU1QlgvWTNJSVpmeklvUnJFYlU2?=
 =?utf-8?B?dmc3T2Zwa0M0ZGVvYmFmc3NjTlduK0VFWXBuOXlDVENkV3BtRU9idHlHVzVW?=
 =?utf-8?B?THdJRTBBR1QxUmp1bGpMQ0xIaFIrSGk4dHZjWGhkOW9hdXpBOFRUUlRhY3Y5?=
 =?utf-8?B?WlFvUWE1ZHh6MWZjV1V0cEYzWDAzcFphcjAxUlB3UU91SG1VZ256anM5Zk5u?=
 =?utf-8?B?bERVTTBhRFp1TCtFQjVRMS9sanF6OHpYMUU4RnF4Mkh2bHFWL2NOb0ljRWR0?=
 =?utf-8?B?aWVidDNyTm1iT2pqYzhnOGdOVjIyOG1nT0lXalVVUnFMaGJiZ3ZmWi8yS09S?=
 =?utf-8?B?eThkd1N1WGlpWG5PaDNVT1lwcGlvZHlaSXdZNy9VK2lCZFNNaWhEMzRSQ3Vq?=
 =?utf-8?B?WWhPWEk1VitjNlUwZ0JkM0lRcEhOMWxweUZMWDhtYldjd2pjalBGRWxYUWtW?=
 =?utf-8?B?TURHUjBZdzgyTGRTWW40TmJXbXlYN3JiRkM5VmdjWXJrZTYyVHZJbFdnU3Z4?=
 =?utf-8?B?YlpqVEoreWZSN1BLZUtBZVRDVmxtdDFVOE45b1hmQUNpNTZTZTY5TlBQNGhT?=
 =?utf-8?B?VEd6dW1kV0xqNi9VNjQxbU9xWmVodTVNeHUwSDZJcU5iSGY0UXZnMFB6N2Ry?=
 =?utf-8?B?eXBCTGxyRk5oSU5CL25qRndxNEl2QTBGdU1vZmNobXF6a2x0em8rdWcrTWtO?=
 =?utf-8?B?SGNRVXJVNndVMFh0OFBISjRWVFdrN2JSVVZ1QnEwbnFzTXd4NDlHU1dnbHBX?=
 =?utf-8?B?ZXdKbXFVVyt2cUZFb0dldjlpR2RoNXYxcnQrZFBQUktXVGdvcnRXQ2pkUUJ4?=
 =?utf-8?B?RWFDci9tdnlFSWU4MCtrdjZOTzFsMklQRitJWEQzMEYzMmtZZUhwSjhnMlEx?=
 =?utf-8?B?d2RNZVhGUm1nZjRyRWt6M3lUTFkzM2pkV1RqNGtsZ010Q3kzUFJvSTZQanhF?=
 =?utf-8?B?WktWbklDMktzRUpXNUNIZWlpRmE3WE9xMkc3bVJFc25oUkxCM2pPNGxTWGpE?=
 =?utf-8?B?N2hONkxsMUZXMCt4anJEWGhITGRON3U3VGlvLzE1K00xUk5KSkNHR0w3RVcw?=
 =?utf-8?B?ZmE2amEvOGxxdDlNdnFIditod0JXQ3BMTFo0YzZVdG1YZm1CdXIvbDVsbUVL?=
 =?utf-8?B?RGpjdER1dGcweWwraHA5RkNodFRGekx6VjZNOWZlT1M1dHFYSXlKcDlPeUZ1?=
 =?utf-8?B?dWM1MDR1ZG5qdUxvZHBhN3lSR0VKYkt1cVFrSFkzV0ZSY2VicGdIdXVvSEZI?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1ec1ed-1223-4c2b-a339-08dd7609744f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:21:53.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2463Rzv/Gn2/Khryea6dZ4cjV6ZJYoc3EiJKtR57aVoidwYGtl7IDoFkmVYrNZYq2SUO/LdEI1rQEWtJfiiJBm+EKz8YYRJ3V53H7QGagM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-Proofpoint-ORIG-GUID: xP6nruQg4PNJDyo5n8D0dDE5X3ujvm2r
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f425d5 cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=IHY4GhH-AAAA:8 a=t7CeM3EgAAAA:8 a=J_L8MYm3jWFgGZEA1GwA:9 a=QEXdDO2ut3YA:10 a=5V7z7r4ZuTEA:10 a=_K5JiblfKYMv2DVRqnkA:9 a=-fAYH4fNnGv_J_Go:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=D2-2_G0xO5IXdrd33UjC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xP6nruQg4PNJDyo5n8D0dDE5X3ujvm2r
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 19:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214476

--------------VpCgzfq1yniINws401CNcmz4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-03 4:53 a.m., Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> * add function log_success_msg/log_failure_msg/log_warning_msg, some
> packages still use these functions, like mariadb, refer [1], without
> these function, with sysV init manager, mariadb will report error:
>
> root@qemux86-64:~# /etc/init.d/mysqld status
> /etc/init.d/mysqld: line 383: log_success_msg: command not found
>
> * remove RCONFLICTS with lsbinitscripts, LSB support already remove in
>    [2]
>
> [1]https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104
> [2]https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290
> [3]https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
>   .../initscripts/initscripts_1.0.bb            |  1 -
>   2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
> index 35aebd4a55..7fc19c808b 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/functions
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
> @@ -92,3 +92,24 @@ passed() {
>       echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
>       return $rc
>   }
> +
> +log_success_msg()
> +{
> +    echo -n $@
> +    success
> +    echo
> +}
> +
> +log_failure_msg()
> +{
> +    echo -n $@
> +    failure
> +    echo
> +}
> +
> +log_warning_msg()
> +{
> +    echo -n $@
> +    warning
> +    echo
> +}
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 98693fa66e..0bc078c5eb 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -54,7 +54,6 @@ RDEPENDS:${PN} = "initd-functions \
>   # Recommend pn-functions so that it will be a preferred default provider for initd-functions
>   RRECOMMENDS:${PN} = "${PN}-functions"
>   RPROVIDES:${PN}-functions = "initd-functions"
> -RCONFLICTS:${PN}-functions = "lsbinitscripts"


Patch discussed in patch review and while this will likely get merged,
since if your distro has these functions scripts, then your distro 
should have the log_* functions
or you get an error as Changqing described above.

By adding these simple initscript functions we'll have to carry them 
indefinitely
since it'll never be clear if someone who doesn't have a recipe in the 
layer index
is making use of them.

In the last 3 or 4 years people have added conditional code to handle 
the non-redhat case:

https://github.com/MariaDB/server/blame/main/support-files/mysql.server.sh#L93


Changqing,

Are there other recipes that need these log functions that you know of?

Are there other functions missing?

../Randy



>   FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
>   FILES:${PN}-sushell = "${base_sbindir}/sushell"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214308):https://lists.openembedded.org/g/openembedded-core/message/214308
> Mute This Topic:https://lists.openembedded.org/mt/112062232/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------VpCgzfq1yniINws401CNcmz4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-04-03 4:53 a.m., Changqing Li
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250403085305.3667237-1-changqing.li@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

* add function log_success_msg/log_failure_msg/log_warning_msg, some
packages still use these functions, like mariadb, refer [1], without
these function, with sysV init manager, mariadb will report error:

root@qemux86-64:~# /etc/init.d/mysqld status
/etc/init.d/mysqld: line 383: log_success_msg: command not found

* remove RCONFLICTS with lsbinitscripts, LSB support already remove in
  [2]

[1] <a class="moz-txt-link-freetext" href="https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104">https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104</a>
[2] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290">https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290</a>
[3] <a class="moz-txt-link-freetext" href="https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html">https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 -
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 35aebd4a55..7fc19c808b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -92,3 +92,24 @@ passed() {
     echo -n -e &quot;${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}&quot;
     return $rc
 }
+
+log_success_msg()
+{
+    echo -n $@
+    success
+    echo
+}
+
+log_failure_msg()
+{
+    echo -n $@
+    failure
+    echo
+}
+
+log_warning_msg()
+{
+    echo -n $@
+    warning
+    echo
+}
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 98693fa66e..0bc078c5eb 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -54,7 +54,6 @@ RDEPENDS:${PN} = &quot;initd-functions \
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = &quot;${PN}-functions&quot;
 RPROVIDES:${PN}-functions = &quot;initd-functions&quot;
-RCONFLICTS:${PN}-functions = &quot;lsbinitscripts&quot;</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Patch discussed in patch review and while this will likely get
      merged,<br>
      since if your distro has these functions scripts, then your distro
      should have the log_* functions<br>
      or you get an error as Changqing described above.<br>
    </p>
    <p>By adding these simple initscript functions we'll have to carry
      them indefinitely<br>
      since it'll never be clear if someone who doesn't have a recipe in
      the layer index<br>
      is making use of them.<br>
    </p>
    <p>In the last 3 or 4 years people have added conditional code to
      handle the non-redhat case:<br>
    </p>
    <p>&nbsp;
<a class="moz-txt-link-freetext" href="https://github.com/MariaDB/server/blame/main/support-files/mysql.server.sh#L93">https://github.com/MariaDB/server/blame/main/support-files/mysql.server.sh#L93</a></p>
    <p><span class="ws-pre-wrap f5 wb-break-word text-mono prc-Text-Text-0ima0"><br>
      </span></p>
    <p>Changqing, <br>
    </p>
    <p>Are there other recipes that need these log functions that you
      know of?<br>
    </p>
    <p>Are there other functions missing?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250403085305.3667237-1-changqing.li@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 FILES:${PN}-functions = &quot;${sysconfdir}/init.d/functions*&quot;
 FILES:${PN}-sushell = &quot;${base_sbindir}/sushell&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#214308): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/214308">https://lists.openembedded.org/g/openembedded-core/message/214308</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112062232/3616765">https://lists.openembedded.org/mt/112062232/3616765</a>
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

--------------VpCgzfq1yniINws401CNcmz4--

