Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id C18F16FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 22:45:54 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id rt7so3582729obb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1x5RG0Hn4Kru2jhOps6Ruy0W+mWw0VBEiDVxuz80CXo=;
	b=SWUA7UjKt87GCydeOgyycW66DMbPBRuO47OQ883j0+NMhrWX17caTOU72zm3GpK+/3
	G5msBqbu+1SRIuoVllmKLtjPCGrNUltyUqgBUIACpJb6S1uE7LkouPUsSmQ4bHyYs6JY
	dw5RUQN3MSpRthCAVdS7uCetWgzjUyCCMnisbKKe08qHHGxQNHNKPRaUiwefs0n4Q8gb
	7ruUueq4zmOAfxNAOLXttaJO+rYhnv3TjmsBWu4pVy5PwNmh39AUCn3/Hw3YUE8ywjQR
	oLMoMH6CX33G1pKRcztgipC/DDxUZKCkwxoUvhUrKUURg8IETpkIW6c6Kn851P/W58NM
	Ly8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1x5RG0Hn4Kru2jhOps6Ruy0W+mWw0VBEiDVxuz80CXo=;
	b=AxgPvUPPTBHoAb8ePWnzxtTGOgvwd++TLhUda5N1YJ4a8rc1bnL5/tr+aqqpzI5oI2
	qrBMchOIwmJ4323MAXy1szXCMfPFsbBNRCVPbRWw4dkA3cv5K1LTiAdn7J3SWS5ZE96c
	fpQYpi7MGzmCrBqL1lwC6LpjG9DExgMXzdgpGJaRKD2lYcoaBeM+eg6Gjqg2VcEFO6P0
	7zwdz8aX7Msut9c0YSBSDrUX8UT3OsMiwMF2OvPLg/yLZg/SOl4YqnDv5Azk/HCiW3X8
	Sqav/wdrxRCOjbelyFJmmWBXNMVlfZs6oCoox4S28PefbUwID/s8DO7pucwG/HoIQQ/+
	Dp7Q==
X-Gm-Message-State: AD7BkJJ/WQ2GG8v5qhMHBHQ4XxiNFsfNxZwzER1JXrPqXcgLbMEX3IVbdQF/eDnJ6+8NYA==
X-Received: by 10.182.245.138 with SMTP id xo10mr22821054obc.56.1456958755410; 
	Wed, 02 Mar 2016 14:45:55 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j7sm26757725obu.1.2016.03.02.14.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Mar 2016 14:45:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 14:45:49 -0800
Message-Id: <1456958749-4099-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] eudev: recipe formatting improvements
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
X-List-Received-Date: Wed, 02 Mar 2016 22:45:58 -0000

Formatting improvements only, no functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 124 ++++++++++++++++------------------
 1 file changed, 60 insertions(+), 64 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index 8a23e6c..c15dd89 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -1,33 +1,66 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-SRC_URI = "https://github.com/gentoo/${PN}/archive/v${PV}.tar.gz \
-	file://init \
-	file://local.rules \
-	file://udev-cache \
-	file://udev-cache.default \
-        file://run.rules \
-        file://udev.rules \
-        file://devfs-udev.rules \
-        file://links.conf \
-        file://permissions.rules \
-	"
-
 LICENSE = "GPLv2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-inherit autotools update-rc.d
+DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
+
+PROVIDES = "udev"
+
+SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz \
+           file://devfs-udev.rules \
+           file://init \
+           file://links.conf \
+           file://local.rules \
+           file://permissions.rules \
+           file://run.rules \
+           file://udev-cache \
+           file://udev-cache.default \
+           file://udev.rules \
+"
 
 SRC_URI[md5sum] = "e130f892d8744e292cb855db79935f68"
 SRC_URI[sha256sum] = "ce9d5fa91e3a42c7eb95512ca0fa2a631e89833053066bb6cdf42046b2a88553"
 
-LIC_FILES_CHKSUM="file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+inherit autotools update-rc.d
 
-DEPENDS = "glib-2.0-native glib-2.0 util-linux libxslt-native gperf-native kmod"
+EXTRA_OECONF = " \
+    --sbindir=${base_sbindir} \
+    --libexecdir=${nonarch_base_libdir} \
+    --with-rootlibdir=${base_libdir} \
+    --with-rootprefix= \
+"
 
-PROVIDES = "udev"
-RPROVIDES_${PN} = "hotplug udev"
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
+	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
+	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
+	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev-cache
 
-PACKAGES =+ "udev-cache"
-PACKAGES =+ "libudev"
+	install -d ${D}${sysconfdir}/default
+	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
+
+	touch ${D}${sysconfdir}/udev/cache.data
+
+	install -d ${D}${sysconfdir}/udev/rules.d
+	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
+
+	# Use classic network interface naming scheme
+	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
+
+	# Fix for multilib systems where libs along with confs are installed incorrectly
+	if ! [ -d ${D}${nonarch_base_libdir}/udev ]
+	then
+		install -d ${D}${nonarch_base_libdir}/udev
+		mv ${D}${base_libdir}/udev ${D}${nonarch_base_libdir}
+	fi
+
+	# hid2hci has moved to bluez4. removed in udev as of version 169
+	rm -f ${D}${base_libdir}/udev/hid2hci
+
+	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+}
 
 INITSCRIPT_PACKAGES = "eudev udev-cache"
 INITSCRIPT_NAME_eudev = "udev"
@@ -35,59 +68,22 @@ INITSCRIPT_PARAMS_eudev = "start 04 S ."
 INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
-RRECOMMENDS_${PN} += "udev-cache"
-
-
-FILES_libudev = "${base_libdir}/libudev.so.*"
+PACKAGES =+ "libudev"
+PACKAGES =+ "udev-cache"
 
 FILES_${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
-
-
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/libudev.h ${libdir}/libudev.so \
                    ${includedir}/udev.h ${libdir}/libudev.la \
-                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
-		   "
+                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
+FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-EXTRA_OECONF = "--with-rootlibdir=${base_libdir} \
-	     --sbindir=${base_sbindir} \
-	     --libexecdir=${nonarch_base_libdir} \
-	     --with-rootprefix= \
-"
-do_install_append(){
-	install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-        install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
-        sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
-        sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev-cache
-
-        install -d ${D}${sysconfdir}/default
-        install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
-
-        touch ${D}${sysconfdir}/udev/cache.data
-
-        install -d ${D}${sysconfdir}/udev/rules.d/
-
-        install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
-
-	# Fix for multilib systems where libs along with confs are installed incorrectly 
-        if ! [ -d ${D}${nonarch_base_libdir}/udev ]
-          then
-            install -d ${D}${nonarch_base_libdir}/udev
-            mv ${D}${base_libdir}/udev ${D}${nonarch_base_libdir}
-        fi
-
-        # hid2hci has moved to bluez4. removed in udev as of version 169
-        rm -f ${D}${base_libdir}/udev/hid2hci
-
-        echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
-
-        # Use classic network interface naming scheme
-        touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
-}
-
 python () {
     if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
 }
+
+RRECOMMENDS_${PN} += "udev-cache"
+
+RPROVIDES_${PN} = "hotplug udev"
-- 
1.9.1


