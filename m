Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id AE0957C349
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 10:41:14 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h19so1557315wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GHQaXXJZLa4VpzzERYY5zA4PGVyPxWPfoAPZoUiMTVc=;
	b=jq8momr0FetiTflZAp+BPVe5dkFvZWF2fTH4iTUMGy+E5UG1yi8gg8fIO0V29hi1jz
	4pZeVZu6TL4zExWT6leU5vcQ96oMqhdx+fOtl5LLzLs37BGgLMeJqD1FemjZAW/I2YY6
	3uGvjIHw9yjkUrfXBRMJ2IULV9NSpXSoQ7tN9r3nDiaaRCo1Ju54rJptPIoBF6OJym1A
	BkZa2wfsT6Fm5bJtYwH33qW6fiNmiXfjBJ5aMfLzQftZZX8wYF35pjqM3CrV1U28ifBY
	lqkMxQw5oiL1T52F0+c2VVRe4DAoC9Wn0X/tSbOLujOSB410oP6v6Q6KIrKv1+ZTLQio
	sBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GHQaXXJZLa4VpzzERYY5zA4PGVyPxWPfoAPZoUiMTVc=;
	b=hcxL5lFhy7yKKLKcWiEb9RgGzAu6M9wydXPelpTLpgOhVWyiLf2vDK0D2Davz6jF7C
	629i7hMVWY6M2ShvNED0X+B0tgsLdTRzTSA9MjB5MwEkA7f/cKfaBsnMsHlVoKEFBXaP
	076+aRQDY+RQdKOOBw70Y2Nh3d9JYTpyAVgQNLL5lhEI87lXxDexfUqYslwVfqSRYgES
	9xfFiVvBvAkSx2wFRhQV273ZBHR4MyxQr88qehmGZ4Puk+5uRkCnUlRnYLZVdCtkbC/y
	0e9Vo41P+5h35kAxX/dNVQ0g00Tc2RNuw7qKYi1X+hmBLB82rXDRMYhdDF55kjudfROp
	ycrw==
X-Gm-Message-State: APjAAAUPEJc4QerHMyQA3naLpl0wyNr4lcdDSqU1mXCsyKxLqKSsu40L
	FotiScngYk5dvlNB237LHHLSCj5u
X-Google-Smtp-Source: APXvYqwy2WVh1lWmtitfN/WKhDp2EZEOdIs53nJvvur3YnMVHjueNBXhpsu0Bh2RvEVqbmJMrTMpeg==
X-Received: by 2002:a1c:9e92:: with SMTP id h140mr13313553wme.82.1559817674918;
	Thu, 06 Jun 2019 03:41:14 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k2sm1639099wrx.84.2019.06.06.03.41.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 03:41:14 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 11:40:43 +0100
Message-Id: <20190606104043.19722-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] rng-tools: recipe cleanup
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
X-List-Received-Date: Thu, 06 Jun 2019 10:41:14 -0000
Content-Transfer-Encoding: 8bit

- add missing DESCRIPTION, AUTHOR, HOMEPAGE
- cleanup DEPENDS
- fix variable ordering as per https://www.openembedded.org/wiki/Styleguide
- remove unneeded checks for systemd, sysvinit in do_install

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../rng-tools/rng-tools_6.6.bb                | 63 ++++++++++---------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
index 6796c9be9e..41959a2695 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
@@ -1,58 +1,61 @@
 SUMMARY = "Random number generator daemon"
+DESCRIPTION = "Check and feed random data from hardware device to kernel"
+AUTHOR = "Philipp Rumpf, Jeff Garzik <jgarzik@pobox.com>, \
+          Henrique de Moraes Holschuh <hmh@debian.org>"
+HOMEPAGE = "https://github.com/nhorman/rng-tools"
+BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "git://github.com/nhorman/rng-tools.git \
-           file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
-           file://0002-Add-argument-to-control-the-libargp-dependency.patch \
-           file://underquote.patch \
-           file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
-           file://0001-configure.ac-fix-typo.patch \
-           file://init \
-           file://default \
-           file://rngd.service \
+DEPENDS = "sysfsutils"
+
+SRC_URI = "\
+    git://github.com/nhorman/rng-tools.git \
+    file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
+    file://0002-Add-argument-to-control-the-libargp-dependency.patch \
+    file://underquote.patch \
+    file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
+    file://0001-configure.ac-fix-typo.patch \
+    file://init \
+    file://default \
+    file://rngd.service \
 "
 SRCREV = "4ebc21d6f387bb7b4b3f6badc429e27b21c0a6ee"
+
 S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-DEPENDS = " \
-           sysfsutils \
-          "
-
 PACKAGECONFIG ??= "libgcrypt libjitterentropy"
 PACKAGECONFIG_libc-musl = "libargp libjitterentropy"
+
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
 PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
 
+INITSCRIPT_NAME = "rng-tools"
+INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
+
+SYSTEMD_SERVICE_${PN} = "rngd.service"
+
 # Refer autogen.sh in rng-tools
 do_configure_prepend() {
     cp ${S}/README.md ${S}/README
 }
 
 do_install_append() {
-    # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d "${D}${sysconfdir}/init.d"
-        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
-            ${D}${sysconfdir}/init.d/rng-tools
+    install -d "${D}${sysconfdir}/init.d"
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
+        ${D}${sysconfdir}/init.d/rng-tools
 
+    # Only install the default script when 'sysvinit' is in DISTRO_FEATURES.
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d "${D}${sysconfdir}/default"
         install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
     fi
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
-        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
-    fi
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
 }
-
-INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
-
-SYSTEMD_SERVICE_${PN} = "rngd.service"
-- 
2.20.1


