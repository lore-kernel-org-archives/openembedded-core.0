Received: from mail-la0-f52.google.com ([209.85.215.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DG-0006mz-3Z
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:10 +0100
Received: by mail-la0-f52.google.com with SMTP id fq12so13750781lab.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=dkB+Is9mjWHa9wx5FGdjOgrAMMhHSKbfSHYEZHLwXmo=;
	b=T5IW/jKIf99mXtAFdX0snWFUfitqfE0ik91oTqyckWT8qfEcxU/mqgRP6h4N8fsAwx
	IDbbiuW/uOJn1o77Ci558loeAb7jziRWu0588M6zf7vYIclEHKEKqo3h5ykoWVeZohRj
	TXUC3F16KJuQCjg7+3a4LcFe593ZMo71AJ5v07+IE4LyehXYs6gr5u27BZCKxXOtzlt9
	85kYjn5Ka4JHTYM3mGswzGNH2eCem0g4Crn/2dWA08jcAfua8mnwzVp9mcTevATmSUFT
	dZ3O9qz61wNAmocxQNe1NsLMJIJrGyXa5nLlqAinB9yUlxtm8ahheBaFablunQg1m/2c
	8jQg==
X-Received: by 10.152.125.136 with SMTP id mq8mr56425313lab.41.1357516201730; 
	Sun, 06 Jan 2013 15:50:01 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id b3sm20253856lbl.0.2013.01.06.15.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:00 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyR-0001Po-KE; Mon, 07 Jan 2013 01:49:51 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:34 +0200
Message-Id: <1357516181-5358-9-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-8-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-8-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 08/15] libpng: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:10 -0000

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
index 0000000..8d58e8d
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Accepted
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



