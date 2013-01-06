Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DA-0006m5-6d
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:05 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so14005130lab.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=g3H7EfUkdcS7ZhCNiLkMg41sh/C5v5Qicz5o1SgFZ64=;
	b=wZBpFIscS94gis//cdVmw0pXyfLHOgy1GJ7Mh96HdcWe5Rrs8WB5p5vNCNwAyf3bd7
	jrZ7K3PdCGvLkkLkxyiNCHr2/4hjSKBKj/mg+xLS3vyLQCM6nU9seq6cZmxspdYLz6lg
	Ve8oCTUXqkWIUEVmrHx3KgtQETw1DOx9yON+/hFQh67alT0F6SXe4c63rhM4EdutXKvV
	UjgtL+gipZTqQ0/jIdAWvHZJO4JWLfN1A08pVdVny55qnY+OSTyeYomPgEyH7c5uwzAF
	sB8PGKlGzfdbA1ced/DDHxyQj7kGS2mEBhQ1NQKwBUadhzdt3TqHi0m/hA9NYl1oIKTY
	7RvQ==
X-Received: by 10.152.132.69 with SMTP id os5mr55968825lab.15.1357516195763;
	Sun, 06 Jan 2013 15:49:55 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ox6sm21994810lab.16.2013.01.06.15.49.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:49:54 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyL-0001PG-01; Mon, 07 Jan 2013 01:49:45 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:27 +0200
Message-Id: <1357516181-5358-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 01/15] pkg-config: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 00:05:05 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../pkgconfig-0.25/obsolete_automake_macros.patch  |   35 ++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |    4 ++-
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |    2 +-
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
new file mode 100644
index 0000000..ce10a5e
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Fixed
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd pkg-config-0.25/configure.in pkg-config-0.25/configure.in
+--- pkg-config-0.25/configure.in	2010-05-28 18:55:09.000000000 +0300
++++ pkg-config-0.25/configure.in	2013-01-01 22:13:47.009573426 +0200
+@@ -4,7 +4,7 @@
+ AM_INIT_AUTOMAKE(pkg-config, 0.25)
+ AM_MAINTAINER_MODE
+
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AM_PROG_LIBTOOL
+
+diff -Nurd pkg-config-0.25/glib-1.2.10/configure.in pkg-config-0.25/glib-1.2.10/configure.in
+--- pkg-config-0.25/glib-1.2.10/configure.in	2009-12-06 22:43:59.000000000 +0200
++++ pkg-config-0.25/glib-1.2.10/configure.in	2013-01-01 22:23:36.701560486 +0200
+@@ -63,7 +63,7 @@
+ AM_INIT_AUTOMAKE($PACKAGE, $VERSION, no-define)
+
+ # Specify a configuration file
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_DEFINE_UNQUOTED(GLIB_MAJOR_VERSION, $GLIB_MAJOR_VERSION)
+ AC_DEFINE_UNQUOTED(GLIB_MINOR_VERSION, $GLIB_MINOR_VERSION)
+@@ -154,7 +154,6 @@
+
+ # Checks for programs.
+ AC_PROG_CC
+-AM_PROG_CC_STDC
+ AC_PROG_INSTALL
+
+ changequote(,)dnl
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index c54e325..a2d4700 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -15,7 +15,9 @@ DEPENDS_class-nativesdk = ""
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
            file://autofoo.patch \
            file://glibconfig-sysdefs.h \
-           file://disable-legacy.patch"
+           file://disable-legacy.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 S = "${WORKDIR}/pkg-config-${PV}/"
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
index d0a2b1f..a269973 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
@@ -1,6 +1,6 @@
 require pkgconfig.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
 SRC_URI[sha256sum] = "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e"
-- 
1.7.10.4



