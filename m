Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0E86BA9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 19:54:10 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v23so19414050otk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3uRD8PXXglPWjKp+zZnwsToRrrovzdPwBYJmtvRCuX8=;
	b=H1W/8/nhz9RFVgwFRVRg8jK3CjAHnak+HvDzv36KIpeTpw4tZw5LXnHNniUrL5Edr6
	rymEefVWMgHmk96ELykGyGNjxH0Msy07sgbRp1jyurSh5bRz7XL5rCRZW5NVBhL/MoBz
	6IFkBbM2CoyTCJ3zRUqiI9tyM60Nt0g5ykCr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3uRD8PXXglPWjKp+zZnwsToRrrovzdPwBYJmtvRCuX8=;
	b=h74XL8xhH8HfyN2ZucUWnXhG9nQpgBohdGjxg7JqE/L8IF+5LMIflWEEBdROIxZcWF
	M2VsyUHEZXAgs+7g+xlJ2xXO355hX1R35iUMcukB4+HfpfsJL8puurQjFOUFUclDOMJm
	HOUhF+E7fBFRePXiz+qXIeJQNQ6MDz+z11ZHWJEYiPVzeBAIrQ5ScpdDm3n8nhcbSmTw
	mQk9DE2sDAfzXQaIwmd497OVRK17SbquYxFiyrwDiFgAdof7T4UoFTNA1l3dnU2rbrUP
	0Qz44nFOlg+1fLw2OhMfDnrimY2ZPo0sDDrulV/O/jmsv36l/rsAHkQ8jQUbhyjhz+22
	PFTQ==
X-Gm-Message-State: AJcUukfTxnZbJtq4HvNtqB8ynkfM7qrvH1HcEcPtXDdMlTFdKnhGUndd
	C5n4mz80dyE8Xv1AzTtpmXWIt8ZsyC4=
X-Google-Smtp-Source: ALg8bN6Vt5OS7YaubYo+GQSX5lgHPQWs7oSy00R+rE4NEjJh4AvlKQMXWjUqMcH8ch4Q852/urOJ4A==
X-Received: by 2002:a9d:4682:: with SMTP id z2mr19056452ote.104.1546026851754; 
	Fri, 28 Dec 2018 11:54:11 -0800 (PST)
Received: from blackbox.Home ([200.68.140.47])
	by smtp.gmail.com with ESMTPSA id
	h25sm20637665otj.27.2018.12.28.11.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 11:54:11 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2018 13:54:08 -0600
Message-Id: <20181228195408.31875-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] dpkg: Upgrade to 1.18.25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2018 19:54:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed (now in upstream),

0001-arch-Add-support-for-riscv64-CPU.patch

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 ...001-arch-Add-support-for-riscv64-CPU.patch | 54 -------------------
 .../dpkg/{dpkg_1.18.24.bb => dpkg_1.18.25.bb} |  7 ++-
 2 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.24.bb => dpkg_1.18.25.bb} (74%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch
deleted file mode 100644
index 45c606e690..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 319f32d743f5b5e725012654d124e49226d5de91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Mar 2018 20:28:24 -0700
-Subject: [PATCH] arch: Add support for riscv64 CPU
-
-  * Architecture support:
-    - Add support for riscv64 CPU. Closes: #822914
-      Thanks to Manuel A. Fernandez Montecelo <mafm@debian.org>
-
-Upstream-Status: Backport [https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=dpkg%2Fdpkg.git;a=commitdiff_plain;h=ee0855cc66076691de4796be48f8a0d889fde001;hp=2f5816d8be40b449d2473b22f9e0c33b32f3bd78]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- data/cputable         | 1 +
- scripts/t/Dpkg_Arch.t | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/data/cputable b/data/cputable
-index a2bd7d6..9f2a8e0 100644
---- a/data/cputable
-+++ b/data/cputable
-@@ -41,6 +41,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
- powerpcel	powerpcle	powerpcle		32	little
- ppc64		powerpc64	(powerpc|ppc)64		64	big
- ppc64el		powerpc64le	powerpc64le		64	little
-+riscv64		riscv64		riscv64			64	little
- s390		s390		s390			32	big
- s390x		s390x		s390x			64	big
- sh3		sh3		sh3			32	little
-diff --git a/scripts/t/Dpkg_Arch.t b/scripts/t/Dpkg_Arch.t
-index d478b49..ecd5d66 100644
---- a/scripts/t/Dpkg_Arch.t
-+++ b/scripts/t/Dpkg_Arch.t
-@@ -16,7 +16,7 @@
- use strict;
- use warnings;
- 
--use Test::More tests => 16367;
-+use Test::More tests => 16832;
- 
- use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_multiarch
-                         debarch_eq debarch_is debarch_is_wildcard
-@@ -162,7 +162,7 @@ is(gnutriplet_to_debarch(undef), undef, 'undef gnutriplet');
- is(gnutriplet_to_debarch('unknown-unknown-unknown'), undef, 'unknown gnutriplet');
- is(gnutriplet_to_debarch('x86_64-linux-gnu'), 'amd64', 'known gnutriplet');
- 
--is(scalar get_valid_arches(), 524, 'expected amount of known architectures');
-+is(scalar get_valid_arches(), 539, 'expected amount of known architectures');
- 
- {
-     local $ENV{CC} = 'false';
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.25.bb
similarity index 74%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.25.bb
index 6d8ec34768..350bd94f54 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.25.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20170518T093838Z/pool/main/d/dpkg/dpkg_1.18.24.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20181228T152949Z/pool/main/d/dpkg/dpkg_1.18.25.tar.xz \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -14,9 +14,8 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20170518T093838Z/pool/main/
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
-           file://0001-arch-Add-support-for-riscv64-CPU.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
-SRC_URI[md5sum] = "02e8af8faf1e689228da806c3e8c6882"
-SRC_URI[sha256sum] = "d853081d3e06bfd46a227056e591f094e42e78fa8a5793b0093bad30b710d7b4"
+SRC_URI[md5sum] = "e463f58b04acb23659df23d2a7a05cff"
+SRC_URI[sha256sum] = "c49c371953aea03f543814dcae37c069e86069333fb2e24e9252e76647663492"
-- 
2.19.2


