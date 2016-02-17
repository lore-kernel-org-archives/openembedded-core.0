Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id CC7B2731C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 02:49:50 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fl4so2656558pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 18:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rkEAUGn2aQNs0r9k0RA9pxpDV/3eriN5OX3Kyao8qLc=;
	b=KzAu5mfK7hoxzEjX4oGeNaBCOzALQI3VjetL9rD6t6LkZSpDzimXhYO/YZ+dSL3wID
	jh0uwjtmEAX8gOh3dv5CoO2yqZNM4r9+i4t4em57NUPivfGMkluvYkbK97+XAyuHBUhZ
	uQkWF08nj10KcNVrGIOUoofYhno4JyLjuZlAH/BmuvemZlh12D8gILOBWc3tQykBm4kz
	1ihVgomC3xA04Vfr6UZwK6Q3BYsHjRMYwebpVVkHOj/suT//+utMw5/UFQDQyIuM0XNV
	4dvkS0ICHPYMkuORRY5RGRBxedvEUK87V5UtZaPRGZOpYXWp/+U5T99xRAsD+JwgHT5p
	O9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rkEAUGn2aQNs0r9k0RA9pxpDV/3eriN5OX3Kyao8qLc=;
	b=DDPHzUlMfhBROE2KzgW5TMQ2xtXGLBppAq55qDjDOd73Vzacb8joFW0sYiXu4rotyR
	/0Y9GkFdlVtnCS7txV+6q9ctwBnh7OVa0VFQPyt2kdekOWE2uepj8HD5fcA6tnnfFS9J
	3WohVPcxWljvTFCmWySflUE2pLecEBw8VEhPS5vZ3OMOmU1Nezbxf3AuW/AoLU6GaeoZ
	LGOxPSX331iU7+L8X9cCIjYCUxqkNfz7TXaB9vcx6VwrQjP6KvdK6SmZqiauOZuYhyTy
	BzzaJvCJKfhNsGXSEUhjPPgye5a0bDQnIaiszD68xFWOOxAPKeggOsfhiGyR1VkySVN9
	nFrQ==
X-Gm-Message-State: AG10YOSiVwphE3qkfq9rEWuuxfzUV5Gtjp7BC00ls+m4BWVDBBLjCVTVj3D//ed67CQSCQ==
X-Received: by 10.66.253.193 with SMTP id ac1mr35702567pad.121.1455677391407; 
	Tue, 16 Feb 2016 18:49:51 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	xv2sm48793623pab.10.2016.02.16.18.49.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 18:49:50 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 18:49:44 -0800
Message-Id: <1455677384-15166-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] sqlite3: update 3.10.2 -> 3.11.0
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
X-List-Received-Date: Wed, 17 Feb 2016 02:49:50 -0000

  http://www.sqlite.org/releaselog/3_11_0.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../sqlite/sqlite3/fix-disable-static-shell.patch  | 61 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3/parallel.patch | 32 ------------
 .../{sqlite3_3.10.2.bb => sqlite3_3.11.0.bb}       |  6 +--
 3 files changed, 64 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/parallel.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.10.2.bb => sqlite3_3.11.0.bb} (51%)

diff --git a/meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch b/meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
new file mode 100644
index 0000000..6f39ae2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
@@ -0,0 +1,61 @@
+From ede5db83e38cc8ad8c9be291cd8985f7ad99f291 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 16 Feb 2016 14:00:00 -0800
+Subject: [PATCH] fix --disable-static-shell
+
+Upstream sqlite seems to be moving further and further away from
+allowing the sqlite3 command line tool to be dynamically linked with
+sqlite.
+
+The --disable-static-shell configure option added in 3.10.0 no longer
+has any effect in 3.11.0. For now patch things up and make it work.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ Makefile.am  | 13 +++++++++++--
+ configure.ac |  2 +-
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0e09cfc..608c0fd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,9 +6,18 @@ libsqlite3_la_SOURCES = sqlite3.c
+ libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
+ 
+ bin_PROGRAMS = sqlite3
+-sqlite3_SOURCES = shell.c sqlite3.c sqlite3.h
+-sqlite3_LDADD = @READLINE_LIBS@
++sqlite3_SOURCES = shell.c sqlite3.h
++EXTRA_sqlite3_SOURCES = sqlite3.c
++sqlite3_LDADD = @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
+ sqlite3_DEPENDENCIES = @EXTRA_SHELL_OBJ@
++
++# Warning: Adding SQLITE_ENABLE_EXPLAIN_COMMENTS to sqlite3_CFLAGS doesn't
++# actually have any effect if we link the sqlite3 command line tool with the
++# libsqlite3.so shared library (which will contain a version of sqlite3.c
++# compiled with the default AM_CFLAGS above). If SQLITE_ENABLE_EXPLAIN_COMMENTS
++# debug is required, then sqlite3 must not be configured with
++# --disable-static-shell
++
+ sqlite3_CFLAGS = $(AM_CFLAGS) -DSQLITE_ENABLE_EXPLAIN_COMMENTS
+ 
+ include_HEADERS = sqlite3.h sqlite3ext.h
+diff --git a/configure.ac b/configure.ac
+index 8e7fd69..ada559e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -130,7 +130,7 @@ AC_ARG_ENABLE(static-shell, [AS_HELP_STRING(
+   [statically link libsqlite3 into shell tool [default=yes]])], 
+   [], [enable_static_shell=yes])
+ if test x"$enable_static_shell" == "xyes"; then
+-  EXTRA_SHELL_OBJ=sqlite3.$OBJEXT
++  EXTRA_SHELL_OBJ=sqlite3-sqlite3.$OBJEXT
+ else
+   EXTRA_SHELL_OBJ=libsqlite3.la
+ fi
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/parallel.patch b/meta/recipes-support/sqlite/sqlite3/parallel.patch
deleted file mode 100644
index 7b886a6..0000000
--- a/meta/recipes-support/sqlite/sqlite3/parallel.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 140476c3e6a6f497bdd95c0c039cb9a680f5a414 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Fri, 22 Jan 2016 15:53:04 -0800
-Subject: [PATCH] parallel build fix
-
-When statically linking the sqlite3 binary, ensure that it depends on
-its own version of sqlite3.o, instead of the version being built (in
-parallel) for use in the libsqlite3.a static library.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e9b3950..0e8f043 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,7 +129,7 @@ AC_ARG_ENABLE(static-shell, [AS_HELP_STRING(
-   [statically link libsqlite3 into shell tool [default=yes]])], 
-   [], [enable_static_shell=yes])
- if test x"$enable_static_shell" == "xyes"; then
--  EXTRA_SHELL_OBJ=sqlite3.$OBJEXT
-+  EXTRA_SHELL_OBJ=sqlite3-sqlite3.$OBJEXT
- else
-   EXTRA_SHELL_OBJ=libsqlite3.la
- fi
--- 
-1.9.1
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.10.2.bb b/meta/recipes-support/sqlite/sqlite3_3.11.0.bb
similarity index 51%
rename from meta/recipes-support/sqlite/sqlite3_3.10.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.11.0.bb
index 75fabc6..992d20c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.10.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.11.0.bb
@@ -4,8 +4,8 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
 SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://parallel.patch \
+           file://fix-disable-static-shell.patch \
 "
 
-SRC_URI[md5sum] = "adaa31593bb5605ec6d6f34f81b43008"
-SRC_URI[sha256sum] = "a2b3b4bd1291ea7d6c8252f7edff36a4362f2f0e5d5370444ba6cbe313ae2971"
+SRC_URI[md5sum] = "a6cdc3e0a6e5087d620037ae0c48720d"
+SRC_URI[sha256sum] = "508d4dcbcf7a7181e95c717a1dc4ae3c0880b3d593be0c4b40abb6c3a0e201fb"
-- 
1.9.1


