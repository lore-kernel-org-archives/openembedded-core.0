Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 581417F436
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:36 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b24so7412520pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BroXEbflx+R+lVjYAiIqm+COVhpAL0VAabfs9mJD5XY=;
	b=qm4O69DcKAr96P+n3OODZMGHg2kN9xKZ4D6Dk7IgLwMxwlc4Kycp4dnJpJYCsUKd1r
	f/tbIFDdQUhxUte4Y2rcQUNsxF2x8ZuJadAV3vPsg0Y+8TRD6E4/bTvu5aG5sSnRC6cA
	Zl+cIrJBAbiS7LMnPyk+WREZx1Y48ttgbP6IOFLwnOjmX36O2XDBzZFrckmh5TtYGeHe
	FGj0iZZXp6hGNzeLJUgv+17pnhSXfx6RSdApn59FCwVzRWsp99t1IwSbKuccM2XDRCjH
	tFtH8dNMRF6aUGKk7WpkFS6+7eEEdrv9pTvleCeQxaikX67ff7FJQvO9zn2NrzFARlxw
	wbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BroXEbflx+R+lVjYAiIqm+COVhpAL0VAabfs9mJD5XY=;
	b=ank2DR29fNNNMoFq7btp4LVPPtCEDlzL75IjZBbWjHLDZCrmur70IEhj+jspsmpplg
	tRdh4rlLG8Du1/JrD/UP1HBc1L6T7eRcMUNw9EqxoO/W1o0dxhTZ9jX4Ws/K3wICSOeo
	/nKxQuica8zABF5GICx3RFRBZWY+AU/unhcZF9GPfcDtyzE4Oz3Zu33oBXwmjO1Gpzio
	9nySPjqLBNZ3+6C4GS1YKjSI/pVmpTbfZe+yGJIKAywAlehQwJ4WAVbO36/fOIWOQ4F7
	dSc6qRmB0vEjmlTswCXDYPkHKkiz9zAtP1IQdvG1tyozuLDobJjFJLhPWaF3wTKAAPxJ
	kZPg==
X-Gm-Message-State: APjAAAXsMXlb8VERZoN3iUJtCu4elcTipqGp6BC8Cv79Sa8EjFXkC912
	ZcP6nj95AwsP5x5vFGCbXHpq1ofn
X-Google-Smtp-Source: APXvYqxm1qgwnLpnOaY5rs7gbFeqC4QCrTY8N56V1D0tWoJH151uysbRMDsFDGHP3OqcegXB5MkoZw==
X-Received: by 2002:a17:90a:33a9:: with SMTP id
	n38mr3384183pjb.18.1567348597318; 
	Sun, 01 Sep 2019 07:36:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:51 -0700
Message-Id: <e157d559d55ea95fd2db5726073e29de90348ec1.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 13/43] patch: fix CVE-2019-13636
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:36 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../patch/patch/CVE-2019-13636.patch               | 113 +++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-13636.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch b/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
new file mode 100644
index 0000000..9f8b6db
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
@@ -0,0 +1,113 @@
+From dce4683cbbe107a95f1f0d45fabc304acfb5d71a Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 16:21:48 +0200
+Subject: Don't follow symlinks unless --follow-symlinks is given
+
+* src/inp.c (plan_a, plan_b), src/util.c (copy_to_fd, copy_file,
+append_to_file): Unless the --follow-symlinks option is given, open files with
+the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
+that consistently for input files.
+* src/util.c (create_backup): When creating empty backup files, (re)create them
+with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
+
+CVE: CVE-2019-13636
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ src/inp.c  | 12 ++++++++++--
+ src/util.c | 14 +++++++++++---
+ 2 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/src/inp.c b/src/inp.c
+index 32d0919..22d7473 100644
+--- a/src/inp.c
++++ b/src/inp.c
+@@ -238,8 +238,13 @@ plan_a (char const *filename)
+     {
+       if (S_ISREG (instat.st_mode))
+         {
+-	  int ifd = safe_open (filename, O_RDONLY|binary_transput, 0);
++	  int flags = O_RDONLY | binary_transput;
+ 	  size_t buffered = 0, n;
++	  int ifd;
++
++	  if (! follow_symlinks)
++	    flags |= O_NOFOLLOW;
++	  ifd = safe_open (filename, flags, 0);
+ 	  if (ifd < 0)
+ 	    pfatal ("can't open file %s", quotearg (filename));
+ 
+@@ -340,6 +345,7 @@ plan_a (char const *filename)
+ static void
+ plan_b (char const *filename)
+ {
++  int flags = O_RDONLY | binary_transput;
+   int ifd;
+   FILE *ifp;
+   int c;
+@@ -353,7 +359,9 @@ plan_b (char const *filename)
+ 
+   if (instat.st_size == 0)
+     filename = NULL_DEVICE;
+-  if ((ifd = safe_open (filename, O_RDONLY | binary_transput, 0)) < 0
++  if (! follow_symlinks)
++    flags |= O_NOFOLLOW;
++  if ((ifd = safe_open (filename, flags, 0)) < 0
+       || ! (ifp = fdopen (ifd, binary_transput ? "rb" : "r")))
+     pfatal ("Can't open file %s", quotearg (filename));
+   if (TMPINNAME_needs_removal)
+diff --git a/src/util.c b/src/util.c
+index 1cc08ba..fb38307 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -388,7 +388,7 @@ create_backup (char const *to, const struct stat *to_st, bool leave_original)
+ 
+ 	  try_makedirs_errno = ENOENT;
+ 	  safe_unlink (bakname);
+-	  while ((fd = safe_open (bakname, O_CREAT | O_WRONLY | O_TRUNC, 0666)) < 0)
++	  while ((fd = safe_open (bakname, O_CREAT | O_EXCL | O_WRONLY | O_TRUNC, 0666)) < 0)
+ 	    {
+ 	      if (errno != try_makedirs_errno)
+ 		pfatal ("Can't create file %s", quotearg (bakname));
+@@ -579,10 +579,13 @@ create_file (char const *file, int open_flags, mode_t mode,
+ static void
+ copy_to_fd (const char *from, int tofd)
+ {
++  int from_flags = O_RDONLY | O_BINARY;
+   int fromfd;
+   ssize_t i;
+ 
+-  if ((fromfd = safe_open (from, O_RDONLY | O_BINARY, 0)) < 0)
++  if (! follow_symlinks)
++    from_flags |= O_NOFOLLOW;
++  if ((fromfd = safe_open (from, from_flags, 0)) < 0)
+     pfatal ("Can't reopen file %s", quotearg (from));
+   while ((i = read (fromfd, buf, bufsize)) != 0)
+     {
+@@ -625,6 +628,8 @@ copy_file (char const *from, char const *to, struct stat *tost,
+   else
+     {
+       assert (S_ISREG (mode));
++      if (! follow_symlinks)
++	to_flags |= O_NOFOLLOW;
+       tofd = create_file (to, O_WRONLY | O_BINARY | to_flags, mode,
+ 			  to_dir_known_to_exist);
+       copy_to_fd (from, tofd);
+@@ -640,9 +645,12 @@ copy_file (char const *from, char const *to, struct stat *tost,
+ void
+ append_to_file (char const *from, char const *to)
+ {
++  int to_flags = O_WRONLY | O_APPEND | O_BINARY;
+   int tofd;
+ 
+-  if ((tofd = safe_open (to, O_WRONLY | O_BINARY | O_APPEND, 0)) < 0)
++  if (! follow_symlinks)
++    to_flags |= O_NOFOLLOW;
++  if ((tofd = safe_open (to, to_flags, 0)) < 0)
+     pfatal ("Can't reopen file %s", quotearg (to));
+   copy_to_fd (from, tofd);
+   if (close (tofd) != 0)
+-- 
+cgit v1.0-41-gc330
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 85b0db7..8cf20a3 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch \
             file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
             file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
+            file://CVE-2019-13636.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.7.4


