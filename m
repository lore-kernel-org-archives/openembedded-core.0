Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8618FC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:27 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.43528.1676990478424193122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oIGAmF6N;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id n20so2627165pfu.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jkrrzOkMgERGFGGVPGs53jHkNboN4WtDk9CTx2lWmo=;
        b=oIGAmF6NTa6xNnWoi+phlag2lvwLmxFb+kmbvjYwX2JH8LTv/XiJCsbpUB9tPxoxQa
         1dUUMRSMHghIcBnlPDD4hxQM2Ey2ZvtRKdOmgIbnMrMl68uyavjzQtZeKHhuIHVOFp9x
         FHtAYEgBzGvXBMoeuqgsskyXjpzW7PPOn/bS140A1ZKKGL+b2AiE3W648H+PNoq3uD+Q
         PaU//hNPSNxc+GUY4l5Q0Do4uZFEJirAakVQFngvmJ8Jynts5YknARfnk+4XGaskYP/o
         KXDCQBT3wGrgTjpF1xmJ8SjIlSKSa6urVRaPmBIBr3dqwNk+Ky0vS/zrA9rxwnYb/38R
         Gt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jkrrzOkMgERGFGGVPGs53jHkNboN4WtDk9CTx2lWmo=;
        b=BQAQ5KyYXtGJs+WMTFXdb2pfNKJNQbsuuoEULjhXFgvv4e3jpKCOYnrlcvCgOGrsc/
         4BbwiHYR/aWTpohXvm/YswNRiJukDDB5oO+zdfQ5f2J65rrV1Bexi6VyvcXRXgXLBODJ
         9Doai6VMk8Fd7aJANKwQoJmhi1urdtQAlG+XsdzosnvOMIJo/4ofvrXC4PztNAZ7Fcci
         YFFWnPJsSatzceYf63YCU2jUNI6sKKiWBRc9UR3CJ1hcXO8T06iOpJufOM3rDIf1/xU4
         J5Rr4fR8LGtYYH9bD+LVR97kSwbhzWcPHsxgAfN8RwsmxsfnJ7eOER/79xPNDoqYceUe
         Gz8w==
X-Gm-Message-State: AO0yUKUSyQsn00PYIyQacF7AzjvqFC/WjFZwxeWyoiVjq3J1vQjyd/b7
	m3kjZff9gDeFwy6ytKmYmRTSXWwdwaJ7bLa1FGg=
X-Google-Smtp-Source: AK7set8rr1+jI4rQsLvOMtmUKCGu3VW8sgHqeWQqqAYc5KIde2Nb9bkyMIg8gr6Q/3B3a7CmAHFq6g==
X-Received: by 2002:aa7:96b4:0:b0:5d2:248d:7ec3 with SMTP id g20-20020aa796b4000000b005d2248d7ec3mr575087pfk.8.1676990477358;
        Tue, 21 Feb 2023 06:41:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/23] lttng-tools: update 2.13.8 -> 2.13.9
Date: Tue, 21 Feb 2023 04:40:46 -1000
Message-Id: <b2fecaaa59b29bae9c610195d1aa5be6c1878435.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177503

From: Alexander Kanavin <alex.kanavin@gmail.com>

2023-01-13 (National Sticker Day) LTTng modules 2.13.8
	* fix: jbd2: use the correct print format
	* Fix: in_x32_syscall was introduced in v4.7.0
	* Explicitly skip tracing x32 system calls
	* fix: kallsyms wrapper on ppc64el
	* fix: Adjust ranges for RHEL 8.6 kernels
	* fix: kvm-x86 requires CONFIG_KALLSYMS_ALL
	* fix: mm/slab_common: drop kmem_alloc & avoid dereferencing fields when not using (v6.1)

Drop determinism.patch as issue resolved upstream via linked ticket.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd9e72a390efb778a6278e2e6c9604ab29d6feb9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 812fb8f02b25bfd30f6d9640cf3b50131d68e0b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/lttng-tools/determinism.patch       | 64 -------------------
 ...-tools_2.13.8.bb => lttng-tools_2.13.9.bb} |  3 +-
 2 files changed, 1 insertion(+), 66 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/determinism.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.9.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
deleted file mode 100644
index 0a897a8e13..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-This is a bit ugly. Specifing abs_builddir as an RPATH is plain wrong when
-cross compiling. Sadly, removing the rpath makes libtool/automake do
-weird things and breaks the build as shared libs are no longer generated.
-
-We already try and delete the RPATH at do_install with chrpath however
-that does leave the path in the string table so it doesn't help us
-with reproducibility.
-
-Instead, hack in a bogus but harmless path, then delete it later in
-our do_install. Ultimately we may want to pass a specific path to use
-to configure if we really do need to set an RPATH at all. It is unclear
-to me whether the tests need that or not.
-
-Fixes reproducibility issues for lttng-tools.
-
-Upstream-Status: Submitted [https://bugs.lttng.org/issues/1361 - needs discussion with upstream about the correct solution]
-RP 2021/3/1
-
-Index: lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
-===================================================================
---- lttng-tools-2.12.2.orig/tests/regression/ust/ust-dl/Makefile.am
-+++ lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
-@@ -27,16 +27,16 @@ noinst_LTLIBRARIES = libzzz.la libbar.la
- 
- libzzz_la_SOURCES = libzzz.c libzzz.h
- libzzz_la_LDFLAGS = -module -shared -avoid-version \
--		-rpath $(abs_builddir)
-+		-rpath /usr/lib
- 
- libbar_la_SOURCES = libbar.c libbar.h
- libbar_la_LDFLAGS = -module -shared -avoid-version \
--		-rpath $(abs_builddir)
-+		-rpath /usr/lib
- libbar_la_LIBADD = libzzz.la
- 
- libfoo_la_SOURCES = libfoo.c libfoo.h
- libfoo_la_LDFLAGS = -module -shared -avoid-version \
--		-rpath $(abs_builddir)
-+		-rpath /usr/lib
- libfoo_la_LIBADD = libbar.la
- 
- CLEANFILES = libfoo.so libfoo.so.debug libbar.so libbar.so.debug \
-@@ -44,7 +44,7 @@ CLEANFILES = libfoo.so libfoo.so.debug l
- 
- libtp_la_SOURCES = libbar-tp.h libbar-tp.c libfoo-tp.h libfoo-tp.c \
- 	libzzz-tp.h libzzz-tp.c
--libtp_la_LDFLAGS = -module -shared -rpath $(abs_builddir)
-+libtp_la_LDFLAGS = -module -shared -rpath /usr/lib
- 
- # Extract debug symbols
- libfoo.so.debug: libfoo.la
-Index: lttng-tools-2.12.2/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-===================================================================
---- lttng-tools-2.12.2.orig/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-+++ lttng-tools-2.12.2/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-@@ -5,7 +5,7 @@ AM_CFLAGS += -O0
- noinst_LTLIBRARIES = libfoo.la
- 
- libfoo_la_SOURCES = foo.c foo.h
--libfoo_la_LDFLAGS = -shared -module -avoid-version -rpath $(abs_builddir)/.libs/
-+libfoo_la_LDFLAGS = -shared -module -avoid-version -rpath /usr/lib
- 
- noinst_PROGRAMS = userspace-probe-elf-binary
- userspace_probe_elf_binary_SOURCES = userspace-probe-elf-binary.c
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
index a814eb79f9..1f6929e307 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
@@ -35,11 +35,10 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
-           file://determinism.patch \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
+SRC_URI[sha256sum] = "8d94dc95b608cf70216b01203a3f8242b97a232db2e23421a2f43708da08f337"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.34.1


