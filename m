Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id D11BB7F322
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 09:42:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id l11so5850002wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/G3W9YTrDcegojJDC1Bh8eZoj7B/bMPEgOGtT7mTFpc=;
	b=DdPMjZvsB5SV10R5krQr1UF5s5YGhCkybrhUvyuw/jTpuRvQZB1eQnNhbS/1KteA+9
	5Zttlhay/5WVjMajeUV8CbdSGkvDTk3q4a+BntkyDmI+ye+23yuk22xt7oeRtOIb+cKO
	hi+WYuyAYeYQSRsgj3AvxB4s64P0KvRx5YOtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/G3W9YTrDcegojJDC1Bh8eZoj7B/bMPEgOGtT7mTFpc=;
	b=hrbBcQMuuUIEUPQL7klXS5zx03IkR3oRRyQOzU3wkXYHLOUeWbak4TziLLmCEI2ZoZ
	AhYBx3RcmXzW1Br2syo1MfGq2oECNlnanRnDf86c1nKL/gqLy01refeC3z+7OczobbW2
	YHezbO/H4crBzCWMEAXfIuNlFnlvOeAycSg34/a7b6etKcxNrV52GC7bhgHjLgf0fAp3
	0Glm0S1h9OGxlwwW8/vQDjDfVgzHVOj9qPpJWN78/hG8DUpFQhJLscudfqy/a5QW+WNT
	AFbOYeyk5z0eXDKlrJuV5vtzN/FgsLZHVDHxdiEdaq6VbK15/2o+0UpGAIyPskBvYCuI
	LCUQ==
X-Gm-Message-State: APjAAAXxnkS1Q/hJDNW6fP1vnCvrn+p/1Db9iomV4PlinChWZeY76k41
	Gwgq28CbMxaHrle7ZOX9oSLHtteqz2Q2Mw==
X-Google-Smtp-Source: APXvYqyBNT4u1JRfK/VyNdOBkrtCVYSVgYckYUFuVr80KrjkT1+pOZa1Hlmf59dl+kue3sZWc6FHYA==
X-Received: by 2002:adf:fb11:: with SMTP id c17mr6325698wrr.0.1567762968013;
	Fri, 06 Sep 2019 02:42:48 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m3sm4805223wmc.44.2019.09.06.02.42.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 02:42:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 10:42:45 +0100
Message-Id: <20190906094245.9309-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Wenzong Fan <wenzong.fan@windriver.com>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
Subject: [PATCH] systemtap: Drop patches merged upstream
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
X-List-Received-Date: Fri, 06 Sep 2019 09:42:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several of our patches were merged upstream just beyond our current version.
Update to that version and drop them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../configure-allow-to-disable-libvirt.patch  | 39 -------------------
 .../systemtap/systemtap/monitor-option.patch  | 37 ------------------
 .../systemtap/systemtap/no-msgfmt-check.patch | 33 ----------------
 .../systemtap/systemtap/x32_abi_time.patch    | 34 ----------------
 .../systemtap/systemtap_git.inc               |  6 +--
 5 files changed, 1 insertion(+), 148 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch b/meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch
deleted file mode 100644
index b4f2fbc0664..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5eb10d90af9178edb65e6091ae939d1b5b19bb78 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Tue, 23 Sep 2014 04:47:10 -0400
-Subject: [PATCH] systemtap: allow to disable libvirt
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- configure.ac |   13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a631ae7..cb4885b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -525,10 +525,15 @@ dnl Check for the libvirt and libxml2 devel packages
- 
- dnl We require libvirt >= 1.0.2 because stapvirt relies on the
- dnl virDomainOpenChannel function, which was implemented in 1.0.2.
--PKG_CHECK_MODULES([libvirt], [libvirt >= 1.0.2], [
--   have_libvirt=yes
--   AC_DEFINE([HAVE_LIBVIRT],[1],[Define to 1 if libvirt development libraries are installed])
--   ], [have_libvirt=no])
-+AC_ARG_ENABLE([libvirt],
-+  AS_HELP_STRING([--disable-libvirt], [Do not use libvirt even if present]))
-+
-+if test "$enable_libvirt" != no; then
-+  PKG_CHECK_MODULES([libvirt], [libvirt >= 1.0.2], [
-+     have_libvirt=yes
-+     AC_DEFINE([HAVE_LIBVIRT],[1],[Define to 1 if libvirt development libraries are installed])
-+     ], [have_libvirt=no])
-+fi
- AM_CONDITIONAL([HAVE_LIBVIRT], [test "${have_libvirt}" = "yes"])
- PKG_CHECK_MODULES([libxml2], [libxml-2.0], [
-    have_libxml2=yes
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
deleted file mode 100644
index 9313a5aba3e..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 93fc4744fedf6fc593ee656968da97f7b1862ada Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 4 Oct 2016 16:37:53 +0100
-Subject: [PATCH 4/6] systemtap: rationalise dependencies
-
-Add an option to explicitly disable the monitor (and therefore the dependency on
-json-c and ncurses).
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -766,13 +766,16 @@ dnl We want either (or both) python prob
- AM_CONDITIONAL([HAVE_PYTHON_PROBES],
-   [test "x$have_python2_support" = "xyes" -o "x$have_python3_support" = "xyes"])
- 
-+AC_ARG_ENABLE([monitor], AS_HELP_STRING([--disable-monitor],[Disable monitor]))
-+if test "$enable_monitor" != "no"; then
- dnl Check for presence of json-c and ncurses for use in monitor mode
- PKG_CHECK_MODULES([jsonc], [json-c >= 0.11], [have_jsonc=yes], [have_jsonc=no])
- PKG_CHECK_MODULES([ncurses], [ncurses], [have_ncurses=yes], [have_ncurses=no])
--AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes"])
- if test "${have_jsonc}" == "yes" -a "${have_ncurses}" == yes; then
-   AC_DEFINE([HAVE_MONITOR_LIBS],[1],[Define to 1 if json-c and ncurses libraries are installed])
- fi
-+fi
-+AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes" -a "$enable_monitor" != "no"])
- 
- AC_CACHE_CHECK([for assembler .section "?" flags support], stap_cv_sectionq, [
- old_CFLAGS="$CFLAGS"
diff --git a/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
deleted file mode 100644
index 2c860b19e51..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 43f1b04449bb1cf7e0092263f1c2a25f3fca08ef Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 8 Nov 2016 23:07:41 +0000
-Subject: [PATCH 5/6] systemtap: remove explicit msgfmt check
-
-There is no need to explicitly check that msgfmt was found as the gettext macros
-handle this for us if NLS is enabled.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- configure.ac | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2ea9b3cbf..95417f59c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,10 +36,6 @@ AC_CHECK_FUNCS(openat)
- AM_GNU_GETTEXT(external)
- AM_GNU_GETTEXT_VERSION([0.19.4])
- 
--if test "x$GMSGFMT" = "x:"; then
--   AC_MSG_ERROR([missing gnu /usr/bin/msgfmt])
--fi
--
- # We want the 'PYTHON' varible to be python version 2. We also want
- # our custom 'PYTHON3' varible to be python version 3.
- #
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch b/meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch
deleted file mode 100644
index 28a7eae407a..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Fix time_t print because in x32 ABI is long long int instead of long int.
-
-Upstream-Status: Pending
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
-diff --git a/cache.cxx b/cache.cxx
-index 3546b30..19c77ca 100644
---- a/cache.cxx
-+++ b/cache.cxx
-@@ -294,7 +294,11 @@ clean_cache(systemtap_session& s)
-         {
-           //interval not passed, don't continue
-           if (s.verbose > 1)
-+#if defined(__x86_64__) && defined (__ILP32__)
-+            clog << _F("Cache cleaning skipped, interval not reached %lld s / %lu s.",
-+#else
-             clog << _F("Cache cleaning skipped, interval not reached %lu s / %lu s.",
-+#endif
-                        (current_time.tv_sec-sb.st_mtime), cache_clean_interval)  << endl;
-           return;
-         }
-@@ -302,7 +306,11 @@ clean_cache(systemtap_session& s)
-         {
-           //interval reached, continue
-           if (s.verbose > 1)
-+#if defined(__x86_64__) && defined (__ILP32__)
-+            clog << _F("Cleaning cache, interval reached %lld s > %lu s.",
-+#else
-             clog << _F("Cleaning cache, interval reached %lu s > %lu s.",
-+#endif
-                        (current_time.tv_sec-sb.st_mtime), cache_clean_interval)  << endl;
-         }
- 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index f16f851e610..abb2b3743b4 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,9 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "a25199c9580b9b66424c494d3bf39c4d1b7e1f7b"
+SRCREV = "57c9aca9f1ff32a6add10e02ecd33b7314fad499"
 PV = "4.1+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-           file://configure-allow-to-disable-libvirt.patch \
-           file://x32_abi_time.patch \
-           file://monitor-option.patch \
-           file://no-msgfmt-check.patch \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-- 
2.20.1


