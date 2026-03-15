Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A262EFCBD7
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28970.1773582115481695032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j7pcKOXZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hq1BX2oF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb6018-9035f5bf-273c-4ee1-a11b-6489b251f207-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lItia3qpsqH32iThFyf2DUU8GM3PNWZ0me3UwVBcqC0=;
	b=j7pcKOXZe5qXNsTZ+1kCEsk5jmP4wE29YD98EpHlHxjJJSy7KwGXOlgRrody+w5t
	K9lZ1NIeCbIIklJw4oXBOwaERG5/JNsogkjsxgHKAQfeRtdjNooHaheNIUvSm7VZkLV
	86bbhjxkC4s8UI5qdzab1lYQorjjzHqbjvlEONLE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lItia3qpsqH32iThFyf2DUU8GM3PNWZ0me3UwVBcqC0=;
	b=Hq1BX2oFLl5Cdgq05WkiArZzXxWxhjLGC22chORVMyU139Sh4JURfhTumi7ybUG/
	2wERW8m3Ui1tCxfpeQ1g7N1eKm8EaRw71gLd4A1kp+B5GD77aqg8TpCQNc/sR35LkFj
	CTOBlNxfeqg7GTgikNCJOWXbumTvyLvZNcPUU7o4=
Content-Type: multipart/mixed; boundary="===============3615764368538481601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.47.4 SUCCEEDED
Message-ID: <0101019cf1bb6018-9035f5bf-273c-4ee1-a11b-6489b251f207-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233137

--===============3615764368538481601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *e2fsprogs* to *1.47.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-e2fsprogs-upgrade-1.47.3-1.47.4.patch
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
From 2c6cd41a614f3c1a4161914135e506c7e297ec65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:27:29 +0000
Subject: [PATCH] e2fsprogs: upgrade 1.47.3 -> 1.47.4

---
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 -------------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/mkdir_p.patch         |  4 +-
 .../e2fsprogs/e2fsprogs/ptest.patch           |  8 ++--
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  6 +--
 .../e2fsprogs/remove.ldconfig.call.patch      |  2 +-
 ...2fsprogs_1.47.3.bb => e2fsprogs_1.47.4.bb} |  5 +--
 7 files changed, 12 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.3.bb => e2fsprogs_1.47.4.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
deleted file mode 100644
index 1c578022fb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 30 Nov 2025 21:47:50 +0800
-Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
-
-Fixed:
-$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
-$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
-$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
-__populate_fs: Ext2 file too big while writing file "largefile"
-mke2fs: Ext2 file too big while populating file system
-
-This was because the offset is overflow, use __u64 to fix the problem.
-
-Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
-the metadata, so it should be enough large for it, just leave it there.
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/create_inode.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 624efc03..14273534 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
- }
- #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
- 
--static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const char *buf, unsigned int n_bytes) {
-+static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *buf, unsigned int n_bytes) {
- 	errcode_t err = ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
- 	if (err)
- 		return err;
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 4cd1098597..bdf6e3a4c5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 1c7078fda6d23f1d80b0d95ac3e908364749e188 Mon Sep 17 00:00:00 2001
+From 87f016968567436e7e26d15928c5fc8820a96830 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
index 2dbeba1095..23b4805dc1 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -1,4 +1,4 @@
-From e143a900199c5bb10b28f3fc8f4d36bbb6ffdd5f Mon Sep 17 00:00:00 2001
+From 905ca37772f726e84e0426f49b032351008bc8b8 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Tue, 7 Mar 2017 14:53:19 -0800
 Subject: [PATCH] e2fsprogs: expand @mkdir_p@
@@ -14,7 +14,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 131caef3..ca448d97 100644
+index 3e5586a3..0e1ad1b8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index f4e1057a36..20ebceebfc 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,4 +1,4 @@
-From 25db5ac7469cedd043a04bcf49ce7553979fbb32 Mon Sep 17 00:00:00 2001
+From 156bde04f6908b17a339c4c12911aed719acfd78 Mon Sep 17 00:00:00 2001
 From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
 Date: Sat, 18 Apr 2015 17:58:17 +0300
 Subject: [PATCH] e2fsprogs: add ptest
@@ -14,10 +14,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/tests/Makefile.in b/tests/Makefile.in
-index ba06b3b6..5a3e48f4 100644
+index 678cc326..58f75900 100644
 --- a/tests/Makefile.in
 +++ b/tests/Makefile.in
-@@ -20,7 +20,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
+@@ -21,7 +21,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
  	@echo "#!/bin/sh" > test_one
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
@@ -26,7 +26,7 @@ index ba06b3b6..5a3e48f4 100644
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
-@@ -31,7 +31,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
+@@ -33,7 +33,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
  	@echo "Creating test_script..."
  	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 4ba150e27d..e42fd3de13 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From b66c973e004e0c458ef275b41ac2d8d9ff33d29f Mon Sep 17 00:00:00 2001
+From 81b2bfc670b5712df4980d893f50c57212e938af Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 909c1df3..0842369e 100644
+index b9f248be..b0380975 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2518,7 +2518,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
index 307088d42b..bf376e035e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
@@ -1,4 +1,4 @@
-From 972086935d6c7f6e603004fd7f94bd13a65f470c Mon Sep 17 00:00:00 2001
+From 1d94be15cd6f1c9fd75e463f2e67ee398f783334 Mon Sep 17 00:00:00 2001
 From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
 Date: Wed, 30 Jan 2013 15:22:04 +0200
 Subject: [PATCH] When /etc/ld.so.cache is writeable by user running bitbake
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
index 40658399d9..a74cce6dae 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
@@ -4,14 +4,11 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
-           "
-SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
+SRCREV = "ece89fac4603e400155b7bbf6326284f8511bca9"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.47.1


--===============3615764368538481601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-badblocks: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-badblocks: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dbg: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGSIZE changed from 5988632 to 5994032 (+0%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dev: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dev: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dev: PKGSIZE changed from 216530 to 216618 (+0%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-doc: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-doc: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-doc: PKGSIZE changed from 231755 to 234255 (+1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dumpe2fs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-dumpe2fs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PKGSIZE changed from 197106 to 195056 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-da: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-da: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-de: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-de: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-es: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-es: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-es: PKGSIZE changed from 202640 to 200740 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PKGSIZE changed from 201340 to 199386 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fur: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-fur: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-id: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-id: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-it: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-it: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ka: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ka: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PKGSIZE changed from 40914 to 43906 (+7%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PKGSIZE changed from 192633 to 190655 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PKGSIZE changed from 193446 to 191547 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PKGSIZE changed from 191879 to 190055 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ro: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ro: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-ro: PKGSIZE changed from 211171 to 209168 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PKGSIZE changed from 256192 to 253865 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PKGSIZE changed from 188517 to 186664 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PKGSIZE changed from 260748 to 258390 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PKGSIZE changed from 175726 to 173989 (-1%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-ptest: FILELIST: added "/usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/image.gz /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/expect.2 /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/image.gz /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/expect.2 /usr/lib/e2fsprogs/ptest/test/m_root_selinux/script /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/name /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/name /usr/lib/e2fsprogs/ptest/test/m_root_selinux/expect.1"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-ptest: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-ptest: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-ptest: PKGSIZE changed from 19177430 to 19196420 (+0%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-resize2fs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-resize2fs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-src: FILELIST: directory renamed /usr/src/debug/e2fsprogs/1.47.3/resize -> /usr/src/debug/e2fsprogs/1.47.4/resize, directory renamed /usr/src/debug/e2fsprogs/1.47.3/debugfs -> /usr/src/debug/e2fsprogs/1.47.4/debugfs, directory renamed /usr/src/debug/e2fsprogs/1.47.3/lib/ss -> /usr/src/debug/e2fsprogs/1.47.4/lib/ss, directory renamed /usr/src/debug/e2fsprogs/1.47.3/lib/et -> /usr/src/debug/e2fsprogs/1.47.4/lib/et, directory renamed /usr/src/debug/e2fsprogs/1.47.3/lib/ext2fs -> /usr/src/debug/e2fsprogs/1.47.4/lib/ext2fs, directory renamed /usr/src/debug/e2fsprogs/1.47.3/lib/e2p -> /usr/src/debug/e2fsprogs/1.47.4/lib/e2p, directory renamed /usr/src/debug/e2fsprogs/1.47.3/tests/progs -> /usr/src/debug/e2fsprogs/1.47.4/tests/progs, directory renamed /usr/src/debug/e2fsprogs/1.47.3/e2fsck -> /usr/src/debug/e2fsprogs/1.47.4/e2fsck, directory renamed /usr/src/debug/e2fsprogs/1.47.3/misc -> /usr/src/debug/e2fsprogs/1.47.4/misc, directory renam
 ed /usr/src/debug/e2fsprogs/1.47.3/lib/support -> /usr/src/debug/e2fsprogs/1.47.4/lib/support
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-src: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-src: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-src: PKGSIZE changed from 3774800 to 3778505 (+0%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-staticdev: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-staticdev: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-staticdev: PKGSIZE changed from 3417318 to 3419606 (+0%)
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs: SRC_URI changed from "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https file://remove.ldconfig.call.patch file://run-ptest file://ptest.patch file://mkdir_p.patch file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch" to "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https file://remove.ldconfig.call.patch file://run-ptest file://ptest.patch file://mkdir_p.patch file://e2fsprogs-fix-missing-check-for-permission-denied.patch file://quiet-debugfs.patch"
packages/x86-64-v3-poky-linux/e2fsprogs/libcomerr: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/libcomerr: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/libe2p: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/libe2p: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/libext2fs: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/libext2fs: PV changed from "1.47.3" to "1.47.4"
packages/x86-64-v3-poky-linux/e2fsprogs/libss: PKGV changed from 1.47.3 [default] to 1.47.4 [default]
packages/x86-64-v3-poky-linux/e2fsprogs/libss: PV changed from "1.47.3" to "1.47.4"

--===============3615764368538481601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/e2fsprogs/e2fsprogs-ptest: FILELIST: added "/usr/lib/e2fsprogs/ptest/test/m_root_selinux/script /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/image.gz /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/name /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/image.gz /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/name /usr/lib/e2fsprogs/ptest/test/m_root_selinux/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/expect.2 /usr/lib/e2fsprogs/ptest/test/f_ea_inode_fast_symlink/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_zero_size/expect.2"

--===============3615764368538481601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-e2fsprogs-upgrade-1.47.3-1.47.4.patch"

RnJvbSAyYzZjZDQxYTYxNGYzYzFhNDE2MTkxNDEzNWU1MDZjN2UyOTdlYzY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6Mjc6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
MmZzcHJvZ3M6IHVwZ3JhZGUgMS40Ny4zIC0+IDEuNDcuNAoKLS0tCiAuLi5pbm9kZS5jLUZpeC1m
b3ItZmlsZS1sYXJnZXItdGhhbi0yR0IucGF0Y2ggfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4tbWlzc2luZy1jaGVjay1mb3ItcGVybWlzc2lvbi1kZW5pZWQucGF0Y2ggfCAgMiArLQogLi4u
L2UyZnNwcm9ncy9lMmZzcHJvZ3MvbWtkaXJfcC5wYXRjaCAgICAgICAgIHwgIDQgKy0KIC4uLi9l
MmZzcHJvZ3MvZTJmc3Byb2dzL3B0ZXN0LnBhdGNoICAgICAgICAgICB8ICA4ICsrLS0KIC4uLi9l
MmZzcHJvZ3MvZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2ggICB8ICA2ICstLQogLi4uL2Uy
ZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaCAgICAgIHwgIDIgKy0KIC4uLjJmc3By
b2dzXzEuNDcuMy5iYiA9PiBlMmZzcHJvZ3NfMS40Ny40LmJifSB8ICA1ICstLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy8wMDAxLW1pc2Mt
Y3JlYXRlX2lub2RlLmMtRml4LWZvci1maWxlLWxhcmdlci10aGFuLTJHQi5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3Mve2UyZnNwcm9nc18xLjQ3LjMuYmIgPT4g
ZTJmc3Byb2dzXzEuNDcuNC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy8wMDAxLW1pc2MtY3JlYXRlX2lub2RlLmMtRml4LWZv
ci1maWxlLWxhcmdlci10aGFuLTJHQi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZz
cHJvZ3MvZTJmc3Byb2dzLzAwMDEtbWlzYy1jcmVhdGVfaW5vZGUuYy1GaXgtZm9yLWZpbGUtbGFy
Z2VyLXRoYW4tMkdCLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxYzU3ODAy
MmZiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzLzAwMDEtbWlzYy1jcmVhdGVfaW5vZGUuYy1GaXgtZm9yLWZpbGUtbGFyZ2VyLXRoYW4t
MkdCLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAotRnJvbSA2MzU5ZTBlYzhl
ZjI0OWQyMDJkYmI4NTgzYTZlNDMwZjIwYzViMWEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+Ci1EYXRlOiBTdW4s
IDMwIE5vdiAyMDI1IDIxOjQ3OjUwICswODAwCi1TdWJqZWN0OiBbUEFUQ0hdIG1pc2MvY3JlYXRl
X2lub2RlLmM6IEZpeCBmb3IgZmlsZSBsYXJnZXIgdGhhbiAyR0IKLQotRml4ZWQ6Ci0kIGRkIGlm
PS9kZXYvemVybyBvZj0uLi9pbWFnZS5leHQ0IGJzPTFNIGNvdW50PTRrCi0kIGRkIGlmPS9kZXYv
cmFuZG9tIG9mPS4uL3Jvb3Rmcy9sYXJnZWZpbGUgYnM9MU0gY291bnQ9M2sKLSQgLi9taXNjL21r
ZTJmcyAtdCBleHQ0IC1kIC4uL3Jvb3Rmcy8gLi4vaW1hZ2UuZXh0NAotX19wb3B1bGF0ZV9mczog
RXh0MiBmaWxlIHRvbyBiaWcgd2hpbGUgd3JpdGluZyBmaWxlICJsYXJnZWZpbGUiCi1ta2UyZnM6
IEV4dDIgZmlsZSB0b28gYmlnIHdoaWxlIHBvcHVsYXRpbmcgZmlsZSBzeXN0ZW0KLQotVGhpcyB3
YXMgYmVjYXVzZSB0aGUgb2Zmc2V0IGlzIG92ZXJmbG93LCB1c2UgX191NjQgdG8gZml4IHRoZSBw
cm9ibGVtLgotCi1Bbm90aGVyIGNvZGUgd2hpY2ggdXNlcyBleHQyX29mZl90IGlzIGNvcHlfZnNf
dmVyaXR5X2RhdGEoKSwgYnV0IGl0IG9ubHkgY29waWVzCi10aGUgbWV0YWRhdGEsIHNvIGl0IHNo
b3VsZCBiZSBlbm91Z2ggbGFyZ2UgZm9yIGl0LCBqdXN0IGxlYXZlIGl0IHRoZXJlLgotCi1VcHN0
cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3R5dHNvL2UyZnNwcm9n
cy9wdWxsLzI1OF0KLQotU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdp
bmRyaXZlci5jb20+Ci0tLS0KLSBtaXNjL2NyZWF0ZV9pbm9kZS5jIHwgMiArLQotIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvbWlz
Yy9jcmVhdGVfaW5vZGUuYyBiL21pc2MvY3JlYXRlX2lub2RlLmMKLWluZGV4IDYyNGVmYzAzLi4x
NDI3MzUzNCAxMDA2NDQKLS0tLSBhL21pc2MvY3JlYXRlX2lub2RlLmMKLSsrKyBiL21pc2MvY3Jl
YXRlX2lub2RlLmMKLUBAIC00MTQsNyArNDE0LDcgQEAgc3RhdGljIHNzaXplX3QgbXlfcHJlYWQo
aW50IGZkLCB2b2lkICpidWYsIHNpemVfdCBjb3VudCwgb2ZmX3Qgb2Zmc2V0KQotIH0KLSAjZW5k
aWYgLyogIWRlZmluZWQgSEFWRV9QUkVBRDY0ICYmICFkZWZpbmVkIEhBVkVfUFJFQUQgKi8KLSAK
LS1zdGF0aWMgZXJyY29kZV90IHdyaXRlX2FsbChleHQyX2ZpbGVfdCBlMl9maWxlLCBleHQyX29m
Zl90IG9mZiwgY29uc3QgY2hhciAqYnVmLCB1bnNpZ25lZCBpbnQgbl9ieXRlcykgewotK3N0YXRp
YyBlcnJjb2RlX3Qgd3JpdGVfYWxsKGV4dDJfZmlsZV90IGUyX2ZpbGUsIF9fdTY0IG9mZiwgY29u
c3QgY2hhciAqYnVmLCB1bnNpZ25lZCBpbnQgbl9ieXRlcykgewotIAllcnJjb2RlX3QgZXJyID0g
ZXh0MmZzX2ZpbGVfbGxzZWVrKGUyX2ZpbGUsIG9mZiwgRVhUMl9TRUVLX1NFVCwgTlVMTCk7Ci0g
CWlmIChlcnIpCi0gCQlyZXR1cm4gZXJyOwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvZTJmc3Byb2dzLWZpeC1taXNz
aW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL2UyZnNwcm9ncy1maXgtbWlzc2luZy1jaGVjay1mb3It
cGVybWlzc2lvbi1kZW5pZWQucGF0Y2gKaW5kZXggNGNkMTA5ODU5Ny4uYmRmNmUzYTRjNSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvZTJmc3By
b2dzLWZpeC1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9lMmZzcHJvZ3MtZml4LW1p
c3NpbmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAxYzcwNzhmZGE2ZDIzZjFkODBiMGQ5NWFjM2U5MDgzNjQ3NDllMTg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA4N2YwMTY5Njg1Njc0MzZlN2UyNmQxNTkyOGM1ZmM4ODIwYTk2
ODMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUu
aHVhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTAgQXVnIDIwMTYgMTE6MTk6NDQgKzA4
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IG1pc3NpbmcgY2hlY2sgZm9yIHBlcm1pc3Npb24gZGVu
aWVkLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJv
Z3MvbWtkaXJfcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3By
b2dzL21rZGlyX3AucGF0Y2gKaW5kZXggMmRiZWJhMTA5NS4uMjNiNDgwNWRjMSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvbWtkaXJfcC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rpcl9w
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMTQzYTkwMDE5OWM1YmIxMGIyOGYzZmM4ZjRk
MzZiYmI2ZmZkZDVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MDVjYTM3NzcyZjcy
NmU4NGUwNDI2ZjQ5YjAzMjM1MTAwOGJjOGI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA3IE1hciAy
MDE3IDE0OjUzOjE5IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGUyZnNwcm9nczogZXhwYW5kIEBt
a2Rpcl9wQApAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqc2xh
dGVyQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAxMzFjYWVmMy4u
Y2E0NDhkOTcgMTAwNjQ0CitpbmRleCAzZTU1ODZhMy4uMGUxYWQxYjggMTAwNjQ0CiAtLS0gYS9j
b25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTkzOCw2ICs5MzgsOCBAQCBBQ19T
VUJTVChQQUNLQUdFKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9n
cy9lMmZzcHJvZ3MvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dz
L2UyZnNwcm9ncy9wdGVzdC5wYXRjaAppbmRleCBmNGUxMDU3YTM2Li4yMGViY2VlYmZjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9wdGVzdC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9wdGVz
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjVkYjVhYzc0NjljZWRkMDQzYTA0YmNmNDlj
ZTc1NTM5NzlmYmIzMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTU2YmRlMDRmNjkw
OGIxN2EzMzljNGMxMjkxMWFlZDcxOWFjZmQ3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IERtaXRyeSBFcmVtaW4tU29sZW5pa292IDxkbWl0cnlfZXJlbWluQG1lbnRvci5jb20+CiBE
YXRlOiBTYXQsIDE4IEFwciAyMDE1IDE3OjU4OjE3ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGUy
ZnNwcm9nczogYWRkIHB0ZXN0CkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2Fp
IEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxl
LmluIGIvdGVzdHMvTWFrZWZpbGUuaW4KLWluZGV4IGJhMDZiM2I2Li41YTNlNDhmNCAxMDA2NDQK
K2luZGV4IDY3OGNjMzI2Li41OGY3NTkwMCAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmlu
CiArKysgYi90ZXN0cy9NYWtlZmlsZS5pbgotQEAgLTIwLDcgKzIwLDcgQEAgdGVzdF9vbmU6ICQo
c3JjZGlyKS90ZXN0X29uZS5pbiBNYWtlZmlsZSBta2UyZnMuY29uZiB0ZXN0X2RhdGEudG1wCitA
QCAtMjEsNyArMjEsNyBAQCB0ZXN0X29uZTogJChzcmNkaXIpL3Rlc3Rfb25lLmluIE1ha2VmaWxl
IG1rZTJmcy5jb25mIHRlc3RfZGF0YS50bXAKICAJQGVjaG8gIiMhL2Jpbi9zaCIgPiB0ZXN0X29u
ZQogIAlAZWNobyAiSFRSRUU9eSIgPj4gdGVzdF9vbmUKICAJQGVjaG8gIlFVT1RBPXkiID4+IHRl
c3Rfb25lCkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4IGJhMDZiM2I2Li41YTNlNDhmNCAxMDA2NDQK
ICAJQGVjaG8gIkRJRkZfT1BUUz1AVU5JX0RJRkZfT1BUU0AiID4+IHRlc3Rfb25lCiAgCUBlY2hv
ICJTSVpFT0ZfVElNRV9UPUBTSVpFT0ZfVElNRV9UQCIgPj4gdGVzdF9vbmUKICAJQGVjaG8gIkRE
PUBEREAiID4+dGVzdF9vbmUKLUBAIC0zMSw3ICszMSw3IEBAIHRlc3Rfc2NyaXB0OiB0ZXN0X29u
ZSB0ZXN0X3NjcmlwdC5pbiBNYWtlZmlsZSBta2UyZnMuY29uZiB0ZXN0X2RhdGEudG1wCitAQCAt
MzMsNyArMzMsNyBAQCB0ZXN0X3NjcmlwdDogdGVzdF9vbmUgdGVzdF9zY3JpcHQuaW4gTWFrZWZp
bGUgbWtlMmZzLmNvbmYgdGVzdF9kYXRhLnRtcAogIAlAZWNobyAiQ3JlYXRpbmcgdGVzdF9zY3Jp
cHQuLi4iCiAgCUBbIC1mIHRlc3Rfc2NyaXB0IF0gJiYgY2htb2QgdSt3IHRlc3Rfc2NyaXB0IHx8
IHRydWUKICAJQGVjaG8gIiMhL2Jpbi9zaCIgPiB0ZXN0X3NjcmlwdApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdmcy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3F1aWV0LWRlYnVn
ZnMucGF0Y2gKaW5kZXggNGJhMTUwZTI3ZC4uZTQyZmQzZGUxMyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdmcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9xdWlldC1kZWJ1
Z2ZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNjZjOTczZTAwNGUwYzQ1OGVmMjc1YjQx
YWMyZDhkOWZmMzNkMjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MWIyYmZjNjcw
YjU3MTJkZjQ5ODBkODkzZjUwYzU3MjEyZTkzOGFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IE1vbiwgMjMg
RGVjIDIwMTMgMTM6Mzg6MzQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3Byb2dzOiBzaWxl
bmNlIGRlYnVnZnMKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZGVidWdmcy9kZWJ1Z2ZzLmMgYi9kZWJ1
Z2ZzL2RlYnVnZnMuYwotaW5kZXggOTA5YzFkZjMuLjA4NDIzNjllIDEwMDY0NAoraW5kZXggYjlm
MjQ4YmUuLmIwMzgwOTc1IDEwMDY0NAogLS0tIGEvZGVidWdmcy9kZWJ1Z2ZzLmMKICsrKyBiL2Rl
YnVnZnMvZGVidWdmcy5jCi1AQCAtMjUyOSw3ICsyNTI5LDcgQEAgc3RhdGljIGludCBzb3VyY2Vf
ZmlsZShjb25zdCBjaGFyICpjbWRfZmlsZSwgaW50IHNzX2lkeCkKK0BAIC0yNTE4LDcgKzI1MTgs
NyBAQCBzdGF0aWMgaW50IHNvdXJjZV9maWxlKGNvbnN0IGNoYXIgKmNtZF9maWxlLCBpbnQgc3Nf
aWR4KQogIAkJY3AgPSBzdHJjaHIoYnVmLCAnXHInKTsKICAJCWlmIChjcCkKICAJCQkqY3AgPSAw
OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3Mv
cmVtb3ZlLmxkY29uZmlnLmNhbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3By
b2dzL2UyZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaAppbmRleCAzMDcwODhkNDJi
Li5iZjM3NmUwMzVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dz
L2UyZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gOTcyMDg2OTM1ZDZjN2Y2ZTYwMzAwNGZkN2Y5NGJkMTNhNjVm
NDcwYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWQ5NGJlMTVjZDZmMWM5ZmQ3NWU0
NjNmMmU2N2VlMzk4Zjc4MzMzNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJl
aSBEaW51IDxhbmRyZWkuYWRyaWFueC5kaW51QGludGVsLmNvbT4KIERhdGU6IFdlZCwgMzAgSmFu
IDIwMTMgMTU6MjI6MDQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gV2hlbiAvZXRjL2xkLnNvLmNh
Y2hlIGlzIHdyaXRlYWJsZSBieSB1c2VyIHJ1bm5pbmcgYml0YmFrZQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4zLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny40LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzXzEuNDcuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9n
cy9lMmZzcHJvZ3NfMS40Ny40LmJiCmluZGV4IDQwNjU4Mzk5ZDkuLmE3NGNjZTZkYWUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjQu
YmIKQEAgLTQsMTQgKzQsMTEgQEAgU1JDX1VSSSArPSAiZmlsZTovL3JlbW92ZS5sZGNvbmZpZy5j
YWxsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZp
bGU6Ly9wdGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ta2Rpcl9wLnBhdGNoIFwKLSAg
ICAgICAgICAgZmlsZTovLzAwMDEtbWlzYy1jcmVhdGVfaW5vZGUuYy1GaXgtZm9yLWZpbGUtbGFy
Z2VyLXRoYW4tMkdCLnBhdGNoIFwKLSAgICAgICAgICAgIgotU1JDX1VSSTphcHBlbmQ6Y2xhc3Mt
bmF0aXZlID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9lMmZzcHJvZ3MtZml4LW1pc3NpbmctY2hl
Y2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3F1aWV0
LWRlYnVnZnMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJkYTYzMWUxMTdkY2Y4
Nzk3YmZkYTBmNDhiZGFhMDVhYzBmYmNmN2FmIgorU1JDUkVWID0gImVjZTg5ZmFjNDYwM2U0MDAx
NTViN2JiZjYzMjYyODRmODUxMWJjYTkiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2
KD9QPHB2ZXI+XGQrXC5cZCsoXC5cZCspKikkIgogCiBFWFRSQV9PRUNPTkYgKz0gIi0tbGliZGly
PSR7YmFzZV9saWJkaXJ9IC0tc2JpbmRpcj0ke2Jhc2Vfc2JpbmRpcn0gXAotLSAKMi40Ny4xCgo=

--===============3615764368538481601==--

