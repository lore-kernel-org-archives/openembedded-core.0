Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C523C64EC4
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:18:50 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.13839.1676902723499454599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S76kle9M;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id pt11so2113302pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0P6MzCrE+i5VwrW6I1TbKenQlJHZn930SzFPasCCEM=;
        b=S76kle9MHBFavLQpm2gbBDZVBDHx38Taf3opfJIiewlVj5tqO6tlIV3ODJhlC1SHyM
         bkVqXmY5avp4GpEuop4DRy/OxXD4KOchAa2OFnkqyyRZ6H+CZ1a9ZxZb3mIumDc+B16B
         wy+zhp7TEWnCumBd2xYMv7sJR1RknafQ5SnGDpJmDWw0J4XKGhHUDoALSm3S+AymRl5e
         ejx2pzqmilCHKh7etK+h4tF3JS69D0z9CqcFo6L9IQkkLp4nhPpcpJ4TYh3di1Dra6Bs
         zmhcZfB1Mqe6ZOKKuNe7gB0uqZrqSywovvYV5+VRYxPF0+UGhaYrw3dYjmkQ1al26Ljo
         Ht+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0P6MzCrE+i5VwrW6I1TbKenQlJHZn930SzFPasCCEM=;
        b=fSVrAIffGWMWvldlHx4q8eEy4mMIWZNK/iOnLhij6qsIqkWzMCm31voX6CAGdnuvXg
         j1QfZrYS/M9wVZZb7HeTh1s3D7geY+tZvtdcCqvG4PfxRLr+tur1HFj9lnFEF7LFkUmt
         klqxD3dyTNIKearEwNiAhTwXmm3O0W+P4qPuKp9PwJXFR3vjsbDQ4LuTqm17b6+hWCuK
         Tz9iNgI/ieusoq6INgziEQ/6yaaGXLNGOaD5i+Vjm+22AO5xG98JPcDZc1GB7R+tWz1v
         VvIEqGiw06OkITsMOcyTpFkUByEQvwVduRpVJPjzT51f3qapGOF54O5XSOCeqkKZo3sb
         HQ/w==
X-Gm-Message-State: AO0yUKVSpKVvXkHPB6QLosr1ErWKBiP3SJdw/iNoDi6AXrIn7lUjwvh+
	VLTt1XDvLQsvAiVaZgO49KaZQYgoZQL0nhSRC3g=
X-Google-Smtp-Source: AK7set9tNEDBjfuFz/w4Tjb1/xI9GLwX7pwywlMKdAf48LIsGi+NNxZ0XUjRJs7TSLllfOi+xWf/3Q==
X-Received: by 2002:a05:6a20:6999:b0:be:e0c3:5003 with SMTP id t25-20020a056a20699900b000bee0c35003mr1858848pzk.5.1676902722376;
        Mon, 20 Feb 2023 06:18:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/22] lttng-tools: update 2.13.8 -> 2.13.9
Date: Mon, 20 Feb 2023 04:18:10 -1000
Message-Id: <73eee649fcdb653c8fc9ba71673e3bbdea35959f.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177409

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


