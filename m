Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C96357FDAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 05:26:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so9862710wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 21:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jMvIMp22a+hl1T64D072aZuVQ+qqZZ9wG8wM6kkq8+I=;
	b=nX/cAfoxdgyaR394FHA6b7AHbWBOTGIAOYir4tGQJBwvBopn6iDwxW+2c3mHwdcg5W
	aGfLA0y2ts8se/JTmjtaT/xxrH6/XhSi1ovDLJpRfPoeVC4KDlTNmahSMyTU9ogbhJOV
	5LK6OdSJzWQXp4xJKthoPMhCwNKXmgsk06ml5+/hnypWW03QBBbBGN/B/kMg2PPJZ4CO
	SdLr1nEj0uUYWv+isdphLHM/JKrMdMdELYfu8UCEToHI/dsOHv+glrHKgMzOlkl6fd5z
	O8ixFm/Cr5XTf8QPUCCLLnmpY91XUmhBW+joEvZ+SLQSfcXnDbojRqs+TGh+v9wUY36c
	8s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jMvIMp22a+hl1T64D072aZuVQ+qqZZ9wG8wM6kkq8+I=;
	b=CjdvZjekOMiBXa70DnXnBdczrB3nPL2JSg48Pu+0JyWEBo1/CDJpWHlFAvpYlegmIC
	+OwpUB5gQvVt0Y5IzbXM0XvYee93MmVKigi1DNtF8kX91ZSXZ8ZtxlOJs+nTRKyRmIda
	gRvh93ZXsZIErj0I1Mf6/1Kh4JO7ogFuljibO0RhSLqlovFcRkIsHUvWGJsAqX3Fq3jw
	USp7y8AGmpybTB4vIcx0/mRcH+0xAmls8xrS3/GTHg9W1lqKLgXhHBYVF/zxU6JhETTm
	A4bbJNn106kDcOqWPTUtQRAfJ4Lp0zdbzyG+3nt7bOUCCEIECLpOzs9zl8Uj5ppOs5NS
	dpXw==
X-Gm-Message-State: APjAAAWibLz49OOpRbts7u/I1Ui7MZ2Z/rJVStzVsNLZvYQktPC29fFJ
	U8ocGOdZ5uovqC6tytdBtzaLeC7V
X-Google-Smtp-Source: APXvYqwAJN7eeU8KPtl1HvtuR01TrH9xZP4asyf+AShpdwHxQBo9ANCpJeSnTQdKHONpqcxtKb9M5w==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr35986094wrh.371.1576560383008; 
	Mon, 16 Dec 2019 21:26:23 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	60sm24481263wrn.86.2019.12.16.21.26.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 21:26:22 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 05:26:19 +0000
Message-Id: <20191217052619.26109-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnutls: upgrade 3.6.8 -> 3.6.11.1
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
X-List-Received-Date: Tue, 17 Dec 2019 05:26:23 -0000

Drop patch from 81485be19b18 ("gnutls: don't use HOSTTOOLS_DIR/bash as a
shell on target") as upstream now honours POSIX_SHELL when set as the
primary target shell.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../gnutls/gnutls/posix-shell.patch           | 39 -------------------
 .../{gnutls_3.6.8.bb => gnutls_3.6.11.1.bb}   |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/posix-shell.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.8.bb => gnutls_3.6.11.1.bb} (92%)

diff --git a/meta/recipes-support/gnutls/gnutls/posix-shell.patch b/meta/recipes-support/gnutls/gnutls/posix-shell.patch
deleted file mode 100644
index 938e2d1e18f6..000000000000
--- a/meta/recipes-support/gnutls/gnutls/posix-shell.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Don't embed the path to the build-time POSIX shell as this will be
-$TMPDIR/hosttools/bash, which is no good on the target.
-
-Instead default to /bin/sh but allow it to be set in the environment.
-
-This isn't really upstreamable but I filed a bug at
-https://gitlab.com/gnutls/gnutls/issues/807 and hope a proper fix will be
-integrated.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/src/libopts/m4/libopts.m4 b/src/libopts/m4/libopts.m4
-index c6ad738..a62faca 100644
---- a/src/libopts/m4/libopts.m4
-+++ b/src/libopts/m4/libopts.m4
-@@ -112,21 +112,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
-   AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
-                  strrchr strsignal fchmod fstat chmod])
-   AC_PROG_SED
--  [while :
--  do
--      POSIX_SHELL=`which bash`
--      test -x "$POSIX_SHELL" && break
--      POSIX_SHELL=`which dash`
--      test -x "$POSIX_SHELL" && break
--      POSIX_SHELL=/usr/xpg4/bin/sh
--      test -x "$POSIX_SHELL" && break
--      POSIX_SHELL=`/bin/sh -c '
--          exec 2>/dev/null
--          if ! true ; then exit 1 ; fi
--          echo /bin/sh'`
--      test -x "$POSIX_SHELL" && break
--      ]AC_MSG_ERROR([cannot locate a working POSIX shell])[
--  done]
-+  POSIX_SHELL="${POSIX_SHELL:-/bin/sh}"
-   AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${POSIX_SHELL}"],
-            [define to a working POSIX compliant shell])
-   AC_SUBST([POSIX_SHELL])
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.8.bb b/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
similarity index 92%
rename from meta/recipes-support/gnutls/gnutls_3.6.8.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
index c927063f0a34..5b05364c258d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
@@ -19,11 +19,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
-           file://posix-shell.patch \
 "
 
-SRC_URI[md5sum] = "9dcf0aa45d1a42e1b3ca5d39ec7c61a8"
-SRC_URI[sha256sum] = "aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83"
+SRC_URI[md5sum] = "3670ee0b0d95b3dee185eff2dc910ee7"
+SRC_URI[sha256sum] = "fbba12f3db9a55dbf027e14111755817ec44b57eabec3e8089aac8ac6f533cf8"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1


