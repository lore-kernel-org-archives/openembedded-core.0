Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49333.1795633637830324888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 11:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nv24PrUf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5789bb15cb=josiah.metz@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQcSR702899
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 11:07:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Wz9W376zH
	SPmO4U25U9lwkh5FfchkpL1c9eLR37o+XA=; b=Nv24PrUfP8/mQIAOW4JAlQYzF
	JO5zSBLBtf1g6cv8IT/fz4YKNSiq1EVF2izoSqzyI6uSjS3+a7jIzJsCowXOIcEH
	2u8mhENwo64qGk/6x438YIYqsvZSzVerPeCxPuydfeByJyXCYijGTBEGPP9xENPS
	NUQkuQpE24JYW1B7hNV27Sd5ATX4Q3MElphSMLSMGfyK1Yv7n6zujbe9D8gTJfI5
	zB3mwlnHCoRzp+e/2bdHeZ5gRoxbL1JTd8ue3t4D838/5FLrsJlI8e9PdWCBktFm
	EkzYJECycylHeHLntuSWbVkPb47s2Ug0GuVGsDaC173TRqar2Jfm9he0l5Xuw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021110.outbound.protection.outlook.com [52.101.57.110])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wvvxn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 11:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWrjte1Gz0TfvHVJQW3aa4fMS+dCBWqe+szZfdodAZ1lJmXfE4caRMXrZEVB+Msrn8hmT/7x1zn8ko5cWcM4OT0kEQIokk+a1GKwsyhTZn9PZzL/9mF/B1rSAIXGnNeyIAyxC6MX85PmG36Kbkgv+8HaBm9nDhJc3yXrBzDhw5juRXK2oEDDWlf7ZMe019y0SctjLrwb9V88utVq+AeuJ9tIIFTCxtg5I6Gfc2Txzx+5VJSkbQvLTzAPtN1CPvj5ONI1oKn1VdAs5qfR90oKqxt3SaTQJCP5HY7uJXHH6/i0xQC3DVUShUaQs3qRg1e9pjB22kzlHd3jY+fnWjAO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz9W376zHSPmO4U25U9lwkh5FfchkpL1c9eLR37o+XA=;
 b=C3yey+fBJFIg5wh/Wa8qNzNuxTiPeR7cC2kTFDJplTTiuV/d1QwctsDfMv1QTcy1rCVbnvRnU/DfTdFfQ1C4y+59UiW7QVGjlp0rSRZ8O0hLvKBD13XfkyCpC4XIfqMRI5Xy2MSg25Sb+++GGnbpXYzJoeE2fzFiE9rWU0yV96Ngbexw7hpqQP5lxlQjMPMjcXcR9xxRSsCoD9rOxZFDlTTNw/krO8Cke7vXusK86hgCHVccs7ype67nSwWCMvzo7Uw6pxmby4YJ9mbjlzN3nG24Wi0hzbIwf2ymie2vZp0kujHnzgJjxmyb5kedwkTG3MBa2H8/m5YDQQ1H9I3JgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB7771.namprd11.prod.outlook.com (2603:10b6:610:125::6)
 by CY8PR11MB7948.namprd11.prod.outlook.com (2603:10b6:930:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 19:07:11 +0000
Received: from CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e]) by CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:07:10 +0000
From: Josiah Metz <Josiah.Metz@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: josiah.metz@windriver.com
Subject: [wrynose][PATCH] nasm: fix CVE-2025-8842
Date: Wed, 25 Nov 2026 11:06:56 -0800
Message-ID: <20261125190656.2914749-1-Josiah.Metz@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:303:6a::30) To CH3PR11MB7771.namprd11.prod.outlook.com
 (2603:10b6:610:125::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7771:EE_|CY8PR11MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f28869-4b98-49af-cb7c-08df4b274ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|6133799003|12006099003|261009223027099003|261009221227099003|18002099003|13003099007|260925021911599003|260925022911599003|260925021311599003|56012099006|11063799006|261022105027099003|261028144727099003|261102123227099003|261021135927099003|261021121427099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: 4CQDMnvKliFXViH50QJRzciBbTtGNIM6uRHNHog2AWYvh5kpYf9dg7fEpbldBiDkfWlDJq/S6+piy1iXlQ1sZMIHfyzcX59Eui9pVsrUlrLsajBcFg5DkmQym2P7OHFcX61NdtXmsbizv5kGd63ehlikkpn6cs3z4K7cwNNzZYmJykhYlPahUUdyv8SCBIh+FHIXeHBYR0OnzhUlO1tNieN/5iG07OHdkFT+5g6nYZF08whPyjXXFF2M59i2dXWYnbduPTlRnONxyOZJ+wyMceEGIQcIv1GY91ZmTupvc3NDHxvAhsQQFhCBaC+26tSF11tTTXDXY1MEsztGuxonL1GzdPOjEDaJLoglYaORo8lCrjiU1E0rITPwylQyB2kKTlCsRCv9JGgoeXQdtbt+2qzRzscdcZS6kOwMdZedM0R25foUyZ8hT60VA9w0cjaCRbTDboSYi8eGYA/MwOVhgC5D0lv5GMvjRex3mn70NPdeYB1z9mwSgRUQLcosvwVQZVePzTp84/3/VC9Y6FfJ2Npvo4DEIznWCrzqdwdLnl2mvcDf5DUz5ZD1tFd0RCjIwEbYMWAPXrrB7jrMXDMkBAItxe5a/Q6275fl82z3gvwpiJvMoGrMtvn9blh/L57XWVnC8OIqBCmZ+faVu6tPV6+cPmMwJXVNV3FnkBb/vvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(6133799003)(12006099003)(261009223027099003)(261009221227099003)(18002099003)(13003099007)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261102123227099003)(261021135927099003)(261021121427099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vi0oXzS/O7PBcGlHPT+1KVo1lb2Ex3hrpX8/5xXJB+Iqm5e0ocjDUF2AJPyd?=
 =?us-ascii?Q?3osDrSjvTID88bM2zXMYAfQdlKnUBEFckSxSNC6WlpRGAcppNNOFPzOPUEiD?=
 =?us-ascii?Q?IQ44RPvsYfTx1+S3XOFeejiRO1baT1ia2eqRM2u5SzSA0ylBtA+VHgY3sGwS?=
 =?us-ascii?Q?yDGuF6mUznteiDVE3gTpRS+kXUdKvoyuEZoPmI450k/vWBiMUcqWSyJPMaJj?=
 =?us-ascii?Q?zCdl2rTD0nXDcz4o3EveOfZFY8S9iBncA4vqNTNx5Fnxv77HZO0Hzblw9tNr?=
 =?us-ascii?Q?eLfr0yTLusa9htGNjduvSRUz7yCqlW266WHQ1AOy1GMVRIpryGQyY+8gkKdL?=
 =?us-ascii?Q?9ha/1GJepzn/Mbh+IjvD1BC6yDTVVfpxcuzTojenTgn8Mzgq39o8tWuVkvHl?=
 =?us-ascii?Q?Mq7FcOxA3fKjbLDJdVqTvridSrXJXgGeqcCBcwgmzxYOF4IpJnFft0VGn+PA?=
 =?us-ascii?Q?2SC4nHFJpEXnXLZ3di2QJbn29JKXvEzXx/uaf9LFJXU+T/SIukDsjkHKde8A?=
 =?us-ascii?Q?yFcgunqoaTOTydalOuFoZ07bykCn5qc0kVQzJHZJ00TWe0Tcqk2Fhf2bvTJI?=
 =?us-ascii?Q?XGSIBs7P40Iq1cPFSnqI2/UMOitc8i0Th40cfQ/gz7/4mPgT+KAh43xJmKrX?=
 =?us-ascii?Q?vfWufge6gj0AS45v5ih8yqqa/LeU298f1DE8RhspEfbULx24A55CgGH4foKi?=
 =?us-ascii?Q?qmc0E6rSffQpMbzU4tqT79UVU0/mvYoSKG7ef0xgpIQ8YqVJhH+8zACNdnkG?=
 =?us-ascii?Q?OomAUUuqEJzmdPBH4s4kbuO6wRJ/rZfroVxvhpq5/snp6IRtsN9gjwmKoDPR?=
 =?us-ascii?Q?AMWdLm/MjxmcuowjjKzUOmOM3DAyLfNzdoA7thuyAqLivEKPIn2suxsFsz4D?=
 =?us-ascii?Q?9BXsWyOZ7Kf8aOW9bM+qkVLdKxaoZG0VYMcORi08BsfB9FDjTttuS5KILAda?=
 =?us-ascii?Q?KLpwZJp0EESJPEeTuitii64TB5GSN5kaEuna1XoO6kSpeBQbmrW390tTZMor?=
 =?us-ascii?Q?K7NaLwv0iv4S6krbQbJrGoqp0PuiC+ceQwsz3jdH67r9g8TA71fTuTth1HhU?=
 =?us-ascii?Q?KokqiDuzY+zcfojkUb75/A67vNKlVtQjUa49rQepDsXV4+kCqPv2n1OR+AI0?=
 =?us-ascii?Q?3EOhK7t/7G/4jIYshjOIngDDZ5qrKq3TE/BODmuKS+AOGOh1dWQytz46Qos7?=
 =?us-ascii?Q?4mMtQi5w4i48nXYJhSG391vRIlKEAh9KFK6xwQ9t9qBOmcxblFTC2d+xHv2R?=
 =?us-ascii?Q?L+RcXqME/+nq0rNAXiA7w/onVKqAmAmWhPmrLyelOvLIZUBAtKBe2EYw7RC8?=
 =?us-ascii?Q?BjJk/9puD22a3ykm5uXHqj5rBHpvmGBrYy5KaPYU8kMCWgSvT0cnjcGVPq4M?=
 =?us-ascii?Q?YHq+MkAzYz6WwltEsNg0KMa+ixfXtLDA7FNQqPLdiF6PCRWpJ5jCFwTQbmoX?=
 =?us-ascii?Q?oQ5f7iT5qZa6XmarssiKUZizBplL2RxsD+zYceMKxic40hVvVCnWSggOBPqJ?=
 =?us-ascii?Q?LYg0EHUll6KYBF020IqGH0Gk0cnpf+xOM340ie07lfk2lbsAh1PDSvOm+PQR?=
 =?us-ascii?Q?KhrTtspQLzGWIius8uEjgBKJmHLUp7UNW1HX9vimgteU7DBjAWlE8L1eIvTG?=
 =?us-ascii?Q?M+TCw5e2pHDxR8IO/b+JsUPjttaWeD5uDN5bo+Lx6fYgwbv+eWE2C7XVeetc?=
 =?us-ascii?Q?igukM+kNGb40oJxDPjMGl9LG+uKctbVxy0gusERCIwOcDtS2f54BmLUcv739?=
 =?us-ascii?Q?SWddOKYL6SEz4QErQ/05iVPAmRa3OEk=3D?=
X-Exchange-RoutingPolicyChecked: WUPWJgZA6i91v+hmrWC1eYuYM3e0idWJBHm7xoXenovUi6diQxVvsSY5aDZhZ+H+aAAad+6hnmcJIaSyssrfLTSLDpuKuc2ORgFiDvkyUm57LpXvi+n3IJYxjpZYjNYNEkvBzBWmIvLgOq9ycSzz9i25CXaxcfgEUDFmEdoRRlf5wLS8GyO/tc8cXQCMIixMrE/0zpUwbgDmt30ijrGtJvZl7MBjHmH3VzcrdelqtVPFNmjnuV+QXas/ylXP2093L7lHsMtwmgM2VgM9YHZwA6xA9Hzi6oRK+Koy419x3Q0Vn4rd+ywmvsQoZ2KI+V8hEZps2lp5GpI+mvnUyrYsIw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f28869-4b98-49af-cb7c-08df4b274ead
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:07:10.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JCPthRrb82EH+F4gx+9oa697OUkSna+Jt1rr5pK1FTatrQv4lV/cHB9zN5coRR4CIlJ7VGDpswQCRgL5ouBIVO+kQLMZz0iWZrWJ9AYY80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7948
X-Proofpoint-ORIG-GUID: W-HdonrJD96dfPKDA8v-Tj5rQtCTiQ7s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NSBTYWx0ZWRfX1NCdRgzxDo14
 Wxcrs19/tbkW9TfhZEVlY+1merXukrZcGaKqVkJfZ7oRWfgDhwpslAkQIriOjTe5OwpATuH9IlU
 Vk4plMQi2PvBqVCfSZPyxwXFwmpoFFQX4R5LpuHiz9KmKEgMVE95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NSBTYWx0ZWRfX4KqnvX73SX9D
 zLE6Vyi4x1JVr4an3F+ubRQUb3eJ/nZAE/Jn6NZHZxE+F6ybu8C76xyUz5WovgUTsw5EnqPxn01
 HZndjxNtFI2QePCT6/tDGUDdSDPGEVICyOYwLra0K3OlCRPB2tz414wpug1xwja7ePVPab1/yQY
 re4voDmYoJq8GBQ7c43ITVvNYJT4TVTTw7tJOdjmZ3+Z1n7XkCwK3M476AMI1m0QN6WhJhyuRve
 8gr4Dh3CGgDmvbWYlAhgPiHGRuv2I7rxcdhb1854iEBFh44AX8mXwWwhc5rnyJop6QnTykQgzDl
 uA1UrUWCwy6+tHjYctgMreWoz3F3230a5aJKCZWina627kBJsM1AjUJP216MwIcrCY/wO0QyPcq
 pl4ydr8taJI45K2O1hXwVZM8Cs7+405MyDdvL7Gqd147D7TOo6UpklK1U9K0lc/WgBOesKupxaq
 jeMFCpUgws7w/6V4qSw==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b0731e5 cx=c_pps
 a=Lukco47usUvZlN+GeMSXkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=IGX8wMYuAAAA:8 a=t7CeM3EgAAAA:8
 a=UqCG9HQmAAAA:8 a=NB8WmOtFnkp0X3ZVRFsA:9 a=MyEMWE6lpU7D9y2mAhno:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: W-HdonrJD96dfPKDA8v-Tj5rQtCTiQ7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251241
Content-Type: text/plain; charset="utf-8"

This patch applies the fix commit in [3] for CVE-2025-8842 in NASM.
This fixes a NASM panic in free_mmacro. The fix commit is referenced
in [2] and the public advisory is referenced in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-8842
[2] https://security-tracker.debian.org/tracker/CVE-2025-8842
[3] https://github.com/netwide-assembler/nasm/commit/b5235c49f09eeed65cdf0dfccf7f261d629c4878

Notes:
This fix applies to NASM 3.01 on wrynose, but the fix is present
on NASM 3.02 so this fix is not needed on master or blacksail.

Signed-off-by: Josiah Metz <Josiah.Metz@windriver.com>
---
 .../nasm/nasm/CVE-2025-8842.patch             | 43 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2025-8842.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2025-8842.patch b/meta/recipes-devtools/nasm/nasm/CVE-2025-8842.patch
new file mode 100644
index 0000000000..504feff1ea
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2025-8842.patch
@@ -0,0 +1,43 @@
+From b5235c49f09eeed65cdf0dfccf7f261d629c4878 Mon Sep 17 00:00:00 2001
+From: Yongjie2017 <sheng.yongjie@outlook.com>
+Date: Fri, 17 Apr 2026 06:35:57 +0800
+Subject: [PATCH] asm/preproc.c: fix
+ https://nvd.nist.gov/vuln/detail/CVE-2025-8842 When there is an ill formed
+ assembly (e.g. a macro without a correct ending), the assembly processing
+ will end with a defining->refcnt in non-zero value that further causes a
+ nasm_assert in free_mmacro, the nasm_assert causes a panic.
+
+Force the defining->refcnt to zero in pp_clean_pass as a bailout.
+
+Signed-off-by: Yongjie Sheng (Intel) <sheng.yongjie@outlook.com>
+
+CVE: CVE-2025-8842
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/b5235c49f0]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+Signed-off-by: Josiah Metz <Josiah.Metz@windriver.com>
+---
+ asm/preproc.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/asm/preproc.c b/asm/preproc.c
+index e169d1a5..776a5223 100644
+--- a/asm/preproc.c
++++ b/asm/preproc.c
+@@ -8837,6 +8837,15 @@ void pp_cleanup_pass(void)
+             nasm_nonfatal("end of file while still in %%rep");
+         }
+ 
++        if (defining->refcnt != 0)
++        {
++            /* This can happen if a macro is ill formed without a correct ending
++             * and the macro is still referenced.
++             * In this case, we just set the refcnt to 0 to avoid a memory leak.
++             */
++            defining->refcnt = 0;
++        }
++
+         free_mmacro(defining);
+         defining = NULL;
+     }
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index 186ae57ce4..8448d48992 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2026-6068-1.patch \
            file://CVE-2026-6068-2.patch \
            file://CVE-2026-6068-3.patch \
+           file://CVE-2025-8842.patch \
            "
 
 SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
-- 
2.43.0

