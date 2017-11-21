Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 599627869B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:07:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r14so1984778pfl.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dvzYMPYzfUC1KqowUP8cGM5yU5fVXD0G5wLeTh+ejhg=;
	b=Dyzw3bEvoWYaP0V+TQ3xS3KpMpngvVjoZdFpLBYEtImjRR5leTZSp7G3BLflbf+nGr
	K/6mp01v7wYoGijqme8PqCJTPFXoyYhEM57LGdVvmZmU9wGs7l7RgtWtskpOtiFyr14d
	TzSNPTmD/2nq2P9VDRng6Ef5RACUzN6H7/HL1j//Wm8xs0KA3o8bRIfEe4BE9YFhs3Sd
	Mk6ygN1ElDgNdzVG0mqbuvNAPOmfT21zJ31PjInn2lGjRP979dTQFgJd7gRgInfXb8bp
	o86GsCt0mR8WdE5DGBj7brUNj124UsfrXJamZVmL18dcElyt79LqlfXtA1SoUdGze4JM
	rczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dvzYMPYzfUC1KqowUP8cGM5yU5fVXD0G5wLeTh+ejhg=;
	b=UtBYI5F9XWnktwH8l34nDl5AWy6oqRBpYf1+ReaQ3YdAAENe2o2GOOd36sjx7jcau2
	zUpEHTpsvTknoZQh+3bF24YhoPEQprApRqK72HEg0ef2cNmNacl4tBJgGlP8eSINPY65
	CheP1230L76jn7NiRVwzRzh6DUwVqn6PqlNHrfE8Ma32xF2c9TkaLi8xNndJw6Tzg1D6
	I6/1dRkxqfVFv/x3Hw2jz8skDA3KuJZe2yTwuVNauJp3e856OGZChKXLKzfMOwlqx45h
	ZWcjK+v8vKGl9S2JvKGYrR8qjAFOkeY+Yq8KDb6q2GAu6UypN/3kWoNgtNV4rhR2HFhg
	fPCw==
X-Gm-Message-State: AJaThX7xaXugLtnv8uMeV5WJw82tzPoxdZQ6ELZpu2waY7mQQgs7OQ5v
	PMGE/RyTaj46kcfHqWQNh0I=
X-Google-Smtp-Source: AGs4zMZDG473BLDWbEjzo2KI3/tP6Olxnj668fCtRpdycH2TgkEnYsIQTtuh8m/1ETVeJ/85YbNjIQ==
X-Received: by 10.159.252.76 with SMTP id t12mr15738898plz.323.1511222854391; 
	Mon, 20 Nov 2017 16:07:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id m9sm4221109pgt.17.2017.11.20.16.07.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 16:07:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:07:14 -0800
Message-Id: <fb0a858be004dd7f7be4be564d85ebc088fdf104.1511222485.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
Subject: [PATCH 4/5] libassuan: update to 2.4.4
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
X-List-Received-Date: Tue, 21 Nov 2017 00:07:33 -0000

From: Armin Kuster <akuster@mvista.com>

forward ported patch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libassuan-add-pkgconfig-support.patch          | 77 +++++++++++-----------
 .../{libassuan_2.4.3.bb => libassuan_2.4.4.bb}     | 11 ++--
 2 files changed, 45 insertions(+), 43 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.4.3.bb => libassuan_2.4.4.bb} (67%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index b6ccdda..525b076 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -6,32 +6,15 @@ Upstream-Status: Denied
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: libassuan-2.1.2/Makefile.am
-===================================================================
---- libassuan-2.1.2.orig/Makefile.am
-+++ libassuan-2.1.2/Makefile.am
-@@ -24,10 +24,13 @@ AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gz
- # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
- GITLOG_TO_CHANGELOG=gitlog-to-changelog
- 
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = libassuan.pc
-+
- EXTRA_DIST = autogen.sh autogen.rc README.GIT         	                \
-              ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011 	\
-              tests/ChangeLog-2011 contrib/ChangeLog-2011     		\
--             build-aux/git-log-footer build-aux/git-log-fix
-+             build-aux/git-log-footer build-aux/git-log-fix libassuan.pc.in
- 
- SUBDIRS = m4 src doc tests
- 
-Index: libassuan-2.1.2/libassuan.pc.in
+forward ported to 2.4.4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: libassuan-2.4.4/libassuan.pc.in
 ===================================================================
 --- /dev/null
-+++ libassuan-2.1.2/libassuan.pc.in
-@@ -0,0 +1,14 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
++++ libassuan-2.4.4/libassuan.pc.in
+@@ -0,0 +1,13 @@
++prefix=@exec_prefix@
 +libdir=@libdir@
 +includedir=@includedir@
 +api_version=@LIBASSUAN_CONFIG_API_VERSION@
@@ -44,24 +27,42 @@ Index: libassuan-2.1.2/libassuan.pc.in
 +Libs: -L${libdir} -lassuan
 +Libs.private: -lgpg-error
 +Cflags: -I${includedir}
-Index: libassuan-2.1.2/configure.ac
+Index: libassuan-2.4.4/Makefile.am
 ===================================================================
---- libassuan-2.1.2.orig/configure.ac
-+++ libassuan-2.1.2/configure.ac
-@@ -439,7 +439,7 @@ AC_CONFIG_FILES([doc/Makefile])
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -25,10 +25,13 @@ DISTCHECK_CONFIGURE_FLAGS = --enable-doc
+ # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
+ GITLOG_TO_CHANGELOG=gitlog-to-changelog
+ 
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = libassuan.pc
++
+ EXTRA_DIST = autogen.sh autogen.rc README.GIT VERSION                   \
+              ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011 	\
+              tests/ChangeLog-2011 contrib/ChangeLog-2011     		\
+-             build-aux/git-log-footer build-aux/git-log-fix
++             build-aux/git-log-footer build-aux/git-log-fix libassuan.pc.in
+ 
+ if BUILD_DOC
+ doc = doc
+Index: 2.4.4-r0/libassuan-2.4.4/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -485,6 +485,7 @@ AC_CONFIG_FILES([doc/Makefile])
  AC_CONFIG_FILES([tests/Makefile])
  AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
  AC_CONFIG_FILES([src/versioninfo.rc])
--
 +AC_CONFIG_FILES([libassuan.pc])
+ 
  AC_OUTPUT
  
- echo "
-Index: libassuan-2.1.2/src/libassuan.m4
+Index: libassuan-2.4.4/src/libassuan.m4
 ===================================================================
---- libassuan-2.1.2.orig/src/libassuan.m4
-+++ libassuan-2.1.2/src/libassuan.m4
-@@ -15,18 +15,6 @@ dnl Returns ok set to yes or no.
+--- a/src/libassuan.m4
++++ b/src/libassuan.m4
+@@ -16,18 +16,6 @@ dnl Returns ok set to yes or no.
  dnl
  AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -80,7 +81,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
  
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -37,51 +25,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -38,51 +26,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
@@ -105,7 +106,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
 -
 -    if test "$major" -gt "$req_major"; then
 -        ok=yes
--    else 
+-    else
 -        if test "$major" -eq "$req_major"; then
 -            if test "$minor" -gt "$req_minor"; then
 -               ok=yes
@@ -134,7 +135,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -96,7 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -97,7 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  
    if test $ok = yes; then
      if test x"$host" != x ; then
@@ -143,7 +144,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -137,12 +86,8 @@ dnl
+@@ -138,12 +87,8 @@ dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
  [ _AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
diff --git a/meta/recipes-support/libassuan/libassuan_2.4.3.bb b/meta/recipes-support/libassuan/libassuan_2.4.4.bb
similarity index 67%
rename from meta/recipes-support/libassuan/libassuan_2.4.3.bb
rename to meta/recipes-support/libassuan/libassuan_2.4.4.bb
index 926c279..7921c1d 100644
--- a/meta/recipes-support/libassuan/libassuan_2.4.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.4.4.bb
@@ -7,17 +7,18 @@ LICENSE_${PN} = "LGPLv2.1+"
 LICENSE_${PN}-doc = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/assuan.c;endline=20;md5=0f465544183405055ec179869fc5b5ba \
-                    file://src/assuan-defs.h;endline=20;md5=20cd55535260ca1779edae5c7b80b21e"
+                    file://src/assuan.c;endline=20;md5=ab92143a5a2adabd06d7994d1467ea5c\
+                    file://src/assuan-defs.h;endline=20;md5=15d950c83e82978e35b35e790d7e4d39"
 
 DEPENDS = "libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
-	   file://libassuan-add-pkgconfig-support.patch"
+           file://libassuan-add-pkgconfig-support.patch \
+          "
 
-SRC_URI[md5sum] = "8e01a7c72d3e5d154481230668e6eb5a"
-SRC_URI[sha256sum] = "22843a3bdb256f59be49842abf24da76700354293a066d82ade8134bb5aa2b71"
+SRC_URI[md5sum] = "52385ec8d34f258bf10165d32c486002"
+SRC_URI[sha256sum] = "9e69a102272324de0bb56025779f84fd44901afcc6eac51505f6a63ea5737ca1"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.7.4


