Return-Path: <sanakazi720@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0338DC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 09:28:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.10082.1741944489494558332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 02:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVaq/pGL;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22409077c06so49167565ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741944489; x=1742549289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrtNnLdsT7wCXgposWTjD/SrXYLYKUFtOLAK6bT06JI=;
        b=fVaq/pGLeg6oFa6xnHeIuGtdIrl1grppPHUBWWepCLvCu57mYvWZi89Kp0BDQtAPcb
         Xhjc5mU88GV3F1nsmWkRW3W49aR3+giB6zLmw3ZdU7rzLG0jh9DnCPcnPwsVgXOlgDO2
         Fl9af4jvR5N00bH61fsPtC1UNChqvYshX92r8fcW/c++R0LaMsyEsJN0WIEE7zkKSxA+
         35kJOcvC7kT7UGu9oFIp/qwjHRaP095+jNlLQwTcDCtHNKNzNmvUA2TfbPIQuMEWS6tq
         mKW24hczGhHGCQhXt0v5tB2QhNWUZbEA/3heAWkA3F+Lx2ITOZCsKii0kkqACU6kUmef
         6u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944489; x=1742549289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrtNnLdsT7wCXgposWTjD/SrXYLYKUFtOLAK6bT06JI=;
        b=bf1sDj0Z2awN6Gt+mfV9B3+o24KrR9lfE1uBjLxr2L3C37I6rX/AySoDsbFt8GOsOJ
         Rl6fJ2/KmhyHi8+JZzGn87mEWABloPZ1cjG6PrqQhKvLBsR212NMvTnZqyeW67H7gYfx
         0LXCJ7wyCSBMzPwFzcoF+VNLDo+4qVmBSwJigMihi3PoqBEQ5lKIHgSgspD0ID2vnOzd
         EnQt1KZfspFCzI8rYGprJpnK2OS52VRHzdPvuDJIMn7gTQgLdwYFNclUm2sK1oldbdEA
         mWFNYUuynu5tKq7MEPQynqIbmaML7e3qPBTG9BWoTc16YtL5dk52ES5Qzgg9MiEgA6gX
         Rglw==
X-Gm-Message-State: AOJu0YyNxp37ZjD8BCZIp2LsaRAuciUCEry6GnPJ6OjF0qDTqWU8pZCn
	DRlFSrgI80LOKS2b1HERnqxeyGCphdwsw1H1ZljYtFFwfDOEzW8/c0rF7A==
X-Gm-Gg: ASbGncs8H6EA1FR0W5iunx1z1RmkPjGE9Fhr3AryfUGtE5TARQSWjciQw59sM6YiHk/
	BPEcU798jeVT/om52dvLIqzbQOAWYp8KcRmnwAr8hvoG5M8M0w29V3RuVPPqtpLKix4QSLPJirV
	qChU3vjg4Jj8NlSqAXCw2IxwtfZJ60BEl67Nrf9IgQo/11V/sXoiBMQO4G4hMqsc6MYvmI/Lt/4
	P5f3gqcnT3aLzKAZ76L0gKBAXMEJtX4Uct/uFZTChGgIlehc2FGFz6hENHH+qe8ZTmlDwUm3zM2
	M8/b2uwvZ1AmEO24hmbr5wcieWyr9tm0hNkrI6M5yj3Nn9Hpa3TPReJGZ/1xmLVdt8Bn5Mi1BZ0
	=
X-Google-Smtp-Source: AGHT+IGhZJ7jk76crvIr3lz5QPb9Ubqp1jyUkXj37dU3xvKVjjaj+svYQXtepKbbsggoQM/lGV2cGA==
X-Received: by 2002:a17:902:eccc:b0:220:f87d:9d5b with SMTP id d9443c01a7336-225e0a64aa7mr31134275ad.24.1741944488548;
        Fri, 14 Mar 2025 02:28:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c16:2c8d:afef:6fd8:d5a3:eab2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68885acsm25442145ad.32.2025.03.14.02.28.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:28:07 -0700 (PDT)
From: Sana Kazi <sanakazi720@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/2] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
Date: Fri, 14 Mar 2025 14:57:54 +0530
Message-Id: <20250314092755.22607-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 09:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212825

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-canadian.
This will improve (but not fix) reproducibility of gcc-cross-canadian.
Also move this code to functions to avoid code duplication.

[RP: Tweak patch to make the function parameters clear and fix quoting issues
ensuring the code exactly matches the original replacements with an additional
parameter.]

(From OE-Core rev: 350ff7d53f7506de2bc01f0efc569b8294b9afea)

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1ad5be4337c5d45c0f1bed48184336e9ab1fad8)
Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc      | 22 +++++++++++++++++++
 .../gcc/gcc-configure-common.inc              |  1 -
 .../gcc/gcc-cross-canadian.inc                |  3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc       | 15 ++-----------
 meta/recipes-devtools/gcc/gcc-target.inc      | 16 ++------------
 5 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 5ac82b1b57..7f5cc109e6 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -116,3 +116,25 @@ target_prefix ?= "${prefix}"
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] = "WORKDIR"
 should_apply[vardepsexclude] += "PN"
+
+remove_sysroot_paths_from_configargs () {
+	replacement=${1}
+	# Prevent sysroot path from being used in configargs.h header, as it will
+	# be rewritten when used by other sysroots preventing support for gcc
+	# plugins. Additionally the path is embeddeded into the output binary, this
+	# prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i "s@${STAGING_DIR_TARGET}@$replacement@g" ${B}/gcc/configargs.h
+	sed -i "s@${STAGING_DIR_HOST}@/$replacement@g" ${B}/gcc/configargs.h
+}
+
+remove_sysroot_paths_from_checksum_options () {
+	stagingdir=${1}
+	replacement=${2}
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded into
+	# the output binary.
+	oe_runmake TARGET-gcc=checksum-options all-gcc
+	sed -i "s@${DEBUG_PREFIX_MAP}@@g" ${B}/gcc/checksum-options
+	sed -i "s@$stagingdir@$replacement@g" ${B}/gcc/checksum-options
+}
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index dba25eb754..bc17f10468 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -119,4 +119,3 @@ do_configure () {
 
 	oe_runconf
 }
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ec87b46219..adcaef2b0f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -63,6 +63,9 @@ do_configure () {
 }
 
 do_compile () {
+	remove_sysroot_paths_from_configargs '/host'
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}' '/host'
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 }
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index a540fb2434..1dbb6dc42b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -61,19 +61,8 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
-	# Prevent native/host sysroot path from being used in configargs.h header,
-	# as it will be rewritten when used by other sysroots preventing support
-	# for gcc plugins
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded into
-	# the output binary.
-	oe_runmake TARGET-gcc=checksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs '/host'
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}' '/host'
 
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 7dac3ef422..f51d94cd65 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -140,20 +140,8 @@ FILES:${PN}-doc = "\
 "
 
 do_compile () {
-	# Prevent full target sysroot path from being used in configargs.h header,
-	# as it will be rewritten when used by other sysroots preventing support
-	# for gcc plugins. Additionally the path is embeddeded into the output
-	# binary, this prevents building a reproducible binary.
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded into
-	# the output binary.
-	oe_runmake TARGET-gcc=checksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs '/'
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_TARGET}' '/'
 
 	oe_runmake all-host
 }
-- 
2.25.1


