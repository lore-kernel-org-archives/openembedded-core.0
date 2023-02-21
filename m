Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71F1C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.44230.1676990476541129870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=USIGKfFx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id t1so2192122pgi.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdAU0ifAf5yNi9xcT28n1yztvh+x9zb+d0mH5frbkDg=;
        b=USIGKfFxZZgiFSyabR15r4EYWQ3bdXBVt3nE6s99sBnTHkm/RAl+56Ge3dm2kkrXHL
         O8cQF6jRVE4qhpc338un7rZZLzg32MAOTkwLvkyUo8IniDWxogwhDsvQC9pu6sw7GKte
         ajYJdD398VeEBVmC7zFD1niKl/tfKJ3W1v7U4aqfe9MJUY1bNGJWzZO8ABOrM+046u/c
         x1XHup8NFl6AKHzJqY6NosYKAfVjPWXU2mUjP76ZTnzgi3KLPPrG430CSCESBTbZUXdl
         wzlMbiIpFgFEDjeSxFrbSVgQGookDWR9rKD9HuZ5IWd1TDftUkLRkyQLc69ZAoDU1wSi
         DSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdAU0ifAf5yNi9xcT28n1yztvh+x9zb+d0mH5frbkDg=;
        b=F5w5EYUEEDXbfmPTbjdsLh9TFMNuRPhsZ/Sv+uuYLLVRfv+FfgO0o+I9VBDmX2u1YU
         byqaLnvMhM9yKroU68hQhEevgrVRY6If0vjWQ+qWynxXBoRCney62zzMBtLmt1Qixcc5
         kOQPeeQqruKZ8zeZGNchLv51m+MLibTniQfcUqj670Hh2p3gDAtmzCOrsQrVdntoFRyM
         OG/iO5fHkKNa7K3xiRnaFTodYkB756geMFG3mAV8pWgUicF+zgvB+Y6whAUPyH8tko4p
         rnZp3gPNplWC6jQ+5Csr6FAzyFuiME8/ULg9dS2u10tzLN7s7hekvI/KRQRgdhLYumOH
         /XjQ==
X-Gm-Message-State: AO0yUKX6ITJqzxLPb8kxm1X8ZJAkZXX28FKat3OKs96jtfKUypfLTYPc
	S9WwhwgO7RdDsJ56Vuc2F7GlpcGthzLZlsX7PKA=
X-Google-Smtp-Source: AK7set9HpTHA9/rXYE8GuhEJTrXOKxSKdQiIksqF4Ns/S6zFxZl204lbgrf7oYJ7n1DBG5Ypj0laWw==
X-Received: by 2002:aa7:842a:0:b0:5aa:39a8:41ab with SMTP id q10-20020aa7842a000000b005aa39a841abmr6322379pfn.21.1676990475406;
        Tue, 21 Feb 2023 06:41:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/23] diffutils: update 3.8 -> 3.9
Date: Tue, 21 Feb 2023 04:40:45 -1000
Message-Id: <686bb89d7553f48c029b6f6d79c88304f2dc0c55.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177502

From: Alexander Kanavin <alex.kanavin@gmail.com>

NEWS

* Noteworthy changes in release 3.9 (2023-01-15) [stable]

** Bug fixes

  diff -c and -u no longer output incorrect timezones in headers
  on platforms like Solaris where struct tm lacks tm_gmtoff.
  [bug#51228 introduced in 3.4]

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5ec5de7217de28bccf3243496df6b41ca8a1d0b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 6bf52987a82370a1353399a480271a76237e7619)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Skip-strip-trailing-cr-test-case.patch | 11 +++----
 ...a-standard-layout-so-glibc-and-musl-.patch | 33 -------------------
 .../{diffutils_3.8.bb => diffutils_3.9.bb}    |  3 +-
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.8.bb => diffutils_3.9.bb} (88%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index aac1c43465..8b88c308f2 100644
--- a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -1,4 +1,4 @@
-From bd7fb8be2ae2d75347cf7733302d5093046ffa85 Mon Sep 17 00:00:00 2001
+From 027229d25392b22d7280c0abbc3efde4f467d167 Mon Sep 17 00:00:00 2001
 From: Peiran Hong <peiran.hong@windriver.com>
 Date: Thu, 5 Sep 2019 15:42:22 -0400
 Subject: [PATCH] Skip strip-trailing-cr test case
@@ -10,19 +10,21 @@ package.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
+
 ---
  tests/Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 83a7c9d..04d51b5 100644
+index d98df82..757ea52 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -21,8 +21,10 @@ TESTS = \
+@@ -21,9 +21,11 @@ TESTS = \
    stdin \
    strcoll-0-names \
    filename-quoting \
 -  strip-trailing-cr \
+   timezone \
    colors
 +# Skipping this test since it requires valgrind
 +# and thus is too heavy for diffutils package
@@ -30,6 +32,3 @@ index 83a7c9d..04d51b5 100644
  
  XFAIL_TESTS = large-subopt
  
--- 
-2.21.0
-
diff --git a/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch b/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
deleted file mode 100644
index 4928e1eaff..0000000000
--- a/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f385ad6639380eb6dfa8b8eb4a5ba65dd12db744 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 25 Mar 2022 13:43:19 -0700
-Subject: [PATCH] mcontext is not a standard layout so glibc and musl differ
-
-This is already applied to libsigsegv upstream, hopefully next version
-of grep will update its internal copy and we can drop this patch
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commitdiff;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/sigsegv.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/sigsegv.c b/lib/sigsegv.c
-index 998c827..b6f4841 100644
---- a/lib/sigsegv.c
-+++ b/lib/sigsegv.c
-@@ -219,8 +219,8 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
- #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
- #  else /* 32-bit */
- /* both should be equivalent */
--#   if 0
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
-+#   if ! defined __GLIBC__
-+#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
- #   else
- #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
- #   endif
--- 
-2.35.1
-
diff --git a/meta/recipes-extended/diffutils/diffutils_3.8.bb b/meta/recipes-extended/diffutils/diffutils_3.9.bb
similarity index 88%
rename from meta/recipes-extended/diffutils/diffutils_3.8.bb
rename to meta/recipes-extended/diffutils/diffutils_3.9.bb
index 8889c83ee2..2bb9e6f32d 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.8.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.9.bb
@@ -6,10 +6,9 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
-           file://0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch \
            "
 
-SRC_URI[sha256sum] = "a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec"
+SRC_URI[sha256sum] = "d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.34.1


