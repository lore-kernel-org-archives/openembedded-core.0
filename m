Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 039097709E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:56 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id yy13so325932660pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=663vpTa0Tlsl37L+zWCCaHZ4o9g7Ho4cSXtD23ya79c=;
	b=HiCZvSrvsRWcF+3woWq1LRtBku5ffLIvI93u9kiYTeU/CE8QcemgLJ4i61j7vUWg4S
	kpJhNlfymvYeqAyJ9uidpR600RybB3xY8E1KylQpdQGkKufn5MHTa73sJYmOcjTvTu8q
	Nlyi+yvA+ZvaZKtdZPlB4vB47PKb3N4AwIUeb9420LSy+O6WS3hnKsPqvAVG9aRdFvwi
	+tFeNvd7WTAnaiDCnNAbpA5Sxsfl8kUp+k5Wi3aHDp/xmndO9mlnOt+yE71cc/rjvNPZ
	7szS+6B5JVY9X71yPhRSY+pC4L/IBU4nr9Qr0PXJHulUxqIvcd7V/RhiIf8HUj8CRLgk
	v39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=663vpTa0Tlsl37L+zWCCaHZ4o9g7Ho4cSXtD23ya79c=;
	b=MsfSwEvCj/4bNfSkfYmZtyZOm/D7Wkfu/tZCQGp4rplna0v9KeHD2gNHaZmMjvwVqE
	QKdW5yFZIkz7B2/nwtGKdwqBEMqqvo5RqrNlLH9dmZFlhOpDxuCJCJX4tJG3FoWPMwYX
	L8BPnvho4WUPULWsz9e/W4cG5RorT4QuvjhE18luxdYtD92wjRGAdhkL5OWe26hjFF5H
	tzA70cObyn8w4cbLctXPWBXFO9RGhsLrO7LpqqyanJLZ76aVx8DnbPkK1DO4PNADBoTj
	KaclwhcGeM/AxOxkuW6VG1QuHzSuR8Pu/s+5vGYw0AV7W9/0YifG8/xSA1Cgb1tPhmMv
	CNoQ==
X-Gm-Message-State: ALoCoQnXcVvuuGACF6if+in63SQ8XbA5QDHARxvxxkKliUrw8kUiCtmsjbBfY7M0I4f77UQJMMwLjLN4ZFhdlDt/O/7B774uaQ==
X-Received: by 10.66.142.201 with SMTP id ry9mr28959678pab.89.1453030677902;
	Sun, 17 Jan 2016 03:37:57 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:37 -0800
Message-Id: <d4925a4659964507e08b4b9e67c88f3913fbc860.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 64/73] acpid: Fix build on musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:57 -0000

implement isfdtype() if libc does not provide it

Fix build when S != B

use top_builddir instead of top_srcdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/acpid/acpid.inc                   |  2 +
 ...1-Define-isfdtype-if-libc-doesn-t-have-it.patch | 62 ++++++++++++++++++++++
 ...-config.h-from-builddir-instead-of-srcdir.patch | 51 ++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.patch
 create mode 100644 meta/recipes-bsp/acpid/acpid/0001-Use-config.h-from-builddir-instead-of-srcdir.patch

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index e015619..1d1ce98 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -5,6 +5,8 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
+           file://0001-Define-isfdtype-if-libc-doesn-t-have-it.patch \
+           file://0001-Use-config.h-from-builddir-instead-of-srcdir.patch \
            file://init \
            file://acpid.service \
           "
diff --git a/meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.patch b/meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.patch
new file mode 100644
index 0000000..9ffae30
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.patch
@@ -0,0 +1,62 @@
+From 61c9d448e2f18ed46b1a18fe82113e7c75f64d7e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Jan 2016 08:18:08 +0000
+Subject: [PATCH] Define isfdtype() if libc doesn't have it.
+
+musl does not implement isfdtype() so don't assume libc will always
+provide it, instead check for it and provide an implementation if libc
+doesn't provide one.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ configure.ac |  2 +-
+ sock.c       | 12 +++++++++++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 241db45..8cef8a4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,7 +41,7 @@ AC_CHECK_FUNC(fstatat, AC_DEFINE(HAVE_FSTATAT, 1, "Define if fstatat() exists"),
+ AC_CHECK_FUNC(openat, AC_DEFINE(HAVE_OPENAT, 1, "Define if openat() exists"), AC_MSG_ERROR(["openat() not found"]))
+ AC_CHECK_FUNC(asprintf, AC_DEFINE(HAVE_ASPRINTF, 1, "Define if asprintf() exists"), AC_MSG_ERROR(["asprintf() not found"]))
+ # These are actually required.  Should switch to above form.
+-AC_CHECK_FUNCS([alarm dup2 memset regcomp select socket strcasecmp strdup strerror strrchr strtol])
++AC_CHECK_FUNCS([alarm dup2 isfdtype memset regcomp select socket strcasecmp strdup strerror strrchr strtol])
+ 
+ # removed for now as kacpimon was not included in dist target
+ #AC_ARG_ENABLE([kacpimon],AS_HELP_STRING([--enable-kacpimon], [Build kacpimon]))
+diff --git a/sock.c b/sock.c
+index 31f816d..546e1b2 100644
+--- a/sock.c
++++ b/sock.c
+@@ -50,13 +50,23 @@ int clientmax = ACPID_CLIENTMAX;
+ /* the number of non-root clients that are connected */
+ int non_root_clients;
+ 
++#ifndef HAVE_ISFDTYPE
++static int
++isfdtype (int fd, int fdtype)
++{
++	struct stat64 st;
++	if (fstat64 (fd, &st) != 0)
++		return -1;
++	return ((st.st_mode & S_IFMT) == (mode_t) fdtype);
++}
++#endif
++
+ /* determine if a file descriptor is in fact a socket */
+ int
+ is_socket(int fd)
+ {
+     return (isfdtype(fd, S_IFSOCK) == 1);
+ }
+-
+ /* accept a new client connection */
+ static void
+ process_sock(int fd)
+-- 
+2.7.0
+
diff --git a/meta/recipes-bsp/acpid/acpid/0001-Use-config.h-from-builddir-instead-of-srcdir.patch b/meta/recipes-bsp/acpid/acpid/0001-Use-config.h-from-builddir-instead-of-srcdir.patch
new file mode 100644
index 0000000..81f2215
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid/0001-Use-config.h-from-builddir-instead-of-srcdir.patch
@@ -0,0 +1,51 @@
+From df452e28eccead1ca04cff228bc7cf55413e5b0c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Jan 2016 09:35:07 -0800
+Subject: [PATCH] Use config.h from builddir instead of srcdir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ Changelog   | 3 +++
+ Makefile.am | 4 ++--
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Changelog b/Changelog
+index a9bcaeb..17afd08 100644
+--- a/Changelog
++++ b/Changelog
+@@ -6,6 +6,9 @@
+   - Fix missing libc_compat.h in release tarball.
+     (Makefile.am kacpimon/Makefile.am kacpimon/libc_compat.h)
+     (Ted Felix)
++  - Fix out of tree build.
++    (Makefile.am)
++    (Khem Raj)
+ 
+ * Sat Aug 15 2015  Ted Felix <ted@tedfelix.com>
+   - 2.0.24 release
+diff --git a/Makefile.am b/Makefile.am
+index a27e0fe..417528f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,7 +7,7 @@
+ SUBDIRS = kacpimon
+ 
+ AM_CFLAGS = -Wall -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes -Wformat=2
+-AM_CPPFLAGS = -include $(top_srcdir)/config.h
++AM_CPPFLAGS = -include $(top_builddir)/config.h
+ 
+ sbin_PROGRAMS = acpid
+ bin_PROGRAMS = acpi_listen
+@@ -23,6 +23,6 @@ dist_man8_MANS = acpid.8 acpi_listen.8
+ dist_doc_DATA = COPYING Changelog README TESTPLAN TODO
+ 
+ # Just docs to add to the dist.
+-# One problem with this is that it includes all files in the samples dir 
++# One problem with this is that it includes all files in the samples dir
+ # including editor backups ending in ~.  It's the best we've got for now.
+ EXTRA_DIST = acpid-design.odg samples
+-- 
+2.7.0
+
-- 
2.7.0


