Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4786074FEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:29 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id w3-v6so2632403pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pg1QRVBeZFPGtAElXvlDhOlUqrLg6jOJ8lkwuzcIgXY=;
	b=M7XkotwdPbm0o7Bu4EZMeWopuEFqhqg7pL7cjP27+H8qzZ9i1Kfc1nmjyxP+kKFc5E
	PBJnp/ax76hYn+wZuoVi7cGWAJOYnybScjr6Qm/WzPnZIzodX5hZ4w317zJx2lTkyxoh
	fuzaWZxZyBOZwpYM9X8XhZ3M1uVYExPOiiRJk7in8LlkctciCewBVY5eDAE6LeXadEcu
	ar8e3B0zODizJGE+CbNlVoTAb5QQ1RfDlSFl/Ov0tgWZ3GRqGMZks85GaVzkvn28SrSx
	8AViZTQpUTUdZH3J2ROvE6+pxGEpyIM78M5iH4oLS2IYxqU69MkbBpv8Ow5a2UcF+hQV
	5YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pg1QRVBeZFPGtAElXvlDhOlUqrLg6jOJ8lkwuzcIgXY=;
	b=fQKd0JcT0rZ6SyDkskHdKILarkV4t8bqXif9nwwT/cj7fjyZkWrk5XEZKf5XJwfj0T
	qmHbTZ+kzckaenmHRQfppDMasUIFwFj1g18gdF0xM/EdEZ35i+3fYGeMPEk7EG6x0MtZ
	UH00jfbF4T21R5/zugWMcUyMtw7Jarq1vNafjKJMptdAg9in55O5f12XB25G+k5pCzDO
	3piZf9FVKP1yJZB4BtrjiGbU+wQHfUmn1qN8+HPbc1+9ZlPw4rqK95IINWQbvSI8fR26
	+Dj6iCqAQwIsLv6QrdJmlp++3JjB3jiy7CvyQhAPKSRZbZgIuhwR51+B4D7dzvzNIbeT
	/EVg==
X-Gm-Message-State: ALQs6tC1mp0B20UZ6la+0W6C917iQhGCEHxaxNMxAwy0W4lNrW3fU3pW
	4pyw8Bs+sW2JsJLUXOjhcHvPRg==
X-Google-Smtp-Source: AB8JxZooo5kTaT0gvY0UNeHX6ypRJMyiLslvZUjpeGbICQF8PwndU16zSDfF59RfBPkxvZr9f0BmjA==
X-Received: by 2002:a63:2bc4:: with SMTP id
	r187-v6mr36204347pgr.231.1525897470657; 
	Wed, 09 May 2018 13:24:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:19 -0700
Message-Id: <20180509202422.22501-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH 6/9] strace: Upgrade to 4.22
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
X-List-Received-Date: Wed, 09 May 2018 20:24:30 -0000

License-Update: Update Copyright years

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/disable-git-version-gen.patch      | 12 +++++-----
 ...st-test-for-m32-mx32-compile-support.patch | 22 +++++++++----------
 .../strace/{strace_4.20.bb => strace_4.22.bb} | 11 ++++++----
 3 files changed, 23 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.20.bb => strace_4.22.bb} (85%)

diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
index 76daf3a3b7..47b1139c53 100644
--- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
+++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -5,16 +5,16 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 
-diff --git a/configure.ac b/configure.ac
-index 7004bd3..b2b03c6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,7 +31,7 @@
+Index: strace-4.22/configure.ac
+===================================================================
+--- strace-4.22.orig/configure.ac
++++ strace-4.22/configure.ac
+@@ -32,7 +32,7 @@
  
  AC_PREREQ(2.57)
  AC_INIT([strace],
 -	m4_esyscmd([./git-version-gen .tarball-version]),
 +	m4_esyscmd_s([cat .tarball-version]),
- 	[strace-devel@lists.sourceforge.net],
+ 	[strace-devel@lists.strace.io],
  	[strace],
  	[https://strace.io])
diff --git a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
index 756cd8bb82..3d4913d68e 100644
--- a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
+++ b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
@@ -22,25 +22,23 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  m4/mpers.m4 | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/m4/mpers.m4 b/m4/mpers.m4
-index 1fe8a8e..d72c717 100644
---- a/m4/mpers.m4
-+++ b/m4/mpers.m4
-@@ -53,12 +53,14 @@ case "$arch" in
- 	CFLAGS="$CFLAGS CFLAG $IFLAG"
- 	AC_CACHE_CHECK([for CFLAG compile support], [st_cv_cc],
+Index: strace-4.22/m4/mpers.m4
+===================================================================
+--- strace-4.22.orig/m4/mpers.m4
++++ strace-4.22/m4/mpers.m4
+@@ -108,6 +108,7 @@ case "$arch" in
+ 	CFLAGS="$CFLAGS MPERS_CFLAGS $IFLAG"
+ 	AC_CACHE_CHECK([for mpers_name personality compile support], [st_cv_cc],
  		[AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
 +						     #include <sys/syscall.h>
  						     int main(){return 0;}]])],
  				   [st_cv_cc=yes],
  				   [st_cv_cc=no])])
- 	if test $st_cv_cc = yes; then
- 		AC_CACHE_CHECK([for CFLAG runtime support], [st_cv_runtime],
+@@ -115,6 +116,7 @@ case "$arch" in
+ 		AC_CACHE_CHECK([for mpers_name personality runtime support],
+ 			[st_cv_runtime],
  			[AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
 +							 #include <sys/syscall.h>
  							 int main(){return 0;}]])],
  				       [st_cv_runtime=yes],
  				       [st_cv_runtime=no],
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace_4.20.bb b/meta/recipes-devtools/strace/strace_4.22.bb
similarity index 85%
rename from meta/recipes-devtools/strace/strace_4.20.bb
rename to meta/recipes-devtools/strace/strace_4.22.bb
index 869c12f65a..196c9d8587 100644
--- a/meta/recipes-devtools/strace/strace_4.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.22.bb
@@ -2,7 +2,7 @@ SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.io"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f132b4d2adfccc63da4139a609367711"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ddb91734b9c705f3e87362e97e5f64b"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
@@ -15,12 +15,15 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            "
-
-SRC_URI[md5sum] = "f2271ab0fac49ebee9cbd7f3469227cb"
-SRC_URI[sha256sum] = "5bf3148dd17306a42566f7da17368fdd781afa147db05ea63a4ca2b50f58c523"
+SRC_URI[md5sum] = "7a2a7d7715da6e6834bc65bd09bace1c"
+SRC_URI[sha256sum] = "068cd09264c95e4d591bbcd3ea08f99a693ed8663cd5169b0fdad72eb5bdb39d"
 
 inherit autotools ptest bluetooth
 
+EXTRA_OECONF += "--enable-mpers=no"
+
+CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
+
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
 
 PACKAGECONFIG_class-target ??= "\
-- 
2.17.0


