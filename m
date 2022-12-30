Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB515C4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.22295.1672418671797258117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y2HKsOYg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id c9so9875107pfj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpWOlGCskQgQmDV1duLdogbC1//wHF4vwtKVl247L9U=;
        b=y2HKsOYgw1Wz/kHS7yFGSx3mUjYMiRxoOxa3sxhIsH7lcw4c08oOOFaOMhmVoeiwdn
         OYcZnL7J57gDy+I3u5QPBOBkuGvLEBk5wfDGpLo4vfemDuP3GYInAicvn7cO0fy8PBZF
         nF3TRqTsaCs8MO+l5Ys5C8nFITzoLE2VJAFTb6UqJrU6RSLhhTtz8WSDT6XwpWlfdq6k
         OVWYBF6E/f21MJL85EF5cWuFl0BfHiC0m7qCe7OkPaOKKXh9Em0RYGEkgtMECKcmAKZd
         o46NAC1X13b5EermrEhAFKBsXcpS7RfObpw3kbFpfX5gtRF7oAO5w0SYXemPIX/AMdj5
         x0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpWOlGCskQgQmDV1duLdogbC1//wHF4vwtKVl247L9U=;
        b=1w0vzv1JVagkcjZNfC/TNQtKya0v7CfmpZAif+6XzTeRnA9MlzD0HE94S25X/odp/c
         G7n+D8MXw8o6kuljAO40RCsxuRJcMFz8Ghnyxh8yDB0DVN10E5qYCibOvXvDZ39ZdBPL
         toAEQa413nelT+F14uFPMz5yxcjYNf9kKnXdrIROTGQ/XxGGqE0E6TqxBD+vBjfxcF3b
         pgqqo6xZI/TD4OSKuh8CYwaxSYuvkItqrxY7scZ0iV0CBJRtX54DI//oelOzW5621tMB
         oFJz5H+dW5oLSEf71hHdvtf+6J+2GgzMaHsutf/FR4/0yUfGcmkpfLSg1Nyc0Fy9egNF
         Cw4A==
X-Gm-Message-State: AFqh2koiwQyxy+qK264g2oAywsg07NY06P8N1IRkla4kpGZjBOgs7ir2
	oTg2pG6GbaHb5pNrhEztlKiCscasygLlnOGioak=
X-Google-Smtp-Source: AMrXdXsozn7M7gD3bMUNx0HEi7Bqugs86ZGxf4ib3eyF1NExtLbaJPFRYWCh11yB8y7k9kBwEEI1wQ==
X-Received: by 2002:a05:6a00:24cd:b0:581:4260:a650 with SMTP id d13-20020a056a0024cd00b005814260a650mr27886341pfv.33.1672418670808;
        Fri, 30 Dec 2022 08:44:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/22] ruby: update 3.1.2 -> 3.1.3
Date: Fri, 30 Dec 2022 06:43:57 -1000
Message-Id: <b42b6466f9ec998fbe2131dcf18374c4bd4db631.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175148

From: Alexander Kanavin <alex.kanavin@gmail.com>

This release includes security fixes. Please check the topics below for details.

CVE-2022-28738: Double free in Regexp compilation
CVE-2022-28739: Buffer overrun in String-to-Float conversion

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


