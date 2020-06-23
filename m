Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.4922.1592911778832360026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 04:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AhIzWB4g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h15so176142wrq.8
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYa6oqUvWnBnZ79eUieslRjJKetvpYW+t58iS4cgD/0=;
        b=AhIzWB4gXn7p6HuXorr60uQ4/d5Vn+op2f0jXoNQ0OmehOtdQpIFDai9ylK9coGeWO
         +FXEUVAwQtcBxJcbv+LlBRVJAjUlmcG9Vf13uq47B7aMU0s1adAHV46jpCgX8dTHERXG
         nL+INRezbUmKlZtPWtWui2PCTd4TLY9PGc1wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYa6oqUvWnBnZ79eUieslRjJKetvpYW+t58iS4cgD/0=;
        b=jQK0eFCxyV51falB5acFhuXNjHyAKwPq5F0LanZXZYc7tWRfJsNknmhb8d9SYmJn0N
         tA9/IG7W+ikkoS3p4E1r7wX6Rj5Rf4uuqpI53tOP5sRiQvvcPEV6DcI3lcQ1myACC8tc
         7a/CemW9HII1HjCCdX0wFGx2aQ3krZB4pMG2TmtV1cazppvseEMzmd8n0uXFz7I6tQsY
         xcCMPGjcej3iT8vlg4GemXhgEiTbx51P5v2hcvc+ONdekJBJNTTw+cenrEQcCyPYXylq
         wOXabzDAJMJ0u9Zi6HdgMvd5vC9v4qTa9ZkVMCOKjLA6S1b9tznMwEXH/pdczfhXAhig
         SzdA==
X-Gm-Message-State: AOAM5319fCUDNmYsZrwkmPKPZAoGfVPefgeu4GZ1KZQXNfvYAM96FpWc
	v8pgJsD5z9UDV60EZTUiUmuqOxVVH382mQ==
X-Google-Smtp-Source: ABdhPJwzENAz4F4HKBiGOEJnCWtnGg2/7tICt0AjB9nCl8pGSChG0j6ukoYw5VI9FVn+8B1WOnXdrg==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr26366134wrv.394.1592911776750;
        Tue, 23 Jun 2020 04:29:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u23sm8061547wru.94.2020.06.23.04.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 04:29:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: Fix Upstream-Status Accepted -> Backport
Date: Tue, 23 Jun 2020 12:29:35 +0100
Message-Id: <20200623112935.598833-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It helps our stats tracking to use Backport consitently, it mreans the same
thing as Accepted in pretty much all cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...7-binutils-drop-redundant-program_name-definition-fno-.patch | 2 +-
 ...1-enc2xs-Add-environment-variable-to-suppress-comments.patch | 2 +-
 ...2-src-global.c-Remove-superfluous-declaration-of-progr.patch | 2 +-
 ...1-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch | 2 +-
 .../files/0001-Make-man-pages-reproducible.patch                | 2 +-
 .../files/0001-Makefile-cleanup-install-for-rebuilds.patch      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
index 55af9abc130..be59f9dca0a 100644
--- a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
+++ b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
@@ -8,7 +8,7 @@ Subject: [PATCH] binutils: drop redundant 'program_name' definition
 	* srconv.c (program_name): Likewise
 	* sysdump.c (program_name): Likewise
 
-Upstream-Status: Accepted (commit 0b398d69ac)
+Upstream-Status: Backport (commit 0b398d69ac)
 Signed-off-by: Sergei Trofimovich <siarheit@google.com>
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
diff --git a/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch b/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
index 3a41820f46b..1a531072a8a 100644
--- a/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
+++ b/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
@@ -8,7 +8,7 @@ ENC2XS_NO_COMMENTS environment variable. This allows enc2xs to produce
 reproducible output by omitting the name of the generating program.
 
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-Status: Accepted [https://github.com/dankogai/p5-encode/pull/145]
+Upstream-Status: Backport [https://github.com/dankogai/p5-encode/pull/145]
 ---
  cpan/Encode/bin/enc2xs | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
index d48a3b0d19b..478324c1c48 100644
--- a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
+++ b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
@@ -3,7 +3,7 @@ From: Sergey Poznyakoff <gray@gnu.org>
 Date: Mon, 20 Jan 2020 07:45:39 +0200
 Subject: [PATCH] src/global.c: Remove superfluous declaration of program_name
 
-Upstream-Status: Accepted (commit 641d3f4)
+Upstream-Status: Backport (commit 641d3f4)
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
  src/global.c | 3 ---
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
index adb357b5ecc..fc37a5bb96d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
@@ -9,7 +9,7 @@ to build race errors between building the compiler and using it.
 
 Fix provided by Quentin Schulz <quentin.schulz@streamunlimited.com>
 
-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/228]
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/228]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  gir/meson.build | 2 +-
diff --git a/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch b/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
index 886fd26db18..57b336c0c09 100644
--- a/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
+++ b/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Make man pages reproducible
 Instructs the man page to be gzip'ed without the file name or timestamp
 so that it builds reproducibly.
 
-Upstream-Status: Accepted [https://github.com/smuellerDD/jitterentropy-library/pull/14]
+Upstream-Status: Backport [https://github.com/smuellerDD/jitterentropy-library/pull/14]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 ---
  Makefile | 2 +-
diff --git a/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch b/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
index a19b2522935..9af334ce2c5 100644
--- a/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
+++ b/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
@@ -10,7 +10,7 @@ Provide the ability to override the stripping of the shared lib for
 cases where a embedded target build may want to control stripping
 or provide cross arch tools.
 
-Upstream-Status: Accepted [060b9b4147f6e5ff386a8b017796118d783e59fa]
+Upstream-Status: Backport [060b9b4147f6e5ff386a8b017796118d783e59fa]
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 Signed-off-by: Stephan Mueller <smueller@chronox.de>
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-- 
2.25.1

