Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C08DA7E0DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4C8GhfJ008537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:04 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:16:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:21 +0800
Message-ID: <40644f9357484aa02aefd8a916e4f7f3a46732e7.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] apr: upgrade 1.6.5 -> 1.7.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2019 08:17:23 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch | 26 ++++++++++------------
 .../apr/{apr_1.6.5.bb => apr_1.7.0.bb}             |  4 ++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 rename meta/recipes-support/apr/{apr_1.6.5.bb => apr_1.7.0.bb} (96%)

diff --git a/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
index 5f5e7ea..d1a2ebe 100644
--- a/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
+++ b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
@@ -1,7 +1,7 @@
-From f4d6e45ed5d2ccffd1af4c2ccdf7099ba0dce137 Mon Sep 17 00:00:00 2001
+From 49661ea3858cf8494926cccf57d3e8c6dcb47117 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Wed, 14 Dec 2016 18:13:08 +0800
-Subject: [PATCH 6/7] apr: fix off_t size doesn't match in glibc when cross
+Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
  compiling
 
 In configure.in, it contains the following:
@@ -29,15 +29,16 @@ Change the above correspondingly.
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
 
 Upstream-Status: Pending
+
 ---
  configure.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 3b10422..a227e72 100644
+index 27b8539..fb408d1 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -1769,7 +1769,7 @@ else
+@@ -1801,7 +1801,7 @@ else
      socklen_t_value="int"
  fi
  
@@ -46,25 +47,25 @@ index 3b10422..a227e72 100644
  
  if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
      pid_t_fmt='#define APR_PID_T_FMT "hd"'
-@@ -1838,7 +1838,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize_t_fmt="ld"])
- APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt="u"])
- APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt="lu"])
+@@ -1873,7 +1873,7 @@ APR_CHECK_TYPES_FMT_COMPATIBLE(size_t, unsigned long, lu, [size_t_fmt="lu"], [
+ APR_CHECK_TYPES_FMT_COMPATIBLE(size_t, unsigned int, u, [size_t_fmt="u"])
+ ])
  
 -APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
 +AC_CHECK_SIZEOF(ssize_t)
  
+ dnl the else cases below should no longer occur;
  AC_MSG_CHECKING([which format to use for apr_ssize_t])
- if test -n "$ssize_t_fmt"; then
-@@ -1855,7 +1855,7 @@ fi
+@@ -1891,7 +1891,7 @@ fi
  
  ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
  
 -APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
 +AC_CHECK_SIZEOF(size_t)
  
+ # else cases below should no longer occur;
  AC_MSG_CHECKING([which format to use for apr_size_t])
- if test -n "$size_t_fmt"; then
-@@ -1872,7 +1872,7 @@ fi
+@@ -1909,7 +1909,7 @@ fi
  
  size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
  
@@ -73,6 +74,3 @@ index 3b10422..a227e72 100644
  
  if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
      # Enable LFS
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-support/apr/apr_1.7.0.bb
similarity index 96%
rename from meta/recipes-support/apr/apr_1.6.5.bb
rename to meta/recipes-support/apr/apr_1.7.0.bb
index 432e4ed..a58651d 100644
--- a/meta/recipes-support/apr/apr_1.6.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -20,8 +20,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            "
 
-SRC_URI[md5sum] = "ad4add8efdfe87330b88e5e788241775"
-SRC_URI[sha256sum] = "a67ca9fcf9c4ff59bce7f428a323c8b5e18667fdea7b0ebad47d194371b0a105"
+SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
+SRC_URI[sha256sum] = "e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
-- 
2.7.4


