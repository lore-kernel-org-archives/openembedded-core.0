Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DD9E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:40:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14655.1736325613639479244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31033019da=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5088DdIr015246
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 08:40:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fv3r9d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:40:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKpDLGlkn/XNvrpzPDpApqeMBMgWanslE2gUcIfkf0UH+xeHiPLWgb5jYjqxjwNsWVc1sBFYFnebAS6pPvluOSoO5EE4Wnlo1V3u1+m6P+jgtz35OcPibN1xCI6PGjw6LJmFq1oG9t6GLMH9IIc4yRAn6wPAirt0kI+N5N/td3AcsgN044okAlqW/qryrkyib28vOzDKxHcuXKSyXeK2C3gg4UQHIaexgpod5jPjbg4Z76FZe87Ut6xJykO8YyZEpiakiP16aGlfDPTHVFsAIIAHLeGHhHhYR9HcKBUe7Ry/IqP0x4tZvTA007UQXCYgdml+SN4xPHP2P6O2l6J48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL+zZzNMLgUOvgizKenJFlQrovZpvcHpPTTTn38lMRM=;
 b=jU38rj1He2w5PAkSi3ByFCI8xmJNQHOrEb1OYD3VgdV1fL/jW0jtNYqJhLURv/+PnB9PGotxQoFtYRRks+5QNptNRJOGCpAUAUtBsU7YY0yNMtTfA9sr9k99ZyGwvj0MUIV+WjVnh0hkRx7z5TdSZu4GcVEy62fKrxsEoO0LE2t414QiowUZacODc2nfYYwWTl6EoixQN8GZIpHHgtwaSv2fYg/uIVlisBfThG49WTr8KddYL03uBPsIl/lFId0V2qozwb9G0ZhhwGyIZ+yj/45ENgmQFVp4pmFPsXEJQr48DMI7gZUts0gsBtoutz5Ko3miAgJ4X59ih3HFLZ4GKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.15; Wed, 8 Jan
 2025 08:40:06 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 08:40:06 +0000
Content-Type: multipart/alternative;
 boundary="------------FFV8jQwHXZjhVWLcvHBe8QDq"
Message-ID: <0146cc17-13cf-4322-ae18-425b822085ae@windriver.com>
Date: Wed, 8 Jan 2025 16:40:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
To: openembedded-core@lists.openembedded.org
References: <1811EBCBC381E647.26783@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1811EBCBC381E647.26783@lists.openembedded.org>
X-ClientProxiedBy: TY2PR0101CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a377b3-2423-465b-35d1-08dd2fc00d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjB3RDFtV0thMVBPU3V5dTA5eDN3ZUVoVm1VTjl5ZlNXREdtOG83dTllcGsz?=
 =?utf-8?B?M1o0eVpoNEk2Y0hnczB2UDh2V0Vib1VvalBjam5wTWhHZmRvRXVYeCt0TUI1?=
 =?utf-8?B?NFY3SS9aY2p4ZkYwc3lmcmlKRUhrc2hqQTFzTUNtSUNtZkV2L0F4YjNnNFZn?=
 =?utf-8?B?b2xjOWN3RzFJenQ4MEVoenkramZRb0IxS2lrNUlJUURhZlhFUmVsTnp1Z254?=
 =?utf-8?B?dk9vOGlRUzBQbGZQRVFpVlQwUTlobmtsYlhUbWNaTnVGSFMrZEVSc0VsUXIv?=
 =?utf-8?B?b0Q2cG84RUZLL0s5V2M0Yk4zWThHR2pnWjdpcGdleWFWWUhYK01MYUZYd09t?=
 =?utf-8?B?Q0xkRlNNOGl1U2dTMkpCMTVDRWN6YURSeUZJL2wzWmtnZHV5UFBKNWUrQ0Rv?=
 =?utf-8?B?TitRNDRXL2VRUjVaSmJXa0JGRDVPUkorK0F5VHdIb0pDUXZKOExMbHo2STBC?=
 =?utf-8?B?cXV4YVkzbzFsdEVmY1pyUTdHaGYzSWNxTExnbHZqZnJXL3M2enpWcDNzbFVa?=
 =?utf-8?B?bHVIYXAzYmFiNFNCVGNObTRpRzVzdVhBVjlIOHhZa2I4aHkvdmZyTTF6c1JR?=
 =?utf-8?B?dmN5YWova3pGT1Fzc0l6VzllN0NHK3B3ZE1XbmszbTZhODBLYWNaUGRPZXUw?=
 =?utf-8?B?emVQVnZSd3FuSVlmZVk1VVY0R0hEN200aTZCYTBwUEJUTDUxZUxkYXgwWisx?=
 =?utf-8?B?RTg5eWI3MVRkL09yU3RNWWh5L2MzMWwyVnNFa24rWnpmY1E0UFpEc0FwaUNW?=
 =?utf-8?B?Qkc2eEtZY3MxNHRPVWJYVVpHSzJwVDlPY2JWVHVaSjRlZVdybzdaUGFvcGc0?=
 =?utf-8?B?Z256ZlNoQXpCeGEyM3lhbmNHV2w5c0l6MDlBSEtEVkxTdHcxMXhxMjBGeXI1?=
 =?utf-8?B?VWd6cVB4UXh0cVNMaWtDd1NLa3lXUFVIc0ZNejRFWVdPWVIxbjJOb2p3KzA2?=
 =?utf-8?B?eDUrYU5wQUNHb0FJbDN2d1NHdEdES01sY1hNbXYvbUY4QjF6UVlKenE0YWhV?=
 =?utf-8?B?RjhUOGcrQzh1RzVLS1ZVSnJIWmxTSVBHSXpISFpVaUxZb3diQU54MjZ3aXds?=
 =?utf-8?B?OW9IN040YWxDR0FRU3dOaFdjQVJjRmNJeExPVEgrdm94K2FpbGtCcGxDNEc3?=
 =?utf-8?B?dGgzbTZBdVlJbTNYUmhueUVpZFNCOGlSZVh6MzJsMGRkM0JXaDI4R09PYUJi?=
 =?utf-8?B?WmJoeDZkZk1FUXc5eldUYVQ0S0hwa2c2VktXOFVZeExUcVFDdzc4bmFSQ2dV?=
 =?utf-8?B?aS9MYklmNUZRK1MvV1U0RjUyS2FtaVBha0trWmF1bmFDMDR6bjQreG90YkF5?=
 =?utf-8?B?ZFM3dFJRdTBjVTBDa1dFazJGSjlzazRnMkd3QWxvU2svQUNhMHdFRng3cHMx?=
 =?utf-8?B?MmZsRUdaSWRnY2lrd2JmTi96Ni9oeFJtclhjZnJEYjRidlFMTmxNdjFXNmJV?=
 =?utf-8?B?dFF3bXJVRHhtM2ZXV0tXc1UzMU1CVUFYSldqTmE0K1c5MTFLSlpoc21XZndm?=
 =?utf-8?B?NmJTdkdlbWxFSmVuRjNCREVwUEgwUTJRaFM5R1RjSEg5WndEQm4zUkIycVBn?=
 =?utf-8?B?TEdjanR3amZLQjZvOW5WRXZ2Q1JuYmMxU2sxQU9mUHZxZkFsdDFZMTlna0th?=
 =?utf-8?B?YVZ4SnlqdDBPSzV3aEc4bVBENmMzcWlXa1hWTHJmcDB4WmY5NWxnT1M1NVNJ?=
 =?utf-8?B?TUN0VDkzTXdkUEJGcFdlMFFaZ2hTYWJJbzRFYnJNNzVsRlBtVTBDcHZKd25Y?=
 =?utf-8?B?S1pBNUREWmt0NTVqRWJWR1Q3Ty9ZRktmSzhUQ2hFS3RiZWFxNk1JQmFGN05u?=
 =?utf-8?B?c1d6N01OYytMdXNvRFN0dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFVYck13MUFvelZnL1oyK01HeVRWbzR3bmVGYit6NXBDVEtCTVN6SHN1a004?=
 =?utf-8?B?UlBYc1dRekI1RlJaaUI0ajB2NXJDeW1ROE9WNW4rNTZ3Qm1sVjhQQk8rdlNI?=
 =?utf-8?B?c1crT0QraVJ3eUVha3lOTGJmLzk5UmRuN0MxY3ppMFZ0U1pNSFlYbVkwUnFQ?=
 =?utf-8?B?cVBGMHFWVDZPKzRRTkh1QmRkNFZmVTdrSHExN2V0c1lVczVyTW5RSUVURzBC?=
 =?utf-8?B?K1VzK3l5V1Q0VWNPTDhMRC9TQUx1RnpoVHJhV3IyZG44QXlQL2JLQXh3Qm5Y?=
 =?utf-8?B?T3dqZ3ZSandMd3pwVEh5NWM2VTVpS0FDVmxkb3lFTC96WDBNWlB6ZkwxV1Fl?=
 =?utf-8?B?dGlYdk9LUUhyTlhmUGgvc2ZVN0xJK3NLOWgrRGdyLzRCaGhsYkxPUXVtSWRp?=
 =?utf-8?B?UXNucEp6clFuaVo1WTZ4VHQ2Y1dQL1RXMVdFZmRrUG1RUFhYcmNia1pkRVhI?=
 =?utf-8?B?ZU5VTVNVdnBlUzNDd1Y5OEV1aWFCTEt1ZVdRNzBtZ2FWelg0SlI2aFc1d01X?=
 =?utf-8?B?ZFk0S2tYMnVnOHpzRXZxL3dVZjdNRk5QLzBvUU41SzZGMkZnM3Zrb0Z0S0Ny?=
 =?utf-8?B?TmdNQmYrRDk2cjZQbHZhNEhvQ2JtWUhFUVY0SDZ1R2UycjBNV0RBOFdCUk9p?=
 =?utf-8?B?bDhNM2VjTU5OYVdwRS9vWm0zVUoyQ2w2eWxxMnNkOXcyMVE0aFpFSisrNmZw?=
 =?utf-8?B?aWV0bnFWM0hJK25aRWV1b2huTzJoVVRGR0VZRFpReTVJaGJnMHk2Q3c5Mmd3?=
 =?utf-8?B?bmtsVWs5Q1M5eEdrK1k5QmttNVdwamxDaXZzcndGaERQeVdUUEQ5a0hMVjN3?=
 =?utf-8?B?L2xweTFwTjdzSnJEVHlJMndGQytMSXJ1ZU9WdDQzaW9HWmxWcm5qZk14M2pZ?=
 =?utf-8?B?eFVUZ2pud3FzYzBVNlJCbHQybWhwZWFEdWMwUjN0L29rRDhHK3kxdWxVM3dD?=
 =?utf-8?B?U0xGdThwQW1DelFCOFUyYmgwcGJXZEtZbjJQMnpScEZIazNhNkRlQ0xYVi9Q?=
 =?utf-8?B?eHpjejlOYU9IcWpPa3UvTUhoWGpBV0xrQzJiSVNoVlpPTkE0a0tKQVpWVVdt?=
 =?utf-8?B?L08yMWg0NjRmdkpXNDZ5cUxpTEIySkU4d05YdS9JY01SMjZLSE16ZWVhRmp2?=
 =?utf-8?B?VHlKa2RMbW9tdVZzZ1phYlQyd05uQnBTTkJRWnZBZGxiNEtTUFEyZFA4eE5r?=
 =?utf-8?B?L0hvb3FCZjg4b1pyNDQ0cm1VYXBMR0RJMGxJZFcvVzlqUDg2aExUVkFtdlJp?=
 =?utf-8?B?OFBoMWd4ajhYREJSOEhQZUJlNDNZbEFGclk2TU9pRmJIQitBMnY0b1pHUW5G?=
 =?utf-8?B?SFlFOVIyRC82dDVuOXhBQ2tkbW80YVgxTFZ5RmI2Y2pyQUpmUUZ2Q3l1bzBP?=
 =?utf-8?B?REpPK1BvcUUvTUtYNG9qdU9jS2NDb1lIOWg3bi9aZksvOXBKRlZ1UUtmY084?=
 =?utf-8?B?dXdGSVpab1I1QzRNR2F3UUNYWDNBV3MxWGJOY1RJczRXMnIvbmt4dXlSYnBZ?=
 =?utf-8?B?SFc2dmtPRmEzZUs3aGQ4VEYyeWpETnJRdHNiZ2JRVHR0dzZrcTVHOHZpSkFk?=
 =?utf-8?B?Ty9WTWZmcjZPNFBuWUNxM0phYzljMG41dDlRTFQ2MkpaK0lEWERJV2NjajZL?=
 =?utf-8?B?V1AvR3pJeCttMjhHT2FlNDAwUmZvQmNYS1RUSHdiTWk3OU8zZkR4c29BUi9x?=
 =?utf-8?B?QTRtS0tUa0JsRXFzaklySE9ZN1lvbUVpL3NVQzhJNGtpc1ZoUW9HOHEvbS9H?=
 =?utf-8?B?WHJ4WW9uK0JuRHV5WlFJNU5Ub1NrQk9PNkN4QjE2WUFyNys0SlNvb3QwU01m?=
 =?utf-8?B?bXBmaEFjUTBlWnJLQ3pJVC82MWY2bElIRjJwSVlwYlhENkRPdWZyR0JteTQ3?=
 =?utf-8?B?VGlhV2JBb1l1WjdTWG9CMDgyb1pNODlrRkM5S05KNzZnSjJTQVJkdGNvZVRW?=
 =?utf-8?B?MitZVDUyMkZ0Z0pLWUpFaDc4MnhNOFJYYlZIU2JmZ3MrSUJoSXNzOUtRc2sw?=
 =?utf-8?B?RFJCeDdMYk1qd1djdUE4akoyYytTN1QvVm43eXFJd3IxYmVZeS9UTDJvMWhI?=
 =?utf-8?B?YldIYi9CTnR3SWdKNDhodUpvck8zejhMSjNTeUVqQWJzZDdqUVBFZUIzLzIv?=
 =?utf-8?B?ZG9xbHRGL3BCdU03TW5wbUhWMms0S2x3UWRHczdJVVZBcFJSbktDYXk0WFFX?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a377b3-2423-465b-35d1-08dd2fc00d33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 08:40:06.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csCzR/HrTrt6MfH4xKYJDHEe6KgJgZy7vHcSGjOtw7ds0MtZPsoPZszWuJvnCfETH4DEi8B2dhxs8SHISf6QP2Hozh7G+Sv8G1nvOHW2BKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-Proofpoint-GUID: LUZfIql0CW475djilH5QQts4ObA6fnxd
X-Authority-Analysis: v=2.4 cv=NIUv+16g c=1 sm=1 tr=0 ts=677e39ec cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=fQOHhzNdFbU-eexvV3wA:9 a=QEXdDO2ut3YA:10 a=vwO82n4vQxo3SxQzQSUA:9 a=s9V53I5j7uP0zHA6:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: LUZfIql0CW475djilH5QQts4ObA6fnxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_01,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=996
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501080069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209522

--------------FFV8jQwHXZjhVWLcvHBe8QDq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 12/17/24 17:09, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> man-db uses a lot of m4 files, with acpaths set to absolute path,
> and the TMPDIR is long/deep, for example when len(TMPDIR) = 350,
> do_configure failed with "Argument list too long" error.
>
> [snip]
> aclocal: error: cannot open xxx  Argument list too long
> autoreconf: aclocal failed with exit status: 1
> ERROR: autoreconf execution failed.
> [snip]
>
> Let aclocal use the relative path for the m4 file rather than the
> absolute would fix the problem.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
> index 2fa18a8f24..553b2d59d2 100644
> --- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
> @@ -22,7 +22,7 @@ USE_NLS:libc-musl = "no"
>   inherit gettext pkgconfig autotools systemd
>   
>   EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
> -EXTRA_AUTORECONF += "-I ${S}/gl/m4"
> +acpaths = "-I ./m4 -I ./gl/m4"
>   
>   PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"
>   PACKAGECONFIG[gzip] = "--with-gzip=gzip,ac_cv_prog_have_gzip='',gzip"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208826):https://lists.openembedded.org/g/openembedded-core/message/208826
> Mute This Topic:https://lists.openembedded.org/mt/110160165/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------FFV8jQwHXZjhVWLcvHBe8QDq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 12/17/24 17:09, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1811EBCBC381E647.26783@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

man-db uses a lot of m4 files, with acpaths set to absolute path,
and the TMPDIR is long/deep, for example when len(TMPDIR) = 350,
do_configure failed with &quot;Argument list too long&quot; error.

[snip]
aclocal: error: cannot open xxx  Argument list too long
autoreconf: aclocal failed with exit status: 1
ERROR: autoreconf execution failed.
[snip]

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2fa18a8f24..553b2d59d2 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -22,7 +22,7 @@ USE_NLS:libc-musl = &quot;no&quot;
 inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = &quot;--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}&quot;
-EXTRA_AUTORECONF += &quot;-I ${S}/gl/m4&quot;
+acpaths = &quot;-I ./m4 -I ./gl/m4&quot;
 
 PACKAGECONFIG[bzip2] = &quot;--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2&quot;
 PACKAGECONFIG[gzip] = &quot;--with-gzip=gzip,ac_cv_prog_have_gzip='',gzip&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#208826): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/208826">https://lists.openembedded.org/g/openembedded-core/message/208826</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/110160165/3616873">https://lists.openembedded.org/mt/110160165/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------FFV8jQwHXZjhVWLcvHBe8QDq--

