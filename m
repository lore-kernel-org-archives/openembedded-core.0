Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.21748.1627919205619254712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 08:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YCkdx1ts;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id nh14so14007664pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2MtffmOoBC/Rn3c46ycdT+G5Y72ZEijvmjdroE86l8=;
        b=YCkdx1tsUiSlmLFE6CcIG5CXeOgeueKaC3HmUsBuH+22iTsHkcChTbqlInVW7zbo5H
         w7429ihA4w+wIZrD9j3dk6uo2eeonWppEx4mbt2GWyJQvdILbzCPFfNl88Hp9/c++7m4
         G0oKy71kRcaTsQ2i8Mz0LZunfNcV67eGo6/CLz9YJ2NyfgwBMcNhcYVXrkYeY8AOY2Uf
         p+wPMlRb4cPTyOGKT6l2Xz8l/2zWIiiOigV5sKGpPmZapJjwi7PjtJG9r2CVNTZ1AZFe
         adttgw3Hcv3+r+XYUbZCQ1b6T+5GafB+T2+CCWcaLOOqDmnB6had+9K9oVkwuGhCFI/q
         imvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2MtffmOoBC/Rn3c46ycdT+G5Y72ZEijvmjdroE86l8=;
        b=cQr8A/BPzZAGNm/QbVddB0Y/31sV2NkHUyUdNZe75c90bF65B8hwoTQiBWzXcug8GK
         HtYZHLfNQKUklOXnQN0SV53D7zhjS7wkiRCnSjmJDVF5dmscmn6fI8D+/Wf8zlb+z6KM
         2qt8glRDedklVqT1qqmiLT+BjSwD0g5A4tGBlfDIgbDaihCrtRuRd4ImEMfhnCzpSaCb
         YEu2LoNJUbbIy3+PLiEMnBUFijLwvf1ioJv6DrCAS5EgSllMPzfT7hcY04Vsod2rQWKv
         m/8x6Mqmk89k2ZZOtulFORBmT98DTqZZvXzqxHzMkAwWQvL4RlAf3+nRsCr9HjABip4F
         vQgA==
X-Gm-Message-State: AOAM533nBq6xjI86OUM3thY87xhcZrAzvQodgHWuSbY5DMscNQStVd6p
	Zab0OkNteHlb8ItZ0ovQQSw/3HjC5yFg9Q==
X-Google-Smtp-Source: ABdhPJy4Js9wlJPN739LUVdi+XFYczQ+XHQup2YVlyq2AeWPfVuXVRBoqo2Y7Zprevwptjrjb/+n2g==
X-Received: by 2002:a17:902:b40b:b029:12b:997f:5677 with SMTP id x11-20020a170902b40bb029012b997f5677mr14456885plr.11.1627919204977;
        Mon, 02 Aug 2021 08:46:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id q5sm11048085pjo.7.2021.08.02.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:46:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/4] glibc: Drop DUMMY_LOCALE_T define patch
Date: Mon,  2 Aug 2021 08:46:38 -0700
Message-Id: <20210802154639.4181923-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802154639.4181923-1-raj.khem@gmail.com>
References: <20210802154639.4181923-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was needed for very old centos distros which are no longer supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.34.bb      |  1 -
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch | 29 -------------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 -
 3 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
index 1543b92a7e..6100f3d4c4 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
@@ -31,7 +31,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
 "
 # Makes for a rather long rev (22 characters), but...
diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
deleted file mode 100644
index f195e07891..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9e07bc25e344152d7bf0712152d9c5fe4abcbf46 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
-
-This is a hack to fix building the locale bits on an older
-CentOs 5.X machine
-
-Upstream-Status: Inappropriate [other]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- locale/programs/config.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/locale/programs/config.h b/locale/programs/config.h
-index 2edcf3696c..5350101e38 100644
---- a/locale/programs/config.h
-+++ b/locale/programs/config.h
-@@ -19,6 +19,9 @@
- #ifndef _LD_CONFIG_H
- #define _LD_CONFIG_H	1
-
-+#ifndef DUMMY_LOCALE_T
-+#define DUMMY_LOCALE_T
-+#endif
- /* Use the internal textdomain used for libc messages.  */
- #define PACKAGE _libc_intl_domainname
- #ifndef VERSION
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 4beeb10c29..66494c5c23 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -48,7 +48,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
--
2.32.0
