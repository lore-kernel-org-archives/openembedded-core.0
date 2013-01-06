Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DG-0006n6-SO
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:10 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so13998774lab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2GUKzY9gxGFaH+s1UZinfhIOq9Kn15/YJlKWPPWtx18=;
	b=IMXWzrfRhMTxqZBUDceOIR9PhFdcEyaw8LRCMFD0skMkaHwBq6iiZPsO79bPk44QQs
	QxcfvtYY2KkMHPlt2T8gOHUnxQK8bh2ImkdCTAZWrSFuPWw8ylo5++H5+xlcXk7yD5PP
	4tL/Y9gQkkRMFcN7TVQLk50ySMa9Ez0DXzxwyYUd2gHDtfd1sr9Wp4+KKxE1S6HeOdzV
	gUEzvGLi6PqMqLvhmE+jhrSjbyWRMyboGV68JTwx2/C2c4zBxgh4U52t/DQSB2tGhKrI
	J08SWiqBYZTrQMnIOTaV5NwvNO/Hkbio3iv0segyLrGbcluxY4otgpJWWTu3sDaaMJEx
	kWew==
X-Received: by 10.152.45.229 with SMTP id q5mr56007557lam.34.1357516202464;
	Sun, 06 Jan 2013 15:50:02 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ee5sm20240456lbb.14.2013.01.06.15.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyT-0001Py-I6; Mon, 07 Jan 2013 01:49:53 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:36 +0200
Message-Id: <1357516181-5358-11-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-10-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-8-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-9-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-10-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 10/15] pixman: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:11 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xorg-lib/pixman/obsolete_automake_macros.patch       |   14 ++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb          |    3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch b/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
new file mode 100644
index 0000000..7a4237c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Accepted
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd pixman-0.28.2/configure.ac pixman-0.28.2/configure.ac
+--- pixman-0.28.2/configure.ac	2012-12-10 13:46:36.000000000 +0200
++++ pixman-0.28.2/configure.ac	2013-01-03 06:31:07.574848073 +0200
+@@ -64,7 +64,7 @@
+ # Suppress verbose compile lines
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_CANONICAL_HOST
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
index 4ec0490..59c2691 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r0"
+PR = "r1"
 
 PE = "1"
 
@@ -31,6 +31,7 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
             file://Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+            file://obsolete_automake_macros.patch \
 "
 
 SRC_URI[md5sum] = "f6e3294c4edb7b6bca8459e604286348"
-- 
1.7.10.4



