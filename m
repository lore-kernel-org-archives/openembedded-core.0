Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 85EB071212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:06:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2014 10:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="565468735"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2014 10:06:40 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 20:06:34 +0300
Message-Id: <3c28456262cc72a9b68b93a328be0b7c5ffb352a.1409331937.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
Subject: [PATCH 3/3] alsa-utils: upgrade to 1.0.28
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
X-List-Received-Date: Fri, 29 Aug 2014 17:06:40 -0000

Changelog:
http://www.alsa-project.org/main/index.php/Changes_v1.0.27.2_v1.0.28

0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch updated.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...f_1.0.27.2.bb => alsa-utils-alsaconf_1.0.28.bb} |  0
 ...-t-let-systemd-unit-restore-the-volume-wh.patch | 42 ++++++++++++++--------
 ...alsa-utils_1.0.27.2.bb => alsa-utils_1.0.28.bb} |  6 ++--
 3 files changed, 30 insertions(+), 18 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.27.2.bb => alsa-utils-alsaconf_1.0.28.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.27.2.bb => alsa-utils_1.0.28.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index 477cd11..e99dd51 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -1,35 +1,44 @@
-From 37c99a3cbff36915b56a5703eeaed3c70796f80f Mon Sep 17 00:00:00 2001
+From 43a56fa36a12f09ccd78b3cf5e6ae197fcab501f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 9 Oct 2011 20:06:35 +0200
-Subject: [PATCH] alsactl: don't let systemd unit restore the volume when asound.state is missing
+Date: Fri, 29 Aug 2014 18:58:56 +0300
+Subject: [PATCH] alsactl: don't let systemd unit restore the volume when
+ asound.state is missing
 
 This avoids an error on bootup
 
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
 Filed as https://bugtrack.alsa-project.org/alsa-bug/view.php?id=5459
 
 Upstream-Status: Pending
 
-Index: alsa-utils-1.0.27.2/alsactl/Makefile.am
-===================================================================
---- alsa-utils-1.0.27.2.orig/alsactl/Makefile.am
-+++ alsa-utils-1.0.27.2/alsactl/Makefile.am
-@@ -36,8 +36,8 @@ install-data-hook:
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+---
+ alsactl/Makefile.am             | 7 ++++---
+ alsactl/alsa-restore.service.in | 1 +
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
+index 47f06e9..b728c06 100644
+--- a/alsactl/Makefile.am
++++ b/alsactl/Makefile.am
+@@ -43,9 +43,10 @@ install-data-hook:
  endif
  
  edit = \
 -	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
+-		  -e 's,@mydatadir\@,$(mydatadir),g' \
 -		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
-+	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' \
++	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' \
++	       -e 's,@sbindir\@,$(sbindir),g' \
++	       -e 's,@mydatadir\@,$(mydatadir),g' \
 +	       -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
  							< $< > $@ || rm $@
  
  alsa-state.service: alsa-state.service.in
-Index: alsa-utils-1.0.27.2/alsactl/alsa-restore.service.in
-===================================================================
---- alsa-utils-1.0.27.2.orig/alsactl/alsa-restore.service.in
-+++ alsa-utils-1.0.27.2/alsactl/alsa-restore.service.in
+diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
+index 245a439..b017854 100644
+--- a/alsactl/alsa-restore.service.in
++++ b/alsactl/alsa-restore.service.in
 @@ -10,6 +10,7 @@ DefaultDependencies=no
  After=alsa-state.service
  Before=shutdown.target
@@ -38,3 +47,6 @@ Index: alsa-utils-1.0.27.2/alsactl/alsa-restore.service.in
  
  [Service]
  Type=oneshot
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index 047fcfe..d6b24f1 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -11,12 +11,12 @@ PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/${BP}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "b65e9a04181bd7c9db7667a4566f8dc3"
-SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282edb352ea"
+SRC_URI[md5sum] = "361552d5b1cacd0a1e7ba09e69990211"
+SRC_URI[sha256sum] = "f3ff4c89b0125a7797b1b13cd094cc92276e655458274967386e812d03642acc"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
1.9.1


