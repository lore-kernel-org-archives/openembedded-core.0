Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D3DE69E9B
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 23:14:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6869.1733181260336948818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 15:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=206647608a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2LBetZ008181
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Dec 2024 15:14:20 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7tc5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 15:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1GbzWkpwRX9Cyo9KrvVKf5dz9QUeRTN6T8gKQCHL6SVZOqVpRlIh3DjUuyezgrtHxoZIa2MaqKMvUHLopSHM8tgWjlk7hPlva5Pjt1k2Fs/HlYlKE4x1Zz5nTO3GHQ/6ER1H/e8cc0JSMZRyGmN0XgrQq3ZkyaCrAsVFWZJVOhfZZl+X4oWWAik8pnJ9h5e3G3bTheprReIT/MZFEC+FHXMb2/ZQdF5WZmPfXFkoeSURVzaU09OdSCdjZaPEONrpwcydS8fusN/uwO5z83DsW+HlKGvmdsj5D9VY5cy+8Z3Rjze+90nuJH4quxSWBqyTxXM5LtyK0KDdbh88l37lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYt20mtWoSc/LWJl2MlTH3+S1HytrdC2rtVGVDKkqKE=;
 b=DSCO0xhwyodnGbrByuH91VGdhdXG10kcA2x+gnj/9vke+uqXd+WhmF2OwIBZBrMHMHa8VdmsBydOzxnQNBWdhGZVvPLG5i1fPvM4gsvvrsykqFQeim6mUgacSQDVNqffqRE7jV20TPhGQ6SFSwlRmr/jXonBghT1YQHBzg5vHsrLNjsPgVhq9hmA3TX9bTL6Skx4iBPNp+ULZB3TN+T4/S6t2ogj9JerRbWniKgEr67eDbYTQrNz+28TXan3j6+0eS0eE9s+3A0I2Hz6DFYSCm044YP87iAPt5l4ZwzpIGrZw2vQU/2TEfU0t5+BsW5+2A6qmaF+0x9WhjuC/Hcihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 23:14:13 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 23:14:13 +0000
Content-Type: multipart/alternative;
 boundary="------------0K4WhSp0DcvC9mHFOE4dBLKj"
Message-ID: <5a5f693b-6def-4763-89d0-91168d1085a4@windriver.com>
Date: Mon, 2 Dec 2024 18:14:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcc-sanitizers: Add riscv64 as compatible host
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241202043514.3046780-1-Deepthi.Hemraj@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20241202043514.3046780-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a9e652-7672-4e22-f2ca-08dd132708dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3F2aGhJYXcrcXg0MmZ0bUtRNWZTWTJYZ1ZrS1hnSFJqeFppdDRyUjZ6Ny8y?=
 =?utf-8?B?ZFJTQmZuUFI4UExPRFUwK2s4WFd4bHBvWjcxdWRVdUZ3dCtmVFdxZ1pBZjlo?=
 =?utf-8?B?YlVCQW9Xb0hKaUptRkpPSXAyWTdyYmgxQnZSY242MlYwOFB2NmYvcFh3dmdX?=
 =?utf-8?B?Y3h1VGVPalg3cy9NMFpwVDQzYVRWbFJWVzBiZWIxaFRDa0g5a0E4QTNXNjht?=
 =?utf-8?B?eTZlM2lSeDJ4OER2VXFoM1gvSCsxRW9nTlU2RTlvN1orMEpGNkd1bFE4L0Fo?=
 =?utf-8?B?cno3TkFYZmtKZ09wb2g4WHpTZ2pmcERlSnA3VDdacmtkMVlneXpCK0hqWGJS?=
 =?utf-8?B?UTkyc2haNFNTWXJ4TTVpeXg0OGwvZ1NIQkhWVC90WUo2WTliZmNiNWp6ZHR1?=
 =?utf-8?B?NzU5eEw1dnhxMmNWYWxCREgzK2ZrL1FUaFd6cjdpYllGUHJaeVNFV2QvVWxI?=
 =?utf-8?B?eU9jdXZBdW83bHltMlJvRE5HWktQT1JlUzJrdG94alZ1SnJRU0tZU3l4QUg3?=
 =?utf-8?B?eFJrY1hjcWVLQUN5S09MYnJER2pIOFpZN0VpbnNqYm1yR2UrREhUUzEremZs?=
 =?utf-8?B?QXBrSGZ3NmdNVEZNRWlPZ3JYYkN0bS9vcC9aUWpERUVGMW5CTUhpT2JGSlZM?=
 =?utf-8?B?UFpqR1JWU2FtSDRXZXdUYUQ2WUxyYmdJLzhKSHh1eStoWjZOUG5iVENSeS9w?=
 =?utf-8?B?bVNYUkZxWW42V1EwMksvalhsaFNaL3YramlwL2JnTmh5RnpPQW01am9kRXls?=
 =?utf-8?B?VkdzY0YvV1UwaGNKQXF2K0hlUVd1c2JWL1I0ODFncnRSQW1lSFBJVlRCenps?=
 =?utf-8?B?MlhDazNvYlkrdWp2dTZqQWpSM2xtZ1RQLzY0RzVMdzA5Z2hDMHJOUnQvL3Zq?=
 =?utf-8?B?QU94cnNWWXkwd0VFZlR5WTZBN0djdDhsU2ZwR3c4ZU9OSkdCaHFVTWJkcE9D?=
 =?utf-8?B?VUl3NmtsZ3ZJZHlRdlNwQUY3NUo0bGJWbDV2ZXFpeGpxVXRhcmk4ZzFpSGt2?=
 =?utf-8?B?Y1AwcGRMeWt3Rk1EV2xYcSswc0F2TjhtbFU4RVgvQ1JHS041YnFNRU1rc2ZK?=
 =?utf-8?B?empncHQwT1RsTnRzWjg3ZmRnalY5aCtsZW9iYmtCemErVVR3cGpGcmhIYnJu?=
 =?utf-8?B?TXlQSTc4d1dERlF3V0Z4UDJSb29vWlYwV1Q1bmg3dU9Yd1RWY3ZKMy9aR2FH?=
 =?utf-8?B?U2dnYTdLS1VYV2NZVFhzY2xKWmZtdVBsVXhKdGgxSnJLcGlxa2R2TkhFTEJv?=
 =?utf-8?B?K1FENjJFRW9lMzQvclBiSk1pS2N4cXNpMFNZcUplemNDcXBpWHg4YTI0UHRZ?=
 =?utf-8?B?U2dzKzdscHRJZDZtVTlYSmtoeTVoUDd1bi9KUXh3Y3U0OXd0QzNycjQ0bWUy?=
 =?utf-8?B?WkJaTW1GN3Jhc3k2QUxDeTFmTnQ4MUlZZS9McWtjL09Fa3JOcGt1ck5MM09C?=
 =?utf-8?B?VnhRZWM5NFlCNDlKRHFlRk43TlE4eVk3ZHI0d0Q4ZjhsekZZa0RXampMWVE5?=
 =?utf-8?B?bmdLSk9SWmtMWmY4a0FERTFxUXhUcnlRek5LRUdKak54aE50Q3RsZjBvcXJP?=
 =?utf-8?B?OGpTS3ByZDVOdnllZnh3Y3BxWEViT2pWQlRsNUlMckI5VmhVK0piWW0vOGw2?=
 =?utf-8?B?YXg4bnB4VU5kczlzN0JlbFI2azJtT2E3Mm5TSTB0WmMxYzNWUUtlV2xrOE93?=
 =?utf-8?B?T3hQTGo3MisxUXNRNi9GY21qSC9XQWZnRThzazdMVUVrNm0zUERRRkptR1FQ?=
 =?utf-8?B?dlEyNTR3U0hKSVNRdUZDc3h5ckJKbjE5Z3BsbVd3SHhyUEc3RUVodTVUeHp5?=
 =?utf-8?Q?xfGoODD6E7i2rwgK8o9AfpqfahPynr5+uawj8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXpucGJ1dmNlaXJ6b0RzRmI0OFFHcndGVkpuUzhnZ1RyUlNIRVMwK0ZISmgz?=
 =?utf-8?B?aFFtZHJmckcvN1JSMnJUSC9jVDFjdzRNZndSVXZOSzlSKzVQNHh5VnprelAz?=
 =?utf-8?B?NllQQTd6NzdWZWhJU0dHNVN2Vi91bHNoZW44Z2lOa2pYeitySEpZcUtKTHB4?=
 =?utf-8?B?aVNYVjJXdUQyR1hHc2prV2duemN5TSszdW9OUStHOWw5T3pBM2VvRnd0T1Zu?=
 =?utf-8?B?a2RWUkIyaFp0YTlESUtPNW1tWmJUcVZuazlHWEt0NmJOeWVkcW0xQS9sZ05a?=
 =?utf-8?B?VGxMT01BN3lZVEdJdy9LNVI1SHpkZGpKQUg3VG91bEN1am1MRnJ1MWUxNyt2?=
 =?utf-8?B?d3B0THdZMmNmcGxwUnN0b1Zkd3dVeDR2d1NWclJpQ29STGVSeUUvdXRNUCtJ?=
 =?utf-8?B?VnUwbmtxLzNPRldTdmNRK1c3KzNMcjNNRFRlT05Oc0NMZzJ4L1F4S2FEWnM5?=
 =?utf-8?B?eHE3V2FrdC9NYS8zNzVBeFhKSFYxRGxaWmFZM1o0bmlJTWM3OW9tYXpBRnBJ?=
 =?utf-8?B?d0VseFdtcUxGbG9oL0pVZEY0REE2UWNCeWFNbTVLOGFlc0JtcEFwZGNTdUdD?=
 =?utf-8?B?OXlUN1dYVHpudENGVGQzTzhXUExQdU5Rb2Rla2NqOTBEOXVLM0VDSnZ0dFdi?=
 =?utf-8?B?bUtQcmpsVWhNeUZ3QW9WalFtUFBaUFJPdmIvbmo5dkNjaWV4NG1rVnlaU045?=
 =?utf-8?B?VDRnSW1IdDk0SUZlUVRNS21HU2JUQU5HdHZETkNUak94ZktSUTR0b0hhWmlm?=
 =?utf-8?B?YzU5bWd1NGl3ek1oejNpWjZmOTFEbVVCdkNjWkJLSVp3TUI0ZnloaFFxMWJo?=
 =?utf-8?B?YUpuWXRjV0lFa1FDTXptYmdFbU5lWE8wa25EMFVTK3JmZTYyb0M1Z29yYzNQ?=
 =?utf-8?B?WkR2enEzeW1JL2Ivb3pycEd0ckZqaGdOUHhSTzNTSkZtQ3FsZSsrOVNoZzNC?=
 =?utf-8?B?cHZKeFNIQ1NBU3dWYks1OHNKZDN2RGlkRkYvTG5hRjFLZWVwZ2Yzd0RFTzl4?=
 =?utf-8?B?V0JwbUphY1Z2Z3RRU0U1azdyNU43cE5BWHp5V21QTU5PdUlRN0tiVlJ5bmZr?=
 =?utf-8?B?Q2l3SlNuaW9peWZJMEV1Z3JpQTBJK1BEU21tN09JeWlydURsTmVTcExNQ0wx?=
 =?utf-8?B?SURmRC9aU2lpM0xRcGp0ZkZMM29FR0FxeDhIOXpzVjA2WjNFY3JmWnRUeWJm?=
 =?utf-8?B?ZUc3VEV2Szk0UWtFcmVveVBYRE1FUUxBV28rUXJ5eVVtZVAzYTludEd4Z2hN?=
 =?utf-8?B?UG9sRzJLZXBsT1RaN1Vpb2ZwU25PQkFNbTZvUnRsWDYzam1PQW5BcldvQlRo?=
 =?utf-8?B?cVRjdzU4aUdNcE1VcDdnMUlWQVUxaGJ3Q1hIMjhDRXJibVFnN0tMTXhEUSsz?=
 =?utf-8?B?bzRmM0pYNzNtMjdxcHM5TjQvRjNtTUp0NThRbTFIU0hXMTdNRFE5TTQ3TjVt?=
 =?utf-8?B?ZHhEbDlOV0x3RUc1Vk1SaHZ1RnJTaHYrcW5VeEZpMHBaZTdwd0tlOElZYllD?=
 =?utf-8?B?aGNyZVZZeW5RWS9MbUttaVhDVGdPeEFMWmhVaHIrMDRmTlBmckxYcXRzNlVv?=
 =?utf-8?B?b1NiRGxud09rNitHalVUK0Rxdk8yUnJyWFNQK2FEUkxXMU84bXdMQkRYOUFw?=
 =?utf-8?B?Qmg1L2FoOEsxUDVLNm5UZ2lmWWI1S2tVbVpWKzdGdG5Ya1BVOStRdGNPSHlO?=
 =?utf-8?B?Ylc4UVpVWm1iUGs3ZXRMRFcwWEpHeVdna2M0ZHJIS0k0ZUx0ZUJvTjZiOGUy?=
 =?utf-8?B?NXIyc1VERkdzMkVhR0xIaEZrM1ZmUnk0TXFFdVQ2S3o4MHdvU1c4WEE5YUx4?=
 =?utf-8?B?eWVVc2g3eWhZZmg4UDJNRXcvZm9aOUREM0xBTjVpNHNzSUJtUXhZTU5ZOGI2?=
 =?utf-8?B?RFdGUDA5cTkyVVhycmwyY2JuOCtYSDU5eFBmT0d2UUJDK3N2ZE1aZVRaSVRV?=
 =?utf-8?B?RGVCd1MwbXVEM3VoWm1EZTNKa1ExNER3L0xjZk9LeEE2TTU3YmllM3c2Tkdi?=
 =?utf-8?B?Y1IyM29iUVpuV0JLTlVGb1ZsRUhZSm9sWnlqK3Q1dUZUZXYweXp4U0tTa3pL?=
 =?utf-8?B?ZlcwWjN6dC9HSHFLamxRazVZbk90YUNpS3BXTlBocVNQNGE1V2Z1WlBUWWZl?=
 =?utf-8?B?NXNmY3ltSWkxWmdjK3RKRHd4bFVNMThYQ01Canl6ZlFpU0F2ckhNNUVINWFP?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a9e652-7672-4e22-f2ca-08dd132708dc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 23:14:13.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHxmoj2/xJ4BnJ+jOdCjwesjxyYBCFOW0G1CudQrj19yjeVqEjZv4+3/ioAlHpqJuR7rfcB6RXufc3wJLN8XI0xy2h/aLdB4RiaQ0C86CLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
X-Proofpoint-GUID: nvrVjL6A3BI-sY0PDMSiwaOCO72y6j4n
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674e3f4b cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=XwJmCy31Httg0sjnZqoA:9 a=QEXdDO2ut3YA:10 a=1UCzxgSnBtOXEjG9nCkA:9 a=GyDth81wZ1oYj9sk:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nvrVjL6A3BI-sY0PDMSiwaOCO72y6j4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412020193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208161

--------------0K4WhSp0DcvC9mHFOE4dBLKj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-01 11:35 p.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> RISC-V offers several virtual memory address schemes (Sv39, Sv48, and Sv57),
> but ASan currently supports only Sv39 on RISC-V64.
> For RISC-V64 Sv39, ASan uses custom allocator configurations
> tuned to manage large allocations efficiently.
> These tunings are incompatible with larger address spaces like
> Sv48/Sv57 due to differences in region sizes and alignment.
>
> For riscv64, Asan's tuning for Sv39 can be enabled in qemu
> by using the appropriate flag in the command line as shown below:
> runqemu nographic qemuparams="-cpu rv64,sv39=true"
>
> Additionally, the COMPATIBLE_HOST list in gcc-sanitizers has been
> updated to include riscv64. All necessary tests were successfully
> conducted on both hardware(Microchip PolarFire SoC)
> and the qemurisv64 environment, with ASan effectively
> detecting memory errors in both scenarios.


Hi Deepthi,


Nice! Thanks for confirming that the qemu command line option allows 
gcc-sanitizers to

work without any code changes.


One concern is testing: testers would have know that this flag was 
needed for gcc-sanitizers.

You could add a comment or documentation note as a hint but that doesn't 
automate and is error prone for people.

I did note that "spacemonkeydelivers" (!) maintains that :

"Indeed ASAN was ported to RISC-V when Sv39 was the default addressing 
mode, and changes to run it in Sv48/Sv57 must be made.
The issue is related to the way how the address space is split between 
stack, heap and shadow versions of them."
https://github.com/google/sanitizers/issues/1707#issuecomment-1852404560

so I don't think we've gotten to the best possible general purpose fix 
but rather a (helpful) work-around.

I don't think we should merge this since there's more work to do for a 
proper fix.

../Randy



>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 524ebd4ba4..8c98e9cf8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = " liblsan"
>   RRECOMMENDS:${PN}:append:x86-64 = " liblsan libtsan"
>   RRECOMMENDS:${PN}:append:powerpc64 = " liblsan libtsan"
>   RRECOMMENDS:${PN}:append:aarch64 = " liblsan libtsan"
> +RRECOMMENDS:${PN}:append:riscv64 = " liblsan libtsan"
>   
>   do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>   do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>   do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>   
>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
>   # musl is currently broken entirely
>   COMPATIBLE_HOST:libc-musl = 'null'
>   


-- 
# Randy MacLeod
# Wind River Linux

--------------0K4WhSp0DcvC9mHFOE4dBLKj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-12-01 11:35 p.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Deepthi.Hemraj@windriver.com">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241202043514.3046780-1-Deepthi.Hemraj@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

RISC-V offers several virtual memory address schemes (Sv39, Sv48, and Sv57),
but ASan currently supports only Sv39 on RISC-V64.
For RISC-V64 Sv39, ASan uses custom allocator configurations
tuned to manage large allocations efficiently.
These tunings are incompatible with larger address spaces like
Sv48/Sv57 due to differences in region sizes and alignment.

For riscv64, Asan's tuning for Sv39 can be enabled in qemu
by using the appropriate flag in the command line as shown below:
runqemu nographic qemuparams=&quot;-cpu rv64,sv39=true&quot;

Additionally, the COMPATIBLE_HOST list in gcc-sanitizers has been
updated to include riscv64. All necessary tests were successfully
conducted on both hardware(Microchip PolarFire SoC)
and the qemurisv64 environment, with ASan effectively
detecting memory errors in both scenarios.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Deepthi,</p>
    <p><br>
    </p>
    <p>Nice! Thanks for confirming that the qemu command line option
      allows gcc-sanitizers to</p>
    work without any code changes.<br>
    <br>
    <br>
    One concern is testing: testers would have know that this flag was
    needed for gcc-sanitizers. <br>
    <br>
    You could add a comment or documentation note as a hint but that
    doesn't automate and is error prone for people.<br>
    <br>
    <p>I did note that &quot;spacemonkeydelivers&quot; (!) maintains that :<br>
    </p>
    <p>&quot;Indeed ASAN was ported to RISC-V when Sv39 was the default
      addressing mode, and changes to run it in Sv48/Sv57 must be made.<br>
      The issue is related to the way how the address space is split
      between stack, heap and shadow versions of them.&quot;<br>
<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707#issuecomment-1852404560">https://github.com/google/sanitizers/issues/1707#issuecomment-1852404560</a><br>
      <br>
      so I don't think we've gotten to the best possible general purpose
      fix but rather a (helpful) work-around.</p>
    <p>I don't think we should merge this since there's more work to do
      for a proper fix.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <br>
    <blockquote type="cite" cite="mid:20241202043514.3046780-1-Deepthi.Hemraj@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 = &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 = &quot; liblsan libtsan&quot;
 
 do_package_write_ipk[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0K4WhSp0DcvC9mHFOE4dBLKj--

