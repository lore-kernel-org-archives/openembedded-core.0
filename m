Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFA174DF8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:52 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a14so18629699pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pg1QRVBeZFPGtAElXvlDhOlUqrLg6jOJ8lkwuzcIgXY=;
	b=WAt2SeeLcK63sBY51W6w0IWb9ktj4z/pvZlYR+e6HW6TpRwxy+7RSnP3Gqs129jc7z
	FEUggjyiFspH7qr2G+d7gjd7/+jb2KXvuVCTvITNPo3A9PIy8fIcXWDRAn1D/zdfy3b1
	3MZvPSFnJ2weKadPCpYSlCVrdww6CV17mrfnUqfiQb9si6wCXr41uhFlWNUCrGF/Se6K
	DdpCvewvYIAsqTs8eZMilyb1482SQhud2DwijTpGEa9XSqX9gpkkakMaMfcPYGsjfy7g
	DihfaOhgQ5tNZUAqzykg2DtlI04wCwkY6GYzQAcGlpSTpvgLDDYsSreUDNEVXiYX98cF
	GfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pg1QRVBeZFPGtAElXvlDhOlUqrLg6jOJ8lkwuzcIgXY=;
	b=Ce/jI1XBn9nXfEV/7rVGy4PJC9LIhaBujwemntOlesBf6DyBxshXa6AU2szz+xDNpn
	ArTK5eCz1flHXYjffP1gbgWvOoMuPEVRVm4B4LQyuG2xpJpwEzBrV7JMj7KTdHjCLwmx
	Sxm2ATi5YZ5+z8GCtnHsfBhGucQAnYcYhF8nSnTSRmTBJcd3v3ku/v9HcPR3eb+k2C4g
	Gvhj6W6PRs5zIWrTEaa7LHGAPuHzJtRbPxXtIXVZnWSzqPuqt/srugWFhpp3jAMnkUHH
	Qw3pL4ZbWO1GiWiiSSot653zIVk6KC+DUqwk39EcIPswJGSeRkyMLKiEN7WFxfQgTfrA
	CFdg==
X-Gm-Message-State: ALQs6tCFVlfkEr+JvwLyOnQRS00mM4ijtp1fbknwkvRkt1p1rEBwms70
	8VxB+kvx2pJqQSJtkpd4kjGohg==
X-Google-Smtp-Source: AB8JxZrWjSwd1oTsw2MpgyhLmX3lZWL74u1yrsZ+cBeqOeykVzcGYhEzzYAwfNlFE3sm4Qjk4vIURA==
X-Received: by 10.98.242.13 with SMTP id m13mr28955572pfh.170.1525479293283;
	Fri, 04 May 2018 17:14:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:20 -0700
Message-Id: <f70382b493eae96c8dc6b8010d229c5901be6ab2.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 26/27] strace: Upgrade to 4.22
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
X-List-Received-Date: Sat, 05 May 2018 00:14:52 -0000

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


