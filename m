Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A12CD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 13:31:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30026.1725802285442639148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 06:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99817c9fc0=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488DU8wB013600
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Sep 2024 06:31:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj448u1s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 06:31:24 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 06:31:24 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 8 Sep 2024 06:31:24 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] nfs-utils: 2.6.4 -> 2.7.1
Date: Sun, 8 Sep 2024 06:31:23 -0700
Message-ID: <0243382bd24ba48a951be696dd88ac93c808a9b2.1725802219.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1725802219.git.liezhi.yang@windriver.com>
References: <cover.1725802219.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _e5SSfH_6P1U6v0qLM3-PLSSKCZ3tPuZ
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66dda72c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=gu6fZOg2AAAA:8 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=MutnuFA7pU0So9yuQnUA:9
 a=-FEs8UIgK8oA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=2RSlZUUhi9gRBrsHwhhZ:22
X-Proofpoint-ORIG-GUID: _e5SSfH_6P1U6v0qLM3-PLSSKCZ3tPuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409080113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 13:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204300

From: Robert Yang <liezhi.yang@windriver.com>

* Remove 0001-tools-locktest-Use-intmax_t-to-print-off_t.patch, upstream has
  fixed it with %lld.

* Remove 0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch, it builds well
  with musl without this patch.

* Add libxml2 to DEPENDS to fix:
  configure: error: libxml2 not found.

* Add the following 2 patches to fix build errors with musl:
  0001-support-include-junction.h-Define-macros-for-musl.patch
  0001-support-junction-path.c-Fix-buld-for-musl.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...nclude-unistd.h-to-compile-with-musl.patch | 34 ------------
 ...de-junction.h-Define-macros-for-musl.patch | 46 ++++++++++++++++
 ...t-junction-path.c-Fix-build-for-musl.patch | 35 ++++++++++++
 ...locktest-Use-intmax_t-to-print-off_t.patch | 53 -------------------
 ...{nfs-utils_2.6.4.bb => nfs-utils_2.7.1.bb} |  8 +--
 5 files changed, 85 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.4.bb => nfs-utils_2.7.1.bb} (94%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
deleted file mode 100644
index 57d4660571..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 45597a58e98f351b18db8444292b1cf6dd0cd810 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sat, 9 Dec 2023 23:34:08 -0800
-Subject: [PATCH] reexport.h: Include unistd.h to compile with musl
-
-Fixed error when compile with musl
-reexport.c: In function 'reexpdb_init':
-reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werror=implicit-function-declaration]
-   62 |                 sleep(1);
-
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=170254661824522&w=2]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- support/reexport/reexport.h | 1 +
- 1 files changed, 1 insertions(+)
-
-diff --git a/support/reexport/reexport.h b/support/reexport/reexport.h
-index 85fd59c..02f8684 100644
---- a/support/reexport/reexport.h
-+++ b/support/reexport/reexport.h
-@@ -1,6 +1,8 @@
- #ifndef REEXPORT_H
- #define REEXPORT_H
- 
-+#include <unistd.h>
-+
- #include "nfslib.h"
- 
- enum {
--- 
-2.42.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
new file mode 100644
index 0000000000..c94990b969
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
@@ -0,0 +1,46 @@
+From 6f82ffa0e01e88e4e73972cb0125fcb6e78e27cf Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 8 Sep 2024 09:45:41 +0000
+Subject: [PATCH] support/include/junction.h: Define macros for musl
+
+Fixed 1:
+In file included from cache.c:1217:
+../../support/include/junction.h:128:21: error: expected ';' before 'char'
+  128 | __attribute_malloc__
+      |                     ^
+      |                     ;
+  129 | char            **nfs_dup_string_array(char **array);
+
+Fixed 2:
+junction.c: In function 'junction_set_sticky_bit':
+junction.c:164:39: error: 'ALLPERMS' undeclared (first use in this function)
+  164 |         stb.st_mode &= (unsigned int)~ALLPERMS;
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=172579572428765&w=2]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ support/include/junction.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/support/include/junction.h b/support/include/junction.h
+index 7257d80..d127dd5 100644
+--- a/support/include/junction.h
++++ b/support/include/junction.h
+@@ -26,6 +26,16 @@
+ #ifndef _NFS_JUNCTION_H_
+ #define _NFS_JUNCTION_H_
+ 
++/* For musl, refered to glibc's sys/cdefs.h */
++#ifndef __attribute_malloc__
++#define __attribute_malloc__ __attribute__((__malloc__))
++#endif
++
++/* For musl, refered to glibc's sys/stat.h */
++#ifndef ALLPERMS
++#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/* 07777 */
++#endif
++
+ #include <stdint.h>
+ 
+ /*
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
new file mode 100644
index 0000000000..ae2b0c566c
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
@@ -0,0 +1,35 @@
+From ad4ec0c40aaea37b8e7ec3e73d7b35cbda2d3841 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 8 Sep 2024 08:34:28 +0000
+Subject: [PATCH] support/junction/path.c: Fix build for musl
+
+Fixed:
+path.c:164:24: error: implicit declaration of function 'strchrnul'; did you mean 'strchr'? [-Wimplicit-function-declaration]
+[snip]
+
+path.c:239:27: error: 'NAME_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=172579572228762&w=2]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ support/junction/path.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/support/junction/path.c b/support/junction/path.c
+index c25cc52..6e28df3 100644
+--- a/support/junction/path.c
++++ b/support/junction/path.c
+@@ -23,6 +23,12 @@
+  *	http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
+  */
+ 
++/* For musl */
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++#include <limits.h>
++
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch
deleted file mode 100644
index 7d903e04bc..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e2e9251dbeb452f5382179023d8ae18b511167a1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 25 Jul 2023 23:47:08 -0700
-Subject: [PATCH] tools/locktest: Use intmax_t to print off_t
-
-off_t could be 64bit on 32bit architectures which means using %z printf
-modifier is not enough to print it and compiler will complain about
-format mismatch
-
-Fixes
-| testlk.c:84:66: error: format '%zd' expects argument of type 'signed size_t', but argument 4 has type '__off64_t' {aka 'long long int'} [-Werror=format=]
-|    84 |                         printf("%s: conflicting lock by %d on (%zd;%zd)\n",
-|       |                                                                ~~^
-|       |                                                                  |
-|       |                                                                  int
-|       |                                                                %lld
-|    85 |                                 fname, fl.l_pid, fl.l_start, fl.l_len);
-|       |                                                  ~~~~~~~~~~
-|       |                                                    |
-|       |                                                    __off64_t {aka long long int}
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=169035457128067&w=2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/locktest/testlk.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/tools/locktest/testlk.c b/tools/locktest/testlk.c
-index ea51f788..9d4c88c4 100644
---- a/tools/locktest/testlk.c
-+++ b/tools/locktest/testlk.c
-@@ -2,6 +2,7 @@
- #include <config.h>
- #endif
- 
-+#include <stdint.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <unistd.h>
-@@ -81,8 +82,8 @@ main(int argc, char **argv)
- 		if (fl.l_type == F_UNLCK) {
- 			printf("%s: no conflicting lock\n", fname);
- 		} else {
--			printf("%s: conflicting lock by %d on (%zd;%zd)\n",
--				fname, fl.l_pid, fl.l_start, fl.l_len);
-+			printf("%s: conflicting lock by %d on (%jd;%jd)\n",
-+				fname, fl.l_pid, (intmax_t)fl.l_start, (intmax_t)fl.l_len);
- 		}
- 		return 0;
- 	}
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.7.1.bb
similarity index 94%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.7.1.bb
index 9aa8bc4eab..849ea0e43b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.7.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libevent util-linux sqlite3 libtirpc"
+DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2"
 RDEPENDS:${PN} = "${PN}-client"
 RRECOMMENDS:${PN} = "kernel-module-nfsd"
 
@@ -31,10 +31,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-           file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
-           file://0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch \
+           file://0001-support-include-junction.h-Define-macros-for-musl.patch \
+           file://0001-support-junction-path.c-Fix-build-for-musl.patch \
            "
-SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
+SRC_URI[sha256sum] = "885c948a84a58bca4148f459588f9a7369dbb40dcc466f04e455c6b10fd0aa48"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.44.1


