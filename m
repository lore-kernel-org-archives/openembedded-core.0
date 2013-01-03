Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlQ-0000dN-6j
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f49.google.com with SMTP id fk20so8653045lab.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FrMxmCMk7I7s0DB3iZ2f8r+o0iERb52DFYxtscnynP0=;
	b=YwzdTH2VPPCk/gAvFdvADM9FnMYY3MZjIpdH3T81heB6GKjX1dpn2902QdraDGvWQJ
	3tN7WKa2IIXKqC4u6mh2+8Oad30OfjtFh68Bsqaq7nQ59XROdwEedjKhtXrlJ7v8ywCH
	15OuIx7AGu1qKQgVjMYqd5F2TAuyGAK7slwHf5z0qLPz7s2gtBjo5HmkK2up6Tu0z6Vw
	/jc53ccz7Qd1l+9/xb6kz/JH0PVaMLcHM0ezweIQKiatYNauDCbxiODxQYRgxV3EsSU+
	YRuAG0OaxLNLaiQzOXkCRwCYsdvxbLuQL8iGYDXEaiudjlbv67OjWvdEgYbDdNqIr2a2
	v9mg==
X-Received: by 10.112.54.40 with SMTP id g8mr17268676lbp.76.1357245400140;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id sr6sm18775720lab.4.2013.01.03.12.36.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWl-0002FS-36; Thu, 03 Jan 2013 22:36:35 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:26 +0200
Message-Id: <1357245391-11055-11-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-10-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-8-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-9-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-10-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 10/15] pixman: replace obsolete automake macros with working ones
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
 .../xorg-lib/pixman/obsolete_automake_macros.patch       |   14 ++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb          |    3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch b/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
new file mode 100644
index 0000000..aa45ad4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted
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



