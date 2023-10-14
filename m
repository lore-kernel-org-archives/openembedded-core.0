Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81133CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 15:39:39 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.66629.1697297969325907163
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 08:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRd17qsu;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57de6e502fcso1734931eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697297968; x=1697902768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODBtjcORXBm4E0rBh6oAq2BwDiKm2vntHZyjV/PEzsg=;
        b=WRd17qsuPqfxhfUPObpv3Sl8s56L1xr1jSeNfhqm/U3uCP4xpwTfj7e4Y2xxveTBFP
         RPRwG7oLVGae/a6CL+fu7V4hqz+/zswQ/zVtVLqsFIm5FOstqXMS6axirmcio2WN8heQ
         AezYxMjV0eUn2+p481e55PaS8S9hL+0NruzufBicmGvbtaVaffelc6n5IZbOOXMe7A+d
         yUK4HvOIyWyLCoTG96cR8zKLjRZOR0I8I0XcVCNOXKWf8ropGh/SPnGoLzB87WYsXQi5
         XYMXNLZ2m7hpeGxu2fpbyjftjxQn6Xj2xc7tcuG8o+9uKpl7zE0S48oxwHh+LIlkOw55
         TWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697297968; x=1697902768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODBtjcORXBm4E0rBh6oAq2BwDiKm2vntHZyjV/PEzsg=;
        b=JORM5gEcMW5v3gtAOeWJuc+YH62QtfXmt4ImDgZAA1eBXOsu4Cl1MaS79VywBauVlO
         SoViNNMDwpz2O4JREzYVENDtltWyThTw1eDxhrRmliufe5AvbkXmhIWSYUfWU5D+Z7dD
         2dt2jKdIQsGGj6w+n/ayRHO83LuWhHvls3cA4S7nh0m1b+oO+YHPTy1Qw+UuJzOXBzHX
         2kEXLn+uY0ejy943W6lT66DOM5j19jRiD/42H2NJM8pkBMp4s/Kyl8PX2unVvMXDhjzD
         VsqNc65o4ok8K0BgLV1vdSbbCaK7fEBK+J5d0gVSygaoCL4/9NKerP0ziJstWScudqB8
         xEsA==
X-Gm-Message-State: AOJu0Yy+LDNUSVjAxY8gI7/iVaugZUK0erPhebV6Yzp3jKm4XUK64KLQ
	CsfPG+HrId/h3xz34FXTA1p9DDuP2UZJxA==
X-Google-Smtp-Source: AGHT+IHBb09ALpmEOSTuZ4N0/rem3CvFLG2G0lzApKkU5C7+bo/Clicdn/NRycyJqC1i6dR9fhoFEQ==
X-Received: by 2002:a05:6358:63a9:b0:143:8aa4:30bc with SMTP id k41-20020a05635863a900b001438aa430bcmr32533764rwh.8.1697297968339;
        Sat, 14 Oct 2023 08:39:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::27bb])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b006b6f3bc8123sm1929031pfi.50.2023.10.14.08.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 08:39:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcompat: Upgrade to 1.1.0 release
Date: Sat, 14 Oct 2023 08:39:24 -0700
Message-ID: <20231014153924.54987-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231014153924.54987-1-raj.khem@gmail.com>
References: <20231014153924.54987-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 15:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189119

License-Update: Updated copyright years and contibutors [1]

Brings following changes
* b7bfe0b Update documentation for 1.1 release
* f0de9c6 CHANGELOG: Add pthread section
* 36f21a6 pthread: add pthread_mutexattr_[get|set]kind_np
* f23fb58 stdio: Hook fopen(3) to intercept /proc/self/exe
* 158f2b5 Update CHANGELOG for 1.1
* 4a4c840 fix path-searching for execvp
* 9dbbddc sysctl: Add __getauxval alias
* fbdd06c misc: add __libc_single_threaded
* f727ab7 locale: also override __newlocale/__duplocale
* 244110e random_r: fix null dereference when passed uninitialized buf

[1] https://git.adelielinux.org/adelie/gcompat/-/commit/b7bfe0b08c52fdc72e0c1d9d4dcb2129f1642bd6#0398ccd0f49298b10a3d76a47800d2ebecd49859

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musl/gcompat/0001-auxv-new-module.patch   | 59 -------------------
 meta/recipes-core/musl/gcompat_git.bb         |  7 +--
 2 files changed, 3 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch

diff --git a/meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch b/meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch
deleted file mode 100644
index ee292f38416..00000000000
--- a/meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From aecd42801904462501a890d173648e4e826eda19 Mon Sep 17 00:00:00 2001
-From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
-Date: Sat, 23 Oct 2021 23:29:40 -0500
-Subject: [PATCH] auxv: new module
-
-Adds `__getauxval` wrapper, needed for Parallels Tools GUI installer.
-
-Upstream-Status: Submitted [https://git.adelielinux.org/adelie/gcompat/-/commit/e860a38a88c7ea148ee15976136a1f83ea13f8e0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CHANGELOG.rst     | 5 +++++
- Makefile          | 1 +
- libgcompat/auxv.c | 6 ++++++
- 3 files changed, 12 insertions(+)
- create mode 100644 libgcompat/auxv.c
-
-diff --git a/CHANGELOG.rst b/CHANGELOG.rst
-index ce6859b..c3a9cee 100644
---- a/CHANGELOG.rst
-+++ b/CHANGELOG.rst
-@@ -11,6 +11,11 @@
- 1.1 (202?-??-??)
- ================
- 
-+auxv
-+----
-+
-+* Add __getauxval wrapper for getauxval.
-+
- locale
- ------
- 
-diff --git a/Makefile b/Makefile
-index cbb7634..1893cc1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,6 +2,7 @@ LIBGCOMPAT_INCLUDE = \
- 	libgcompat/alias.h \
- 	libgcompat/internal.h
- LIBGCOMPAT_SRC = \
-+	libgcompat/auxv.c		\
- 	libgcompat/ctype.c		\
- 	libgcompat/cxx_thread.c		\
- 	libgcompat/dlfcn.c		\
-diff --git a/libgcompat/auxv.c b/libgcompat/auxv.c
-new file mode 100644
-index 0000000..01de376
---- /dev/null
-+++ b/libgcompat/auxv.c
-@@ -0,0 +1,6 @@
-+#include <sys/auxv.h> /* getauxval */
-+
-+unsigned long __getauxval(unsigned long value)
-+{
-+	return getauxval(value);
-+}
--- 
-2.37.3
-
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 3e5541ba91e..40fe8c6a5f5 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -5,17 +5,16 @@ SUMMARY = "A library which provides glibc-compatible APIs for use on musl libc s
 HOMEPAGE = "https://git.adelielinux.org/adelie/gcompat"
 
 LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=802b1aed7330d90086be4de63a3188e3"
 
 SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current \
-           file://0001-auxv-new-module.patch \
            file://0001-Add-fcntl64-wrapper.patch \
            "
 SRC_URI:append:powerpc = "\
            file://0001-make-Static-PIE-does-not-work-on-musl-ppc.patch \
            "
-PV = "1.0.0+1.1+git"
-SRCREV = "c6921a1aa454bb87671f9bd1ecfe47d80d1620aa"
+PV = "1.1.0"
+SRCREV = "b7bfe0b08c52fdc72e0c1d9d4dcb2129f1642bd6"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


