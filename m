Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0900CD767CF
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 14:03:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13229.1730383391983036128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 07:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10349fd321=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VBIQ8b031196
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 14:03:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8pbyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 14:03:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtoAnxREKRyvuOzEsTkN+N5SSvjS7ZqsoEF8CdUJw+R+YrsfguZVT/BhM1tKnngdxtIdrToMl4b2/ZvCTr6yVjl7Ly/9SWAmCDLV8wkxoEnobDB3kiFMOAMhmiq1HqOvXKzHKBD2OcM0mPfm1Aua20mgsURRWGGEfg2KvZ3TbF0a4FoHvDyQ3SxsMYgGBbibCtlbzmjKsOItNKl4XR2hDqHzDzY8pWJ2M2x/nJYR9g7F+yHVMgQ8VdTwhWrmJ4b+WQexgE/e9K1oRl52jVYbQhJ7Je2+6JvtqMZ/Tj+JVIJuKLgja17KiEa0SLP5g7Z4Dc4R8ScUumKzNpGc7dsD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM0tD+HzqFoD8+Gs1BVKn1QO+DsWEPnOTK+nXmbOzas=;
 b=MQuvG5XLkfxyaDiyhJ/G39SrbA9w35B/mrSufin76qJYl66sPajXfK00+S1qRBA67v08uHAeqtmIMOSFHL8T5CvaR7liNhFRBsfSg7R4PDaeOuk7t+nR32y+ECH9Aar3GV1ID4crljYE4AHqQ4ER58TfB+ib299f4/nFe7DNHB9S+LQKnm75SfMGn+wRu2te/Vi8k24Bh9ElW882+ZPv/JhppzgIe15bfsysYmrp9gPfxEXKSsYpCU3n3od/JaHtvVoi0kvs6F/J33JoxHntCWDLd8C02EARvqmZfUo9Q8FZ0+tPQPNjCYeNz6UzfZqWDLeSuClmtP09mC8z52cBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:03:03 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 14:02:59 +0000
Content-Type: multipart/alternative;
 boundary="------------glORMFr0x20L0IZZfqV0FUM6"
Message-ID: <35d5f2ec-4281-4be1-8040-829dbbdc0d58@windriver.com>
Date: Thu, 31 Oct 2024 10:02:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cargo: Increase RUST_MIN_STACK size to avoid SIGSEGV in
 DEBUG builds only.
To: Yash Shinde <Yash.Shinde@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241030111601.284064-1-Yash.Shinde@windriver.com>
 <90fa600f-7b0a-4dc6-a58a-90997995ce86@windriver.com>
 <7a5cd559-7db3-461d-bef6-10e4545e1b8a@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <7a5cd559-7db3-461d-bef6-10e4545e1b8a@windriver.com>
X-ClientProxiedBy: MW4PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:303:6a::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: ae900696-76f8-4bbd-ef9b-08dcf9b4ba3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2VTbkNWeEpIZVZLc1BYNFE4TGVNNCs3ZytkdlgrQktOb1UwVkRvUDRWTm1t?=
 =?utf-8?B?b0ljMHA4SEFRSmtoSnVHQkl1MGhJbFREcTZuM3h1SzBZTllXM2JBNW5LclJq?=
 =?utf-8?B?Tk8wODhYOGxSamZDaUhRZ2t0NjNtSEJ1Mld3bFB4OEVPTmJteVpjV1h1T3hk?=
 =?utf-8?B?VGlCZ1FZenVwQWdaVlVkSXBSUEFHWHUwd0gwTXdQc0ErWTNua0ZUSUpWM2ZK?=
 =?utf-8?B?Sm1BaG9UWlFpL2V5VkFvaVZiM01NbmxqS3dKRXhOYjd6M2lBQ2Z5ZDVndU1I?=
 =?utf-8?B?NGlRWmdRVVZ1MHhQaUZHckovZm5kVlFhVCtDaW9FZ1FEeDZCN3ZzVFZVci9w?=
 =?utf-8?B?by94MXZkQWVEVWZKK3pQNXc5QmhsOEZlaFVYL2RKUjJXVDZkeXVoZ1FkdFFU?=
 =?utf-8?B?aER3MzVKRkdNTXhjR3BXK1lUQWNuVmFLSlZrc0hkaDZUZk1QWTlIZGk4L0sx?=
 =?utf-8?B?Tm05RFNTejVYVEJCZmk1NGZPRVpXOTMxYnhTMHMyU0o4ckJKMHhXOUduTVpr?=
 =?utf-8?B?SEdzbGV0UHgxcjJEMThZb0UvSGl2dXBPVzhZU2Qxc0M5bjJrZUgzNDRpa0dS?=
 =?utf-8?B?bVFLWFRzd0pHcXVhM29GWk5QTDM4cnBLMHZVNG1lZUpPSkJjTE9ObldBc0l6?=
 =?utf-8?B?T1VyRjJsVjZLbDdFbmJJZWp2T0hKRHpXT2EyQ04relg0elNFdlpVU2s0MUlx?=
 =?utf-8?B?T3FVRGxGK1RIbWpBRzd5RlNPcDhFVWllbURqcFRxUE1XVGpIY1Q3amxLQ0RV?=
 =?utf-8?B?cDd5a0UxUU1pQnpqU2dyZS9oSitabWd0NzhTUkNGYU44OEFPVU9ZL0s1MUVu?=
 =?utf-8?B?R1BJWHlpR3hsV0RTRnMrTjJYWDVId3U4UUJqSys0WlBoUjFtK2pXNSt4UCtu?=
 =?utf-8?B?ejllNVB2Tkh0YTJNbTBlMnVMdFNBdlk1QXpnZ2lZaG5YYmYraGZOeml6NGw2?=
 =?utf-8?B?QzJTK0xWd2J4V1lUdUJKdnZ1WWRzUUNYUHVETFEvTTFSNW54RlpuakU4cU92?=
 =?utf-8?B?NE1ITEFicnBYQlFKSlhveFNRSE5zR3lNUHdSY0NJRXg5UTJNaVBzUyt2Ryt2?=
 =?utf-8?B?Z2ZFb1Vud3hJNGhsYk5pWnh5UkdnTTZuZWRTcTRHWnZMSmNuZHRVVDdZYWlk?=
 =?utf-8?B?OHpGQjJKUnVzZzBDbUpWUko0dEtiYWZob3JIYnZEM2tRVmJKN0RuVzBlUXB6?=
 =?utf-8?B?OU9vTFZUeGtNNkw2R1NuZlF2VnljMm9vb0pIc3ZDejdOYVpNQnYyYzVKUVFC?=
 =?utf-8?B?Yktvc3FmbXJiMlNvVlhIQUVEUit2UE5YY3ZSM1ArZlhjWVNtOG9HWjI3OE9x?=
 =?utf-8?B?d2FoTlRGcEZNZlZlTTQvTlJTa0FzVW1OSnBPZGpENGJzaGpPek1VL080S3U5?=
 =?utf-8?B?Zmg2SW5jMjh3Rks4VFVubElUTTRyWnFVdlYxQXU4VWxEWUtIK2o4MUlNbmZ2?=
 =?utf-8?B?TWJNSjBkQmRHdkdTdG9lSmF3YUU3WVpKTWNGc0JqRlhzYnJTeGFqVkR0ampp?=
 =?utf-8?B?MmorcDcyMDhQaS9haTJ0cWdrZlRtc2VVZXN3bGNxdHVsSDFZb0pxL1lteXFh?=
 =?utf-8?B?QVFZTUY3MFJoRU1haG85K2tYRTQvT1lxRDFteWFxdkdtRGIySzVJdWpxZXhH?=
 =?utf-8?B?NWNlVE5JTnhXSXhuYmtBRmpxRUhyZDhuWmwydERQYmloRXFCUDlzTE5SVmYx?=
 =?utf-8?B?QWhka1FsMWFGVVJNM3dZbkNGcmp5cW4xUndSN2lRSEp6M0lYaVZmMUR3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGZoMUpJYmhQZjhqYXpYMlduTVhDZ1F3bHJJSTFPYm5PRGErY01yWjh0OU51?=
 =?utf-8?B?Q0RBVEZNUHBWdzIyTDlvaHArV21ZTWpGZkZqVkE5WmF4dWsvSVRhMXRuRFJ5?=
 =?utf-8?B?MzRXRWxENEwwQVlHZGZoWmhVVGh2c2xiUVhWeVhtY0lwRkpkRXorMWtXeUNT?=
 =?utf-8?B?SXZCdDVnSm5CS3oxMUEvUzdONGJvb1REZm1VTUt1LyttTzh4RjEvR0xqNnRQ?=
 =?utf-8?B?b1NvcFQzaWlhaUo1SmVLWHZKWHZDakV5YXkrQXhiYmRtK2hGT01COElFNDY5?=
 =?utf-8?B?OUllMnZjQjEvSElTaHFWNCtESFk2SlA4VUpmUUh5bzc2MVkzVnhpdWR4K3M3?=
 =?utf-8?B?QlJmd1NyZGllUHI0KzB6TmJJanNqb0pPNGhuSkRTZFFOVU9QaFoycVFRUm50?=
 =?utf-8?B?em8vaURvVXl3a2I5RFRwRzAwcmF5akxGNVBVMENIaForOTF5M3V2VjU5WWRW?=
 =?utf-8?B?MGdtZi82OGVkTHltSGJacUJJMGY4RXNIMVdNWFdYdUZZRWJCM2VmMHZqWUo0?=
 =?utf-8?B?YyswS3FoMXU4UjNXYVFWM2pQRFBwampXK3lrSUJOdWRRSVo4M1J4MjJkSGZC?=
 =?utf-8?B?eWdLUXpRMmZKRktjYWt4NGdScjRvcmlQMmJ4TjREYlR5b3hPaFphSnJkcXN1?=
 =?utf-8?B?OHk4MVZTNnlIc1plOGkwNkJZQTFrckhVOUgvVTRlM2hqSitTNjNQQjQ1VmpL?=
 =?utf-8?B?SHJMYmpONG9FZXc3cGUvYVc3R0xiWFlaaTNVUDVXQ3JvbmhmYWxMTytMMGls?=
 =?utf-8?B?YUdxMzdtRTZyS3ZrZ3Ara0Rqek80MFk5OTBCc09oc2E4ajZzZkQybUpjQ2hS?=
 =?utf-8?B?VktLVjdnNnp5N0tQQWlpajJDUUFIcFN3aGZ1cGhjOEZYNVNlNURpRCtPUDJC?=
 =?utf-8?B?bENqWlQ3NEtMUTU1MjBUN2ZUSmZ6UndrQ3ZvdGtEeWdCdkl6cU5xb3RUc3h5?=
 =?utf-8?B?eHRMcmloLzhJMkVuZXJLZ1VTdWo4L1llZXNHeFB0RHdkQjFicWxoZEpieXBy?=
 =?utf-8?B?QzM4ZkJrNFlMSWd5M21YbkJ2V0s2ZmEvWWZFKzgrcTRscFFKYk51dkgwNDFv?=
 =?utf-8?B?SWkwb3BWc2swUHZvOWZYUmJsNEc3b0lKajRJaGFmOUJGd3RiRHVWaENXRWR4?=
 =?utf-8?B?c0J5Q1RrMWNhb1dFam1Scm4yN2Y5UFV3TlFqdmczR1I5MTR0dnE5Uyt0Rmpn?=
 =?utf-8?B?MTEzY0ZtbWpKWXJyWUN5OHdHMDFPVXYrK3QzWng2bDIyMFdCUHlJUFRTUGVB?=
 =?utf-8?B?YnA1OTd3dEdSRUNsS0pkV3FNTmlZMWF2U2tJZi90Nmd4TUxsWTJHYVVpODdD?=
 =?utf-8?B?bVRCRzZZMkJPNkRjREhrQ0RXdXRZS0ZmcnRrYThnbVVnQ0VjYTByYjJKcmh1?=
 =?utf-8?B?VWJRZkRuclhYMHhPRS96ZmFQWGROZkl2R3NEaEZJUit1eXVmQ2hpR2lJMGhk?=
 =?utf-8?B?M0NELyt0aEZMVVN5c2RRcGthRU1HdU9ZR1I5eHNvM2F0Vkt4M1ZDVDFBTXhj?=
 =?utf-8?B?YlZjdU11dUxtY01MOHpBMzZaMnVJdHJhRk9DNGEyUXNiQTdHUTBwc0xtOVZt?=
 =?utf-8?B?dmZPQklTQjVOWk1BdHBqSTRBdktBOHR6S1VXZjg1UENSaUVGNXZSSm9pcStz?=
 =?utf-8?B?WkhOa0U2U0NkNC9XMmszdWcxK2Y2MVczVVpIMGFwQ3hET1EwTHp4bHZ4UTh1?=
 =?utf-8?B?c3lOYlFzV0tqY0RNQnlGdUFLbW9YbEhPeUFaZGpvbzFHVE83RCtndG5WSG1G?=
 =?utf-8?B?WlR4QnVhcUFPbzNCQW9DUGhmQVVnQ3hqVytISVl5MEJTM1VjaXh6MWhoWnpp?=
 =?utf-8?B?bkc5dkJwVk9IYkhrYjhBaW5ZS25iazdTbXptckdPODh3M3l6eXo0RG9wTTF4?=
 =?utf-8?B?SmdyU2JJTFBsWEtvOUVPL3A5SVkzNjBaSHFIQ01PM3hRckZ4SHpsb0hDL2lq?=
 =?utf-8?B?MXdZRnRBVFMxM3haT28vZXlsL3FTbnUrV3hCQ1JSUDRQMTVKUFJyQkNlWk8r?=
 =?utf-8?B?cDBzWGIwOE9Lbjh5NDBjMVovSEhmZWhJL2hvQTNPRzBYSXAralovcVZYR0U0?=
 =?utf-8?B?Znd6WngvemRHQURIZ21RM2N6dFhUR294OXliTHFZeGdxTFhYbldQT0doc0lu?=
 =?utf-8?B?d3RlTzhCVU5YRFVVVWFrNTE2WE13am9IQm9LdGRtNnFEVzRWUVhoRDNrTzJi?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae900696-76f8-4bbd-ef9b-08dcf9b4ba3d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:02:59.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMgeKB/MF5tS+GuCYxyjr7VLE6cX0kHM/a4hQYjvf/QKun0IMUABx6zcpaSPDUilseEFwO8K+iI7jSeqFXAxjVD9pgA75X8sm6tTrbl/pxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
X-Proofpoint-ORIG-GUID: mo6m4xZJUiWKOeIUH0Cv-T3XM_8YDPLx
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=67238e1e cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=yTTLyF7aPtr1hqTbkhoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rRKgkULkT6AQs_C555kA:9 a=k0iuYhwpGNqcQl0v:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mo6m4xZJUiWKOeIUH0Cv-T3XM_8YDPLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_05,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410310106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 14:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206586

--------------glORMFr0x20L0IZZfqV0FUM6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49VBIQ8b031196

On 2024-10-31 5:35 a.m., Yash Shinde wrote:
>
> On 30-10-2024 19:54, Randy MacLeod wrote:
>> On 2024-10-30 7:16 a.m., Yash.Shinde@windriver.com wrote:
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>> For some Rust crates, like building p384 in DEBUG mode, a SIGSEGV
>>> is encountered as follows:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 note: rustc unexpectedly overflowed it=
s stack! this is a bug
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 note: maximum backtrace depth reached,=
 frames may have been lost
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 note: we would appreciate a report=20
>>> athttps://github.com/rust-lang/rust
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 note: backtrace dumped due to SIGSEGV!=
 resuming signal
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error: could not compile `p384` (lib)
>>>
>>> WARNING: Backtrace (BB generated script):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: oe_cargo_build,=20
>>> /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do=
_compile.3262358,=20
>>> line 193
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: cargo_do_compile=
,=20
>>> /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do=
_compile.3262358,=20
>>> line 165
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: do_compile,=20
>>> /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do=
_compile.3262358,=20
>>> line 160
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #4: main,=20
>>> /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do=
_compile.3262358,=20
>>> line 206
>>>
>>> Setting RUST_MIN_STACK to 8MB conditionally for DEBUG builds only=20
>>> handles
>>> the stack overflow and SIGSEGV.
>>
>> s/to 8MB/from 2MB to 8MB/
>>
>> Best to explain what the current default value in your commit log in=20
>> case the rust devs increase the limit some day.
>>
>> From:
>> rust.git on=C2=A0 =F0=9F=A6=80 v1.80.0
>> =E2=9D=AF grep -C 1 DEFAULT_MIN_ST library/std/src/sys/pal/unix/thread=
.rs
>> #[cfg(not(any(target_os =3D "l4re", target_os =3D "vxworks", target_os=
 =3D=20
>> "espidf")))]
>> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 2 * 1024 * 1024;
>> #[cfg(target_os =3D "l4re")]
>> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 1024 * 1024;
>> #[cfg(target_os =3D "vxworks")]
>> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 256 * 1024;
>> #[cfg(target_os =3D "espidf")]
>> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 0; // 0 indicates that the=
=20
>> stack size configured in the ESP-IDF menuconfig system should be used
>>
>>> References:https://github.com/esp-rs/rust/issues/214
>>> https://github.com/rust-lang/rust/issues/122357
>>> https://github.com/rust-lang/rust/pull/122847#issue-2201254359
>>> https://github.com/rust-lang/rust/pull/122847/commits
>> Is there an issue open for the p384 crate to reconsider their stack=20
>> abuse?
>>
>> If so, please include that link. If not, create one and link that.
>>
>>
>> Thanks Yashe,
>>
>> ../Randy
>>
> The second issue mentioned in the references is still open but there=20
> aren't any recent updates.
> Also, Sundeep had reported the same issue in rust and llvm before:
>
> https://github.com/rust-lang/rust/issues/113612 (closed as not planned)
>
> https://github.com/llvm/llvm-project/issues/76920 (open, but again=20
> points to https://github.com/rust-lang/rust/issues/122357)
>
> Let me know, if you want me to send a v2?


We discussed this issue and agreed that since it doesn't affect YP AB=20
since there are no DEBUG builds done there
and more importantly since it's really a work-around rather than a fix,=20
we'll continue to work with upstream p384
crate owners to resolve the issue. Forcing users to change the stack=20
size, even for debug builds, is not a good policy
and hopefully some of the code-generation tools that are inputs to p384=20
can be adjusted to reduce stack usage.

../Randy

>
> Regards,
> Yash
>

--=20
# Randy MacLeod
# Wind River Linux

--------------glORMFr0x20L0IZZfqV0FUM6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49VBIQ8b031196

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-10-31 5:35 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:7a5cd559-7db3-461d-bef6-10e4545=
e1b8a@windriver.com">
      <br>
      On 30-10-2024 19:54, Randy MacLeod wrote:
      <br>
      <blockquote type=3D"cite">On 2024-10-30 7:16 a.m.,
        <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@=
windriver.com">Yash.Shinde@windriver.com</a> wrote:
        <br>
        <blockquote type=3D"cite">From: Yash
          Shinde<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Sh=
inde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
          <br>
          <br>
          For some Rust crates, like building p384 in DEBUG mode, a
          SIGSEGV
          <br>
          is encountered as follows:
          <br>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note: rustc unexpectedly overflo=
wed its stack! this is a
          bug
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note: maximum backtrace depth re=
ached, frames may have
          been lost
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note: we would appreciate a repo=
rt
          athttps://github.com/rust-lang/rust
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note: backtrace dumped due to SI=
GSEGV! resuming signal
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error: could not compile `p384` =
(lib)
          <br>
          <br>
          WARNING: Backtrace (BB generated script):
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #1: oe_cargo_b=
uild,
/home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_com=
pile.3262358,
          line 193
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #2: cargo_do_c=
ompile,
/home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_com=
pile.3262358,
          line 165
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #3: do_compile=
,
/home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_com=
pile.3262358,
          line 160
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #4: main,
/home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_com=
pile.3262358,
          line 206
          <br>
          <br>
          Setting RUST_MIN_STACK to 8MB conditionally for DEBUG builds
          only handles
          <br>
          the stack overflow and SIGSEGV.
          <br>
        </blockquote>
        <br>
        s/to 8MB/from 2MB to 8MB/
        <br>
        <br>
        Best to explain what the current default value in your commit
        log in case the rust devs increase the limit some day.
        <br>
        <br>
        From:
        <br>
        rust.git on&nbsp; =F0=9F=A6=80 v1.80.0
        <br>
        =E2=9D=AF grep -C 1 DEFAULT_MIN_ST
        library/std/src/sys/pal/unix/thread.rs
        <br>
        #[cfg(not(any(target_os =3D &quot;l4re&quot;, target_os =3D &quot=
;vxworks&quot;,
        target_os =3D &quot;espidf&quot;)))]
        <br>
        pub const DEFAULT_MIN_STACK_SIZE: usize =3D 2 * 1024 * 1024;
        <br>
        #[cfg(target_os =3D &quot;l4re&quot;)]
        <br>
        pub const DEFAULT_MIN_STACK_SIZE: usize =3D 1024 * 1024;
        <br>
        #[cfg(target_os =3D &quot;vxworks&quot;)]
        <br>
        pub const DEFAULT_MIN_STACK_SIZE: usize =3D 256 * 1024;
        <br>
        #[cfg(target_os =3D &quot;espidf&quot;)]
        <br>
        pub const DEFAULT_MIN_STACK_SIZE: usize =3D 0; // 0 indicates tha=
t
        the stack size configured in the ESP-IDF menuconfig system
        should be used
        <br>
        <br>
        <blockquote type=3D"cite">References:<a class=3D"moz-txt-link-fre=
etext" href=3D"https://github.com/esp-rs/rust/issues/214">https://github.=
com/esp-rs/rust/issues/214</a>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/r=
ust-lang/rust/issues/122357">https://github.com/rust-lang/rust/issues/122=
357</a>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/r=
ust-lang/rust/pull/122847#issue-2201254359">https://github.com/rust-lang/=
rust/pull/122847#issue-2201254359</a>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/r=
ust-lang/rust/pull/122847/commits">https://github.com/rust-lang/rust/pull=
/122847/commits</a>
          <br>
        </blockquote>
        Is there an issue open for the p384 crate to reconsider their
        stack abuse?
        <br>
        <br>
        If so, please include that link. If not, create one and link
        that.
        <br>
        <br>
        <br>
        Thanks Yashe,
        <br>
        <br>
        ../Randy
        <br>
        <br>
      </blockquote>
      The second issue mentioned in the references is still open but
      there aren't any recent updates.
      <br>
      Also, Sundeep had reported the same issue in rust and llvm before:
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-=
lang/rust/issues/113612">https://github.com/rust-lang/rust/issues/113612<=
/a> (closed as not
      planned)
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/llvm/=
llvm-project/issues/76920">https://github.com/llvm/llvm-project/issues/76=
920</a> (open, but again
      points to <a class=3D"moz-txt-link-freetext" href=3D"https://github=
.com/rust-lang/rust/issues/122357">https://github.com/rust-lang/rust/issu=
es/122357</a>)
      <br>
      <br>
      Let me know, if you want me to send a v2?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>We discussed this issue and agreed that since it doesn't affect
      YP AB since there are no DEBUG builds done there<br>
      and more importantly since it's really a work-around rather than a
      fix, we'll continue to work with upstream p384<br>
      crate owners to resolve the issue. Forcing users to change the
      stack size, even for debug builds, is not a good policy<br>
      and hopefully some of the code-generation tools that are inputs to
      p384 can be adjusted to reduce stack usage.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:7a5cd559-7db3-461d-bef6-10e4545=
e1b8a@windriver.com">
      <br>
      Regards,
      <br>
      Yash
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------glORMFr0x20L0IZZfqV0FUM6--

