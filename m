Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F99DC021A5
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 19:16:09 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.24834.1739387768689906898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 11:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQm95vMu;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f768e9be1aso10839257b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387767; x=1739992567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4DFGCwOMfH9PlmYA2RgMFQpYnDeP66eor2Ltpjb8ss=;
        b=kQm95vMu3wIsnOpEbc/NhSml8UL241BtOqNvU+UtoY2PaZrLyr2AMMBCnXpZT+UbpY
         D0l90Mrjv2YMmepZF8BH4WPKDPmfjiu8CPmZ7Qpeavz/eg9IzTWtgySk7FGSN2o0wdhX
         l4hiqI9e/hpk8GbMNC0ikO7023ybDZotTVZGbA26qAgHy76pX/M7hDWxQCQIGuoYR/5y
         Qtr7MsL5hpl+17yq4wJh/Y5QaqWH35d+yvFGdcDibt4Durni/v2EtCXkUaNMpxykQKTz
         UbvQlVDrt+s9QwUGocMlXYnSJNAIIdM3V0WnbyxvOh71Dqr+amt8sFslDmJE/bOKq24g
         wvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387768; x=1739992568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4DFGCwOMfH9PlmYA2RgMFQpYnDeP66eor2Ltpjb8ss=;
        b=dj8diqjMnjqV4Ef3y4LxOdih4L1qczIY36n749Rjwpw+7Zv9yBeZTpAPlPdpaN8FVc
         /9ySD4XrFxBpMHaIdTsmmRrhaV/NrGDPCuBvrluoBJ83O4Yw5kgXews7WSoo73No03/q
         TXra7fKLsgUpkFbJaCdFN1gooMYRKguHbs6e2ZtpJorkEi+Ec3/6zWpZVE/1RmQ8QdPI
         CtXJKZtOBlvZIMLOdpKvuRiK2ld3mlcMU8DrjNGbR7t/fQDHavJMvi8iaAlPMmK8ZnKG
         q3bOs6xKzcVKZc33mswYlX/7hUgUhn1fcaKx5i3u+OC7SJQlQzfQ4kmwqWHcfvyz2Kb8
         GowQ==
X-Gm-Message-State: AOJu0YzLdnIEIjaZICsUhY/TDikW8HcdJ7TSXBiiVISh2oQ+H/p6qv0K
	nsrMgsIh/YDwqtd19AgwS889G7lgnDZrHNAtVHwHEAULBNpuiTy4Wd/+Mw==
X-Gm-Gg: ASbGncuyRTBXbIIYZ3CF0BPGi1XjVygQW6qG2e+T0j+kRX5tsGRXgybycoiHWjJVLfk
	3tKuA6LXG1ywS3YyRfNWrdV20nYQiYVU+pA099XUYD8XrQw4ngmuFNLHL2HJn76Tk8DJvZl94OA
	UuYBref/PC4zYqbgCTNkt7kNZf6aXySU++2Mq22GKaBq7e9R16dkcY8HyAL8M321q0NuD2iKrAg
	rI1zytgQFiGsHZnJTCRtLdYSr76lr/a+ejpxyGvlbUpL87kw598Ro5P3Dgp3NOSogRPtyMXmP9m
	LYXnhFFWv0C6UqvjIsiBay5G6WdQkUjt14EB7FuL
X-Google-Smtp-Source: AGHT+IHEqhgvt2YF9CmByfk/1HtaVXvUuP2BoVLJBpVGANgxfLqStj3ZAepZiyHH5zXu05Dn77O3xQ==
X-Received: by 2002:a05:690c:2e13:b0:6f9:b027:1bfc with SMTP id 00721157ae682-6fb33c5a833mr2235507b3.3.1739387767434;
        Wed, 12 Feb 2025 11:16:07 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce16d1sm28115017b3.23.2025.02.12.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:16:06 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 3/4] nfs-utils: Configure nfsv4 ID mapping & Kerberos
Date: Wed, 12 Feb 2025 13:12:31 -0600
Message-ID: <20250212191518.1968329-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250212191518.1968329-1-danismostlikely@gmail.com>
References: <20250212191518.1968329-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 19:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211275

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Add support for the nfsv4 user ID mapping daemon, configured with
a sensible default, and add a packageconfig for Kerberos support.

This is reasonably tested in production in our environment, but only
systemd support. There'll be some more work to do to get GSSAPI and
NFS idmapd support integreated into that.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 ...ect-warning-options-during-configure.patch | 109 +++++++
 ...-fix-undefined-function-for-libnsm.a.patch | 299 ------------------
 .../0004-Use-nogroup-for-nobody-group.patch   |  38 +++
 .../0005-find-OE-provided-Kerberos.patch      |  42 +++
 .../nfs-utils/nfs-utils/clang-warnings.patch  |  36 ---
 .../nfs-utils/nfs-utils_2.8.2.bb              |  39 ++-
 6 files changed, 219 insertions(+), 344 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch
new file mode 100644
index 00000000000..69236e8278c
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch
@@ -0,0 +1,109 @@
+From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 31 Dec 2019 08:15:34 -0800
+Subject: [PATCH] Detect warning options during configure
+
+Certain options maybe compiler specific therefore its better
+to detect them before use.
+
+nfs_error copies the format string and appends newline to it
+but compiler can forget that it was format string since its not
+same fmt string that was passed. Ignore the warning
+
+Wdiscarded-qualifiers is gcc specific and this is no longer needed
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ support/nfs/xcommon.c          | 6 ++++++
+ support/nfs/xlog.c             | 6 ++++++
+ support/nfsidmap/libnfsidmap.c | 3 +++
+ utils/exportfs/exportfs.c      | 3 +++
+ 4 files changed, 18 insertions(+)
+
+diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
+index 3989f0bc..ff438c18 100644
+--- a/support/nfs/xcommon.c
++++ b/support/nfs/xcommon.c
+@@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
+ 
+      fmt2 = xstrconcat2 (fmt, "\n");
+      va_start (args, fmt);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+      vfprintf (stderr, fmt2, args);
++#pragma GCC diagnostic pop
+      va_end (args);
+      free (fmt2);
+ }
+@@ -132,7 +135,10 @@ die(int err, const char *fmt, ...) {
+ 	va_list args;
+ 
+ 	va_start(args, fmt);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	vfprintf(stderr, fmt, args);
++#pragma GCC diagnostic pop
+ 	fprintf(stderr, "\n");
+ 	va_end(args);
+ 
+diff --git a/support/nfs/xlog.c b/support/nfs/xlog.c
+index fa125cef..dc4c9ea1 100644
+--- a/support/nfs/xlog.c
++++ b/support/nfs/xlog.c
+@@ -178,11 +178,16 @@ xlog_backend(int kind, const char *fmt, va_list args)
+ 		fprintf(stderr, "%s: ", log_name);
+ #endif
+ 		va_copy(args2, args);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 		vfprintf(stderr, fmt, args2);
++#pragma GCC diagnostic pop
+ 		fprintf(stderr, "\n");
+ 		va_end(args2);
+ 	}
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	if (log_syslog) {
+ 		switch (kind) {
+ 		case L_FATAL:
+@@ -203,6 +208,7 @@ xlog_backend(int kind, const char *fmt, va_list args)
+ 			break;
+ 		}
+ 	}
++#pragma GCC diagnostic pop
+ 
+ 	if (kind == L_FATAL)
+ 		exit(1);
+diff --git a/support/nfsidmap/libnfsidmap.c b/support/nfsidmap/libnfsidmap.c
+index f8c36480..1a28be0a 100644
+--- a/support/nfsidmap/libnfsidmap.c
++++ b/support/nfsidmap/libnfsidmap.c
+@@ -99,7 +99,10 @@ static void default_logger(const char *fmt, ...)
+ 	va_list vp;
+ 
+ 	va_start(vp, fmt);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	vsyslog(LOG_WARNING, fmt, vp);
++#pragma GCC diagnostic pop
+ 	va_end(vp);
+ }
+ 
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
+index b03a047b..eac1ff2a 100644
+--- a/utils/exportfs/exportfs.c
++++ b/utils/exportfs/exportfs.c
+@@ -646,7 +646,10 @@ dumpopt(char c, char *fmt, ...)
+ 
+ 	va_start(ap, fmt);
+ 	printf("%c", c);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	vprintf(fmt, ap);
++#pragma GCC diagnostic pop
+ 	va_end(ap);
+ 	return ',';
+ }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
deleted file mode 100644
index 7603eb680dc..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
+++ /dev/null
@@ -1,299 +0,0 @@
-From 690a90a5b7786e40b5447ad7c5f19a7657d27405 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 14 Dec 2018 17:44:32 +0800
-Subject: [PATCH] Makefile.am: fix undefined function for libnsm.a
-
-The source file of libnsm.a uses some function
-in ../support/misc/file.c, add ../support/misc/file.c
-to libnsm_a_SOURCES to fix build error when run
-"make -C tests statdb_dump":
-| ../support/nsm/libnsm.a(file.o): In function `nsm_make_pathname':
-| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
-| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
-| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
-| ../support/nsm/libnsm.a(file.o): In function `nsm_setup_pathnames':
-| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:280: undefined reference to `generic_setup_basedir'
-| collect2: error: ld returned 1 exit status
-
-As there is already one source file named file.c
-as support/nsm/file.c in support/nsm/Makefile.am,
-so rename ../support/misc/file.c to ../support/misc/misc.c.
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=154502780423058&w=2]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
-Rebase it.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- support/misc/Makefile.am |   2 +-
- support/misc/file.c      | 115 ---------------------------------------------------------------------------------------------------------------
- support/misc/misc.c      | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- support/nsm/Makefile.am  |   2 +-
- 4 files changed, 113 insertions(+), 117 deletions(-)
-
-diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
-index f9993e3..8b0e9db 100644
---- a/support/misc/Makefile.am
-+++ b/support/misc/Makefile.am
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in
- 
- noinst_LIBRARIES = libmisc.a
--libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c file.c \
-+libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c misc.c \
- 		    nfsd_path.c workqueue.c xstat.c
- 
- MAINTAINERCLEANFILES = Makefile.in
-diff --git a/support/misc/file.c b/support/misc/file.c
-deleted file mode 100644
-index 06f6bb2..0000000
---- a/support/misc/file.c
-+++ /dev/null
-@@ -1,115 +0,0 @@
--/*
-- * Copyright 2009 Oracle.  All rights reserved.
-- * Copyright 2017 Red Hat, Inc.  All rights reserved.
-- *
-- * This file is part of nfs-utils.
-- *
-- * nfs-utils is free software; you can redistribute it and/or modify
-- * it under the terms of the GNU General Public License as published by
-- * the Free Software Foundation; either version 2 of the License, or
-- * (at your option) any later version.
-- *
-- * nfs-utils is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- * You should have received a copy of the GNU General Public License
-- * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
-- */
--
--#ifdef HAVE_CONFIG_H
--#include <config.h>
--#endif
--
--#include <sys/stat.h>
--
--#include <string.h>
--#include <libgen.h>
--#include <stdio.h>
--#include <errno.h>
--#include <dirent.h>
--#include <stdlib.h>
--#include <stdbool.h>
--#include <limits.h>
--
--#include "xlog.h"
--#include "misc.h"
--
--/*
-- * Returns a dynamically allocated, '\0'-terminated buffer
-- * containing an appropriate pathname, or NULL if an error
-- * occurs.  Caller must free the returned result with free(3).
-- */
--__attribute__((__malloc__))
--char *
--generic_make_pathname(const char *base, const char *leaf)
--{
--	size_t size;
--	char *path;
--	int len;
--
--	size = strlen(base) + strlen(leaf) + 2;
--	if (size > PATH_MAX)
--		return NULL;
--
--	path = malloc(size);
--	if (path == NULL)
--		return NULL;
--
--	len = snprintf(path, size, "%s/%s", base, leaf);
--	if ((len < 0) || ((size_t)len >= size)) {
--		free(path);
--		return NULL;
--	}
--
--	return path;
--}
--
--
--/**
-- * generic_setup_basedir - set up basedir
-- * @progname: C string containing name of program, for error messages
-- * @parentdir: C string containing pathname to on-disk state, or NULL
-- * @base: character buffer to contain the basedir that is set up
-- * @baselen: size of @base in bytes
-- *
-- * This runs before logging is set up, so error messages are directed
-- * to stderr.
-- *
-- * Returns true and sets up our basedir, if @parentdir was valid
-- * and usable; otherwise false is returned.
-- */
--_Bool
--generic_setup_basedir(const char *progname, const char *parentdir, char *base,
--		      const size_t baselen)
--{
--	static char buf[PATH_MAX];
--	struct stat st;
--	char *path;
--
--	/* First: test length of name and whether it exists */
--	if ((strlen(parentdir) >= baselen) || (strlen(parentdir) >= PATH_MAX)) {
--		(void)fprintf(stderr, "%s: Directory name too long: %s",
--				progname, parentdir);
--		return false;
--	}
--	if (lstat(parentdir, &st) == -1) {
--		(void)fprintf(stderr, "%s: Failed to stat %s: %s",
--				progname, parentdir, strerror(errno));
--		return false;
--	}
--
--	/* Ensure we have a clean directory pathname */
--	strncpy(buf, parentdir, sizeof(buf)-1);
--	path = dirname(buf);
--	if (*path == '.') {
--		(void)fprintf(stderr, "%s: Unusable directory %s",
--				progname, parentdir);
--		return false;
--	}
--
--	xlog(D_CALL, "Using %s as the state directory", parentdir);
--	strcpy(base, parentdir);
--	return true;
--}
-diff --git a/support/misc/misc.c b/support/misc/misc.c
-new file mode 100644
-index 0000000..e7c3819
---- /dev/null
-+++ b/support/misc/misc.c
-@@ -0,0 +1,111 @@
-+/*
-+ * Copyright 2009 Oracle.  All rights reserved.
-+ * Copyright 2017 Red Hat, Inc.  All rights reserved.
-+ *
-+ * This file is part of nfs-utils.
-+ *
-+ * nfs-utils is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * nfs-utils is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
-+ */
-+
-+#include <sys/stat.h>
-+
-+#include <string.h>
-+#include <libgen.h>
-+#include <stdio.h>
-+#include <errno.h>
-+#include <dirent.h>
-+#include <stdlib.h>
-+#include <stdbool.h>
-+#include <limits.h>
-+
-+#include "xlog.h"
-+#include "misc.h"
-+
-+/*
-+ * Returns a dynamically allocated, '\0'-terminated buffer
-+ * containing an appropriate pathname, or NULL if an error
-+ * occurs.  Caller must free the returned result with free(3).
-+ */
-+__attribute__((__malloc__))
-+char *
-+generic_make_pathname(const char *base, const char *leaf)
-+{
-+	size_t size;
-+	char *path;
-+	int len;
-+
-+	size = strlen(base) + strlen(leaf) + 2;
-+	if (size > PATH_MAX)
-+		return NULL;
-+
-+	path = malloc(size);
-+	if (path == NULL)
-+		return NULL;
-+
-+	len = snprintf(path, size, "%s/%s", base, leaf);
-+	if ((len < 0) || ((size_t)len >= size)) {
-+		free(path);
-+		return NULL;
-+	}
-+
-+	return path;
-+}
-+
-+
-+/**
-+ * generic_setup_basedir - set up basedir
-+ * @progname: C string containing name of program, for error messages
-+ * @parentdir: C string containing pathname to on-disk state, or NULL
-+ * @base: character buffer to contain the basedir that is set up
-+ * @baselen: size of @base in bytes
-+ *
-+ * This runs before logging is set up, so error messages are directed
-+ * to stderr.
-+ *
-+ * Returns true and sets up our basedir, if @parentdir was valid
-+ * and usable; otherwise false is returned.
-+ */
-+_Bool
-+generic_setup_basedir(const char *progname, const char *parentdir, char *base,
-+		      const size_t baselen)
-+{
-+	static char buf[PATH_MAX];
-+	struct stat st;
-+	char *path;
-+
-+	/* First: test length of name and whether it exists */
-+	if ((strlen(parentdir) >= baselen) || (strlen(parentdir) >= PATH_MAX)) {
-+		(void)fprintf(stderr, "%s: Directory name too long: %s",
-+				progname, parentdir);
-+		return false;
-+	}
-+	if (lstat(parentdir, &st) == -1) {
-+		(void)fprintf(stderr, "%s: Failed to stat %s: %s",
-+				progname, parentdir, strerror(errno));
-+		return false;
-+	}
-+
-+	/* Ensure we have a clean directory pathname */
-+	strncpy(buf, parentdir, sizeof(buf)-1);
-+	path = dirname(buf);
-+	if (*path == '.') {
-+		(void)fprintf(stderr, "%s: Unusable directory %s",
-+				progname, parentdir);
-+		return false;
-+	}
-+
-+	xlog(D_CALL, "Using %s as the state directory", parentdir);
-+	strcpy(base, parentdir);
-+	return true;
-+}
-diff --git a/support/nsm/Makefile.am b/support/nsm/Makefile.am
-index 8f5874e..68f1a46 100644
---- a/support/nsm/Makefile.am
-+++ b/support/nsm/Makefile.am
-@@ -10,7 +10,7 @@ GENFILES	= $(GENFILES_CLNT) $(GENFILES_SVC) $(GENFILES_XDR) $(GENFILES_H)
- EXTRA_DIST	= sm_inter.x
- 
- noinst_LIBRARIES = libnsm.a
--libnsm_a_SOURCES = $(GENFILES) file.c rpc.c
-+libnsm_a_SOURCES = $(GENFILES) ../misc/misc.c file.c rpc.c
- 
- BUILT_SOURCES = $(GENFILES)
- 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
new file mode 100644
index 00000000000..bbf44d59771
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -0,0 +1,38 @@
+From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From: Daniel McGregor <daniel.mcgregor@vecima.com>
+Date: Tue, 6 Jun 2023 16:07:53 -0600
+Subject: [PATCH] Use "nogroup" for nobody group
+
+Upstream-Status: Inappropriate [oe-core specific, configuration]
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+---
+ support/nfsidmap/idmapd.conf | 2 +-
+ utils/idmapd/idmapd.c        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
+index 2a2f79a1..e6f3724f 100644
+--- a/support/nfsidmap/idmapd.conf
++++ b/support/nfsidmap/idmapd.conf
+@@ -41,7 +41,7 @@
+ [Mapping]
+ 
+ #Nobody-User = nobody
+-#Nobody-Group = nobody
++#Nobody-Group = nogroup
+ 
+ [Translation]
+ 
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
+index cd9a965f..3be805e9 100644
+--- a/utils/idmapd/idmapd.c
++++ b/utils/idmapd/idmapd.c
+@@ -89,7 +89,7 @@
+ #endif
+ 
+ #ifndef NFS4NOBODY_GROUP
+-#define NFS4NOBODY_GROUP "nobody"
++#define NFS4NOBODY_GROUP "nogroup"
+ #endif
+ 
+ /* From Niels */
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
new file mode 100644
index 00000000000..3241e8e8598
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -0,0 +1,42 @@
+From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From: Daniel McGregor <daniel.mcgregor@vecima.com>
+Date: Wed, 8 Nov 2023 16:24:20 -0600
+Subject: [PATCH] find OE provided Kerberos
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+---
+ aclocal/kerberos5.m4 | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
+index f96f0fd4..ad85fdf2 100644
+--- a/aclocal/kerberos5.m4
++++ b/aclocal/kerberos5.m4
+@@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
+     dnl This ugly hack brought on by the split installation of
+     dnl MIT Kerberos on Fedora Core 1
+     K5CONFIG=""
+-    if test -f $dir/bin/krb5-config; then
+-      K5CONFIG=$dir/bin/krb5-config
++    if test -f $dir/bin/crossscripts/krb5-config; then
++      K5CONFIG=$dir/bin/crossscripts/krb5-config
+     elif test -f "/usr/kerberos/bin/krb5-config"; then
+       K5CONFIG="/usr/kerberos/bin/krb5-config"
+     elif test -f "/usr/lib/mit/bin/krb5-config"; then
+@@ -72,6 +72,7 @@ AC_DEFUN([AC_KERBEROS_V5],[
+   AC_MSG_RESULT($KRBDIR)
+ 
+   dnl Check if -rpath=$(KRBDIR)/lib is needed
++  if false; then
+   echo "The current KRBDIR is $KRBDIR"
+   if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
+        -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
+@@ -81,6 +82,7 @@ AC_DEFUN([AC_KERBEROS_V5],[
+   else
+     KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
+   fi
++  fi
+ 
+   dnl Now check for functions within gssapi library
+   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
deleted file mode 100644
index fde99b599eb..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 31 Dec 2019 08:15:34 -0800
-Subject: [PATCH] Detect warning options during configure
-
-Certain options maybe compiler specific therefore its better
-to detect them before use.
-
-nfs_error copies the format string and appends newline to it
-but compiler can forget that it was format string since its not
-same fmt string that was passed. Ignore the warning
-
-Wdiscarded-qualifiers is gcc specific and this is no longer needed
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- support/nfs/xcommon.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
-index 3989f0b..e080423 100644
---- a/support/nfs/xcommon.c
-+++ b/support/nfs/xcommon.c
-@@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
- 
-      fmt2 = xstrconcat2 (fmt, "\n");
-      va_start (args, fmt);
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
-      vfprintf (stderr, fmt2, args);
-+#pragma GCC diagnostic pop
-      va_end (args);
-      free (fmt2);
- }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index f07ed2040ad..abbdec7808d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -21,10 +21,11 @@ USERADD_PARAM:${PN}-client = "--system  --home-dir /var/lib/nfs \
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
            file://nfsserver \
            file://nfscommon \
-           file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
-           file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0001-Fix-typecast-warning-with-clang.patch \
+           file://0001-Detect-warning-options-during-configure.patch \
+           file://0004-Use-nogroup-for-nobody-group.patch \
+           file://0005-find-OE-provided-Kerberos.patch \
            "
 
 SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
@@ -49,9 +50,8 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
                 --enable-libmount-mount \
                 --enable-uuid \
-                --disable-gss \
-                --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
+                --with-pluginpath=${libdir}/libnfsidmap \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
                "
 
@@ -60,13 +60,16 @@ LDFLAGS += "-lsqlite3 -levent"
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
+
 PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
+#krb5 is available in meta-oe
+PACKAGECONFIG[gssapi] = "--with-krb5=${STAGING_EXECPREFIXDIR} --enable-gss --enable-svcgss,--disable-gss --disable-svcgss,krb5"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
 # keyutils is available in meta-oe
-PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
+PACKAGECONFIG[nfsv4] = "--enable-nfsv4 --enable-nfsdcltrack,--disable-nfsv4 --disable-nfsdcltrack,keyutils,python3-core"
 PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd"
 
@@ -76,19 +79,34 @@ CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
 			   ${localstatedir}/lib/nfs/xtab \
 			   ${localstatedir}/lib/nfs/statd/state \
+			   ${sysconfdir}/idmapd.conf \
 			   ${sysconfdir}/nfs.conf \
 			   ${sysconfdir}/nfsmount.conf"
 
 FILES:${PN}-client = "${sbindir}/*statd \
-		      ${libdir}/libnfsidmap.so.* \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \
+		      ${sbindir}/rpc.gssd \
 		      ${sbindir}/nfsconf \
+		      ${libdir}/libnfsidmap.so.* \
+		      ${libdir}/libnfsidmap/*.so \
+		      ${libexecdir}/nfsrahead \
 		      ${localstatedir}/lib/nfs \
+		      ${sysconfdir}/idmapd.conf \
+		      ${sysconfdir}/init.d/nfscommon \
 		      ${sysconfdir}/nfs.conf \
 		      ${sysconfdir}/nfsmount.conf \
-		      ${sysconfdir}/init.d/nfscommon \
-		      ${systemd_system_unitdir}/nfs-statd.service"
+		      ${systemd_system_unitdir}/auth-rpcgss-module.service \
+		      ${systemd_system_unitdir}/nfs-client.target \
+		      ${systemd_system_unitdir}/nfs-idmapd.service \
+		      ${systemd_system_unitdir}/nfs-statd.service \
+		      ${systemd_system_unitdir}/nfscommon.service \
+		      ${systemd_system_unitdir}/rpc-gssd.service \
+		      ${systemd_system_unitdir}/rpc-statd-notify.service \
+		      ${systemd_system_unitdir}/rpc-statd.service \
+		      ${systemd_system_unitdir}/rpc_pipefs.target \
+		      ${systemd_system_unitdir}/var-lib-nfs-rpc_pipefs.mount \
+		      ${nonarch_libdir}/udev/rules.d/*"
 RDEPENDS:${PN}-client = "${PN}-mount rpcbind"
 
 FILES:${PN}-mount = "${base_sbindir}/*mount.nfs*"
@@ -105,7 +123,9 @@ FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_libdir}/modp
 
 do_configure:prepend() {
 	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-		${S}/utils/mount/Makefile.am ${S}/utils/nfsdcltrack/Makefile.am
+		-e 's,udev_rulesdir = /usr/lib/udev/rules.d/,udev_rulesdir = ${nonarch_base_libdir}/udev/rules.d/,g' \
+		${S}/utils/mount/Makefile.am ${S}/utils/nfsdcltrack/Makefile.am \
+		${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
 }
 
 # Make clean needed because the package comes with
@@ -122,6 +142,7 @@ do_install:append () {
 	install -m 0755 ${UNPACKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
 	install -m 0755 ${UNPACKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
+	install -m 0644 ${S}/support/nfsidmap/idmapd.conf ${D}${sysconfdir}
 	install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}
 
 	install -d ${D}${systemd_system_unitdir}
-- 
2.47.0


