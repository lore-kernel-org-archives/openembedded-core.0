Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 310BC7DE87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:18:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w9so2072426wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D15/6HSDNLmW2Y0FpiIKU5qG8BXTfYzum3ixeBjgUXM=;
	b=nzBPPFcw6NiYg1BgAeYfOYtTLR7w+EpcWBHGv3Nf6jkp2JT2qJyYtpAYrTJR65RbEy
	j635ibEmuR3lAUDIA8ArPwcPGWEhZEYn/hZPp7FbX4hR/B+vsXCBFXEzUrPFWSBjkRTm
	RJvkbhSin3XBIjE7t7pMYPYM+7WhQVIjnb2Xb5149/2dHP2WrU7bLpBM3KnK6y4R0Ktz
	X0cSLZk3TCGnP/xYyD5SeZFaX64NVJjXyr4Pvu5715V39QEFhQX2apuXRmb/BV2fDX7H
	HLF0IxIg+mE69jStNf83iiC5BzRLSimdMfSRTIusq5J2+C81/MkzgxRn32vDEtxKmQEf
	kVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D15/6HSDNLmW2Y0FpiIKU5qG8BXTfYzum3ixeBjgUXM=;
	b=A4RDWPOBF81ZNO8C8DgVDId2rm67nByXRafHsVUL6w5W/Rur6VNATB7TYDjEp4UYHw
	jxApy2gP9zl7mHdpywfXPqbhNQvmnzWouySBMq1zQ2aJ1nRGHbdPBJXiKaeRYlTkgtla
	ajIMpxH6fd4AMStabkhUVOrYQHkTVDg2Xvr9LA1tsZ1N+Mojln6NRW5js++c2ZiP+OAf
	Yar+zTLcEHc5uCmycTGBodaDhznCw9mYyDJljD7ofNoXRHRqMNG3ZeQPIFgXa3dNLygu
	NuykQohMRcVI93KawnRkRlGqfCo1TqTrSGrnGes0Mdg8h0XE+fhX+EvgE5iI4FhJwPsc
	4ghA==
X-Gm-Message-State: APjAAAVf+cFvBHBwrQ6jJYij+4b4/XaCAEznb37fXO2J2Zj/cCftgBFO
	vdYuHvyhDJRgT+Y5Ns/bm4u5naej
X-Google-Smtp-Source: APXvYqz8ZpcP8uUUebTTdrHzoNQwahSuQdbBYATMe2CLEfOIEU8LsfFKdTZzpKr7sqQU5fxDpf9/3A==
X-Received: by 2002:a1c:7ec3:: with SMTP id z186mr446777wmc.76.1559834314407; 
	Thu, 06 Jun 2019 08:18:34 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a62sm2108953wmf.19.2019.06.06.08.18.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 08:18:33 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 16:18:14 +0100
Message-Id: <20190606151814.5114-3-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606151814.5114-1-nick83ola@gmail.com>
References: <20190606151814.5114-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] rng-tools: armonize systemd and sysvinit files
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
X-List-Received-Date: Thu, 06 Jun 2019 15:18:34 -0000
Content-Transfer-Encoding: 8bit

this commit will permit to have a default file
both in the systemd and in the sysvinit file

Also reorganize the install_append function

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../rng-tools/rng-tools/default               |  3 +--
 meta/recipes-support/rng-tools/rng-tools/init | 21 ++++++-----------
 .../rng-tools/rng-tools/rngd.service          |  4 ++--
 .../rng-tools/rng-tools_6.7.bb                | 23 ++++++++-----------
 4 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
index ab7cd9327f..b9f8e03635 100644
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -1,2 +1 @@
-# Specify rng device
-RNG_DEVICE=/dev/hwrng
+EXTRA_ARGS="-r /dev/hwrng"
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
index 7cf78393a4..13f0ecd37c 100644
--- a/meta/recipes-support/rng-tools/rng-tools/init
+++ b/meta/recipes-support/rng-tools/rng-tools/init
@@ -1,26 +1,19 @@
-#! /bin/sh 
+#!/bin/sh
 #
 # This is an init script for openembedded
-# Copy it to /etc/init.d/rng-tools and type
+# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
 # > update-rc.d rng-tools defaults 60
 #
 
-rngd=/usr/sbin/rngd
+rngd=@SBINDIR@/rngd
 test -x "$rngd" || exit 1
 
-if [ -e /etc/default/rng-tools ]; then
-    . /etc/default/rng-tools
-fi
-
-if [ -n "$RNG_DEVICE" ]; then
-    EXTRA_ARGS="-- -r $RNG_DEVICE"
-fi
-
+[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-tools"
 
 case "$1" in
   start)
     echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
     echo "."
     ;;
   stop)
@@ -38,11 +31,11 @@ case "$1" in
     start-stop-daemon -K -q -n rngd
     echo "."
     echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
     echo "."
     ;;
   *)
-    echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
+    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
     exit 1
 esac
 
diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index f0355db14f..b1a78527be 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -5,8 +5,8 @@ After=systemd-udev-settle.service
 Before=sysinit.target
 
 [Service]
-ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
-SuccessExitStatus=66
+EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
+ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.7.bb b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
index 9cc5951345..12cda9ae1e 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.7.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
@@ -50,18 +50,13 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    install -d "${D}${sysconfdir}/init.d"
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
-        ${D}${sysconfdir}/init.d/rng-tools
-
-    # Only install the default script when 'sysvinit' is in DISTRO_FEATURES.
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d "${D}${sysconfdir}/default"
-        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
-    fi
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
+    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
+    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+    install -Dm 0644 ${WORKDIR}/rngd.service \
+                     ${D}${systemd_system_unitdir}/rngd.service
+    sed -i \
+        -e 's,@SYSCONFDIR@,${sysconfdir},' \
+        -e 's,@SBINDIR@,${sbindir},' \
+        ${D}${sysconfdir}/init.d/rng-tools \
+        ${D}${systemd_system_unitdir}/rngd.service
 }
-- 
2.20.1


