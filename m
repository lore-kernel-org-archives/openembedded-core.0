Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F80C369B6
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18038.1743511387886438903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dT9z+hKm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dQr29xXQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f16095a2-42f6f6d0-6541-41b4-a814-d136b4086311-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tVAgsrpni250OK+2Np2Wm4oORLwNfChMgOjd5XnwqwY=;
	b=dT9z+hKmys/uyOzOXcfny947DUqrNUOMyz+bvnLIgXLmBh4gCsGtexalVugniU12
	Fe21/GoWQAl8sHwnh2Ki6RQO6K3n3PZKhQne2QerW53XOpzWLIEDZf7RsWCcXI5e1mf
	C55fq6/ssJ0d7sMSYx3FviAXtR6Y82P2Owg8Kd8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tVAgsrpni250OK+2Np2Wm4oORLwNfChMgOjd5XnwqwY=;
	b=dQr29xXQpjYur8FyYgkJ2JqRvBKMV0MVqrJjA+kRTTY56hmxqMBBwBgE0rnxcpLw
	V2VcLeA9wlJ5w8CfXEL04I1J41CDnf5t18GmZOfiHSfQ2sVwY65FTm01keMTg89CVAg
	ldGmWSJubnpqKsiKdyDb4QyRIconbWTgcU6rf4P0=
Content-Type: multipart/mixed; boundary="===============8411881251390125197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.18 FAILED
Message-ID: <01010195f16095a2-42f6f6d0-6541-41b4-a814-d136b4086311-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214050

--===============8411881251390125197==
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
From 287001482cbbbfe43a7ca0abd7c5b0e856e61e53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 07:54:44 +0000
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
index 8943f6c2f0..e485681b95 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -1,4 +1,4 @@
-From 5c332c2a4625519a2b6065b9d9fc724e84c9b6d6 Mon Sep 17 00:00:00 2001
+From 60b92259150f9a3bdc584b0c882c042944b2beb8 Mon Sep 17 00:00:00 2001
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
index 185bbb90f1..16788b6a30 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 067992f2d0b0ff6ca114031636eb0e1eac791892 Mon Sep 17 00:00:00 2001
+From 16b5d3da67206d44fb84a18343c05666eb03da2b Mon Sep 17 00:00:00 2001
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
index 67fce89d80..db769e9e44 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -1,4 +1,4 @@
-From df6c641e3fc248d0c864e4e752c4609412067df7 Mon Sep 17 00:00:00 2001
+From dc467bd297d07b075c0f0ecd4772aca0806de665 Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
index d0459cd017..90f9ba7061 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
@@ -1,4 +1,4 @@
-From 5e5f06d396fe631990474ba6df83428987855365 Mon Sep 17 00:00:00 2001
+From dd2e588076e5a9454ec679d0c61a7e1302dbaf61 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] script.c: avoid use of chroot
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index a5c80773a5..15b492c7c5 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,4 +1,4 @@
-From 6e88e8b7b6924751112966f329525956735de9b4 Mon Sep 17 00:00:00 2001
+From 98ea16eaf4223a63b5b45c30f370626ff3b076b4 Mon Sep 17 00:00:00 2001
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
index e49d54152c..cc8d0f12db 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,4 +1,4 @@
-From 0fc90a3ed01a7fce34de925979460638b8a57402 Mon Sep 17 00:00:00 2001
+From d29299e9df5e1f9cbf8b60ed1b048e7afce0af9c Mon Sep 17 00:00:00 2001
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
index 4f60a89a56..6e3e8e6ef4 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -1,4 +1,4 @@
-From e3dc69aa987b379e247dde3fce479e43be6c81aa Mon Sep 17 00:00:00 2001
+From b5c7c0cf85e58859a0a834aaf506817fdba8fc14 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index ded1707dfd..df97e82374 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,4 +1,4 @@
-From 20ba7fd8939e97bec3d70a67c0aac76ddc67898d Mon Sep 17 00:00:00 2001
+From be6776611debc130591fe52e3504285b0b8852a9 Mon Sep 17 00:00:00 2001
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
index d1fac2168a..e4149777ac 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,4 +1,4 @@
-From 8ded32a35287a840de7e505c66e76cccd9edbac6 Mon Sep 17 00:00:00 2001
+From 9d69b6e03f7dba3c85b36a6c1dbd440783910cf4 Mon Sep 17 00:00:00 2001
 From: "Krishnanjanappa, Jagadeesh"
  <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Date: Wed, 8 Apr 2015 18:08:14 +0530
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index b5a29231dd..99d912a10c 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,4 +1,4 @@
-From 812dbb64f2805a3257ef9c9a61abbd10e0b3a08c Mon Sep 17 00:00:00 2001
+From 30097bc1407f28ca47770457c9460dadb1729464 Mon Sep 17 00:00:00 2001
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
index 3f3e08351c..a62111caf8 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,4 +1,4 @@
-From e671b43a52bf5785fe4aad84712dbabc6c86b39e Mon Sep 17 00:00:00 2001
+From 9d3ef3ece259d84756d19c9bf92e9affe77e52c0 Mon Sep 17 00:00:00 2001
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
index d3a1a13098..b4a9ff7926 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,4 @@
-From 7d69de114aa696cfb5e31b491a657ca6b6cbbbd5 Mon Sep 17 00:00:00 2001
+From dc80c7200e91a34d2c4b07427e8e92e2b95bb536 Mon Sep 17 00:00:00 2001
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


--===============8411881251390125197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1888 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:9a96800854e9d7de2e626b2e48726844ce906f4a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 309 Local 292 Mirrors 0 Missed 17 Current 398 (94% match, 97% complete)
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 610 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_setscene)
NOTE: Running setscene task 623 of 707 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_recipe_qa_setscene)
NOTE: recipe dpkg-1.22.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dpkg-1.22.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Started
NOTE: Running task 1502 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_fetch)
NOTE: recipe dpkg-1.22.18-r0: task do_fetch: Started
NOTE: Running task 1707 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 707 of 707 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-1.22.18-r0: task do_fetch: Succeeded
NOTE: recipe dpkg-native-1.22.18-r0: task do_fetch: Started
NOTE: Running task 1839 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1914 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.22.18-r0: task do_unpack: Started
NOTE: recipe dpkg-1.22.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_fetch: Succeeded
NOTE: Running task 1976 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_unpack)
NOTE: Running task 1977 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-native-1.22.18-r0: task do_unpack: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.22.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.22.18-r0: task do_unpack: Succeeded
NOTE: Running task 1978 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_patch)
NOTE: Running task 1979 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_collect_spdx_deps)
NOTE: recipe dpkg-1.22.18-r0: task do_patch: Started
NOTE: recipe dpkg-1.22.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe dpkg-1.22.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dpkg-native-1.22.18-r0: task do_unpack: Succeeded
NOTE: Running task 1980 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_patch)
NOTE: recipe dpkg-native-1.22.18-r0: task do_patch: Started
NOTE: recipe dpkg-1.22.18-r0: task do_patch: Succeeded
NOTE: Running task 1981 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1982 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_populate_lic)
NOTE: recipe dpkg-1.22.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.22.18-r0: task do_populate_lic: Started
NOTE: recipe dpkg-1.22.18-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_populate_lic unihash changed to ab3d51517bb9394d5f333a6e1226dacaccc397e00b771bc485e24a19b2284dce
NOTE: recipe dpkg-1.22.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch unihash changed to 90ac81bff75bd61d9e8d422c2ace9d1f57b051fbd2359842c387342b6ca1d4fe
NOTE: Setscene tasks completed
NOTE: Running task 1983 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_configure)
NOTE: recipe dpkg-1.22.18-r0: task do_configure: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_patch: Succeeded
NOTE: Running task 1984 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch)
NOTE: recipe dpkg-native-1.22.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_deploy_source_date_epoch unihash changed to 35e1d3312c48af04632a866074b6863bf3f8b538a490fdc89521f165e8729015
NOTE: Setscene tasks completed
NOTE: Running task 1985 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_configure)
NOTE: recipe dpkg-native-1.22.18-r0: task do_configure: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_configure: Succeeded
NOTE: Running task 1986 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_compile)
NOTE: recipe dpkg-native-1.22.18-r0: task do_compile: Started
NOTE: recipe dpkg-native-1.22.18-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install)
NOTE: recipe dpkg-native-1.22.18-r0: task do_install: Started
NOTE: recipe dpkg-1.22.18-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_compile)
NOTE: recipe dpkg-1.22.18-r0: task do_compile: Started
NOTE: recipe dpkg-1.22.18-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install)
NOTE: recipe dpkg-1.22.18-r0: task do_install: Started
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
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-db-backup dpkg-db-keeper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/libexec/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg/parts
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
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 org.dpkg.pkexec.update-alternatives.policy '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/polkit-1/actions'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/utils/README.alternatives /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/etc/alternatives/README
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
|   pod2man --utf8 --release=1.22.18-dirty --date='2025-03-09'  --center=libdpkg-perl \
|     --name="$name" --section=3perl ../../git/scripts/$module \
|     >/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3/$name.3perl; \
|   if ! [ -s "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3/$name.3perl" ]; then \
|     echo "error: empty /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/man/man3/$name.3perl" 2>&1; \
|     exit 1; \
|   fi; \
| done
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-architecture dpkg-buildflags dpkg-buildapi dpkg-buildpackage dpkg-buildtree dpkg-checkbuilddeps dpkg-distaddfile dpkg-genbuildinfo dpkg-genchanges dpkg-gencontrol dpkg-gensymbols dpkg-mergechangelogs dpkg-name dpkg-parsechangelog dpkg-scanpackages dpkg-scansources dpkg-shlibdeps dpkg-source dpkg-vendor '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/scripts/completion/zsh/_dpkg-parsechangelog '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/zsh/vendor-completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump/Object.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Build/Info.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V1.pm ../../git/scripts/Dpkg/Source/Package/V2.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump.pm ../../git/scripts/Dpkg/Shlibs/Symbol.pm ../../git/scripts/Dpkg/Shlibs/SymbolFile.pm ../../git/scripts/Dpkg/Shlibs/Cppfilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V3/Bzr.pm ../../git/scripts/Dpkg/Source/Package/V3/Custom.pm ../../git/scripts/Dpkg/Source/Package/V3/Native.pm ../../git/scripts/Dpkg/Source/Package/V3/Git.pm ../../git/scripts/Dpkg/Source/Package/V3/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend.pm ../../git/scripts/Dpkg/OpenPGP/ErrorCodes.pm ../../git/scripts/Dpkg/OpenPGP/KeyHandle.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Debian.pm ../../git/scripts/Dpkg/Changelog/Entry.pm ../../git/scripts/Dpkg/Changelog/Parse.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Dist/Files.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/BuildDriver/DebianRules.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Archive.pm ../../git/scripts/Dpkg/Source/BinaryFiles.pm ../../git/scripts/Dpkg/Source/Format.pm ../../git/scripts/Dpkg/Source/Functions.pm ../../git/scripts/Dpkg/Source/Package.pm ../../git/scripts/Dpkg/Source/Patch.pm ../../git/scripts/Dpkg/Source/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/HashCore/Tie.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Arch.pm ../../git/scripts/Dpkg/BuildAPI.pm ../../git/scripts/Dpkg/BuildDriver.pm ../../git/scripts/Dpkg/BuildEnv.pm ../../git/scripts/Dpkg/BuildFlags.pm ../../git/scripts/Dpkg/BuildInfo.pm ../../git/scripts/Dpkg/BuildOptions.pm ../../git/scripts/Dpkg/BuildProfiles.pm ../../git/scripts/Dpkg/BuildTree.pm ../../git/scripts/Dpkg/BuildTypes.pm ../../git/scripts/Dpkg/Changelog.pm ../../git/scripts/Dpkg/Checksums.pm ../../git/scripts/Dpkg/Compression.pm ../../git/scripts/Dpkg/Conf.pm ../../git/scripts/Dpkg/Control.pm ../../git/scripts/Dpkg/Deps.pm ../../git/scripts/Dpkg/ErrorHandling.pm ../../git/scripts/Dpkg/Exit.pm ../../git/scripts/Dpkg/File.pm ../../git/scripts/Dpkg/Getopt.pm ../../git/scripts/Dpkg/Gettext.pm ../../git/scripts/Dpkg/Index.pm ../../git/scripts/Dpkg/IPC.pm ../../git/scripts/Dpkg/Lock.pm ../../git/scripts/Dpkg/OpenPGP.pm ../../git/scripts/Dpkg/Package.pm ../../git/scripts/
 Dpkg/Path.pm ../../git/scripts/Dpkg/Shlibs.pm ../../git/scripts/Dpkg/Substvars.pm ../../git/scripts/Dpkg/Vendor.pm ../../git/scripts/Dpkg/Version.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Deps/AND.pm ../../git/scripts/Dpkg/Deps/KnownFacts.pm ../../git/scripts/Dpkg/Deps/Multiple.pm ../../git/scripts/Dpkg/Deps/OR.pm ../../git/scripts/Dpkg/Deps/Simple.pm ../../git/scripts/Dpkg/Deps/Union.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Changelog.pm ../../git/scripts/Dpkg/Control/FieldsCore.pm ../../git/scripts/Dpkg/Control/Fields.pm ../../git/scripts/Dpkg/Control/Info.pm ../../git/scripts/Dpkg/Control/HashCore.pm ../../git/scripts/Dpkg/Control/Hash.pm ../../git/scripts/Dpkg/Control/Tests.pm ../../git/scripts/Dpkg/Control/Types.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Vendor/Debian.pm ../../git/scripts/Dpkg/Vendor/Default.pm ../../git/scripts/Dpkg/Vendor/Devuan.pm ../../git/scripts/Dpkg/Vendor/Ubuntu.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/.'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Tests/Entry.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Entry/Debian.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Compression/FileHandle.pm ../../git/scripts/Dpkg/Compression/Process.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Interface/Storable.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Archive/Ar.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP/Backend'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend/GnuPG.pm ../../git/scripts/Dpkg/OpenPGP/Backend/SOP.pm ../../git/scripts/Dpkg/OpenPGP/Backend/Sequoia.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg/OpenPGP/Backend'
| make  install-data-hook
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/perl-native/perl -i -p -e " s{^\x23!\s*/usr/bin/perl}{\x23!/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/perl-native/perl}; s{our \\\$CONFDIR = .*;}{our \\\$CONFDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/etc/dpkg';}; s{our \\\$ADMINDIR = .*;}{our \\\$ADMINDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/var/lib/dpkg';}; s{our \\\$LIBDIR = .*;}{our \\\$LIBDIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/libexec/dpkg';}; s{our \\\$DATADIR = .*;}{our \\\$DATADIR = '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/share/dpkg';}; s{our \\
 \$PROGMAKE = .*;}{our \\\$PROGMAKE = 'make';}; s{our \\\$PROGTAR = .*;}{our \\\$PROGTAR = 'tar';}; s{our \\\$PROGPATCH = .*;}{our \\\$PROGPATCH = 'patch';}; s{our \\\$PROGVERSION = .*;}{our \\\$PROGVERSION = '1.22.18-dirty';}; " /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/lib/perl-native/perl/5.40.0/Dpkg.pm
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.2504079:156 exit 2 from 'sed -i -e 's|^#!.*/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/perl-native.*/perl|#!/usr/bin/env nativeperl|' /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/bin/dpkg-* /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/image/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/recipe-sysroot-native/usr/sbin/dpkg-*'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.2504079, line 156
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.2504079, line 207
NOTE: recipe dpkg-native-1.22.18-r0: task do_install: Failed
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybu
 ild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmd/libmd_1.1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0
 .bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'libxcrypt', 'ncurses', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'perl', 'quilt-native', 'bzip2', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'bash-completion', 'gdbm', 'libmd', 'gettext-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'make-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image install
| Making install in lib
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib'
| Making install in compat
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/compat'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/compat'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/compat'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/compat'
| Making install in dpkg
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/dpkg'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/dpkg'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/pkgconfig'
|  /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libdpkg.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/include/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 libdpkg.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/ar.h ../../../git/lib/dpkg/arch.h ../../../git/lib/dpkg/atomic-file.h ../../../git/lib/dpkg/buffer.h ../../../git/lib/dpkg/c-ctype.h ../../../git/lib/dpkg/color.h ../../../git/lib/dpkg/command.h ../../../git/lib/dpkg/compress.h ../../../git/lib/dpkg/db-ctrl.h ../../../git/lib/dpkg/db-fsys.h ../../../git/lib/dpkg/deb-version.h ../../../git/lib/dpkg/debug.h ../../../git/lib/dpkg/dir.h ../../../git/lib/dpkg/dpkg.h ../../../git/lib/dpkg/dpkg-db.h ../../../git/lib/dpkg/ehandle.h ../../../git/lib/dpkg/error.h ../../../git/lib/dpkg/execname.h ../../../git/lib/dpkg/fdio.h ../../../git/lib/dpkg/file.h ../../../git/lib/dpkg/fsys.h ../../../git/lib/dpkg/glob.h ../../../git/lib/dpkg/macros.h ../../../git/lib/dpkg/meminfo.h ../../../git/lib/dpkg/namevalue.h ../../../git/lib/dpkg/options.h ../../../git/lib/dpkg/pager.h ../../../git/lib/dpkg/parsedump.h ../../../git/lib/dpkg/path.h ../../../git/lib/
 dpkg/pkg.h ../../../git/lib/dpkg/pkg-array.h ../../../git/lib/dpkg/pkg-files.h ../../../git/lib/dpkg/pkg-format.h ../../../git/lib/dpkg/pkg-list.h ../../../git/lib/dpkg/pkg-queue.h ../../../git/lib/dpkg/pkg-show.h ../../../git/lib/dpkg/pkg-spec.h ../../../git/lib/dpkg/progname.h ../../../git/lib/dpkg/program.h ../../../git/lib/dpkg/progress.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/include/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/lib/dpkg/report.h ../../../git/lib/dpkg/string.h ../../../git/lib/dpkg/strvec.h ../../../git/lib/dpkg/subproc.h ../../../git/lib/dpkg/sysuser.h ../../../git/lib/dpkg/tarfn.h ../../../git/lib/dpkg/treewalk.h ../../../git/lib/dpkg/trigdeferred.h ../../../git/lib/dpkg/triglib.h ../../../git/lib/dpkg/varbuf.h ../../../git/lib/dpkg/version.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/include/dpkg'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/libdpkg.la
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libdpkg.a /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/libdpkg.a
| libtool: install: chmod 644 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/libdpkg.a
| libtool: install: x86_64-poky-linux-gcc-ranlib /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/libdpkg.a
| libtool: warning: remember to run 'libtool --finish /usr/lib'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib/dpkg'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/lib'
| Making install in src
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/src'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/src'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/etc/dpkg/dpkg.cfg.d
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/libexec/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/var/lib/dpkg/info
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-maintscript-helper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-db-backup dpkg-db-keeper '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/libexec/dpkg'
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg dpkg-deb dpkg-divert dpkg-query dpkg-realpath dpkg-split dpkg-statoverride dpkg-trigger '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/var/lib/dpkg/parts
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg/sh'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/var/lib/dpkg/updates
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/src/sh/dpkg-error.sh '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg/sh'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-deb /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-deb
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-divert /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-divert
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-query /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-query
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-realpath /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-realpath
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-split /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-split
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-statoverride /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-statoverride
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-trigger /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-trigger
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/src'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/src'
| Making install in utils
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/utils'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/utils'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/sbin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/bash-completion/completions'
|   /bin/bash ../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/sbin'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c start-stop-daemon /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/sbin/start-stop-daemon
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/utils'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/utils'
| Making install in scripts
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| Making install in mk
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts/mk'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts/mk'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/mk/architecture.mk ../../../git/scripts/mk/buildapi.mk ../../../git/scripts/mk/buildflags.mk ../../../git/scripts/mk/buildopts.mk ../../../git/scripts/mk/buildtools.mk ../../../git/scripts/mk/default.mk ../../../git/scripts/mk/pkg-info.mk ../../../git/scripts/mk/vendor.mk '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts/mk'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts/mk'
| Making install in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts/po'
| installing ../../../git/scripts/po/ca.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ca/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/de.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/de/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/es.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/es/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/fr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/fr/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/nl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/nl/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/pl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/pl/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/pt.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/pt/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/ru.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ru/LC_MESSAGES/dpkg-dev.mo
| installing ../../../git/scripts/po/sv.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/sv/LC_MESSAGES/dpkg-dev.mo
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../git/scripts/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts/po'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/man/man3
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/zsh/vendor-completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/scripts/completion/zsh/_dpkg-parsechangelog '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/zsh/vendor-completions'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c dpkg-architecture dpkg-buildflags dpkg-buildapi dpkg-buildpackage dpkg-buildtree dpkg-checkbuilddeps dpkg-distaddfile dpkg-genbuildinfo dpkg-genchanges dpkg-gencontrol dpkg-gensymbols dpkg-mergechangelogs dpkg-name dpkg-parsechangelog dpkg-scanpackages dpkg-scansources dpkg-shlibdeps dpkg-source dpkg-vendor '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin'
| for module in Dpkg/Arch.pm Dpkg/Archive/Ar.pm Dpkg/BuildAPI.pm Dpkg/BuildDriver.pm Dpkg/BuildDriver/DebianRules.pm Dpkg/BuildEnv.pm Dpkg/BuildFlags.pm Dpkg/BuildInfo.pm Dpkg/BuildOptions.pm Dpkg/BuildProfiles.pm Dpkg/BuildTree.pm Dpkg/BuildTypes.pm Dpkg/Build/Info.pm Dpkg/Changelog.pm Dpkg/Changelog/Debian.pm Dpkg/Changelog/Entry.pm Dpkg/Changelog/Entry/Debian.pm Dpkg/Changelog/Parse.pm Dpkg/Checksums.pm Dpkg/Compression.pm Dpkg/Compression/FileHandle.pm Dpkg/Compression/Process.pm Dpkg/Conf.pm Dpkg/Control.pm Dpkg/Control/Changelog.pm Dpkg/Control/FieldsCore.pm Dpkg/Control/Fields.pm Dpkg/Control/Info.pm Dpkg/Control/HashCore.pm Dpkg/Control/HashCore/Tie.pm Dpkg/Control/Hash.pm Dpkg/Control/Tests.pm Dpkg/Control/Tests/Entry.pm Dpkg/Control/Types.pm Dpkg/Deps.pm Dpkg/Deps/AND.pm Dpkg/Deps/KnownFacts.pm Dpkg/Deps/Multiple.pm Dpkg/Deps/OR.pm Dpkg/Deps/Simple.pm Dpkg/Deps/Union.pm Dpkg/Dist/Files.pm Dpkg/ErrorHandling.pm Dpkg/Exit.pm Dpkg/File.pm Dpkg/Getopt.pm Dpkg/Gettext.pm Dpkg/In
 dex.pm Dpkg/Interface/Storable.pm Dpkg/IPC.pm Dpkg/Lock.pm Dpkg/OpenPGP.pm Dpkg/OpenPGP/Backend.pm Dpkg/OpenPGP/Backend/GnuPG.pm Dpkg/OpenPGP/Backend/SOP.pm Dpkg/OpenPGP/Backend/Sequoia.pm Dpkg/OpenPGP/ErrorCodes.pm Dpkg/OpenPGP/KeyHandle.pm Dpkg/Package.pm Dpkg/Path.pm Dpkg/Shlibs.pm Dpkg/Shlibs/Objdump.pm Dpkg/Shlibs/Objdump/Object.pm Dpkg/Shlibs/Symbol.pm Dpkg/Shlibs/SymbolFile.pm Dpkg/Shlibs/Cppfilt.pm Dpkg/Source/Archive.pm Dpkg/Source/BinaryFiles.pm Dpkg/Source/Format.pm Dpkg/Source/Functions.pm Dpkg/Source/Package.pm Dpkg/Source/Package/V1.pm Dpkg/Source/Package/V2.pm Dpkg/Source/Package/V3/Bzr.pm Dpkg/Source/Package/V3/Custom.pm Dpkg/Source/Package/V3/Native.pm Dpkg/Source/Package/V3/Git.pm Dpkg/Source/Package/V3/Quilt.pm Dpkg/Source/Patch.pm Dpkg/Source/Quilt.pm Dpkg/Substvars.pm Dpkg/Vendor.pm Dpkg/Vendor/Debian.pm Dpkg/Vendor/Default.pm Dpkg/Vendor/Devuan.pm Dpkg/Vendor/Ubuntu.pm Dpkg/Version.pm Dpkg.pm ; do \
|   name=`echo $module | sed -e 's|/|::|g' -e 's/\.pm$//'`; \
|   pod2man --utf8 --release=1.22.18-dirty --date='2025-03-09'  --center=libdpkg-perl \
|     --name="$name" --section=3perl ../../git/scripts/$module \
|     >/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/man/man3/$name.3perl; \
|   if ! [ -s "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/man/man3/$name.3perl" ]; then \
|     echo "error: empty /usr/share/man/man3/$name.3perl" 2>&1; \
|     exit 1; \
|   fi; \
| done
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump/Object.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs/Objdump'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Build/Info.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Build'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V1.pm ../../git/scripts/Dpkg/Source/Package/V2.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Shlibs/Objdump.pm ../../git/scripts/Dpkg/Shlibs/Symbol.pm ../../git/scripts/Dpkg/Shlibs/SymbolFile.pm ../../git/scripts/Dpkg/Shlibs/Cppfilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Shlibs'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Package/V3/Bzr.pm ../../git/scripts/Dpkg/Source/Package/V3/Custom.pm ../../git/scripts/Dpkg/Source/Package/V3/Native.pm ../../git/scripts/Dpkg/Source/Package/V3/Git.pm ../../git/scripts/Dpkg/Source/Package/V3/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Source/Package/V3'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend.pm ../../git/scripts/Dpkg/OpenPGP/ErrorCodes.pm ../../git/scripts/Dpkg/OpenPGP/KeyHandle.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Debian.pm ../../git/scripts/Dpkg/Changelog/Entry.pm ../../git/scripts/Dpkg/Changelog/Parse.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Changelog'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Dist/Files.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Dist'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/BuildDriver/DebianRules.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/BuildDriver'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Source/Archive.pm ../../git/scripts/Dpkg/Source/BinaryFiles.pm ../../git/scripts/Dpkg/Source/Format.pm ../../git/scripts/Dpkg/Source/Functions.pm ../../git/scripts/Dpkg/Source/Package.pm ../../git/scripts/Dpkg/Source/Patch.pm ../../git/scripts/Dpkg/Source/Quilt.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Source'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/HashCore/Tie.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Control/HashCore'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Arch.pm ../../git/scripts/Dpkg/BuildAPI.pm ../../git/scripts/Dpkg/BuildDriver.pm ../../git/scripts/Dpkg/BuildEnv.pm ../../git/scripts/Dpkg/BuildFlags.pm ../../git/scripts/Dpkg/BuildInfo.pm ../../git/scripts/Dpkg/BuildOptions.pm ../../git/scripts/Dpkg/BuildProfiles.pm ../../git/scripts/Dpkg/BuildTree.pm ../../git/scripts/Dpkg/BuildTypes.pm ../../git/scripts/Dpkg/Changelog.pm ../../git/scripts/Dpkg/Checksums.pm ../../git/scripts/Dpkg/Compression.pm ../../git/scripts/Dpkg/Conf.pm ../../git/scripts/Dpkg/Control.pm ../../git/scripts/Dpkg/Deps.pm ../../git/scripts/Dpkg/ErrorHandling.pm ../../git/scripts/Dpkg/Exit.pm ../../git/scripts/Dpkg/File.pm ../../git/scripts/Dpkg/Getopt.pm ../../git/scripts/Dpkg/Gettext.pm ../../git/scripts/Dpkg/Index.pm ../../git/scripts/Dpkg/IPC.pm ../../git/scripts/Dpkg/Lock.pm ../../git/scripts/Dpkg/OpenPGP.pm ../../git/scripts/Dpkg/Package.pm ../../git/scripts/
 Dpkg/Path.pm ../../git/scripts/Dpkg/Shlibs.pm ../../git/scripts/Dpkg/Substvars.pm ../../git/scripts/Dpkg/Vendor.pm ../../git/scripts/Dpkg/Version.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Deps/AND.pm ../../git/scripts/Dpkg/Deps/KnownFacts.pm ../../git/scripts/Dpkg/Deps/Multiple.pm ../../git/scripts/Dpkg/Deps/OR.pm ../../git/scripts/Dpkg/Deps/Simple.pm ../../git/scripts/Dpkg/Deps/Union.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Deps'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Changelog.pm ../../git/scripts/Dpkg/Control/FieldsCore.pm ../../git/scripts/Dpkg/Control/Fields.pm ../../git/scripts/Dpkg/Control/Info.pm ../../git/scripts/Dpkg/Control/HashCore.pm ../../git/scripts/Dpkg/Control/Hash.pm ../../git/scripts/Dpkg/Control/Tests.pm ../../git/scripts/Dpkg/Control/Types.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Control'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Vendor/Debian.pm ../../git/scripts/Dpkg/Vendor/Default.pm ../../git/scripts/Dpkg/Vendor/Devuan.pm ../../git/scripts/Dpkg/Vendor/Ubuntu.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Vendor'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/.'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Control/Tests/Entry.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Control/Tests'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Changelog/Entry/Debian.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Changelog/Entry'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Compression/FileHandle.pm ../../git/scripts/Dpkg/Compression/Process.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Compression'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Interface/Storable.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Interface'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/Archive/Ar.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/Archive'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP/Backend'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644  ../../git/scripts/Dpkg/OpenPGP/Backend/GnuPG.pm ../../git/scripts/Dpkg/OpenPGP/Backend/SOP.pm ../../git/scripts/Dpkg/OpenPGP/Backend/Sequoia.pm '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg/OpenPGP/Backend'
| make  install-data-hook
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/recipe-sysroot-native/usr/bin/perl-native/perl -i -p -e " s{^\x23!\s*/usr/bin/perl}{\x23!/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/recipe-sysroot-native/usr/bin/perl-native/perl}; s{our \\\$CONFDIR = .*;}{our \\\$CONFDIR = '/etc/dpkg';}; s{our \\\$ADMINDIR = .*;}{our \\\$ADMINDIR = '/var/lib/dpkg';}; s{our \\\$LIBDIR = .*;}{our \\\$LIBDIR = '/usr/libexec/dpkg';}; s{our \\\$DATADIR = .*;}{our \\\$DATADIR = '/usr/share/dpkg';}; s{our \\\$PROGMAKE = .*;}{our \\\$PROGMAKE = 'make';}; s{our \\\$PROGTAR = .*;}{our \\\$PROGTAR = 'tar';}; s{our \\\$PROGPATCH = .*;}{our \\\$PROGPATCH = 'patch';}; s{our \\\$PROGVERSION = .*;}{our \\\$PROGVERSION = '1.22.18-dirty';}; " /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/lib/perl5/5.40.0/Dpkg.pm
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/scripts'
| Making install in po
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/po'
| installing ../../git/po/ast.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ast/LC_MESSAGES/dpkg.mo
| installing ../../git/po/bs.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/bs/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ca.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ca/LC_MESSAGES/dpkg.mo
| installing ../../git/po/cs.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/cs/LC_MESSAGES/dpkg.mo
| installing ../../git/po/da.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/da/LC_MESSAGES/dpkg.mo
| installing ../../git/po/de.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/de/LC_MESSAGES/dpkg.mo
| installing ../../git/po/dz.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/dz/LC_MESSAGES/dpkg.mo
| installing ../../git/po/el.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/el/LC_MESSAGES/dpkg.mo
| installing ../../git/po/eo.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/eo/LC_MESSAGES/dpkg.mo
| installing ../../git/po/es.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/es/LC_MESSAGES/dpkg.mo
| installing ../../git/po/et.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/et/LC_MESSAGES/dpkg.mo
| installing ../../git/po/eu.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/eu/LC_MESSAGES/dpkg.mo
| installing ../../git/po/fr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/fr/LC_MESSAGES/dpkg.mo
| installing ../../git/po/gl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/gl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/hu.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/hu/LC_MESSAGES/dpkg.mo
| installing ../../git/po/id.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/id/LC_MESSAGES/dpkg.mo
| installing ../../git/po/it.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/it/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ja.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ja/LC_MESSAGES/dpkg.mo
| installing ../../git/po/km.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/km/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ko.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ko/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ku.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ku/LC_MESSAGES/dpkg.mo
| installing ../../git/po/lt.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/lt/LC_MESSAGES/dpkg.mo
| installing ../../git/po/mr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/mr/LC_MESSAGES/dpkg.mo
| installing ../../git/po/nb.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/nb/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ne.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ne/LC_MESSAGES/dpkg.mo
| installing ../../git/po/nl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/nl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/nn.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/nn/LC_MESSAGES/dpkg.mo
| installing ../../git/po/oc.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/oc/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pa.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/pa/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/pl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pt.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/pt/LC_MESSAGES/dpkg.mo
| installing ../../git/po/pt_BR.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/pt_BR/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ro.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ro/LC_MESSAGES/dpkg.mo
| installing ../../git/po/ru.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/ru/LC_MESSAGES/dpkg.mo
| installing ../../git/po/sk.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/sk/LC_MESSAGES/dpkg.mo
| installing ../../git/po/sv.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/sv/LC_MESSAGES/dpkg.mo
| installing ../../git/po/th.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/th/LC_MESSAGES/dpkg.mo
| installing ../../git/po/tl.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/tl/LC_MESSAGES/dpkg.mo
| installing ../../git/po/tr.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/tr/LC_MESSAGES/dpkg.mo
| installing ../../git/po/vi.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/vi/LC_MESSAGES/dpkg.mo
| installing ../../git/po/zh_CN.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/zh_CN/LC_MESSAGES/dpkg.mo
| installing ../../git/po/zh_TW.gmo as /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/locale/zh_TW/LC_MESSAGES/dpkg.mo
| if test "dpkg" = "gettext-tools"; then \
|   /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/gettext/po; \
|   for file in Makefile.in.in remove-potcdate.sed    Makevars.template; do \
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../git/po/$file \
| 		    /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/gettext/po/$file; \
|   done; \
|   for file in Makevars; do \
|     rm -f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/gettext/po/$file; \
|   done; \
| else \
|   : ; \
| fi
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build/po'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build'
| make[2]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/m4/dpkg-arch.m4 ../git/m4/dpkg-build.m4 ../git/m4/dpkg-compiler.m4 ../git/m4/dpkg-coverage.m4 ../git/m4/dpkg-funcs.m4 ../git/m4/dpkg-headers.m4 ../git/m4/dpkg-libs.m4 ../git/m4/dpkg-linker.m4 ../git/m4/dpkg-progs.m4 ../git/m4/dpkg-types.m4 ../git/m4/dpkg-unicode.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/README.api ../git/doc/README.feature-removal-schedule '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/doc/dpkg'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/doc/spec/build-driver.txt ../git/doc/spec/frontend-api.txt ../git/doc/spec/protected-field.txt ../git/doc/spec/rootless-builds.txt ../git/doc/spec/triggers.txt '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/doc/dpkg/spec'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/data/pie-compile.specs ../git/data/pie-link.specs ../git/data/no-pie-compile.specs ../git/data/no-pie-link.specs ../git/data/cputable ../git/data/ostable ../git/data/abitable ../git/data/tupletable '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/share/dpkg'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/build'
| sed: can't read /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/sbin/dpkg-*: No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/temp/run.do_install.2511538:162 exit 2 from 'sed -i -e 's|^#!.*/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/recipe-sysroot-native/usr/bin/perl-native.*/perl|#!/usr/bin/env perl|' /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/bin/dpkg-* /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/image/usr/sbin/dpkg-*'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/temp/run.do_install.2511538, line 162
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/temp/run.do_install.2511538, line 211
NOTE: recipe dpkg-1.22.18-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1989 tasks of which 1971 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401075355.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401075355.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/log.do_install.2504079
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/temp/log.do_install.2511538
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: dpkg-native-1.22.18-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/run.do_install.2504079' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.18/temp/log.do_install.2504079
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install) failed with exit code '1'
ERROR: dpkg-1.22.18-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/temp/run.do_install.2511538' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dpkg/1.22.18/temp/log.do_install.2511538
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.18.bb:do_install) failed with exit code '1'

--===============8411881251390125197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.22.11-1.22.18.patch"

RnJvbSAyODcwMDE0ODJjYmJiZmU0M2E3Y2EwYWJkN2M1YjBlODU2ZTYxZTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNzo1NDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRw
a2c6IHVwZ3JhZGUgMS4yMi4xMSAtPiAxLjIyLjE4CgotLS0KIC4uLi9kcGtnL2Rwa2cvMDAwMS1B
ZGQtc3VwcG9ydC1mb3ItcmlzY3YzMi1DUFUucGF0Y2ggICAgICB8IDQgKystLQogLi4uLzAwMDEt
YnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggICAgIHwgOCArKysr
LS0tLQogLi4uL2Rwa2cvZHBrZy8wMDAxLWRwa2ctU3VwcG9ydC1tdXNseDMyLWJ1aWxkLnBhdGNo
ICAgICAgIHwgMiArLQogLi4uL2Rwa2cvZHBrZy8wMDAxLXNjcmlwdC5jLWF2b2lkLXVzZS1vZi1j
aHJvb3QucGF0Y2ggICAgIHwgMiArLQogLi4udC10by1saW51eC13cnMta2VybmVsLXZlcnNpb24t
d2hpY2gtaGFzLWNoYXJhY3RlLnBhdGNoIHwgNiArKystLS0KIC4uLmx1dGltZXMtZnVuY3Rpb24t
ZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaCB8IDQgKystLQogLi4uL2Rwa2cv
MDAwNi1hZGQtbXVzbGVhYmktdG8ta25vd24tdGFyZ2V0LXRyaXBldHMucGF0Y2ggIHwgMiArLQog
Li4uZy1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNo
IHwgNiArKystLS0KIC4uLi9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnkucGF0Y2gg
ICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJj
aF9wbS5wYXRjaCAgICAgICAgICAgICB8IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZHBrZy9kcGtnL25vbWFuLnBhdGNoICAgICAgICAgICAgICAgfCA0ICsrLS0KIC4uLi9kcGtnL2Rw
a2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2ggICAgICAgICAgICAgICB8IDIgKy0KIC4u
Li9kcGtnL3tkcGtnXzEuMjIuMTEuYmIgPT4gZHBrZ18xLjIyLjE4LmJifSAgICAgICAgICAgICB8
IDIgKy0KIDEzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL3tkcGtnXzEuMjIuMTEuYmIgPT4g
ZHBrZ18xLjIyLjE4LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2cvMDAwMS1BZGQtc3VwcG9ydC1mb3ItcmlzY3YzMi1DUFUucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQtZm9yLXJpc2N2MzIt
Q1BVLnBhdGNoCmluZGV4IDg5NDNmNmMyZjAuLmU0ODU2ODFiOTUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQtc3VwcG9ydC1mb3ItcmlzY3YzMi1D
UFUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLUFkZC1z
dXBwb3J0LWZvci1yaXNjdjMyLUNQVS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWMzMzJj
MmE0NjI1NTE5YTJiNjA2NWI5ZDlmYzcyNGU4NGM5YjZkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNjBiOTIyNTkxNTBmOWEzYmRjNTg0YjBjODgyYzA0Mjk0NGIyYmViOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBXZWQsIDI5IEFwciAyMDIwIDIyOjAyOjIzIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFk
ZCBzdXBwb3J0IGZvciByaXNjdjMyIENQVQpAQCAtMjMsNyArMjMsNyBAQCBpbmRleCA1NzVjMDA4
ZTMuLjdhODAxYTAzYSAxMDA2NDQKICBzMzkwCQlzMzkwCQlzMzkwCQkJMzIJYmlnCiAgczM5MHgJ
CXMzOTB4CQlzMzkweAkJCTY0CWJpZwogZGlmZiAtLWdpdCBhL3NjcmlwdHMvRHBrZy9WZW5kb3Iv
RGViaWFuLnBtIGIvc2NyaXB0cy9EcGtnL1ZlbmRvci9EZWJpYW4ucG0KLWluZGV4IGVkZjk0YmMx
OS4uZDc2Zjk3NDk0IDEwMDY0NAoraW5kZXggMWFmNjBkYWJkLi44ODlkODM4MGQgMTAwNjQ0CiAt
LS0gYS9zY3JpcHRzL0Rwa2cvVmVuZG9yL0RlYmlhbi5wbQogKysrIGIvc2NyaXB0cy9EcGtnL1Zl
bmRvci9EZWJpYW4ucG0KIEBAIC0yMTYsNiArMjE2LDcgQEAgc3ViIHNldF9idWlsZF9mZWF0dXJl
cyB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVp
bGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10
YXItY2YucGF0Y2gKaW5kZXggMTg1YmJiOTBmMS4uMTY3ODhiNmEzMCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1v
Zi0xLWZyb20tdGFyLWNmLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rw
a2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMDY3OTkyZjJkMGIwZmY2Y2ExMTQwMzE2MzZlYjBlMWVhYzc5MTg5
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTZiNWQzZGE2NzIwNmQ0NGZiODRhMTgz
NDNjMDU2NjZlYjAzZGEyYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgRWdn
bGV0b24gPHBhdWwuZWdnbGV0b25AbGludXgubWljcm9zb2Z0LmNvbT4KIERhdGU6IFR1ZSwgMTYg
SnVuIDIwMjAgMDM6NTc6MjUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gYnVpbGQuYzogaWdub3Jl
IHJldHVybiBvZiAxIGZyb20gdGFyIC1jZgpAQCAtMjgsMTAgKzI4LDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbWljcm9zb2Z0LmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9z
cmMvZGViL2J1aWxkLmMgYi9zcmMvZGViL2J1aWxkLmMKLWluZGV4IDg3YmQ0MTQyZS4uZTg1ZmQ3
ZDBmIDEwMDY0NAoraW5kZXggODE4NDRlMzAwLi5lMzg2YWU2ODcgMTAwNjQ0CiAtLS0gYS9zcmMv
ZGViL2J1aWxkLmMKICsrKyBiL3NyYy9kZWIvYnVpbGQuYwotQEAgLTQ4MSw2ICs0ODEsNyBAQCB0
YXJiYWxsX3BhY2soY29uc3QgY2hhciAqZGlyLCBmaWxlbmFtZXNfZmVlZF9mdW5jICp0YXJfZmls
ZW5hbWVzX2ZlZWRlciwKK0BAIC01MDUsNiArNTA1LDcgQEAgdGFyYmFsbF9wYWNrKGNvbnN0IGNo
YXIgKmRpciwgZmlsZW5hbWVzX2ZlZWRfZnVuYyAqdGFyX2ZpbGVuYW1lc19mZWVkZXIsCiAgewog
ICAgaW50IHBpcGVfZmlsZW5hbWVzWzJdLCBwaXBlX3RhcmJhbGxbMl07CiAgICBwaWRfdCBwaWRf
dGFyLCBwaWRfY29tcDsKQEAgLTM5LDcgKzM5LDcgQEAgaW5kZXggODdiZDQxNDJlLi5lODVmZDdk
MGYgMTAwNjQ0CiAgCiAgICAvKiBGb3JrIG9mZiBhIHRhci4gV2Ugd2lsbCBmZWVkIGl0IGEgbGlz
dCBvZiBmaWxlbmFtZXMgb24gc3RkaW4gbGF0ZXIuICovCiAgICBtX3BpcGUocGlwZV9maWxlbmFt
ZXMpOwotQEAgLTUzMyw3ICs1MzQsOSBAQCB0YXJiYWxsX3BhY2soY29uc3QgY2hhciAqZGlyLCBm
aWxlbmFtZXNfZmVlZF9mdW5jICp0YXJfZmlsZW5hbWVzX2ZlZWRlciwKK0BAIC01NTcsNyArNTU4
LDkgQEAgdGFyYmFsbF9wYWNrKGNvbnN0IGNoYXIgKmRpciwgZmlsZW5hbWVzX2ZlZWRfZnVuYyAq
dGFyX2ZpbGVuYW1lc19mZWVkZXIsCiAgICAvKiBBbGwgZG9uZSwgY2xlYW4gdXAgd2FpdCBmb3Ig
dGFyIGFuZCA8Y29tcHJlc3M+IHRvIGZpbmlzaCB0aGVpciBqb2IuICovCiAgICBjbG9zZShwaXBl
X2ZpbGVuYW1lc1sxXSk7CiAgICBzdWJwcm9jX3JlYXAocGlkX2NvbXAsIF8oIjxjb21wcmVzcz4g
ZnJvbSB0YXIgLWNmIiksIDApOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZy8wMDAxLWRwa2ctU3VwcG9ydC1tdXNseDMyLWJ1aWxkLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWRwa2ctU3VwcG9ydC1tdXNseDMyLWJ1aWxkLnBh
dGNoCmluZGV4IDY3ZmNlODlkODAuLmRiNzY5ZTllNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBvcnQtbXVzbHgzMi1idWlsZC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0
LW11c2x4MzItYnVpbGQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRmNmM2NDFlM2ZjMjQ4
ZDBjODY0ZTRlNzUyYzQ2MDk0MTIwNjdkZjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGRjNDY3YmQyOTdkMDdiMDc1YzBmMGVjZDQ3NzJhY2EwODA2ZGU2NjUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBzd2VlYXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNvbT4KIERhdGU6
IFN1biwgMTAgU2VwIDIwMTcgMDA6MTQ6MTUgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHBrZzog
U3VwcG9ydCBtdXNseDMyIGJ1aWxkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZHBrZy9kcGtnLzAwMDEtc2NyaXB0LmMtYXZvaWQtdXNlLW9mLWNocm9vdC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9pZC11c2Utb2YtY2hy
b290LnBhdGNoCmluZGV4IGQwNDU5Y2QwMTcuLjkwZjliYTcwNjEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9pZC11c2Utb2YtY2hy
b290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1zY3Jp
cHQuYy1hdm9pZC11c2Utb2YtY2hyb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1ZTVm
MDZkMzk2ZmU2MzE5OTA0NzRiYTZkZjgzNDI4OTg3ODU1MzY1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBkZDJlNTg4MDc2ZTVhOTQ1NGVjNjc5ZDBjNjFhN2UxMzAyZGJhZjYxIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI2IEF1ZyAyMDE1IDE2OjI1OjQ1ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHNjcmlwdC5jOiBhdm9pZCB1c2Ugb2YgY2hyb290CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtl
cm5lbC12ZXJzaW9uLXdoaWNoLWhhcy1jaGFyYWN0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZlcnNpb24td2hp
Y2gtaGFzLWNoYXJhY3RlLnBhdGNoCmluZGV4IGE1YzgwNzczYTUuLjE1YjQ5MmM3YzUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51
eC13cnMta2VybmVsLXZlcnNpb24td2hpY2gtaGFzLWNoYXJhY3RlLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVs
LXZlcnNpb24td2hpY2gtaGFzLWNoYXJhY3RlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2
ZTg4ZThiN2I2OTI0NzUxMTEyOTY2ZjMyOTUyNTk1NjczNWRlOWI0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA5OGVhMTZlYWY0MjIzYTYzYjViNDVjMzBmMzcwNjI2ZmYzYjA3NmI0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI2IEF1ZyAyMDE1IDE2OjE2OjE2ICswMzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIEFkYXB0IHRvIGxpbnV4LXdycyBrZXJuZWwgdmVyc2lvbiwgd2hpY2gg
aGFzIGNoYXJhY3RlciAnXycKQEAgLTEzLDEwICsxMywxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvZHBrZy9wYXJzZWhl
bHAuYyBiL2xpYi9kcGtnL3BhcnNlaGVscC5jCi1pbmRleCBhOTk5YjVlNzguLjdiZTAzNzhhYiAx
MDA2NDQKK2luZGV4IDJkNmIwOTVmYi4uNmVmYjc2MTI5IDEwMDY0NAogLS0tIGEvbGliL2Rwa2cv
cGFyc2VoZWxwLmMKICsrKyBiL2xpYi9kcGtnL3BhcnNlaGVscC5jCi1AQCAtMjkxLDE0ICsyOTEs
MTIgQEAgcGFyc2V2ZXJzaW9uKHN0cnVjdCBkcGtnX3ZlcnNpb24gKnJ2ZXJzaW9uLCBjb25zdCBj
aGFyICpzdHJpbmcsCitAQCAtMjg5LDE0ICsyODksMTIgQEAgcGFyc2V2ZXJzaW9uKHN0cnVjdCBk
cGtnX3ZlcnNpb24gKnJ2ZXJzaW9uLCBjb25zdCBjaGFyICpzdHJpbmcsCiAgICBwdHIgPSBydmVy
c2lvbi0+dmVyc2lvbjsKICAgIGlmICghKnB0cikKICAgICAgcmV0dXJuIGRwa2dfcHV0X2Vycm9y
KGVyciwgXygidmVyc2lvbiBudW1iZXIgaXMgZW1wdHkiKSk7CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24t
dC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvMDAwNC1UaGUtbHV0aW1lcy1mdW5jdGlvbi1kb2Vzbi10LXdvcmstcHJvcGVybHkt
Zm9yLWFsbC1zLnBhdGNoCmluZGV4IGU0OWQ1NDE1MmMuLmNjOGQwZjEyZGIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNC1UaGUtbHV0aW1lcy1mdW5jdGlv
bi1kb2Vzbi10LXdvcmstcHJvcGVybHktZm9yLWFsbC1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNC1UaGUtbHV0aW1lcy1mdW5jdGlvbi1kb2Vzbi10LXdv
cmstcHJvcGVybHktZm9yLWFsbC1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwZmM5MGEz
ZWQwMWE3ZmNlMzRkZTkyNTk3OTQ2MDYzOGI4YTU3NDAyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBkMjkyOTllOWRmNWUxZjljYmY4YjYwZWQxYjA0OGU3YWZjZTBhZjljIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDI2IEF1ZyAyMDE1IDE2OjI3OjQ1ICswMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFRoZSBsdXRpbWVzIGZ1bmN0aW9uIGRvZXNuJ3Qgd29yayBwcm9wZXJseSBmb3Ig
YWxsIHN5c3RlbXMuCkBAIC0xMSw3ICsxMSw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNdCiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL21haW4vYXJjaGl2ZXMuYyBiL3Ny
Yy9tYWluL2FyY2hpdmVzLmMKLWluZGV4IGQ3Mjc5ZTFmNS4uZjljNmZhY2M5IDEwMDY0NAoraW5k
ZXggNTYzZWZhYzMwLi4zMDY4NmUxMWMgMTAwNjQ0CiAtLS0gYS9zcmMvbWFpbi9hcmNoaXZlcy5j
CiArKysgYi9zcmMvbWFpbi9hcmNoaXZlcy5jCiBAQCAtNDkwLDggKzQ5MCw5IEBAIHRhcm9iamVj
dF9zZXRfbXRpbWUoc3RydWN0IHRhcl9lbnRyeSAqdGUsIGNvbnN0IGNoYXIgKnBhdGgpCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDYtYWRkLW11c2xlYWJp
LXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZy8wMDA2LWFkZC1tdXNsZWFiaS10by1rbm93bi10YXJnZXQtdHJpcGV0cy5wYXRjaApp
bmRleCA0ZjYwYTg5YTU2Li42ZTNlOGU2ZWY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnLzAwMDYtYWRkLW11c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNi1hZGQtbXVz
bGVhYmktdG8ta25vd24tdGFyZ2V0LXRyaXBldHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGUzZGM2OWFhOTg3YjM3OWUyNDdkZGUzZmNlNDc5ZTQzYmU2YzgxYWEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGI1YzdjMGNmODVlNTg4NTlhMGE4MzRhYWY1MDY4MTdmZGJhOGZjMTQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogRGF0ZTogV2VkLCAzMCBEZWMgMjAxNSAyMzowNTo0MSArMDAwMAogU3ViamVjdDogW1BB
VENIXSBhZGQgbXVzbGVhYmkgdG8ga25vd24gdGFyZ2V0IHRyaXBldHMKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNy1kcGtnLWRlYi1idWlsZC5jLVJlbW92
ZS11c2FnZS1vZi1jbGFtcC1tdGltZS1pbi10YXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZHBrZy9kcGtnLzAwMDctZHBrZy1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAt
bXRpbWUtaW4tdGFyLnBhdGNoCmluZGV4IGRlZDE3MDdkZmQuLmRmOTdlODIzNzQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNy1kcGtnLWRlYi1idWlsZC5j
LVJlbW92ZS11c2FnZS1vZi1jbGFtcC1tdGltZS1pbi10YXIucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA3LWRwa2ctZGViLWJ1aWxkLmMtUmVtb3ZlLXVzYWdl
LW9mLWNsYW1wLW10aW1lLWluLXRhci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjBiYTdm
ZDg5MzllOTdiZWMzZDcwYTY3YzBhYWM3NmRkYzY3ODk4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYmU2Nzc2NjExZGViYzEzMDU5MWZlNTJlMzUwNDI4NWIwYjg4NTJhOSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9Bbj1DMz1BRGJhbD0yMExpbT1DMz1C
M24/PSA8YW5pYmFsLmxpbW9uQGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFR1ZSwgMjEgRmViIDIw
MTcgMTE6MjM6MjcgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHBrZy1kZWIvYnVpbGQuYzogUmVt
b3ZlIHVzYWdlIG9mIC0tY2xhbXAtbXRpbWUgaW4gdGFyCkBAIC0yNywxMCArMjcsMTAgQEAgU2ln
bmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMv
ZGViL2J1aWxkLmMgYi9zcmMvZGViL2J1aWxkLmMKLWluZGV4IGE0MThkZDEyMi4uODdiZDQxNDJl
IDEwMDY0NAoraW5kZXggZWVmYzM2OWRiLi44MTg0NGUzMDAgMTAwNjQ0CiAtLS0gYS9zcmMvZGVi
L2J1aWxkLmMKICsrKyBiL3NyYy9kZWIvYnVpbGQuYwotQEAgLTUwNCw3ICs1MDQsNyBAQCB0YXJi
YWxsX3BhY2soY29uc3QgY2hhciAqZGlyLCBmaWxlbmFtZXNfZmVlZF9mdW5jICp0YXJfZmlsZW5h
bWVzX2ZlZWRlciwKK0BAIC01MjgsNyArNTI4LDcgQEAgdGFyYmFsbF9wYWNrKGNvbnN0IGNoYXIg
KmRpciwgZmlsZW5hbWVzX2ZlZWRfZnVuYyAqdGFyX2ZpbGVuYW1lc19mZWVkZXIsCiAgCiAgICAg
IGNvbW1hbmRfaW5pdCgmY21kLCBUQVIsICJ0YXIgLWNmIik7CiAgICAgIGNvbW1hbmRfYWRkX2Fy
Z3MoJmNtZCwgInRhciIsICItY2YiLCAiLSIsICItLWZvcm1hdD1nbnUiLApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9lbnRyeS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRf
ZW50cnkucGF0Y2gKaW5kZXggZDFmYWMyMTY4YS4uZTQxNDk3NzdhYyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9lbnRyeS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FkZF9hcm1lYl90cmlwbGV0
X2VudHJ5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZGVkMzJhMzUyODdhODQwZGU3ZTUw
NWM2NmU3NmNjY2Q5ZWRiYWM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZDY5YjZl
MDNmN2RiYTNjODViMzZhNmMxZGJkNDQwNzgzOTEwY2Y0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogIktyaXNobmFuamFuYXBwYSwgSmFnYWRlZXNoIgogIDxqYWdhZGVlc2gua3Jpc2hu
YW5qYW5hcHBhQGNhdml1bW5ldHdvcmtzLmNvbT4KIERhdGU6IFdlZCwgOCBBcHIgMjAxNSAxODow
ODoxNCArMDUzMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9h
cmNoX3BtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hcmNoX3BtLnBh
dGNoCmluZGV4IGI1YTI5MjMxZGQuLjk5ZDkxMmExMGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnL2FyY2hfcG0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgxMmRi
YjY0ZjI4MDVhMzI1N2VmOWM5YTYxYWJiZDEwZTBiM2EwOGMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDMwMDk3YmMxNDA3ZjI4Y2E0Nzc3MDQ1N2M5NDYwZGFkYjE3Mjk0NjQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBNb24sIDI2IEF1ZyAyMDEzIDIzOjM4OjQ1ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGRwa2c6IGZpeCBjb25maWd1cmF0aW9uIGlzc3VlIGZvciBtaXBzNjQKQEAgLTE2LDEwICsx
NiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zY3JpcHRz
L0Rwa2cvQXJjaC5wbSBiL3NjcmlwdHMvRHBrZy9BcmNoLnBtCi1pbmRleCAwZDM1MmVlYjkuLjRl
ZjVmYTMwNyAxMDA2NDQKK2luZGV4IGNhZGVmYjRkNC4uN2RkNDkyY2E5IDEwMDY0NAogLS0tIGEv
c2NyaXB0cy9EcGtnL0FyY2gucG0KICsrKyBiL3NjcmlwdHMvRHBrZy9BcmNoLnBtCi1AQCAtMzI2
LDkgKzMyNiw2IEBAIHN1YiBfbG9hZF90dXBsZXRhYmxlKCkKK0BAIC0zMjYsOSArMzI2LDYgQEAg
c3ViIF9sb2FkX3R1cGxldGFibGUKICAJCSAgICAobXkgJGR0ID0gJGRlYnR1cGxlKSA9fiBzLzxj
cHU+LyRfY3B1LzsKICAJCSAgICAobXkgJGRhID0gJGRlYmFyY2gpID1+IHMvPGNwdT4vJF9jcHUv
OwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9ub21hbi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvbm9tYW4ucGF0Y2gKaW5kZXgg
M2YzZTA4MzUxYy4uYTYyMTExY2FmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy9ub21hbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9k
cGtnL25vbWFuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlNjcxYjQzYTUyYmY1Nzg1ZmU0
YWFkODQ3MTJkYmFiYzZjODZiMzllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZDNl
ZjNlY2UyNTlkODQ3NTZkMTljOWJmOTJlOWFmZmU3N2U1MmMwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hyaXMgTGFyc29uIDxrZXJnb3RoQG9wZW5lZGhhbmQuY29tPgogRGF0ZTog
VHVlLCA1IFNlcCAyMDA2IDA3OjI0OjU4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBkcGtn
LCBtb2RpZmllZCBmcm9tIHVwc3RyZWFtIG9lLgpAQCAtOSw3ICs5LDcgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtkaXNhYmxlIGZlYXR1cmVdCiAgMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWlu
ZGV4IDc0ZjhkZjE5Ny4uMzVlNWVlZTM5IDEwMDY0NAoraW5kZXggMjg5NWFiZWM3Li45ZGI3MmYx
NmMgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KIEBAIC0xMSw3
ICsxMSw2IEBAIFNVQkRJUlMgPSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZHBrZy9kcGtnL3JlbW92ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rwa2cvZHBrZy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaAppbmRleCBkM2Ex
YTEzMDk4Li5iNGE5ZmY3OTI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBr
Zy9kcGtnL3JlbW92ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kcGtnL2Rwa2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDdkNjlkZTExNGFhNjk2Y2ZiNWUzMWI0OTFhNjU3Y2E2YjZjYmJiZDUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRjODBjNzIwMGU5MWEzNGQyYzRiMDc0MjdlOGU5
MmUyYjk1YmI1MzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDb25zdGFudGluIE11
c2NhIDxjb25zdGFudGlueC5tdXNjYUBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDI4IEF1ZyAyMDEy
IDE3OjAyOjQwICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJ1c3lib3gtMS4xOS40IHRhciB1dGls
aXR5IGRvZXNuJ3Qgc3VwcG9ydApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZ18xLjIyLjExLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIy
LjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9kcGtnL2Rwa2dfMS4yMi4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZ18xLjIyLjE4LmJiCmluZGV4IDQ3YThkNWQ1ZWEuLmQyOTVhZDA0NzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMi4xMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjIuMTguYmIKQEAgLTE3LDYgKzE3LDYg
QEAgU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5kZWJpYW4ub3JnL2Rwa2ctdGVhbS9kcGtnLmdpdDtw
cm90b2NvbD1odHRwczticmFuY2g9bWFpbgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUg
PSAiIGZpbGU6Ly8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBh
dGNoIgogCi1TUkNSRVYgPSAiZWU3ZTkxMThkMGE5NTgxY2IwMGM1Y2UwMmRjY2Q1NjFiMzA5NjM4
NyIKK1NSQ1JFViA9ICIwZDFiYjVkY2FjMWYyZWZiNTkzMDg1MTRjMzk2YzQyNjUzZmNlYTAxIgog
CiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40Ny4xCgo=

--===============8411881251390125197==--

