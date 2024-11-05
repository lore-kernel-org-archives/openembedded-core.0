Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1242AD2B928
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:18:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17684.1730812702287122538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 05:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1039ed3882=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A56Lell009709
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Nov 2024 05:18:22 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nfc32std-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 05:18:21 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 05:18:21 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 05:18:21 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] nfs-utils: 2.7.1 -> 2.8.1
Date: Tue, 5 Nov 2024 05:18:20 -0800
Message-ID: <44bb925f1803f3ea9a629d7e19d1dba61b11f387.1730812604.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1730812604.git.liezhi.yang@windriver.com>
References: <cover.1730812604.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=T7feTOKQ c=1 sm=1 tr=0 ts=672a1b1d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=gu6fZOg2AAAA:8 a=mDV3o1hIAAAA:8 a=oSqaNTQplM8O2yGjxr8A:9 a=-FEs8UIgK8oA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=2RSlZUUhi9gRBrsHwhhZ:22
X-Proofpoint-GUID: gYjCShssvkruKuAHZfMIRXA6mlx8WUDH
X-Proofpoint-ORIG-GUID: gYjCShssvkruKuAHZfMIRXA6mlx8WUDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 13:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206711

From: Robert Yang <liezhi.yang@windriver.com>

* Remove patches already merged by upstream:
  0001-support-include-junction.h-Define-macros-for-musl.patch
  0001-support-junction-path.c-Fix-build-for-musl.patch

* Add PACKAGECONFIG[nfsdctl]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...de-junction.h-Define-macros-for-musl.patch | 46 -------------------
 ...t-junction-path.c-Fix-build-for-musl.patch | 35 --------------
 ...{nfs-utils_2.7.1.bb => nfs-utils_2.8.1.bb} |  6 +--
 3 files changed, 3 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.7.1.bb => nfs-utils_2.8.1.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
deleted file mode 100644
index c94990b969..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6f82ffa0e01e88e4e73972cb0125fcb6e78e27cf Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 8 Sep 2024 09:45:41 +0000
-Subject: [PATCH] support/include/junction.h: Define macros for musl
-
-Fixed 1:
-In file included from cache.c:1217:
-../../support/include/junction.h:128:21: error: expected ';' before 'char'
-  128 | __attribute_malloc__
-      |                     ^
-      |                     ;
-  129 | char            **nfs_dup_string_array(char **array);
-
-Fixed 2:
-junction.c: In function 'junction_set_sticky_bit':
-junction.c:164:39: error: 'ALLPERMS' undeclared (first use in this function)
-  164 |         stb.st_mode &= (unsigned int)~ALLPERMS;
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=172579572428765&w=2]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- support/include/junction.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/support/include/junction.h b/support/include/junction.h
-index 7257d80..d127dd5 100644
---- a/support/include/junction.h
-+++ b/support/include/junction.h
-@@ -26,6 +26,16 @@
- #ifndef _NFS_JUNCTION_H_
- #define _NFS_JUNCTION_H_
- 
-+/* For musl, refered to glibc's sys/cdefs.h */
-+#ifndef __attribute_malloc__
-+#define __attribute_malloc__ __attribute__((__malloc__))
-+#endif
-+
-+/* For musl, refered to glibc's sys/stat.h */
-+#ifndef ALLPERMS
-+#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/* 07777 */
-+#endif
-+
- #include <stdint.h>
- 
- /*
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
deleted file mode 100644
index ae2b0c566c..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ad4ec0c40aaea37b8e7ec3e73d7b35cbda2d3841 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 8 Sep 2024 08:34:28 +0000
-Subject: [PATCH] support/junction/path.c: Fix build for musl
-
-Fixed:
-path.c:164:24: error: implicit declaration of function 'strchrnul'; did you mean 'strchr'? [-Wimplicit-function-declaration]
-[snip]
-
-path.c:239:27: error: 'NAME_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=172579572228762&w=2]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- support/junction/path.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/support/junction/path.c b/support/junction/path.c
-index c25cc52..6e28df3 100644
---- a/support/junction/path.c
-+++ b/support/junction/path.c
-@@ -23,6 +23,12 @@
-  *	http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
-  */
- 
-+/* For musl */
-+#ifndef _GNU_SOURCE
-+#define _GNU_SOURCE
-+#endif
-+#include <limits.h>
-+
- #include <sys/types.h>
- #include <sys/stat.h>
- 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.7.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.7.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
index 849ea0e43b..488a1a7e70 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.7.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
@@ -31,10 +31,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-           file://0001-support-include-junction.h-Define-macros-for-musl.patch \
-           file://0001-support-junction-path.c-Fix-build-for-musl.patch \
            "
-SRC_URI[sha256sum] = "885c948a84a58bca4148f459588f9a7369dbb40dcc466f04e455c6b10fd0aa48"
+
+SRC_URI[sha256sum] = "a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28673ccfd2eff0c505"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -74,6 +73,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
+PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
 
-- 
2.25.1


