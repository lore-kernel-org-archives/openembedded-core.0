Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BB7CF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:35:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9160.1727246094832210792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9998c7229c=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P4U2na032113
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:34:54 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41umbvshyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nlc8735RbebgZG9vuFwZuLZRMZJB14Eh1kMGLLcAZq+ftEFKHA5++scXQJkO8QtiOQbZkxBScnK4ke9jdvsw0MVSm6UffiCZT4B6B4qrVwcHeydGwMVp1P7cSiiKv+QI0WJMB6GuJ5kzSzcTUSlvdH5l5wh3CkXn3jdzEWQLTAB5SXdhDh3BdladhqiSo2oWHl0aJLU4gRGp4uOlfO8yalxq6fmwIMDRYwW7T6X6nh4btbADzLqRG5Ky3u/L4UCQHqol741iXdXvL9tbe6G4PdycL7YLtd5VrgAg1KcomK8zzpC/clx2SfSo4VaP1Ye/Ax3TQNUwmHeHqbSOhM3z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKofSUxXktqJcepid7NNu7Zr/NoTwR5KSo8mU2qwVpY=;
 b=kCAYvCkfxGkNtw87ZgQET9rD2p5Dgw9BjNfIMDTcD33hWAQFMt6Xaolc/siAh/4kE6ODYHGf5gWM+KlwvP1v64atElV14chgnKvcYuYdcssO2pB1LZ8nQ2uXZXKljlS7nIBrkKegUyRin9g1sc9TM9JwLyrWQWiMB2o7Uba5WGPeK7OqFEt2VTRNd8DTWd9qdy0+9Dt30M6Dn7D4tHGYOJq7ZNtZi8IWZv9qYMMB2hx1THyRriIX6OKRlYc5ltZtXFSQbwnMmpxTHHca+KSbXABkivu0i53K6TL4WQghqDGuvBFxoEBXgJZbwkNIgPFcTveCz4SkHtlKFhJyhVsGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 06:34:49 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 06:34:49 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] bintuils: stable 2.38 branch update
Date: Tue, 24 Sep 2024 23:34:23 -0700
Message-ID: <20240925063423.1870305-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1bce84-7388-4f75-11cb-08dcdd2c278e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bMiiJDOsaekCufyzX8honuRvfHwCbXK/VPMzfw1xlWbImBbYonKS0oqCSg0m?=
 =?us-ascii?Q?+Evdw7gUn8/53L1xUgWiLATKFdmcKJ/zWSjDPyrJgOFHD86GcNu0Bn1a8un6?=
 =?us-ascii?Q?Vzr834DWqvusvLlwNT4OVzQAHbkgw3MTKgmb7hvnxh5DkaYzzP46Sp9kUT/2?=
 =?us-ascii?Q?h21E25VJSI27T+5u6RBTpukENWyRTqQtiKzTn3OGBoNrKuy/aJFZ2mtlxjIL?=
 =?us-ascii?Q?cRZlGCRBlDWh200QEZmwcP2bG9EUTBQlFj/83t0WViKdOuB4cCwqYPI4axZV?=
 =?us-ascii?Q?QXOqrfXf5tunDHsUkqGoOlEGsvrYRegukOFN5wPhmLK+z3KBNhoisAvX+Pic?=
 =?us-ascii?Q?WmkzKyAqWa1thqZ7GUohdsiJ57qlxMzMYHw+7U+APYl2ku4HtoHtaqBz9Whe?=
 =?us-ascii?Q?EhiTuhyTsvAv/gCrIcI7TrlzLuCuCMTI45fBrVd4GhRegeful/vH1DyuLlzK?=
 =?us-ascii?Q?6t5K5V4L4aDAH12TSUrDYGS8ifoVzUr/VHSHzb1ee+x1At8H/tivihecNkzX?=
 =?us-ascii?Q?VVXplJYpHg5j1WQuLgpeX8L8gl+jVWvHKIG6tihivrgyoMgfGMaDNFhhbdKb?=
 =?us-ascii?Q?E6SkJmZjoTZE7xvwaLvTqAeo/2ZjhtbI5IF65wTos2TyOtiyHgoYTB6D0Qhr?=
 =?us-ascii?Q?g/O2EcbqFx+2sC/0t2HQhvNF3yHY+FZAwjZ2IVNdKCF+V9t27SY7zsTHz7as?=
 =?us-ascii?Q?8rB2LDPe36RCrxNRiqafZt8h2nvEP46aNxJ+GNMlpRTIMLm0LpQIqVGLShIf?=
 =?us-ascii?Q?qlxxQMAwUspNUJk0Ueqgvx2SX8u+n1f/PalRCPMoUHdIUUJaJB7s3y7ZPONU?=
 =?us-ascii?Q?NeojUCsbbFovIIUh3NeShAEMywlg9PoZJAqfZTVPdhfxz+jMX4qVRAQSUafR?=
 =?us-ascii?Q?dDaGawvrxHxKyUiDCZT8O80VQiby395dtIzGvXyEbJZb4/OwW7gvgjnEoBOF?=
 =?us-ascii?Q?QDvMZkN4ddM6ZVGa1NENoJmLSG6BcSA2xzg5ViiqlJNTdiEqom5yjSWim49k?=
 =?us-ascii?Q?4N+q2wvREIk229PQYYFkZjKr1744PJTJdHSIXaQOc2O1jFkGbcKGv8LGqKjH?=
 =?us-ascii?Q?nvIGG6vCsxwgDtFHLCwUiAr9HMrkyA7wB2KeqPqKBUNXlV9Y1dk79Ms1HRB1?=
 =?us-ascii?Q?1JNS3I6f0YuK9Pf5qHMUcL9FpPRP6TDegduPcVyoG6gDhvub6B0fcvM+BxR2?=
 =?us-ascii?Q?AiI9626ItQTtIhg80i4CB1/UnG27QgCUmghN95BuNvC7nWm6vTQWBel4TKUm?=
 =?us-ascii?Q?ffNFYmo41ns4tObULUOZR3aDDsGPlwV+Md0M+zIMyA1X8NV0OseQW5xjUIT3?=
 =?us-ascii?Q?I574TQas2hPM+SOBsJHazLCZ+j2ImB7to8zmNB5v92Lh+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GLt1eTvfDhjlSbJZrCEoVW3y+RrdlURXrNYtyU1fpSn5dX/pUL9vBC+S2Pu5?=
 =?us-ascii?Q?1ZLaLIY/JrsQqApEHuSqRLqzRsY0xbdUpdGjY0q75ZMULzd8Ys93Ggf92Jsb?=
 =?us-ascii?Q?JBNZluAHxPxWCb/FUfVXTHb63HpaMxd3KQRCzJUVdpFh7AvqgFR8cphm/BIY?=
 =?us-ascii?Q?zQ5JxaoyYlzGzEXu76AQUI/3ZNMZr1R7pZHRiuGTu4+1fXWe7psBEcC7/V/F?=
 =?us-ascii?Q?g/eTXNWTd5Z6OnQcH+6GtWxmFm3awRR125WjD8hICXuhH+XPJqf2TNZDMEBX?=
 =?us-ascii?Q?7jyjhlC9hfo3dm5JDVFiLS7IYwqiIIQshFeuPnTlUvv0OzGoArqEzJncUAur?=
 =?us-ascii?Q?MSvYTuL/bjOa2fcASn9cCBQEDjogKgaPiShk+V+3PstiGW3u6nO5QGm4Dbpj?=
 =?us-ascii?Q?PDCTIYFfYayNhXj5cH8DEQvpySn4lC+a4a2RM4SjeDY2hw5Q3P8hHaa6L6Nj?=
 =?us-ascii?Q?jizUNA16jxbCDxmXsg+COpymBhAK+NmGk8GgXPHM/isPtue63RNRFKtn64S7?=
 =?us-ascii?Q?taMxa47EIqeqsLx0Vy8rq234uiR3M3gzXXmxXdGybI0HB60SnRynZk6dN7y/?=
 =?us-ascii?Q?S1/ZV/XnzHNPazA9qN/Dm9wlDYMPjBQjyD/lWblB4a2g2E/ejm6MH5V1iF0U?=
 =?us-ascii?Q?ATAiSvACR0maSV6EWMtf1P9A5mLfdK0xaaFHJfkySSbLhLM1U+0K208rbVgL?=
 =?us-ascii?Q?rYOT8q+pMiJdnFwxM/fpbNNHdh4+rH6cH2dWw69G66CglHqNPfCJh3nJUvIT?=
 =?us-ascii?Q?yBCynq2m8OqX/ePlfN0oRQMVeUR1HkwpaAjLSFheOizC0gd82WD4ewOtqa+a?=
 =?us-ascii?Q?+FfZz4hgbQtJVGn4O2Rc96QuRHIQBOLzM8YUB0lzvyMOgRs9GD+Kmr9GLPkb?=
 =?us-ascii?Q?ZPJHafr+93zxRG0/QsDIq44+PX6WHwGI5sV6yixy0Rrxkz4zz/eUfkAqIxLV?=
 =?us-ascii?Q?eRPWCVmyvp64sSIGRhAE/IKAhNlNf1c9nWtt4/93UQlomk3X0wYqaVCajMc5?=
 =?us-ascii?Q?7AR/KvpwWQtPxMIoZNS3/nVbws1ZXb+N/X1ZwOuP4iywV4nq8ZdPMaZ+IXek?=
 =?us-ascii?Q?VpCQ+H6t/ua3hGuNzpsCzwl0FoijQ4m4DAOVWr8uvT71OzOxcbD7CREFlEqM?=
 =?us-ascii?Q?uzWmPy/DFp4TaaBVkpxVcuruMwngkLEvRZl067aZ2zhxx6MkgFs6/OClF6sj?=
 =?us-ascii?Q?F6aqUnGAyoD2HumZ7HRilHlg65tX9nJWYFUhBtv7+nAuQuvki9NFcE8Q/xz2?=
 =?us-ascii?Q?eHbEj8lWFD+x2kirP5O189pkwr7SYVQVVzATXcDgjd+6hS4jiVJh5GhsEUuT?=
 =?us-ascii?Q?5qQfD//dwcyj2qccwsvcbNMWMlUJiJBT6qEF7kKeCKnNNt9Y9+elOKYa+5/S?=
 =?us-ascii?Q?jqfj4M/2am07lXOArUe5l6TEMmW7I1bEFR2Gy9/c9oRAog8sRnwjfg1KuaA3?=
 =?us-ascii?Q?tDbxQMFHdKyUYdToC4tVEyTJLwo7GhMN2lEOM//u8Q/+CoZ3aLn5TbBuNS5y?=
 =?us-ascii?Q?fCJgv0vF1A8Lih0MiEBBvDnVPC7+wLy4WHnNGvFdU6WOt91rPD8cXMQ3a2J6?=
 =?us-ascii?Q?/qDiPBqKv5ZD8HyFIhYOjdVvKZjVkmCQNiiPOkEVuGmlgVir2HAGzVnEcgQx?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1bce84-7388-4f75-11cb-08dcdd2c278e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 06:34:49.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBUmLUyBm+z6Yz/RPq4DyhEanrQeMZvoYEYwFaR9jWmMjlNHAkMGq8Ms1h3kVqMU+CyEW8n2M4NBlwlJOO9ojrW9VDKY/WiUdZM88QdIr48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
X-Authority-Analysis: v=2.4 cv=TKoXSEla c=1 sm=1 tr=0 ts=66f3af0e cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=Cj2JNex5IhnVwOnuttoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: xvV5r2QVWvuk-eQ3t1U77uxbYnvGpnq4
X-Proofpoint-GUID: xvV5r2QVWvuk-eQ3t1U77uxbYnvGpnq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=951 mlxscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409250045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204890

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commit on binutils-2.38 stable branch are updated.
4d71e17a9fd libctf: fix ref leak of names of newly-inserted non-root-visible types

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 4a8831b534..032e67a213 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "ea5fe5d01e5a182ee7a0eddb54a702109a9f5931"
+SRCREV ?= "4d71e17a9fd8d319359ded891eb3034a2325d4c0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


