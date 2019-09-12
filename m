Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id BB6187E58B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:56:29 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id f19so12384849plr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AU5Z6UDjPCjjnwWKVN5p2d19M0u1YFCVrW+OMxoxE/Q=;
	b=KZ3JBa5wl5ktbxv3EynpHdWQzrje01/3aKo4gMcdK/TqbY79im/L1Mw1Dwi747exBg
	EzXirqdUC9cRpk0XYDVdDqqwRDZmV0lzUohkvClwb09eY9r8Vig9N3KaCS3w4pbmuhjZ
	i4N08xjsVD5lzVn77MIuURoboxfF64gYu1Zm5aHBvzmSHHCBml0DveCSk9kuWEf0sYuo
	AagY+4tUrQZUNC6YIpVqju/2nMrgMkGrdbiSTvdv3Fqe1EbAxKdzrWVrk2f/bl7hBZkS
	j5vsBjMSCTNWGI2nb66acpeoZkLj1XhQk6scov9ynSQD8/GkqVVSJI6uD/20KzZ9QJLO
	FZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AU5Z6UDjPCjjnwWKVN5p2d19M0u1YFCVrW+OMxoxE/Q=;
	b=dwbMyAJ5Ig0x4PwaHmcfoBmq7J4vIzzV5b2AVvb3XdDRJp0NDHRo7cqxs/6CzEI3Gj
	MlpeLKUnTXICTXWgvt8ro3H5GlLjidD3/OPrJ/+staYcWnW4TCXCN1TYDdoHT2QmPakM
	ClxHxQChlCpApcLuu6o2olj2XB6gmdwY8JtgouhbK42WDIksVd2YFf9A6l/Dq7by3kB5
	DXfqo0JzR4cgE9asPmN94QKfvWuaJnGEXO5dOayXjhacUI/AOlFJdreXr1Jl72dabZjk
	oI5KD9O4WbJPRf7K96XIEKjC7/Hi4ZrvIwSG79xlvnSZokzOS5mTQUWkNIpmiaND+Jf6
	3VZw==
X-Gm-Message-State: APjAAAU3vO4h0CfeZiV6n3ABhnAMqzr/v9ZVqFPmioUquMyc5/Qavm8h
	NPvIPcKNkg0VBgSLIuxWai57OTfU
X-Google-Smtp-Source: APXvYqx3ucNHM/ckTAcc3K2eITCBpMrYe1wL1u8vUCpUzU7mI0+v4pqOCOMYT5BChXX6AMvzzRwh4w==
X-Received: by 2002:a17:902:b718:: with SMTP id
	d24mr25593869pls.270.1568328990354; 
	Thu, 12 Sep 2019 15:56:30 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id t5sm314024pjw.15.2019.09.12.15.56.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Sep 2019 15:56:29 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 15:56:22 -0700
Message-Id: <20190912225624.28572-1-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/3] busybox: drop unused mount.busybox and umount.busybox wrappers
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
X-List-Received-Date: Thu, 12 Sep 2019 22:56:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox_1.31.0.bb    | 2 --
 meta/recipes-core/busybox/files/mount.busybox  | 3 ---
 meta/recipes-core/busybox/files/umount.busybox | 3 ---
 3 files changed, 8 deletions(-)
 delete mode 100755 meta/recipes-core/busybox/files/mount.busybox
 delete mode 100755 meta/recipes-core/busybox/files/umount.busybox

diff --git a/meta/recipes-core/busybox/busybox_1.31.0.bb b/meta/recipes-core/busybox/busybox_1.31.0.bb
index c1da372629..fa63965674 100644
--- a/meta/recipes-core/busybox/busybox_1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://default.script \
            file://simple.script \
            file://hwclock.sh \
-           file://mount.busybox \
            file://syslog \
            file://syslog-startup.conf \
            file://syslog.conf \
@@ -17,7 +16,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev \
            file://mdev.conf \
            file://mdev-mount.sh \
-           file://umount.busybox \
            file://defconfig \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
diff --git a/meta/recipes-core/busybox/files/mount.busybox b/meta/recipes-core/busybox/files/mount.busybox
deleted file mode 100755
index fef945b7b2..0000000000
--- a/meta/recipes-core/busybox/files/mount.busybox
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-exec /bin/busybox mount $@
diff --git a/meta/recipes-core/busybox/files/umount.busybox b/meta/recipes-core/busybox/files/umount.busybox
deleted file mode 100755
index f3731626e6..0000000000
--- a/meta/recipes-core/busybox/files/umount.busybox
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-exec /bin/busybox umount $@
-- 
2.23.0


