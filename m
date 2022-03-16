Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451A5C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 00:18:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.19365.1647389905512093564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 17:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HRBJxv5I;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647389903; i=@fujitsu.com;
	bh=bEH4eBctMxvvKM3e6/CQZhYWG4MZhpfVbW8M5wXWz9Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HRBJxv5IdwvGToA2bRHmaHDLaFIpay9jdSkg4WJaoE10pNUBVVo/XMUbNnv5pHOTY
	 XiKpyGtmGouVWKJHtLFkGGG8VcX0ZJjihxLhohxfYEDDM3dTgbQQLcf0XyoMXFx0tG
	 dLn6j00XwfqJIXqXy95FA4RGFR0gTSgNPyAQkb7SxQX2me7GIJjOqxixel5rUSuYbq
	 ci+gV2SUzx0qOFyKSObB3pZlB1YIXFpSkoEfA0/F9dr/KF/eJ753gOJiAji3sIVZlY
	 N6cGeHrWc/IgpQXyBVEZMuOl5vGWtFyjd4pz99tIDvNbfo6SyTIe4+S/+ZSQ5X+7j6
	 1/ztiaYnc/9ow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRontexzD
  J4PlZRos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNl/Um2gluBFWtWHGZrYOz16GLk4hASmMEk
  8WDZRTYI5wSjxJKDZ5m6GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52kLCwgI3E4
  YXWIGEWAVWJe8uXsYHYvAJOEh3tc1hBbAkBBYkpD98zQ8QFJU7OfMICMUZC4uCLF8wQNYoSsy
  83s0DYFRKzZrUxTWDknYWkZRaSlgWMTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNLXUtjPQSq3Q
  T9VJLdctTi0t0gdzyYr3U4mK94src5JwUvbzUkk2MwABLKVYP2sH4bcVPvUOMkhxMSqK8heUG
  SUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeC2VDJOEBItS01Mr0jJzgMEOk5bg4FES4Y3TAErzF
  hck5hZnpkOkTjFacly9cmUvM8cNMLn/GpAUYsnLz0uVEuf1VARqEABpyCjNgxsHi8hLjLJSwr
  yMDAwMQjwFqUW5mSWo8q8YxTkYlYR5vbWApvBk5pXAbX0FdBAT0EHzpPVADipJREhJNTCt0jJ
  kvK353zFqTeVHY2ezV6sOrMm6p3fhrOXpjQIiL96GPPnkL9Sk8urapaqrbrLT9cuvnbA/tUB0
  b3qQg5X+5KXT3GPS+q60xcjN2Gav++1m/1k7efb3sbP25t3XW7Qi2Dd6xr/dT3v3RJs6VNmxu
  t6easUygTXI8c5Fo9tT2+5O2FuvsFE89xCfkcuc6Z87p69R+u4ur/FhLmuU3d8XF00b9lgeV/
  gp8He746SHq9J27f/H2Bh77BpDmd2s5sYSm+v9+znvlvBP/zlvv+Wh19eVPK/qPBNI8rjxd99
  +wxpDZZtVt2tDNzx7vUV3+td/y6X9zj+45RrSGGgTcmP2lcTO+Bx+5rqVs3ek9vRGKLEUZyQa
  ajEXFScCADHjRLxDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1647389902!1850!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4635 invoked from network); 16 Mar 2022 00:18:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 00:18:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22G0IC1F006502
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 00:18:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 00:18:10 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] dpkg: upgrade 1.21.1 -> 1.21.2
Date: Wed, 16 Mar 2022 08:17:57 +0800
Message-ID: <1647389877-80606-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 00:18:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163319

The following patches refreshed for new version:
0001-build.c-ignore-return-of-1-from-tar-cf.patch
0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
noman.patch
remove-tar-no-timestamp.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ild.c-ignore-return-of-1-from-tar-cf.patch | 15 ++++++-----
 ...s-expect-D-to-be-set-when-running-in.patch | 26 +++++++++----------
 ...tion-doesn-t-work-properly-for-all-s.patch | 14 +++++-----
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch | 18 ++++++-------
 meta/recipes-devtools/dpkg/dpkg/noman.patch   | 19 +++++++-------
 .../dpkg/dpkg/remove-tar-no-timestamp.patch   | 17 ++++++++----
 .../dpkg/{dpkg_1.21.1.bb => dpkg_1.21.2.bb}   |  2 +-
 7 files changed, 59 insertions(+), 52 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.1.bb => dpkg_1.21.2.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 4d3f238012..dc0d9bfc2e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From cb47e9cd6735fcafd231748dab8884ae991b669c Mon Sep 17 00:00:00 2001
+From 839f228556c00739f72534e8635195935eb3752f Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -25,13 +25,13 @@ Original patch by RP 2015/3/27, rebased by Paul Eggleton
 Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
 
 ---
- dpkg-deb/build.c | 5 ++++-
+ src/deb/build.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 76613adec..7c216d1a9 100644
---- a/dpkg-deb/build.c
-+++ b/dpkg-deb/build.c
+diff --git a/src/deb/build.c b/src/deb/build.c
+index 76613ad..7c216d1 100644
+--- a/src/deb/build.c
++++ b/src/deb/build.c
 @@ -482,6 +482,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
@@ -51,3 +51,6 @@ index 76613adec..7c216d1a9 100644
  }
  
  static intmax_t
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 9ca7262eb9..75ae848264 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -12,14 +12,14 @@ ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
 ---
- src/script.c | 53 +++-------------------------------------------------
- 1 file changed, 3 insertions(+), 50 deletions(-)
+ src/main/script.c | 54 +++--------------------------------------------
+ 1 file changed, 3 insertions(+), 51 deletions(-)
 
-diff --git a/src/script.c b/src/script.c
-index abe65b6f7..621ff9b27 100644
---- a/src/script.c
-+++ b/src/script.c
-@@ -96,58 +96,11 @@ setexecute(const char *path, struct stat *stab)
+diff --git a/src/main/script.c b/src/main/script.c
+index abe65b6..0edb8f1 100644
+--- a/src/main/script.c
++++ b/src/main/script.c
+@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
  static const char *
  maintscript_pre_exec(struct command *cmd)
  {
@@ -49,9 +49,7 @@ index abe65b6f7..621ff9b27 100644
 -			         "using --force-script-chrootless?"));
 -		else if (rc)
 -			ohshite(_("failed to chroot to '%.250s'"), instdir);
-+	if (*instdir) {
-+		setenv("D", instdir, 1);
- 	}
+-	}
 -	/* Switch to a known good directory to give the maintainer script
 -	 * a saner environment, also needed after the chroot(). */
 -	if (chdir(changedir))
@@ -68,19 +66,21 @@ index abe65b6f7..621ff9b27 100644
 -		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
 -		      args.buf);
 -		varbuf_destroy(&args);
--	}
++        if (*instdir) {
++                setenv("D", instdir, 1);
+ 	}
 -	if (instdirlen == 0 || in_force(FORCE_SCRIPT_CHROOTLESS))
 -		return cmd->filename;
 -
 -	if (strlen(cmd->filename) < instdirlen)
 -		internerr("maintscript name '%s' length < instdir length %zd",
 -		          cmd->filename, instdirlen);
- 
+-
 -	return cmd->filename + instdirlen;
 +	return cmd->filename;
  }
  
  /**
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index 56c85c7733..bbd5aba418 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -8,14 +8,14 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 Upstream-Status: Inappropriate [embedded specific]
 ---
- src/archives.c | 3 ++-
+ src/main/archives.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/archives.c b/src/archives.c
-index bff5f14..b711013 100644
---- a/src/archives.c
-+++ b/src/archives.c
-@@ -449,8 +449,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+diff --git a/src/main/archives.c b/src/main/archives.c
+index 92340b9..7a55c27 100644
+--- a/src/main/archives.c
++++ b/src/main/archives.c
+@@ -490,8 +490,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
  
    if (te->type == TAR_FILETYPE_SYMLINK) {
  #ifdef HAVE_LUTIMES
@@ -27,5 +27,5 @@ index bff5f14..b711013 100644
    } else {
      if (utimes(path, tv))
 -- 
-2.1.4
+2.25.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 4f79a40d8b..117f9234ad 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -2,9 +2,6 @@ From 8659eeeeda74d71e12080121f0b13a88cbdda433 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Tue, 21 Feb 2017 11:23:27 -0600
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 Recently dpkg added --clamp-mtime to tar to create reproducible
 build tarballs [1].
@@ -23,14 +20,14 @@ Update patch context for dpkg 1.19.4.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- dpkg-deb/build.c | 2 +-
+ src/deb/build.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 68d1875..053fcb7 100644
---- a/dpkg-deb/build.c
-+++ b/dpkg-deb/build.c
-@@ -457,7 +457,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+diff --git a/src/deb/build.c b/src/deb/build.c
+index 5c74ff3..76613ad 100644
+--- a/src/deb/build.c
++++ b/src/deb/build.c
+@@ -505,7 +505,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
      command_init(&cmd, TAR, "tar -cf");
      command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
@@ -40,4 +37,5 @@ index 68d1875..053fcb7 100644
      if (options->mode)
        command_add_args(&cmd, "--mode", options->mode, NULL);
 -- 
-2.11.0
+2.25.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index a7f3cb8f45..6900716b11 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,22 +1,21 @@
 Upstream-Status: Inappropriate [disable feature]
 
 ---
- Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0da52cb16..a1f79e0a2 100644
+index d963a10..7cef7f5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -13,8 +13,7 @@ SUBDIRS = \
+@@ -11,7 +11,6 @@ SUBDIRS = \
  	$(MAYBE_DSELECT) \
  	scripts \
- 	t-func \
--	po \
--	man
-+	po
+ 	po \
+-	man \
+ 	# EOL
  
  ACLOCAL_AMFLAGS = -I m4
- 
 -- 
-2.11.0
+2.25.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index 4f408ff777..ebf838ffe9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -3,11 +3,15 @@ busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 Upstream-Status: Inappropriate [configuration]
-Index: dpkg-1.17.1/dpkg-deb/extract.c
-===================================================================
---- dpkg-1.17.1.orig/dpkg-deb/extract.c
-+++ dpkg-1.17.1/dpkg-deb/extract.c
-@@ -318,7 +318,6 @@ extracthalf(const char *debar, const cha
+---
+ src/deb/extract.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/deb/extract.c b/src/deb/extract.c
+index a1b2dc0..95e2372 100644
+--- a/src/deb/extract.c
++++ b/src/deb/extract.c
+@@ -333,7 +333,6 @@ extracthalf(const char *debar, const char *dir,
  
        command_add_arg(&cmd, "-f");
        command_add_arg(&cmd, "-");
@@ -15,3 +19,6 @@ Index: dpkg-1.17.1/dpkg-deb/extract.c
  
        m_dup2(p2[0],0);
        close(p2[0]);
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
index ccb4f06d32..ef2e06ee4a 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "9b52f8fa74571049d868cb2af0643ee7f89a6151"
+SRCREV = "a9580d3aec5f487a81664a462ec70ec1993f19f8"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


