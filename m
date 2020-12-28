Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.2403.1609185895058476424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+3dP1uA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id u19so10784567edx.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKzzbnDAl9rXEzgsi0SMobnHmly1pdBIWFCeGuFLYMk=;
        b=k+3dP1uAPDYYKuURFRY2jmLb4AScU/X1xth5gGLLv6el+np9nIob5rqJBSNdffH6NP
         Vsr9BBDv2kVecJgfcfV9JZeWpTlXimE6lJVb+I9PtJCpiTwyhJ96IDSJIcMzWlIYtCyw
         ikN9/HkxRSOgyu04EeKQmOuSBvtqOqlOxjXmzRSsEljwVsPzCTkF9RGUHD346RjgDrNR
         NXv/Nu9gt+4WaVrErfpwxGuqPP9IhIc0cOt7ngXwmJAKwD1D7a0YNGnhqPQLRnH6chT3
         TaujYkOBGAB/tMK8/ftuCrxgYLBMwoYwMq+LHXKW9aBVDi85KnBU9iMHBtK1VV6tO1CZ
         vQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKzzbnDAl9rXEzgsi0SMobnHmly1pdBIWFCeGuFLYMk=;
        b=QiZ7d5y/f23FzYCXrLiJvPWOHiLTVIYenjp7brYXfpcplfiJ7VhomlOEboxGUMtd1j
         PVHgvv2SMqQx3VxwhQCnY5sCRfNHnXuZay8Dh1CcXbfrdecPQ0BV9uunnzFb77VBwf2e
         kt+G5/LlCPK4144LdZ4k2H+qSDjUdp3rkpcleJ/2oYAgeFCoa1UIMA+UvxLHOW6uVtzQ
         +uCBOq/JGq+a996IkAwlLD/sDtkUf29eTksBJVOItZ79Ec9IBWkczQfaeM2g+uejqLuh
         o/SBUczuj3JD+i+5sDi0LJEoPoAi4LMgV7ibdmSDOYId5wCrUCE6f2QqKW+yPOPhBr9p
         iEjQ==
X-Gm-Message-State: AOAM533YIozubZpyihwnsrFUEXGZGcnAqL+nGXep+MbnHZJvWU9MyX4h
	ydTF9DLxosh1EJefH3xNX9gAyHaM+fg=
X-Google-Smtp-Source: ABdhPJw0gAf5sHDdWtLHVNHVI8K+mBe6gLRlW3BfzaDuoXBgMmOTZqidKNRLkZPvYgxV4apdzq3hSA==
X-Received: by 2002:a50:9ee6:: with SMTP id a93mr44058590edf.174.1609185893678;
        Mon, 28 Dec 2020 12:04:53 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:53 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/22] strace: update 5.9 -> 5.10
Date: Mon, 28 Dec 2020 21:04:28 +0100
Message-Id: <20201228200436.78130-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
as upstream has removed IPPROTO_MAX altogether.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...PROTO_MAX-last-in-IPPROTO_-constants.patch | 70 -------------------
 .../strace/{strace_5.9.bb => strace_5.10.bb}  |  9 ++-
 2 files changed, 6 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
 rename meta/recipes-devtools/strace/{strace_5.9.bb => strace_5.10.bb} (88%)

diff --git a/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch b/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
deleted file mode 100644
index cd53f33f60..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 387d3b6fba95cb47c4dacc6bcd330148a9168850 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Oct 2020 12:54:03 -0700
-Subject: [PATCH] xlat: Mark IPPROTO_MAX last in IPPROTO_* constants
-
-* xlat/inet_protocols.in (IPPROTO_MAX): It should be the last entry
-  after adding IPPROTO_MPTCP this should have new value as
-  IPPROTO_MPTCP + 1.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2020-October/010253.html]
----
- xlat/inet_protocols.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/xlat/inet_protocols.in
-+++ b/xlat/inet_protocols.in
-@@ -32,5 +32,5 @@ IPPROTO_UDPLITE		136
- IPPROTO_MPLS		137
- IPPROTO_ETHERNET	143
- IPPROTO_RAW		255
--IPPROTO_MAX		256
- IPPROTO_MPTCP		262
-+IPPROTO_MAX		263
---- a/xlat/inet_protocols.h
-+++ b/xlat/inet_protocols.h
-@@ -234,19 +234,19 @@ DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
- #else
- # define IPPROTO_RAW 255
- #endif
--#if defined(IPPROTO_MAX) || (defined(HAVE_DECL_IPPROTO_MAX) && HAVE_DECL_IPPROTO_MAX)
-+#if defined(IPPROTO_MPTCP) || (defined(HAVE_DECL_IPPROTO_MPTCP) && HAVE_DECL_IPPROTO_MPTCP)
- DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
--static_assert((IPPROTO_MAX) == (256), "IPPROTO_MAX != 256");
-+static_assert((IPPROTO_MPTCP) == (262), "IPPROTO_MPTCP != 262");
- DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
- #else
--# define IPPROTO_MAX 256
-+# define IPPROTO_MPTCP 262
- #endif
--#if defined(IPPROTO_MPTCP) || (defined(HAVE_DECL_IPPROTO_MPTCP) && HAVE_DECL_IPPROTO_MPTCP)
-+#if defined(IPPROTO_MAX) || (defined(HAVE_DECL_IPPROTO_MAX) && HAVE_DECL_IPPROTO_MAX)
- DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
--static_assert((IPPROTO_MPTCP) == (262), "IPPROTO_MPTCP != 262");
-+static_assert((IPPROTO_MAX) == (263), "IPPROTO_MAX != 263");
- DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
- #else
--# define IPPROTO_MPTCP 262
-+# define IPPROTO_MAX 263
- #endif
- 
- #ifndef XLAT_MACROS_ONLY
-@@ -353,12 +353,12 @@ static const struct xlat_data inet_proto
-  XLAT(IPPROTO_RAW),
-  #define XLAT_VAL_32 ((unsigned) (IPPROTO_RAW))
-  #define XLAT_STR_32 STRINGIFY(IPPROTO_RAW)
-- XLAT(IPPROTO_MAX),
-- #define XLAT_VAL_33 ((unsigned) (IPPROTO_MAX))
-- #define XLAT_STR_33 STRINGIFY(IPPROTO_MAX)
-  XLAT(IPPROTO_MPTCP),
-- #define XLAT_VAL_34 ((unsigned) (IPPROTO_MPTCP))
-- #define XLAT_STR_34 STRINGIFY(IPPROTO_MPTCP)
-+ #define XLAT_VAL_33 ((unsigned) (IPPROTO_MPTCP))
-+ #define XLAT_STR_33 STRINGIFY(IPPROTO_MPTCP)
-+ XLAT(IPPROTO_MAX),
-+ #define XLAT_VAL_34 ((unsigned) (IPPROTO_MAX))
-+ #define XLAT_STR_34 STRINGIFY(IPPROTO_MAX)
- };
- const struct xlat inet_protocols[1] = { {
-  .data = inet_protocols_xdata,
diff --git a/meta/recipes-devtools/strace/strace_5.9.bb b/meta/recipes-devtools/strace/strace_5.10.bb
similarity index 88%
rename from meta/recipes-devtools/strace/strace_5.9.bb
rename to meta/recipes-devtools/strace/strace_5.10.bb
index bee2616a44..22572fb935 100644
--- a/meta/recipes-devtools/strace/strace_5.9.bb
+++ b/meta/recipes-devtools/strace/strace_5.10.bb
@@ -14,9 +14,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
-           file://0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch \
            "
-SRC_URI[sha256sum] = "39473eb8465546c3e940fb663cb381eba5613160c7302794699d194a4d5d66d9"
+SRC_URI[sha256sum] = "fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9a5537b56b8f01c"
 
 inherit autotools ptest
 
@@ -47,10 +46,14 @@ do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
 	install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
 	install -m 644 ${B}/config.h ${D}${PTEST_PATH}
-        sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
+        sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
 
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+     locale-base-en-us.iso-8859-1 \
+"
+
 BBCLASSEXTEND = "native"
 TOOLCHAIN = "gcc"
-- 
2.29.2

