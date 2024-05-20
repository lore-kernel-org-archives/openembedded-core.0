Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA65C25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:11:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56009.1716192662221831005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5870edb5a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K5PlDP003963
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:02 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y7bx6rq1j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbpWu4gFhdHS4OL3maI7+KFQmEa+k45uAvrykuxVFmRGksFFKovGau65kH2TYUmeFU1rrvQfpc+k2P43Bd0pZf2uruQjySg0YzMCOmzrth5r04JnsymWYJKnaUwNDYZrSbIUYWExbP1LPIbJDIS+UppPSl/fj2AA4xh3WMUjb718c9HCRW7rIxAYawENbjf8d1FFgg6xerjUfs5r4DClfBXBgQe1dslVRk9v64/H1+rT8fT8OB2x/g4lI5msYcvGVxYQyTEqEpXSmGlpE/3Z18OsCY/EnIhzB8pLSRSHeF9jAFLhf+hzCXehx2yzHNISNMhvgQjaarsJWxxOIQ9dWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+5T/SYaip2w6PEhkuUMpKbXbUxvqSiIEwaRruGPj+0=;
 b=MwaGekw+PIi/aTO4wPUCVeTHYFbgDQpg7dYnAtWsNP42Mx11TioZ+aENE2WV5OLY8XdxwAFTJD5CePD2WF08ap+tM3T0mKcN1e8of80SWmagUn5YCASFVf3wrdA5+HUJNsY5MBFJXsfKO3hdsflIcAimv5UkuBzXaLXDZcOkUy1VQJy+QXoto4dey+ObVRpJbdLq3RUsPZMfLix8pVqea6QKsMuBN5HGrz332ybYX0WizvlROajhqBn7Bt/KCIblXmKCmXOej7r2LTkjnuieUtwrM/Wxyf1A4I2KCKjYzHIzY9y61ok4Dew/GVZSfb2dYl+FrLE8gPgEW6qZJGhaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:10:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7544.052; Mon, 20 May 2024
 08:10:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] util-linux/util-linux-libuuid: upgrade from 2.39.3 to 2.40.1
Date: Mon, 20 May 2024 16:10:36 +0800
Message-Id: <20240520081040.2380736-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520081040.2380736-1-Qi.Chen@windriver.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 379ba0b3-d7ac-4ef0-9cc5-08dc78a461a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CLvD3VNHT3ZNOr4NiYvs4weyuePkVEr4iahxluAh6EtPjiQCAtIQlPoCK1fE?=
 =?us-ascii?Q?QaST453M2cRauzCsOHwDq2m427j76SEFt3WFLV+PCxZl14fe4WBphYojod1I?=
 =?us-ascii?Q?OywbnunZFxR+geuIvlYlAv5ZkTHusIdkYiK1Z/EJorvNcsS6W0FloK6MrQeL?=
 =?us-ascii?Q?J4HxpFgVFLpmsXxla/u8RIIgfPBB1YuUd1gjTmPjRj/YRUpFF/3zceUaOK6c?=
 =?us-ascii?Q?oHUm41BfbV8h5ueT2Y40GIxYwqphJ1A573uyQaRnr466DhSQxwNT5IJzmU+S?=
 =?us-ascii?Q?gRnQ8xyztnBVKNiYHnhSOcS1IXJIFGhtr0KtoccjrYmcNGvyojdFbMKa5KYL?=
 =?us-ascii?Q?7qSZZUE0ybGh3CfJi3sGlqzoHoIF0ZKX9PPymAMVU5ad2U7jYgtFKFyae/Uz?=
 =?us-ascii?Q?Dkrpa21ht2dMbjBe/0OvuSTw/s42wFNwuWX1kzAsdLG0feLFwvO7VPXAYpbC?=
 =?us-ascii?Q?NTCoYkmKHaSxCj14S3DXgjyLEniJW0bz5wsCMHVUJaV6GLEObzsnGzmxLYT1?=
 =?us-ascii?Q?gMhF0lqTi8ejyDaMBlQO2Fi+ZkjZi4al1MAsd7d03m2/nZIeH9FdOSa0XsYV?=
 =?us-ascii?Q?413U61zGY45bzKU5WlghMEWAlnDg39+VcBpr/d1azJa8uYIwdaHr6fGILafG?=
 =?us-ascii?Q?5TLJXm+6S31RNunNipb7PSbOmSBF1++t8qtwyf6odv1LSqGL3dXGNwer/Nx+?=
 =?us-ascii?Q?zoCdyMS0j98dixc25nEjL4n5iumvGU7frbmxTJ8A8ez0Q8cJITl/WQG6d7BW?=
 =?us-ascii?Q?Ibd/ksOVuHkdxZbY/jG2zBzaavelZ+GDxtEIYWj7l2XhOswtQ8KAL78s2/8q?=
 =?us-ascii?Q?e2TK/pxHDP8XyLDVLyPrtkdhvEkmlQVywgrePrXLf8OhSLLwX3cAlQNkXyrM?=
 =?us-ascii?Q?LIBstSJj58/u48vlFSnjZcgEgiLosjUJ/VXaFBiCfPnfVM6cLLGUo+93mDeD?=
 =?us-ascii?Q?pwXS7gOHjxvlpqbD5hZop9VpDXjLBnC3HGe8MfIhYqQFuX6NLiJpPDOk4ieo?=
 =?us-ascii?Q?7okiqNylce1LCGwxqZE1zQ1kso5Mx1uCyxLeky7LJ9/CDcAJwu1fanYNnmZ2?=
 =?us-ascii?Q?e3K5z3MZlDa43sOblen39RcjWo7rSop/YWQDeaDfNv3vwURIBq9lboSJ654W?=
 =?us-ascii?Q?nJ073S4dHOyEdcT+PpiAMx4gqXLJnKq5lyDIHzeG1ggRj+lMAN176zqZKFvm?=
 =?us-ascii?Q?6YVr9k4zC9cCdWktFNT7ck1TM793kSYGrEexGJ+Jgq3tGfsvw7YDqUDrClSC?=
 =?us-ascii?Q?smrEtd1U0lpQvPCB6H85GyhYi9q4udMJYLwCZ00EDA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JAAUL5L+zBgnJFNzbt3hlwquOcLXPiURqVoaslxMFHaL+Gkt6u9+08/+VNzM?=
 =?us-ascii?Q?GN0/ldKHpnpdwzSh9AqnZB8wI2aJknvATvQxbaN7qA5JVS318rZsoULbMqQZ?=
 =?us-ascii?Q?5GbRl9+gu8r1/yiyFL+4pwRjmG7YfZC9u6bcVPnJcii1sm1iHSnyNHaJm+b5?=
 =?us-ascii?Q?O9EBnCNkBheGi6cDScLR8+7yqiQXpLnYV96U1Too5YosGGyX4wP9W9j0yDma?=
 =?us-ascii?Q?zj4s/ga4M/sIco5VxizpX4PMEhLeqSf5w91Ui4LZjq3ERElMzkU2MPwi26OZ?=
 =?us-ascii?Q?xMZz+JQlh7mozDmXD5rN64cnH5htUj3XPWDcdyJQIzCnkvzbKY+xfeeZG85D?=
 =?us-ascii?Q?xHR90Wcli9fnTIyb4wzBomixwo4vHfUHCKUgPLsaEgie0bDzmVPGZbrU+IuX?=
 =?us-ascii?Q?Qn4Zk6qsrOmXSbGEgWTyMlcTzQEbWUtvy2ArDE+09gbgKZ79UAuH9Tu6jba/?=
 =?us-ascii?Q?BLXXa5s557m6Y0/jVeUL63E983/Somu6FiRONdL/kMbgh6EyUB+Dk2fUFfrq?=
 =?us-ascii?Q?VEkQWq+UJezVln6lBmkFld/cUI2zLGhyYUsnEM7DpEUXdYx9OVmiVbGne2Gv?=
 =?us-ascii?Q?mog1DtnkldHd5v2fpg8rdVGmHxLsKM72qDOz5Ek8Xm9E4It3AS5I/Yqj172Q?=
 =?us-ascii?Q?xTpRLZ9+Ni01uEaDYrrMzNbXe86/QDy67wWvJzO0muZDKTuEiX5ML8gGdyWp?=
 =?us-ascii?Q?0YjhZ/vSFK9kMxeC2AQuHUtaiXzzssIW9Md46lws+Is5xkNuCPVaPbuPsPdI?=
 =?us-ascii?Q?fuU221TTkqXoHiTuKaAri4MEDjGQbWdE5uTRp/3Geg42J1WmbL4mZCW9pUSY?=
 =?us-ascii?Q?NU5srNG9j1ZaavuB2ndjLidTOkryqd+iUq1i/cNEc6vZYKN97QgljyaoG62C?=
 =?us-ascii?Q?S0p83/38nevzWGRLjg4hfzYa64IZI0ENHEoaEHZqaFIDnNw0v/2gj1r0dREt?=
 =?us-ascii?Q?lf46ZXVgAEtbfBLvaYx0V7NZMLg/keQGOgrmZ7ClxOgREtzqVCwmXqnl6yxV?=
 =?us-ascii?Q?posfCmdFPkUwLiQSFFHCfUDwCJyQubczqLX7p9MrBQ2NULMvjSyshEx7NGMO?=
 =?us-ascii?Q?ZB08GE7iETRPSWaS6I6pJyhxSx+af153w7XQ8rLf5N34QA4WG8qMH77AdwNP?=
 =?us-ascii?Q?st332KprmThQ6jTKA+FUOq9xV3Y7DI/rr6dMDmBuZhDnk4Vijsq6YuOEKo+1?=
 =?us-ascii?Q?4sKsegFUDN//7m2JWSAOfDviMtu2sU/AwoQ7FcCLLSRTJC2lpe4PvWvrS7R4?=
 =?us-ascii?Q?o00akE9siU7hqi8gaw4CfB5IQH0sPQw1BXSk3oqtmRwFBG3EeGsRQojSq7d4?=
 =?us-ascii?Q?T6NcraEth1Nn6MlvEiCaOnbqjwh/+Tk9N0h1kT9aIVmnaWETPm7QC0T8Aru+?=
 =?us-ascii?Q?upa70oEp5t3pKNVUROR2q+9Yc1a127u/7dAKbnxQIZ09dLMKVEi3pBu1OZVp?=
 =?us-ascii?Q?3f9Wvs4uO0U/hLwXSxq0YI74v5Ov/Wv2CS+UzxDS4ke6GpCWfVBCX9wLZQU8?=
 =?us-ascii?Q?8LNxnaTTx5j0Yu5yfR2Cdc0TFM/RFnYQShEuX0XoE9mC/QiePrbCib9YzY9a?=
 =?us-ascii?Q?KNgB5gErE9yf92X8Ucu6dm5aId9NW0tJUqQyh4UQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379ba0b3-d7ac-4ef0-9cc5-08dc78a461a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:10:59.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWuF/zVjUnMfWRPSumbN6yUsw2f5V+cTxJ566Y8ftMUH1cE2wJzSP990+crKmQy071o0dFB49NiMt6oPYwBmmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-GUID: XfH-ELufBB5KTPlfGDGlqtWnsFPrPaYG
X-Proofpoint-ORIG-GUID: XfH-ELufBB5KTPlfGDGlqtWnsFPrPaYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199557

From: Chen Qi <Qi.Chen@windriver.com>

License-Update:
===============
GPL-2.0 is changed to GPL-2.0-only in README.licensing.

The following two patches are removed as they've been there in new release:

  0001-login-utils-include-libgen.h-for-basename-API.patch
  mit-license.patch

Other existing patches are refreshed to avoid patch-fuzz error.

A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to build Y2038
safe lastlog pam module. This is a new functionality added in 2.40.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.39.3.bb => util-linux-libuuid_2.40.1.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  8 +--
 ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  5 +-
 .../util-linux/configure-sbindir.patch        |  7 +--
 .../display_testname_for_subtest.patch        |  7 +--
 .../util-linux/util-linux/mit-license.patch   | 45 --------------
 .../util-linux/util-linux/ptest.patch         | 11 ++--
 ...l-linux_2.39.3.bb => util-linux_2.40.1.bb} |  3 +-
 9 files changed, 18 insertions(+), 128 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb => util-linux-libuuid_2.40.1.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb => util-linux_2.40.1.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d506783f9a..0f5f838e84 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 LICENSE:${PN}-fcntl-lock = "MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
@@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -30,7 +30,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
-           file://mit-license.patch \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
@@ -38,8 +37,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            file://fcntl-lock.c \
            "
 
-SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
+SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 6258710e1e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 19:59:46 -0800
-Subject: [PATCH] login-utils: include libgen.h for basename API
-
-musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
-
-include libgen.h for using the posix declaration of the funciton.
-
-Fixes
-
-../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-  847 |                 shell_basename = basename(shell);
-      |                                  ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- login-utils/su-common.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/login-utils/su-common.c b/login-utils/su-common.c
-index b674920..3297c78 100644
---- a/login-utils/su-common.c
-+++ b/login-utils/su-common.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <pwd.h>
- #include <grp.h>
-+#include <libgen.h>
- #include <security/pam_appl.h>
- #ifdef HAVE_SECURITY_PAM_MISC_H
- # include <security/pam_misc.h>
-@@ -840,17 +841,20 @@ static void run_shell(
- 				su->simulate_login ? " login" : "",
- 				su->fast_startup ? " fast-start" : ""));
- 
-+  char* tmp = xstrdup(shell);
- 	if (su->simulate_login) {
- 		char *arg0;
- 		char *shell_basename;
- 
--		shell_basename = basename(shell);
-+		shell_basename = basename(tmp);
- 		arg0 = xmalloc(strlen(shell_basename) + 2);
- 		arg0[0] = '-';
- 		strcpy(arg0 + 1, shell_basename);
- 		args[0] = arg0;
--	} else
--		args[0] = basename(shell);
-+	} else {
-+    args[0] = basename(tmp);
-+  }
-+  free(tmp);
- 
- 	if (su->fast_startup)
- 		args[argno++] = "-f";
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 85ad7a5575..8ea00dbb95 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
+From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -9,13 +9,12 @@ Revert run.sh script accordingly to serialize running tests
 
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 890212f..870e817 100644
+index 651ef2b..2a8012e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 75adeca188..74abdc2038 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
+From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by autoconf
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
-
 ---
  configure.ac | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 36c24b4..890212f 100644
+index 23594ff..651ef2b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
+@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 815ae9c915..871b0b2d30 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,20 +1,19 @@
-From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
+From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  tests/functions.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5a562a3..098145e 100644
+index 5fe5ba0..a6c703e 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -437,7 +437,7 @@ function ts_init_subtest {
+@@ -450,7 +450,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
deleted file mode 100644
index afbec98f18..0000000000
--- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 28 Mar 2024 12:16:57 +0000
-Subject: [PATCH] README.licensing/flock: Add MIT license mention
-
-Looking at the license text, flock.c is under the MIT license (see
-https://spdx.org/licenses/MIT).
-
-Add an SPDX license identifier header and add to the list of licenses the
-source so everything is correctly listed/identified.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
-
----
- README.licensing  | 2 ++
- sys-utils/flock.c | 4 +++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/README.licensing b/README.licensing
-index 4454f8392a..535ad34813 100644
---- a/README.licensing
-+++ b/README.licensing
-@@ -12,6 +12,8 @@ There is code under:
- 
-    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
- 
-+   * MIT                - MIT License
-+
-    * BSD-2-Clause       - Simplified BSD License
- 
-    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
-diff --git a/sys-utils/flock.c b/sys-utils/flock.c
-index fed29d7270..7d878ff810 100644
---- a/sys-utils/flock.c
-+++ b/sys-utils/flock.c
-@@ -1,4 +1,6 @@
--/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-+/*   SPDX-License-Identifier: MIT
-+ *
-+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-  *
-  *   Permission is hereby granted, free of charge, to any person
-  *   obtaining a copy of this software and associated documentation
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 6221de7182..7345926b88 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,24 +1,23 @@
-From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
+From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index effbb02..7d2bd1e 100644
+index 50ab8d0..7e2340d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
+@@ -64,6 +64,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
 +TESTS = $(check_PROGRAMS)
  
- PATHFILES =
- ADOCFILES_COMMON =
+ BUILT_SOURCES =
+ 
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
index 2cd7750afc..eceb0495a7 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -90,7 +90,7 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
+PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
 # inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
@@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-- 
2.34.1


