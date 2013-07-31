Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D82886B1FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:47:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2013 07:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="379514433"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2013 07:47:41 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 17:49:19 +0300
Message-Id: <c7b18db209a3d4a7f43e9609efdfb5dc3b7c2309.1375282034.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375282034.git.cristian.iorga@intel.com>
References: <cover.1375282034.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375282034.git.cristian.iorga@intel.com>
References: <cover.1375282034.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] alsa-utils: upgrade to 1.0.27.2
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
X-List-Received-Date: Wed, 31 Jul 2013 14:47:42 -0000

obsolete_automake_macros.patch,
uclibc-exp10-replacement.patch patches removed;
included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...f_1.0.26.bb => alsa-utils-alsaconf_1.0.27.2.bb} |  0
 ...-t-let-systemd-unit-restore-the-volume-wh.patch | 40 +++++++++-------------
 .../alsa/alsa-utils/obsolete_automake_macros.patch | 15 --------
 .../alsa/alsa-utils/uclibc-exp10-replacement.patch | 21 ------------
 ...alsa-utils_1.0.26.bb => alsa-utils_1.0.27.2.bb} |  7 ++--
 5 files changed, 19 insertions(+), 64 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.26.bb => alsa-utils-alsaconf_1.0.27.2.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.26.bb => alsa-utils_1.0.27.2.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index 1690ca5..477cd11 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -6,41 +6,35 @@ Subject: [PATCH] alsactl: don't let systemd unit restore the volume when asound.
 This avoids an error on bootup
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
 
 Filed as https://bugtrack.alsa-project.org/alsa-bug/view.php?id=5459
 
 Upstream-Status: Pending
 
- alsactl/Makefile.am             |    2 +-
- alsactl/alsa-restore.service.in |    1 +
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 5cfc415..c3768c4 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -34,7 +34,7 @@ install-data-hook:
+Index: alsa-utils-1.0.27.2/alsactl/Makefile.am
+===================================================================
+--- alsa-utils-1.0.27.2.orig/alsactl/Makefile.am
++++ alsa-utils-1.0.27.2/alsactl/Makefile.am
+@@ -36,8 +36,8 @@ install-data-hook:
  endif
  
  edit = \
--	$(SED) -r 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
-+	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
+-	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
+-		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
++	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' \
++	       -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
+ 							< $< > $@ || rm $@
  
- alsa-store.service: alsa-store.service.in
- 	$(edit)
-diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
-index e97d196..3b76710 100644
---- a/alsactl/alsa-restore.service.in
-+++ b/alsactl/alsa-restore.service.in
-@@ -4,6 +4,7 @@ DefaultDependencies=no
- After=sysinit.target
+ alsa-state.service: alsa-state.service.in
+Index: alsa-utils-1.0.27.2/alsactl/alsa-restore.service.in
+===================================================================
+--- alsa-utils-1.0.27.2.orig/alsactl/alsa-restore.service.in
++++ alsa-utils-1.0.27.2/alsactl/alsa-restore.service.in
+@@ -10,6 +10,7 @@ DefaultDependencies=no
+ After=alsa-state.service
  Before=shutdown.target
  Conflicts=shutdown.target
 +ConditionPathExists=@localstatedir@/lib/alsa/asound.state
  
  [Service]
  Type=oneshot
--- 
-1.6.6.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch b/meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
deleted file mode 100644
index 1a20b48..0000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [alsa-devel@alsa-project.org]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd alsa-utils-1.0.25/configure.in alsa-utils-1.0.25/configure.in
---- alsa-utils-1.0.25/configure.in	2012-01-25 11:43:48.000000000 +0200
-+++ alsa-utils-1.0.25/configure.in	2013-01-12 10:11:51.401498722 +0200
-@@ -269,7 +269,7 @@
-   TESTSOUND="$dir/test.wav")
- AC_SUBST(TESTSOUND)
-
--AM_CONFIG_HEADER(include/aconfig.h)
-+AC_CONFIG_HEADERS(include/aconfig.h)
-
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch b/meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
deleted file mode 100644
index b2a9a95..0000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-uclibc does not have exp10 function which is glibc extension.
-Bur we can get the same behavior by using pow()
-
-Upstream-Status: Pending
-
-Khem Raj <raj.khem@gmail.com>
-
-Index: alsa-utils-1.0.24.2/alsamixer/volume_mapping.c
-===================================================================
---- alsa-utils-1.0.24.2.orig/alsamixer/volume_mapping.c
-+++ alsa-utils-1.0.24.2/alsamixer/volume_mapping.c
-@@ -36,6 +36,9 @@
- #include <math.h>
- #include <stdbool.h>
- #include "volume_mapping.h"
-+#ifdef __UCLIBC__
-+#define exp10(x) (pow(10, (x)))
-+#endif /* __UCLIBC__ */
- 
- #define MAX_LINEAR_DB_SCALE	24
- 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index e0bf755..a894171 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -6,16 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0 udev"
-PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://uclibc-exp10-replacement.patch \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
-           file://obsolete_automake_macros.patch \
           "
 
-SRC_URI[md5sum] = "4dcf1017fafc91603af96705c073eca9"
-SRC_URI[sha256sum] = "f85f2a3aa6e78475bbe35b0cad3a8cabb99f45ebc5f37962f2137b8df8b081e7"
+SRC_URI[md5sum] = "b65e9a04181bd7c9db7667a4566f8dc3"
+SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282edb352ea"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
1.8.1.2


