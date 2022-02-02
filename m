Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54102C4321E
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:17 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.2220.1643826496570588296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ihnjgbDQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id m4so205777ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBjs/FYqRUibX+Bo8O0EnkawzbehM6vfZHwrwCL5i/c=;
        b=ihnjgbDQyXubWOkxS+m5VPR0LG3Nquzao6PFsYcc+VgvTjJItVpCABi8pEt92A6OeN
         ZUoD1vR+DKABFTHc8jr2K/4q2E3eT4bXXJcYTSV6LtU7TxspV9f2h7qbnlkKzrW2ks84
         gsrevoYAneskR63kp75gkTbXFkFp15FBPeFIzVmNUtRch6+4fIsRFr4+kHHwhHU+lyrh
         ty6eSIHvz7kl8obg7W1SdqSrRmI902tmihEjh1CGMRqBD8kah2i4ejdNp6FMCybqahJl
         NPJPSY8l8XflH2AaOX070vOUtdevVDr+wjNmlLG+ZYkW5AgKo/4zoToTr3avxgT26MdP
         D72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BBjs/FYqRUibX+Bo8O0EnkawzbehM6vfZHwrwCL5i/c=;
        b=Fn59jc7xsevRYxhXfc6Ekh6HevdagFwwxb34IecgtBvy2MB2OxTinjFqnbMt0ONaAD
         CtWNv49mM87IXNWx/h+UQl2jcCQBMPrpIdKTPUiP9xvA21ZaE5op71eOiPpVuNYNipxJ
         h/nznKTbJvJyhKyRHm5Vv/yaErz2ZetA2uJHNG5iYtaKrCC5WQeC+7fpQcFRFULJiRhz
         XYEUQN9hwpvPnRZrg4xJt9FJDphZwazAi98XBRR5g4oVt2YwrCTSv2OM753AVWkjmWCj
         sHcLPSuT0vpABZGMRvmZQkbO9I9CkG5u4f8pz11lLiKyiUVsK1qMDTXoZZ3X9TbzZdlS
         yqsw==
X-Gm-Message-State: AOAM532wEJfQ+K6wEbjeyAPc/y6aLqFWYqnQ4EbwSDxeGvfe70OAot2h
	9sRMULuUtwiiXkFFYgxyB36XqoL3/Rs=
X-Google-Smtp-Source: 
 ABdhPJwtOprmKdLc7kWhrFaWdB8NgtHJcQBur3HSJGWYek5iJ+JORgjcdIQrX0JAJGzbtUaPTyeh9Q==
X-Received: by 2002:a17:907:6088:: with SMTP id
 ht8mr24905622ejc.619.1643826495182;
        Wed, 02 Feb 2022 10:28:15 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/33] libgpg-error: update 1.43 -> 1.44
Date: Wed,  2 Feb 2022 19:27:39 +0100
Message-Id: <20220202182758.919991-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161239

Drop accepted patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...not-hardcode-gnu-libc-when-generatin.patch | 27 -------------------
 ...gpg-error_1.43.bb => libgpg-error_1.44.bb} |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.43.bb => libgpg-error_1.44.bb} (89%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
deleted file mode 100644
index ef7a7df1b8..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7437acb228678ea5d8288b930b4f5b72c3d449ed Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 24 May 2021 11:03:42 +0200
-Subject: [PATCH] configure.ac: do not hardcode gnu libc when generating
- lock-obj
-
-This erroneously excluded e.g. musl libc.
-
-Upstream-Status: Submitted [by email to gniibe@fsij.org,gnupg-devel@gnupg.org]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c0aab53..6d46d13 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -603,7 +603,7 @@ if test x"$gl_use_threads" = xno; then
-   AC_MSG_NOTICE([generated src/lock-obj-pub.native.h for $host])
- elif test x$cross_compiling = xyes; then
-   case $host in
--    *-*-linux-gnu*)
-+    *-*-linux-*)
-     AC_CHECK_TOOL(OBJDUMP, [objdump])
-     if test -n "$OBJDUMP"; then
-       lock_obj_h_generated=yes
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.43.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
similarity index 89%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.43.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
index fe3824b8e0..e3171f0f25 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.43.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
@@ -17,10 +17,9 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
-           file://0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch \
            "
 
-SRC_URI[sha256sum] = "a9ab83ca7acc442a5bd846a75b920285ff79bdb4e3d34aa382be88ed2c3aebaf"
+SRC_URI[sha256sum] = "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.20.1


