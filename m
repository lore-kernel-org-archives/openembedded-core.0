Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 807FD60851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:56:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z34so6675118wrz.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4YWGRz+rxxnc39L1aFSKVB9ikZ03CKNCKICxK5gsgdA=;
	b=Vz32xIqAI60nBLxBPNX8FJvEtH/B6eNjaSZRGuK1yEFl0USAdWBy8X+f29/oQwr5Hr
	aFimz85kjsqPgjMAqXT97B0uolbV2Ih3Zt+lc38+zQ0ILMnTbcgI0Y2etF7Q1b0TBCe/
	6XMz0iY64z87EX2ZrVoXuue7zrJn7LWOYd6n59qmFgn4p6LA/tDUTxq9iMsxYS0iwYzL
	g+v7TqaaSErdTt1PB1/gik5W47KcmRKUZqhxt6SLh0/MH3n2fUTfSKF/xF7IB2EV2m5t
	YtBsGqMFqeZF4EVLQCkiVYTAQF2j846zY9LXRkvs5gUWOk61Ju04NT/Bbj6xXdcx8iNb
	jk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4YWGRz+rxxnc39L1aFSKVB9ikZ03CKNCKICxK5gsgdA=;
	b=TRv2AQlRgEt6E2ihyNGeqkBs/CArJh+QX7udK18UUotTH1I+jfmdh4FUcwFeu+DVLP
	9LQrfd81MyBW0JP1/P410ZMJuAd54Ue1seI1nBZPdEAzj8qcECVdzOsah8fphfLerF3c
	14LyuJgy2HxmnknA+SYmUWH+4NvgbU7ZzzhQED/X9y3vwddumJpCNNUVzuoVsFxC7vob
	4Zir/e0ZUTDW4f12DRJf4o6QpwSX4xfoBIUDU/r3mSLGnFzfSjX1ii79x+40cm9eP+Od
	gElZuON9ygj/gjaHHhBJTeoAYuPKGl4yisL6m4mc08L8v0d7bHdX3qN1Sr83wpHaLXkN
	Ipaw==
X-Gm-Message-State: AJaThX6Y3P3B17TgJA0SeO4q6ANNYVqqzndm48Ljaa6UpzOXEkFtddpB
	fBORoMBjsoqLeHu+q05TV1OhbeME
X-Google-Smtp-Source: AGs4zMarLno9y0hjtsOlHooji+Ok6HMKYWzDPm/yTFEHkfvWZlM+1He+2ul55lddI7HooftGxFvlcA==
X-Received: by 10.223.186.67 with SMTP id t3mr2117598wrg.276.1512050218704;
	Thu, 30 Nov 2017 05:56:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v23sm1934568wmh.8.2017.11.30.05.56.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 05:56:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 13:56:55 +0000
Message-Id: <20171130135655.4309-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] quilt: don't patch in an old acinclude.m4, just excude aclocal
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
X-List-Received-Date: Thu, 30 Nov 2017 13:56:58 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/quilt/quilt/aclocal.patch | 128 ------------------------
 meta/recipes-devtools/quilt/quilt_0.65.bb       |   8 +-
 2 files changed, 5 insertions(+), 131 deletions(-)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/aclocal.patch

diff --git a/meta/recipes-devtools/quilt/quilt/aclocal.patch b/meta/recipes-devtools/quilt/quilt/aclocal.patch
deleted file mode 100644
index daf44295ec0..00000000000
--- a/meta/recipes-devtools/quilt/quilt/aclocal.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-Upstream-Status: Pending
-
-Add the aclocal.m4 as acinclude.m4
-
-Index: quilt-0.47/acinclude.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ quilt-0.47/acinclude.m4	2006-10-10 17:05:56.000000000 +0100
-@@ -0,0 +1,119 @@
-+dnl Allow configure to specify a specific binary
-+dnl 1: Environment variable
-+dnl 2: binary name
-+dnl 3: optional list of alternative binary names
-+dnl 4: optional list of additional search directories
-+AC_DEFUN([QUILT_COMPAT_PROG_PATH],[
-+  m4_define([internal_$2_cmd],[esyscmd(ls compat/$2.in 2>/dev/null)])
-+
-+  AC_ARG_WITH($2, AC_HELP_STRING(
-+    [--with-$2], [name of the $2 executable to use]
-+                 m4_if(internal_$2_cmd,[],[],[ (use --without-$2
-+                          to use an internal mechanism)])),
-+  [
-+    if test x"$withval" = xnone; then
-+      AC_MSG_ERROR([Invalid configure argument.  use --without-$2])
-+    fi
-+    if test x"$withval" != xno; then
-+      AC_MSG_CHECKING(for $2)
-+      $1="$withval"
-+      if test -e "$$1"; then
-+	if test ! -f "$$1" -a ! -h "$$1" || test ! -x "$$1"; then
-+	  AC_MSG_ERROR([$$1 is not an executable file])
-+	fi
-+      fi
-+      AC_MSG_RESULT([$$1])
-+      if test ! -e "$$1"; then
-+        AC_MSG_WARN([$$1 does not exist])
-+      fi
-+      COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
-+    fi
-+  ],[
-+    m4_if([$3],[],[
-+      AC_PATH_PROG($1,$2,,$PATH:$4)
-+    ],[
-+      AC_PATH_PROGS($1,$3,,$PATH:$4)
-+      if test -n "$$1" -a "`expr "$$1" : '.*/\([[^/]]*\)$'`" != "$2"; then
-+	COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
-+      fi
-+    ])
-+    m4_if([$4],[],[],[
-+      if test -n "$$1"; then
-+	as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-+        for dir in "$4"; do
-+          if test "`dirname $$1`" = "$dir"; then
-+            COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
-+	    break
-+	  fi
-+        done
-+	IFS="$as_save_IFS"
-+      fi
-+    ])
-+  ])
-+  if test -z "$$1"; then
-+    m4_if(internal_$2_cmd,[],[
-+      AC_MSG_ERROR([Please specify the location of $2 with the option '--with-$2'])
-+    ],[
-+      AC_MSG_WARN([Using internal $2 mechanism.  Use option '--with-$2' to override])
-+      COMPAT_PROGRAMS="$COMPAT_PROGRAMS $2"
-+      $1=$2
-+      INTERNAL_$1=1
-+    ])
-+  fi
-+  AC_SUBST($1)
-+])
-+
-+dnl Allow configure to specify a specific binary
-+dnl This variant is for optional binaries.
-+dnl 1: Environment variable
-+dnl 2: binary name
-+dnl 3: optional list of alternative binary names
-+dnl 4: optional list of additional search directories
-+AC_DEFUN([QUILT_COMPAT_PROG_PATH_OPT],[
-+  AC_ARG_WITH($2, AC_HELP_STRING(
-+    [--with-$2], [name of the $2 executable to use]),
-+  [
-+    if test x"$withval" != xno; then
-+      AC_MSG_CHECKING(for $2)
-+      $1="$withval"
-+      if test -e "$$1"; then
-+	if test ! -f "$$1" -a ! -h "$$1" || test ! -x "$$1"; then
-+	  AC_MSG_ERROR([$$1 is not an executable file])
-+	fi
-+      fi
-+      AC_MSG_RESULT([$$1])
-+      if test ! -e "$$1"; then
-+        AC_MSG_WARN([$$1 does not exist])
-+      fi
-+      COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
-+    fi
-+  ],[
-+    m4_if([$3],[],[
-+      AC_PATH_PROG($1,$2,,$PATH:$4)
-+    ],[
-+      AC_PATH_PROGS($1,$3,,$PATH:$4)
-+      if test -n "$$1" -a "`expr "$$1" : '.*/\([[^/]]*\)$'`" != "$2"; then
-+	COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
-+      fi
-+    ])
-+    m4_if([$4],[],[],[
-+      if test -n "$$1"; then
-+	as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-+        for dir in "$4"; do
-+          if test "`dirname $$1`" = "$dir"; then
-+            COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
-+	    break
-+	  fi
-+        done
-+	IFS="$as_save_IFS"
-+      fi
-+    ])
-+    if test -z "$$1"; then
-+      AC_MSG_WARN([$2 not found, some optional functionalities will be missing])
-+    fi
-+  ])
-+  if test -z "$$1"; then
-+    $1=$2
-+  fi
-+  AC_SUBST($1)
-+])
diff --git a/meta/recipes-devtools/quilt/quilt_0.65.bb b/meta/recipes-devtools/quilt/quilt_0.65.bb
index 12859f0bccc..5bf818d0bbc 100644
--- a/meta/recipes-devtools/quilt/quilt_0.65.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.65.bb
@@ -1,6 +1,8 @@
 require quilt.inc
 inherit gettext
+
+SRC_URI += "file://gnu_patch_test_fix_target.patch"
+
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
 RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
-SRC_URI += "file://aclocal.patch \
-            file://gnu_patch_test_fix_target.patch \
-           "
-- 
2.11.0


