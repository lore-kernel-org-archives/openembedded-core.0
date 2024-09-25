Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4644CF58C3
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:25:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16141.1727270757223452504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 06:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9998803d16=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PBOXtM009057
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:25:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hj255-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:25:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIo9J056nuML4Bgwc+qCgJDUyL2KyhMH74eCdASZziKralesT/5N5MzdzXtO8L+Wq7vcUBfftvJ11OHaGKBqJS6DAzDF3qeWcDYJvo5mH20/yLpzS1qyPOPKkAQKDu9VzWfqce8s0jPwcXrJ6C/b1tRvFW6V3kPnrSMAT81RUPTfaKpevvgVmqZnKbG9kKZ9KWIraMPTQ4IGXopQ7MjNnx4YBWo2yVIN+/7W/D5AwxEEdjcymZTpcn2d/E+a8R3uLP60BYjRQnHlDKA+dYUX+PArNWiK1lDxWw101nKv0F/m9cvfcAPtxtP/GvHj6r/H7NoEr0SN4YyTUjXzFjSE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca5nZdNxjg1KgV7QQvO8gRRyRrYBam+yGY8DBBhAqFA=;
 b=MfdYm4UZ6sp7203wA21JyZtz9pPeS5Oz4tVj2P0r6+QsMIJ6Zq6VYSxS0ciAb6enVbmDjjPuiDaTtC/Le5CzUArwQNVv2+WsdKoRFZkz7LkGBR/4t2ly36TRiDoZqPeb951UswPxgAH8CuG1fK/M2+MhvY3JVd0NYHuqui0olF+r43j165/CY8Cl7PqXyuEdBwrXBM0dTIBq10o/lTa4Ci7f0ubsY/xAQgv15G4Veq4EmB6sJXMh9A4C028hHCuivOv2ft8A7O70pxoum9m1l9k3w3r92hKHhGY8/hGTAHgqM5chXSeXXqmqb1L/Pv19Pu1vLnIfL7txV8P/H4cPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL3PR11MB6460.namprd11.prod.outlook.com (2603:10b6:208:3bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 13:25:52 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 13:25:52 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch updates
Date: Wed, 25 Sep 2024 06:25:37 -0700
Message-ID: <20240925132537.381555-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:254::8) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL3PR11MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ed37ea-1814-4b64-426d-08dcdd65938c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6VjYU0gbUyuBMavRotsy/6Qx74Adk5hwxc15y/Tqo4ftphCtFHIil7RwQIdO?=
 =?us-ascii?Q?1vgiryVvHwboLD4+kH8b8UBzZXLAL7koj3dk9JhD9JBiZHbKu2gq1NvUm/u8?=
 =?us-ascii?Q?st2O+TjOH2fCngSk1E7sZ0gC+DNfZVguK+Y6E3DBOd8CLHOGfnbYKMEMxnlW?=
 =?us-ascii?Q?k+eRZQJclAImHZ6Ew2n04E/qdXWRdumxPo/ecI3Fn8ksRsXkyLo7FFvuBvIo?=
 =?us-ascii?Q?Y931D+X8v7LlScG+r2d2BUqM4CjYBG173ag4O0tz25zMmj9lhA2rX1cazSm7?=
 =?us-ascii?Q?NNzD467E+4qXz1EAnKMSUsG2M6n+wiwckSlc6a4nOLdZeKtw9PHg/e6NsUMu?=
 =?us-ascii?Q?gGKX4Z1mU1KQXXxalO6h6zr6Ugpq/e5SF2ulBv7AhnQwd4MUvDgvpntiQZBv?=
 =?us-ascii?Q?DadblphfltMgVlUQlgH+2zYmeZ2l5aV2HJOqpxh2CdCl9Fdh9nPRiGXG3fB4?=
 =?us-ascii?Q?hjF8WG3WXSVfZ7boTGCRAMiSNv2F3Hp4CUlJCUih7y6dgiq/cEc7mywYWST8?=
 =?us-ascii?Q?Q/m94KtY/LOxCAny7JLq1fqlW2hKDwn2wDe+BHpmfgXXjEYyOxSSAbMsbTln?=
 =?us-ascii?Q?BBsYVTD4uxzk8eWvAe6gwkCua9zM37J6eSzyV8hRTbLR3HevKXnY4QYB+Ixu?=
 =?us-ascii?Q?y5NGmY88395wW6/ntSqwQCMWFDsFek+VgvJYPS5WMfOVnCFFRlkR7r546R5/?=
 =?us-ascii?Q?z2YduwKD/Ub3opnmcQX2MqkgFs9y+86CiRp4Srj0YJ2haCNJ0Uq8qgSWi8/4?=
 =?us-ascii?Q?bq2VUm853BOyYk+td7zx5fbs5uGdbdA2gFnOGMwuzyXi6g6nc8knCSdFJEqb?=
 =?us-ascii?Q?ghIl9qhIj5alQEENUjmjYcn+EtNRsRrUwLqYdZ8R2sZAaCEZ1mMpLsvuOxcP?=
 =?us-ascii?Q?1HAPmCU1JcK1sAMBPq3x6NcAF6yR/yT4tXeT884ly2U2+adaUvukNdk98VpK?=
 =?us-ascii?Q?F0IEddZ376sIalcjkjKbT7mjzzWDOb32/YiCbFsIpf52K+GG5lhWSsx6U3B1?=
 =?us-ascii?Q?bdZ7+hzaWGj2jJJ5o4kvvrQHZQpNyF3shOqW2nNpExrEx/rQyFLYqAXPLqnz?=
 =?us-ascii?Q?XASPH3XJOVO8rNNW4gAlvBGJ5s2VouZ1BfjGWczRU4C66FFPu19nooKj/YmV?=
 =?us-ascii?Q?9YDnTxhS6PnMZ7ydxXXB0o8Cn/Yqia5AvpqW46Hwz7165z72hgUsl+c07hgu?=
 =?us-ascii?Q?Z7bv7feOnSFvc/85R6+fEIjyxD3IQIJxc7gyBd/eBN2OH6jAh8qId8YcA2vt?=
 =?us-ascii?Q?qksxxM1tOKfYbEftrxYCEOagscuacOoRYKHc7mBBCuIyps5qlS9ibx3H1kvx?=
 =?us-ascii?Q?dYP/uYutFvvy++uOl38KKiKWJLEb770P/zktTolVy14GS8pYQjvssGcXEwON?=
 =?us-ascii?Q?JVgJSwfJDVtYZaOU1fflBh6MLiCyBaz7xewfhtMZmMXtEd30Rg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jkm7Fv7lkfwmmaNja/BqpAe9qfWOEk98KRcRZOvSvZJfAPIDmhBzHkhgxPOi?=
 =?us-ascii?Q?xC2wXsDBbj/WBAMFUKQLecLApHQjGYU0Ae5yRKxOHDz9OgZZZDCd397iAA1+?=
 =?us-ascii?Q?2WoDieaBnm+Z1OwRVo7kWeanfPsTtyzCBanhTJM6bj/Mno6V6gycuwiw+tEs?=
 =?us-ascii?Q?RQGV3f/Ado/x4vyaUbI+wqGYt8iBqmpLE1Xb9LhBixfO/goRfLhdM5KCkwir?=
 =?us-ascii?Q?HG2pYjEsvKCjvgDbF44qAoSWbjRJkyxuIvDvNoyRQcTGa5VmB4tWKEqLlkMg?=
 =?us-ascii?Q?aoifKgxDIyztjHI31mbdQaWWDfe8cz6T0mAmdQtt6iU4jyGBPsApD57m8ChS?=
 =?us-ascii?Q?8JWx3DF6O3kUg1WqrAKoppl1S7l6Gk6tHfmnzR8Wvt55dSdsgKdFHqhBvIZ8?=
 =?us-ascii?Q?c22PEboZfkmZM8EftZOyWWbojlNUK0ne1CoHU4co2je2yvbBKUZiBrOE5Woe?=
 =?us-ascii?Q?f580gxnea0K++UcJBYPgI2ZRKvjRR1b36RjjpoUSk/a0J0JUqo/1em0h+5Ed?=
 =?us-ascii?Q?0lPrJQJKvgCp8eMtykwLMudQjdZRBhrkf/xm1Etb7PMYgTllnhnvsDwF43SF?=
 =?us-ascii?Q?L7bAwQBqHii9+oVI7sfC9tqDRbeO7dpmmH+DvcpvMrtwSz7xkQyeHd++Pnq8?=
 =?us-ascii?Q?ZQ85QhcPPKlo/F2WWvloY2UtSMR32CGx1jE/5C+uiJ6QtdObu1SdDj2fxKMb?=
 =?us-ascii?Q?fYQjLUQJbqexojDGQIb68pPBhFCrnY2mwb1ZMFu9TSzuUEY5WP4IWiOD9yS+?=
 =?us-ascii?Q?Y6CIJkUuR3o6kgHcLq/JHQLF/y9d8fVi+TreY12t+mCtUm5nW8InOYtwsWjz?=
 =?us-ascii?Q?W7iFWTNqCNvYXTzTth6TbtCPA9PAsW5tXGXUwMFGBm8BRGrQI0o5tqBXovRc?=
 =?us-ascii?Q?Kjnn7GADKnGwtxNoJS/2YLpr88C3orh61/V+6kPxbuMD/5VtOUa+XCnoY61h?=
 =?us-ascii?Q?EF6BdiPMq0wNLXGcn+gEMDh50yax8ere1Kc8GaqQ+L1u10lkkajTd79jripU?=
 =?us-ascii?Q?68XgB0vlNMYEsU4arHVAFzCgHoVv1HcaROv3GI4a6S5yN2kGJjlZ8aixcdFk?=
 =?us-ascii?Q?cGJNWx2jPxozPTLk2Qe3eBqG17S9WzBHcWyHE53B5FDvcq6/3fV48LnT0ctW?=
 =?us-ascii?Q?MCiouIECylBBNxNDqSeSsgneNilypRclWNrLgjRVZKv5FGqfOJzUIIF+PYzc?=
 =?us-ascii?Q?UKMucj8/7/Eot7dYlOQyac9V07pkZHn+3zoG3sOaRTN47NcJU6PkkUJJGH4+?=
 =?us-ascii?Q?32P0NPqhSYSJz5VM3UKmLJQMaNKpbuccZ+m9h5WWOAOh51KMtBLdbWwDt4lQ?=
 =?us-ascii?Q?pglODwUMPwkRnMM/N47K6iLy2lzNhpwKK2K26QcpcCdUwdcDuqvr4j2Y5LJ8?=
 =?us-ascii?Q?m6w2LtsUuYvvz2YtZDId7FKKyoZiRnhVdl9d2NLbQCRsdn0IolA8YlSCrCeq?=
 =?us-ascii?Q?dqDQEwjMn1ExB63vsS6faOXpByPQCXNj0p2Y29rFWvSKvzFX2m8yzOlM4hGN?=
 =?us-ascii?Q?5n22lFuLojFlWbMyQ5RuJaZYQq/FHy8CSwVfiRynBpaKnj8MQ/V4rDAF/5PK?=
 =?us-ascii?Q?IQLmMMb6Qpre3K1UuvGjYL0VIyw2Rmis8Acunv18psFx0yg27VcyAcv0De5Q?=
 =?us-ascii?Q?O4rAtckUmq5ugFz66l9xxOk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ed37ea-1814-4b64-426d-08dcdd65938c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:25:52.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYq3rlku2znqcZDJ61ck+8lb3GkW4OK6oBHdbD05QAm9cPjvNZdRzL4wQD4Vq3xKeDkq4wsLunXzWHtt5Vbz0feuhmqrIDNg7C9BpbgOVNuDI+Q/OPVFhCKzQmgGwVh6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
X-Proofpoint-ORIG-GUID: Q7VVoG3zahaCel0LwInQrNWlyr27yBh0
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f40f64 cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=WyqX61epEs_fYRVEAk8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: Q7VVoG3zahaCel0LwInQrNWlyr27yBh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-25_04,2024-09-25_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=900 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409250094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204955

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

8a6764d35e5 libctf: fix ref leak of names of newly-inserted non-root-visible types
d9ddfab9be2 ld: Move foo before delete in dl5.cc
3e92ae5088c ld: Avoid folding new and delete pairs

Results before updates as below:

Results after updates as below:

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 24efe495ec..5d5ba3d6dc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "71ef12cbf140a637e4ea4e2239ee5daedc8640de"
+SRCREV ?= "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


