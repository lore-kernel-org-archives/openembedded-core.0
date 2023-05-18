Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B38CC7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 15:00:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.19449.1684422006388325019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 08:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Bq6sCqmq;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f41d087b3bso21677535e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684422004; x=1687014004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wkwru7JJUK7MTs695QoujPIJzNNEbwfAyy0XWJ7+Yco=;
        b=Bq6sCqmqY0vals/gyMWvJDx+962exPKpmGQamTJxNlwphp4Z/ueJCrjo1hUKMFBy2l
         ozLxhZfOuX8mcIh3YevuCS4S3h/dnfhoehuwm6M3WpeQeFBmRz+155G8t5yQszrkTCTS
         IBGfiUiZShQyHFxv+XtKEnrpk8cr/6I2/UoPEgUwEDydRhFPEVESa1WS9uSS9SxchC3Z
         aEQdhCXv8F2l5SUi5JBDHYBL5k6zByVabbhG9jpUVwyTmUeIli21D41H4v2DMkRzrtIb
         ACdnrMr5yM4u6S55WtgnhxrdWIcA/WHAflPFJ/PlRcYq6fKZDpPTuB8bPOqB3lnzGx+T
         Tq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684422004; x=1687014004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wkwru7JJUK7MTs695QoujPIJzNNEbwfAyy0XWJ7+Yco=;
        b=D7tC6J98PWaOpCh1yKm/6hFz75nNzbaWpipuu1PoIuAtkJNRwz9VMXiYlQXexlkuG/
         v/hY0LJZp4Amk51eFPQz+VzOrQMw3dmNDwqTtOnVX0XhwI0ZrQaTlm5eIaJx0UdsY/Lg
         6wgxZKQ+I1EbdFGByTwTqwtoOsWDTG7NUMuUnkC6k1VyYG/XqHn9xjluqVIaUXEBlfmS
         Gnbn/iw8+dofEEBzxZosEe8NcS0CcnhdPtuzefW7TifzovoYlYNuTHioamVBr91uAJ+e
         +vzTeBx+baqK8K91gehWkzz0YaVNz/qcD/Rb3VwbFQgLvGrPKXE+L0rndGF8HxdI86IF
         nvrg==
X-Gm-Message-State: AC+VfDx3eVG3wgCXkcktH6DS4A8efrfWTsuz51gNsbJJRp5hA0gp+Aqs
	a8Qg51WSLYed7HnjaIo9o6b6Tgmc/40=
X-Google-Smtp-Source: ACHHUZ75J6eoz68w1oZCc/ZSpyfn+aYLiwxVfvtbYUBei2yfWHqoT7oMq+/CRz8wS/cAdkupbczVDQ==
X-Received: by 2002:a1c:6a03:0:b0:3f4:2374:3517 with SMTP id f3-20020a1c6a03000000b003f423743517mr1771478wmc.19.1684422004281;
        Thu, 18 May 2023 08:00:04 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id m39-20020a05600c3b2700b003f07ef4e3e0sm10001479wms.0.2023.05.18.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 08:00:04 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] rpm: upgrade to v4.18.1
Date: Thu, 18 May 2023 15:59:49 +0100
Message-Id: <20230518145949.13580-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 15:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181522

Changes:
Rebase patches for upstream changes.
Remove patches not needed due to upstream changes.
Add a new patch to fix build failure.
Package egg-info file.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...olor-setting-for-mips64_n32-binaries.patch |  8 ++--
 ...lib-rpm-as-the-installation-path-for.patch |  4 +-
 .../0001-Fix-compiler-error-on-clang.patch    | 42 +++++++++++++++++++
 ...o-not-build-manpages-requires-pandoc.patch | 23 ----------
 meta/recipes-devtools/rpm/files/fifofix.patch | 22 ----------
 .../rpm/{rpm_4.18.0.bb => rpm_4.18.1.bb}      |  6 +--
 6 files changed, 51 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-compiler-error-on-clang.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch
 rename meta/recipes-devtools/rpm/{rpm_4.18.0.bb => rpm_4.18.1.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index 9f5dde0720..f06058b1b7 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -15,7 +15,7 @@ Index: git/build/rpmfc.c
 ===================================================================
 --- git.orig/build/rpmfc.c
 +++ git/build/rpmfc.c
-@@ -645,6 +645,7 @@ exit:
+@@ -646,6 +646,7 @@ exit:
  static const struct rpmfcTokens_s rpmfcTokens[] = {
    { "directory",		RPMFC_INCLUDE },
  
@@ -23,16 +23,16 @@ Index: git/build/rpmfc.c
    { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
    { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
  
-@@ -1150,6 +1151,9 @@ static uint32_t getElfColor(const char *
+@@ -1151,6 +1152,9 @@ static uint32_t getElfColor(const char *fn)
  		color = RPMFC_ELF32;
  		break;
  	    }
 +            if (ehdr.e_machine == EM_MIPS || ehdr.e_machine == EM_MIPS_RS3_LE)
 +                if (ehdr.e_flags & EF_MIPS_ABI2)
 +                    color = RPMFC_ELFMIPSN32;
- 	    elf_end(elf);
  	}
- 	close(fd);
+ 	if (elf)
+ 	    elf_end(elf);
 Index: git/rpmrc.in
 ===================================================================
 --- git.orig/rpmrc.in
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 6f613d0a7d..ad54336bec 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -30,7 +30,7 @@ Index: git/macros.in
 ===================================================================
 --- git.orig/macros.in
 +++ git/macros.in
-@@ -911,7 +911,7 @@ package or when debugging this package.\
+@@ -930,7 +930,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -55,4 +55,4 @@ Index: git/rpm.am
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 12:0:3
+ rpm_version_info = 13:0:4
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-compiler-error-on-clang.patch b/meta/recipes-devtools/rpm/files/0001-Fix-compiler-error-on-clang.patch
new file mode 100644
index 0000000000..fa5bc955ad
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Fix-compiler-error-on-clang.patch
@@ -0,0 +1,42 @@
+From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
+From: Florian Festi <ffesti@redhat.com>
+Date: Thu, 16 Mar 2023 19:05:04 +0100
+Subject: [PATCH] Fix compiler error on clang
+
+Turns out variable declarations are not allowed after a label, even in
+C99. And while some compilers don't seem to care others do.
+
+Moving the declaration of mayopen to the start of the function to avoid
+this problem.
+
+Resolves: #2435
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/b960c0b43a080287a7c13533eeb2d9f288db1414]
+---
+ lib/fsm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 5671ac642..183293edb 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
+     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
+     int firstlinkfile = -1;
++    int mayopen = 0;
+     char *tid = NULL;
+     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
+     struct filedata_s *firstlink = NULL;
+@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 
+ setmeta:
+ 	    /* Special files require path-based ops */
+-	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
++	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
+ 	    if (!rc && fd == -1 && mayopen) {
+ 		int flags = O_RDONLY;
+ 		/* Only follow safe symlinks, and never on temporary files */
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
deleted file mode 100644
index d7137f1d10..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 9bf1693092385eba9841614613313010221ca01f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 29 Jun 2021 20:11:26 +0200
-Subject: [PATCH] docs: do not build manpages (requires pandoc)
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- docs/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-Index: git/docs/Makefile.am
-===================================================================
---- git.orig/docs/Makefile.am
-+++ git/docs/Makefile.am
-@@ -1,7 +1,5 @@
- ## Process this file with automake to produce Makefile.in
- 
--SUBDIRS = man
--
- EXTRA_DIST =
- 
- EXTRA_DIST += \
diff --git a/meta/recipes-devtools/rpm/files/fifofix.patch b/meta/recipes-devtools/rpm/files/fifofix.patch
deleted file mode 100644
index 71703d7f0c..0000000000
--- a/meta/recipes-devtools/rpm/files/fifofix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Calling openat() on a fifo causes a pseudo hang for us (e.g. the fifo in psplash).
-Avoid calling openat for fifos.
-
-Introduced upstream with:
-
-https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/issues/2195]
-
-Index: git/lib/fsm.c
-===================================================================
---- git.orig/lib/fsm.c
-+++ git/lib/fsm.c
-@@ -1010,7 +1010,7 @@ int rpmPackageFilesInstall(rpmts ts, rpm
-                     rc = RPMERR_UNKNOWN_FILETYPE;
-             }
- 
--	    if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode)) {
-+	    if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode) && !S_ISFIFO(fp->sb.st_mode)) {
- 		/* Only follow safe symlinks, and never on temporary files */
- 		fd = fsmOpenat(di.dirfd, fp->fpath,
- 				fp->suffix ? AT_SYMLINK_NOFOLLOW : 0, 0);
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_4.18.0.bb
rename to meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 7790db8b5a..532ad9fdd1 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -35,15 +35,14 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-perl-disable-auto-reqs.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
-           file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
-           file://fifofix.patch \
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
+           file://0001-Fix-compiler-error-on-clang.patch \
            "
 
 PE = "1"
-SRCREV = "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
+SRCREV = "4588bc3f994338502d2770ad24cbfcdaa6c335ec"
 
 S = "${WORKDIR}/git"
 
@@ -173,6 +172,7 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/mkinstalldirs \
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
+    ${libdir}/${PYTHON_DIR}/site-packages/rpm*egg-info \
 "
 FILES:${PN}-build:append:class-nativesdk = " ${SDKPATHNATIVE}/etc/rpm/macros"
 
-- 
2.30.2


