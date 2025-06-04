Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33470C71134
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11711.1749026731936099184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ax1qph0d;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026732; x=1780562732;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/5geFiDlwW/wLa/cYZTzVRCwCcioTsY5iKKWE4zeqfI=;
  b=ax1qph0dvTfD/WphE2Hgpccui0ks08BhN9kH4Pa6/89hdhbvTF0Wmdux
   7H3kp+voQrzVFC59V+0/I0kbKDv4As+rXZjWclil7MvmIGUkXBIURTknq
   whp8nxoIYAgGPU1Y4MNdKU2NuDylbch2VHHe0WCHXOUmOqHdloVeTPAeM
   GIQ0QjrRBSZo4eeNvBVrhzcJbvxjbJL1opnDaf4uqaCrD9GlXMSDA1u77
   h8BoD4sbhwK3bHAw6h2QvnKrn9dtD3VKPI4Dh1xCiAak6atJ5QzhfFvTa
   lzLbvy1EqmnXirOu2Bk05YXA0v0MQLM4tNX1O3UWmxrhXJdrn1H1us6RA
   Q==;
X-CSE-ConnectionGUID: 8FNU9Bp5SsyjimQuhBbanw==
X-CSE-MsgGUID: vXeuVV8lS9+4zuTk9cchig==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="180576683"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="180576683"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CC117C0FD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DFE58BF3C1
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:26 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3386F1A0078;
	Wed,  4 Jun 2025 16:45:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/45] apr: upgrade 1.7.5 -> 1.7.6
Date: Wed,  4 Jun 2025 16:44:39 +0800
Message-ID: <20250604084524.864-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217848

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-option-to-disable-timed-dependant-tests.patch
0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
0002-apr-Remove-workdir-path-references-from-installed-ap.patch
0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
refreshed for 1.7.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Add-option-to-disable-timed-dependant-tests.patch | 11 +++++------
 ...e-Remove-runtime-test-for-mmap-that-can-map-.patch |  7 +++----
 ...ve-workdir-path-references-from-installed-ap.patch |  9 ++++-----
 ...e.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch | 11 ++++-------
 .../apr/{apr_1.7.5.bb => apr_1.7.6.bb}                |  2 +-
 5 files changed, 17 insertions(+), 23 deletions(-)
 rename meta/recipes-support/apr/{apr_1.7.5.bb => apr_1.7.6.bb} (98%)

diff --git a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
index b46dc76a86..72a2ab777e 100644
--- a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
+++ b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
@@ -1,4 +1,4 @@
-From 225abf37cd0b49960664b59f08e515a4c4ea5ad0 Mon Sep 17 00:00:00 2001
+From dc02ac2f43e47178a9b1f35ef6906d7835dc121b Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Thu, 26 Mar 2020 18:30:36 +0000
 Subject: [PATCH] Add option to disable timed dependant tests
@@ -9,7 +9,6 @@ a timer or other timing related issues.
 
 Upstream-Status: Submitted [https://github.com/apache/apr/pull/54]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
 ---
  configure.in     | 6 ++++++
  include/apr.h.in | 1 +
@@ -17,10 +16,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  3 files changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index bfd488b..3663220 100644
+index 0ce20ab..3d42953 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -3023,6 +3023,12 @@ AC_ARG_ENABLE(timedlocks,
+@@ -3119,6 +3119,12 @@ AC_ARG_ENABLE(timedlocks,
  )
  AC_SUBST(apr_has_timedlocks)
  
@@ -34,10 +33,10 @@ index bfd488b..3663220 100644
  # so getaddrinfo/gai_strerror are not used.
  if test $have_ipv6 = 0; then
 diff --git a/include/apr.h.in b/include/apr.h.in
-index ee99def..c46a5f4 100644
+index 637ed38..e7cb9b9 100644
 --- a/include/apr.h.in
 +++ b/include/apr.h.in
-@@ -298,6 +298,7 @@ extern "C" {
+@@ -307,6 +307,7 @@ extern "C" {
  #define APR_HAS_XTHREAD_FILES     @apr_has_xthread_files@
  #define APR_HAS_OS_UUID           @osuuid@
  #define APR_HAS_TIMEDLOCKS        @apr_has_timedlocks@
diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
index 3480deaa4d..7e22270b88 100644
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -1,4 +1,4 @@
-From 316b81c462f065927d7fec56aadd5c8cb94d1cf0 Mon Sep 17 00:00:00 2001
+From 84990901ba642238779c74a003c1f5e572ab8d38 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Aug 2022 00:28:08 -0700
 Subject: [PATCH] configure: Remove runtime test for mmap that can map
@@ -10,16 +10,15 @@ mutexes
 
 Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  configure.in | 30 ------------------------------
  1 file changed, 30 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 3663220..dce9789 100644
+index 3d42953..7e43b0f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -1303,36 +1303,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
+@@ -1391,36 +1391,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
  APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
  AC_CHECK_FILE(/dev/zero)
  
diff --git a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
index d63423f3a1..2a9cfb0f3d 100644
--- a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
+++ b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
@@ -1,4 +1,4 @@
-From 689a8db96a6d1e1cae9cbfb35d05ac82140a6555 Mon Sep 17 00:00:00 2001
+From 5050645e626a8ee91a7f45070ef2d3911e1870d7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 09:39:06 +0800
 Subject: [PATCH] apr: Remove workdir path references from installed apr files
@@ -13,16 +13,15 @@ packages at target run time, the workdir path caused confusion.
 Rebase to 1.6.3
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  apr-config.in | 32 ++------------------------------
  1 file changed, 2 insertions(+), 30 deletions(-)
 
 diff --git a/apr-config.in b/apr-config.in
-index bed47ca..47874e5 100644
+index 626d3b0..42be269 100644
 --- a/apr-config.in
 +++ b/apr-config.in
-@@ -164,16 +164,7 @@ while test $# -gt 0; do
+@@ -179,16 +179,7 @@ while test $# -gt 0; do
      flags="$flags $LDFLAGS"
      ;;
      --includes)
@@ -39,7 +38,7 @@ index bed47ca..47874e5 100644
      ;;
      --srcdir)
      echo $APR_SOURCE_DIR
-@@ -197,33 +188,14 @@ while test $# -gt 0; do
+@@ -212,33 +203,14 @@ while test $# -gt 0; do
      exit 0
      ;;
      --link-ld)
diff --git a/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
index 02634e6fde..bd8e7786ba 100644
--- a/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
+++ b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
@@ -1,7 +1,7 @@
-From 2e66cece0c3adff92733332111204ddc1d730a07 Mon Sep 17 00:00:00 2001
+From 2f5db35d6c6b4d40e04591c98d297ef764777aa3 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 19 Nov 2015 18:25:38 -0800
-Subject: [PATCH 5/7] configure.in: fix LTFLAGS to make it work with ccache
+Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
 
 When ccache is enabled, libtool requires --tag=CC when use ccache,
 otherwise when building apr-util with ccache enabled:
@@ -19,10 +19,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 361120f..3b10422 100644
+index b0457e2..0ce20ab 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -249,7 +249,7 @@ case $host in
+@@ -266,7 +266,7 @@ case $host in
      ;;
  *)
      if test "x$LTFLAGS" = "x"; then
@@ -31,6 +31,3 @@ index 361120f..3b10422 100644
      fi
      if test "$experimental_libtool" = "yes"; then
          # Use a custom-made libtool replacement
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.6.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.5.bb
rename to meta/recipes-support/apr/apr_1.7.6.bb
index 83d84bfdb6..13fa5daa3c 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
            "
 
-SRC_URI[sha256sum] = "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
+SRC_URI[sha256sum] = "49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.43.0


