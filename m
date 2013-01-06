Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DH-0006nS-Lb
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:12 +0100
Received: by mail-la0-f54.google.com with SMTP id fp12so13964498lab.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ML9Ete0dmyDMcTr3cdwsLKRo8VA6heAo4ZZP3xQPDUI=;
	b=lzPdVRuh9DbchujRK3/+Nbh+U5JbIXC3o6+crwh75jG4ZkYbKNU/dxVVfcSsskci4N
	+og89MoCdiB9h5hWhjapwiu1yNihI5Iz0V4y/PYFl3lyWl5SFEJQx7w/reGuktA3JNpz
	QNlm0+SyM4395pqRGV+DJH5GqUy8s3MokLTqC/slTR7ZAE1F0enDK8rubeDuFgbo3M1q
	2LhxGqOuEJDYzWA+uE+ow/AgBTmtZg/GlrxRhjntFO1WS/USuE+Pp2REAnSvqnR9wP7g
	jsQFuHBiDEFRPckRrTHBzJMS0JJgXHkykpmYnRyynmJqLwX1Vk9ayKH0y18fhTWlyF6P
	R/pg==
X-Received: by 10.152.108.172 with SMTP id hl12mr56057504lab.32.1357516203213; 
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ja10sm22000320lab.6.2013.01.06.15.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyV-0001Q8-H5; Mon, 07 Jan 2013 01:49:55 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:38 +0200
Message-Id: <1357516181-5358-13-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-12-git-send-email-cazfi74@gmail.com>
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
	<1357516181-5358-11-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-12-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 12/15] libgcrypt: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:12 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libgcrypt-1.5.0/obsolete_automake_macros.patch      |   15 +++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb       |    4 +++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch

diff --git a/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch b/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
new file mode 100644
index 0000000..31b63e4
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted (https://bugs.g10code.com/gnupg/issue1459)
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



