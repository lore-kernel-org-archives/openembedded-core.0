Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A65C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 02:53:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53443.1721962423415910615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 19:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=793712c08d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q2e39P024791
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 19:53:43 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca3h73f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 19:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceL1+mnVWMtc02G2x+qqvpxQeXpKxxPb5TiY1AVUc2UG2HxcmOrYufGtOIfg46TsVHdBBOT+2FFsJ3rb1uFmkiAWPaU3xRx3TUgsyO0zox7diOOYJ5+RK4xy/jl+vsHN3ekCsZe8biLdW0gmOJjv+1l3v/k7KkWOpOz+6UD0NZWPTLPdi3pe4rCTvLE25sjbXBrsenYtRdr6228qVTOM5fEAFv+n6l6UXEXZ9f5DddYscqZzWhyGDJ/e9Bd6xJ3b/CsXw8ynkt1DRkmrGQxuPO9QNbV/F196brMllOV7veaet03KLx12nfP6f4G73ftUuBSl0FATuDZGZzGrADNNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws3O+FLXMdJvsABgzZUKxgrX+7Et7DeA0rI7xdy/JCo=;
 b=tXx7XAHUkDln3dveNBG/ECHTLXqCIaz/a02PWB9goiubdE1fg+3UEttne7vl0tv+CQgfBFW34rYPyfc/nccK/dAiK2Vlx2T6BaEDJyozV1vI8FhmovyHw0d1uQ8e6Z0GKDB/Drft4Fj70G0ZuFf55yjrgODXSd06ewvXYXaSN1mGZY/dnH+5PyP7+1mdefNt9x365zigwz2fjB2OUADBDSpTvYGd+XH9dxSF4QKhjgSlJnYWmeQM0TRHHo6qhoivkn40Gem1LXXUp8rtuskxxN9yl/PI0RibTxVzOWN3mon/jgDeGwzXleyEM+ugFCUXETzGFyGvwMUHqvIosy8KZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 02:53:39 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 02:53:39 +0000
Content-Type: multipart/alternative;
 boundary="------------ctHcPmxoM8NorgC3FfzrKCq2"
Message-ID: <f35caed5-3d61-42c4-b69a-6a0b5ba50458@windriver.com>
Date: Fri, 26 Jul 2024 10:53:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH] rt_bmark.py: fix TypeError
To: openembedded-core@lists.openembedded.org
References: <17E29394EE85C322.18588@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17E29394EE85C322.18588@lists.openembedded.org>
X-ClientProxiedBy: TY2PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:404:a::26) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bcfc51-38b1-46fa-d6fd-08dcad1e26b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dkdnZzhyRitvN2Y2RmFsaUVuM0gzSVZmYzg0aitGOXduc3ByN2NDdFdmY0pC?=
 =?utf-8?B?RTBkaFVCbURIVjNyNkpac2lDSGJETzhhMWp0YjAvMjAzeWFMalp1aDE0V3Zp?=
 =?utf-8?B?N1JVYVJIUHR1MXRIcEw4TjJJRzhJeHlKMVZOV3NKMnZ6YTcyVzQ5dXNPZ1ow?=
 =?utf-8?B?M0ZnUGVvUFA1V243TzhHUVZiaTVWNmw5MFkxQjJxNjlKZWdNMW0wSmJJTm9u?=
 =?utf-8?B?TnF0YkNSUlhKWTBPbHFMSHcyeUxBSURZeVczVmRTM2ZQZW5NeCtRZWQ1czN3?=
 =?utf-8?B?WmFFNmkwTmM2Wjc5bjNYdFpFa3JjT2p3aDJLaklZT3UwVWxZSW1aVjhCQU9Q?=
 =?utf-8?B?VXh1L2VXek01aUFDbVNES3Njc3YreUVqRjg5WWVBMGFqdlZKemRGVm4zRlUv?=
 =?utf-8?B?eGdkYnhnYUQrTGtJcWg2aGRIdjVZbFl2MWNuaENIQUxBTnd1T0VTOWJEQjlW?=
 =?utf-8?B?N2RLNWJSZTZVK2dYU2hSQXBqT0tTVkUxQmRxTFlhSmdWV29sNk1DdUZFanRZ?=
 =?utf-8?B?am54ZTV3UjlBZ1ZzMWhseDc1OExVYUErNFM2TGxrNUp6WUppZ3B2UFBHa0tO?=
 =?utf-8?B?akdHWkFrbU9yTU5ETkpwVE9pdkNrLzArR1VqNTZQeDRwUFVUWXRyN04xSnJL?=
 =?utf-8?B?VFFwc1R5a0FMZmVCUFV4bkJ1aHU3N2V6QWpXd3pkckN4ckJIQ3k3aWlQZS9l?=
 =?utf-8?B?RXRLNUNXS2VSalhZK0IyYmxkS3ltMHZ1TDEvU0VFbEx5RGNoZUFrUnZzSnVu?=
 =?utf-8?B?cG1UbEVIMHU4SytJS29SZHk3NVJGMSs5Mngxc3M4aTFxc0xZb0RvZjFUZUJa?=
 =?utf-8?B?NkltQTFlSFJWc0pHYU9zWmVXZVR2d2lXeHFCdmY1Wi9UYXl1bWlMUVBKZ1Jv?=
 =?utf-8?B?U1hXRXJiY285NC9WMkVmQW83TjhtZjlneFVkbGVodVBQbzFKU3MwYmEwbXd3?=
 =?utf-8?B?UytFeGtLZEl0Yzhza3h1cDczUmtwVTliclJMcnBSVjkzcE5wSDNUM0hpKzVl?=
 =?utf-8?B?WHc2bGllZ3hFeUozVUlSOUhYYVVjY3B2WW96RlJ4MmRQeXhJOHYybFhDS1FG?=
 =?utf-8?B?K3RaU1RseUErTFVneFJHUFVSc3VQYkswSzhaZTZXZDMxUHZsbGlxdmRtSUF6?=
 =?utf-8?B?VC9sbDFYSUZ5RDVydTFLTC9sMnlVNXBadDF1VFpDK3dTYUpnakRKSWsyZjdm?=
 =?utf-8?B?NEFjQVlJcmVucXVqK2ZzNk1sWWhzeStDK095cVZKSGo5N2dhVlhLQ3JhS25U?=
 =?utf-8?B?dmJSWTJpUE5mUjd0SHhSSVNRKzU4YXozUEdiWnpWMmN2Zyt1WXFWR2hjbURM?=
 =?utf-8?B?MUVWMWVBS0J2YnBqREN3MzdRMy85NmV5dTY4bDNsaE9xSGZHdmFGTGpQbWZ6?=
 =?utf-8?B?ajFYQU94bW1jV2V0RTl5L2toMEhJK3JJSURNMWlFWjBNYVZ3VGZaTEJaeTJM?=
 =?utf-8?B?OG8zVHRGS0ZOcnBmV2QrYlc4SC9yNnVWQ1ozNmNFODQ0MGZ3QUZzQTB5KzZy?=
 =?utf-8?B?ZVBMd3B6ZEpVYURoQ1NMUFZCQ2NRMVovcktpY0ZyajNGU1BPMnhpMTRmRU9N?=
 =?utf-8?B?ZU1NZWU1N3A3TFRKVCtObm15dDJnZjNSN3ZaclFNYXFDTnlOQXRsZ2xEYzVN?=
 =?utf-8?B?Z3djazdpQnJDekFjOXQvRi94dFk3aWRSSnFiZE01YWZLM1EzaUYrRFJBM2ta?=
 =?utf-8?B?MFRqbk95UEVsVDVMcTFwRmY2Njg0bllxR1YvVGhuS08xYXZOTVR0SXRCTHRu?=
 =?utf-8?Q?VWuxGV2/SLIHTS9MQk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0tYVE96ZmE2ckdZTmR0ZFNBbzM3V3ZwWmp4aFc4Rm90QnlVekNtM0hGWjNI?=
 =?utf-8?B?TjVmYnd2NDhQMEFSUHR6N3FjS0FRQ2VMNzdoeFFiV2RBUXRFWGs0aEJYUDlS?=
 =?utf-8?B?TldMS29KN1k1RHJUMG9meHlxeWw3eU9HcEIxM2hCNlpZVm0zMlJyaEgwYUxF?=
 =?utf-8?B?d0NDZFpxMWdqZGpxN0FwaXFrZ045WWNneDhwbzI4WnBzampXTlFVK29OWjRv?=
 =?utf-8?B?NmtRbjNSS2k4dXRVRVRKK21JckJzdGZZaVRGRjhFQTFaai9HTTc0UGZGWm1H?=
 =?utf-8?B?blRhNzFSV05IOEJoeGVGMjhTNmRnQU1ianlRU2NVaHhaOEV4N2huMkhmYkQ4?=
 =?utf-8?B?dDQyZVFuSlBjMHlrVHIxeHFSbkFRT01GSE04RGtDcFVIZE5PZHNnbTFBWWF0?=
 =?utf-8?B?VE9nQmVQWnBoU0hiaExaQTZ0VnJydXJjOEttbzF0aTlwYnFOMGJuRFpWY3A2?=
 =?utf-8?B?U0xWMmZzQjN1TVBqL1ltbUJ1cVFPTzlWV2NvdUZleHVPNHNQTjVsNUM4K0xz?=
 =?utf-8?B?WDV2L1UyYklHZnAzeWl4Rno1Mi9ZVFVDWk9MTGFPUk50ZmhaRzRsUzkyZjZu?=
 =?utf-8?B?TnMyaW1HcUFrWXVOUkFCT1J0K3RQRVljSGc4cklTaHQ3QkhHbkRTNjBoMXov?=
 =?utf-8?B?VGF2L2FlVHBMQXM1djFURlI1bFg5VHVPeUZZK0tRVmNVTFlOTnNOUWJ0c1Z6?=
 =?utf-8?B?TGc3ZGtlV0ZPNHVyZnFPWFNPS2FOTjdGaTR3V0xjUFprT01yM05idmhVUXMy?=
 =?utf-8?B?aml3Rk5xNzBxaXFrQ3ZjZkI3MVI0djVoVzVtZmxrWHM2RTBpbnZCN3FyMjdG?=
 =?utf-8?B?VGhRSzlvamdxbVg0M3BESFBhMTUzN2YyUXNJVGdrK1JMbE83eXk1TEw4dGMy?=
 =?utf-8?B?alhQZEhqTkRQRVBscVRUNVU2cWc3L3Y5c0drWFpQdTJGU25NYXVGc0tHalVp?=
 =?utf-8?B?L25mVjArdnBzdEFtNVJSeGs2SHErWWwxMXI4VmFYMHIxOTlqcCtEalBMVGc0?=
 =?utf-8?B?OGp3TjNzWTR6VndiWFJDWUU3eHVoYWlkcG1rTVY4TG1ibHhSbjBJL29DOThn?=
 =?utf-8?B?NnEyQWk1eDZXd1FMMTJOaWJ6dit5SFNRVDNHbWtObk1acTJaYkNoZjFRR2o2?=
 =?utf-8?B?Qi8rbW00WTlXRHg0Z1AyODdiR0NoOGJmMWREUXRmcVRUT1FIaG4xODdNQ20x?=
 =?utf-8?B?STEvVTJEbmhLc3h5N3V0UmQ5M0VCK2FtVVljcXdHLzlxbGJwdkl5bldNcGwz?=
 =?utf-8?B?SzZ3dVRRc0gzYUdIazBhMmFRbWZFUUwxZ3IrNVhleTlxakxvcDJ2SGpObTVJ?=
 =?utf-8?B?a0h6UXRxeUVkb3ZIRDRtR0RQczl6Z3lFV0IwQ1RtckhiWnF1dTZhdVlsYU5n?=
 =?utf-8?B?emZwbE9MRERFeFpEY1prWHBZZEJSeGx2SUxjMXJTTVlwQnZxQkRkQWNlYVF0?=
 =?utf-8?B?Z25yem9EbXk2Z2NKRlc4Z3g4a1ppU1d4UHEzcTBmZ1hDYXNNNHIyS3RJdlVw?=
 =?utf-8?B?cVR0OEdjS2pLOTRzd2tENU4vN3cvQ0h1dEw1OUQvVitxQ2R0dG1GeUdObFp3?=
 =?utf-8?B?dytnS2wzd0V3RGdOVnJNVThLdjNRQ1BCTmcvd2RqakV6b1IxZ0YyRVIxTTJW?=
 =?utf-8?B?Z1IyVHdHWVAzWjlMaW9oL2pjUW5MUkJHWnBhK2dtVjM4RjdveGExWmQzMnBj?=
 =?utf-8?B?SnYyQU1vaHZOMmxLOWI1T2RWMXJzNmpxQk13dnZ5NlNLWml6MmdtUWZrZThN?=
 =?utf-8?B?TFhKa1ZoR1oyazRiKzZUMEdhZXVjOUxHbVpXRjZGVW4zb0lEOEtQV2RyVmJM?=
 =?utf-8?B?YkpZVHFBeDdaZzZtUUlEM00xUjZIa2l4RVRkbW1sVlBUNWhibHV2cGhaSjl3?=
 =?utf-8?B?U3BsblFRUEVkTFBNQ3RsMk1uZ0VzSEcvT1F4T0tXY2FCamtRMlJGNk9BVFNM?=
 =?utf-8?B?WDZEUUY2dGNXRThVZDRuTmVTY3ZTOEtLMDVxbXppaDUvMG1wbThVUHhHeFpB?=
 =?utf-8?B?UTBKWUxLZ3daZkR6V0RreDBxQ09MLytKVHQ0VGZKa2xnZzI3eTJDQ2djaEJV?=
 =?utf-8?B?S3VKMXBEM2VobEZxMWhjK1lnd2hPTlBpdjZHVDFzK3NVbUxwd1BSQk9UeGFh?=
 =?utf-8?B?R2VNcndTZkJzUXNQYVAvc1kxZVp0TnhPamtVMEZSOC9QU3E4YU5XcDZNUnlO?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bcfc51-38b1-46fa-d6fd-08dcad1e26b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 02:53:39.0848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD7YjGorNq4gB+kpbWStemJhKP96HlOP9iBB/nwBrcmWhVDrg/Zt68xnY7SFebKD51LZITPzfR3z+rnbHsXtv+dhpmgAaggCG2AAHOrVXQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
X-Proofpoint-GUID: 0WtVrAh1J2J1fiaqfpF43hbHeshkXVib
X-Proofpoint-ORIG-GUID: 0WtVrAh1J2J1fiaqfpF43hbHeshkXVib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_27,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=953 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407260020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 02:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202513

--------------ctHcPmxoM8NorgC3FfzrKCq2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 7/16/24 11:24, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Fix following error:
>    File "/usr/lib64/rt-tests/ptest/./rt_bmark.py", line 287, in run_cyclictest_once
>      m = rex.search(line)
>          ^^^^^^^^^^^^^^^^
> TypeError: cannot use a string pattern on a bytes-like object
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-rt/rt-tests/files/rt_bmark.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
> index 2a4eed412f..5d22623656 100755
> --- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
> +++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
> @@ -284,7 +284,7 @@ def run_cyclictest_once():
>           avg_cnt = 0
>   
>           for line in res.splitlines():
> -                m = rex.search(line)
> +                m = rex.search(line.decode('utf-8'))
>                   if m is not None:
>                           minlist.append(int(m.group(2)))
>                           maxlist.append(int(m.group(4)))
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202079):https://lists.openembedded.org/g/openembedded-core/message/202079
> Mute This Topic:https://lists.openembedded.org/mt/107246061/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------ctHcPmxoM8NorgC3FfzrKCq2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 7/16/24 11:24, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17E29394EE85C322.18588@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Fix following error:
  File &quot;/usr/lib64/rt-tests/ptest/./rt_bmark.py&quot;, line 287, in run_cyclictest_once
    m = rex.search(line)
        ^^^^^^^^^^^^^^^^
TypeError: cannot use a string pattern on a bytes-like object

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 2a4eed412f..5d22623656 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -284,7 +284,7 @@ def run_cyclictest_once():
         avg_cnt = 0
 
         for line in res.splitlines():
-                m = rex.search(line)
+                m = rex.search(line.decode('utf-8'))
                 if m is not None:
                         minlist.append(int(m.group(2)))
                         maxlist.append(int(m.group(4)))
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#202079): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/202079">https://lists.openembedded.org/g/openembedded-core/message/202079</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107246061/3616873">https://lists.openembedded.org/mt/107246061/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------ctHcPmxoM8NorgC3FfzrKCq2--

