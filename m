Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 58E547CFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 16:40:49 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 60so2899841otu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xilmt45PxUJ/i/6k97kWLMyfxE3gC972Um87rBaeteM=;
	b=Sy8NB3zsx0DBB7EWdgs7EOl9fnPHEOPvkRfBnLvTkrLV1KN9eiiTvzhG9ml4HfxL33
	ztln8TkeHqDpEX00IU0KwfH8N3sI5dYDH/8fqm5M8O+Aw8zbeAGhLw2cJlmr5lUkJIeb
	rXvWlFtLOvlZdGywdIcWT12vhIVgDL6JRDeANUAcp3UNp8cGrhW1CXqbdAAeFO1UdCXm
	6DZS7RbRsVyu413fg5GlO1ruTURAu7w4OY6mP2iJq+TcyafXNY5zNhy8T8I03dFvTGun
	siiZrhChtxp4LERFUw8P5b31AK1lR3J0hmEehY9YE16fU2nahKv5yLKZYitkIOIYyfX0
	whhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xilmt45PxUJ/i/6k97kWLMyfxE3gC972Um87rBaeteM=;
	b=mbzA6lwm6DVPGT+Sl057hP4NBcurH8P6eiGZrA+T2DPTPrca7ES1+7JM8/9d6mVQhX
	0k0oaQsCn2L/Gr19eDSo9UpyFwXlvqqH9Hq+lfVEhFJqOYpknYf0npSaJcgFr7J/Zh5k
	wwH0MonReLi7IIm3UDWYvcA1k7pKUfHoyYRFlJQmwiL5WtvvFiU+IRh9Amd6/HwIbNF8
	deE4DLyu8Vtu2fQ1wtPvMuV3P2JOpdqDz767bQPJjCjrzI2ywM9LxK7iH4Vi0X79Q9FR
	tppuoqYdcFpafJgbgvoAskOVWnCNBCRszbJ3Z5QeZVoviAeI5hZQA7BVpNKt1sfZB4Tj
	lnlw==
X-Gm-Message-State: APjAAAXBJ6Ks8JH47MeoPw6UFI53njmUAq1kEa1dJ4tArWThjvD9Ihe/
	+lMPCMI7WJEuSRJOuZpAy/wriXJK44g=
X-Google-Smtp-Source: APXvYqwK+6kSVxrpxhIIVZh13Hje8l6wl2zrF1X5uJFc073sgSROV2uj3vFD6nnYdkXOxnZocf3t3g==
X-Received: by 2002:a9d:4aa:: with SMTP id 39mr7705485otm.229.1570120849584;
	Thu, 03 Oct 2019 09:40:49 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u130sm962390oib.56.2019.10.03.09.40.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 09:40:48 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
X-Google-Original-From: Nicola Lunghi <nicola.lunghi@jci.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2019 17:40:43 +0100
Message-Id: <20191003164043.17347-1-nicola.lunghi@jci.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta][PATCH] ofono: run oe-stylize over recipe
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
X-List-Received-Date: Thu, 03 Oct 2019 16:40:49 -0000
Content-Transfer-Encoding: 8bit

From: Nicola Lunghi <nick83ola@gmail.com>

Variable ordering changed slightly and add the SRC_URI to the inc file

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     | 32 +++++++++++--------
 meta/recipes-connectivity/ofono/ofono_1.30.bb |  6 ++--
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index bdbb0b5bc6..bbf31c3a9d 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -1,28 +1,31 @@
-HOMEPAGE = "http://www.ofono.org"
-SUMMARY  = "open source telephony"
+SUMMARY = "open source telephony"
 DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
-LICENSE  = "GPLv2"
+HOMEPAGE = "http://www.ofono.org"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
+DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
-inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
+SRC_URI = "\
+    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+    file://ofono \
+"
 
-DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
+inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
+SYSTEMD_SERVICE_${PN} = "ofono.service"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    "
+"
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
 
 EXTRA_OECONF += "--enable-test --enable-external-ell"
 
-SYSTEMD_SERVICE_${PN} = "ofono.service"
-
 do_install_append() {
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
@@ -30,10 +33,13 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-tests"
 
-RDEPENDS_${PN} += "dbus"
-RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
-
 FILES_${PN} += "${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/${BPN}/test"
-RDEPENDS_${PN}-tests = "python3-core python3-dbus"
-RDEPENDS_${PN}-tests += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)}"
+
+RDEPENDS_${PN} += "dbus"
+RDEPENDS_${PN}-tests = "\
+    python3-core \
+    python3-dbus \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)} \
+"
+RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.30.bb b/meta/recipes-connectivity/ofono/ofono_1.30.bb
index c916cb1b22..71c33e1287 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.30.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.30.bb
@@ -1,9 +1,7 @@
 require ofono.inc
 
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
+SRC_URI_append = " \
+    file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
 "
 SRC_URI[md5sum] = "2b1ce11a4db1f4b5c8cd96eb7e96ba0c"
 SRC_URI[sha256sum] = "8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c"
-- 
2.20.1


