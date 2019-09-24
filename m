Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id EC0397F0CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:25 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id q24so276466plr.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BroXEbflx+R+lVjYAiIqm+COVhpAL0VAabfs9mJD5XY=;
	b=oa6qyv8MhEzq8tfsytH2egiHQbnRUAJUDs6N3lMvl9T4iIO9CEjxICfwhagupocOKf
	l+ZglzAhbBa4XuvFQViK4euSvwu55NSLoClAQpGNH2hK753xjSiDJBBpZIVhE6yFW/1G
	r7mj7Ks5IZO6OSNIEGjY2NbtMpbnIK3trBS0NPdXOxf9byxSLKj1kNH49fSCpI8q7ixs
	Wwsv2mB7X3x7hId5Ae7RV5JSGvV3ZycrI01jF7MaEh/ve81w756GFyvcOJdMaejCKe6L
	wwXlpNcm5EgNXH9kWp6Wr3A+cFB1L4pF+CtX3ogTCARm/szWxB0rxqMZIydaQ1P+W286
	yK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BroXEbflx+R+lVjYAiIqm+COVhpAL0VAabfs9mJD5XY=;
	b=m1Y4QFscQdLrV7r2Rbf8nqDZ4wn1tIvvYtUPyeMtgsh8Zh35fIpc1jl5Ab4G719yD1
	Kc9mIJW7RKWITYVlj8lxSEoe3A/NcX1VMka8qcWleC+4LC8nq+cSggcff+3tzt5vshkC
	0QpK5oQRgeaaH/E80pliCypuTmNkNC/ekCWQlL9dj1OlYrFCDckAOdh3ogmFjyfAVJsQ
	V6zS3ojxcucwFwwlFhxNP09WKVa5FkjwiaNHwP19uvWtKjJP0UI/L5ttKVwNXbRFANmY
	gUXjb+0DpLkGaK7puTv1zJHg9PWxpcuikBdfCfI7dYnjMLacjjVgLmZslGZY229gi7gW
	44zg==
X-Gm-Message-State: APjAAAVyWkI4YwC3fG8Z4iNArJB8F7avGYRwJbQ7aHWFjkAfXF1Qw1/B
	sCfaVBcuut9sayfGLBT3bdZTdq69yNQ=
X-Google-Smtp-Source: APXvYqxE/ju63SmuOsVD71ma2OxJ9Maxoymbs4UK1K/EQi/IylOjm3DL2E2hEBILcwH87ZHSnYNpDg==
X-Received: by 2002:a17:902:9f83:: with SMTP id
	g3mr829145plq.154.1569294806589; 
	Mon, 23 Sep 2019 20:13:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:12:58 -0700
Message-Id: <bd367f58d9d6b5f0ce213e1be36763c5a9e425b6.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 02/24] patch: fix CVE-2019-13636
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:26 -0000

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


