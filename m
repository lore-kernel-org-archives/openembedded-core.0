Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97A497C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:18:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 22so358337wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GHQaXXJZLa4VpzzERYY5zA4PGVyPxWPfoAPZoUiMTVc=;
	b=WwFDJQsXC0yagOSzjVIw7w6HHILnPbnz6UZWcjxQoWedpyfiD7B2ZhnfoMS9S8bePC
	NNSxb9ILjlfvBp2zT9vX918w+jhN/q1gl2QhLyBsy79Bi0VaeVc9YACSj4xib9kMOdyh
	E/QTLaL1q98byZKfE3I3I1M6a5K2yFeq0lMTYtl+Jh6TXripAvv7pD5wJ2L052Rdi3fY
	Pu90/WBlzDZjqkRkT72iwX97lLpzKMXCGPLzDWic75oE3KyNt5uUED1riW9UFhWJITDa
	pUO8Tm7d3tgp6jmfoCQRceYgBqFUjj8043uY1Zii24vmiJdV4OIEjCLAlrYBOhfOFRBi
	QVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GHQaXXJZLa4VpzzERYY5zA4PGVyPxWPfoAPZoUiMTVc=;
	b=lWxARbgsL+B/gq8mAlzv9twxFkMcZLO+9pNMt8QFvw/WelGIHBqfVB/CF23zId/pEH
	zYxECpynHR1WHPB1jRX/f8Dud6i671ah9QmvQ9WhXTMMxnPHau+SebwBNtR9PwjRnMmd
	ZhfdC+ThejCDyv1rDLG+TyeMDFUf+/9SnQjalI+cb7NYpLPbqcKvC1r+QU8BGTizaMrK
	ui15lHEY7F/uXuCgRFedO5wMBg3EoYTur45DjL83tAQMa3hrDRQBTcnZZSTz9xc3Lxsp
	abqrEC8EjciTXTuv5Tt5KTnDmyuJlxfwQEj/s0PimMObN+hgjK4rdyMYbcNhFuTDRiir
	Biag==
X-Gm-Message-State: APjAAAWXWnR+Qerki6JmrqXafw1M4E0nTkKP0sSfDDJmv2t5AaDmBbqh
	00RZC5Blm9jYG9pOw7uML1pg9HWh
X-Google-Smtp-Source: APXvYqynqW7/iverRgwFLc7ilS4TXwr3X6Px2KyRoFLhVPUK9VU+QO7J+zOsG0egL+kDPtnGQpKXjg==
X-Received: by 2002:a1c:b757:: with SMTP id h84mr404148wmf.127.1559834304922; 
	Thu, 06 Jun 2019 08:18:24 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a62sm2108953wmf.19.2019.06.06.08.18.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 08:18:24 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 16:18:12 +0100
Message-Id: <20190606151814.5114-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2 1/3] rng-tools: recipe cleanup
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
X-List-Received-Date: Thu, 06 Jun 2019 15:18:24 -0000
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


