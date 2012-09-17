Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDYoS-0008LA-Ax
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 12:44:24 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2223324wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=8vkROvFoYcc4c4ZBNQXz1ebWyJ5/Vpu9NeXKU6EIfh8=;
	b=DgDAV6SAdVh5bkS0Dj4S6DjewUT81OHTQoQF/dvsPbSGJkUwXEYZLqLJImHJDCOLzR
	X0QjFcwRSt38666pcLt65f8twH5ozu+CjGZqqdTn9ZBcBUsYo7L82QyAVLnQ84tTzmhP
	Q4Iep9ASDH50i7wkp5arPmcoUK0mlpwUYwIuq7Thj1vuQO8BrpFNbLGV4sTN/DVDeq4v
	rXin2FvcWnJcZbdNvHu2gq4tKellikIyXyfMM09ADGfquVTb67w43w6y6xQb6+g53Lt1
	o0bYG/Q4xxAM59WszAk9UuR/nej5kpHbY7nDqlBsT6vzWjj6mg3IXa+h2ISl79QYOlVQ
	fNXQ==
Received: by 10.180.98.200 with SMTP id ek8mr15277625wib.0.1347877908048;
	Mon, 17 Sep 2012 03:31:48 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t7sm24968727wix.6.2012.09.17.03.31.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:31:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:30:52 +0200
Message-Id: <1347877853-30738-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
References: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnWlmVbPLXo7FPUDvPYcLn8LVeCunY69Q3tPXRQ052i846UNnbd1tBtDXMzkaySIZoMqlYZ
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][bluez-updates 4/5] bluez4: update to ver. 4.101
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
X-List-Received-Date: Mon, 17 Sep 2012 10:44:24 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bluez/bluez4-4.101/bluetooth.conf              |   16 +++++++++
 .../bluez/bluez4-4.101/sbc_mmx.patch               |   24 +++++++++++++
 .../bluez/bluez4-4.99/bluetooth.conf               |   16 ---------
 .../bluez/bluez4-4.99/sbc_mmx.patch                |   24 -------------
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   35 +++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.99.bb     |   36 --------------------
 6 files changed, 75 insertions(+), 76 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
 create mode 100644 meta/recipes-connectivity/bluez/bluez4_4.101.bb
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4_4.99.bb

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
new file mode 100644
index 0000000..ca5e9e4
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
@@ -0,0 +1,16 @@
+<!-- This configuration file specifies the required security policies
+     for Bluetooth core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- ../system.conf have denied everything, so we just punch some holes -->
+
+  <policy context="default">
+    <allow own="org.bluez"/>
+    <allow send_destination="org.bluez"/>
+    <allow send_interface="org.bluez.Agent"/>
+  </policy>
+
+</busconfig>
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
new file mode 100644
index 0000000..98fab45
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
@@ -0,0 +1,24 @@
+on x86 and x86_64 gcc 4.7 complains
+
+sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
+sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't match constraints [enabled by default]
+sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
+
+This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: bluez-4.98/sbc/sbc_primitives_mmx.c
+===================================================================
+--- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000 -0800
++++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0800
+@@ -318,7 +318,7 @@
+ 				"movl          %k0, 4(%3)\n"
+ 			: "+r" (blk)
+ 			: "r" (&sb_sample_f[0][ch][sb]),
+-				"i" ((char *) &sb_sample_f[1][0][0] -
++				"r" ((char *) &sb_sample_f[1][0][0] -
+ 					(char *) &sb_sample_f[0][0][0]),
+ 				"r" (&scale_factor[ch][sb]),
+ 				"r" (&consts),
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
deleted file mode 100644
index ca5e9e4..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-<!-- This configuration file specifies the required security policies
-     for Bluetooth core daemon to work. -->
-
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-
-  <!-- ../system.conf have denied everything, so we just punch some holes -->
-
-  <policy context="default">
-    <allow own="org.bluez"/>
-    <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent"/>
-  </policy>
-
-</busconfig>
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
deleted file mode 100644
index 98fab45..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-on x86 and x86_64 gcc 4.7 complains
-
-sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
-sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't match constraints [enabled by default]
-sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
-
-This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: bluez-4.98/sbc/sbc_primitives_mmx.c
-===================================================================
---- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000 -0800
-+++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0800
-@@ -318,7 +318,7 @@
- 				"movl          %k0, 4(%3)\n"
- 			: "+r" (blk)
- 			: "r" (&sb_sample_f[0][ch][sb]),
--				"i" ((char *) &sb_sample_f[1][0][0] -
-+				"r" ((char *) &sb_sample_f[1][0][0] -
- 					(char *) &sb_sample_f[0][0][0]),
- 				"r" (&scale_factor[ch][sb]),
- 				"r" (&consts),
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
new file mode 100644
index 0000000..a2ba66f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -0,0 +1,35 @@
+require bluez4.inc
+
+PR = "r0"
+
+SRC_URI += "file://bluetooth.conf \
+            file://sbc_mmx.patch"
+
+SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
+SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
+
+do_install_append() {
+	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+}
+
+RDEPENDS_${PN}-dev = "bluez-hcidump"
+
+ALLOW_EMPTY_libasound-module-bluez = "1"
+PACKAGES =+ "libasound-module-bluez"
+
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/"
+FILES_${PN}-dev += "\
+  ${libdir}/bluetooth/plugins/*.la \
+  ${libdir}/alsa-lib/*.la \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/bluetooth/plugins/.debug \
+  ${libdir}/*/.debug \
+  ${base_libdir}/udev/.debug \
+  "
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
deleted file mode 100644
index 32831e7..0000000
--- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-require bluez4.inc
-
-PR = "r2"
-
-SRC_URI += "file://bluetooth.conf \
-            file://sbc_mmx.patch \
-           "
-
-SRC_URI[md5sum] = "570aa10692ed890aa0a4297b37824912"
-SRC_URI[sha256sum] = "d884b9aa5d3d9653c076b7646ca14a3e43eb84bccfe8193c49690f802bbd827c"
-
-do_install_append() {
-	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
-	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-}
-
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez"
-
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/"
-FILES_${PN}-dev += "\
-  ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/bluetooth/plugins/.debug \
-  ${libdir}/*/.debug \
-  ${base_libdir}/udev/.debug \
-  "
-- 
1.7.7.6



