Return-Path: <tanuk@iki.fi>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224])
	by mail.openembedded.org (Postfix) with ESMTP id D14FC74A05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 15:30:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 22EEF158C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 22 May 2018 11:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=NS2qCfbj/jwqvtgzRs9VLGJDx86T+ZPS+LWT6Q3WJPE=; b=DQNzQVk+
	iatRJsuEqC9Dw3tf7omLGA47Vd015mFcaMkAaR6wc6fyl+4pEerc4zuaFFjG7ZeZ
	lrnN9jHlxQLTiy0l4FiJYmWmW2K77meOKrCXz8Fr8JnCWnEldG+aYx281Atnfj7N
	U1mFRUKRqkNNl11g3OjSaHsO6EbrUkecnkeYtDapqITA/eDT/KRWJWU47WnrTM9n
	yZpT2dy1akTNZS5AKe2tByXRxL5U/J8uD6GZIEeFwQg+Wf2D9TeR/q8XKhFkRw6W
	XivtKJvxpTXnFjnuJnzeLjOkoSyqgeQUji9mfY/aalm/tSExCQkrkNbwfv9OfnIB
	GWdVGVagyF1ioA==
X-ME-Proxy: <xmx:nTcEW1FB9OvhzNIRZBikcyOcURvDRiLJQN6Z8cLD_45HGvBHA3DnoA>
X-ME-Proxy: <xmx:nTcEW4yy6_vFARr-QjyHO1oqebvYCfHfWZpmvXvYaifv0t3wu16A2A>
X-ME-Proxy: <xmx:nTcEW5x9pDZr6AvxfZBi9YZDxiDYOIc8x-CvbmGOk6gszNUkTfKV6A>
X-ME-Proxy: <xmx:nTcEW2a5KCsCCpiTJ2A0pzR2vpdB5YSTuQtBmuDjpJZ_PZL-l4a8SQ>
X-ME-Proxy: <xmx:nTcEWzx8YfOa9h8t39cGAQ3O4RBNkGmK3aP1JGZfosQbfJeW6HDqFA>
X-ME-Proxy: <xmx:nTcEWyr2_aY_Eq3bXlOa1xnDe1He6lZBujkxOPV4oV6D4wmMMJPOdA>
X-ME-Sender: <xms:nTcEW-FB_a0TA0jDomRbYBWhxpGa8UCOvj2O0LUExVMxAs5FoBi-LQ>
Received: from localhost.localdomain (unknown [192.40.95.27])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8526F1025E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:36 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 18:30:11 +0300
Message-Id: <20180522153011.18761-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522153011.18761-1-tanuk@iki.fi>
References: <20180522153011.18761-1-tanuk@iki.fi>
Subject: [PATCH 3/3] alsa-utils: 1.1.5 -> 1.1.6
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
X-List-Received-Date: Tue, 22 May 2018 15:30:36 -0000

Dropped 0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch,
because an equivalent patch is included in the new release.

License-Update: FSF address updated

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...s_1.1.5.bb => alsa-utils-scripts_1.1.6.bb} |  0
 ...t-systemd-unit-restore-the-volume-wh.patch | 56 -------------------
 ...lsa-utils_1.1.5.bb => alsa-utils_1.1.6.bb} |  7 +--
 3 files changed, 3 insertions(+), 60 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.5.bb => alsa-utils-scripts_1.1.6.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.5.bb => alsa-utils_1.1.6.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.6.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.5.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.6.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
deleted file mode 100644
index 907ca5ce0e..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From b9d41b784657152a4c5683a9458dffab557f0689 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 29 Aug 2014 18:58:56 +0300
-Subject: [PATCH] alsactl: don't let systemd unit restore the volume when
- asound.state is missing
-
-This avoids an error on bootup
-
-Filed as https://bugtrack.alsa-project.org/alsa-bug/view.php?id=5459
-
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
-
-Rebased on 1.1.0.
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- alsactl/Makefile.am             | 7 ++++---
- alsactl/alsa-restore.service.in | 1 +
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 90fab9d..190525a 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -38,9 +38,10 @@ install-data-hook:
- endif
- 
- edit = \
--	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
--		  -e 's,@mydatadir\@,$(mydatadir),g' \
--		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
-+	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' \
-+	       -e 's,@sbindir\@,$(sbindir),g' \
-+	       -e 's,@mydatadir\@,$(mydatadir),g' \
-+	       -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
- 							< $< > $@ || rm $@
- 
- alsa-state.service: alsa-state.service.in
-diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
-index 80fd5fd..6beb36d 100644
---- a/alsactl/alsa-restore.service.in
-+++ b/alsactl/alsa-restore.service.in
-@@ -7,6 +7,7 @@
- Description=Save/Restore Sound Card State
- ConditionPathExists=!@daemonswitch@
- ConditionPathExistsGlob=/dev/snd/control*
-+ConditionPathExists=@localstatedir@/lib/alsa/asound.state
- 
- [Service]
- Type=oneshot
--- 
-2.14.2
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
index 33215bf159..b8ba0cb22a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
+                    file://alsactl/utils.c;beginline=1;endline=20;md5=2ce7f7b6739487fb72c689d46521f958"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
 
 PACKAGECONFIG ??= "udev"
@@ -20,11 +20,10 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "dfe6ea147a5e07a056919591c2f5dac3"
-SRC_URI[sha256sum] = "320bd285e91db6e7fd7db3c9ec6f55b02f35449ff273c7844780ac6a5a3de2e8"
+SRC_URI[md5sum] = "50ae75567459646b843bed78d916b002"
+SRC_URI[sha256sum] = "155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.17.0


