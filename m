Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1152C7F54B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 17:21:54 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id m19so5594214otp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LDG/IznpGZ7e2Hp0qsI8onX062jmD4XLtNFNXmCbmnI=;
	b=dG+7MpbcUOclibUggm8nwKWGFSsTu81czUnmZ/AfSJeNj3XiPnyN75Fg/Szgq9kdrA
	SePjKGjF0MnRLwwUBvm01S94TUQsxDeGrHKHhYw35W1e8Sg96J300jnL6y7tPWHHdzoc
	lLFYj9LIGrziM0EdwGpzkuT195TwxBm3YBXEs9rImrvmsseRGkHzuIFJ/iFpmG7CeY/j
	QXRf+kyVniLD2Qq01FzVJjqnzUbSbaSkrEfdrssamIB262rtp8Kb42J16Uvfwf0rgHJV
	EyXpa4JQrDlnj9C3gMvSBaVrWu1Mzkc8yFr4wQbkVjTS7SAf0kWesHeooMYwLyVPq88/
	7+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LDG/IznpGZ7e2Hp0qsI8onX062jmD4XLtNFNXmCbmnI=;
	b=cksTEORLmQGar/mLyscabXGwyT7lgdWpWCYCeOH0fVjPxTYi8uPLxOHvPGQWpbJUT9
	hieHu+lE8yl/lrtQpFzzXnlNKlV3ZsvaBg+KGuf4UIrsWRSyIJKq7AC8AK2okGjj9OcK
	VUPn63bZ7Xj9pvSoxH92sC3WRR+I/nV2zSEw2xx1TdWAnBLn9c7RN0p7ay/NI8LVgd8G
	sRKXNUPUf6/S5JHh1HxkdCIQmu5fjYl+N5CxYf9ebcL9WA4kKVmdcwV5AfM87aOK5J7W
	8NozG3pJSfgExXGOhZdRDZ95HNtoR9fwlXzCTy9jEXu+74U8y8qkH5Zlh0gQBToMO4yZ
	IC4g==
X-Gm-Message-State: APjAAAURyWxe91+P+kcjfX2rpzsV//vjrC5MPQAu7/zyUK9Yv5uXtkcV
	2fNBbym8aW35HUEC2hmPQpQad/h1/Fk=
X-Google-Smtp-Source: APXvYqzPwWM+VE2vqFwZ54zYOBJlhaqSQ/ZFKZ9Dkrxe37Mr4UNmUW6rXdx1isS25CPtrMEipqt/gQ==
X-Received: by 2002:a9d:4719:: with SMTP id a25mr9132918otf.83.1570728115343; 
	Thu, 10 Oct 2019 10:21:55 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m14sm1757209otl.26.2019.10.10.10.21.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 10:21:54 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 18:21:44 +0100
Message-Id: <20191010172144.6081-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta][PATCH v2] ofono: tidy up the recipe
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
X-List-Received-Date: Thu, 10 Oct 2019 17:21:55 -0000
Content-Transfer-Encoding: 8bit

- remove the inc file
- run oe-stylize on the recipe
---
 meta/recipes-connectivity/ofono/ofono.inc     | 39 --------------
 meta/recipes-connectivity/ofono/ofono_1.30.bb | 51 +++++++++++++++++--
 2 files changed, 46 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono.inc

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
deleted file mode 100644
index bdbb0b5bc6..0000000000
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-HOMEPAGE = "http://www.ofono.org"
-SUMMARY  = "open source telephony"
-DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
-LICENSE  = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
-
-inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
-
-DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
-
-INITSCRIPT_NAME = "ofono"
-INITSCRIPT_PARAMS = "defaults 22"
-
-PACKAGECONFIG ??= "\
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    "
-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
-PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
-
-EXTRA_OECONF += "--enable-test --enable-external-ell"
-
-SYSTEMD_SERVICE_${PN} = "ofono.service"
-
-do_install_append() {
-  install -d ${D}${sysconfdir}/init.d/
-  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
-}
-
-PACKAGES =+ "${PN}-tests"
-
-RDEPENDS_${PN} += "dbus"
-RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
-
-FILES_${PN} += "${systemd_unitdir}"
-FILES_${PN}-tests = "${libdir}/${BPN}/test"
-RDEPENDS_${PN}-tests = "python3-core python3-dbus"
-RDEPENDS_${PN}-tests += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)}"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.30.bb b/meta/recipes-connectivity/ofono/ofono_1.30.bb
index c916cb1b22..10d5c90979 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.30.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.30.bb
@@ -1,9 +1,50 @@
-require ofono.inc
+SUMMARY = "open source telephony"
+DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
+HOMEPAGE = "http://www.ofono.org"
+BUGTRACKER = "https://01.org/jira/browse/OF"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
+DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
+SRC_URI = "\
+    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+    file://ofono \
+    file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
 "
 SRC_URI[md5sum] = "2b1ce11a4db1f4b5c8cd96eb7e96ba0c"
 SRC_URI[sha256sum] = "8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c"
+
+inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
+
+INITSCRIPT_NAME = "ofono"
+INITSCRIPT_PARAMS = "defaults 22"
+SYSTEMD_SERVICE_${PN} = "ofono.service"
+
+PACKAGECONFIG ??= "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+"
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
+PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
+
+EXTRA_OECONF += "--enable-test --enable-external-ell"
+
+do_install_append() {
+  install -d ${D}${sysconfdir}/init.d/
+  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
+}
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN} += "${systemd_unitdir}"
+FILES_${PN}-tests = "${libdir}/${BPN}/test"
+
+RDEPENDS_${PN} += "dbus"
+RDEPENDS_${PN}-tests = "\
+    python3-core \
+    python3-dbus \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)} \
+"
+
+RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
-- 
2.20.1


