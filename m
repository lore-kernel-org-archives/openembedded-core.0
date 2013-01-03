Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlQ-0000dP-HP
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f46.google.com with SMTP id fq13so8657501lab.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=k6K2jLubdS36T7Z64sh/NtysoP5jswDP13IvI8cSYhM=;
	b=ID3Rn92PVflPEO4bJeexw2/RjWPtHRlXFElPR4TYMNnAgb9CR8DtJQZnjwBWOEpLk/
	V9YKgW9iU0fqJB2BIBbOOLno1OgZa/Qv5Mj9adm0Meaa5h8qFJZL8Lk8COmsOBzG3w2U
	zTL8xwPXxs/AILrF9DWG8W16+ggabcvHlWOba+aY77oFE3s4qTyuz4JXHzDrugaMlyem
	Fc4Rz8JqFKJihw+f5J9qdzZq4Wa/xXPS+nkSYtvBvM+qNFqz3qnvPdsBpNPVpEewLjxb
	W+oUKns+PfBDATgzaWdo8yCShLaqSqJhQtZG02nA2hjf6EvcuPaDAz9r6k5j1bcN8vdr
	AA/g==
X-Received: by 10.112.36.165 with SMTP id r5mr7926963lbj.112.1357245400439;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id s9sm17330948lbc.12.2013.01.03.12.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002Ew-Qd; Thu, 03 Jan 2013 22:36:34 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:24 +0200
Message-Id: <1357245391-11055-9-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-8-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-8-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 08/15] libpng: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libpng/libpng-1.5.13/obsolete_automake_macros.patch |   15 +++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb         |    6 ++++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch b/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
new file mode 100644
index 0000000..0115442
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Submitted
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



