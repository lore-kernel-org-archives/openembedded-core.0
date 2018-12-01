Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6D16C48A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 01:08:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p8so3620546plo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 17:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9krnnpJjXEiptjIf5IRpramDu1eXt21kcpPr7Vnsrw0=;
	b=qxghj6dc62NLnsi25S6PT6fmKIijnC7Un1QQ76AzFARhETin0K3KnIE0pbvJqdtNRE
	48Mx6z400vDfxqy5QuQhMW2rHk6NXySwXNO73Y/weYdLaSDS0/tlxGOUuTsnBrPASvAQ
	4QVcrwYrn49ayhCwz93d9Yc6wSN0xQ3KUV4MkW0zQT/iZ7U0In3SYnG9wvneG8Enotcx
	7g+/uz27bNYRm7pAazN9TU86Ok3KaMYXvAaXPPIbPMtuRygxMf9gnQnr1cMmipwTyaX3
	i3vi7aQmC+CAVv1IXQtpva+BMazSaq3RwxptFh0efNCUpTTdeWDsH3Fd7lTXTMu3rRQu
	d+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9krnnpJjXEiptjIf5IRpramDu1eXt21kcpPr7Vnsrw0=;
	b=QMOPBVZmLtRTKeT8YnH1Oxf5WTt9hFfJsxAtRbmH7pgUHspgmiSC7+OvbhQcYVJ7W2
	DSg2TS3Z8YnFnBedeQD2/h8+LIecSzPeOfoD1ML65Rv4yLLa9g/XRYsBWj5DFGfN6NEt
	S6fiSdErAojOeUxnA41qqvl/QdcGkf9WRLfImKuN/6Yof/UxrO+8a7d6Blu1mdGLr0zx
	1VfSF7SSEu4nH6N5Bvg5j+3DbblGodirxXXiA4wdltxNfvIU7SKxfgScL/fnUc5RWyGc
	6JmCTCNJro3+Iy9g+bnzIRjWfZHOWc2j8DSH80tUIlrujzuSXN/8HIK9BK9+nQKByYSM
	85FA==
X-Gm-Message-State: AA+aEWZoIvT6dAlupXxA5LVYkgEYNt5/dVrHI0k7/amFkH8QHzF3GbYq
	4BdZZwZH1ctaD/UcJG/1ohcQHjNVb+g=
X-Google-Smtp-Source: AFSGD/Umf35kVPtH6FLTlqFpUSLe81aFG7h+CGzlilx+/7kVhdDv/Y8rTRYMc+9A2CFKZexrTZPkKw==
X-Received: by 2002:a17:902:7e44:: with SMTP id
	a4mr7768863pln.338.1543626501799; 
	Fri, 30 Nov 2018 17:08:21 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	q199sm18683422pfc.97.2018.11.30.17.08.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 17:08:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 17:08:06 -0800
Message-Id: <20181201010807.28924-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH 1/2] nfs-utils: Upgrade to 2.3.2
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
X-List-Received-Date: Sat, 01 Dec 2018 01:08:21 -0000
Content-Transfer-Encoding: 8bit

enhance the musl-only patch to degrade certain Werros into Warnings
which helps in compiling on musl, since its checking for __GLIBC__
defines which are undefined on musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nfs-utils-musl-res_querydomain.patch      | 43 +++++++++++++++++--
 ...{nfs-utils_2.3.1.bb => nfs-utils_2.3.2.bb} |  4 +-
 2 files changed, 41 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.3.1.bb => nfs-utils_2.3.2.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
index a169e6a222..22002fadca 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
@@ -1,17 +1,24 @@
+From caa19231196d73541445728e6813c8fa70345acb Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 26 Jun 2018 15:59:00 +0800
+Subject: [PATCH] nfs-utils: 2.1.1 -> 2.3.1
+
 Fixed:
 configure: error: res_querydomain needed
 
-Upstream-Status: Pending [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/musl-res_querydomain.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]
+Upstream-Status: Pending [https://github.com/alpinelinux/aports/blob/master/main/nfs-utils/musl-configure_ac.patch]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure.ac | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
+index 276dec3..760238b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -401,7 +401,7 @@ if test "$enable_gss" = yes; then
+@@ -408,7 +408,7 @@ if test "$enable_gss" = yes; then
  fi
  
  dnl libdnsidmap specific checks
@@ -20,3 +27,31 @@ diff --git a/configure.ac b/configure.ac
  
  AC_ARG_ENABLE([ldap],
  	[AS_HELP_STRING([--disable-ldap],[Disable support for LDAP @<:default=detect@:>@])])
+@@ -547,11 +547,11 @@ my_am_cflags="\
+  -pipe \
+  -Wall \
+  -Wextra \
+- -Werror=strict-prototypes \
+- -Werror=missing-prototypes \
+- -Werror=missing-declarations \
++ -Wstrict-prototypes \
++ -Wmissing-prototypes \
++ -Wmissing-declarations \
+  -Werror=format=2 \
+- -Werror=undef \
++ -Wundef \
+  -Werror=missing-include-dirs \
+  -Werror=strict-aliasing=2 \
+  -Werror=init-self \
+@@ -579,10 +579,9 @@ AC_DEFUN([CHECK_CCSUPPORT], [
+ 
+ CHECK_CCSUPPORT([-Werror=format-overflow=2], [flg1])
+ CHECK_CCSUPPORT([-Werror=int-conversion], [flg2])
+-CHECK_CCSUPPORT([-Werror=incompatible-pointer-types], [flg3])
+ CHECK_CCSUPPORT([-Werror=misleading-indentation], [flg4])
+ 
+-AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4"])
++AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg4"])
+ 
+ # Make sure that $ACLOCAL_FLAGS are used during a rebuild
+ AC_SUBST([ACLOCAL_AMFLAGS], ["-I $ac_macro_dir \$(ACLOCAL_FLAGS)"])
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb
index 6d450c7510..5c0586fa75 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb
@@ -34,8 +34,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
 
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
 
-SRC_URI[md5sum] = "d77b182a9ee396aa6221ac2401ad7046"
-SRC_URI[sha256sum] = "96d06b5a86b185815760d8f04c34fdface8fa8b9949ff256ac05c3ebc08335a5"
+SRC_URI[md5sum] = "01f5e6cd187aecf72b489c9c86cce865"
+SRC_URI[sha256sum] = "3cfe50805c4c9f57bec845eaa28dfbe5a8acb90a8d21d8d56d2840e424335b19"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.19.2


