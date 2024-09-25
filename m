Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E992ACF58C3
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:33:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16309.1727271179720977186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 06:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9998803d16=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P5MKVO032061
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:32:59 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um552289-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpS39wcU2f3jRMiE9tegyzw1Ug0zEIUn3WCLQ/CygYKsBfj3YQfSdnQrUmXqApisOhm3BVtL+8IUSb9aOl+dHEOBH4xiCIStt0ZqfkW8+jhTj9hqY9CMebK4hF9WsEse2d/gcVz82kDa3FT9bkV608+ZEcQ06CWc12SGHi0b0mlDDECEsqKdk5Y8bUclvuFzFCg0ps2eglrayIVBeggj4SmcQEAd/4VUInVeNdef0HkelSok6nza+N0FjMVWfBVE95oYALYkL3CCANKoSxa75QYOJjZ9XIBMFekrwv9+V+5XXJPqJ1lGyb3bIUiWia5CxNNyPmTy4WvXpVzS+b6GVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz0ProHhEzMfeh5myyhd9CiiR4tR0A3JZqFJ+YAp4kE=;
 b=ReclzunAmztXDWwO2qTc2Pfkt3lkFyQze5w3lucLTp6tLG1Md8BmRWnZj/Jx6851FRv07FqXrTZEnj3m+zSLqR2shlyTKgStKzsUWpPggCZM7qRML5X6RV5NO7zY1UjeE9NdL7WRYctFkVRFzbCzfq2ED7twQldWPdi7X3LnIFjSXhtRAXSdfnRzyoE8623wPZcvXvIrWMhctmFnYOHDSvLKVWDVmZgi9DNTu2a0V8advMuOJEMUbpI6pQANSNwagL80Dv/ExJ5vuwuuESs7nI7hXZV1IRhM6Lp3L0TboED9txXOE7J/fOHxqaW64mQYYEh0W4DtX9+qMVm47ZWb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL3PR11MB6460.namprd11.prod.outlook.com (2603:10b6:208:3bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 13:32:55 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 13:32:55 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH v2] binutils: stable 2.42 branch updates
Date: Wed, 25 Sep 2024 06:32:38 -0700
Message-ID: <20240925133238.1013647-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::31) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL3PR11MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: cf64e187-6ab9-4fd7-3c74-08dcdd668ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lcViB/7s4ZRt+yJ5O7Aim87K4r7LMGkimWgKL4nCZcJ/Iat8Wi0rBwfFNrir?=
 =?us-ascii?Q?I9vQ487mcd55NBq2cLX/NSV/l7Z5mtFuMTFkNFdUk9dCdJ3bJKol354ng5Cb?=
 =?us-ascii?Q?CwKRdIlei9TZuSIesPdhEqXDN7QQRLo7qyy4LUidcFJ300ydazv77E64XnDP?=
 =?us-ascii?Q?ZZ+kawj5xXRN+O9arQWqkMDOGczUNljcy8yiD/XX9x5d46qWLL442yNLL9by?=
 =?us-ascii?Q?diXorHXdgqtiK6zh7VS1Jb7OLY+t6ramXoa/sLhzon7L1Q+KSTBakfsiqUpI?=
 =?us-ascii?Q?jt/BJbj4K92MbOxnTFriuV1MD6TlzBsntTCSBRAHSyxf1hK9mpOOG3IrvNBn?=
 =?us-ascii?Q?juaLjPgTEOvOM1SssjRf5OhqQpW1R6gME0O2ZZNUXjj3+XBiTlmi9UidAEVC?=
 =?us-ascii?Q?x2i24RquCNYebotCmXRzJi/8XaDo9SOV0z5/50Uim3kNI7hu3nKQVCu4foxv?=
 =?us-ascii?Q?wWQCamkC+qUumIuMjxDxL0GLvHZ/3BHZivhs8M8jxg8QBb1Gd9MEoulU6UJ3?=
 =?us-ascii?Q?1/jl/ctb5cCUFD9ONI4brZlWH9GcJppMPcQqJI2K1tKvi+DvRXzb8XZ6gyEF?=
 =?us-ascii?Q?2QFfnlo3LDqYlFUU5a3WXLjxtvw/bRVPBCEHW5CWu6JorDY2tg0E38E6gRRw?=
 =?us-ascii?Q?Rl/yRL3JVSMc/d3pvnjMyuo9O6kGS3HQ030/weaHSClzLbHV7PmgAOJecAU6?=
 =?us-ascii?Q?ha6m0NB7C6AX3NAZilzQF/rpWKQrLm1g7EIxnn223aoo/weqngu/5C+1ZmQl?=
 =?us-ascii?Q?VtO8dS4rA4iOuEDMD1kFv5tFQGvmpi9fBDvMVBM1r3SbRjtPi7/NAbczXbQD?=
 =?us-ascii?Q?+oADdfZpMQFJrn+A9dKmTmezWaJFA51D9J/a6uWz4WF28BE6hTJGIs9vDekf?=
 =?us-ascii?Q?6dKxMbpiwcBkp1yPpJEWYun8ktPZ0WLT8Qfg4iQPjOsX2Dhke/a64rHnmQNz?=
 =?us-ascii?Q?bZgc0QJvs0cUjb31NoSCSWCTdUv7uY/aH3qWlTuOAMUeVBjKzgY1085l3+5w?=
 =?us-ascii?Q?NuHJSXguFl1s3WBCzmWUWqYxvO7K9fCoQ8bIwzYEM85LqGcR1Xc5/6/8FLT3?=
 =?us-ascii?Q?5d53JHi0Na5ii+IUO5ktgMADjyB1QW/sUIstu1NVAuSPC92BsH5AjApRWs/7?=
 =?us-ascii?Q?q8jYOQg2Z4B9GKz2rjok9OEVdz3+l4oWD2r1MxHCoYsLdXjRag/K/khB4Aj7?=
 =?us-ascii?Q?tXXpYI36uXlH1vmK7oNyOstcQHE3e5LRz5ZFpd1ihirfe2VHKxvvi5zVQwnN?=
 =?us-ascii?Q?+oGP6jSmpArZMm7/zypBF1/EhHaByN0SKzmWoa0gDEvxgUZgjhWo0fPy0Sjj?=
 =?us-ascii?Q?soo4FT1+ULX/uru+uG2dT06pyngm8zAjC7Gm7tWjrfOQKzPKwiUC9d0WQIxQ?=
 =?us-ascii?Q?i5474ogUzgri63eYQTtfOKi0E3CrPQjfwcQDWhm9oNq1BOrGHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5xAzhTwwhsMiJPifUiEHNWna53gRa0IagJ7mU8QSp2hSHcFJkZu5OFfy8hDQ?=
 =?us-ascii?Q?oOb4wPlxRauUkbvAsvq7Dvr0q7TvEsdAQn/MJc2be8e1+VK/Up4FTzjoUhQC?=
 =?us-ascii?Q?ztJQFTn1PEwl9g7v5Gr08edT+kaLCTZ4HLGuiAPwG6dQZxMiRDFTFvANEUQc?=
 =?us-ascii?Q?0DNLlJCWdXdcQUV/gmr3ElPOiIwl1KVufcvXjZhOgoIns9c1BQJaSgHDbroR?=
 =?us-ascii?Q?n09E3bJ6biYrxYuxltw9QWIagP6sEJIcUtJVpYbIWPRmhnLDiJw63TeUZ5GS?=
 =?us-ascii?Q?e3uA15ZDfz4TcoiljJWBUCk97C4xa1cyzA0oXrMKWBartDYojKlgq/0a/tWR?=
 =?us-ascii?Q?Ny5Ri8uAgIcTQ5J5q59aBfdjci27DkvVEJ+/8LqqjWRV22JNRJ9c9Gj0tQcB?=
 =?us-ascii?Q?4wibxA/i2rj6rF7cHJIiAaMVzq6x63ibceduuyuS1VrPvfhfzLv5omGeSiWv?=
 =?us-ascii?Q?Tfy6jtSzczWGjs4Qywb2G02lJTo0qQo2cdB/2lsfB/4rXEWZdy2UOHshOrla?=
 =?us-ascii?Q?muy6KwTDEGGS6QUBbyXRz8jwH1hhxQAiCDqAYU/mRbDCPV+2Q2N+MAxzkwQa?=
 =?us-ascii?Q?6dYrMsGOS05NlDUnyYrGIsIKl3bBIpROOq3484MPbzqkSaP3w6Ce8MkLivIx?=
 =?us-ascii?Q?ILfWyUcG2z6//Ppai9t2yr2pNmAXpzGspJ9OWgPVk2pNgEpMF//65+j1A9Bk?=
 =?us-ascii?Q?D0Ny2VREKmfxsJzbdLKVVdEsjwZQQJrq7Cx0SRrQdV0G5KrDE5DAEF8v+ZIX?=
 =?us-ascii?Q?XjohlR0OfSoZv7o4cnO/8Fa8Dio8MGRCZ9oiZdhWHYAc1QWgCAD34VgKnNf7?=
 =?us-ascii?Q?y4e5dETTVPozB/mVASjuYnvHFyQg9mfBELoX2B2FykAk+Bq7s0NMkB1B+qVC?=
 =?us-ascii?Q?Q6ubaFKMSHrtTzRim/c8b/uN5ww8GCmK8IbjrHYVmvmu+BXJu2dtMXOlAa4e?=
 =?us-ascii?Q?QRuXXT0fgpQYJ799dhqzdk7kzPgWulFnOZOBkWGR6JmIsc+97y/jtsSsbpKH?=
 =?us-ascii?Q?9QBgKXjvo2xkTXT+kAMg1k18xs5hkECaFavRFqJzI9eEoV/Jp4kEcGWq32yt?=
 =?us-ascii?Q?1vtMqHiFx1EpiCHD17OB3SuM5jEDhGBZ/oXi6HRwUCQHs+S/0rPTVhSF+RxT?=
 =?us-ascii?Q?nTHMjDafrWzs4wb4SujUb2MsGbwcuKcRPEBTfl2sjONrAAwt606djbztdE3o?=
 =?us-ascii?Q?uSd/OElwZ871Gh0w7MKwUI3KcLPexgvpe6RlQL0JULIaPOzkKh4PNcnOHtVh?=
 =?us-ascii?Q?S7OFgI89+n6xeN+oySBQ/LezVaZlLXyUxg0X5wqAYwR5oU/KPs7yeRCLtRrz?=
 =?us-ascii?Q?LlhTrYi2e02hL8h0+q/LM37Hfep8CwI0hCagNchCZxp21iiTWBsTivFG8G1M?=
 =?us-ascii?Q?kDs2NtFvUbqCiNklLaE+Px9g2vUsVynK2ZD0FGLZbZP0HEO88DUeCNzKxJRZ?=
 =?us-ascii?Q?x5lrW8QeNQ8VrsJMWe5pLnZSZRteRDJxwRz2KgAD/90o4IE4Sr248FvHttYT?=
 =?us-ascii?Q?YeN6JZ0f3J1YuebzAfn92MmcA9KWi7zr/hwUMfJSF2bPJMr6wbE90QT7eZhm?=
 =?us-ascii?Q?k7m7cbOgatKtUQ6CNWQsZjmpESOh+F2k/pwgIVDezRT1P2C0IbvpkMSzD1eN?=
 =?us-ascii?Q?wXFjlm0EvE4t/yP02B3PixA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf64e187-6ab9-4fd7-3c74-08dcdd668ff6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:32:55.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLaULOvUDS5g3qjs1u1TqSyUMlu1af3uD6mkJZ7mglfXxZhDmrMRq9QG5FIXSZ1zAiW72lQjJu011WyU3JAsZF7WL5dF0sIS2CUdvr5lARy6mXjZrh5GKwiqkYjZ6ZRF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
X-Authority-Analysis: v=2.4 cv=Z/q+H2RA c=1 sm=1 tr=0 ts=66f4110b cx=c_pps a=7V8mf9/socFTThwl5N0qNQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=WyqX61epEs_fYRVEAk8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: hT_QIh4mo1-8C_LjIiTqaTDrbjR3HQNO
X-Proofpoint-GUID: hT_QIh4mo1-8C_LjIiTqaTDrbjR3HQNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-25_04,2024-09-25_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=902 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409250096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204956

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

8a6764d35e5 libctf: fix ref leak of names of newly-inserted non-root-visible types
d9ddfab9be2 ld: Move foo before delete in dl5.cc
3e92ae5088c ld: Avoid folding new and delete pairs

Results before updates as below:

No. of expected passes            302
No. of unexpected failures        2
No. of untested testcases         1
No. of unsupported tests          7

Results after updates as below:

No. of expected passes            302
No. of unexpected failures        2
No. of untested testcases         1
No. of unsupported tests          7

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


