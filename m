Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BA3C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:11:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.47538.1743412283854006136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61853fae95=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5QER8030616
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:11:23 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sv6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:11:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJu2F7//fa2iqX5ziZ42xFCFixu6C+9gDTfowbxndxabeTQXYOmToLKC5YhpKlvCKafmC9nShigwcpvmuwnSjSYelV1qRKvRGCePieMimLhejBmexbc3B3YHi/mERV9K7/z52bkLh0hAFlLYyJm5muuRsqRGMXRIDxvlfmf9HOTdmapxSMNyDZ3VZTGEfVKMy4d8FQ8xvkSsfe1M/V8KGu5YZqqZ22qPUVM9T3txP6D8PDILnLLkkwL8mO5LJhq0Y+7jf9MwORRX5W7Tjt9t4PVcppgOKFj+5sV0JHbGHZfnHkblaKEoCtfCA7vYtOZ4q8t7UvQw9tdOa8V+lM34IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myzw52M1TUOPBbICasYosCqTKyKejY8bfRevmM9SgqE=;
 b=wbV5d/rdJt9RTw4wZHwplmFOQSqWWJdfz7kQQJxkj94Q9vEle5SHd5vPymhK0QuwuIi6Vt05LTgUqEZ1OZMaqRdvZesEs9kg2/5LJV/ltDZw9JH+HFQW53TPkCxySv8PYRc/Sbq30NaUT+wb+V4Y8s8xJ3Rb/JZvhaye0ytkB6EULqm3eVuzCwMBNso9qoP6gjRvqXeSWHCOwux0Qb3N3y/chR+THwJPE1veqgMGNR9GqO6qGHivZB50b5lbdH4btg920+KwMqgl/yGeL69yQbAyoQYNJxkvhkcmPRk3FShbS/qQRIBHINUPQLx7DdGiF6v3SQ2rxe/f3Dt+1Ob6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 09:11:19 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 09:11:13 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/1][kirkstone] mesa: Update SRC_URI
Date: Mon, 31 Mar 2025 17:10:49 +0800
Message-Id: <20250331091049.2899672-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0289.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::14) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: f5314675-7864-4027-1fab-08dd7033fc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2in8rht0JzF7XzwDbkE5loCCKw2dnZw9wlF4jY5/J/XI9ILxOiA+yhQPd4hF?=
 =?us-ascii?Q?WvahLx1/afFEOvd2kc42jfyVhzlG9/eb64l3qa1ixZ9M8OLaetmqVMdp2DYt?=
 =?us-ascii?Q?e1Rt9pCzf1xxy/kZIh/Ke6fCclXss6DKVZpldu+1YVb1KxEFlzQ/y7PsMYaU?=
 =?us-ascii?Q?/81xdF2bWp+oANSDNAdd5meyFjb5xwyoQaMdPrgu1OdVFF6QWHR8fTLDv94H?=
 =?us-ascii?Q?EU1Tk+KPW7OP76pivLY6dKZEO4Pwmj6wjbVSD8+fEZbg9NMPzcmx3tYXzqxP?=
 =?us-ascii?Q?lNhQOMfkvaXAEFZhtJbWf4khphIih0uTQPI+p6gYrt9FakSm5OpnF94yd+uj?=
 =?us-ascii?Q?wnc/CtbpH1JknGCrhFcrsrXBJkPoUknqrLDUf61V0CjE6/NPPPZW5aaIMm2k?=
 =?us-ascii?Q?hFb50OGXZtkHLaj59HI2/zYD8RGlIF9SK06Rz259iWBg0nNfLGz+0qbJ7NyB?=
 =?us-ascii?Q?lXInJjVcK+sD1C2eDbyldMNSyBDObspfAEOVQywva0k6SPFO/eTIiX4VJllB?=
 =?us-ascii?Q?5eUxebNntnA2G5aTOBYkVVpMLusxJUscBefxe5uSD1H0Mem7puCUYY/T3LPu?=
 =?us-ascii?Q?UZUOiUePpYD0m8GjB4dZd0UG/JlsjBcmKY5ZAbOj8bDywqJsDsrtEBETNwqS?=
 =?us-ascii?Q?J/pzFn2VYuq5420/VsLyXy5sh/+byZq3lFd6DMqSV60BOMWLZvUUAR2CraYY?=
 =?us-ascii?Q?5Wj+L0VIVLmbR5YBbKKHAfi7LdXNs3DxEkDKdp6Fdgdw+TutFHkS1W0qHPWY?=
 =?us-ascii?Q?oKqZjm/c/DEmsJPKw6WOY7XLO4qLvhIIpGjP7GBTO/rDR7ozJgs2bqphHAf5?=
 =?us-ascii?Q?rJOT+YS+nGjlJk5PNdgAHxFmOwTrA7uCuYQjkK4CwdEaJRd/47SYva1rht9e?=
 =?us-ascii?Q?TJsUYAJtkFjplqj2PoEewXwLmO/RGAbO8VNPFbLh/pd4BD2e8kyxMvi60USZ?=
 =?us-ascii?Q?SiMCePooM53lWzyJLkcgTy3pQnew9gvLuLD+oX4V3tllOr1RktJowbF/G6vr?=
 =?us-ascii?Q?JdMo72G7VimStps3Jm1DC1BR1ScvdOAhQD4tFvhIEjTk362TjUiCIcKvRUxd?=
 =?us-ascii?Q?LfpFre3vuYxNzodyliV8pUAom7NnL/34Xy9TBFDVV8VhTYNqmQLBuEcli9nb?=
 =?us-ascii?Q?4jrmqvzCx99zcUFGBgL4SHj9L36nnKp2L3dwxbYGbJTOdQk1UMHAtCGEe2rb?=
 =?us-ascii?Q?NmAmz0TU5QLzDxmu5k4TLFZkL35HR8w5jo1nMzYRoKCwSHWjBBJPjXUdZFGj?=
 =?us-ascii?Q?95JlsjBl4CdEri7PJQhCY6TmnZZbZUqWfPdFsq71R8a6EpDeVJE00JpTLiFB?=
 =?us-ascii?Q?tD0UrI5r+BfOn7g3znX5QI9aBGcC8AKyfj47GXqQvFp71h3lmBBPp/EdNS5/?=
 =?us-ascii?Q?xPUZthjKy52vgqpPqOpId9fEGSe3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xSzYOn/bKWlSwX2VOLlszToiJjEFjEiVAk18q+j3fsTvRRev3irBJVH9NyHt?=
 =?us-ascii?Q?jSGJHr1eWP3G56QBGwjd/MpWwZk611Yl0MSKc8bk8KqsvtpHIjGp1FFepSHD?=
 =?us-ascii?Q?1lxL2XUhAVV5mTcxrmH+PzhjCv8zvYRqQE9pJNS9uCqRthUFaNPfAysIVxtL?=
 =?us-ascii?Q?pdJOEyN+lwuFdw/V1MW8reGdMz5SeY718f34tOrGyA6kiCIgb181GYtm0dF8?=
 =?us-ascii?Q?93keJmc0SYmWZUiRtxdfRkqbvuIr/4fqfBSyIX4cnYYNOGNv94DzYDB/oWFO?=
 =?us-ascii?Q?0rwhCOGpsLNoGQAYYnaRWzJ9XV4a11UGYkvvzFBhfqp1OD8wzrSJWypwbZw9?=
 =?us-ascii?Q?H5DE8trdBtkOvTHBxAYVcR12vLYDdkrBc/18IDKsEUxPhZXhQHiakgm0Ta16?=
 =?us-ascii?Q?OStXoYdS4Q+dWsZQ/AEdppJT0n0Dwik+fqPaO/ztIrFHCpQ40k0gk9ipuq8t?=
 =?us-ascii?Q?moJyVOo74Lc8+5pxqdIq3FhT5skRvcqL+XrN9NLWxtrENVuZNlzxEQwl/Cm2?=
 =?us-ascii?Q?5OOWaWZV1BN7V1hvXtjXgUKs7J2H7Zn/Di4Q+StY5GHljfbeqD9BpGE9gyoc?=
 =?us-ascii?Q?LmOX/Sx3Wd8yZWqQF36ZxPbfCe7+5veocf+fOHBzY/3uP1lU0uDXllUiHqZm?=
 =?us-ascii?Q?+s/pZFfzrG5pbx8bqhCQ3XUoMPsCRfcODp/5/9WOhbLGMaS5aFIQEWu7LUKY?=
 =?us-ascii?Q?q+if9CHUW2lcgkt+ClB0UuShAzyOYQ8IW5q1RMgzzR1ZGapuKyY9OkkddA+X?=
 =?us-ascii?Q?WCXTSq2iNHfs3BUCVC5W5trGs0UlN89ioZPn8xZEERLumbN8A91RpSd332Y7?=
 =?us-ascii?Q?REvl3ZGnufN0XEI/vXr4c+uEGNIJ9CiQyiywB/4T/iAFi4ddx/lHM0d/viLX?=
 =?us-ascii?Q?R5ETDOz+N4ByOvLrpJ5jufyIvqo62B9iAQbUup1dPve7AUBXns46esuzmRne?=
 =?us-ascii?Q?vX8ngUiYb3L3hYp/IISjfbEyqR7mCaDSWJr68XSCIbHNq1TX/2m3FDO5qp3V?=
 =?us-ascii?Q?9+3IWmCdd3RHYSIjTxS8SBqRDlB3FmCKOIoweA8lHXWAccYUX7nFC51IdheY?=
 =?us-ascii?Q?GMrdKHRN0dHKoksuhPBe+pG5pTuYef+mhlzpL2No1pO2IjfoaV2PoiFlxLlL?=
 =?us-ascii?Q?MmuVMJvt/73pka/GbhVVmSQwKEyOYpfd3x5Zw0rHtO9YB5SuoZv+pessT8mH?=
 =?us-ascii?Q?VGOLVuk9VpLL9+giUvCySzAEQAPSIN4C9og2dLPYep2YOpwoT3T9bv4o8Hxy?=
 =?us-ascii?Q?J528oS94ID502rAMLe01V/a/lrH4G3Z2LrrK7ioxlhGB84lUUEr+9rpGHOOr?=
 =?us-ascii?Q?z7GCe8HLDUuf0k4gOIFCXkgbcuXkLzgYP2ZVIP1P8i4a3PWL6kA10KuCqjpv?=
 =?us-ascii?Q?jTDBBTGNqJJkGpF4rQYZFYGNrMZFNutQLW5+8RyXZuXeC5VvMTD2RD6gB6ak?=
 =?us-ascii?Q?3zS/CNI1BSD4bXAV//TzWTzJOGswsWO5uovLmDMfHoO00GdUbcApgyGxWHxM?=
 =?us-ascii?Q?iREHsDwb0wxAHC/UHseFrVl9O4ctYlJEYp4UPTMXDbYjKh0Iitw2Gn9tVJod?=
 =?us-ascii?Q?E3SsIyxnZg6xqkHMB7k9JZdrjZgtYkPl3gjKTzQGtN51mW+rs+doqJzI+nQQ?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5314675-7864-4027-1fab-08dd7033fc27
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 09:11:13.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5U70yG5tuTi06kV2yXdEOlaojdkepD3tgeOSN5Pr310dH1Q3zszBw/K2JghTNpuGaCbHxJlXJ7k6rtM5BXDGFNQlaK9jUg0D7L4UySJIeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-Proofpoint-GUID: kgw96iGoSFs9dYIQRg2gDO8Uv0RVq3nD
X-Proofpoint-ORIG-GUID: kgw96iGoSFs9dYIQRg2gDO8Uv0RVq3nD
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67ea5c3b cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=t7CeM3EgAAAA:8 a=ztjdAAGsjJ5P99afZ2YA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213955

From: Guocai He <guocai.he.cn@windriver.com>

Update SRC_URI for mesa.
The the tarball of mesa has been changed
from:
https://mesa.freedesktop.org/archive/ 
to:
https://archive.mesa3d.org/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
index 01e5b35d0e..11ecb9a9eb 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/demos/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.bz2 \
            file://0001-mesa-demos-Add-missing-data-files.patch \
            file://0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch \
            file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afac8014fe..1dd7f695c0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58
 
 PE = "2"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+SRC_URI = "https://archive.mesa3d.org/older-versions/22.x/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-- 
2.34.1


