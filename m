Received: from mail-lb0-f179.google.com ([209.85.217.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfG-0000ql-SH
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-lb0-f179.google.com with SMTP id gm13so151066lbb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vIrY4L0qImSbZIyAkb1bxjGQB8qZ0SxCuh9aZTRctGk=;
	b=jsyUSRxdB1a0hlJp2lHm4p7ZF3vjz5n6Kr4I+MyAC9l9qZGgGRLLEyclivpR35ZwFl
	Hm4534GhNNscP1RRICt2QraqRWfSOXgfPicx8myOyGS058Vxax0eksCyznUno58FE7u8
	GLaeZaw8ncMY2ZQRM0rhVFPeCdUH0VyQo1tU42ETYj7tHDB/WC1YhS3o5jEAmq9Bt81N
	Gq1q5Kzb0t4b/l250wjgl06fjkSPC2uLYqtYN6hFucHctqB+04qAZi2+snOJfxeFpC4y
	NfwEEc+cUQxhZONjWJSMuQQCrM7wNCM7OXTBoBZ/PVB/f1PoJBTzvUT8jiK4y7Na5vh5
	fk8A==
X-Received: by 10.112.32.101 with SMTP id h5mr26239924lbi.3.1357629412601;
	Mon, 07 Jan 2013 23:16:52 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ox6sm23977762lab.16.2013.01.07.23.16.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQV-0005kr-7B; Tue, 08 Jan 2013 09:16:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:42 +0200
Message-Id: <1357629404-22020-11-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-10-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-6-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-7-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-8-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-9-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-10-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 10/12] libgcrypt: replace obsolete automake macros with working ones
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

Add obsolete_automake_macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libgcrypt-1.5.0/obsolete_automake_macros.patch      |   15 +++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb       |    4 +++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch

diff --git a/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch b/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
new file mode 100644
index 0000000..0dbfded
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted [https://bugs.g10code.com/gnupg/issue1459]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libgcrypt-1.5.0/configure.ac libgcrypt-1.5.0/configure.ac
+--- libgcrypt-1.5.0/configure.ac	2011-06-29 11:53:22.000000000 +0300
++++ libgcrypt-1.5.0/configure.ac	2013-01-03 07:12:26.854793677 +0200
+@@ -59,7 +59,7 @@
+
+ AC_CONFIG_SRCDIR([src/libgcrypt.vers])
+ AM_INIT_AUTOMAKE([])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_LIBOBJ_DIR([compat])
+ AC_CANONICAL_HOST
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
index e552f79..058c2d5 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
@@ -1,6 +1,8 @@
 require libgcrypt.inc
 
-PR = "r1"
+PR = "r2"
+
+SRC_URI += "file://obsolete_automake_macros.patch"
 
 SRC_URI[md5sum] = "78f8f8bec4580f75b25816f7896d0389"
 SRC_URI[sha256sum] = "cc98b1f64c9ae3b0185099cef4ac6c436a849095edf87f34157f0bb10e187990"
-- 
1.7.10.4



