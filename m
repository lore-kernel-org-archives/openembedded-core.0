Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TylDX-0003C4-RN
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:29:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2013 07:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,538,1355126400"; d="scan'208";a="252419720"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2013 07:12:43 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 17:13:34 +0200
Message-Id: <1359126814-2266-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Sudo : upgrade to 1.8.6p4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 15:29:24 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 meta/recipes-extended/sudo/files/libtool.patch     |   28 ++++++++++++++++----
 .../sudo/{sudo_1.8.5p2.bb => sudo_1.8.6p4.bb}      |    6 ++---
 2 files changed, 26 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.5p2.bb => sudo_1.8.6p4.bb} (83%)

diff --git a/meta/recipes-extended/sudo/files/libtool.patch b/meta/recipes-extended/sudo/files/libtool.patch
index b0cd675..10456d2 100644
--- a/meta/recipes-extended/sudo/files/libtool.patch
+++ b/meta/recipes-extended/sudo/files/libtool.patch
@@ -1,14 +1,22 @@
-Fix path to libtool scripts so autoreconf can succeed.
+From 8f89e456b2c23d78646a938ee5d4c5477c06c28d Mon Sep 17 00:00:00 2001
+From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Date: Fri, 25 Jan 2013 16:18:37 +0200
+Subject: [PATCH] Fix path to libtool scripts so autoreconf can succeed.
 
 Upstream-Status: Inappropriate [Other]
 Workaround is specific to our build system.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ aclocal.m4 |   14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
 
-diff -urN sudo-1.7.4p4.orig//aclocal.m4 sudo-1.7.4p4//aclocal.m4
---- sudo-1.7.4p4.orig//aclocal.m4	2010-08-06 07:17:36.000000000 -0700
-+++ sudo-1.7.4p4//aclocal.m4	2010-11-22 14:38:20.360957038 -0800
-@@ -368,8 +368,8 @@
+diff --git a/aclocal.m4 b/aclocal.m4
+index 481ffeb..0c53eeb 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -364,13 +364,13 @@ EOF
  dnl
  dnl Pull in libtool macros
  dnl
@@ -22,3 +30,13 @@ diff -urN sudo-1.7.4p4.orig//aclocal.m4 sudo-1.7.4p4//aclocal.m4
 +m4_include([m4/ltsugar.m4])
 +m4_include([m4/ltversion.m4])
 +m4_include([m4/lt~obsolete.m4])
+ dnl
+ dnl Pull in other non-standard macros
+ dnl
+-m4_include([ax_check_compile_flag.m4])
+-m4_include([ax_check_link_flag.m4])
++m4_include([m4/ax_check_compile_flag.m4])
++m4_include([m4/ax_check_link_flag.m4])
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.5p2.bb b/meta/recipes-extended/sudo/sudo_1.8.6p4.bb
similarity index 83%
rename from meta/recipes-extended/sudo/sudo_1.8.5p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.6p4.bb
index 4e4a443..115439b 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.6p4.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "dc42ed9f0946d92273762d0ae7314d59"
-SRC_URI[sha256sum] = "c32ae2bc3faf83444c82ca75ccb10ad3684d8222e3535f164c4a4db7cdddf8cf"
+SRC_URI[md5sum] = "cd19154e341b28573801397f0736126b"
+SRC_URI[sha256sum] = "364ad88ca3afcadcff6bd6820b0af19c56ce4876704dae210e21845d923e59e8"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5



