Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B48C52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 06:20:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.71423.1724739618195852130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 23:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=896980ac62=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R33ot6014753
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 23:20:18 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417at32hh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 23:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bH8hHYjKlzNX9CromUcOBZMLoyEFD/PrHw92BR8/y1af/FkRFWRZKq/RZLhb4hvfdAcUj7TqBamCccYYsnlZtSZ3K3qFWFz9ZArM5vbrLpkz+sq+7gTbK7tKYGzGI+ndInuFyV9iH/kMsi9e8Mgxwsn3VhIHSstviKtF4eT/pu/aUdAxog23ok/VqUVV/zJ5wOMJznw5rGqheP3ULN9eBCDmkQkRC5kDh28RNBMyJSPg87G6WbwbfhxrEkv7p/2tB/EeSu4BKDFLvZswBbkYTJHa5whUXYjwJy8KGfkFX+RATlhSx1J1okinYSku7taPdEH2aREYGfRL+ocO7Qr6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKXpJiOgvAEJ2crhNfg5gGAa/hC2a5ewxOEhqtpD5bQ=;
 b=N9Qxp7XQcJbTp0xN7VO9Zi1b2Eq+8IjXNBdg+NLwcK5tvI5QfnHfBTqYjgkw4okZ+D2k69Vs/AxVMOWnooGbnM2Jpdp8mZGFo2us3ScDXRl8Ps5JrMCofoVmgAOaEXXjBQJ3xmHvTQRtGHAQqY59OFzo7z4FHRiV0D4ghVXiqEXyWlU0jl9t/ImX7JoZ71hrYYAJ6t3tE31C0759iK+Z/b3Lxb81Mqergs8yHQ5YU3XHc3Uego4TH/3SjxjddyI/MoQp4vf9kvlq4fwnF+rX2LyX7Q5HamP9Vx4RX2YKPzW+mG7xWi6Bedm98A1fymm3ZvB8RgyPExrADBvRp9QUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 06:20:14 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 06:20:13 +0000
Content-Type: multipart/alternative;
 boundary="------------0dS666nxVvgR3wY0moDP0u2a"
Message-ID: <2f2d2431-83fb-4f8b-a5ef-699f906ca9a9@windriver.com>
Date: Tue, 27 Aug 2024 14:20:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] expect-native: fix do_compile
 failure with gcc-14
To: openembedded-core@lists.openembedded.org
References: <17EF8144B2D2A6D7.8904@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17EF8144B2D2A6D7.8904@lists.openembedded.org>
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: bac94b12-458a-492a-45de-08dcc6604f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1k5RVZYOEJvOEVWK0JPcDZGQXpUK1ZTRmJjS1Z5WFQ4WUNLZWkwblVyaUto?=
 =?utf-8?B?YkVTWHAyL2dWeEdBS2pyemxqUFBTRFBIWW9ZanhVQlowOFFuWDF1RFU1c1A4?=
 =?utf-8?B?ZDFUYXZsMXZ2N3pFQ1VUbjBtNEoxR2F1dTlpQnUyd2Z2WXFIb3dHd2RaeUlo?=
 =?utf-8?B?U29lMi80dTF5cFJLLzJRNUU1TDdwVVRrZW03dTZkNVcxN0h3RzRLc0Y1ejJF?=
 =?utf-8?B?NG84cS9zZFJrNkdHcEEyWlR4SlhYTVN5SFFsU1BoQWpKeHVLRmNic3FTVndh?=
 =?utf-8?B?cFVTR2lNd01EdkN0bEFxMGF6M0xlcjUwa0hmT3hnalZubnBzcGxaeWNUNmxG?=
 =?utf-8?B?dUxtQjYzN0NTTFI1YzVaZGlOT3ZaZ0RHVnFzVWs2eDhYZWlQZ05XQURWallY?=
 =?utf-8?B?N3hJbEZqYiszaDZTZ3NmTFlMRzdQM0l2TFRjQ01pNnJnRzVocXIyb3RIbk1M?=
 =?utf-8?B?WGFYVjE3ZnJxbGwzUzRSdHAyV1JHbEYwQ0R4VFBBN1F0QTgzdGk3bUlVZi9i?=
 =?utf-8?B?NjlOdS95b3gwQzgzc3NvNEJzM2xnS3hDT1VzNWJsVjcrTWtGSnJacWZSbTJD?=
 =?utf-8?B?NE5NRDBjQW04RC9KcXJoemhhYkJIc0dkUnMwYnFOOTJLaVBFZ2RFNUd1cHhV?=
 =?utf-8?B?S1RsMERhRTMrTGIrN3pCeXViUUZ3ZGQ4YWxWb3RCTGI1NTFObU9UeG5mT3hv?=
 =?utf-8?B?eEtrRVFyR2Z6RDBWMGhBL3FDT0RJcVU0TWlmTUYwOXNVMS9uaGtuZ1JTc0RF?=
 =?utf-8?B?bGtIT0ZIMGFRSTJ1aGZrNks3RWNydWJKb1ZlOE5vYy8xb0ZMV29wQzFrNy96?=
 =?utf-8?B?RTJCYysxaW1TZ0tWYWErMkpiYlZIOXZ0YkpuRkZKY0IyeFRPaUdUaUtxUmNU?=
 =?utf-8?B?VWh6VmptVzI3OTMvdWlzeFhQQlB4MERyNmJXVDFJRTMzeFMvUEtOa29ScnZ6?=
 =?utf-8?B?eXNadjJJemZob014dEZLZXBEcEZBRHNBRUl1N1UzUlFlNllGR1ljOGxEejkw?=
 =?utf-8?B?aDZmL0VnV1pKcnB2TFZScjVVUTR0ekEwVnk5YndJMmVWNng5aGVOR1lQbnpx?=
 =?utf-8?B?YUJjaC9nVFZKKzVzZkx2dVg0OHM4M2xWcUM3cy9OQ0sydUFZMFhVVExqKzJn?=
 =?utf-8?B?ZUZIakIybWU3UEd3eldLT1RrT3p1UzNueURqenlDbmdKTjRVM2JRS0lUeXc2?=
 =?utf-8?B?YkJER1l5QVlleEhPa1Y3NGU3MDlFUkRoeHJVbjBObU40UTh6eGs3MWtRYUlP?=
 =?utf-8?B?aUkzdSs0a0dkUUNnNmhSeDlZcVBWQURqL0pRdURLR1loZXA4a2JyUm8wTGpD?=
 =?utf-8?B?d2lidk4yZi9mYjBTaFZ3bnRGMDhMTWdkdVlVTDlNc2RBSkE3QjJ2SU9kWGFt?=
 =?utf-8?B?aG85b3FGNEJ2U0s0RDFMc25mRk5wYWp1UVM3OU1kbzFnTnEvbWgyK2FkYVhN?=
 =?utf-8?B?aE5QVStLNjd4aXVkUmR4VldJVUg4RFlPckVLZUN2aWZUbjVHbWhyWDU2NlVy?=
 =?utf-8?B?S1FUZTArbHhKWFBLZ08waGIvdmZITVVnTEg0ellqZVNtZlNISFBkRGhwUUxu?=
 =?utf-8?B?a0VLWWJ2dVV2TFJKZDJzbjR2blVNMHRWWXhTWjIvWVZuQTIxUmlGVzdVenJH?=
 =?utf-8?B?MXdmRjQ3aGhHYXR2S0VLOEpQeEMvU2xJQi81cjZnL1pRSFJzYWR5SzNGVkRq?=
 =?utf-8?B?WXE4M2pDYk1FT3VabEVHQU9oTTh5V1pFSno0MkFGblptUjhoVEwraVp3TDM2?=
 =?utf-8?Q?t+6poyBRG4Ejt9yE2M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkpVN1J6ZGJDQ1lnOHpMWTVVd0hLVnVsWGM5TTR1SjM3Y0Y4bFB5RGo2WThi?=
 =?utf-8?B?NjZJVStUYTdYQUNtSklZWDBEVDhRUEVYZUxoZ1R3VmIrcG00Z05oWHZKTGZo?=
 =?utf-8?B?eklMckxXalNUM3VIYkZrTUk0VHJRSmJZMEtnRVZOdFhZSjE0RS9qZEFBMkQv?=
 =?utf-8?B?MkYzcUMzUlRTUUFaVnVPWUZoSFl1SG5pZU5wZEJwSUR1ajNXVkxYU1M0VEFC?=
 =?utf-8?B?a3dpNm5nVkg4cDdKQXdWMTlYTkF3ZjhteEJGdW9JeGVnTEhiWGFMN0F3ZDZW?=
 =?utf-8?B?U21zUmp1MTJuZUF4ZTY1UytkdGk4UUtLb0pDTWdpRm8yOTEySlp2UTVUdU1k?=
 =?utf-8?B?ZDJTYTBaWE1JWm5IZnlQYlFzWUp0cytvb1RDTWdnYk4zaGlMRUlMVVdxbjYz?=
 =?utf-8?B?bXQyaHN3V01ISWJ5OWxDaWZjR0hwWUFIdUpvcnJBTGNJaGp6bytVM0Z5Rklz?=
 =?utf-8?B?a3Nyb3k5UDRTb0VPWFVhaGE2TDBqcmZDbnVtanNzdzB0a2E1OUg5cVJKL1dv?=
 =?utf-8?B?N1pGMEZkL2pOS1NYenVBa2d6cEYzaEN3bXNMYXBlU3dPbEVZa3VDeEp6T2Qy?=
 =?utf-8?B?dm1zdmFRQmQ5d0dTYS9Rckd5QUF6WWRoZDh2ZEl1L0RhUkhkWlpsanFnWUU1?=
 =?utf-8?B?Zkg0YU9yKzN1UER4R3lYa3BiRlRoNmNCZlhFaDB3ZzBhT1lERTNKYTJtSnhi?=
 =?utf-8?B?M0EvTFhMOXdHd1hUTWUyYXlUZURueitvWnhKNlNCT0NNRTlLT1ZablZuYzJ4?=
 =?utf-8?B?a0wvZTBmTjgxazhGMlgxYlZHMHFZU2VtM3d1ODlrZWZTbXF5TWU2a3loVnJW?=
 =?utf-8?B?TDUxQTl0V0FmZnZacnpBV24vNGtYbnA1ejgwQ0tqVnlJbVM5M0lBSTZ2MGs1?=
 =?utf-8?B?ZURucGMwTFRCQjEwTll0VVB3VXR4ZlppTDdMeE9yelEzY0xuenhKU1BEUHVT?=
 =?utf-8?B?bVRzRUFTM01BMXlwcHRLUjlFS2Rlay9BUjVVVWdRZDdmR2JLbFRhMFBoZy9M?=
 =?utf-8?B?dDA0eU01ZTBJa1crQWlyOHJRbzVSVS9mWnhON0ZlNGQ0cnJ6RkhsM1gvcnYy?=
 =?utf-8?B?cHdCV255cU9SRGhxTXdHdGUvYUh1aVZuSFFiRnhQZTZudEZFWTM3T2VNdTEv?=
 =?utf-8?B?U2o3T1FHaU91MmtkaDVTOTVKcjlGS0ZkdUxFU1JnblBJOEtLWVhDRlBJUVZB?=
 =?utf-8?B?UGd0TXBkVUdVb2J1M3cwYUFyQ2hOMWlTcG4vVWF0TGJjaDI3eFIrdkE4S1RK?=
 =?utf-8?B?YVRUcHQyQlhjdTdpaHdNVEtlajR0Q1pTR05ncVZYdks3b0hCVmlVRFhHSEdr?=
 =?utf-8?B?cXIzRWRpYjZBU0Z4Yzc2Mk5iTjc4ZFZQaW01WHY5K3hMak8wMjhNZjBvaytQ?=
 =?utf-8?B?dElxUnVFblFhVDRWZXFaYmhqdlBZdG5ERHY3NDJIdXBseTZJb1BaRUJJZ0dU?=
 =?utf-8?B?MkJUbnRxaHJSVFNUdzg1ajA4TzQ1NU5yMG1rUVpFWjVpb2NpVC83U21haUVh?=
 =?utf-8?B?ZmVSTGhTWENtSVVydTdtK2xHdzFDS0dNYjdQeGdLNjZxdExqWmdrQWlOWEVB?=
 =?utf-8?B?cHRpK3E1Ujk0SUQ3TFUrUkV3M1VTckJyK2k4K0d1TktMSU5McXNTYnBscmhM?=
 =?utf-8?B?aUJZeUppZTN4OWhySmxidTB6dHJNUEZTS1IzbHYxWTFzSkxWTVRjMWtwend3?=
 =?utf-8?B?WVhkWnpkeGtUTy9EWW9yM0V2K3pib1NqTWxOQlJKU1NnMXpTUnJEM2RNRGRy?=
 =?utf-8?B?MGJ0eGczckZzMjZPM2pKY3Z0Nkgya0EyM3Q0TjhTaTZvUXVmd25STUI3blFL?=
 =?utf-8?B?bDgwcDFNOU4vSlFjZGJTbTBJS3ZEVWtScjQrOHAvSklraUJ3NmE3U2RLL0ZX?=
 =?utf-8?B?WVhPRHBaTmVWVk1SMGpwWE8wWCtwR0xYc25TSkRuTzZ6bElmZDZkaTB1YjNG?=
 =?utf-8?B?SWY1M3lSQVRDZE5obXJldXB1WkhPa1F0VlhJcG9MeWtEQmdaclJFSHBpY2FL?=
 =?utf-8?B?bEMxcmZ5NStKWXdXenJrNU8raTFHY0RmemNpTEFGYXFUNmJzTlByZGYydU8z?=
 =?utf-8?B?UjdNU3JiM1pJUjV0RGJIQTZTVWF4c3hZRXRubDFTeTJHazVCVFowMStITGNh?=
 =?utf-8?B?VFo5c1BYMVpmcjNwb3ErR3p3UTd3QlN2SWdVUWxQcFBqdjBrVk5INWZudk9m?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac94b12-458a-492a-45de-08dcc6604f8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 06:20:13.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkKWo2h1V4LNSogOIi6YBYpUBb2V32S527jBW2eY571QC+3j1n0Lm0I/nf3lLX7HpEad8caDWdpK0l+i1bwoLYfXR883SNFEEF3vvlOMmsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
X-Authority-Analysis: v=2.4 cv=F4YFdbhN c=1 sm=1 tr=0 ts=66cd7021 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8
 a=RtDqVMogwMtE8acTRW0A:9 a=QEXdDO2ut3YA:10 a=i65kn1p4VLntfUvwpN8A:9 a=y9mL1EJLJUIkOrMB:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: Uvy70EecT6Hmm1j6FDVeDDo1WIr5oCLk
X-Proofpoint-ORIG-GUID: Uvy70EecT6Hmm1j6FDVeDDo1WIr5oCLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=646
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408270046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 06:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203813

--------------0dS666nxVvgR3wY0moDP0u2a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch is not needed for master, as master already drop the override 
in native.bbclass.

//Changqing

On 8/27/24 14:15, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> In native.bbclass, CFLAGS is overrided by 'CFLAGS = "${BUILD_CFLAGS}"',
> this make "CFLAGS +=" not work for expect-native, use append to make it
> also work for native.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
> index 174b35ec73..158e7af030 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> @@ -85,4 +85,4 @@ BBCLASSEXTEND = "native nativesdk"
>   
>   #http://errors.yoctoproject.org/Errors/Details/766950/
>   # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
> -CFLAGS += "-Wno-error=incompatible-pointer-types"
> +CFLAGS:append = " -Wno-error=incompatible-pointer-types"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203812):https://lists.openembedded.org/g/openembedded-core/message/203812
> Mute This Topic:https://lists.openembedded.org/mt/108118728/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------0dS666nxVvgR3wY0moDP0u2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>This patch is not needed for master, as master already drop the
      override in native.bbclass.</p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 8/27/24 14:15, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17EF8144B2D2A6D7.8904@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

In native.bbclass, CFLAGS is overrided by 'CFLAGS = &quot;${BUILD_CFLAGS}&quot;',
this make &quot;CFLAGS +=&quot; not work for expect-native, use append to make it
also work for native.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 174b35ec73..158e7af030 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -85,4 +85,4 @@ BBCLASSEXTEND = &quot;native nativesdk&quot;
 
 # <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/766950/">http://errors.yoctoproject.org/Errors/Details/766950/</a>
 # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS += &quot;-Wno-error=incompatible-pointer-types&quot;
+CFLAGS:append = &quot; -Wno-error=incompatible-pointer-types&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#203812): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/203812">https://lists.openembedded.org/g/openembedded-core/message/203812</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/108118728/3616873">https://lists.openembedded.org/mt/108118728/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0dS666nxVvgR3wY0moDP0u2a--

