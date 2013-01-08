Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfE-0000qd-Qe
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so102002lab.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TiMIO308vgAWxP0q+mTeiP4E4P4cwa9ML7HtBN70aho=;
	b=pATWVVbWEIflbpQkdJdkY81KkyoTuraBRr6thatA9OBG3JrmkUfgHsj14jA0aVE+eD
	qYe4FR1BYiAJ7eJRNxpK+8uM8qhAXRc9ecKTWv1tn9SO812iXd4TS6j/GwlO6PjkBqVM
	2YqkpIRdwAeXxPA4jrdJu9qj/JRkRugz1DO6e1lrTRk4xttyrq7VR7rpR5IewU4rZWI6
	azDkhj6wrumtOBikvbL8ttpDqHA+YM+MUmzGY0P30RvWHAPD8D42a2Je7UEwGYZ9peKu
	wzzpTICgBKOQkAD5Tlz/SoHFXv5AmQjDfRIzQ/yM6ohEkOYNezZX4QV/T5GZz7u6KT6z
	K9Xg==
X-Received: by 10.112.84.130 with SMTP id z2mr25996182lby.65.1357629410566;
	Mon, 07 Jan 2013 23:16:50 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id mb2sm6197367lab.7.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005k8-51; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:33 +0200
Message-Id: <1357629404-22020-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 01/12] pkg-config: replace obsolete automake macros with working ones
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
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

Add obsolete_automake_macros.patch that replaces automake macros
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
index 0000000..b6e7f62
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Backport [fixed in 0.27]
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



