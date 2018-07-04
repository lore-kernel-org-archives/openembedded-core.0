Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2714078A29
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 09:24:04 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id f16-v6so4589911wrm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 02:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=jfve/YKyrj4vwHYPms9gWIrsu6RfQa12qKj/swpiQq0=;
	b=IpQO4ck7KIGkUrt0os+CHeoqZmWAHTKLuHV5zUpJaeX/HDV+0eO9LiEHXsHDO7EfbK
	txI0RzUicLTvdNAVOxny9PxcePpQ2NtMFlGHvfdmIuQFwGBiKx8OFTg9J8/pVpGwGpiL
	aPmc+ykX0ON/G4TGTkqstH9gh1f5jNnNqXrNAUCcvmFNTcXQrdYOR2KY3YzAJBc+VEJ+
	9F/XMbAbPhqg7FxmhXG83mJhi4zHm9YbfBs0yNDON7G+QryV+Z0cHspbZYRuZqYf9Sex
	cwcM+8RIZCXjJr71aTRFZ7EzP+lrn213hjH0DE1schRATQ6MFlXlugsYWvHF+3IYBxxN
	GWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jfve/YKyrj4vwHYPms9gWIrsu6RfQa12qKj/swpiQq0=;
	b=AXx2EtD9M73sEOdO/xHuAjzpUupcR7mawPrYAHlKVvhlU2mf36w17QFZux8Fx354SM
	WeYhVzJyBIVIaL8i7L1LN8XoiX032JpOO+4zFvMZmty8LW8GDxxc2gmoWv17M/HZH8ri
	0A9SEpc6FecL1W11esftijnrioQ/IXCVJ96p1MgZpawe55HAVKghMKFS1lmpBzkOn2UY
	Ul/IkIObM2zGJJNetoZgTDIiGAF8R3LPHxnwygScIRgwj9B64fr5Ql9WJqe+BHPDqsZn
	E9aQxungTjSBBeCC/o962JpZVifqRihKMKa2n3oKJra2CQRwgXRjoBg+ULlG6Dj7NpLV
	/T+w==
X-Gm-Message-State: APt69E2ODdZvqrrEADP2GqS0rZlcRm7OFoIsXiaJnlN4bAe009hgXO09
	NJVFyqwPWj8EAxdcOPPrbHuuvyyM
X-Google-Smtp-Source: AAOMgpdIi0aK47KxDB0fIvUO5knZY/M3YbGz8X494lCR0Fwaaxis8ebwAahouxyOvJlZ6mpdW5k/YQ==
X-Received: by 2002:adf:fe46:: with SMTP id m6-v6mr945314wrs.171.1530696244207;
	Wed, 04 Jul 2018 02:24:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c7-v6sm6210391wre.73.2018.07.04.02.24.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 02:24:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 10:24:01 +0100
Message-Id: <20180704092401.3972-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] elfutils: add missing Upstream-Status, drop two Debian-specific patches
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
X-List-Received-Date: Wed, 04 Jul 2018 09:24:04 -0000

In the upgrade a large number of Upstream-Status tags were dropped, so add them
back.  I'm taking the stand that copying a patch Debian is carrying doesn't
count as a backport.

Also remove two Debian-specific patches (one for Hurd, one for kfreebsd) so
we're not carrying useless patches.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.172.bb        |  2 --
 .../0001-libasm-may-link-with-libbz2-if-found.patch     |  1 +
 ...e-differences-between-mips-machine-identifiers.patch |  3 +++
 .../elfutils/files/debian/0001-arm_backend.patch        |  2 +-
 .../elfutils/files/debian/0001-disable_werror.patch     |  2 +-
 .../elfutils/files/debian/0001-fix-gcc7-ftbfs.patch     |  2 +-
 .../elfutils/files/debian/0001-hppa_backend.patch       |  2 +-
 .../elfutils/files/debian/0001-mips_backend.patch       |  2 +-
 .../elfutils/files/debian/0001-mips_readelf_w.patch     |  2 +-
 .../files/debian/0001-testsuite-ignore-elflint.patch    |  2 +-
 ...2-Add-support-for-mips64-abis-in-mips_retval.c.patch |  3 +++
 .../0003-Add-mips-n64-relocation-format-hack.patch      |  3 +++
 .../elfutils/files/debian/hurd_path.patch               | 14 --------------
 .../elfutils/files/debian/ignore_strmerge.diff          |  3 +++
 .../elfutils/files/debian/kfreebsd_path.patch           | 17 -----------------
 15 files changed, 20 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.172.bb b/meta/recipes-devtools/elfutils/elfutils_0.172.bb
index 04f6709d5a4..9d02211d497 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.172.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.172.bb
@@ -21,11 +21,9 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/0001-mips_backend.patch \
            file://debian/0001-testsuite-ignore-elflint.patch \
            file://debian/0001-mips_readelf_w.patch \
-           file://debian/kfreebsd_path.patch \
            file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
            file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
            file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
-           file://debian/hurd_path.patch \
            file://debian/ignore_strmerge.diff \
            file://debian/0001-fix-gcc7-ftbfs.patch \
            file://debian/0001-disable_werror.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index a8e9e50d15c..c342053aace 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -9,6 +9,7 @@ where indirect libraries may be not found by linker
 | /mnt/a/oe/build/tmp/work/riscv64-bec-linux/elfutils/0.170-r0/recipe-sysroot/usr/lib/libbz2.so.1: error adding symbols: DSO missing from command line
 | collect2: error: ld returned 1 exit status
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/Makefile.am | 4 ++--
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
index a9a72100317..8c48f4d1b18 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 From 77cb4a53c270d5854d3af24f19547bc3de825233 Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:16:58 +0000
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch b/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
index 540ba95e0e3..4ed81194b35 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 29 Jun 2018 15:42:39 +0800
 Subject: [PATCH] arm_backend
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 arm_backend.diff and rebase to 0.172
 
 http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch b/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
index 66de238418a..0f32b8742c1 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
@@ -8,7 +8,7 @@ Last-Update: 2018-01-01
 
 Signed-off-by: Helmut Grohne <helmut@subdivi.de>
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 mdisable_werror.patc and rebase to 0.172
 
 http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch b/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
index 226ec7f5301..26869a3a7dd 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 29 Jun 2018 15:59:57 +0800
 Subject: [PATCH] fix gcc7 ftbfs
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 fix-gcc7-ftbfs.diff and rebase to 0.172
 
 http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch b/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
index c0dbed798d3..2c5d4fa4ba7 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 29 Jun 2018 15:39:46 +0800
 Subject: [PATCH] hppa_backend
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 hppa_backend.diff and rebase to 0.172
 
 http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch b/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
index 3004e198281..d04da72cc5d 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 29 Jun 2018 15:45:58 +0800
 Subject: [PATCH] mips_backend
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 mips_backend.diff and rebase to 0.172
 
 http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch b/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
index 294944ea543..f3ab3da8d2a 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
@@ -11,7 +11,7 @@ to be filled in by the backend for the arch.
 
 Signed-off-by: Kurt Roeckx <kurt@roeckx.be>
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 mips_readelf_w.patch and rebase to 0.172
 
 http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch b/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
index 14f69093781..f4c6f40fc5e 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
@@ -9,7 +9,7 @@ binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
 So we run the tests on all archs to see what breaks, but if it breaks we ignore
 the result (exitcode 77 means: this test was skipped).
 
-Upstream-Status: Backport from debian
+Upstream-Status: Pending [from debian]
 testsuite-ignore-elflint.diff and rebase to 0.172
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
diff --git a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
index 72125c9ff06..4bdb1ff3cf5 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 From fdaab18a65ed2529656baa64cb6169f34d7e507b Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:17:01 +0000
diff --git a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
index 6c0ae37fea7..d27ce6dc9c4 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 From 59d4b8c48e5040af7e02b34eb26ea602ec82a38e Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:17:02 +0000
diff --git a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
deleted file mode 100644
index 4440e39e0ae..00000000000
--- a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: elfutils-0.165/tests/run-native-test.sh
-===================================================================
---- elfutils-0.165.orig/tests/run-native-test.sh
-+++ elfutils-0.165/tests/run-native-test.sh
-@@ -83,6 +83,9 @@ native_test()
- # "cannot attach to process: Function not implemented".
- [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
- 
-+# hurd's /proc/$PID/maps does not give paths yet.
-+[ "$(uname)" = "GNU" ] && exit 77
-+
- native_test ${abs_builddir}/allregs
- native_test ${abs_builddir}/funcretval
- 
diff --git a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
index 1e6d7a2de6b..55513eeddc4 100644
--- a/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
@@ -1,3 +1,6 @@
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 --- elfutils-0.165.orig/tests/run-strip-strmerge.sh
 +++ elfutils-0.165/tests/run-strip-strmerge.sh
 @@ -30,7 +30,7 @@ remerged=remerged.elf
diff --git a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
deleted file mode 100644
index 9a19b58b507..00000000000
--- a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Index: b/tests/run-native-test.sh
-===================================================================
---- a/tests/run-native-test.sh
-+++ b/tests/run-native-test.sh
-@@ -77,6 +77,12 @@ native_test()
-   test $native -eq 0 || testrun "$@" -p $native > /dev/null
- }
- 
-+# On the Debian buildds, GNU/kFreeBSD linprocfs /proc/$PID/maps does
-+# not give absolute paths due to sbuild's bind mounts (bug #570805)
-+# therefore the next two test programs are expected to fail with
-+# "cannot attach to process: Function not implemented".
-+[ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
-+
- native_test ${abs_builddir}/allregs
- native_test ${abs_builddir}/funcretval
- 
-- 
2.11.0


