Received: from mail-lb0-f170.google.com ([209.85.217.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfF-0000qh-PC
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-lb0-f170.google.com with SMTP id j14so151109lbo.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=aiXXwbVEpMTGQlFwzG0oWJOo409zrfLC+ltW7afMj6U=;
	b=xWAE7X7KndOoIMnlMaDKMz5ejnxsyq40vRbnu6iG89MML8HWibhKZbGtjHcewrqh2V
	leWG9JDe0WUGYWejnM4LIKf6a/JkmEkAtd+i0N5Tqqc/cHejSgmUintoLfk+w67AA+mr
	29RMcrIca9sKI0GIa2dElvpFhwpwUyHkn4iVUpIB8D3cO5JehxmZvNAD6dXjkfNdRysi
	hHgcCq99zchErXP8v1ucMOVayIFIHS4VJ2XmK7v+p1qh9NY+J5DALiEDcIIPd6UbhpFT
	v1CFBDvYh2D8a+vUUfe3b5dXxJEZ4rEoj+SN9gRBDYh//kSCVGz2rzjX9vymvx/sQBWd
	HQhA==
X-Received: by 10.112.98.105 with SMTP id eh9mr25609688lbb.131.1357629411593; 
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id n7sm22114026lbz.5.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kX-O2; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:38 +0200
Message-Id: <1357629404-22020-7-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-6-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-6-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 06/12] libpng: replace obsolete automake macros with working ones
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
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

Add obsolete_automake_macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libpng/libpng-1.5.13/obsolete_automake_macros.patch |   15 +++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb         |    6 ++++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch b/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
new file mode 100644
index 0000000..3809208
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Accepted [will be in 1.5.14]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libpng-1.5.13/configure.ac libpng-1.5.13/configure.ac
+--- libpng-1.5.13/configure.ac	2012-09-27 14:21:22.000000000 +0300
++++ libpng-1.5.13/configure.ac	2013-01-02 16:50:27.876103410 +0200
+@@ -31,7 +31,7 @@
+ dnl End of version number stuff
+
+ AC_CONFIG_SRCDIR([pngget.c])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ # Checks for programs.
+ AC_LANG([C])
diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
index 04bb932..b9f64f6 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
@@ -6,10 +6,12 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00b5b35853278d508806c2e5860e82cb \
                     file://png.h;beginline=207;endline=321;md5=50e583fb60bb36f37ab5023b2a3715d1"
 DEPENDS = "zlib"
-PR = "r1"
+PR = "r2"
 LIBV = "15"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
+           file://obsolete_automake_macros.patch \
+          "
 
 SRC_URI[md5sum] = "0b607a685da977f1bfc96e1c47055183"
 SRC_URI[sha256sum] = "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b41588004b271257aee"
-- 
1.7.10.4



