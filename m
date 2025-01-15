Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1815EC0218A
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17866.1736936767313295345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NgbuxlxA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Xgu9sTZO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194697fbbf1-281e9d03-4e7e-4618-8a86-f8499e808080-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936766;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TwbwZfaUix6LjlI/uNJ849KbBl7cLyrKDRWUaMZZMS0=;
	b=NgbuxlxAdRnJEZgnezKR50pjx0YDz0cEVxbmhRQ+wja83jT8TI/BL0ar60l847Bb
	KWrj2HwjlmZv0HnbkddxCwc4q/KdOxjNCyZj3yiRFPLS43JGePW6xaWFbV0XTPLrUhk
	71LTaymL4m26QxiBP0b0VONpZ9LRDbPOSsbXSJ3E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936766;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TwbwZfaUix6LjlI/uNJ849KbBl7cLyrKDRWUaMZZMS0=;
	b=Xgu9sTZO5e4IP4bJw03JGBmG8n3xDnvabnvJzKiMFSUoxdUfbqkplqrJwdcdY4tp
	X63LtipYP/rAg4EF85cqdP3S0h9c2rBDlXwx6jwDMIONSmguZaqIyF8IZtpdml/f5Uz
	+4mj9nurSO1luXLEMR6gCYQIBYWVL7IRm4iB5hWU=
Content-Type: multipart/mixed; boundary="===============0193152806394655665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.13 FAILED
Message-ID: <01010194697fbbf1-281e9d03-4e7e-4618-8a86-f8499e808080-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209836

--===============0193152806394655665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.22.13* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.22.11-1.22.13.patch
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
From f70aa2f9a754758d453707e9c310313124837238 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 06:31:51 +0000
Subject: [PATCH] dpkg: upgrade 1.22.11 -> 1.22.13

---
 .../dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch      | 4 ++--
 .../0001-build.c-ignore-return-of-1-from-tar-cf.patch     | 8 ++++----
 .../dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch       | 2 +-
 .../dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch     | 2 +-
 ...t-to-linux-wrs-kernel-version-which-has-characte.patch | 6 +++---
 ...lutimes-function-doesn-t-work-properly-for-all-s.patch | 4 ++--
 .../dpkg/0006-add-musleabi-to-known-target-tripets.patch  | 2 +-
 ...g-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch | 6 +++---
 .../dpkg/dpkg/add_armeb_triplet_entry.patch               | 2 +-
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch             | 6 +++---
 meta/recipes-devtools/dpkg/dpkg/noman.patch               | 4 ++--
 .../dpkg/dpkg/remove-tar-no-timestamp.patch               | 2 +-
 .../dpkg/{dpkg_1.22.11.bb => dpkg_1.22.13.bb}             | 2 +-
 13 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.11.bb => dpkg_1.22.13.bb} (94%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
index 8943f6c2f0..88bf2011e9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -1,4 +1,4 @@
-From 5c332c2a4625519a2b6065b9d9fc724e84c9b6d6 Mon Sep 17 00:00:00 2001
+From 0e2f87872b43fe1e145d44021e60159da7ade3f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
@@ -23,7 +23,7 @@ index 575c008e3..7a801a03a 100644
  s390		s390		s390			32	big
  s390x		s390x		s390x			64	big
 diff --git a/scripts/Dpkg/Vendor/Debian.pm b/scripts/Dpkg/Vendor/Debian.pm
-index edf94bc19..d76f97494 100644
+index 1af60dabd..889d8380d 100644
 --- a/scripts/Dpkg/Vendor/Debian.pm
 +++ b/scripts/Dpkg/Vendor/Debian.pm
 @@ -216,6 +216,7 @@ sub set_build_features {
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 185bbb90f1..2321fe1f63 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 067992f2d0b0ff6ca114031636eb0e1eac791892 Mon Sep 17 00:00:00 2001
+From 3e088192d681d3376ee8f1a174fc32de6c138e0a Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -28,10 +28,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 87bd4142e..e85fd7d0f 100644
+index 96b5766fe..c06412b53 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -481,6 +481,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -505,6 +505,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
    pid_t pid_tar, pid_comp;
@@ -39,7 +39,7 @@ index 87bd4142e..e85fd7d0f 100644
  
    /* Fork off a tar. We will feed it a list of filenames on stdin later. */
    m_pipe(pipe_filenames);
-@@ -533,7 +534,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -557,7 +558,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
    /* All done, clean up wait for tar and <compress> to finish their job. */
    close(pipe_filenames[1]);
    subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
index 67fce89d80..730d25366e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -1,4 +1,4 @@
-From df6c641e3fc248d0c864e4e752c4609412067df7 Mon Sep 17 00:00:00 2001
+From 11991456fad3162c5d96e33117beb12e26d7c8c5 Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
index d0459cd017..f0605cfc04 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
@@ -1,4 +1,4 @@
-From 5e5f06d396fe631990474ba6df83428987855365 Mon Sep 17 00:00:00 2001
+From 3af6447032d06990792b0d07290f98d0fae7c885 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] script.c: avoid use of chroot
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index a5c80773a5..156084dd7b 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,4 +1,4 @@
-From 6e88e8b7b6924751112966f329525956735de9b4 Mon Sep 17 00:00:00 2001
+From 81d26701c8a326627c239a756431c7f42e044802 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:16:16 +0300
 Subject: [PATCH] Adapt to linux-wrs kernel version, which has character '_'
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index a999b5e78..7be0378ab 100644
+index 2d6b095fb..6efb76129 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -291,14 +291,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
+@@ -289,14 +289,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
    ptr = rversion->version;
    if (!*ptr)
      return dpkg_put_error(err, _("version number is empty"));
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index e49d54152c..d1e8ed0cea 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,4 +1,4 @@
-From 0fc90a3ed01a7fce34de925979460638b8a57402 Mon Sep 17 00:00:00 2001
+From 9e3e327ea64f4ea7a45ca4427b3a6e72c393de92 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:27:45 +0300
 Subject: [PATCH] The lutimes function doesn't work properly for all systems.
@@ -11,7 +11,7 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/main/archives.c b/src/main/archives.c
-index d7279e1f5..f9c6facc9 100644
+index 563efac30..30686e11c 100644
 --- a/src/main/archives.c
 +++ b/src/main/archives.c
 @@ -490,8 +490,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
index 4f60a89a56..b912874991 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -1,4 +1,4 @@
-From e3dc69aa987b379e247dde3fce479e43be6c81aa Mon Sep 17 00:00:00 2001
+From 41a905c9ce1f104f556bcac8fddca4b0b1adeac7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index ded1707dfd..a9621ccd81 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,4 +1,4 @@
-From 20ba7fd8939e97bec3d70a67c0aac76ddc67898d Mon Sep 17 00:00:00 2001
+From 7f95b1d868aaaa25b277a6c9096f66f3e8a92eab Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Tue, 21 Feb 2017 11:23:27 -0600
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
@@ -27,10 +27,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index a418dd122..87bd4142e 100644
+index 5a50056fe..96b5766fe 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -504,7 +504,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -528,7 +528,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
      command_init(&cmd, TAR, "tar -cf");
      command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index d1fac2168a..eb114f6711 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,4 +1,4 @@
-From 8ded32a35287a840de7e505c66e76cccd9edbac6 Mon Sep 17 00:00:00 2001
+From 2be155b75fefe457751edf6a0ab134dcf80bb5dc Mon Sep 17 00:00:00 2001
 From: "Krishnanjanappa, Jagadeesh"
  <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Date: Wed, 8 Apr 2015 18:08:14 +0530
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index b5a29231dd..f65abec25c 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,4 +1,4 @@
-From 812dbb64f2805a3257ef9c9a61abbd10e0b3a08c Mon Sep 17 00:00:00 2001
+From 0611aab1011d1ebafed57ae8be2fd8dd6d83ebaf Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Mon, 26 Aug 2013 23:38:45 +0000
 Subject: [PATCH] dpkg: fix configuration issue for mips64
@@ -16,10 +16,10 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
-index 0d352eeb9..4ef5fa307 100644
+index cadefb4d4..7dd492ca9 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
-@@ -326,9 +326,6 @@ sub _load_tupletable()
+@@ -326,9 +326,6 @@ sub _load_tupletable
  		    (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
  		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
  
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index 3f3e08351c..7e4108b379 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,4 +1,4 @@
-From e671b43a52bf5785fe4aad84712dbabc6c86b39e Mon Sep 17 00:00:00 2001
+From 5e9416c149615ac96b2caf0f922a169e1b4a5edb Mon Sep 17 00:00:00 2001
 From: Chris Larson <kergoth@openedhand.com>
 Date: Tue, 5 Sep 2006 07:24:58 +0000
 Subject: [PATCH] Add dpkg, modified from upstream oe.
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 74f8df197..35e5eee39 100644
+index 7681e7767..b4226d95c 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -11,7 +11,6 @@ SUBDIRS = \
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index d3a1a13098..bd637928b6 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,4 @@
-From 7d69de114aa696cfb5e31b491a657ca6b6cbbbd5 Mon Sep 17 00:00:00 2001
+From b2600b9876d4fd5a7ed2df1c6f6d772fadc16235 Mon Sep 17 00:00:00 2001
 From: Constantin Musca <constantinx.musca@intel.com>
 Date: Tue, 28 Aug 2012 17:02:40 +0300
 Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb
similarity index 94%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.13.bb
index 47a8d5d5ea..2b403879d9 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb
@@ -17,6 +17,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "ee7e9118d0a9581cb00c5ce02dccd561b3096387"
+SRCREV = "66a5a61d279558aae34283244ba6e1cecb0de72b"
 
 S = "${WORKDIR}/git"
-- 
2.44.1


--===============0193152806394655665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.22.11-1.22.13.patch"

RnJvbSBmNzBhYTJmOWE3NTQ3NThkNDUzNzA3ZTljMzEwMzEzMTI0ODM3MjM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDY6MzE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjIuMTEgLT4gMS4yMi4xMwoKLS0tCiAuLi4vZHBrZy9kcGtnLzAwMDEt
QWRkLXN1cHBvcnQtZm9yLXJpc2N2MzItQ1BVLnBhdGNoICAgICAgfCA0ICsrLS0KIC4uLi8wMDAx
LWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoICAgICB8IDggKysr
Ky0tLS0KIC4uLi9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBvcnQtbXVzbHgzMi1idWlsZC5wYXRj
aCAgICAgICB8IDIgKy0KIC4uLi9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9pZC11c2Utb2Yt
Y2hyb290LnBhdGNoICAgICB8IDIgKy0KIC4uLnQtdG8tbGludXgtd3JzLWtlcm5lbC12ZXJzaW9u
LXdoaWNoLWhhcy1jaGFyYWN0ZS5wYXRjaCB8IDYgKysrLS0tCiAuLi5sdXRpbWVzLWZ1bmN0aW9u
LWRvZXNuLXQtd29yay1wcm9wZXJseS1mb3ItYWxsLXMucGF0Y2ggfCA0ICsrLS0KIC4uLi9kcGtn
LzAwMDYtYWRkLW11c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNoICB8IDIgKy0K
IC4uLmctZGViLWJ1aWxkLmMtUmVtb3ZlLXVzYWdlLW9mLWNsYW1wLW10aW1lLWluLXRhci5wYXRj
aCB8IDYgKysrLS0tCiAuLi4vZHBrZy9kcGtnL2FkZF9hcm1lYl90cmlwbGV0X2VudHJ5LnBhdGNo
ICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2Fy
Y2hfcG0ucGF0Y2ggICAgICAgICAgICAgfCA2ICsrKy0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy9ub21hbi5wYXRjaCAgICAgICAgICAgICAgIHwgNCArKy0tCiAuLi4vZHBrZy9k
cGtnL3JlbW92ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoICAgICAgICAgICAgICAgfCAyICstCiAu
Li4vZHBrZy97ZHBrZ18xLjIyLjExLmJiID0+IGRwa2dfMS4yMi4xMy5iYn0gICAgICAgICAgICAg
fCAyICstCiAxMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIyLjExLmJiID0+
IGRwa2dfMS4yMi4xMy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQtZm9yLXJpc2N2MzItQ1BVLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLUFkZC1zdXBwb3J0LWZvci1yaXNjdjMy
LUNQVS5wYXRjaAppbmRleCA4OTQzZjZjMmYwLi44OGJmMjAxMWU5IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQtZm9yLXJpc2N2MzIt
Q1BVLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQt
c3VwcG9ydC1mb3ItcmlzY3YzMi1DUFUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjMzMy
YzJhNDYyNTUxOWEyYjYwNjViOWQ5ZmM3MjRlODRjOWI2ZDYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDBlMmY4Nzg3MmI0M2ZlMWUxNDVkNDQwMjFlNjAxNTlkYTdhZGUzZjcgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgog
RGF0ZTogV2VkLCAyOSBBcHIgMjAyMCAyMjowMjoyMyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBB
ZGQgc3VwcG9ydCBmb3IgcmlzY3YzMiBDUFUKQEAgLTIzLDcgKzIzLDcgQEAgaW5kZXggNTc1YzAw
OGUzLi43YTgwMWEwM2EgMTAwNjQ0CiAgczM5MAkJczM5MAkJczM5MAkJCTMyCWJpZwogIHMzOTB4
CQlzMzkweAkJczM5MHgJCQk2NAliaWcKIGRpZmYgLS1naXQgYS9zY3JpcHRzL0Rwa2cvVmVuZG9y
L0RlYmlhbi5wbSBiL3NjcmlwdHMvRHBrZy9WZW5kb3IvRGViaWFuLnBtCi1pbmRleCBlZGY5NGJj
MTkuLmQ3NmY5NzQ5NCAxMDA2NDQKK2luZGV4IDFhZjYwZGFiZC4uODg5ZDgzODBkIDEwMDY0NAog
LS0tIGEvc2NyaXB0cy9EcGtnL1ZlbmRvci9EZWJpYW4ucG0KICsrKyBiL3NjcmlwdHMvRHBrZy9W
ZW5kb3IvRGViaWFuLnBtCiBAQCAtMjE2LDYgKzIxNiw3IEBAIHN1YiBzZXRfYnVpbGRfZmVhdHVy
ZXMgewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1
aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20t
dGFyLWNmLnBhdGNoCmluZGV4IDE4NWJiYjkwZjEuLjIzMjFmZTFmNjMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4t
b2YtMS1mcm9tLXRhci1jZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9k
cGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDA2Nzk5MmYyZDBiMGZmNmNhMTE0MDMxNjM2ZWIwZTFlYWM3OTE4
OTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNlMDg4MTkyZDY4MWQzMzc2ZWU4ZjFh
MTc0ZmMzMmRlNmMxMzhlMGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEVn
Z2xldG9uIDxwYXVsLmVnZ2xldG9uQGxpbnV4Lm1pY3Jvc29mdC5jb20+CiBEYXRlOiBUdWUsIDE2
IEp1biAyMDIwIDAzOjU3OjI1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkLmM6IGlnbm9y
ZSByZXR1cm4gb2YgMSBmcm9tIHRhciAtY2YKQEAgLTI4LDEwICsyOCwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBQYXVsIEVnZ2xldG9uIDxwYXVsLmVnZ2xldG9uQG1pY3Jvc29mdC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL2RlYi9idWlsZC5jIGIvc3JjL2RlYi9idWlsZC5jCi1pbmRleCA4N2JkNDE0MmUuLmU4NWZk
N2QwZiAxMDA2NDQKK2luZGV4IDk2YjU3NjZmZS4uYzA2NDEyYjUzIDEwMDY0NAogLS0tIGEvc3Jj
L2RlYi9idWlsZC5jCiArKysgYi9zcmMvZGViL2J1aWxkLmMKLUBAIC00ODEsNiArNDgxLDcgQEAg
dGFyYmFsbF9wYWNrKGNvbnN0IGNoYXIgKmRpciwgZmlsZW5hbWVzX2ZlZWRfZnVuYyAqdGFyX2Zp
bGVuYW1lc19mZWVkZXIsCitAQCAtNTA1LDYgKzUwNSw3IEBAIHRhcmJhbGxfcGFjayhjb25zdCBj
aGFyICpkaXIsIGZpbGVuYW1lc19mZWVkX2Z1bmMgKnRhcl9maWxlbmFtZXNfZmVlZGVyLAogIHsK
ICAgIGludCBwaXBlX2ZpbGVuYW1lc1syXSwgcGlwZV90YXJiYWxsWzJdOwogICAgcGlkX3QgcGlk
X3RhciwgcGlkX2NvbXA7CkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IDg3YmQ0MTQyZS4uZTg1ZmQ3
ZDBmIDEwMDY0NAogIAogICAgLyogRm9yayBvZmYgYSB0YXIuIFdlIHdpbGwgZmVlZCBpdCBhIGxp
c3Qgb2YgZmlsZW5hbWVzIG9uIHN0ZGluIGxhdGVyLiAqLwogICAgbV9waXBlKHBpcGVfZmlsZW5h
bWVzKTsKLUBAIC01MzMsNyArNTM0LDkgQEAgdGFyYmFsbF9wYWNrKGNvbnN0IGNoYXIgKmRpciwg
ZmlsZW5hbWVzX2ZlZWRfZnVuYyAqdGFyX2ZpbGVuYW1lc19mZWVkZXIsCitAQCAtNTU3LDcgKzU1
OCw5IEBAIHRhcmJhbGxfcGFjayhjb25zdCBjaGFyICpkaXIsIGZpbGVuYW1lc19mZWVkX2Z1bmMg
KnRhcl9maWxlbmFtZXNfZmVlZGVyLAogICAgLyogQWxsIGRvbmUsIGNsZWFuIHVwIHdhaXQgZm9y
IHRhciBhbmQgPGNvbXByZXNzPiB0byBmaW5pc2ggdGhlaXIgam9iLiAqLwogICAgY2xvc2UocGlw
ZV9maWxlbmFtZXNbMV0pOwogICAgc3VicHJvY19yZWFwKHBpZF9jb21wLCBfKCI8Y29tcHJlc3M+
IGZyb20gdGFyIC1jZiIpLCAwKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBvcnQtbXVzbHgzMi1idWlsZC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBvcnQtbXVzbHgzMi1idWlsZC5w
YXRjaAppbmRleCA2N2ZjZTg5ZDgwLi43MzBkMjUzNjZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0LW11c2x4MzItYnVpbGQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWRwa2ctU3VwcG9y
dC1tdXNseDMyLWJ1aWxkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZjZjNjQxZTNmYzI0
OGQwYzg2NGU0ZTc1MmM0NjA5NDEyMDY3ZGY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAxMTk5MTQ1NmZhZDMxNjJjNWQ5NmUzMzExN2JlYjEyZTI2ZDdjOGM1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogc3dlZWF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+CiBEYXRl
OiBTdW4sIDEwIFNlcCAyMDE3IDAwOjE0OjE1IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRwa2c6
IFN1cHBvcnQgbXVzbHgzMiBidWlsZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy8wMDAxLXNjcmlwdC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtc2NyaXB0LmMtYXZvaWQtdXNlLW9mLWNo
cm9vdC5wYXRjaAppbmRleCBkMDQ1OWNkMDE3Li5mMDYwNWNmYzA0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtc2NyaXB0LmMtYXZvaWQtdXNlLW9mLWNo
cm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtc2Ny
aXB0LmMtYXZvaWQtdXNlLW9mLWNocm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWU1
ZjA2ZDM5NmZlNjMxOTkwNDc0YmE2ZGY4MzQyODk4Nzg1NTM2NSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gM2FmNjQ0NzAzMmQwNjk5MDc5MmIwZDA3MjkwZjk4ZDBmYWU3Yzg4NSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAyNiBBdWcgMjAxNSAxNjoyNTo0NSArMDMwMAogU3Vi
amVjdDogW1BBVENIXSBzY3JpcHQuYzogYXZvaWQgdXNlIG9mIGNocm9vdApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAyLUFkYXB0LXRvLWxpbnV4LXdycy1r
ZXJuZWwtdmVyc2lvbi13aGljaC1oYXMtY2hhcmFjdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtlcm5lbC12ZXJzaW9uLXdo
aWNoLWhhcy1jaGFyYWN0ZS5wYXRjaAppbmRleCBhNWM4MDc3M2E1Li4xNTYwODRkZDdiIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGlu
dXgtd3JzLWtlcm5lbC12ZXJzaW9uLXdoaWNoLWhhcy1jaGFyYWN0ZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtlcm5l
bC12ZXJzaW9uLXdoaWNoLWhhcy1jaGFyYWN0ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NmU4OGU4YjdiNjkyNDc1MTExMjk2NmYzMjk1MjU5NTY3MzVkZTliNCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gODFkMjY3MDFjOGEzMjY2MjdjMjM5YTc1NjQzMWM3ZjQyZTA0NDgwMiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAyNiBBdWcgMjAxNSAxNjoxNjoxNiArMDMwMAog
U3ViamVjdDogW1BBVENIXSBBZGFwdCB0byBsaW51eC13cnMga2VybmVsIHZlcnNpb24sIHdoaWNo
IGhhcyBjaGFyYWN0ZXIgJ18nCkBAIC0xMywxMCArMTMsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliL2Rwa2cvcGFyc2Vo
ZWxwLmMgYi9saWIvZHBrZy9wYXJzZWhlbHAuYwotaW5kZXggYTk5OWI1ZTc4Li43YmUwMzc4YWIg
MTAwNjQ0CitpbmRleCAyZDZiMDk1ZmIuLjZlZmI3NjEyOSAxMDA2NDQKIC0tLSBhL2xpYi9kcGtn
L3BhcnNlaGVscC5jCiArKysgYi9saWIvZHBrZy9wYXJzZWhlbHAuYwotQEAgLTI5MSwxNCArMjkx
LDEyIEBAIHBhcnNldmVyc2lvbihzdHJ1Y3QgZHBrZ192ZXJzaW9uICpydmVyc2lvbiwgY29uc3Qg
Y2hhciAqc3RyaW5nLAorQEAgLTI4OSwxNCArMjg5LDEyIEBAIHBhcnNldmVyc2lvbihzdHJ1Y3Qg
ZHBrZ192ZXJzaW9uICpydmVyc2lvbiwgY29uc3QgY2hhciAqc3RyaW5nLAogICAgcHRyID0gcnZl
cnNpb24tPnZlcnNpb247CiAgICBpZiAoISpwdHIpCiAgICAgIHJldHVybiBkcGtnX3B1dF9lcnJv
cihlcnIsIF8oInZlcnNpb24gbnVtYmVyIGlzIGVtcHR5IikpOwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA0LVRoZS1sdXRpbWVzLWZ1bmN0aW9uLWRvZXNu
LXQtd29yay1wcm9wZXJseS1mb3ItYWxsLXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13b3JrLXByb3Blcmx5
LWZvci1hbGwtcy5wYXRjaAppbmRleCBlNDlkNTQxNTJjLi5kMWU4ZWQwY2VhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rp
b24tZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13
b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGZjOTBh
M2VkMDFhN2ZjZTM0ZGU5MjU5Nzk0NjA2MzhiOGE1NzQwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOWUzZTMyN2VhNjRmNGVhN2E0NWNhNDQyN2IzYTZlNzJjMzkzZGU5MiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogV2VkLCAyNiBBdWcgMjAxNSAxNjoyNzo0NSArMDMwMAogU3ViamVj
dDogW1BBVENIXSBUaGUgbHV0aW1lcyBmdW5jdGlvbiBkb2Vzbid0IHdvcmsgcHJvcGVybHkgZm9y
IGFsbCBzeXN0ZW1zLgpAQCAtMTEsNyArMTEsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9tYWluL2FyY2hpdmVzLmMgYi9z
cmMvbWFpbi9hcmNoaXZlcy5jCi1pbmRleCBkNzI3OWUxZjUuLmY5YzZmYWNjOSAxMDA2NDQKK2lu
ZGV4IDU2M2VmYWMzMC4uMzA2ODZlMTFjIDEwMDY0NAogLS0tIGEvc3JjL21haW4vYXJjaGl2ZXMu
YwogKysrIGIvc3JjL21haW4vYXJjaGl2ZXMuYwogQEAgLTQ5MCw4ICs0OTAsOSBAQCB0YXJvYmpl
Y3Rfc2V0X210aW1lKHN0cnVjdCB0YXJfZW50cnkgKnRlLCBjb25zdCBjaGFyICpwYXRoKQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA2LWFkZC1tdXNsZWFi
aS10by1rbm93bi10YXJnZXQtdHJpcGV0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvMDAwNi1hZGQtbXVzbGVhYmktdG8ta25vd24tdGFyZ2V0LXRyaXBldHMucGF0Y2gK
aW5kZXggNGY2MGE4OWE1Ni4uYjkxMjg3NDk5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rwa2cvZHBrZy8wMDA2LWFkZC1tdXNsZWFiaS10by1rbm93bi10YXJnZXQtdHJpcGV0
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDYtYWRkLW11
c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBlM2RjNjlhYTk4N2IzNzllMjQ3ZGRlM2ZjZTQ3OWU0M2JlNmM4MWFhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0MWE5MDVjOWNlMWYxMDRmNTU2YmNhYzhmZGRjYTRiMGIxYWRlYWM3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFdlZCwgMzAgRGVjIDIwMTUgMjM6MDU6NDEgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYWRkIG11c2xlYWJpIHRvIGtub3duIHRhcmdldCB0cmlwZXRzCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDctZHBrZy1kZWItYnVpbGQuYy1SZW1v
dmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Rwa2cvZHBrZy8wMDA3LWRwa2ctZGViLWJ1aWxkLmMtUmVtb3ZlLXVzYWdlLW9mLWNsYW1w
LW10aW1lLWluLXRhci5wYXRjaAppbmRleCBkZWQxNzA3ZGZkLi5hOTYyMWNjZDgxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDctZHBrZy1kZWItYnVpbGQu
Yy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNy1kcGtnLWRlYi1idWlsZC5jLVJlbW92ZS11c2Fn
ZS1vZi1jbGFtcC1tdGltZS1pbi10YXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIwYmE3
ZmQ4OTM5ZTk3YmVjM2Q3MGE2N2MwYWFjNzZkZGM2Nzg5OGQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDdmOTViMWQ4NjhhYWFhMjViMjc3YTZjOTA5NmY2NmYzZThhOTJlYWIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW49QzM9QURiYWw9MjBMaW09QzM9
QjNuPz0gPGFuaWJhbC5saW1vbkBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBUdWUsIDIxIEZlYiAy
MDE3IDExOjIzOjI3IC0wNjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRwa2ctZGViL2J1aWxkLmM6IFJl
bW92ZSB1c2FnZSBvZiAtLWNsYW1wLW10aW1lIGluIHRhcgpAQCAtMjcsMTAgKzI3LDEwIEBAIFNp
Z25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L2RlYi9idWlsZC5jIGIvc3JjL2RlYi9idWlsZC5jCi1pbmRleCBhNDE4ZGQxMjIuLjg3YmQ0MTQy
ZSAxMDA2NDQKK2luZGV4IDVhNTAwNTZmZS4uOTZiNTc2NmZlIDEwMDY0NAogLS0tIGEvc3JjL2Rl
Yi9idWlsZC5jCiArKysgYi9zcmMvZGViL2J1aWxkLmMKLUBAIC01MDQsNyArNTA0LDcgQEAgdGFy
YmFsbF9wYWNrKGNvbnN0IGNoYXIgKmRpciwgZmlsZW5hbWVzX2ZlZWRfZnVuYyAqdGFyX2ZpbGVu
YW1lc19mZWVkZXIsCitAQCAtNTI4LDcgKzUyOCw3IEBAIHRhcmJhbGxfcGFjayhjb25zdCBjaGFy
ICpkaXIsIGZpbGVuYW1lc19mZWVkX2Z1bmMgKnRhcl9maWxlbmFtZXNfZmVlZGVyLAogIAogICAg
ICBjb21tYW5kX2luaXQoJmNtZCwgVEFSLCAidGFyIC1jZiIpOwogICAgICBjb21tYW5kX2FkZF9h
cmdzKCZjbWQsICJ0YXIiLCAiLWNmIiwgIi0iLCAiLS1mb3JtYXQ9Z251IiwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnku
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FkZF9hcm1lYl90cmlwbGV0
X2VudHJ5LnBhdGNoCmluZGV4IGQxZmFjMjE2OGEuLmViMTE0ZjY3MTEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnkucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxl
dF9lbnRyeS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGRlZDMyYTM1Mjg3YTg0MGRlN2U1
MDVjNjZlNzZjY2NkOWVkYmFjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmJlMTU1
Yjc1ZmVmZTQ1Nzc1MWVkZjZhMGFiMTM0ZGNmODBiYjVkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206ICJLcmlzaG5hbmphbmFwcGEsIEphZ2FkZWVzaCIKICA8amFnYWRlZXNoLmtyaXNo
bmFuamFuYXBwYUBjYXZpdW1uZXR3b3Jrcy5jb20+CiBEYXRlOiBXZWQsIDggQXByIDIwMTUgMTg6
MDg6MTQgKzA1MzAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cv
YXJjaF9wbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5w
YXRjaAppbmRleCBiNWEyOTIzMWRkLi5mNjVhYmVjMjVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FyY2hfcG0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rwa2cvZHBrZy9hcmNoX3BtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4MTJk
YmI2NGYyODA1YTMyNTdlZjljOWE2MWFiYmQxMGUwYjNhMDhjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwNjExYWFiMTAxMWQxZWJhZmVkNTdhZThiZTJmZDhkZDZkODNlYmFmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogTW9uLCAyNiBBdWcgMjAxMyAyMzozODo0NSArMDAwMAogU3ViamVjdDogW1BB
VENIXSBkcGtnOiBmaXggY29uZmlndXJhdGlvbiBpc3N1ZSBmb3IgbWlwczY0CkBAIC0xNiwxMCAr
MTYsMTAgQEAgU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9EcGtnL0FyY2gucG0gYi9zY3JpcHRzL0Rwa2cvQXJjaC5wbQotaW5kZXggMGQzNTJlZWI5Li40
ZWY1ZmEzMDcgMTAwNjQ0CitpbmRleCBjYWRlZmI0ZDQuLjdkZDQ5MmNhOSAxMDA2NDQKIC0tLSBh
L3NjcmlwdHMvRHBrZy9BcmNoLnBtCiArKysgYi9zY3JpcHRzL0Rwa2cvQXJjaC5wbQotQEAgLTMy
Niw5ICszMjYsNiBAQCBzdWIgX2xvYWRfdHVwbGV0YWJsZSgpCitAQCAtMzI2LDkgKzMyNiw2IEBA
IHN1YiBfbG9hZF90dXBsZXRhYmxlCiAgCQkgICAgKG15ICRkdCA9ICRkZWJ0dXBsZSkgPX4gcy88
Y3B1Pi8kX2NwdS87CiAgCQkgICAgKG15ICRkYSA9ICRkZWJhcmNoKSA9fiBzLzxjcHU+LyRfY3B1
LzsKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvbm9tYW4u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL25vbWFuLnBhdGNoCmluZGV4
IDNmM2UwODM1MWMuLjdlNDEwOGIzNzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2cvbm9tYW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cv
ZHBrZy9ub21hbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTY3MWI0M2E1MmJmNTc4NWZl
NGFhZDg0NzEyZGJhYmM2Yzg2YjM5ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWU5
NDE2YzE0OTYxNWFjOTZiMmNhZjBmOTIyYTE2OWUxYjRhNWVkYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IENocmlzIExhcnNvbiA8a2VyZ290aEBvcGVuZWRoYW5kLmNvbT4KIERhdGU6
IFR1ZSwgNSBTZXAgMjAwNiAwNzoyNDo1OCArMDAwMAogU3ViamVjdDogW1BBVENIXSBBZGQgZHBr
ZywgbW9kaWZpZWQgZnJvbSB1cHN0cmVhbSBvZS4KQEAgLTksNyArOSw3IEBAIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbZGlzYWJsZSBmZWF0dXJlXQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1p
bmRleCA3NGY4ZGYxOTcuLjM1ZTVlZWUzOSAxMDA2NDQKK2luZGV4IDc2ODFlNzc2Ny4uYjQyMjZk
OTVjIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCiBAQCAtMTEs
NyArMTEsNiBAQCBTVUJESVJTID0gXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kcGtnL2Rwa2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2gKaW5kZXggZDNh
MWExMzA5OC4uYmQ2Mzc5MjhiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZHBrZy9kcGtnL3JlbW92ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA3ZDY5ZGUxMTRhYTY5NmNmYjVlMzFiNDkxYTY1N2NhNmI2Y2JiYmQ1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMjYwMGI5ODc2ZDRmZDVhN2VkMmRmMWM2ZjZk
NzcyZmFkYzE2MjM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ29uc3RhbnRpbiBN
dXNjYSA8Y29uc3RhbnRpbngubXVzY2FAaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyOCBBdWcgMjAx
MiAxNzowMjo0MCArMDMwMAogU3ViamVjdDogW1BBVENIXSBidXN5Ym94LTEuMTkuNCB0YXIgdXRp
bGl0eSBkb2Vzbid0IHN1cHBvcnQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2dfMS4yMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4y
Mi4xMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnXzEuMjIuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2dfMS4yMi4xMy5iYgppbmRleCA0N2E4ZDVkNWVhLi4yYjQwMzg3OWQ5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjIuMTEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIyLjEzLmJiCkBAIC0xNyw2ICsxNyw2
IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kcGtnLXRlYW0vZHBrZy5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4KIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gIiBmaWxlOi8vMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5w
YXRjaCIKIAotU1JDUkVWID0gImVlN2U5MTE4ZDBhOTU4MWNiMDBjNWNlMDJkY2NkNTYxYjMwOTYz
ODciCitTUkNSRVYgPSAiNjZhNWE2MWQyNzk1NThhYWUzNDI4MzI0NGJhNmUxY2VjYjBkZTcyYiIK
IAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuNDQuMQoK

--===============0193152806394655665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:51a0f3d285cd0462e50249f1a33920be6e2cfcf6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 219 Local 200 Mirrors 0 Missed 19 Current 460 (91% match, 97% complete)
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_setscene)
NOTE: Running setscene task 610 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_setscene)
NOTE: Running task 1151 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_recipe_qa)
NOTE: Running task 1294 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_recipe_qa)
NOTE: recipe dpkg-1.22.13-r0: task do_recipe_qa: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_setscene: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_recipe_qa: Started
NOTE: recipe dpkg-1.22.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1389 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_fetch)
NOTE: recipe dpkg-native-1.22.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1390 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_fetch)
NOTE: recipe dpkg-1.22.13-r0: task do_fetch: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_fetch: Started
NOTE: recipe dpkg-1.22.13-r0: task do_fetch: Succeeded
NOTE: Running task 1391 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_unpack)
NOTE: recipe dpkg-1.22.13-r0: task do_unpack: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_fetch: Succeeded
NOTE: Running task 1392 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_unpack)
NOTE: Running task 1393 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-native-1.22.13-r0: task do_unpack: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 671 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.22.13-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_patch)
NOTE: recipe dpkg-1.22.13-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_unpack: Succeeded
NOTE: Running task 1399 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_patch)
NOTE: recipe dpkg-native-1.22.13-r0: task do_patch: Started
NOTE: recipe dpkg-1.22.13-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_populate_lic)
NOTE: recipe dpkg-1.22.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.22.13-r0: task do_populate_lic: Started
NOTE: recipe dpkg-1.22.13-r0: task do_populate_lic: Succeeded
NOTE: recipe dpkg-1.22.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dpkg-native-1.22.13-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_deploy_source_date_epoch)
NOTE: recipe dpkg-native-1.22.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_configure)
NOTE: recipe dpkg-native-1.22.13-r0: task do_configure: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 676 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1775 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1914 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_collect_spdx_deps)
NOTE: recipe dpkg-1.22.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.22.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe dpkg-1.22.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.22.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1927 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_configure)
NOTE: recipe dpkg-1.22.13-r0: task do_configure: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_configure: Succeeded
NOTE: Running task 1928 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_compile)
NOTE: recipe dpkg-native-1.22.13-r0: task do_compile: Started
NOTE: recipe dpkg-native-1.22.13-r0: task do_compile: Succeeded
NOTE: Running task 1929 of 1946 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_install)
NOTE: recipe dpkg-native-1.22.13-r0: task do_install: Started
NOTE: recipe dpkg-1.22.13-r0: task do_configure: Succeeded
NOTE: Running task 1930 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_compile)
NOTE: recipe dpkg-1.22.13-r0: task do_compile: Started
NOTE: recipe dpkg-1.22.13-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 1946 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_install)
NOTE: recipe dpkg-1.22.13-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image install
| Making install in lib
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib'
| Making install in compat
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/compat'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/compat'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/compat'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/compat'
| Making install in dpkg
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/dpkg'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/dpkg'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/include/dpkg'
|  /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libdpkg.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 libdpkg.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/ar.h ../../../git/lib/dpkg/arch.h ../../../git/lib/dpkg/atomic-file.h ../../../git/lib/dpkg/buffer.h ../../../git/lib/dpkg/c-ctype.h ../../../git/lib/dpkg/color.h ../../../git/lib/dpkg/command.h ../../../git/lib/dpkg/compress.h ../../../git/lib/dpkg/db-ctrl.h ../../../git/lib/dpkg/db-fsys.h ../../../git/lib/dpkg/deb-version.h ../../../git/lib/dpkg/debug.h ../../../git/lib/dpkg/dir.h ../../../git/lib/dpkg/dpkg.h ../../../git/lib/dpkg/dpkg-db.h ../../../git/lib/dpkg/ehandle.h ../../../git/lib/dpkg/error.h ../../../git/lib/dpkg/execname.h ../../../git/lib/dpkg/fdio.h ../../../git/lib/dpkg/file.h ../../../git/lib/dpkg/fsys.h ../../../git/lib/dpkg/glob.h ../../../git/lib/dpkg/macros.h ../../../git/lib/dpkg/meminfo.h ../../../git/lib/dpkg/namevalue.h ../../../git/lib/dpkg/options.h ../../../git/lib/dpkg/pager.h ../../../git/lib/dpkg/parsedump.h ../../../git/lib/dpkg/path.h ../../../git/lib/
 dpkg/pkg.h ../../../git/lib/dpkg/pkg-array.h ../../../git/lib/dpkg/pkg-files.h ../../../git/lib/dpkg/pkg-format.h ../../../git/lib/dpkg/pkg-list.h ../../../git/lib/dpkg/pkg-queue.h ../../../git/lib/dpkg/pkg-show.h ../../../git/lib/dpkg/pkg-spec.h ../../../git/lib/dpkg/progname.h ../../../git/lib/dpkg/program.h ../../../git/lib/dpkg/progress.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/include/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/report.h ../../../git/lib/dpkg/string.h ../../../git/lib/dpkg/subproc.h ../../../git/lib/dpkg/tarfn.h ../../../git/lib/dpkg/treewalk.h ../../../git/lib/dpkg/trigdeferred.h ../../../git/lib/dpkg/triglib.h ../../../git/lib/dpkg/varbuf.h ../../../git/lib/dpkg/version.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/include/dpkg'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/libdpkg.la
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.a /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/libdpkg.a
| libtool: install: chmod 644 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/libdpkg.a
| libtool: install: ranlib -D /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/libdpkg.a
| libtool: warning: remember to run 'libtool --finish /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib/dpkg'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/lib'
| Making install in src
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/src'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/src'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/etc/dpkg/dpkg.cfg.d
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/libexec/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/var/lib/dpkg/info
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg dpkg-deb dpkg-divert dpkg-query dpkg-realpath dpkg-split dpkg-statoverride dpkg-trigger '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-maintscript-helper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-db-backup dpkg-db-keeper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/libexec/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/var/lib/dpkg/parts
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/var/lib/dpkg/updates
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg/sh'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/src/sh/dpkg-error.sh '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg/sh'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-deb /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-deb
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-divert /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-divert
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-query /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-query
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-realpath /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-realpath
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-split /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-split
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-statoverride /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-statoverride
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-trigger /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-trigger
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/src'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/src'
| Making install in utils
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/utils'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/utils'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/etc/alternatives
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/sbin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/bash-completion/completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/polkit-1/actions'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/var/lib/dpkg/alternatives
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c update-alternatives '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/utils/README.alternatives /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/etc/alternatives/README
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 org.dpkg.pkexec.update-alternatives.policy '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/polkit-1/actions'
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/sbin'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c update-alternatives /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/update-alternatives
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/sbin/start-stop-daemon
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/utils'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/utils'
| Making install in scripts
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| Making install in mk
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts/mk'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts/mk'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/mk/architecture.mk ../../../git/scripts/mk/buildapi.mk ../../../git/scripts/mk/buildflags.mk ../../../git/scripts/mk/buildopts.mk ../../../git/scripts/mk/buildtools.mk ../../../git/scripts/mk/default.mk ../../../git/scripts/mk/pkg-info.mk ../../../git/scripts/mk/vendor.mk '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts/mk'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts/mk'
| Making install in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts/po'
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts/po'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/man/man3
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/zsh/vendor-completions'
| for module in Dpkg/Arch.pm Dpkg/Archive/Ar.pm Dpkg/BuildAPI.pm Dpkg/BuildDriver.pm Dpkg/BuildDriver/DebianRules.pm Dpkg/BuildEnv.pm Dpkg/BuildFlags.pm Dpkg/BuildInfo.pm Dpkg/BuildOptions.pm Dpkg/BuildProfiles.pm Dpkg/BuildTree.pm Dpkg/BuildTypes.pm Dpkg/Build/Info.pm Dpkg/Changelog.pm Dpkg/Changelog/Debian.pm Dpkg/Changelog/Entry.pm Dpkg/Changelog/Entry/Debian.pm Dpkg/Changelog/Parse.pm Dpkg/Checksums.pm Dpkg/Compression.pm Dpkg/Compression/FileHandle.pm Dpkg/Compression/Process.pm Dpkg/Conf.pm Dpkg/Control.pm Dpkg/Control/Changelog.pm Dpkg/Control/FieldsCore.pm Dpkg/Control/Fields.pm Dpkg/Control/Info.pm Dpkg/Control/HashCore.pm Dpkg/Control/HashCore/Tie.pm Dpkg/Control/Hash.pm Dpkg/Control/Tests.pm Dpkg/Control/Tests/Entry.pm Dpkg/Control/Types.pm Dpkg/Deps.pm Dpkg/Deps/AND.pm Dpkg/Deps/KnownFacts.pm Dpkg/Deps/Multiple.pm Dpkg/Deps/OR.pm Dpkg/Deps/Simple.pm Dpkg/Deps/Union.pm Dpkg/Dist/Files.pm Dpkg/ErrorHandling.pm Dpkg/Exit.pm Dpkg/File.pm Dpkg/Getopt.pm Dpkg/Gettext.pm Dpkg/In
 dex.pm Dpkg/Interface/Storable.pm Dpkg/IPC.pm Dpkg/Lock.pm Dpkg/OpenPGP.pm Dpkg/OpenPGP/Backend.pm Dpkg/OpenPGP/Backend/GnuPG.pm Dpkg/OpenPGP/Backend/SOP.pm Dpkg/OpenPGP/Backend/Sequoia.pm Dpkg/OpenPGP/ErrorCodes.pm Dpkg/OpenPGP/KeyHandle.pm Dpkg/Package.pm Dpkg/Path.pm Dpkg/Shlibs.pm Dpkg/Shlibs/Objdump.pm Dpkg/Shlibs/Objdump/Object.pm Dpkg/Shlibs/Symbol.pm Dpkg/Shlibs/SymbolFile.pm Dpkg/Shlibs/Cppfilt.pm Dpkg/Source/Archive.pm Dpkg/Source/BinaryFiles.pm Dpkg/Source/Format.pm Dpkg/Source/Functions.pm Dpkg/Source/Package.pm Dpkg/Source/Package/V1.pm Dpkg/Source/Package/V2.pm Dpkg/Source/Package/V3/Bzr.pm Dpkg/Source/Package/V3/Custom.pm Dpkg/Source/Package/V3/Native.pm Dpkg/Source/Package/V3/Git.pm Dpkg/Source/Package/V3/Quilt.pm Dpkg/Source/Patch.pm Dpkg/Source/Quilt.pm Dpkg/Substvars.pm Dpkg/Vendor.pm Dpkg/Vendor/Debian.pm Dpkg/Vendor/Default.pm Dpkg/Vendor/Devuan.pm Dpkg/Vendor/Ubuntu.pm Dpkg/Version.pm Dpkg.pm ; do \
|   name=`echo $module | sed -e 's|/|::|g' -e 's/\.pm$//'`; \
|   pod2man --utf8 --release=1.22.13-dirty --date='2025-01-03'  --center=libdpkg-perl \
|     --name="$name" --section=3perl ../../git/scripts/$module \
|     >/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/man/man3/$name.3perl; \
|   if ! [ -s "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/man/man3/$name.3perl" ]; then \
|     echo "error: empty /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/man/man3/$name.3perl" 2>&1; \
|     exit 1; \
|   fi; \
| done
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-architecture dpkg-buildflags dpkg-buildapi dpkg-buildpackage dpkg-buildtree dpkg-checkbuilddeps dpkg-distaddfile dpkg-genbuildinfo dpkg-genchanges dpkg-gencontrol dpkg-gensymbols dpkg-mergechangelogs dpkg-name dpkg-parsechangelog dpkg-scanpackages dpkg-scansources dpkg-shlibdeps dpkg-source dpkg-vendor '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/scripts/completion/zsh/_dpkg-parsechangelog '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/zsh/vendor-completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump/Object.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Build/Info.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V1.pm ../../git/scripts/Dpkg/Source/Package/V2.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump.pm ../../git/scripts/Dpkg/Shlibs/Symbol.pm ../../git/scripts/Dpkg/Shlibs/SymbolFile.pm ../../git/scripts/Dpkg/Shlibs/Cppfilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V3/Bzr.pm ../../git/scripts/Dpkg/Source/Package/V3/Custom.pm ../../git/scripts/Dpkg/Source/Package/V3/Native.pm ../../git/scripts/Dpkg/Source/Package/V3/Git.pm ../../git/scripts/Dpkg/Source/Package/V3/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend.pm ../../git/scripts/Dpkg/OpenPGP/ErrorCodes.pm ../../git/scripts/Dpkg/OpenPGP/KeyHandle.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Debian.pm ../../git/scripts/Dpkg/Changelog/Entry.pm ../../git/scripts/Dpkg/Changelog/Parse.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Dist/Files.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/BuildDriver/DebianRules.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Archive.pm ../../git/scripts/Dpkg/Source/BinaryFiles.pm ../../git/scripts/Dpkg/Source/Format.pm ../../git/scripts/Dpkg/Source/Functions.pm ../../git/scripts/Dpkg/Source/Package.pm ../../git/scripts/Dpkg/Source/Patch.pm ../../git/scripts/Dpkg/Source/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/HashCore/Tie.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Arch.pm ../../git/scripts/Dpkg/BuildAPI.pm ../../git/scripts/Dpkg/BuildDriver.pm ../../git/scripts/Dpkg/BuildEnv.pm ../../git/scripts/Dpkg/BuildFlags.pm ../../git/scripts/Dpkg/BuildInfo.pm ../../git/scripts/Dpkg/BuildOptions.pm ../../git/scripts/Dpkg/BuildProfiles.pm ../../git/scripts/Dpkg/BuildTree.pm ../../git/scripts/Dpkg/BuildTypes.pm ../../git/scripts/Dpkg/Changelog.pm ../../git/scripts/Dpkg/Checksums.pm ../../git/scripts/Dpkg/Compression.pm ../../git/scripts/Dpkg/Conf.pm ../../git/scripts/Dpkg/Control.pm ../../git/scripts/Dpkg/Deps.pm ../../git/scripts/Dpkg/ErrorHandling.pm ../../git/scripts/Dpkg/Exit.pm ../../git/scripts/Dpkg/File.pm ../../git/scripts/Dpkg/Getopt.pm ../../git/scripts/Dpkg/Gettext.pm ../../git/scripts/Dpkg/Index.pm ../../git/scripts/Dpkg/IPC.pm ../../git/scripts/Dpkg/Lock.pm ../../git/scripts/Dpkg/OpenPGP.pm ../../git/scripts/Dpkg/Package.pm ../../git/scripts/
 Dpkg/Path.pm ../../git/scripts/Dpkg/Shlibs.pm ../../git/scripts/Dpkg/Substvars.pm ../../git/scripts/Dpkg/Vendor.pm ../../git/scripts/Dpkg/Version.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Deps/AND.pm ../../git/scripts/Dpkg/Deps/KnownFacts.pm ../../git/scripts/Dpkg/Deps/Multiple.pm ../../git/scripts/Dpkg/Deps/OR.pm ../../git/scripts/Dpkg/Deps/Simple.pm ../../git/scripts/Dpkg/Deps/Union.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Changelog.pm ../../git/scripts/Dpkg/Control/FieldsCore.pm ../../git/scripts/Dpkg/Control/Fields.pm ../../git/scripts/Dpkg/Control/Info.pm ../../git/scripts/Dpkg/Control/HashCore.pm ../../git/scripts/Dpkg/Control/Hash.pm ../../git/scripts/Dpkg/Control/Tests.pm ../../git/scripts/Dpkg/Control/Types.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Vendor/Debian.pm ../../git/scripts/Dpkg/Vendor/Default.pm ../../git/scripts/Dpkg/Vendor/Devuan.pm ../../git/scripts/Dpkg/Vendor/Ubuntu.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/.'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Tests/Entry.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Entry/Debian.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Compression/FileHandle.pm ../../git/scripts/Dpkg/Compression/Process.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Interface/Storable.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Archive/Ar.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP/Backend'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend/GnuPG.pm ../../git/scripts/Dpkg/OpenPGP/Backend/SOP.pm ../../git/scripts/Dpkg/OpenPGP/Backend/Sequoia.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP/Backend'
| make  install-data-hook
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/perl-native/perl -i -p -e " s{^#!\s*/usr/bin/perl}{#!/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/perl-native/perl}; s{our \\\$CONFDIR = .*;}{our \\\$CONFDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/etc/dpkg';}; s{our \\\$ADMINDIR = .*;}{our \\\$ADMINDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/var/lib/dpkg';}; s{our \\\$LIBDIR = .*;}{our \\\$LIBDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/libexec/dpkg';}; s{our \\\$DATADIR = .*;}{our \\\$DATADIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg';}; s{our \\\$PROG
 MAKE = .*;}{our \\\$PROGMAKE = 'make';}; s{our \\\$PROGTAR = .*;}{our \\\$PROGTAR = 'tar';}; s{our \\\$PROGPATCH = .*;}{our \\\$PROGPATCH = 'patch';}; s{our \\\$PROGVERSION = .*;}{our \\\$PROGVERSION = '1.22.13-dirty';}; " /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg.pm
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/scripts'
| Making install in po
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/po'
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build/po'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build'
| make[2]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/m4/dpkg-arch.m4 ../git/m4/dpkg-build.m4 ../git/m4/dpkg-compiler.m4 ../git/m4/dpkg-coverage.m4 ../git/m4/dpkg-funcs.m4 ../git/m4/dpkg-headers.m4 ../git/m4/dpkg-libs.m4 ../git/m4/dpkg-linker.m4 ../git/m4/dpkg-progs.m4 ../git/m4/dpkg-types.m4 ../git/m4/dpkg-unicode.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/README.api ../git/doc/README.feature-removal-schedule '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/spec/build-driver.txt ../git/doc/spec/frontend-api.txt ../git/doc/spec/protected-field.txt ../git/doc/spec/rootless-builds.txt ../git/doc/spec/triggers.txt '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/data/pie-compile.specs ../git/data/pie-link.specs ../git/data/no-pie-compile.specs ../git/data/no-pie-link.specs ../git/data/cputable ../git/data/ostable ../git/data/abitable ../git/data/tupletable '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/share/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/build'
| sed: can't read /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/sbin/dpkg-*: No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/temp/run.do_install.141548:156 exit 2 from 'sed -i -e 's|^#!.*/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/perl-native.*/perl|#!/usr/bin/env nativeperl|' /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/bin/dpkg-* /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/recipe-sysroot-native/usr/sbin/dpkg-*'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/temp/run.do_install.141548, line 156
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/temp/run.do_install.141548, line 207
NOTE: recipe dpkg-native-1.22.13-r0: task do_install: Failed
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybu
 ild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmd/libmd_1.1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0
 .bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'libxcrypt', 'ncurses', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'perl', 'quilt-native', 'bzip2', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'bash-completion', 'gdbm', 'libmd', 'gettext-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'make-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image install
| Making install in lib
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib'
| Making install in compat
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/compat'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/compat'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/compat'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/compat'
| Making install in dpkg
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/dpkg'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/dpkg'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/pkgconfig'
|  /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libdpkg.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/include/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 libdpkg.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/ar.h ../../../git/lib/dpkg/arch.h ../../../git/lib/dpkg/atomic-file.h ../../../git/lib/dpkg/buffer.h ../../../git/lib/dpkg/c-ctype.h ../../../git/lib/dpkg/color.h ../../../git/lib/dpkg/command.h ../../../git/lib/dpkg/compress.h ../../../git/lib/dpkg/db-ctrl.h ../../../git/lib/dpkg/db-fsys.h ../../../git/lib/dpkg/deb-version.h ../../../git/lib/dpkg/debug.h ../../../git/lib/dpkg/dir.h ../../../git/lib/dpkg/dpkg.h ../../../git/lib/dpkg/dpkg-db.h ../../../git/lib/dpkg/ehandle.h ../../../git/lib/dpkg/error.h ../../../git/lib/dpkg/execname.h ../../../git/lib/dpkg/fdio.h ../../../git/lib/dpkg/file.h ../../../git/lib/dpkg/fsys.h ../../../git/lib/dpkg/glob.h ../../../git/lib/dpkg/macros.h ../../../git/lib/dpkg/meminfo.h ../../../git/lib/dpkg/namevalue.h ../../../git/lib/dpkg/options.h ../../../git/lib/dpkg/pager.h ../../../git/lib/dpkg/parsedump.h ../../../git/lib/dpkg/path.h ../../../git/lib/
 dpkg/pkg.h ../../../git/lib/dpkg/pkg-array.h ../../../git/lib/dpkg/pkg-files.h ../../../git/lib/dpkg/pkg-format.h ../../../git/lib/dpkg/pkg-list.h ../../../git/lib/dpkg/pkg-queue.h ../../../git/lib/dpkg/pkg-show.h ../../../git/lib/dpkg/pkg-spec.h ../../../git/lib/dpkg/progname.h ../../../git/lib/dpkg/program.h ../../../git/lib/dpkg/progress.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/include/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/report.h ../../../git/lib/dpkg/string.h ../../../git/lib/dpkg/subproc.h ../../../git/lib/dpkg/tarfn.h ../../../git/lib/dpkg/treewalk.h ../../../git/lib/dpkg/trigdeferred.h ../../../git/lib/dpkg/triglib.h ../../../git/lib/dpkg/varbuf.h ../../../git/lib/dpkg/version.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/include/dpkg'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/libdpkg.la
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.a /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/libdpkg.a
| libtool: install: chmod 644 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/libdpkg.a
| libtool: install: x86_64-poky-linux-gcc-ranlib /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/libdpkg.a
| libtool: warning: remember to run 'libtool --finish /usr/lib'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib/dpkg'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/lib'
| Making install in src
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/src'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/src'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/etc/dpkg/dpkg.cfg.d
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/libexec/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/var/lib/dpkg/info
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg dpkg-deb dpkg-divert dpkg-query dpkg-realpath dpkg-split dpkg-statoverride dpkg-trigger '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-maintscript-helper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-db-backup dpkg-db-keeper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/libexec/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/var/lib/dpkg/parts
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg/sh'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/var/lib/dpkg/updates
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/src/sh/dpkg-error.sh '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg/sh'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-deb /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-deb
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-divert /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-divert
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-query /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-query
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-realpath /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-realpath
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-split /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-split
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-statoverride /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-statoverride
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-trigger /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-trigger
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/src'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/src'
| Making install in utils
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/utils'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/utils'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/sbin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/bash-completion/completions'
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/sbin'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/sbin/start-stop-daemon
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/utils'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/utils'
| Making install in scripts
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| Making install in mk
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts/mk'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts/mk'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/mk/architecture.mk ../../../git/scripts/mk/buildapi.mk ../../../git/scripts/mk/buildflags.mk ../../../git/scripts/mk/buildopts.mk ../../../git/scripts/mk/buildtools.mk ../../../git/scripts/mk/default.mk ../../../git/scripts/mk/pkg-info.mk ../../../git/scripts/mk/vendor.mk '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts/mk'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts/mk'
| Making install in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts/po'
| installing ../../../git/scripts/po/ca.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ca/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/de.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/de/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/es.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/es/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/fr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/fr/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/nl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/nl/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/pl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/pl/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/pt.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/pt/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/ru.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ru/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/sv.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/sv/LC_MESSAGES/dpkg-dev.mo
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts/po'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/man/man3
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/zsh/vendor-completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-architecture dpkg-buildflags dpkg-buildapi dpkg-buildpackage dpkg-buildtree dpkg-checkbuilddeps dpkg-distaddfile dpkg-genbuildinfo dpkg-genchanges dpkg-gencontrol dpkg-gensymbols dpkg-mergechangelogs dpkg-name dpkg-parsechangelog dpkg-scanpackages dpkg-scansources dpkg-shlibdeps dpkg-source dpkg-vendor '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/scripts/completion/zsh/_dpkg-parsechangelog '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/zsh/vendor-completions'
| for module in Dpkg/Arch.pm Dpkg/Archive/Ar.pm Dpkg/BuildAPI.pm Dpkg/BuildDriver.pm Dpkg/BuildDriver/DebianRules.pm Dpkg/BuildEnv.pm Dpkg/BuildFlags.pm Dpkg/BuildInfo.pm Dpkg/BuildOptions.pm Dpkg/BuildProfiles.pm Dpkg/BuildTree.pm Dpkg/BuildTypes.pm Dpkg/Build/Info.pm Dpkg/Changelog.pm Dpkg/Changelog/Debian.pm Dpkg/Changelog/Entry.pm Dpkg/Changelog/Entry/Debian.pm Dpkg/Changelog/Parse.pm Dpkg/Checksums.pm Dpkg/Compression.pm Dpkg/Compression/FileHandle.pm Dpkg/Compression/Process.pm Dpkg/Conf.pm Dpkg/Control.pm Dpkg/Control/Changelog.pm Dpkg/Control/FieldsCore.pm Dpkg/Control/Fields.pm Dpkg/Control/Info.pm Dpkg/Control/HashCore.pm Dpkg/Control/HashCore/Tie.pm Dpkg/Control/Hash.pm Dpkg/Control/Tests.pm Dpkg/Control/Tests/Entry.pm Dpkg/Control/Types.pm Dpkg/Deps.pm Dpkg/Deps/AND.pm Dpkg/Deps/KnownFacts.pm Dpkg/Deps/Multiple.pm Dpkg/Deps/OR.pm Dpkg/Deps/Simple.pm Dpkg/Deps/Union.pm Dpkg/Dist/Files.pm Dpkg/ErrorHandling.pm Dpkg/Exit.pm Dpkg/File.pm Dpkg/Getopt.pm Dpkg/Gettext.pm Dpkg/In
 dex.pm Dpkg/Interface/Storable.pm Dpkg/IPC.pm Dpkg/Lock.pm Dpkg/OpenPGP.pm Dpkg/OpenPGP/Backend.pm Dpkg/OpenPGP/Backend/GnuPG.pm Dpkg/OpenPGP/Backend/SOP.pm Dpkg/OpenPGP/Backend/Sequoia.pm Dpkg/OpenPGP/ErrorCodes.pm Dpkg/OpenPGP/KeyHandle.pm Dpkg/Package.pm Dpkg/Path.pm Dpkg/Shlibs.pm Dpkg/Shlibs/Objdump.pm Dpkg/Shlibs/Objdump/Object.pm Dpkg/Shlibs/Symbol.pm Dpkg/Shlibs/SymbolFile.pm Dpkg/Shlibs/Cppfilt.pm Dpkg/Source/Archive.pm Dpkg/Source/BinaryFiles.pm Dpkg/Source/Format.pm Dpkg/Source/Functions.pm Dpkg/Source/Package.pm Dpkg/Source/Package/V1.pm Dpkg/Source/Package/V2.pm Dpkg/Source/Package/V3/Bzr.pm Dpkg/Source/Package/V3/Custom.pm Dpkg/Source/Package/V3/Native.pm Dpkg/Source/Package/V3/Git.pm Dpkg/Source/Package/V3/Quilt.pm Dpkg/Source/Patch.pm Dpkg/Source/Quilt.pm Dpkg/Substvars.pm Dpkg/Vendor.pm Dpkg/Vendor/Debian.pm Dpkg/Vendor/Default.pm Dpkg/Vendor/Devuan.pm Dpkg/Vendor/Ubuntu.pm Dpkg/Version.pm Dpkg.pm ; do \
|   name=`echo $module | sed -e 's|/|::|g' -e 's/\.pm$//'`; \
|   pod2man --utf8 --release=1.22.13-dirty --date='2025-01-03'  --center=libdpkg-perl \
|     --name="$name" --section=3perl ../../git/scripts/$module \
|     >/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/man/man3/$name.3perl; \
|   if ! [ -s "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/man/man3/$name.3perl" ]; then \
|     echo "error: empty /usr/share/man/man3/$name.3perl" 2>&1; \
|     exit 1; \
|   fi; \
| done
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump/Object.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Build/Info.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V1.pm ../../git/scripts/Dpkg/Source/Package/V2.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump.pm ../../git/scripts/Dpkg/Shlibs/Symbol.pm ../../git/scripts/Dpkg/Shlibs/SymbolFile.pm ../../git/scripts/Dpkg/Shlibs/Cppfilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V3/Bzr.pm ../../git/scripts/Dpkg/Source/Package/V3/Custom.pm ../../git/scripts/Dpkg/Source/Package/V3/Native.pm ../../git/scripts/Dpkg/Source/Package/V3/Git.pm ../../git/scripts/Dpkg/Source/Package/V3/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend.pm ../../git/scripts/Dpkg/OpenPGP/ErrorCodes.pm ../../git/scripts/Dpkg/OpenPGP/KeyHandle.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Debian.pm ../../git/scripts/Dpkg/Changelog/Entry.pm ../../git/scripts/Dpkg/Changelog/Parse.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Dist/Files.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/BuildDriver/DebianRules.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Archive.pm ../../git/scripts/Dpkg/Source/BinaryFiles.pm ../../git/scripts/Dpkg/Source/Format.pm ../../git/scripts/Dpkg/Source/Functions.pm ../../git/scripts/Dpkg/Source/Package.pm ../../git/scripts/Dpkg/Source/Patch.pm ../../git/scripts/Dpkg/Source/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/HashCore/Tie.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Arch.pm ../../git/scripts/Dpkg/BuildAPI.pm ../../git/scripts/Dpkg/BuildDriver.pm ../../git/scripts/Dpkg/BuildEnv.pm ../../git/scripts/Dpkg/BuildFlags.pm ../../git/scripts/Dpkg/BuildInfo.pm ../../git/scripts/Dpkg/BuildOptions.pm ../../git/scripts/Dpkg/BuildProfiles.pm ../../git/scripts/Dpkg/BuildTree.pm ../../git/scripts/Dpkg/BuildTypes.pm ../../git/scripts/Dpkg/Changelog.pm ../../git/scripts/Dpkg/Checksums.pm ../../git/scripts/Dpkg/Compression.pm ../../git/scripts/Dpkg/Conf.pm ../../git/scripts/Dpkg/Control.pm ../../git/scripts/Dpkg/Deps.pm ../../git/scripts/Dpkg/ErrorHandling.pm ../../git/scripts/Dpkg/Exit.pm ../../git/scripts/Dpkg/File.pm ../../git/scripts/Dpkg/Getopt.pm ../../git/scripts/Dpkg/Gettext.pm ../../git/scripts/Dpkg/Index.pm ../../git/scripts/Dpkg/IPC.pm ../../git/scripts/Dpkg/Lock.pm ../../git/scripts/Dpkg/OpenPGP.pm ../../git/scripts/Dpkg/Package.pm ../../git/scripts/
 Dpkg/Path.pm ../../git/scripts/Dpkg/Shlibs.pm ../../git/scripts/Dpkg/Substvars.pm ../../git/scripts/Dpkg/Vendor.pm ../../git/scripts/Dpkg/Version.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Deps/AND.pm ../../git/scripts/Dpkg/Deps/KnownFacts.pm ../../git/scripts/Dpkg/Deps/Multiple.pm ../../git/scripts/Dpkg/Deps/OR.pm ../../git/scripts/Dpkg/Deps/Simple.pm ../../git/scripts/Dpkg/Deps/Union.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Changelog.pm ../../git/scripts/Dpkg/Control/FieldsCore.pm ../../git/scripts/Dpkg/Control/Fields.pm ../../git/scripts/Dpkg/Control/Info.pm ../../git/scripts/Dpkg/Control/HashCore.pm ../../git/scripts/Dpkg/Control/Hash.pm ../../git/scripts/Dpkg/Control/Tests.pm ../../git/scripts/Dpkg/Control/Types.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Vendor/Debian.pm ../../git/scripts/Dpkg/Vendor/Default.pm ../../git/scripts/Dpkg/Vendor/Devuan.pm ../../git/scripts/Dpkg/Vendor/Ubuntu.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/.'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Tests/Entry.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Entry/Debian.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Compression/FileHandle.pm ../../git/scripts/Dpkg/Compression/Process.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Interface/Storable.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Archive/Ar.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP/Backend'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend/GnuPG.pm ../../git/scripts/Dpkg/OpenPGP/Backend/SOP.pm ../../git/scripts/Dpkg/OpenPGP/Backend/Sequoia.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP/Backend'
| make  install-data-hook
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/recipe-sysroot-native/usr/bin/perl-native/perl -i -p -e " s{^#!\s*/usr/bin/perl}{#!/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/recipe-sysroot-native/usr/bin/perl-native/perl}; s{our \\\$CONFDIR = .*;}{our \\\$CONFDIR = '/etc/dpkg';}; s{our \\\$ADMINDIR = .*;}{our \\\$ADMINDIR = '/var/lib/dpkg';}; s{our \\\$LIBDIR = .*;}{our \\\$LIBDIR = '/usr/libexec/dpkg';}; s{our \\\$DATADIR = .*;}{our \\\$DATADIR = '/usr/share/dpkg';}; s{our \\\$PROGMAKE = .*;}{our \\\$PROGMAKE = 'make';}; s{our \\\$PROGTAR = .*;}{our \\\$PROGTAR = 'tar';}; s{our \\\$PROGPATCH = .*;}{our \\\$PROGPATCH = 'patch';}; s{our \\\$PROGVERSION = .*;}{our \\\$PROGVERSION = '1.22.13-dirty';}; " /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/lib/perl5/5.40.0/Dpkg.pm
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/scripts'
| Making install in po
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/po'
| installing ../../git/po/ast.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ast/LC_MESSAGES/dpkg.mo
| installing ../../git/po/bs.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/bs/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ca.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ca/LC_MESSAGES/dpkg.mo
| installing ../../git/po/cs.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/cs/LC_MESSAGES/dpkg.mo
| installing ../../git/po/da.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/da/LC_MESSAGES/dpkg.mo
| installing ../../git/po/de.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/de/LC_MESSAGES/dpkg.mo
| installing ../../git/po/dz.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/dz/LC_MESSAGES/dpkg.mo
| installing ../../git/po/el.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/el/LC_MESSAGES/dpkg.mo
| installing ../../git/po/eo.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/eo/LC_MESSAGES/dpkg.mo
| installing ../../git/po/es.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/es/LC_MESSAGES/dpkg.mo
| installing ../../git/po/et.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/et/LC_MESSAGES/dpkg.mo
| installing ../../git/po/eu.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/eu/LC_MESSAGES/dpkg.mo
| installing ../../git/po/fr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/fr/LC_MESSAGES/dpkg.mo
| installing ../../git/po/gl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/gl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/hu.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/hu/LC_MESSAGES/dpkg.mo
| installing ../../git/po/id.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/id/LC_MESSAGES/dpkg.mo
| installing ../../git/po/it.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/it/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ja.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ja/LC_MESSAGES/dpkg.mo
| installing ../../git/po/km.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/km/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ko.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ko/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ku.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ku/LC_MESSAGES/dpkg.mo
| installing ../../git/po/lt.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/lt/LC_MESSAGES/dpkg.mo
| installing ../../git/po/mr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/mr/LC_MESSAGES/dpkg.mo
| installing ../../git/po/nb.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/nb/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ne.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ne/LC_MESSAGES/dpkg.mo
| installing ../../git/po/nl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/nl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/nn.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/nn/LC_MESSAGES/dpkg.mo
| installing ../../git/po/oc.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/oc/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pa.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/pa/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/pl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pt.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/pt/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pt_BR.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/pt_BR/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ro.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ro/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ru.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/ru/LC_MESSAGES/dpkg.mo
| installing ../../git/po/sk.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/sk/LC_MESSAGES/dpkg.mo
| installing ../../git/po/sv.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/sv/LC_MESSAGES/dpkg.mo
| installing ../../git/po/th.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/th/LC_MESSAGES/dpkg.mo
| installing ../../git/po/tl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/tl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/tr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/tr/LC_MESSAGES/dpkg.mo
| installing ../../git/po/vi.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/vi/LC_MESSAGES/dpkg.mo
| installing ../../git/po/zh_CN.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/zh_CN/LC_MESSAGES/dpkg.mo
| installing ../../git/po/zh_TW.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/locale/zh_TW/LC_MESSAGES/dpkg.mo
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build/po'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build'
| make[2]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/m4/dpkg-arch.m4 ../git/m4/dpkg-build.m4 ../git/m4/dpkg-compiler.m4 ../git/m4/dpkg-coverage.m4 ../git/m4/dpkg-funcs.m4 ../git/m4/dpkg-headers.m4 ../git/m4/dpkg-libs.m4 ../git/m4/dpkg-linker.m4 ../git/m4/dpkg-progs.m4 ../git/m4/dpkg-types.m4 ../git/m4/dpkg-unicode.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/README.api ../git/doc/README.feature-removal-schedule '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/spec/build-driver.txt ../git/doc/spec/frontend-api.txt ../git/doc/spec/protected-field.txt ../git/doc/spec/rootless-builds.txt ../git/doc/spec/triggers.txt '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/data/pie-compile.specs ../git/data/pie-link.specs ../git/data/no-pie-compile.specs ../git/data/no-pie-link.specs ../git/data/cputable ../git/data/ostable ../git/data/abitable ../git/data/tupletable '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/share/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/build'
| sed: can't read /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/sbin/dpkg-*: No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/temp/run.do_install.151900:163 exit 2 from 'sed -i -e 's|^#!.*/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/recipe-sysroot-native/usr/bin/perl-native.*/perl|#!/usr/bin/env perl|' /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/bin/dpkg-* /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/image/usr/sbin/dpkg-*'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/temp/run.do_install.151900, line 163
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/temp/run.do_install.151900, line 212
NOTE: recipe dpkg-1.22.13-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1931 tasks of which 1911 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115063102.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115063102.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/temp/log.do_install.141548
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/temp/log.do_install.151900
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: dpkg-native-1.22.13-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/temp/run.do_install.141548' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.13/temp/log.do_install.141548
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_install) failed with exit code '1'
ERROR: dpkg-1.22.13-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/temp/run.do_install.151900' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.13/temp/log.do_install.151900
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.13.bb:do_install) failed with exit code '1'

--===============0193152806394655665==--

