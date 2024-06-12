Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94280C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 03:33:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2970.1718163231326158308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 20:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6893383dff=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C2pEwO030366
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 03:33:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwuda2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 03:33:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW4fW95M84z4phWtOPd2RDF1T1GYvOfTQaTy/T/flwqi7Fmd4psX6fqxex/a+zLCnPTNxSSOZGFoDznzXe76r8LWdoyWbiYZcutBwJGYKos/FwMO5ygYHK3VCfF9HFseIKq47knz+eYz/+NLWwX5QDWB9GSY8RoMFUgmOV4ck67M/FLNimCg3x7F5JmpLw+gU25D7Fyz807vi7lYbtSLOPgIox6ihVBah6HG7LvmCnl1KYxRGE05XnGGcrGpZ2eM6KSgF8HVe3t96SJhYcc/bJ3ypRAlXu/ERlyQIk+z0Z5YX8QFWN09k5lUxhTixwe8UY0q0eCRVPrRs4/eUJxe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DamomN4x3P1q3gzn4gCf0/cjhPfLfGq81yW8hnuUU+c=;
 b=AeCPq4JPFc0qddWaZlRIDxTxhf+JSfbUokORWtCayFS22wEyPQXtwJy0AdOsuDviOz73oHaochhwWXwUOP8Bs+miWmxzwC/cTPxRwG0vR9JBfhyB0+x0U7SBf23db2Br1/jGTLmpGqKCyJrSy9BeXwZ4T73vBCNy5hn3ZAqR66FoK8uG8npog1Bj039HQV2TbMHY9ZcJdefyWkspEZ9CcLShrEcOtjnFGNtj2lPQCFj16jTXLqgaWFbKCS0DkvMrs8WiMrn7ioZqsbHTAlFI+NSHnObYKOUAXZV6X7CnRCLQAXF8XVbBEcdXUxDV+pMfynI2VVDm1T1uaNjKmyKUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH0PR11MB8191.namprd11.prod.outlook.com (2603:10b6:610:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 03:33:45 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 03:33:44 +0000
Message-ID: <78c5ff92-ded2-408f-b227-7ef51b609dbd@windriver.com>
Date: Wed, 12 Jun 2024 11:33:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/1] quilt: 0.67 -> 0.68
To: openembedded-core@lists.openembedded.org
References: <cover.1716788929.git.liezhi.yang@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <cover.1716788929.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH0PR11MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 540842bc-ad12-47e7-a6fa-08dc8a907644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NmlDQTYwd2ZwRDJKeVRIaWpPSThzalZwK3hjTUdaeGdRS2xxSmxGdVZOeHow?=
 =?utf-8?B?TjNwS1NIWmJKVytZZ0p0RjFnZlMrd2hjSGlzM1RMbmVIaGIwTU5UenUyY2Rh?=
 =?utf-8?B?SzZWb0o0ZklYRVdaK1JSK0I5cTRFWStEMVNCSXBIL0Z4WHF1ci8vbk5ydzla?=
 =?utf-8?B?OVp2TXVpeGthQXl0a3ZJdDg0RWcycy8wazhrYlJCSm9SQTd5d0NkQ3B4ZmRF?=
 =?utf-8?B?eUtzUC9rU2dVVTZtZU80MDY0K2JmUkFFYTlxTk1mOHRxWE5JcnRGbUxpUXRs?=
 =?utf-8?B?bm9QanNkMS9QeTVEb2dxeTZGYnBjbnVmODVUdU0xNThiaFFMNWRYQlBDeVhN?=
 =?utf-8?B?L0tYWCtYallyWWJUT0lCeFFIcjZzTW9Gb2NtbkJtOFA1MmkzRElpRklEbVhS?=
 =?utf-8?B?V2t0Z0t4emtiNlJrNG5KRkdqMWdDK3FyK2QrUHdMWXJTSGk3eXNHcnNhREI0?=
 =?utf-8?B?V1REVDF1QXdpMXd1WTkyaVFCVUIvNUQ4T0JweXJBak9DUGJJcUZBZDJiVXNI?=
 =?utf-8?B?WnRmLzc0VVBhbDZHUVdyOG9GZnlWYXNlV1lic2xZem1GRmZOd0Y3V3p1dWQx?=
 =?utf-8?B?WGdLTUdwZkNROEQ4VElxUmJiSXRkNzZtVUdDWkozbnB5TC9WWHBOSGdsMElN?=
 =?utf-8?B?MjltMzVJbTdGREUxTTJyS3ExT0tidEdsck9kdzhGT0lJNU5uTGtTSU9POWV1?=
 =?utf-8?B?QU0rbFFPaCtld3JGTHVVS2NTbGRzQUY3RVNGN1oyUmtGYXV6SzlMeWh1OGZr?=
 =?utf-8?B?RWFvWlhocWR0V3VucGkwMGk1WGZQa1BlRC9MQmpidHkxTkhPSXNGVnFTTVBp?=
 =?utf-8?B?dFF5bFRTL2lXeCtQOEl4YTZzNFlIWDExbjdzSDZwbjFxSDRCb2d3eDJ4bkk5?=
 =?utf-8?B?M1VVR1NqYlVBaXpWVHpzRVpMSE91eWZUdEtMU1FNSUt3ZVRJU3haRHpsQU5S?=
 =?utf-8?B?SHlpYTdBWGNtR2FEQWNDLzBsSFBQc2M3SHdjU0JQNXp3dkJPSkdTbHUvWFJD?=
 =?utf-8?B?VU5MZ0JKTDhVeS92bVpIdTUyOC9xUStNUnM5NGM2K3owWDNqZFRZdURJVldS?=
 =?utf-8?B?azhEY21hZHVNK2lUNGZFdk91bk1iVE5EcTF1R2NyalZ0ZEwwbFBBYU9aS3Q1?=
 =?utf-8?B?aWZtcVNsQzc0dUxiUGRXNnI5VTdDRS9lUEZ4c0EzS3BaeTdxSjJZSG5IMkVH?=
 =?utf-8?B?Y1VvWXNuc0tGTmdoRWpJdndMaHdHcUpzK01XRjlwMnBzalpZQXd1aGxPOGxZ?=
 =?utf-8?B?cEdsK0FhS3lkY1YxL294cWo3Z2lhL1JyV3FmMVZ3c0ZpbEZ3QnFwUWI2eDJF?=
 =?utf-8?B?ZmtiUEZFY3o5cmpBZWdCcCtqZW14UXZJQ0Yzb2JpQVVOVUNOTDU0bVMzR0R0?=
 =?utf-8?B?eHBLT1FpNGZ6bFBzbzArQUFZcjJDTDNueGVFTXU5Sy9NNU5ZWEdBV3dacXRV?=
 =?utf-8?B?aUhiMUFYdDRycEYxV1drUWIxYjloTTN2cjhGZHd5SGhVVE5OZWd0emJUQVF4?=
 =?utf-8?B?bDhKMkN1NjJGZnhXN1BUM29NZjl5alhVRkNscG5wVjhYSThLYkpEV1lYTkZ5?=
 =?utf-8?B?WVJaT00zM2ovOS9XbmJuK2lkd1J2RThscDZDb29VemJ0T1BPdFhrR3grMWRm?=
 =?utf-8?B?MUQzbUU3R2hsWWthV0dab3YwSnQwWUZTRSs4ZTBRUVBybkx4SG9rbmlMVFk4?=
 =?utf-8?Q?V0QACq1qhIrhdXDVGzHD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zi9qUEpCZnFRc3FySEUwVXpKWTFwZXRNcnAyQXhRSTFrQm5RSDRpN2FXaVNj?=
 =?utf-8?B?SGtoYytzM3FBTkRGLzg5QVNqRmdPV3dqNjFYeFR1Uk90ci9ITkQvSHM0UVpH?=
 =?utf-8?B?dmZnNS9FeGJMV25ZRnhLUzZBQVZPUk5tazN3OG5ScWtTa3pwOGFJTGtRck5I?=
 =?utf-8?B?NDBNT3hBV2Z1R1hNQng5QmtoVXQ2ZnY1TmNCR1M2d2h0UVRzMlBBR3ZnelFI?=
 =?utf-8?B?OGVFYllSK29VVjJGR01mZ1hCNmlTakZoankwdU43NW9NNmVOSDJOWi9NK2V5?=
 =?utf-8?B?ODNISU9ZNDcvaEFRVlZYWWw5cmNVWUJWSlY2VVg3a1p6Vm10TE9BM3pGdGxE?=
 =?utf-8?B?YU4zQzVUbktZZy9aMGo1Z28vcFdtb05idkd5cXczb1lmWTJrdEovMm9WWGFQ?=
 =?utf-8?B?bktncVB1cHNHNWhUWFJ4eVFjeGxEUDUxM2Z3NU13SXpjdUZtVzVlY0o4Qkdu?=
 =?utf-8?B?c09WWFFqQktPbDZnZDNvWjgrWXlGcTg3T0RNMTNDemxxSS9CTEt2dXRpVjY1?=
 =?utf-8?B?SXErZG8ybGxQbThaQjZSenZudEw2b3FyeTl0VEY1NkJNdG5ZM1ZvUDd2MlE5?=
 =?utf-8?B?aDlkc0JHdm51TkQvQmpEenpQUkpjNnlMSnIrOS8xQWlzUWRwNkVVdE5WL0Qy?=
 =?utf-8?B?THJpaU1obGVQK1dkT2g4TnpNcjlsY3Z6anZ6TFdhcnpJam1tWC82ckE2dnpu?=
 =?utf-8?B?QWhkellMR3lSK1lad3Rpd0FEcFJQaGh2ZzdLNGl2T1VLSVkyN1BieEV1NGpF?=
 =?utf-8?B?dDlIY2tQUjJnUzl2V3VkRFZFWE1RM1FKLzlRMFZNWW1JOEYzWDl1MzdjYmRn?=
 =?utf-8?B?NVhPakJCTitwOU9vZVRmN3BuNXJnN24vUm1yM1FkQVlIdWltWkg1SG9tMXM5?=
 =?utf-8?B?UzdlTEVEanViczJEaDJWbzhHWVMyVTRmaTlDL3NOMGxEaWtBUlJ4QUtwRk96?=
 =?utf-8?B?cHRsTmRsWDdvZzllN2NOeGpCSGNIaDFqVmxmTTlYVkk4ZG1hSkpvdnNTZEdo?=
 =?utf-8?B?cFRvNzh6MkE4RjI3VWJZSlBKZnFiTUpqK1cvWElVb2xxMU9zbUVwZjdMblBC?=
 =?utf-8?B?SWN6VkpNeDJMMTlOa21ZZWlNZS85ZlYyVmtNZmRTdGpHT2xacTkyVFRZUXp4?=
 =?utf-8?B?V0oweE94UEIxeS9PU2c4WG81N1J0RWdFc3JRUVp4Q1lsT0hWNlhZTS93VU41?=
 =?utf-8?B?RlBLQndVTUIxTGtLbXMzZUxWYllKek44Q1MzQTNBL2JNdEVNTWtncWE4RzJu?=
 =?utf-8?B?dUduUmY0VVhCQ21Uc3VNSzZaREQ5SHZSaEdsZHVZTy9IcUh2NnB4VFNTRG9Z?=
 =?utf-8?B?U1JTSjJ1eGtub3djalBOcGRIc043aXpzR3k4bHpKNHc4L0tSaSswYnRrWFl2?=
 =?utf-8?B?T1NkN01JcEE0RUdSaFVYOXBnOEhxSW1FTDJuMEhXbE9PMm5NVldMeGRjY0dV?=
 =?utf-8?B?MzN0VDdRMHBqeW5VTjdhekJMTVlMYUpCRXZjK2dWY1VSRUFKeWt4MVpoNUtX?=
 =?utf-8?B?V3FOT3lwbERzZzNzenhubVlFRVBFNFF2T1dBdEdIVFZsWFF3bDhTOTAyM0hF?=
 =?utf-8?B?WUVtanlLYmdqWU9FV2M4QTduTnhQRVRML2tNcjlYNStNeTNaR1hwRXNuOElP?=
 =?utf-8?B?RTQ1TVo1ZUJ1ai9aeFhiVStvejlac3FYUG5hallZeUtuVkJCazlPbll1ODV5?=
 =?utf-8?B?dWtHUDhxTjJTOWJoWk53dDJUZkNza3BmQUxSR0FvL0pmTEV6RXIrL0sxbXNG?=
 =?utf-8?B?SHJGT2lOQ3E0WitMZzI5T0dUNmt6Z2FhTUJRdWFkNGdZdVN4NzdYT3Y4dHhy?=
 =?utf-8?B?NTNzNGVNcXRsUCtOOXRTTnFEdDhjcHp6cUlmNHNya2pnQVQzbjdrNmdsT3U0?=
 =?utf-8?B?L2NZRzJWY21VcEdtcjB0R2hpanBhZDFzVjk3TlNjWHoxK09rMWlSVjEyM0ZX?=
 =?utf-8?B?VUhLT2JycjB0OC9mQXFuSTZPU0FkdzZpZDc4blhCemFvWHlFUXZkdFNKRHJQ?=
 =?utf-8?B?cEhWeXZKM3EzSis1TnM1MnhXQWkzVFBEaWI2UGxsM0VXSGtmb1NWSGNEQUdI?=
 =?utf-8?B?eVZuYThZa0FYdDgvbVRPekRkWFBJODdrQ09iYnR4VkhDMFNnb0M3QlZpdS9a?=
 =?utf-8?B?RmsyTVM5cEdDcjAvQ210bURSaGNiTEdFbEtKT1FnZmRIcVdZbTNqZHJVOFE3?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540842bc-ad12-47e7-a6fa-08dc8a907644
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 03:33:44.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqJuTWtu5Eqm5BU8C2EXWJQM4e56n/DCFiTw7aonqMw4uvloDRpw2rHhVXnsznsssThI2ZG8d2C6x4NIKnuoV1lZ+QrKYdbyXzFiiMco2Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8191
X-Proofpoint-GUID: jbeAHMTh9U677kEPp43Xs6B6Vm5MPDYi
X-Proofpoint-ORIG-GUID: jbeAHMTh9U677kEPp43Xs6B6Vm5MPDYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=942 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 03:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200560



On 5/27/24 13:51, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> * V2
>    Add coreutils to RDEPENDS:quilt-ptest to fix ptest error

Ping.

// Robert

> 
> * V1
>    Initial version
> 
> The following changes since commit 1187a460c2608369df8de08fe52a5542e4ab6ecd:
> 
>    oe-build-perf-report: Add commit hash link to chart tooltip (2024-05-24 16:59:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/robertlinux/yocto rbt/quilt
>    https://github.com/robertlinux/yocto/tree/rbt/quilt
> 
> Robert Yang (1):
>    quilt: 0.67 -> 0.68
> 
>   ...lt-native_0.67.bb => quilt-native_0.68.bb} |   0
>   meta/recipes-devtools/quilt/quilt.inc         |   7 +-
>   ...t-Fix-a-race-condition-in-merge.test.patch |  48 ------
>   .../quilt/quilt/faildiff-order.patch          |  41 -----
>   .../quilt/quilt/fix-grep-3.8.patch            | 144 ------------------
>   .../quilt/{quilt_0.67.bb => quilt_0.68.bb}    |   0
>   6 files changed, 2 insertions(+), 238 deletions(-)
>   rename meta/recipes-devtools/quilt/{quilt-native_0.67.bb => quilt-native_0.68.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
>   delete mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
>   delete mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
>   rename meta/recipes-devtools/quilt/{quilt_0.67.bb => quilt_0.68.bb} (100%)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199896): https://lists.openembedded.org/g/openembedded-core/message/199896
> Mute This Topic: https://lists.openembedded.org/mt/106325977/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

