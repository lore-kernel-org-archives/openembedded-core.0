Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B3FAF7198E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 03:19:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19183454"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 May 2017 11:19:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9F9A447C6526
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 11:19:33 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 23 May 2017 11:19:33 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 11:19:23 +0800
Message-ID: <1495509563-62240-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 9F9A447C6526.A6A65
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mesa: 17.0.4 -> 17.1.0
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
X-List-Received-Date: Tue, 23 May 2017 03:19:43 -0000
Content-Type: text/plain

1) Upgrade mesa from 17.0.4 to 17.1.0.
2) Modify one patch "0001-Use-wayland-scanner-in-the-path.patch", since the data has been changed.
3) License checksum changed,since the URL were changed. 

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../files/0001-Use-wayland-scanner-in-the-path.patch | 20 +++++++++++---------
 .../mesa/{mesa-gl_17.0.4.bb => mesa-gl_17.1.0.bb}    |  0
 meta/recipes-graphics/mesa/mesa.inc                  |  2 +-
 .../mesa/{mesa_17.0.4.bb => mesa_17.1.0.bb}          |  4 ++--
 4 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.4.bb => mesa-gl_17.1.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.4.bb => mesa_17.1.0.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
index e49695b..9295baf 100644
--- a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
@@ -1,37 +1,39 @@
-From 2f68fcaaf4964e7feeb383f5c26851965cda037c Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 15 Nov 2016 15:20:49 +0200
+From 82976409cc85537a490444532ff4302d6dc01f73 Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Thu, 18 May 2017 02:25:02 +0900
 Subject: [PATCH] Simplify wayland-scanner lookup
 
-Don't use pkg-config to lookup the path of a binary that's in the path.
+Don't use pkg-config to lookup the path of a binary that's in
+ the path.
 
 Alternatively we'd have to prefix the path returned by pkg-config with
 PKG_CONFIG_SYSROOT_DIR.
 
 Upstream-Status: Pending
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 ---
  configure.ac | 7 +------
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e56e35a..a92005a 100644
+index 0454070..78255c1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2020,12 +2020,7 @@ if test "x$with_egl_platforms" != "x" -a "x$enable_egl" != xyes; then
-     AC_MSG_ERROR([cannot build egl state tracker without EGL library])
+@@ -2179,12 +2179,7 @@ if test "x$with_platforms" != xauto; then
+     with_egl_platforms=$with_platforms
  fi
  
 -PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
 -        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
 -        WAYLAND_SCANNER='')
 -if test "x$WAYLAND_SCANNER" = x; then
--    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
 -fi
 +AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
  
  # Do per-EGL platform setups and checks
  egl_platforms=`IFS=', '; echo $with_egl_platforms`
 -- 
-2.1.4
+2.7.4
 
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.4.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.0.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0348bb2..b9fbc4b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=899fbe7e42d494c7c8c159c7001693d5"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
 
 PE = "2"
 
diff --git a/meta/recipes-graphics/mesa/mesa_17.0.4.bb b/meta/recipes-graphics/mesa/mesa_17.1.0.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_17.0.4.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.0.bb
index 396076d..8dded79 100644
--- a/meta/recipes-graphics/mesa/mesa_17.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
 
-SRC_URI[md5sum] = "4a16cfc1c6d034cc17314b866eada628"
-SRC_URI[sha256sum] = "1269dc8545a193932a0779b2db5bce9be4a5f6813b98c38b93b372be8362a346"
+SRC_URI[md5sum] = "ab1c7d44df6afd5d35286de57f762a74"
+SRC_URI[sha256sum] = "cf234a6ed4764673886b6661553b54675776ef0898f774716173cec890ac3b17"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.7.4




