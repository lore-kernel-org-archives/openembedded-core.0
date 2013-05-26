Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 24D8A6065B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 14:03:44 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id fp13so5782098lab.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MLdWIyAmsvUQWeLKaLto3cxr9DfCfBNYAKljFnXFQVw=;
	b=gmYvPflTYSM4BoJNxvaP4BaWdfOPn21V6DZL+LO/ePVKFroaWdVJpnUlSLjlbcxiqJ
	+8b3H13Db9S91FyD8E0Z1fFX5R4pqfKEsaAZR2QznGfXMs0rdyc1t29Dv1K+coa7OWsc
	X1oSygHQBKLeS73YuDqjS3vHImjkT4f/JzmU5i3hOGqUrC4a4ohGFEMEwIH90195hDcn
	DugXE26da9upthUYGP2i9jyEqiiP44FJ7BybSlXgNrjnTWMCwmwEuhtY7njWgkSVxpzp
	kHaAS3b6VZLBW3nyY+zmTOK+SNJzkzah9ARwSjyM6WQwwJOVKANsxFicFWuN62h7P1hq
	17Ng==
X-Received: by 10.112.88.228 with SMTP id bj4mr12069439lbb.14.1369577025564;
	Sun, 26 May 2013 07:03:45 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id f9sm9887165lbf.4.2013.05.26.07.03.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 26 May 2013 07:03:44 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UgbXz-0000JZ-DP; Sun, 26 May 2013 17:03:43 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 17:03:42 +0300
Message-Id: <5e0683c21f43c105a484741110b6da590d5a33ea.1369576072.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369576071.git.cazfi74@gmail.com>
References: <cover.1369576071.git.cazfi74@gmail.com>
Subject: [PATCH 1/1] vte: add 0.34.5 recipe
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
X-List-Received-Date: Sun, 26 May 2013 14:03:45 -0000

Add latest vte version for gtk3-based systems. Keep 0.28.2 as it's last
gtk2-compatible version.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../vte/vte-0.34.5/obsolete_automake_macros.patch        |   14 ++++++++++++++
 meta/recipes-support/vte/vte.inc                         |    4 +++-
 meta/recipes-support/vte/vte_0.28.2.bb                   |    6 ++++--
 meta/recipes-support/vte/vte_0.34.5.bb                   |   12 ++++++++++++
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte-0.34.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/vte/vte_0.34.5.bb

diff --git a/meta/recipes-support/vte/vte-0.34.5/obsolete_automake_macros.patch b/meta/recipes-support/vte/vte-0.34.5/obsolete_automake_macros.patch
new file mode 100644
index 0000000..6763d37
--- /dev/null
+++ b/meta/recipes-support/vte/vte-0.34.5/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=691545]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd vte-0.28.2/gnome-pty-helper/configure.in vte-0.28.2/gnome-pty-helper/configure.in
+--- vte-0.28.2/gnome-pty-helper/configure.in	2010-07-15 20:08:44.000000000 +0300
++++ vte-0.28.2/gnome-pty-helper/configure.in	2013-01-11 14:50:34.971027440 +0200
+@@ -8,7 +8,6 @@
+ AC_ISC_POSIX
+ AC_PROG_CC
+ AC_STDC_HEADERS
+-AM_PROG_CC_STDC
+
+ if test -z "$enable_maintainer_mode"; then
+   enable_maintainer_mode=yes
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index b653fab..bc9736a 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -1,9 +1,11 @@
 DESCRIPTION = "vte is a virtual terminal emulator"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.1+"
-DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
+DEPENDS = " glib-2.0 intltool-native ncurses gobject-introspection-stub"
 RDEPENDS_libvte = "vte-termcap"
 
+GNOME_COMPRESS_TYPE = "xz"
+
 inherit gnome gtk-doc
 
 EXTRA_OECONF = "--disable-python --disable-introspection"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 485187d..caf7515 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -6,5 +6,7 @@ PR = "r6"
 
 SRC_URI += "file://obsolete_automake_macros.patch"
 
-SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
-SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
+SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
+SRC_URI[archive.sha256sum] = "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
+
+DEPENDS += "gtk+"
diff --git a/meta/recipes-support/vte/vte_0.34.5.bb b/meta/recipes-support/vte/vte_0.34.5.bb
new file mode 100644
index 0000000..8707213
--- /dev/null
+++ b/meta/recipes-support/vte/vte_0.34.5.bb
@@ -0,0 +1,12 @@
+require vte.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+PR = "r0"
+
+SRC_URI += "file://obsolete_automake_macros.patch"
+
+SRC_URI[archive.md5sum] = "ce1f11568992df8e61c9366918fed571"
+SRC_URI[archive.sha256sum] = "8847fb75b620a94ba62c2ffd9e1653396978106f294574ba24a19ced259a7351"
+
+DEPENDS += "gtk+3"
-- 
1.7.10.4


