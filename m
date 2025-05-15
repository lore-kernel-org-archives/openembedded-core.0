Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FA0C5B553
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11037.1747312311729584053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VaI0AF4T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l1j+HjkR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3edfbf3-b29587ae-5123-4b2e-b739-b18ae0cde5f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NB0tojXO2+TqNwMJOoYCm1canR05j5e5e2quyRzWFv4=;
	b=VaI0AF4TrBb7UEebX5scMcfCoZqZ1qU241mAjTRHfgt7jO7W6Co1L4ChoLUtzHdm
	NA5Lom3dKbCuFBJHsnkI6O0r9rKUpasXX/4PnhsPm58vXRnNB6s/8RsopzhH88U/K6/
	PJhgQAHmG8yShRptOv/+h9ax725Fj+uec+VUTYcU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NB0tojXO2+TqNwMJOoYCm1canR05j5e5e2quyRzWFv4=;
	b=l1j+HjkRU2oKTTmGRZ1WdXRgs645kA5LxC/qFKnI+KDDIF1N4sj3VTlUkHe0p5+A
	d05jOtEqgV1VI7zpqh4OvrXzoPpeZHXsPOBng4Azg/Y1evOFdmas1EmCckiJ5G+0yBf
	FJfDxOoMg8YCYimc0OOCQFbZePTje4HG+3QflwG0=
Content-Type: multipart/mixed; boundary="===============1717541423843358575=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.18 FAILED
Message-ID: <01010196d3edfbf3-b29587ae-5123-4b2e-b739-b18ae0cde5f4-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216601

--===============1717541423843358575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.22.18* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.22.11-1.22.18.patch
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
From 5e0071a39ee51483b8557b4523a26cca85f73f9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:28:14 +0000
Subject: [PATCH] dpkg: upgrade 1.22.11 -> 1.22.18

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
 .../dpkg/{dpkg_1.22.11.bb => dpkg_1.22.18.bb}             | 2 +-
 13 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.11.bb => dpkg_1.22.18.bb} (94%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
index 8943f6c2f0..8e42883a81 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -1,4 +1,4 @@
-From 5c332c2a4625519a2b6065b9d9fc724e84c9b6d6 Mon Sep 17 00:00:00 2001
+From 213fc4daaab64f5e3c37e104d324256d9a02e549 Mon Sep 17 00:00:00 2001
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
index 185bbb90f1..272b9c6aeb 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 067992f2d0b0ff6ca114031636eb0e1eac791892 Mon Sep 17 00:00:00 2001
+From 39027c0d285fc0260629cd39b144074caae30084 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -28,10 +28,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 87bd4142e..e85fd7d0f 100644
+index 81844e300..e386ae687 100644
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
index 67fce89d80..6f65d191a1 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -1,4 +1,4 @@
-From df6c641e3fc248d0c864e4e752c4609412067df7 Mon Sep 17 00:00:00 2001
+From 07dff51821deadffd5e3a1165a61952f687e8056 Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
index d0459cd017..6a616c6fae 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
@@ -1,4 +1,4 @@
-From 5e5f06d396fe631990474ba6df83428987855365 Mon Sep 17 00:00:00 2001
+From dd9bf6559ad26b753e6d0255868fa93c1f84b7f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] script.c: avoid use of chroot
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index a5c80773a5..99a8bf824c 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,4 +1,4 @@
-From 6e88e8b7b6924751112966f329525956735de9b4 Mon Sep 17 00:00:00 2001
+From cb6e114a0b0e079f363b5395763b53ae753b386f Mon Sep 17 00:00:00 2001
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
index e49d54152c..8b134ebe69 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,4 +1,4 @@
-From 0fc90a3ed01a7fce34de925979460638b8a57402 Mon Sep 17 00:00:00 2001
+From 16f327b0ad9bb64f11a1447402b60074c1fb73c2 Mon Sep 17 00:00:00 2001
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
index 4f60a89a56..20641a524d 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -1,4 +1,4 @@
-From e3dc69aa987b379e247dde3fce479e43be6c81aa Mon Sep 17 00:00:00 2001
+From d0379e6c58868b8ceab4f52146de99a26a6f28ac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index ded1707dfd..18392feaf0 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,4 +1,4 @@
-From 20ba7fd8939e97bec3d70a67c0aac76ddc67898d Mon Sep 17 00:00:00 2001
+From 324b116daa22fad97e65b1821710a869ca66500e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Tue, 21 Feb 2017 11:23:27 -0600
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
@@ -27,10 +27,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index a418dd122..87bd4142e 100644
+index eefc369db..81844e300 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -504,7 +504,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -528,7 +528,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
      command_init(&cmd, TAR, "tar -cf");
      command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index d1fac2168a..b3c10b18e0 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,4 +1,4 @@
-From 8ded32a35287a840de7e505c66e76cccd9edbac6 Mon Sep 17 00:00:00 2001
+From f8c56174afca9956ad1a54101510c9c018081978 Mon Sep 17 00:00:00 2001
 From: "Krishnanjanappa, Jagadeesh"
  <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Date: Wed, 8 Apr 2015 18:08:14 +0530
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index b5a29231dd..580837c98a 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,4 +1,4 @@
-From 812dbb64f2805a3257ef9c9a61abbd10e0b3a08c Mon Sep 17 00:00:00 2001
+From 9cb1caa362ca2587dc37bae0f4136a7035cdf749 Mon Sep 17 00:00:00 2001
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
index 3f3e08351c..07dcd7e318 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,4 +1,4 @@
-From e671b43a52bf5785fe4aad84712dbabc6c86b39e Mon Sep 17 00:00:00 2001
+From 1264eaaa31b05b6ecb1f9fbba087097e4dc7c185 Mon Sep 17 00:00:00 2001
 From: Chris Larson <kergoth@openedhand.com>
 Date: Tue, 5 Sep 2006 07:24:58 +0000
 Subject: [PATCH] Add dpkg, modified from upstream oe.
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 74f8df197..35e5eee39 100644
+index 2895abec7..9db72f16c 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -11,7 +11,6 @@ SUBDIRS = \
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index d3a1a13098..6147d71df6 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,4 @@
-From 7d69de114aa696cfb5e31b491a657ca6b6cbbbd5 Mon Sep 17 00:00:00 2001
+From 56ae0c9e6cd3acbbc547f9e5c09ad15d6f829b27 Mon Sep 17 00:00:00 2001
 From: Constantin Musca <constantinx.musca@intel.com>
 Date: Tue, 28 Aug 2012 17:02:40 +0300
 Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb
similarity index 94%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.18.bb
index 47a8d5d5ea..d295ad0470 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb
@@ -17,6 +17,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "ee7e9118d0a9581cb00c5ce02dccd561b3096387"
+SRCREV = "0d1bb5dcac1f2efb59308514c396c42653fcea01"
 
 S = "${WORKDIR}/git"
-- 
2.47.1


--===============1717541423843358575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f8ca5f6b3ee9916fcfc3c78e6187c651c953ddec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 326 Local 307 Mirrors 0 Missed 19 Current 381 (94% match, 97% complete)
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 434 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_setscene)
NOTE: Running setscene task 447 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_setscene)
NOTE: Running setscene task 568 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmd/libmd_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libmd-1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmd-1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1221 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_recipe_qa)
NOTE: recipe dpkg-1.22.18-r0: task do_recipe_qa: Started
NOTE: Running task 1352 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_recipe_qa)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 697 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dpkg-native-1.22.18-r0: task do_recipe_qa: Started
NOTE: recipe dpkg-1.22.18-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_recipe_qa unihash changed to 4e47b4006c1962f51365bef55b742c591060042f64fea543acde23cb98cc5582
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.18-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1432 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_fetch)
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_recipe_qa unihash changed to 5f03063091d855e9bae4512ff698ce2a7b77f2e565f5eddb916914a9b5a5d460
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1433 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_fetch)
NOTE: recipe dpkg-1.22.18-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dpkg-1.22.18-r0: task do_fetch: Succeeded
NOTE: Running task 1439 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_unpack)
NOTE: recipe dpkg-1.22.18-r0: task do_unpack: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_fetch: Succeeded
NOTE: Running task 1440 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_unpack)
NOTE: Running task 1441 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-native-1.22.18-r0: task do_unpack: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.22.18-r0: task do_unpack: Succeeded
NOTE: Running task 1442 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_patch)
NOTE: recipe dpkg-1.22.18-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_unpack: Succeeded
NOTE: Running task 1443 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_patch)
NOTE: recipe dpkg-native-1.22.18-r0: task do_patch: Started
NOTE: recipe dpkg-1.22.18-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1445 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_populate_lic)
NOTE: recipe dpkg-1.22.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.22.18-r0: task do_populate_lic: Started
NOTE: recipe dpkg-1.22.18-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_populate_lic unihash changed to ab3d51517bb9394d5f333a6e1226dacaccc397e00b771bc485e24a19b2284dce
NOTE: recipe dpkg-1.22.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch unihash changed to 90ac81bff75bd61d9e8d422c2ace9d1f57b051fbd2359842c387342b6ca1d4fe
NOTE: recipe dpkg-native-1.22.18-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch)
NOTE: recipe dpkg-native-1.22.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch unihash changed to 35e1d3312c48af04632a866074b6863bf3f8b538a490fdc89521f165e8729015
NOTE: Running task 1447 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_configure)
NOTE: recipe dpkg-native-1.22.18-r0: task do_configure: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_configure: Succeeded
NOTE: Running task 1448 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_compile)
NOTE: recipe dpkg-native-1.22.18-r0: task do_compile: Started
NOTE: recipe perl-5.40.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 701 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.18-r0: task do_install: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1833 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1974 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_collect_spdx_deps)
NOTE: recipe dpkg-1.22.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.22.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe dpkg-1.22.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.22.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1987 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_configure)
NOTE: recipe dpkg-1.22.18-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image install
| Making install in lib
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib'
| Making install in compat
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/compat'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/compat'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/compat'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/compat'
| Making install in dpkg
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/dpkg'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/dpkg'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/include/dpkg'
|  /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libdpkg.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 libdpkg.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/ar.h ../../../git/lib/dpkg/arch.h ../../../git/lib/dpkg/atomic-file.h ../../../git/lib/dpkg/buffer.h ../../../git/lib/dpkg/c-ctype.h ../../../git/lib/dpkg/color.h ../../../git/lib/dpkg/command.h ../../../git/lib/dpkg/compress.h ../../../git/lib/dpkg/db-ctrl.h ../../../git/lib/dpkg/db-fsys.h ../../../git/lib/dpkg/deb-version.h ../../../git/lib/dpkg/debug.h ../../../git/lib/dpkg/dir.h ../../../git/lib/dpkg/dpkg.h ../../../git/lib/dpkg/dpkg-db.h ../../../git/lib/dpkg/ehandle.h ../../../git/lib/dpkg/error.h ../../../git/lib/dpkg/execname.h ../../../git/lib/dpkg/fdio.h ../../../git/lib/dpkg/file.h ../../../git/lib/dpkg/fsys.h ../../../git/lib/dpkg/glob.h ../../../git/lib/dpkg/macros.h ../../../git/lib/dpkg/meminfo.h ../../../git/lib/dpkg/namevalue.h ../../../git/lib/dpkg/options.h ../../../git/lib/dpkg/pager.h ../../../git/lib/dpkg/parsedump.h ../../../git/lib/dpkg/path.h ../../../git/lib/
 dpkg/pkg.h ../../../git/lib/dpkg/pkg-array.h ../../../git/lib/dpkg/pkg-files.h ../../../git/lib/dpkg/pkg-format.h ../../../git/lib/dpkg/pkg-list.h ../../../git/lib/dpkg/pkg-queue.h ../../../git/lib/dpkg/pkg-show.h ../../../git/lib/dpkg/pkg-spec.h ../../../git/lib/dpkg/progname.h ../../../git/lib/dpkg/program.h ../../../git/lib/dpkg/progress.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/include/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/report.h ../../../git/lib/dpkg/string.h ../../../git/lib/dpkg/strvec.h ../../../git/lib/dpkg/subproc.h ../../../git/lib/dpkg/sysuser.h ../../../git/lib/dpkg/tarfn.h ../../../git/lib/dpkg/treewalk.h ../../../git/lib/dpkg/trigdeferred.h ../../../git/lib/dpkg/triglib.h ../../../git/lib/dpkg/varbuf.h ../../../git/lib/dpkg/version.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/include/dpkg'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/libdpkg.la
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.a /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/libdpkg.a
| libtool: install: chmod 644 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/libdpkg.a
| libtool: install: ranlib -D /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/libdpkg.a
| libtool: warning: remember to run 'libtool --finish /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib/dpkg'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/lib'
| Making install in src
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/src'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/src'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/etc/dpkg/dpkg.cfg.d
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/libexec/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg/info
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg dpkg-deb dpkg-divert dpkg-query dpkg-realpath dpkg-split dpkg-statoverride dpkg-trigger '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-maintscript-helper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg/parts
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-db-backup dpkg-db-keeper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/libexec/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg/updates
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg/sh'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/src/sh/dpkg-error.sh '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg/sh'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-deb /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-deb
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-divert /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-divert
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-query /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-query
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-realpath /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-realpath
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-split /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-split
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-statoverride /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-statoverride
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-trigger /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-trigger
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/src'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/src'
| Making install in utils
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/utils'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/utils'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/etc/alternatives
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/sbin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/bash-completion/completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/polkit-1/actions'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg/alternatives
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c update-alternatives '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/utils/README.alternatives /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/etc/alternatives/README
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 org.dpkg.pkexec.update-alternatives.policy '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/polkit-1/actions'
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/sbin'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c update-alternatives /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/update-alternatives
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/sbin/start-stop-daemon
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/utils'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/utils'
| Making install in scripts
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| Making install in mk
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts/mk'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts/mk'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/mk/architecture.mk ../../../git/scripts/mk/buildapi.mk ../../../git/scripts/mk/buildflags.mk ../../../git/scripts/mk/buildopts.mk ../../../git/scripts/mk/buildtools.mk ../../../git/scripts/mk/default.mk ../../../git/scripts/mk/pkg-info.mk ../../../git/scripts/mk/vendor.mk '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts/mk'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts/mk'
| Making install in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts/po'
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts/po'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/zsh/vendor-completions'
| for module in Dpkg/Arch.pm Dpkg/Archive/Ar.pm Dpkg/BuildAPI.pm Dpkg/BuildDriver.pm Dpkg/BuildDriver/DebianRules.pm Dpkg/BuildEnv.pm Dpkg/BuildFlags.pm Dpkg/BuildInfo.pm Dpkg/BuildOptions.pm Dpkg/BuildProfiles.pm Dpkg/BuildTree.pm Dpkg/BuildTypes.pm Dpkg/Build/Info.pm Dpkg/Changelog.pm Dpkg/Changelog/Debian.pm Dpkg/Changelog/Entry.pm Dpkg/Changelog/Entry/Debian.pm Dpkg/Changelog/Parse.pm Dpkg/Checksums.pm Dpkg/Compression.pm Dpkg/Compression/FileHandle.pm Dpkg/Compression/Process.pm Dpkg/Conf.pm Dpkg/Control.pm Dpkg/Control/Changelog.pm Dpkg/Control/FieldsCore.pm Dpkg/Control/Fields.pm Dpkg/Control/Info.pm Dpkg/Control/HashCore.pm Dpkg/Control/HashCore/Tie.pm Dpkg/Control/Hash.pm Dpkg/Control/Tests.pm Dpkg/Control/Tests/Entry.pm Dpkg/Control/Types.pm Dpkg/Deps.pm Dpkg/Deps/AND.pm Dpkg/Deps/KnownFacts.pm Dpkg/Deps/Multiple.pm Dpkg/Deps/OR.pm Dpkg/Deps/Simple.pm Dpkg/Deps/Union.pm Dpkg/Dist/Files.pm Dpkg/ErrorHandling.pm Dpkg/Exit.pm Dpkg/File.pm Dpkg/Getopt.pm Dpkg/Gettext.pm Dpkg/In
 dex.pm Dpkg/Interface/Storable.pm Dpkg/IPC.pm Dpkg/Lock.pm Dpkg/OpenPGP.pm Dpkg/OpenPGP/Backend.pm Dpkg/OpenPGP/Backend/GnuPG.pm Dpkg/OpenPGP/Backend/SOP.pm Dpkg/OpenPGP/Backend/Sequoia.pm Dpkg/OpenPGP/ErrorCodes.pm Dpkg/OpenPGP/KeyHandle.pm Dpkg/Package.pm Dpkg/Path.pm Dpkg/Shlibs.pm Dpkg/Shlibs/Objdump.pm Dpkg/Shlibs/Objdump/Object.pm Dpkg/Shlibs/Symbol.pm Dpkg/Shlibs/SymbolFile.pm Dpkg/Shlibs/Cppfilt.pm Dpkg/Source/Archive.pm Dpkg/Source/BinaryFiles.pm Dpkg/Source/Format.pm Dpkg/Source/Functions.pm Dpkg/Source/Package.pm Dpkg/Source/Package/V1.pm Dpkg/Source/Package/V2.pm Dpkg/Source/Package/V3/Bzr.pm Dpkg/Source/Package/V3/Custom.pm Dpkg/Source/Package/V3/Native.pm Dpkg/Source/Package/V3/Git.pm Dpkg/Source/Package/V3/Quilt.pm Dpkg/Source/Patch.pm Dpkg/Source/Quilt.pm Dpkg/Substvars.pm Dpkg/Vendor.pm Dpkg/Vendor/Debian.pm Dpkg/Vendor/Default.pm Dpkg/Vendor/Devuan.pm Dpkg/Vendor/Ubuntu.pm Dpkg/Version.pm Dpkg.pm ; do \
|   name=`echo $module | sed -e 's|/|::|g' -e 's/\.pm$//'`; \
|   pod2man --utf8 --release=1.22.18 --date='2025-03-09'  --center=libdpkg-perl \
|     --name="$name" --section=3perl ../../git/scripts/$module \
|     >/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3/$name.3perl; \
|   if ! [ -s "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3/$name.3perl" ]; then \
|     echo "error: empty /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3/$name.3perl" 2>&1; \
|     exit 1; \
|   fi; \
| done
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-architecture dpkg-buildflags dpkg-buildapi dpkg-buildpackage dpkg-buildtree dpkg-checkbuilddeps dpkg-distaddfile dpkg-genbuildinfo dpkg-genchanges dpkg-gencontrol dpkg-gensymbols dpkg-mergechangelogs dpkg-name dpkg-parsechangelog dpkg-scanpackages dpkg-scansources dpkg-shlibdeps dpkg-source dpkg-vendor '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/scripts/completion/zsh/_dpkg-parsechangelog '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/zsh/vendor-completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump/Object.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Build/Info.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V1.pm ../../git/scripts/Dpkg/Source/Package/V2.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump.pm ../../git/scripts/Dpkg/Shlibs/Symbol.pm ../../git/scripts/Dpkg/Shlibs/SymbolFile.pm ../../git/scripts/Dpkg/Shlibs/Cppfilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V3/Bzr.pm ../../git/scripts/Dpkg/Source/Package/V3/Custom.pm ../../git/scripts/Dpkg/Source/Package/V3/Native.pm ../../git/scripts/Dpkg/Source/Package/V3/Git.pm ../../git/scripts/Dpkg/Source/Package/V3/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend.pm ../../git/scripts/Dpkg/OpenPGP/ErrorCodes.pm ../../git/scripts/Dpkg/OpenPGP/KeyHandle.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Debian.pm ../../git/scripts/Dpkg/Changelog/Entry.pm ../../git/scripts/Dpkg/Changelog/Parse.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Dist/Files.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/BuildDriver/DebianRules.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Archive.pm ../../git/scripts/Dpkg/Source/BinaryFiles.pm ../../git/scripts/Dpkg/Source/Format.pm ../../git/scripts/Dpkg/Source/Functions.pm ../../git/scripts/Dpkg/Source/Package.pm ../../git/scripts/Dpkg/Source/Patch.pm ../../git/scripts/Dpkg/Source/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/HashCore/Tie.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Arch.pm ../../git/scripts/Dpkg/BuildAPI.pm ../../git/scripts/Dpkg/BuildDriver.pm ../../git/scripts/Dpkg/BuildEnv.pm ../../git/scripts/Dpkg/BuildFlags.pm ../../git/scripts/Dpkg/BuildInfo.pm ../../git/scripts/Dpkg/BuildOptions.pm ../../git/scripts/Dpkg/BuildProfiles.pm ../../git/scripts/Dpkg/BuildTree.pm ../../git/scripts/Dpkg/BuildTypes.pm ../../git/scripts/Dpkg/Changelog.pm ../../git/scripts/Dpkg/Checksums.pm ../../git/scripts/Dpkg/Compression.pm ../../git/scripts/Dpkg/Conf.pm ../../git/scripts/Dpkg/Control.pm ../../git/scripts/Dpkg/Deps.pm ../../git/scripts/Dpkg/ErrorHandling.pm ../../git/scripts/Dpkg/Exit.pm ../../git/scripts/Dpkg/File.pm ../../git/scripts/Dpkg/Getopt.pm ../../git/scripts/Dpkg/Gettext.pm ../../git/scripts/Dpkg/Index.pm ../../git/scripts/Dpkg/IPC.pm ../../git/scripts/Dpkg/Lock.pm ../../git/scripts/Dpkg/OpenPGP.pm ../../git/scripts/Dpkg/Package.pm ../../git/scripts/
 Dpkg/Path.pm ../../git/scripts/Dpkg/Shlibs.pm ../../git/scripts/Dpkg/Substvars.pm ../../git/scripts/Dpkg/Vendor.pm ../../git/scripts/Dpkg/Version.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Deps/AND.pm ../../git/scripts/Dpkg/Deps/KnownFacts.pm ../../git/scripts/Dpkg/Deps/Multiple.pm ../../git/scripts/Dpkg/Deps/OR.pm ../../git/scripts/Dpkg/Deps/Simple.pm ../../git/scripts/Dpkg/Deps/Union.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Changelog.pm ../../git/scripts/Dpkg/Control/FieldsCore.pm ../../git/scripts/Dpkg/Control/Fields.pm ../../git/scripts/Dpkg/Control/Info.pm ../../git/scripts/Dpkg/Control/HashCore.pm ../../git/scripts/Dpkg/Control/Hash.pm ../../git/scripts/Dpkg/Control/Tests.pm ../../git/scripts/Dpkg/Control/Types.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Vendor/Debian.pm ../../git/scripts/Dpkg/Vendor/Default.pm ../../git/scripts/Dpkg/Vendor/Devuan.pm ../../git/scripts/Dpkg/Vendor/Ubuntu.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/.'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Tests/Entry.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Entry/Debian.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Compression/FileHandle.pm ../../git/scripts/Dpkg/Compression/Process.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Interface/Storable.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Archive/Ar.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/OpenPGP/Backend'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend/GnuPG.pm ../../git/scripts/Dpkg/OpenPGP/Backend/SOP.pm ../../git/scripts/Dpkg/OpenPGP/Backend/Sequoia.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg/OpenPGP/Backend'
| make  install-data-hook
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/perl-native/perl -i -p -e " s{^\x23!\s*/usr/bin/perl}{\x23!/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/perl-native/perl}; s{our \\\$CONFDIR = .*;}{our \\\$CONFDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/etc/dpkg';}; s{our \\\$ADMINDIR = .*;}{our \\\$ADMINDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg';}; s{our \\\$LIBDIR = .*;}{our \\\$LIBDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/libexec/dpkg';}; s{our \\\$DATADIR = .*;}{our \\\$DATADIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg';}; s{our \\
 \$PROGMAKE = .*;}{our \\\$PROGMAKE = 'make';}; s{our \\\$PROGTAR = .*;}{our \\\$PROGTAR = 'tar';}; s{our \\\$PROGPATCH = .*;}{our \\\$PROGPATCH = 'patch';}; s{our \\\$PROGVERSION = .*;}{our \\\$PROGVERSION = '1.22.18';}; " /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.2/Dpkg.pm
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| Making install in po
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/po'
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/po'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build'
| make[2]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/m4/dpkg-arch.m4 ../git/m4/dpkg-build.m4 ../git/m4/dpkg-compiler.m4 ../git/m4/dpkg-coverage.m4 ../git/m4/dpkg-funcs.m4 ../git/m4/dpkg-headers.m4 ../git/m4/dpkg-libs.m4 ../git/m4/dpkg-linker.m4 ../git/m4/dpkg-progs.m4 ../git/m4/dpkg-types.m4 ../git/m4/dpkg-unicode.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/README.api ../git/doc/README.feature-removal-schedule '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/spec/build-driver.txt ../git/doc/spec/frontend-api.txt ../git/doc/spec/protected-field.txt ../git/doc/spec/rootless-builds.txt ../git/doc/spec/triggers.txt '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/data/pie-compile.specs ../git/data/pie-link.specs ../git/data/no-pie-compile.specs ../git/data/no-pie-link.specs ../git/data/cputable ../git/data/ostable ../git/data/abitable ../git/data/tupletable '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build'
| sed: can't read /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/sbin/dpkg-*: No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.3832205:156 exit 2 from 'sed -i -e 's|^#!.*/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/perl-native.*/perl|#!/usr/bin/env nativeperl|' /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-* /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/sbin/dpkg-*'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.3832205, line 156
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.3832205, line 207
NOTE: recipe dpkg-native-1.22.18-r0: task do_install: Failed
NOTE: recipe dpkg-1.22.18-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1987 tasks of which 1969 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515072725.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515072725.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/log.do_install.3832205
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: dpkg-native-1.22.18-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.3832205' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/log.do_install.3832205
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install) failed with exit code '1'

--===============1717541423843358575==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.22.11-1.22.18.patch"

RnJvbSA1ZTAwNzFhMzllZTUxNDgzYjg1NTdiNDUyM2EyNmNjYTg1ZjczZjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6Mjg6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjIuMTEgLT4gMS4yMi4xOAoKLS0tCiAuLi4vZHBrZy9kcGtnLzAwMDEt
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
Li4vZHBrZy97ZHBrZ18xLjIyLjExLmJiID0+IGRwa2dfMS4yMi4xOC5iYn0gICAgICAgICAgICAg
fCAyICstCiAxMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIyLjExLmJiID0+
IGRwa2dfMS4yMi4xOC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQtZm9yLXJpc2N2MzItQ1BVLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLUFkZC1zdXBwb3J0LWZvci1yaXNjdjMy
LUNQVS5wYXRjaAppbmRleCA4OTQzZjZjMmYwLi44ZTQyODgzYTgxIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQtZm9yLXJpc2N2MzIt
Q1BVLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQt
c3VwcG9ydC1mb3ItcmlzY3YzMi1DUFUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjMzMy
YzJhNDYyNTUxOWEyYjYwNjViOWQ5ZmM3MjRlODRjOWI2ZDYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDIxM2ZjNGRhYWFiNjRmNWUzYzM3ZTEwNGQzMjQyNTZkOWEwMmU1NDkgTW9uIFNl
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
dGFyLWNmLnBhdGNoCmluZGV4IDE4NWJiYjkwZjEuLjI3MmI5YzZhZWIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4t
b2YtMS1mcm9tLXRhci1jZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9k
cGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDA2Nzk5MmYyZDBiMGZmNmNhMTE0MDMxNjM2ZWIwZTFlYWM3OTE4
OTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM5MDI3YzBkMjg1ZmMwMjYwNjI5Y2Qz
OWIxNDQwNzRjYWFlMzAwODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEVn
Z2xldG9uIDxwYXVsLmVnZ2xldG9uQGxpbnV4Lm1pY3Jvc29mdC5jb20+CiBEYXRlOiBUdWUsIDE2
IEp1biAyMDIwIDAzOjU3OjI1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkLmM6IGlnbm9y
ZSByZXR1cm4gb2YgMSBmcm9tIHRhciAtY2YKQEAgLTI4LDEwICsyOCwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBQYXVsIEVnZ2xldG9uIDxwYXVsLmVnZ2xldG9uQG1pY3Jvc29mdC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL2RlYi9idWlsZC5jIGIvc3JjL2RlYi9idWlsZC5jCi1pbmRleCA4N2JkNDE0MmUuLmU4NWZk
N2QwZiAxMDA2NDQKK2luZGV4IDgxODQ0ZTMwMC4uZTM4NmFlNjg3IDEwMDY0NAogLS0tIGEvc3Jj
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
YXRjaAppbmRleCA2N2ZjZTg5ZDgwLi42ZjY1ZDE5MWExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0LW11c2x4MzItYnVpbGQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWRwa2ctU3VwcG9y
dC1tdXNseDMyLWJ1aWxkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZjZjNjQxZTNmYzI0
OGQwYzg2NGU0ZTc1MmM0NjA5NDEyMDY3ZGY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwN2RmZjUxODIxZGVhZGZmZDVlM2ExMTY1YTYxOTUyZjY4N2U4MDU2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogc3dlZWF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+CiBEYXRl
OiBTdW4sIDEwIFNlcCAyMDE3IDAwOjE0OjE1IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRwa2c6
IFN1cHBvcnQgbXVzbHgzMiBidWlsZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy8wMDAxLXNjcmlwdC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtc2NyaXB0LmMtYXZvaWQtdXNlLW9mLWNo
cm9vdC5wYXRjaAppbmRleCBkMDQ1OWNkMDE3Li42YTYxNmM2ZmFlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtc2NyaXB0LmMtYXZvaWQtdXNlLW9mLWNo
cm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtc2Ny
aXB0LmMtYXZvaWQtdXNlLW9mLWNocm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWU1
ZjA2ZDM5NmZlNjMxOTkwNDc0YmE2ZGY4MzQyODk4Nzg1NTM2NSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZGQ5YmY2NTU5YWQyNmI3NTNlNmQwMjU1ODY4ZmE5M2MxZjg0YjdmMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAyNiBBdWcgMjAxNSAxNjoyNTo0NSArMDMwMAogU3Vi
amVjdDogW1BBVENIXSBzY3JpcHQuYzogYXZvaWQgdXNlIG9mIGNocm9vdApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAyLUFkYXB0LXRvLWxpbnV4LXdycy1r
ZXJuZWwtdmVyc2lvbi13aGljaC1oYXMtY2hhcmFjdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtlcm5lbC12ZXJzaW9uLXdo
aWNoLWhhcy1jaGFyYWN0ZS5wYXRjaAppbmRleCBhNWM4MDc3M2E1Li45OWE4YmY4MjRjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGlu
dXgtd3JzLWtlcm5lbC12ZXJzaW9uLXdoaWNoLWhhcy1jaGFyYWN0ZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtlcm5l
bC12ZXJzaW9uLXdoaWNoLWhhcy1jaGFyYWN0ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NmU4OGU4YjdiNjkyNDc1MTExMjk2NmYzMjk1MjU5NTY3MzVkZTliNCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gY2I2ZTExNGEwYjBlMDc5ZjM2M2I1Mzk1NzYzYjUzYWU3NTNiMzg2ZiBN
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
LWZvci1hbGwtcy5wYXRjaAppbmRleCBlNDlkNTQxNTJjLi44YjEzNGViZTY5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rp
b24tZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13
b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGZjOTBh
M2VkMDFhN2ZjZTM0ZGU5MjU5Nzk0NjA2MzhiOGE1NzQwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMTZmMzI3YjBhZDliYjY0ZjExYTE0NDc0MDJiNjAwNzRjMWZiNzNjMiBNb24gU2Vw
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
aW5kZXggNGY2MGE4OWE1Ni4uMjA2NDFhNTI0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rwa2cvZHBrZy8wMDA2LWFkZC1tdXNsZWFiaS10by1rbm93bi10YXJnZXQtdHJpcGV0
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDYtYWRkLW11
c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBlM2RjNjlhYTk4N2IzNzllMjQ3ZGRlM2ZjZTQ3OWU0M2JlNmM4MWFhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBkMDM3OWU2YzU4ODY4YjhjZWFiNGY1MjE0NmRlOTlhMjZhNmYyOGFj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFdlZCwgMzAgRGVjIDIwMTUgMjM6MDU6NDEgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYWRkIG11c2xlYWJpIHRvIGtub3duIHRhcmdldCB0cmlwZXRzCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDctZHBrZy1kZWItYnVpbGQuYy1SZW1v
dmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Rwa2cvZHBrZy8wMDA3LWRwa2ctZGViLWJ1aWxkLmMtUmVtb3ZlLXVzYWdlLW9mLWNsYW1w
LW10aW1lLWluLXRhci5wYXRjaAppbmRleCBkZWQxNzA3ZGZkLi4xODM5MmZlYWYwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDctZHBrZy1kZWItYnVpbGQu
Yy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNy1kcGtnLWRlYi1idWlsZC5jLVJlbW92ZS11c2Fn
ZS1vZi1jbGFtcC1tdGltZS1pbi10YXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIwYmE3
ZmQ4OTM5ZTk3YmVjM2Q3MGE2N2MwYWFjNzZkZGM2Nzg5OGQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDMyNGIxMTZkYWEyMmZhZDk3ZTY1YjE4MjE3MTBhODY5Y2E2NjUwMGUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW49QzM9QURiYWw9MjBMaW09QzM9
QjNuPz0gPGFuaWJhbC5saW1vbkBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBUdWUsIDIxIEZlYiAy
MDE3IDExOjIzOjI3IC0wNjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRwa2ctZGViL2J1aWxkLmM6IFJl
bW92ZSB1c2FnZSBvZiAtLWNsYW1wLW10aW1lIGluIHRhcgpAQCAtMjcsMTAgKzI3LDEwIEBAIFNp
Z25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L2RlYi9idWlsZC5jIGIvc3JjL2RlYi9idWlsZC5jCi1pbmRleCBhNDE4ZGQxMjIuLjg3YmQ0MTQy
ZSAxMDA2NDQKK2luZGV4IGVlZmMzNjlkYi4uODE4NDRlMzAwIDEwMDY0NAogLS0tIGEvc3JjL2Rl
Yi9idWlsZC5jCiArKysgYi9zcmMvZGViL2J1aWxkLmMKLUBAIC01MDQsNyArNTA0LDcgQEAgdGFy
YmFsbF9wYWNrKGNvbnN0IGNoYXIgKmRpciwgZmlsZW5hbWVzX2ZlZWRfZnVuYyAqdGFyX2ZpbGVu
YW1lc19mZWVkZXIsCitAQCAtNTI4LDcgKzUyOCw3IEBAIHRhcmJhbGxfcGFjayhjb25zdCBjaGFy
ICpkaXIsIGZpbGVuYW1lc19mZWVkX2Z1bmMgKnRhcl9maWxlbmFtZXNfZmVlZGVyLAogIAogICAg
ICBjb21tYW5kX2luaXQoJmNtZCwgVEFSLCAidGFyIC1jZiIpOwogICAgICBjb21tYW5kX2FkZF9h
cmdzKCZjbWQsICJ0YXIiLCAiLWNmIiwgIi0iLCAiLS1mb3JtYXQ9Z251IiwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnku
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FkZF9hcm1lYl90cmlwbGV0
X2VudHJ5LnBhdGNoCmluZGV4IGQxZmFjMjE2OGEuLmIzYzEwYjE4ZTAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnkucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxl
dF9lbnRyeS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGRlZDMyYTM1Mjg3YTg0MGRlN2U1
MDVjNjZlNzZjY2NkOWVkYmFjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjhjNTYx
NzRhZmNhOTk1NmFkMWE1NDEwMTUxMGM5YzAxODA4MTk3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206ICJLcmlzaG5hbmphbmFwcGEsIEphZ2FkZWVzaCIKICA8amFnYWRlZXNoLmtyaXNo
bmFuamFuYXBwYUBjYXZpdW1uZXR3b3Jrcy5jb20+CiBEYXRlOiBXZWQsIDggQXByIDIwMTUgMTg6
MDg6MTQgKzA1MzAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cv
YXJjaF9wbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5w
YXRjaAppbmRleCBiNWEyOTIzMWRkLi41ODA4MzdjOThhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FyY2hfcG0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rwa2cvZHBrZy9hcmNoX3BtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4MTJk
YmI2NGYyODA1YTMyNTdlZjljOWE2MWFiYmQxMGUwYjNhMDhjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA5Y2IxY2FhMzYyY2EyNTg3ZGMzN2JhZTBmNDEzNmE3MDM1Y2RmNzQ5IE1vbiBT
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
IDNmM2UwODM1MWMuLjA3ZGNkN2UzMTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2cvbm9tYW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cv
ZHBrZy9ub21hbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTY3MWI0M2E1MmJmNTc4NWZl
NGFhZDg0NzEyZGJhYmM2Yzg2YjM5ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTI2
NGVhYWEzMWIwNWI2ZWNiMWY5ZmJiYTA4NzA5N2U0ZGM3YzE4NSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IENocmlzIExhcnNvbiA8a2VyZ290aEBvcGVuZWRoYW5kLmNvbT4KIERhdGU6
IFR1ZSwgNSBTZXAgMjAwNiAwNzoyNDo1OCArMDAwMAogU3ViamVjdDogW1BBVENIXSBBZGQgZHBr
ZywgbW9kaWZpZWQgZnJvbSB1cHN0cmVhbSBvZS4KQEAgLTksNyArOSw3IEBAIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbZGlzYWJsZSBmZWF0dXJlXQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1p
bmRleCA3NGY4ZGYxOTcuLjM1ZTVlZWUzOSAxMDA2NDQKK2luZGV4IDI4OTVhYmVjNy4uOWRiNzJm
MTZjIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCiBAQCAtMTEs
NyArMTEsNiBAQCBTVUJESVJTID0gXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kcGtnL2Rwa2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2gKaW5kZXggZDNh
MWExMzA5OC4uNjE0N2Q3MWRmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZHBrZy9kcGtnL3JlbW92ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA3ZDY5ZGUxMTRhYTY5NmNmYjVlMzFiNDkxYTY1N2NhNmI2Y2JiYmQ1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1NmFlMGM5ZTZjZDNhY2JiYzU0N2Y5ZTVjMDlh
ZDE1ZDZmODI5YjI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ29uc3RhbnRpbiBN
dXNjYSA8Y29uc3RhbnRpbngubXVzY2FAaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyOCBBdWcgMjAx
MiAxNzowMjo0MCArMDMwMAogU3ViamVjdDogW1BBVENIXSBidXN5Ym94LTEuMTkuNCB0YXIgdXRp
bGl0eSBkb2Vzbid0IHN1cHBvcnQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2dfMS4yMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4y
Mi4xOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnXzEuMjIuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2dfMS4yMi4xOC5iYgppbmRleCA0N2E4ZDVkNWVhLi5kMjk1YWQwNDcwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjIuMTEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIyLjE4LmJiCkBAIC0xNyw2ICsxNyw2
IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kcGtnLXRlYW0vZHBrZy5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4KIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gIiBmaWxlOi8vMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5w
YXRjaCIKIAotU1JDUkVWID0gImVlN2U5MTE4ZDBhOTU4MWNiMDBjNWNlMDJkY2NkNTYxYjMwOTYz
ODciCitTUkNSRVYgPSAiMGQxYmI1ZGNhYzFmMmVmYjU5MzA4NTE0YzM5NmM0MjY1M2ZjZWEwMSIK
IAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuNDcuMQoK

--===============1717541423843358575==--

