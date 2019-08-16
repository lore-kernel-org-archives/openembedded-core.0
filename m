Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0781F7F25B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:31:48 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e24so5470597ljg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ILQoaN8ET+VZGwb6Ldl+RK5mK/e6xeZBmSl7WCmbEZo=;
	b=VzF3EeQ0aWMBoq8K+tVqSwWKDDJkbplWnd7qoTJmk30KdG8gBPEjC3XT+4VEQ0lydE
	eEmw2VJqeRDJHnKXCMKVscIdDAg5MU4XfIvlgruoRHYE/WQUJ8knWSy7CdCmqxQWdVqr
	Gk/g8EdtvAnDiBq/4ZcGL3REqHSEGlRYE8XuHM3hHARrDpS9osIJilZ6LrOV7VRuNfp7
	ZCnTT1LVeM5GVnxv1Enqyj1siba17roiZaTIvdJTYHKXdDNgHIgHFyZm0F52QYEfM0p6
	JLwpw07/wOMQNxD29wwp+/PUma7NPYnzZzowxXKvzvkk2jwFm+48OPNSXZfayqE505Qt
	NOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ILQoaN8ET+VZGwb6Ldl+RK5mK/e6xeZBmSl7WCmbEZo=;
	b=ebvg8I7LvE/tRkxCVddIrnl7FudWHREgSjbqK/7YpVFu1PvVuNPMpRtJ67Ab6wUpI0
	pqo+Z3d7E+jl0z7imZgkT6J4kexYTFUarlLH9S6rDreEwsoaWmh7ok60uSll6/U1tZP3
	V4h5dvcJWI1Q2WxFry1VTxF7BYFmnsGGEheAr/dA/jd4mlNA5e5Nf8YOM5HO7XTeR7rq
	1qLqOAey4W2H3+z1rL4wpSWgqMTSJ7+hKZ/ki4zrwcOcFaXC/SPi+MbFD9Q+cfrQOczA
	2koTNaIdjeQ1XDquyltepzh/mJam/uLV2m0Agv3O045NT10D9E3dIz8QQvwGvbL8CM8v
	bhOw==
X-Gm-Message-State: APjAAAV46F2H9n5eo/iqxxtIMMPPaz99RyG7s5fW3kO+PBE8aDRYpgUN
	0Zxs72mRLCTpRaMbcXW89zgcuqJC6AQ=
X-Google-Smtp-Source: APXvYqxrlsTNidcAZf6OfxTDsEf2gKkJowa+obfg/s210nmmnJGFYJbQ9/28qxGCtC/p6RZydtT95Q==
X-Received: by 2002:a2e:a310:: with SMTP id l16mr5367395lje.47.1565965908852; 
	Fri, 16 Aug 2019 07:31:48 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id k6sm987404ljk.68.2019.08.16.07.31.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 07:31:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 16:31:44 +0200
Message-Id: <20190816143144.30750-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ofono: update to 1.30
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
X-List-Received-Date: Fri, 16 Aug 2019 14:31:49 -0000

Removed upstreamed patches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-t-overwrite-src_ofonod_DEPENDENCIES.patch | 50 -------------------
 ...Add-check-for-explicit_bzero-support.patch | 27 ----------
 .../0001-build-Fix-a-race-condition.patch     | 28 -----------
 ...in-Quiet-ld-errors-with-external-ell.patch | 36 -------------
 meta/recipes-connectivity/ofono/ofono_1.29.bb | 13 -----
 meta/recipes-connectivity/ofono/ofono_1.30.bb |  9 ++++
 6 files changed, 9 insertions(+), 154 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.30.bb

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch b/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch
deleted file mode 100644
index 77073ddb1c..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From eeaf8dac80f15a2b7c18d1d4ee63106973a6a873 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@kernel.org>
-Date: Tue, 21 May 2019 14:13:35 +0300
-Subject: Makefile.am: Don't overwrite src_ofonod_DEPENDENCIES
-
-src_ofonod_DEPENDENCIES did overwrite the dependencies
-automatically generated from src_ofonod_LDADD with
-incomplete dependencies.
-
-This fixes the following build error:
-...
-  CCLD     src/ofonod
-libtool:   error: cannot find the library 'gdbus/libgdbus-internal.la' or unhandled argument 'gdbus/libgdbus-internal.la'
-make: *** [Makefile:3448: src/ofonod] Error 1
-
-Upstream-Status: Submitted
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- Makefile.am | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d2e310d5..5edc4488 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -6,12 +6,10 @@ noinst_LTLIBRARIES =
- if EXTERNAL_ELL
- ell_cflags = @ELL_CFLAGS@
- ell_ldadd = @ELL_LIBS@
--ell_dependencies =
- ell_built_sources =
- else
- ell_cflags =
- ell_ldadd = ell/libell-internal.la
--ell_dependencies = $(ell_ldadd)
- ell_built_sources = ell/internal ell/ell.h
- 
- noinst_LTLIBRARIES += ell/libell-internal.la
-@@ -729,8 +727,6 @@ src_ofonod_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) $(ell_ldadd) \
- src_ofonod_LDFLAGS = -Wl,--export-dynamic \
- 				-Wl,--version-script=$(srcdir)/src/ofono.ver
- 
--src_ofonod_DEPENDENCIES = $(ell_dependencies)
--
- BUILT_SOURCES = $(local_headers) $(ell_built_sources) src/builtin.h
- 
- CLEANFILES = $(BUILT_SOURCES) $(rules_DATA)
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch b/meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch
deleted file mode 100644
index 4676bb7668..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From dff595671bf5a46f7c9231966a6cd7d2a0183076 Mon Sep 17 00:00:00 2001
-From: Marcel Holtmann <marcel@holtmann.org>
-Date: Wed, 15 May 2019 09:39:44 +0200
-Subject: build: Add check for explicit_bzero support
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index bacb7ac5..cad35c5d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,6 +54,8 @@ AC_ARG_ENABLE(pie, AC_HELP_STRING([--enable-pie],
- 	fi
- ])
- 
-+AC_CHECK_FUNCS(explicit_bzero)
-+
- AC_CHECK_FUNC(signalfd, dummy=yes,
- 			AC_MSG_ERROR(signalfd support is required))
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch b/meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch
deleted file mode 100644
index 2e2aa88265..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3e43e3342f3fada1624a28500a5337019fed7d89 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@kernel.org>
-Date: Thu, 9 May 2019 12:19:51 +0300
-Subject: build: Fix a race condition
-
-ell/ell.h was written before ell/ existed
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index a569c4a3..d2e310d5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1107,6 +1107,7 @@ ell/internal: Makefile
- 	done > $@
- 
- ell/ell.h: Makefile
-+	$(AM_V_at)$(MKDIR_P) ell
- 	$(AM_V_at)echo -n > $@
- 	$(AM_V_GEN)for f in $(ell_headers) ; do \
- 		echo "#include <$$f>" >> $@ ; \
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch b/meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch
deleted file mode 100644
index f9858e7f20..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 48e31f9fc3cf3c486c3d27a67b2687f6df0c5c71 Mon Sep 17 00:00:00 2001
-From: Denis Kenzior <denkenz@gmail.com>
-Date: Thu, 16 May 2019 15:10:53 -0500
-Subject: main: Quiet ld errors with external ell
-
-When oFono is built with --enable-external-ell, the compiler for some
-reason does not generate a debug section on some systems.  This is due
-to the fact that l_debug is never called.  However, ell also does not
-call l_debug, yet when built-in ell is used, the section is created by
-the compiler.
-
-For now work around this by adding a no-op l_debug() call in main.c.
-The real fix is to migrate all of the oFono logging functionality to use
-ell instead.
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- src/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/main.c b/src/main.c
-index 8623a060..4529cde1 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -236,6 +236,7 @@ int main(int argc, char **argv)
- 	event_loop = g_main_loop_new(NULL, FALSE);
- 
- 	l_log_set_stderr();
-+	l_debug("");
- 	l_debug_enable("*");
- 	l_main_init();
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
deleted file mode 100644
index 900a6d26d9..0000000000
--- a/meta/recipes-connectivity/ofono/ofono_1.29.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://0001-build-Fix-a-race-condition.patch \
-  file://0001-build-Add-check-for-explicit_bzero-support.patch \
-  file://0001-main-Quiet-ld-errors-with-external-ell.patch \
-  file://0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch \
-  file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
-"
-SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
-SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.30.bb b/meta/recipes-connectivity/ofono/ofono_1.30.bb
new file mode 100644
index 0000000000..c916cb1b22
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.30.bb
@@ -0,0 +1,9 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
+"
+SRC_URI[md5sum] = "2b1ce11a4db1f4b5c8cd96eb7e96ba0c"
+SRC_URI[sha256sum] = "8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c"
-- 
2.17.1


