Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16254.1795787327839286358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 05:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jtwlrL6A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5791710b03=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCgOMY481821
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0lxB4+MQa
	jGXB20EhQAdl0WwqnSFq2kkdh+tQtD/LF8=; b=jtwlrL6Ad+BAnBoZOsMLOcNi1
	rl1qULkLwvzc+ne3x45M7rsaGKOvgvmBf8jM8VGaiLGxeW5+NncXy2q98i6htUXz
	wvbJsW/3pxIbJ5+04OHWMftuo9BwEG4jvuUpBQn34VGN+oFGoSifMzZX30vf3PkY
	CXbCfUS7tGpFyY/Q686NO1QTkIt2msPOl48uwlc/ctGoD0vwFwOLlxbks8mrDm7p
	tjdMyB3VhP0cZ5l4FOYb/QFtL0RoJ1STFA5OTYaWDsu7qypF8JpQ610ljXp+rqla
	C3szYJkwtw+Dp7E2mp5l/lqIHjbaeg5AXJZIlWJQ42+e01JSQ+uZeD+8EjT9Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022087.outbound.protection.outlook.com [52.101.53.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j517hfnt3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:48:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yea+kdg+bcfyNpm7eSEuOBMseKmrJZ1oIyrYJaQ0CVVfAxNQfqhJnsEpWPZAforOvOJYrK/ppNMUHm3MstaRro69+8PsUk2IMw4BxqGHHtAS1xd6E0wXRh9QFlPYEa3p9l6y05sJtlB1u6pDHLO8JyTUppoEutbsrtUB1EvrDNIPoFIOgAoePr3ciIDtOIEt73kxeuuuq3pNoDAxUBTRRX3TxInUUEy6YiM0K8kFq4DRhZly3S5L3K8S99pIysUM27ajyCPNxjqppLLIBuh7YbxzVS748WpzPAF6xQgCh8dkXXehIJlDQ0hvz32aSgUMpajLankxfzd1rP9eve6FDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lxB4+MQajGXB20EhQAdl0WwqnSFq2kkdh+tQtD/LF8=;
 b=MWfdjcqOMvNyEBnDbPqTboRKbeE5fDpiL6kxHy0svT7eR3B7JL/6+F2A83d8ic98vwfVMSfYDjuROXF6UvJaHXYFRxY3LPrq5WRdJ1FEXaHDC+ttwWaCLUSCLOjCxRz7vc8oy3k/u8QZKre5TIB4vUi53S+f4g5eszUpTAhfg8zwU3m1W5R/JL0umFQCqtoQS9mZ5QwF6lpAtydoMLazgvBc4aZfugUfgktsBJz+rVrgUQ9UNIrji+9n1dowtupQl9qEVMc8pfgEg2l/1ZJ9vexH6/G4lr+qPgh5E4MO0vQo7MXDoWpvLJTZd1rWv4suLbmN0e520B6TqZFMOj/rRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DS0PR11MB7406.namprd11.prod.outlook.com
 (2603:10b6:8:136::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 13:48:39 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 13:48:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH 1/2] gcc: Fix for CVE-2026-114691
Date: Fri, 27 Nov 2026 05:48:16 -0800
Message-ID: <20261127134817.1736030-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fdd071-532b-4dc7-c1a9-08df4c8d2498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: P4EXKMSJ28KIX/zYOXBVk5AagIClmys2vkc4jaQka/rGlDy833e695owv5rbe1D3+4Re7g44YMDy4NsCLBogsnGbZGR+MiKLf7KlPKTddyvGYmOYFjmMxQT145eFbrz2/sDDK2V0yDdyd+RyJC4TG2ojOlvSWDkekDWBMFfZAyT+Iqn+/R7mnEKZl6TtTNkkUmSnhHkLYkBmo5BAlSpz65XmUna4XjLA7aXPGWIPGlbxSc9i7EaUXzeWMMvvwW51fexCkLpkBE07pk08d+meLAiRvUj7ZqBvNXipauKw8sOSqUQ1NtLPuyT2LLNnKIi/zLI6vDcCpp+vRVdAuGsZVsrjRjFp45cdtpJ2pfIRsLFMfkh6zg6tKPvNN3JzavVCtQHdJr++EnbCkfTiczg49iyB8uBMHXm1lqz7uC1Rur5IAlygqcHxj2aD5ForTfYbn9C2VSwWPG6DottwsHRLsgIMba1Y4z/4kUxXlbXFQso8hRUo/OPy/ZS982fJM4NZtrvhmqhwyl7Hf5n8cPigb9P+nNY1zxlN5KqYZSV7XFj3o2+RrdbAcbLwbTYLkMT939YeobdQo40p9Zvaox4Q6ztfGASQOiyG1iLEOiuur1Ya+CyNw5vatknBj2OhfTS6JWVOgwnqg1+WCc8eIIsSs33E7ztL8ptTfa7ogo18v0hWckKjFP/ivEF8Bk82Ww26U8LAdvG28CGtTZ2OT0BLLl99nelegOe6q3vlqhM8nOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zh4qZ/L2H8MT5qrsrlQLwQafyE6AYFyqZ4DUEfwTXfFaEQ3KnGK2foJRc9ID?=
 =?us-ascii?Q?lkeYG8zWw2pQGDS6uPB1sQjoasT1G+U4vfOdk266x4kTBxcWzP8SAhlurkae?=
 =?us-ascii?Q?YOmEDa54ZNKDPDQL6fOht+pwTLHjMmLciJolfgtauGAhVoL209rkPxvW1sVg?=
 =?us-ascii?Q?OnU31kWy1NjqkpfdTRKW7ciSdXY3XppAHC9/0Hefykx20WnJS84Fs9/JAIHS?=
 =?us-ascii?Q?eETksO5nFglOQ7Lwyx63ceXE0DOEA72vPs6X76f4176f5mRaU+1GWatJxn7C?=
 =?us-ascii?Q?ix95YyOcQDWGsOUmrvoO6una++QR1BPYtS0C3+C52MvjbYqyu8IaGnu+/JYG?=
 =?us-ascii?Q?iL3Od0upXZYCXkcVS9bXBskBXwNzNxkgNE1zA+ODSc8vyp39gUlEaNGn1DH/?=
 =?us-ascii?Q?lopnOs2yFyfCnBKx0fdse03gUyBbOXI6caz+igOvVnWc8hX+GGTq9qCt30eX?=
 =?us-ascii?Q?WT8A1dSptFbRdkbx0eHcni4qTuD9KqlyphxHpx0UOB/EGT27lDA9AR/uVul1?=
 =?us-ascii?Q?UH11mB+QWEwCBCpYXOLfM9AFa0pAldXugbnAbk6fBT3JS9iEN8YlJmb6xi03?=
 =?us-ascii?Q?XinESPIACXUPc+vEOKmUs33Ewctzsaos9I/UtAlIs2/Cgbt4vp2DtxF+8Qej?=
 =?us-ascii?Q?e03njDPWwzEsi+kDFfPGg5HOrjXC4jVSmwjOfEMrNtKVKiiMnIvGknLyvtDe?=
 =?us-ascii?Q?135lv7k4j7uHXEeVkyxjz907OxAbtcM9MJDLGhzcJIyYkLtLb1PenhpB6yLf?=
 =?us-ascii?Q?MopRTQTcvB/KrPvrLDA9WZ74IJDmv5VrQbxPIHYxzoXfQ2aSc3csZ4Ab8UWY?=
 =?us-ascii?Q?Jy3Mv97y/mCNDGz1jB8+XnU0uizeC3JPgGCO4KrKjntRvRWejwaJ2506XZM3?=
 =?us-ascii?Q?eWVL+R12Bjqgnb8P1wMoZTcLlBrXJWaBimQxNcSxp1M1B3TqhQJ3uu0XoXee?=
 =?us-ascii?Q?1In+RV+/zy/nKXE2d1RSuBRbWALr4M8qfPaQyrZnGeHzHW+0jUn63LJ1FDkx?=
 =?us-ascii?Q?agH/QUbUfWcgie74ypRQFyLxAcTj5AI6wzjFRF8Ntjfc2mUlz38bcgqzsFrA?=
 =?us-ascii?Q?Kzi8u+JmDqQ6pwT6Zzb8ApAnmlQZAep5DFvGlxfBQSJpppjXgr56jKWJ2/3S?=
 =?us-ascii?Q?O+ADG0DsJTMcoSMr76XOSPcY4swV8ZE2ppcOtSgIqsqyTO8rVX0vzgX0McrR?=
 =?us-ascii?Q?9WtKWwf3srsOnZN5U3kW2clabSWHriraGkG7TZqyysMg5UeBpLt+rDk4Pwf0?=
 =?us-ascii?Q?ErMk3K+vOap1DCQdIbL/y74yEkyz048EkP1Z8r0a1MplPbxWqDzH5XUkUv4r?=
 =?us-ascii?Q?Kqc6c60+1rUMPE1Vf6wO6Mpyr4GfRHUrsD+z3AdvMvqOC1n101JmFFZr66Hh?=
 =?us-ascii?Q?Ay6hkVzXjWMIRkDdk0YntHiWX+kQd8RC6rp6a8zUVLmwpNaR/9Sj5pAIfkQ5?=
 =?us-ascii?Q?pp4TYrNrFXF09o0T6cG0xmBNrHI0jHyiaxY/6VOo/lrYPhYxq/A/rshcbGOG?=
 =?us-ascii?Q?OIJuXbyHjV+1MHUIk6zHwRMK2LXXxLVJEDTwkIH3JF8SCDRNZcJROB8oe7ms?=
 =?us-ascii?Q?9PKjU2/rE11ECw2S5zKhhlKIP1dzaIwpSxJveNqAxgSB1wFVhinrnhEhxwst?=
 =?us-ascii?Q?aWZ3K/V3MUMi8K2zg3UwdNcEnv8h4CxveXc4WVkuwcNmuzWXmkL61hl3Wtp3?=
 =?us-ascii?Q?0/sbQkahpJqYde5nBK1GhokQk9d4YkB1c25SlYiSfhZimqjIDpzsInS4xmsr?=
 =?us-ascii?Q?Q166o5UuQ0YqGzUuYl0HEXcQgcs51Cc=3D?=
X-Exchange-RoutingPolicyChecked: LWF93CtUnfv3/4CZpAUltvz0U8rOK2+u4hhu7v3rY0ncGq4tBgqBTEr/v3+oSEYxiiIxM52FsMQA9KBQMuGOkVvLvFFZAiXmB8dCz3xqAjvcJmRFGvJ9z+zoZnMBot7tdKuhiKt4ioxkouaBpAr+FMEygpg5IgXeD3tm9oCby/ncoqplWfRIOdTRP2fjlqHPfilzYTFkrk67FAW14fPytv+Q7gsrDseIlNTo3LZnZJpdH2anyF6HdLRDnLACKbn4K/dXdF7UJLfeEt17jZbNpn3qbSgVjN+V4rsGJlarG62STLqBz57HaHcBwmfBFCq67cPbs5e5HEzGhZL8eSgoUA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fdd071-532b-4dc7-c1a9-08df4c8d2498
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:48:39.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doSCERoaQHMhSiuqdovwuclvchXVmJeIgXhXFTka78XuIbMbT9x7BVYmx4DYCken0ir0bIJyfqCioLv1fDSpqitDJk2c/yINJ7KAkkaG8Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX+iGACtD6FNaT
 UKx5SQNMnn8LbhJoIzbHrJi8mo1WRoOQAe9kk3KN/tg+jB4wp24stLQgDky9yLpIkGMLS0/2vVT
 OIGWZs740IVXmDN0lSgpEbFuLNYz/nCRJBr4j466zJQHrVLEyKbV
X-Proofpoint-ORIG-GUID: yqO_aEdg9bs8PbozDcN9XEIxB6eulRrP
X-Proofpoint-GUID: yqO_aEdg9bs8PbozDcN9XEIxB6eulRrP
X-Authority-Analysis: v=2.4 cv=RutQvymK c=1 sm=1 tr=0 ts=6b098a3e cx=c_pps
 a=w/xsMB98MdRKPpKwYm4Ziw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Ts-6AtMENj6w9u1THSIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfXxekwUPOjZF7R
 Wfl/svbfhYKeEkYGCck4z6lpREpAVDRyJT9j+IaoQlLOsQmdQ6FiKZ6a5wA9oxx30cRwIsZdVax
 0JzAwL+2YA+yXx/Oaq9bKWoYQlUbXkTKWIm/PgkY7jMkvuU98OmmEA9RlDKpRtAA2Wsjtl4DDu9
 SHBi9tikd5dBbsDDvWoh6lMzmZJl+e48D0hTHWTrOmeRUj10zlzItxY9d30He30KRNRp/1HGh+y
 j2AKbHMnjc7dZu8ZbexI6Pgq52JHfMZ8veieNFOWu7kmX52cwhbyRdC3UwmkGY7fGQa0MXINHbH
 tBoht+B7FdyVns2bRXenk2Hdycr0peGcwxtua4G27wHF6noPGQWbhQ5WBT4Y4VW5efbZ2lwV2KN
 cv4gsnUCMTise/HB+ahgfblNpucOvQCt83bT6OcLUYVGf0WU6Vj5qH2L0gmvrVJUNJf8B7bGGTL
 orUeUXDxychPNNXgOMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251389
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix overflow in std::vector<bool> constructors (CVE-2026-114691)

Some std::vector<bool> constructors pass a user-provided size (or a
distance derived from user-provided range) to the _S_nword function
which does addition to find the number of words (of type unsigned long)
that are needed for that number of bits. If the size is close to
SIZE_MAX the addition wraps to zero and the number of words needed is
incorrect.

This adds a new function for initializing from user-provided sizes which
checks against max_size() so that out-of-range values are rejected
before any call to _S_nword.

The new function rejects negative values as well as large ones. For an
invalid range the result of ranges::distance or std::distance could be a
very large negative value that would become smaller than max_size() when
converted to size_t. This detects some invalid inputs (last before
first) at minimal cost.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-114691
https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-16&id=2ab9ded76e8714b1654260ac68a815c20567cc09

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0029-CVE-2026-114691.patch        | 293 ++++++++++++++++++
 2 files changed, 294 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 6cc9dc3344..4361fbe208 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -77,6 +77,7 @@ SRC_URI = "${BASEURI} \
 	   file://0026-CVE-2026-102010.patch \
 	   file://0027-CVE-2026-125709.patch \
 	   file://0028-CVE-2026-115456.patch \
+	   file://0029-CVE-2026-114691.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch
new file mode 100644
index 0000000000..f938979e62
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch
@@ -0,0 +1,293 @@
+From 2ab9ded76e8714b1654260ac68a815c20567cc09 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Mon, 26 Oct 2026 17:21:01 +0000
+Subject: libstdc++: Fix overflow in std::vector<bool> constructors
+ (CVE-2026-114691)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some std::vector<bool> constructors pass a user-provided size (or a
+distance derived from user-provided range) to the _S_nword function
+which does addition to find the number of words (of type unsigned long)
+that are needed for that number of bits. If the size is close to
+SIZE_MAX the addition wraps to zero and the number of words needed is
+incorrect.
+
+This adds a new function for initializing from user-provided sizes which
+checks against max_size() so that out-of-range values are rejected
+before any call to _S_nword.
+
+The new function rejects negative values as well as large ones. For an
+invalid range the result of ranges::distance or std::distance could be a
+very large negative value that would become smaller than max_size() when
+converted to size_t. This detects some invalid inputs (last before
+first) at minimal cost.
+
+libstdc++-v3/ChangeLog:
+
+	* include/bits/stl_bvector.h (_M_check_and_initialize): New
+	function.
+	(vector(size_type, const bool&, const allocator_type&))
+	(vector(from_range_t, R&&, const Alloc&))
+	(_M_initialize_dispatch, _M_initialize_range): Use new function
+	instead of _M_initialize.
+	(_M_initialize): Add debug assertion.
+	* testsuite/23_containers/vector/bool/prX.cc: New test.
+
+CVE: CVE-2026-114691
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=2ab9ded76e8714b1654260ac68a815c20567cc09]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+(cherry picked from commit 2fd8866591b5aea7098835f80ab7e176382175ae)
+---
+ libstdc++-v3/include/bits/stl_bvector.h            |  24 +++-
+ .../testsuite/23_containers/vector/bool/prX.cc     | 160 +++++++++++++++++++++
+ 2 files changed, 179 insertions(+), 5 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc
+
+diff --git a/libstdc++-v3/include/bits/stl_bvector.h b/libstdc++-v3/include/bits/stl_bvector.h
+index f190d1be5cec..24e5e7bf0420 100644
+--- a/libstdc++-v3/include/bits/stl_bvector.h
++++ b/libstdc++-v3/include/bits/stl_bvector.h
+@@ -715,6 +715,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+       { _M_impl._M_move_data(std::move(__x._M_impl)); }
+ #endif
+ 
++      // Caller must ensure the addition won't overflow.
+       _GLIBCXX_CONSTEXPR
+       static size_t
+       _S_nword(size_t __n)
+@@ -811,7 +812,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ #endif
+       : _Base(__a)
+       {
+-	_M_initialize(__n);
++	_M_check_and_initialize(__n);
+ 	_M_initialize_value(__value);
+       }
+ 
+@@ -909,7 +910,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	{
+ 	  if constexpr (ranges::forward_range<_Rg> || ranges::sized_range<_Rg>)
+ 	    {
+-	      _M_initialize(size_type(ranges::distance(__rg)));
++	      _M_check_and_initialize(ranges::distance(__rg));
+ 	      ranges::copy(__rg, begin());
+ 	    }
+ 	  else
+@@ -1553,6 +1554,9 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+       void
+       _M_initialize(size_type __n)
+       {
++	// Caller must ensure this, to avoid overflow in _S_nword.
++	_GLIBCXX_DEBUG_ASSERT(__n <= (size_t)-_S_word_bit);
++
+ 	if (__n)
+ 	  {
+ 	    _Bit_pointer __q = this->_M_allocate(__n);
+@@ -1563,6 +1567,17 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	  }
+       }
+ 
++      template<typename _SizeT>
++	_GLIBCXX20_CONSTEXPR
++	void
++	_M_check_and_initialize(_SizeT __n)
++	{
++	  if (__n > max_size() || __n < 0)
++	    __throw_length_error(
++	      __N("Cannot create std::vector<bool> larger than max_size()"));
++	  _M_initialize(static_cast<size_type>(__n));
++	}
++
+       _GLIBCXX20_CONSTEXPR
+       void
+       _M_initialize_value(bool __x) _GLIBCXX_NOEXCEPT
+@@ -1588,7 +1603,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	void
+ 	_M_initialize_dispatch(_Integer __n, _Integer __x, __true_type)
+ 	{
+-	  _M_initialize(static_cast<size_type>(__n));
++	  _M_check_and_initialize(static_cast<size_type>(__n));
+ 	  _M_initialize_value(__x);
+ 	}
+ 
+@@ -1616,8 +1631,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	_M_initialize_range(_ForwardIterator __first, _ForwardIterator __last,
+ 			    std::forward_iterator_tag)
+ 	{
+-	  const size_type __n = std::distance(__first, __last);
+-	  _M_initialize(__n);
++	  _M_check_and_initialize(std::distance(__first, __last));
+ 	  std::copy(__first, __last, begin());
+ 	}
+ 
+diff --git a/libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc b/libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc
+new file mode 100644
+index 000000000000..bc97b9bfde5f
+--- /dev/null
++++ b/libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc
+@@ -0,0 +1,160 @@
++// { dg-do run }
++
++#include <vector>
++#include <ranges>
++#include <stdexcept>
++#include <testsuite_hooks.h>
++
++static void
++test_n_element_ctor()
++{
++  try {
++    std::vector<bool> v(-15, true);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++}
++
++static void
++test_n_element_ctor_dispatch()
++{
++  try {
++    std::vector<bool> v(-15, 1); // in C++98 this calls vector(Iter, Iter) ctor
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++}
++
++// A Cpp17RandomAccessIterator for which std::distance always returns an
++// impossibly large distance. This implements the Cpp17RandomAccessIterator
++// API but doesn't meet the semantic requirements.
++// For the test below, all that matters is that the huge value from
++// std::distance(first, last) causes std::length_error to be thrown.
++struct FakeIterator
++{
++  typedef std::random_access_iterator_tag iterator_category;
++  typedef bool value_type;
++  typedef std::size_t difference_type; // should be a signed type
++  typedef const bool* pointer;
++  typedef const bool& reference;
++
++  FakeIterator() : val(true) { }
++
++  reference operator*() const { return val; }
++  pointer   operator->() const { return &val; }
++  reference operator[](difference_type) const { return val; }
++
++  FakeIterator& operator++() { return *this; }
++  FakeIterator  operator++(int) { return *this; }
++  FakeIterator& operator--() { return *this; }
++  FakeIterator  operator--(int) { return *this; }
++
++  FakeIterator& operator+=(difference_type) { return *this; }
++  FakeIterator& operator-=(difference_type) { return *this; }
++
++  FakeIterator operator+(difference_type) const { return *this; }
++  FakeIterator operator-(difference_type) const { return *this; }
++
++  friend FakeIterator operator+(difference_type, FakeIterator i) { return i; }
++
++  // Return an impossibly large distance
++  difference_type operator-(FakeIterator) const { return (std::size_t)-8; }
++
++  // These are meaningless results but not actually used by this test.
++  bool operator==(const FakeIterator&) const { return false; }
++  bool operator!=(const FakeIterator&) const { return true; }
++  bool operator<(const FakeIterator&) const { return true; }
++  bool operator>(const FakeIterator&) const { return false; }
++  bool operator<=(const FakeIterator&) const { return true; }
++  bool operator>=(const FakeIterator&) const { return false; }
++
++private:
++  bool val;
++};
++
++#ifdef __cpp_lib_ranges
++// Wraps a std::random_access_iterator as a Cpp17RandomAccessIterator
++// except for having an integer-like class type as difference_type.
++// This one is _almost_ a real Cpp17RandomAccessIterator, except for the
++// difference_type. Again, we only care that the huge distance is
++// detected and std::length_error is thrown.
++class Iterator
++{
++  using View = std::ranges::iota_view<std::size_t, std::size_t>;
++  using ViewIter = std::ranges::iterator_t<View>;
++
++public:
++  using iterator_category = std::random_access_iterator_tag;
++  using value_type = bool;
++  using difference_type = std::iter_difference_t<ViewIter>;
++
++  Iterator() = default;
++
++  explicit Iterator(ViewIter iter) : iter(iter) { }
++
++  const bool& operator*() const { return val; }
++  const bool* operator->() const { return &val; }
++  const bool& operator[](difference_type n) const { return *(*this + n); }
++
++  Iterator& operator++() { ++iter; return *this; }
++  Iterator  operator++(int) { return Iterator(iter++); }
++  Iterator& operator--() { --iter; return *this; }
++  Iterator  operator--(int) { return Iterator(iter--); }
++
++  Iterator& operator+=(difference_type n) { iter += n; return *this; }
++  Iterator& operator-=(difference_type n) { iter -= n; return *this; }
++
++  Iterator operator+(difference_type n) const { return Iterator(iter + n); }
++  Iterator operator-(difference_type n) const { return Iterator(iter - n); }
++
++  friend Iterator operator+(difference_type n, Iterator i) { return i + n; }
++  difference_type operator-(Iterator i) const { return iter - i.iter; }
++
++  bool operator==(const Iterator& i) const { return iter == i.iter; }
++  auto operator<=>(const Iterator& i) const { return iter <=> i.iter; }
++
++private:
++  ViewIter iter = ViewIter();
++  bool val = true;
++};
++
++static_assert( std::random_access_iterator<Iterator> );
++#endif
++
++static void
++test_range_ctors()
++{
++  try {
++    FakeIterator x;
++    std::vector<bool> v(x, x);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++
++#ifdef __cpp_lib_ranges
++  const std::size_t min = 0, max = -8;
++  auto i = std::views::iota(min, max);
++  try {
++    Iterator first(std::ranges::begin(i));
++    Iterator last(std::ranges::end(i));
++    std::vector<bool> v(first, last);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++
++#ifdef __cpp_lib_containers_ranges
++  try {
++    std::vector<bool> v(std::from_range, i);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++#endif
++#endif
++}
++
++int main()
++{
++  test_n_element_ctor();
++  test_n_element_ctor_dispatch();
++  test_range_ctors();
++}
+-- 
+cgit 
-- 
2.55.0

