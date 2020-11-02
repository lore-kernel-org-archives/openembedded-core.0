Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.1225.1604335802664631593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AcKS3DJ3;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id p93so15016327edd.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n89tc8jFwYxtr0cZRz4VoRk4fzNlpuqrkdmSjZAVfFA=;
        b=AcKS3DJ3lGLX1+GuDGEdW1zMDj3e45cfn8WSdtx+oHPenSeUtZXppCzXY0E7F422+L
         T7LfEy+PovsaqeIgnSuSl9AW3wZev6p3WXfnVeATPHyilGF/wXlT/VYWWdQCdlhtkDMG
         RbyQQsImiScSYVvsjcUEdCsBK3x9HqX1u8+qj2FX73w2tirOFXW7wCxqfpDyn8Gdto2g
         VJV4Nlz/iafNUdfRrnyVoxEPV3UgLj8ZM323OuMUfDxiH6+4SJUVvsoVhxcwE4mPIAyO
         I7HL/YkBPpI9tIK2/tOsH620/Pkbcn8kPpsxx0znmcepPGGJ/2vlUHPh9PDX91b+5DEk
         St7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n89tc8jFwYxtr0cZRz4VoRk4fzNlpuqrkdmSjZAVfFA=;
        b=VT6yt+shwn6QIIIv0LlcIPcuHlZN+53HXz6+iGGJ5Oh+9Af1EI/AlDSTDsUXnygYyT
         veM21K/6aGt+/1XwFPQhl/fZO1q956K5+ZE3QMoOhqjCJhePsTv28frKbdviCymRkgxP
         EX0vjGCPSjttQbL6Xo+a9f0Zzd1D7rHQgUQ5aK0Uz7eJV4keUaelIiR7CDf0jWGblC7B
         1C9Q+C2EMefier7KNXEj/bUwCLdCeLAE+Vt728iJk82Ns1R2KMuDuoZDx26IbUlA9dQb
         Zpn9jgagrELWGyD2oGr6rDsBql5Nak1w3GqE0wkDjQA3UJxEl5YALW6sNtr0tq0F257H
         29XQ==
X-Gm-Message-State: AOAM533sQtdngyfjZn7JPenGJa05E92fs3pri6msKOiDAALDHG7hrrN7
	9Jn3t2FTvvp3bHXt0LhPK86HHClH9qVqOw==
X-Google-Smtp-Source: ABdhPJz9+vhbdSde4i+LBUGV1Yy0CoInTKlcTAi09k+GuC7ykrTm6YiicqPm2OOsrT1S3NMVZ1HZLw==
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr17053941edv.264.1604335800942;
        Mon, 02 Nov 2020 08:50:00 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 49/80] nfs-utils: upgrade 2.5.1 -> 2.5.2
Date: Mon,  2 Nov 2020 17:48:36 +0100
Message-Id: <20201102164907.27572-49-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop chunks from clang-warnings.patch that are merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../nfs-utils/nfs-utils/clang-warnings.patch  | 45 +++++--------------
 ...{nfs-utils_2.5.1.bb => nfs-utils_2.5.2.bb} |  2 +-
 2 files changed, 11 insertions(+), 36 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.5.1.bb => nfs-utils_2.5.2.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
index 20400fef67..fde99b599e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
@@ -1,4 +1,7 @@
-Detect warning options during configure
+From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 31 Dec 2019 08:15:34 -0800
+Subject: [PATCH] Detect warning options during configure
 
 Certain options maybe compiler specific therefore its better
 to detect them before use.
@@ -12,28 +15,12 @@ Wdiscarded-qualifiers is gcc specific and this is no longer needed
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- a/configure.ac
-+++ b/configure.ac
-@@ -599,7 +599,6 @@ my_am_cflags="\
-  -Werror=parentheses \
-  -Werror=aggregate-return \
-  -Werror=unused-result \
-- -Wno-cast-function-type \
-  -fno-strict-aliasing \
- "
- 
-@@ -619,9 +618,10 @@ CHECK_CCSUPPORT([-Werror=format-overflow
- CHECK_CCSUPPORT([-Werror=int-conversion], [flg2])
- CHECK_CCSUPPORT([-Werror=incompatible-pointer-types], [flg3])
- CHECK_CCSUPPORT([-Werror=misleading-indentation], [flg4])
-+CHECK_CCSUPPORT([-Wno-cast-function-type], [flg5])
- AX_GCC_FUNC_ATTRIBUTE([format])
- 
--AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4"])
-+AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4 $flg5"])
- 
- # Make sure that $ACLOCAL_FLAGS are used during a rebuild
- AC_SUBST([ACLOCAL_AMFLAGS], ["-I $ac_macro_dir \$(ACLOCAL_FLAGS)"])
+---
+ support/nfs/xcommon.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
+index 3989f0b..e080423 100644
 --- a/support/nfs/xcommon.c
 +++ b/support/nfs/xcommon.c
 @@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
@@ -47,15 +34,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
       va_end (args);
       free (fmt2);
  }
---- a/utils/mount/stropts.c
-+++ b/utils/mount/stropts.c
-@@ -1094,9 +1094,7 @@ static int nfsmount_fg(struct nfsmount_i
- 		if (nfs_try_mount(mi))
- 			return EX_SUCCESS;
- 
--#pragma GCC diagnostic ignored "-Wdiscarded-qualifiers"
- 		if (errno == EBUSY && is_mountpoint(mi->node)) {
--#pragma GCC diagnostic warning "-Wdiscarded-qualifiers"
- 			/*
- 			 * EBUSY can happen when mounting a filesystem that
- 			 * is already mounted or when the context= are
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.2.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.2.bb
index b8ad23a0d8..c7ac67cf31 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.2.bb
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[sha256sum] = "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4"
+SRC_URI[sha256sum] = "d493b81c9d3ffce5d10af701a63ed2b8a21768c23da4a2eceb4d708aea65d9de"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.29.0

