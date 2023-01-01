Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0429DC5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.16015.1672594709969465729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=z6aFFeuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id q9so179859pgq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTP9Qd5Yrj6gfaZq/+xWekIGLnJkV6KxdkPla4xAaWI=;
        b=z6aFFeucppj2PzwZTVlECNJiQdis9fic0qXUYCWLKeCEbq93F8tNqpuxGJCiX6eqZp
         SEUw58TPPsKVCXPe8/BQbA6AB34Jae1uUc7RTyWqOo47NYjZbRPLoLABh9EEqdUvgZkm
         6pHQTlUd4AqBtr26Kj+PtoO44vFwaPZqa8jvYd44rfW786deQUnogjj3oixXCFeJz/IW
         fUnbJ1bSqIvGFemNvRFCVbHB1Xfexw0wdaUR0WMpQd+S2DIaSKyL2Ze5S4NnVGBRMcoK
         bOhHYLG3UU+ydk5meDJp+CD1fYLcnsQS9yGJAHvr/1JC5M+C4Rv0gv/15KXtubeWUDu8
         rt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTP9Qd5Yrj6gfaZq/+xWekIGLnJkV6KxdkPla4xAaWI=;
        b=C7BoK9NYMA8vos7tayLVWu+p44BfavZcyaZWmUsLHkE6edhOWG5NqGR3+XRRe1tnTp
         ilj5dvgLN20IJWzCMs0tt/L5A9Ar1Im83viHc5Uah5+X3SN98UtxQj2JminFDCtASAVr
         jk8SKLOGwpnbLxjX/11sjSHHpD2YTl3pDOsuYLZFWsERW04FX7ZzvJFAjgfmSjiyGJfg
         R6NzqC5m9+JdATYccAKOGGiP8gd/W7kT3hG2LbO1z9YCXrCm6LRFV2U2lhWFPYjJLyd4
         aDl/f7iwv9OA3cuiZykCI3rdFgeF92bgGlcCjfij9jsZZsQun60Ow4QJ5eUPaZJxekG0
         r96g==
X-Gm-Message-State: AFqh2kqlJYqBTchKj7ezb93TkoX3MaBcACqRHrb5FoqiS3PBiegw4W+8
	1P36F8GYZXWY4bN37x9JqiH6kE8DXImWZa+sd4Q=
X-Google-Smtp-Source: AMrXdXtpDurn7XnoLp0oaAJR5KDRdtQetpQ8toLByy+aTjoHu8cFIOkVS51CNuMuvQY1j2G5lhZ6Dg==
X-Received: by 2002:a62:e911:0:b0:581:579d:5c44 with SMTP id j17-20020a62e911000000b00581579d5c44mr20569745pfh.5.1672594709011;
        Sun, 01 Jan 2023 09:38:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/29] ruby: update 3.1.2 -> 3.1.3
Date: Sun,  1 Jan 2023 07:37:38 -1000
Message-Id: <2ec9e2c0488b580198ca6fdb058914bac558fe9b.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175204

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 402254a5f841520b132508c21465111d33b6eb1a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Remove-dependency-on-libcapstone.patch | 36 -------------------
 .../ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb}     |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 rename meta/recipes-devtools/ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch b/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
deleted file mode 100644
index 5d0f8fcc09..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 222203297966f312109e8eaa2520f2cf2f59c09d Mon Sep 17 00:00:00 2001
-From: Alan Wu <XrXr@users.noreply.github.com>
-Date: Thu, 31 Mar 2022 17:26:28 -0400
-Subject: [PATCH] Remove dependency on libcapstone
-
-We have received reports of build failures due to this configuration
-check modifying compile flags. Since only YJIT devs use this library
-we can remove it to make Ruby easier to build for users.
-
-See: https://github.com/rbenv/ruby-build/discussions/1933
-
-Upstream-Status: Backport
----
- configure.ac | 9 ---------
- 1 file changed, 9 deletions(-)
-
-Index: ruby-3.1.2/configure.ac
-===================================================================
---- ruby-3.1.2.orig/configure.ac
-+++ ruby-3.1.2/configure.ac
-@@ -1244,15 +1244,6 @@ AC_CHECK_LIB(dl, dlopen)	# Dynamic linki
- AC_CHECK_LIB(dld, shl_load)	# Dynamic linking for HP-UX
- AC_CHECK_LIB(socket, shutdown)  # SunOS/Solaris
- 
--if pkg-config --exists capstone; then
--   CAPSTONE_CFLAGS=`pkg-config --cflags capstone`
--   CAPSTONE_LIB_L=`pkg-config --libs-only-L capstone`
--   LDFLAGS="$LDFLAGS $CAPSTONE_LIB_L"
--   CFLAGS="$CFLAGS $CAPSTONE_CFLAGS"
--fi
--
--AC_CHECK_LIB(capstone, cs_open) # Capstone disassembler for debugging YJIT
--
- dnl Checks for header files.
- AC_HEADER_DIRENT
- dnl AC_HEADER_STDC has been checked in AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.1.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 0115daf22a..c8454da3a9 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
-           file://0001-Remove-dependency-on-libcapstone.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -50,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
+SRC_URI[sha256sum] = "5ea498a35f4cd15875200a52dde42b6eb179e1264e17d78732c3a57cd1c6ab9e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


