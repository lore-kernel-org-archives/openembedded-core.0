Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DBEC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:53 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8402.1676011361482388390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1oWS+pQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m14so4019448wrg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHw6JqItf2/bJH3AFlfEx04CzsL9lAFOdMoOFikqC0g=;
        b=X1oWS+pQV0yEPwvA3V9JU/Godb8S7NkR/X26Q7+HmxgERYFB73JJ/bXfUeGHvdKPRU
         hoSXZtk7tp0I8b2QCnc8ouH9Ft8nZC54tyArqSzoWQlm1SNOqwNk+kWjb4PUoVTxF2I9
         gBiSE2GAyIuUr8ydC+TcpMCj+nH8DajZmCJ3e5fikmjmteRAqfmZ1IjFZ4vB1eu52hUX
         v2Sz+mggXGwkPUtLLjEvXfN6fjliIBp39ETg60Bq7JI1+R4NikpPInnx8GgSgTnOZkpw
         t71RZiQmlvLYEhP4Dp6GO8fQRKNZzJuRo37oeo5L5SdT/YpP13uMbTXq5mYguHb7s+Iz
         k3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHw6JqItf2/bJH3AFlfEx04CzsL9lAFOdMoOFikqC0g=;
        b=WzSql1zgCkuuPdscw4iPQyPu0Mavf2imGY2qw2yZC02qI/B89PXIV2ZnaQgLg3J2Se
         KmhyKXHWWpmbG1mR4+XxQKf9ucTKyf3GQv9Nnl86X1s7D5Eb185YDEbOEf7Q0yEtUcVe
         rD/KtrvIZxIaofLntowY0JjUY+7kWjcWs2q3uxyDCUeCRcDSwT177sSPX+EqZ/FTg53G
         OmKASPxF0pH7BTqNOB5ak9sZ03nBL8+DnSDPGyGFLFf5OCsUpVbL1tesNKXDgwfroqDb
         9bRAVsiF0WFxqToLgyR3I+SRzKWbxOFFNqhlZ89Xrvyg9ODmA1UAhORZTIcttnD7XprY
         bDag==
X-Gm-Message-State: AO0yUKU23EaTOA4S1KIFVpty9ZRBvzrkcZ4uwK/06YwpYzQWp4JfJu16
	gqdat0dCDrHevOp9skwwoizgvnfSZOU=
X-Google-Smtp-Source: AK7set/+YqhEddemTj27o7k6xlG1VJ/F3HT7GV5xPEWSjwev/4IIl29gvdGXeM/L7kHiLF/EsKEWtA==
X-Received: by 2002:adf:fbc2:0:b0:2c3:d707:7339 with SMTP id d2-20020adffbc2000000b002c3d7077339mr6020791wrs.6.1676011364348;
        Thu, 09 Feb 2023 22:42:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/8] mesa: update 22.3.3 -> 22.3.5
Date: Fri, 10 Feb 2023 07:42:16 +0100
Message-Id: <20230210064216.4123807-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176982

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ove-fix-ALWAYS_INLINE-compiler-error.patch | 36 -------------------
 .../{mesa-gl_22.3.3.bb => mesa-gl_22.3.5.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 .../mesa/{mesa_22.3.3.bb => mesa_22.3.5.bb}   |  0
 4 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.3.3.bb => mesa-gl_22.3.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.3.3.bb => mesa_22.3.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
deleted file mode 100644
index 1cf23492fe..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 267dd1f4d571ee606141aa66f1665aa152b4e911 Mon Sep 17 00:00:00 2001
-From: t0b3 <thomas.bettler@gmail.com>
-Date: Sat, 10 Dec 2022 14:32:53 +0100
-Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
-
-Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-Closes: #6825
-Fixes: f1d20ec6 ("nir/nir_opt_move: handle non-SSA defs ")
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911]
----
- src/compiler/nir/nir_opt_move.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_opt_move.c
-index 81bcde5c436..9aeb9f4cf86 100644
---- a/src/compiler/nir/nir_opt_move.c
-+++ b/src/compiler/nir/nir_opt_move.c
-@@ -51,13 +51,13 @@
-  * lower register pressure.
-  */
- 
--static ALWAYS_INLINE bool
-+static inline bool
- src_is_ssa(nir_src *src, void *state)
- {
-    return src->is_ssa;
- }
- 
--static ALWAYS_INLINE bool
-+static inline bool
- instr_reads_register(nir_instr *instr)
- {
-    return !nir_foreach_src(instr, src_is_ssa, NULL);
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.3.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cc4aa5eeab..0a3dc1dd62 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
-           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
 
-SRC_URI[sha256sum] = "bed799788bf2bd9ef079d97cd8e09348bf53cb086818578e40773b2b17812922"
+SRC_URI[sha256sum] = "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.3.3.bb b/meta/recipes-graphics/mesa/mesa_22.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.3.3.bb
rename to meta/recipes-graphics/mesa/mesa_22.3.5.bb
-- 
2.30.2


