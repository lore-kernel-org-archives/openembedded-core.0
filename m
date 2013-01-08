Received: from mail-lb0-f173.google.com ([209.85.217.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfG-0000qk-IX
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-lb0-f173.google.com with SMTP id c1so149985lbg.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=V+WMxLWp8XuyNbrDAkPrSQWM4XPRiS/HGA+8Hogw5ps=;
	b=p5SQWnuXpDtekt9rxDorKbq6nBS28fF3lxz1M4utoVQR1h9GsRIqw2+7X2eACTJPuL
	9ntp2aKLfA4Z0wPLfyLmsyv+zID0JfmTu/mh1RHDSmLJ2zwVCMlu32QweGEEBmupnj4l
	x5FCN/UBeRCBHvypqYNh42qdCrs+tOl17bwzq5/D9x3EYtm3mimthRgg7MMy5vTwFZRs
	vXFl/m0TBYinMZ4rdfeuBvCyCl7VIgFBU1c7WlHa2QfLpKHrs7jh88PdvO6gPOzRlqGI
	v18pKeLRTD6GMNry7Hnf6tSQ57H7QJLjAJcsgvHyYVacOoB5jZZjEa4aD5mYFz+O6LMz
	DHFg==
X-Received: by 10.112.101.7 with SMTP id fc7mr15335156lbb.56.1357629412360;
	Mon, 07 Jan 2013 23:16:52 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id v7sm22109020lbj.13.2013.01.07.23.16.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kh-Vq; Tue, 08 Jan 2013 09:16:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:40 +0200
Message-Id: <1357629404-22020-9-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-8-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-6-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-7-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-8-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 08/12] pixman: replace obsolete automake macros with working ones
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



