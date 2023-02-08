Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41786C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3138.1675840912340393705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+6xXXXF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so2134331wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV8Zt9dqGXi1AkQMINbjijBkFPqqPkR0wlAEZU+RZGs=;
        b=n+6xXXXFAYqbNqEmblMujj2LrAi0t2lqHo67Tt+6DQ+TNqt6cLTRk28DId0p4nAEsV
         lY9708U7weKt0iY0IOWml2G7AXgqfZVbwJlgn61uNOqnUI0w2aM5lLK2jXwjYf6FSNzk
         mq4ThP9poFoi0xi63LCk9np7E/KdMBPZ+uiWraMpdgrsrnry7Soga/4C6lL1b3SHNjHS
         Ja7J/S14qyxtC8I2cjOfcMEfcYrGvrU8GJOgKHR3N2zOhnZKm6hTHbpsWJY8G5z81LfR
         Obp+a9eYHRwGqol1VLs4iWY5eeT2FepHGXtURFO177cZau/f6Us5YWByzRZFWWDy1chL
         yffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sV8Zt9dqGXi1AkQMINbjijBkFPqqPkR0wlAEZU+RZGs=;
        b=XcFI0WOrDaREBnda5Ew9maxB47D2PiWRc54a694i+kOd3h0AhriCgQODQssYf2xHgi
         9+2kBPnxhMRLq9VcFL6uFsIg1Z12YaQ6I3aaiAYrlev53RUekUepCsVfsxkjpdZW97Ax
         tNUWK5ZcID4T0TRQqVUPOf+aSIpHERKFQzRlJSIYqBF+3oQqS1cy57NKnZsYZMa4NaTd
         DyyUI0NthPl0jxkIwR0Nctvr7bhWYXys4mmFY8WXwJZk+YOpUxojEuL/vIpt7Z8ULoCE
         BDfyQZ/bD8R1HWdCMHWMclREcbfeoXFuk+BhELITFOg2wOC6GGI4K+AZAGcznXqy3WG5
         B0Rw==
X-Gm-Message-State: AO0yUKWWcZoPSQPeDnaXdhAgZGogVeWBEvbyxkHGQmho+mNo6n8nzHmF
	PDTk3U3G6fuCitf+xmbHRhg1ec1FEvc=
X-Google-Smtp-Source: AK7set+/L4QBZxRDiBvrcbwy5QITECs9gD2I6jc/QBPYQcEWMHoKGmQT1zVPolJYusIh7j8o3yzHAA==
X-Received: by 2002:a05:600c:44c4:b0:3de:1d31:1044 with SMTP id f4-20020a05600c44c400b003de1d311044mr6140790wmo.22.1675840910865;
        Tue, 07 Feb 2023 23:21:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/52] lttng-tools: update 2.13.8 -> 2.13.9
Date: Wed,  8 Feb 2023 08:20:57 +0100
Message-Id: <20230208072143.2930292-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176847

Drop determinism.patch as issue resolved upstream via linked ticket.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
index e64eeba635..340b254b46 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
@@ -35,12 +35,11 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
-           file://determinism.patch \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            "
 
-SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
+SRC_URI[sha256sum] = "8d94dc95b608cf70216b01203a3f8242b97a232db2e23421a2f43708da08f337"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.30.2


