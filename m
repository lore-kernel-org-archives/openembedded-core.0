Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBD97198A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 22:23:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z81so7690984wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 14:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Db3KOAWx1oSTehTpAeT2vbHsEXoI7imz/VW/o355Bkw=;
	b=nha6gPRnbLw+i3ZjZgGihR9e19iWntQCH4DXgq8ljiMtNhpPxanA4C8WWPhOpM34SU
	8QH544+jJlVgG6Od9DB7ZcJc2vnkWcnjONaUzDxS8kwbtYCvY/KRwOIr+qzZwKhrbTsJ
	X1RzrnVs57e5t5L8bRINXvbPfc3eB3onGwYlAuQxp5UFwCWzf8q+s3MiagRIVc2Wi4k4
	heOPUBJKfhTIzNNuwghD+XPJ64kN5qVB8IrGooTq3E7pY+BWGs6pBreT+1m6m5UML4ZV
	sPeMlqBgX/Yo8l/6auXe4iJIZvOYOnVmoVLMZcj1rg/In6NV6rVbNCRhOFtj7BwjJEHP
	1bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Db3KOAWx1oSTehTpAeT2vbHsEXoI7imz/VW/o355Bkw=;
	b=ZSNvgedYK6ZmuP12hUpRD6mVJQDB3edbx3bsBa27VJuNKw3GRetJhIjsK4rTbgtu7M
	cIxTDyHkVPWzVKOMu5oAxK4YDgJSycbjSibI9Nx0LpYgPtoZ5JL2OyJnE0M2PAVx+3W3
	JOpzU9TpTkUvGDt6Txb+isg4dKaYqMnNiFeICNRtG7U1qjfKQrDIHe9ux6oUF+l1VFhF
	wWi3niuJnuQ62TxPMKj5FuZhKigm/ikO7VaBWusOU0dZPEuCV6ydoHeg4xG1AgGqqqGP
	ue9LrPQas4cOQ3RFkZAFW3I8/2F+fohETKqTOxKYddlbZeGabl/eCgnjhvsfmdh9fO3R
	Axkw==
X-Gm-Message-State: APf1xPD3m0Pg3ZC4ZRMOKPV4OhnyYrQ7j9S8eVqMoRtfFbzsGCzEc2sV
	ob/zJ+MY6TM4ZVRm/eG11Hal5A==
X-Google-Smtp-Source: AG47ELsoio7zuiWBULgV59iD7BxP29KRQi7KlNY0DwmkGxAj3oGtByGJ7dd0jst9yqqAdFx/WtM2dA==
X-Received: by 10.80.179.73 with SMTP id r9mr30298562edd.78.1520461434748;
	Wed, 07 Mar 2018 14:23:54 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27])
	by smtp.gmail.com with ESMTPSA id f6sm15850671edl.9.2018.03.07.14.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Mar 2018 14:23:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 23:23:43 +0100
Message-Id: <20180307222343.11703-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] libiio: update and improve recipe
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
X-List-Received-Date: Wed, 07 Mar 2018 22:23:54 -0000

* Update to latest version 0.14.
* Make depends on avahi, libusb1 and libxml2 optional by
  PACKAGECONFIG or DISTRO flags.
* Install iiod.service file

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 32 ++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index d66ac58d5..ba380ed30 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,21 +4,41 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "08f947d5e40600259bb698c3b95538e9f2bfecc2"
-PV = "0.8+git${SRCPV}"
+SRCREV = "fa82974d8bd1fded78e630ab71a7ded1b11d0e33"
+PV = "0.14+git${SRCPV}"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git"
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "flex-native bison-native avahi libaio libusb1 libxml2"
+inherit cmake pythonnative systemd
 
-inherit cmake pythonnative
+DEPENDS = " \
+    flex-native bison-native libaio \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+"
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
+"
+
+PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
+
+PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
+PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
 
 RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
 
-FILES_${PN}-iiod = "${sbindir}/iiod"
+FILES_${PN}-iiod = " \
+    ${sbindir}/iiod \
+    ${systemd_system_unitdir}/iiod.service \
+"
 FILES_${PN}-tests = "${bindir}"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+
+SYSTEMD_PACKAGES = "${PN}-iiod"
+SYSTEMD_SERVICE_${PN}-iiod = "iiod.service"
-- 
2.14.3


