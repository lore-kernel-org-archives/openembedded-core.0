Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1727C021BC
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8094.1739623333240363604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rilxeret;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zIBLKRNI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a17a8d-2c6ce319-252b-4e5a-bce9-980955b1f285-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jjo1WbN4bK9ATVopWOlD4Z3IvlrCNhwwsFk8hp8dVKI=;
	b=RilxeretWWFdwyflQ0vWp/S1pGkgXrKzks9A31P/ygaxMIMpsmtnrR5QEE0kKNoe
	h2oefFZMCEhoi8bS3vTuPfxFoBOdVSbLceqqRueW4OnBoiS8MEmNfEnGl4yac9o9kad
	mvbWTYi+dI/RQhbVwRBt3pw2ROTex6wp8QSmMqGI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jjo1WbN4bK9ATVopWOlD4Z3IvlrCNhwwsFk8hp8dVKI=;
	b=zIBLKRNIotbAR2H3zCnr5MXWrPKJthVDMxXSWXtbNo73KsjCvImFsUCf/U/eRml1
	xXaLKQQ4KpZCjODRCuDoHzwPi+Re3zA6LKWN80kBmJCs7TXPsN9DXPC9CSeFeTE6CzN
	tMG8/3jYmizg6UHMMLuSw5mEESkeCNZUFmP8ZUeg=
Content-Type: multipart/mixed; boundary="===============8041484357943690366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssl: upgrading to 3.4.1 SUCCEEDED
Message-ID: <0101019509a17a8d-2c6ce319-252b-4e5a-bce9-980955b1f285-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211409

--===============8041484357943690366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *3.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssl-upgrade-3.4.0-3.4.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2f206ef94fb6c66c06c0fe474a469af40097c64e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:44:18 +0000
Subject: [PATCH] openssl: upgrade 3.4.0 -> 3.4.1

---
 ...ke-history-reporting-when-test-fails.patch |  7 +--
 ...1-Configure-do-not-tweak-mips-cflags.patch |  2 +-
 ...001-Fix-builds-on-riscv64-using-musl.patch | 36 -------------
 ...sysroot-and-debug-prefix-map-from-co.patch | 19 ++++---
 .../openssl/openssl/aarch64-regs.patch        | 52 -------------------
 .../{openssl_3.4.0.bb => openssl_3.4.1.bb}    |  5 +-
 6 files changed, 14 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.4.0.bb => openssl_3.4.1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index 31bbbd8679..40613d6091 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -1,4 +1,4 @@
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From bb9dab8736baf9187ec11317c5105483ab16de83 Mon Sep 17 00:00:00 2001
 From: William Lyu <William.Lyu@windriver.com>
 Date: Fri, 20 Oct 2023 16:22:37 -0400
 Subject: [PATCH] Added handshake history reporting when test fails
@@ -361,7 +361,4 @@ index ea60851..9d6b093 100644
 +
      return ret;
  }
-
---
-2.25.1
-
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index c7e9c9d96e..98531ad70b 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -1,4 +1,4 @@
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
+From b7291e054527fede0be8428093e2b88fbe3c9754 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
deleted file mode 100644
index 0ec8c93748..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9131291716073c4ea65a29575880a9d796c22ed6 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Wed, 23 Oct 2024 14:57:20 +0100
-Subject: [PATCH] Fix builds on riscv64 using musl
-
-Some environments using musl are reported to have the hwprobe.h include
-file but not have the __NR_riscv_hwprobe define.
-
-Fixes #25772
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/pull/25787]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/crypto/riscv_arch.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/include/crypto/riscv_arch.h b/include/crypto/riscv_arch.h
-index 4b3573f..8858427 100644
---- a/include/crypto/riscv_arch.h
-+++ b/include/crypto/riscv_arch.h
-@@ -15,7 +15,14 @@
- 
- # if defined(OPENSSL_SYS_LINUX) && !defined(FIPS_MODULE)
- #  if __has_include(<asm/hwprobe.h>)
--#   define OSSL_RISCV_HWPROBE
-+#   include <sys/syscall.h>
-+#   /*
-+     * Some environments using musl are reported to have the hwprobe.h include
-+     * file but not have the __NR_riscv_hwprobe define.
-+     */
-+#   ifdef __NR_riscv_hwprobe
-+#    define OSSL_RISCV_HWPROBE
-+#   endif
- #  endif
- # endif
- 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index b8672735ab..5acb6aea57 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
+From 5e12191905828c7ea6c12347355b5899c5e03dcd Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
@@ -28,16 +28,15 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  Configurations/unix-Makefile.tmpl | 12 +++++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 12 insertions(+), 2 deletions(-)
 
-Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
-===================================================================
---- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
-+++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 09303c4..66f3993 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
 @@ -502,13 +502,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
@@ -63,10 +62,10 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-Index: openssl-3.0.4/crypto/build.info
-===================================================================
---- openssl-3.0.4.orig/crypto/build.info
-+++ openssl-3.0.4/crypto/build.info
+diff --git a/crypto/build.info b/crypto/build.info
+index 2642d30..4dd649c 100644
+--- a/crypto/build.info
++++ b/crypto/build.info
 @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch b/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
deleted file mode 100644
index f9773a6183..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 3ad2277e4522d363ae31a1888531915bb68964dc Mon Sep 17 00:00:00 2001
-From: Julian Andres Klode <julian.klode@canonical.com>
-Date: Sat, 18 Jan 2025 21:12:45 +0100
-Subject: [PATCH] Restore correct registers in aarch64 AES-CTR code
-
-Commit 1d1ca79fe35dbe5c05faed5a2ef8c4de9c5adc49 introduced
-save and restore for the registers, saving them as
-
-	stp		d8,d9,[sp, #16]
-	stp		d10,d11,[sp, #32]
-	stp		d12,d13,[sp, #48]
-	stp		d14,d15,[sp, #64]
-
-But the restore code was inadvertently typoed:
-
-	ldp		d8,d9,[sp, #16]
-	ldp		d10,d11,[sp, #32]
-	ldp		d12,d13,[sp, #48]
-	ldp		d15,d16,[sp, #64]
-
-Restoring [sp, #64] into d15,d16 instead of d14,d15.
-
-Fixes: #26466
-
-CLA: trivial
-
-Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/26469)
-
-(cherry picked from commit 5261f3ca41cda7ad5767e399e9a2dc008bbad5d6)
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- crypto/aes/asm/aesv8-armx.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/aes/asm/aesv8-armx.pl b/crypto/aes/asm/aesv8-armx.pl
-index 33a2dd53dae19..dc019b04ccd25 100755
---- a/crypto/aes/asm/aesv8-armx.pl
-+++ b/crypto/aes/asm/aesv8-armx.pl
-@@ -2493,7 +2493,7 @@ ()
- 	ldp		d8,d9,[sp, #16]
- 	ldp		d10,d11,[sp, #32]
- 	ldp		d12,d13,[sp, #48]
--	ldp		d15,d16,[sp, #64]
-+	ldp		d14,d15,[sp, #64]
- 	ldr		x29,[sp],#80
- 	ret
- .size	${prefix}_ctr32_encrypt_blocks_unroll12_eor3,.-${prefix}_ctr32_encrypt_blocks_unroll12_eor3
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.4.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.4.1.bb
index cc413e39ba..7502407949 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
@@ -12,15 +12,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://0001-Fix-builds-on-riscv64-using-musl.patch \
-           file://aarch64-regs.patch \
+           file://environment.d-openssl.sh \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "e15dda82fe2fe8139dc2ac21a36d4ca01d5313c75f99f46c4e8a27709b7294bf"
+SRC_URI[sha256sum] = "002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.44.1


--===============8041484357943690366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssl: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl: SRC_URI changed from "http://www.openssl.org/source/openssl-3.4.0.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch file://0001-Fix-builds-on-riscv64-using-musl.patch file://aarch64-regs.patch" to "http://www.openssl.org/source/openssl-3.4.1.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch file://environment.d-openssl.sh"
packages/core2-64-poky-linux/openssl: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/libcrypto: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/libcrypto: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/libssl: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/libssl: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-bin: PKGSIZE changed from 1062464 to 1066560 (+0%)
packages/core2-64-poky-linux/openssl/openssl-bin: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-bin: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-conf: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-conf: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-dbg: PKGSIZE changed from 18963536 to 18970976 (+0%)
packages/core2-64-poky-linux/openssl/openssl-dbg: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-dbg: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-dev: PKGSIZE changed from 2090712 to 2090792 (+0%)
packages/core2-64-poky-linux/openssl/openssl-dev: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-dev: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-doc: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-doc: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-engines: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-engines: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-locale: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-locale: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-misc: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-misc: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-ossl-module-legacy: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-ossl-module-legacy: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 553609039 to 553639886 (+0%)
packages/core2-64-poky-linux/openssl/openssl-ptest: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-ptest: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-ptest: FILELIST: removed "/usr/lib/openssl/ptest/test/recipes/95-test_external_oqsprovider_data/oqsprovider-externalinterop.sh", added "/usr/lib/openssl/ptest/test/nocache-and-default.cnf /usr/lib/openssl/ptest/test/recipes/20-test_nocache.t /usr/lib/openssl/ptest/test/recipes/95-test_external_oqsprovider_data/oqsprovider-pkcs12gen.sh /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/nomac_parse.p12"
packages/core2-64-poky-linux/openssl/openssl-src: PKGSIZE changed from 24755676 to 24777010 (+0%)
packages/core2-64-poky-linux/openssl/openssl-src: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-src: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl-staticdev: PKGSIZE changed from 34656452 to 34661872 (+0%)
packages/core2-64-poky-linux/openssl/openssl-staticdev: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl-staticdev: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-64-poky-linux/openssl/openssl: PV changed from "3.4.0" to "3.4.1"
packages/core2-64-poky-linux/openssl/openssl: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed

--===============8041484357943690366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/openssl/openssl-ptest: FILELIST: removed "/usr/lib/openssl/ptest/test/recipes/95-test_external_oqsprovider_data/oqsprovider-externalinterop.sh", added "/usr/lib/openssl/ptest/test/recipes/20-test_nocache.t /usr/lib/openssl/ptest/test/recipes/95-test_external_oqsprovider_data/oqsprovider-pkcs12gen.sh /usr/lib/openssl/ptest/test/nocache-and-default.cnf /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/nomac_parse.p12"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-clang/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed

--===============8041484357943690366==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssl-upgrade-3.4.0-3.4.1.patch"

RnJvbSAyZjIwNmVmOTRmYjZjNjZjMDZjMGZlNDc0YTQ2OWFmNDAwOTdjNjRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6NDQ6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NsOiB1cGdyYWRlIDMuNC4wIC0+IDMuNC4xCgotLS0KIC4uLmtlLWhpc3RvcnktcmVwb3J0
aW5nLXdoZW4tdGVzdC1mYWlscy5wYXRjaCB8ICA3ICstLQogLi4uMS1Db25maWd1cmUtZG8tbm90
LXR3ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoIHwgIDIgKy0KIC4uLjAwMS1GaXgtYnVpbGRzLW9uLXJp
c2N2NjQtdXNpbmctbXVzbC5wYXRjaCB8IDM2IC0tLS0tLS0tLS0tLS0KIC4uLnN5c3Jvb3QtYW5k
LWRlYnVnLXByZWZpeC1tYXAtZnJvbS1jby5wYXRjaCB8IDE5ICsrKystLS0KIC4uLi9vcGVuc3Ns
L29wZW5zc2wvYWFyY2g2NC1yZWdzLnBhdGNoICAgICAgICB8IDUyIC0tLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLi97b3BlbnNzbF8zLjQuMC5iYiA9PiBvcGVuc3NsXzMuNC4xLmJifSAgICB8ICA1ICst
CiA2IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEwNyBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNz
bC8wMDAxLUZpeC1idWlsZHMtb24tcmlzY3Y2NC11c2luZy1tdXNsLnBhdGNoCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvYWFyY2g2
NC1yZWdzLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL3tv
cGVuc3NsXzMuNC4wLmJiID0+IG9wZW5zc2xfMy40LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1BZGRlZC1oYW5k
c2hha2UtaGlzdG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1BZGRlZC1oYW5kc2hha2UtaGlz
dG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoCmluZGV4IDMxYmJiZDg2NzkuLjQw
NjEzZDYwOTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9v
cGVuc3NsLzAwMDEtQWRkZWQtaGFuZHNoYWtlLWhpc3RvcnktcmVwb3J0aW5nLXdoZW4tdGVzdC1m
YWlscy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNz
bC8wMDAxLUFkZGVkLWhhbmRzaGFrZS1oaXN0b3J5LXJlcG9ydGluZy13aGVuLXRlc3QtZmFpbHMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDViYTY1MDUxZmVhMDUxM2RiMGQ5OTdmMGFiN2Nh
ZmI5ODI2ZWQ3NGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJiOWRhYjg3MzZiYWY5
MTg3ZWMxMTMxN2M1MTA1NDgzYWIxNmRlODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBXaWxsaWFtIEx5dSA8V2lsbGlhbS5MeXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjAg
T2N0IDIwMjMgMTY6MjI6MzcgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkZWQgaGFuZHNoYWtl
IGhpc3RvcnkgcmVwb3J0aW5nIHdoZW4gdGVzdCBmYWlscwpAQCAtMzYxLDcgKzM2MSw0IEBAIGlu
ZGV4IGVhNjA4NTEuLjlkNmIwOTMgMTAwNjQ0CiArCiAgICAgIHJldHVybiByZXQ7CiAgfQotCi0t
LQotMi4yNS4xCi0KKyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsLzAwMDEtQ29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtQ29uZmln
dXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRjaAppbmRleCBjN2U5YzlkOTZlLi45ODUz
MWFkNzBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbC8wMDAxLUNvbmZpZ3VyZS1kby1ub3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1Db25maWd1cmUt
ZG8tbm90LXR3ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzc3
ZjBkNWI1YzEwNzllM2I5YTgwODgxZjRkY2M4OTFjYmU5ZjlhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBiNzI5MWUwNTQ1MjdmZWRlMGJlODQyODA5M2UyYjg4ZmJlM2M5NzU0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KIERhdGU6IFR1ZSwgMzAgTWF5IDIwMjMgMDk6MTE6MjcgLTA3MDAKIFN1YmplY3Q6
IFtQQVRDSF0gQ29uZmlndXJlOiBkbyBub3QgdHdlYWsgbWlwcyBjZmxhZ3MKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtRml4LWJ1aWxk
cy1vbi1yaXNjdjY0LXVzaW5nLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2wvb3BlbnNzbC8wMDAxLUZpeC1idWlsZHMtb24tcmlzY3Y2NC11c2luZy1tdXNsLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwZWM4YzkzNzQ4Li4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtRml4
LWJ1aWxkcy1vbi1yaXNjdjY0LXVzaW5nLW11c2wucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwz
NiArMCwwIEBACi1Gcm9tIDkxMzEyOTE3MTYwNzNjNGVhNjVhMjk1NzU4ODBhOWQ3OTZjMjJlZDYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNYXR0IENhc3dlbGwgPG1hdHRAb3BlbnNz
bC5vcmc+Ci1EYXRlOiBXZWQsIDIzIE9jdCAyMDI0IDE0OjU3OjIwICswMTAwCi1TdWJqZWN0OiBb
UEFUQ0hdIEZpeCBidWlsZHMgb24gcmlzY3Y2NCB1c2luZyBtdXNsCi0KLVNvbWUgZW52aXJvbm1l
bnRzIHVzaW5nIG11c2wgYXJlIHJlcG9ydGVkIHRvIGhhdmUgdGhlIGh3cHJvYmUuaCBpbmNsdWRl
Ci1maWxlIGJ1dCBub3QgaGF2ZSB0aGUgX19OUl9yaXNjdl9od3Byb2JlIGRlZmluZS4KLQotRml4
ZXMgIzI1NzcyCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuc3NsL29wZW5zc2wvcHVsbC8yNTc4N10KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBpbmNsdWRlL2NyeXB0by9yaXNjdl9hcmNoLmggfCA5
ICsrKysrKysrLQotIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKLQotZGlmZiAtLWdpdCBhL2luY2x1ZGUvY3J5cHRvL3Jpc2N2X2FyY2guaCBiL2luY2x1ZGUv
Y3J5cHRvL3Jpc2N2X2FyY2guaAotaW5kZXggNGIzNTczZi4uODg1ODQyNyAxMDA2NDQKLS0tLSBh
L2luY2x1ZGUvY3J5cHRvL3Jpc2N2X2FyY2guaAotKysrIGIvaW5jbHVkZS9jcnlwdG8vcmlzY3Zf
YXJjaC5oCi1AQCAtMTUsNyArMTUsMTQgQEAKLSAKLSAjIGlmIGRlZmluZWQoT1BFTlNTTF9TWVNf
TElOVVgpICYmICFkZWZpbmVkKEZJUFNfTU9EVUxFKQotICMgIGlmIF9faGFzX2luY2x1ZGUoPGFz
bS9od3Byb2JlLmg+KQotLSMgICBkZWZpbmUgT1NTTF9SSVNDVl9IV1BST0JFCi0rIyAgIGluY2x1
ZGUgPHN5cy9zeXNjYWxsLmg+Ci0rIyAgIC8qCi0rICAgICAqIFNvbWUgZW52aXJvbm1lbnRzIHVz
aW5nIG11c2wgYXJlIHJlcG9ydGVkIHRvIGhhdmUgdGhlIGh3cHJvYmUuaCBpbmNsdWRlCi0rICAg
ICAqIGZpbGUgYnV0IG5vdCBoYXZlIHRoZSBfX05SX3Jpc2N2X2h3cHJvYmUgZGVmaW5lLgotKyAg
ICAgKi8KLSsjICAgaWZkZWYgX19OUl9yaXNjdl9od3Byb2JlCi0rIyAgICBkZWZpbmUgT1NTTF9S
SVNDVl9IV1BST0JFCi0rIyAgIGVuZGlmCi0gIyAgZW5kaWYKLSAjIGVuZGlmCi0gCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLWJ1aWxk
aW5mby1zdHJpcC1zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLWJ1aWxkaW5mby1z
dHJpcC1zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0Y2gKaW5kZXggYjg2
NzI3MzVhYi4uNWFjYjZhZWE1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1idWlsZGluZm8tc3RyaXAtc3lzcm9vdC1hbmQtZGVidWct
cHJlZml4LW1hcC1mcm9tLWNvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzbC9vcGVuc3NsLzAwMDEtYnVpbGRpbmZvLXN0cmlwLXN5c3Jvb3QtYW5kLWRlYnVnLXBy
ZWZpeC1tYXAtZnJvbS1jby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTk4NTI1M2YyYzkw
MjVkN2MxMjc0NDNhM2E5OTM4OTQ2ZjgwYzJhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNWUxMjE5MTkwNTgyOGM3ZWE2YzEyMzQ3MzU1YjU4OTljNWUwM2RjZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9QjhsbD89IDxt
YXJ0aW5AZ2Vhbml4LmNvbT4KIERhdGU6IFR1ZSwgNiBOb3YgMjAxOCAxNDo1MDo0NyArMDEwMAog
U3ViamVjdDogW1BBVENIXSBidWlsZGluZm86IHN0cmlwIHN5c3Jvb3QgYW5kIGRlYnVnLXByZWZp
eC1tYXAgZnJvbSBjb21waWxlcgpAQCAtMjgsMTYgKzI4LDE1IEBAIFNpZ25lZC1vZmYtYnk6IEth
aSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogVXBkYXRlIHRvIGZpeCBidWlsZHBhdGhz
IHFhIGlzc3VlIGZvciAnLWZmaWxlLXByZWZpeC1tYXAnLgogCiBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotCiAtLS0KICBDb25maWd1cmF0aW9ucy91bml4LU1h
a2VmaWxlLnRtcGwgfCAxMiArKysrKysrKysrKy0KICBjcnlwdG8vYnVpbGQuaW5mbyAgICAgICAg
ICAgICAgICAgfCAgMiArLQogIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKIAotSW5kZXg6IG9wZW5zc2wtMy4wLjQvQ29uZmlndXJhdGlvbnMvdW5peC1N
YWtlZmlsZS50bXBsCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gb3BlbnNzbC0zLjAuNC5vcmlnL0NvbmZpZ3Vy
YXRpb25zL3VuaXgtTWFrZWZpbGUudG1wbAotKysrIG9wZW5zc2wtMy4wLjQvQ29uZmlndXJhdGlv
bnMvdW5peC1NYWtlZmlsZS50bXBsCitkaWZmIC0tZ2l0IGEvQ29uZmlndXJhdGlvbnMvdW5peC1N
YWtlZmlsZS50bXBsIGIvQ29uZmlndXJhdGlvbnMvdW5peC1NYWtlZmlsZS50bXBsCitpbmRleCAw
OTMwM2M0Li42NmYzOTkzIDEwMDY0NAorLS0tIGEvQ29uZmlndXJhdGlvbnMvdW5peC1NYWtlZmls
ZS50bXBsCisrKysgYi9Db25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwKIEBAIC01MDIs
MTMgKzUwMiwyMyBAQCBCSU5fTERGTEFHUz17LSBqb2luKCcgJywgJHRhcmdldHtiaW5fbGZsYWdz
fSB8fCAoKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgJyQoQ05GX0xERkxBR1MpJywgJyQo
TERGTEFHUyknKSAtfQogIEJJTl9FWF9MSUJTPSQoQ05GX0VYX0xJQlMpICQoRVhfTElCUykKQEAg
LTYzLDEwICs2MiwxMCBAQCBJbmRleDogb3BlbnNzbC0zLjAuNC9Db25maWd1cmF0aW9ucy91bml4
LU1ha2VmaWxlLnRtcGwKICBQRVJMQVNNX1NDSEVNRT0gey0gJHRhcmdldHtwZXJsYXNtX3NjaGVt
ZX0gLX0KICAKICAjIEZvciB4ODYgYXNzZW1ibGVyOiBTZXQgUFJPQ0VTU09SIHRvIDM4NiBpZiB5
b3Ugd2FudCB0byBzdXBwb3J0Ci1JbmRleDogb3BlbnNzbC0zLjAuNC9jcnlwdG8vYnVpbGQuaW5m
bwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQotLS0tIG9wZW5zc2wtMy4wLjQub3JpZy9jcnlwdG8vYnVpbGQuaW5mbwot
KysrIG9wZW5zc2wtMy4wLjQvY3J5cHRvL2J1aWxkLmluZm8KK2RpZmYgLS1naXQgYS9jcnlwdG8v
YnVpbGQuaW5mbyBiL2NyeXB0by9idWlsZC5pbmZvCitpbmRleCAyNjQyZDMwLi40ZGQ2NDljIDEw
MDY0NAorLS0tIGEvY3J5cHRvL2J1aWxkLmluZm8KKysrKyBiL2NyeXB0by9idWlsZC5pbmZvCiBA
QCAtMTE1LDcgKzExNSw3IEBAIERFRklORVsuLi9saWJjcnlwdG9dPSRVUExJTktERUYKICAKICBE
RVBFTkRbaW5mby5vXT1idWlsZGluZi5oCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2wvb3BlbnNzbC9hYXJjaDY0LXJlZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC9hYXJjaDY0LXJlZ3MucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IGY5NzczYTYxODMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvYWFyY2g2NC1yZWdzLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsNTIgKzAsMCBAQAotRnJvbSAzYWQyMjc3ZTQ1MjJkMzYzYWUzMWEx
ODg4NTMxOTE1YmI2ODk2NGRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogSnVsaWFu
IEFuZHJlcyBLbG9kZSA8anVsaWFuLmtsb2RlQGNhbm9uaWNhbC5jb20+Ci1EYXRlOiBTYXQsIDE4
IEphbiAyMDI1IDIxOjEyOjQ1ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIFJlc3RvcmUgY29ycmVj
dCByZWdpc3RlcnMgaW4gYWFyY2g2NCBBRVMtQ1RSIGNvZGUKLQotQ29tbWl0IDFkMWNhNzlmZTM1
ZGJlNWMwNWZhZWQ1YTJlZjhjNGRlOWM1YWRjNDkgaW50cm9kdWNlZAotc2F2ZSBhbmQgcmVzdG9y
ZSBmb3IgdGhlIHJlZ2lzdGVycywgc2F2aW5nIHRoZW0gYXMKLQotCXN0cAkJZDgsZDksW3NwLCAj
MTZdCi0Jc3RwCQlkMTAsZDExLFtzcCwgIzMyXQotCXN0cAkJZDEyLGQxMyxbc3AsICM0OF0KLQlz
dHAJCWQxNCxkMTUsW3NwLCAjNjRdCi0KLUJ1dCB0aGUgcmVzdG9yZSBjb2RlIHdhcyBpbmFkdmVy
dGVudGx5IHR5cG9lZDoKLQotCWxkcAkJZDgsZDksW3NwLCAjMTZdCi0JbGRwCQlkMTAsZDExLFtz
cCwgIzMyXQotCWxkcAkJZDEyLGQxMyxbc3AsICM0OF0KLQlsZHAJCWQxNSxkMTYsW3NwLCAjNjRd
Ci0KLVJlc3RvcmluZyBbc3AsICM2NF0gaW50byBkMTUsZDE2IGluc3RlYWQgb2YgZDE0LGQxNS4K
LQotRml4ZXM6ICMyNjQ2NgotCi1DTEE6IHRyaXZpYWwKLQotUmV2aWV3ZWQtYnk6IEt1cnQgUm9l
Y2t4IDxrdXJ0QHJvZWNreC5iZT4KLVJldmlld2VkLWJ5OiBQYXVsIERhbGUgPHBwemdzMUBnbWFp
bC5jb20+Ci1SZXZpZXdlZC1ieTogVG9tYXMgTXJheiA8dG9tYXNAb3BlbnNzbC5vcmc+Ci0oTWVy
Z2VkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9wdWxsLzI2NDY5KQot
Ci0oY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCA1MjYxZjNjYTQxY2RhN2FkNTc2N2UzOTllOWEy
ZGMwMDhiYmFkNWQ2KQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGNyeXB0by9hZXMvYXNt
L2Flc3Y4LWFybXgucGwgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9jcnlwdG8vYWVzL2FzbS9hZXN2OC1hcm14LnBs
IGIvY3J5cHRvL2Flcy9hc20vYWVzdjgtYXJteC5wbAotaW5kZXggMzNhMmRkNTNkYWUxOS4uZGMw
MTliMDRjY2QyNSAxMDA3NTUKLS0tLSBhL2NyeXB0by9hZXMvYXNtL2Flc3Y4LWFybXgucGwKLSsr
KyBiL2NyeXB0by9hZXMvYXNtL2Flc3Y4LWFybXgucGwKLUBAIC0yNDkzLDcgKzI0OTMsNyBAQCAo
KQotIAlsZHAJCWQ4LGQ5LFtzcCwgIzE2XQotIAlsZHAJCWQxMCxkMTEsW3NwLCAjMzJdCi0gCWxk
cAkJZDEyLGQxMyxbc3AsICM0OF0KLS0JbGRwCQlkMTUsZDE2LFtzcCwgIzY0XQotKwlsZHAJCWQx
NCxkMTUsW3NwLCAjNjRdCi0gCWxkcgkJeDI5LFtzcF0sIzgwCi0gCXJldAotIC5zaXplCSR7cHJl
Zml4fV9jdHIzMl9lbmNyeXB0X2Jsb2Nrc191bnJvbGwxMl9lb3IzLC4tJHtwcmVmaXh9X2N0cjMy
X2VuY3J5cHRfYmxvY2tzX3Vucm9sbDEyX2VvcjMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy40LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy40LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMu
NC4xLmJiCmluZGV4IGNjNDEzZTM5YmEuLjc1MDI0MDc5NDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNC4wLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNC4xLmJiCkBAIC0xMiwxNSArMTIs
MTQgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm9wZW5zc2wub3JnL3NvdXJjZS9vcGVuc3NsLSR7
UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWJ1aWxkaW5mby1zdHJpcC1zeXNy
b290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1Db25maWd1cmUtZG8tbm90LXR3ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtQWRkZWQtaGFuZHNoYWtlLWhpc3RvcnktcmVwb3J0aW5nLXdoZW4t
dGVzdC1mYWlscy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1idWlsZHMtb24t
cmlzY3Y2NC11c2luZy1tdXNsLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL2FhcmNoNjQtcmVn
cy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLW9wZW5zc2wuc2ggXAog
ICAgICAgICAgICAiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAg
ICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1vcGVuc3NsLnNoIFwKICAgICAgICAgICAgIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTE1ZGRhODJmZTJmZTgxMzlkYzJhYzIxYTM2ZDRjYTAx
ZDUzMTNjNzVmOTlmNDZjNGU4YTI3NzA5YjcyOTRiZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
MDJhMmQ2YjMwYjU4YmY0YmVhNDZjNDNiZGQ5NjM2NWFhZjhkYWE2YzQyODc4MmFhNGZlZWUwNmRh
MTk3ZGYzIgogCiBpbmhlcml0IGxpYl9wYWNrYWdlIG11bHRpbGliX2hlYWRlciBtdWx0aWxpYl9z
Y3JpcHQgcHRlc3QgcGVybG5hdGl2ZSBtYW5wYWdlcwogTVVMVElMSUJfU0NSSVBUUyA9ICIke1BO
fS1iaW46JHtiaW5kaXJ9L2NfcmVoYXNoIgotLSAKMi40NC4xCgo=

--===============8041484357943690366==--

