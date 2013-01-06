Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DD-0006mD-17
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:07 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so13991910lab.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=62rIi/41P2Rq9A1HGQIJyKHk8cOPluJ/EuZxWs9T6IU=;
	b=b8FHDeJm/PZaxcC/0sNcjs+AHAYO1mdlfVphbb6VaMQ4qyG3HMW09r22rqEqTw3u6n
	CIGO25179PYzf4YxZHqaAoUFg0PNFqdwWZcswUIWEmUl0K5wkrUNfzTl3+QYShQBk06P
	BzvXz8pA/4gppSCc0bxhFZhuQ7pDhmtShksivO71Nh6mau4kFcSbcdhLVGwDypCMaRYZ
	n+V5+CKUVXwM37eUPBgJOTJCEnOP1SMUPDzjN3YEB9uRy/611Q3xaL5+b/1qdAx7B871
	7CLxlsY1tVYNXxCXIugw7UbzNx6YD4TaDMZez++KABzETMykdMGfCCB316IECLT+nR0b
	IGaA==
X-Received: by 10.152.162.1 with SMTP id xw1mr56714894lab.3.1357516198620;
	Sun, 06 Jan 2013 15:49:58 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ee5sm20240358lbb.14.2013.01.06.15.49.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:49:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyN-0001PT-Q6; Mon, 07 Jan 2013 01:49:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:30 +0200
Message-Id: <1357516181-5358-5-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-4-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:07 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../file/file/obsolete_automake_macros.patch            |   15 +++++++++++++++
 meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch

diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
new file mode 100644
index 0000000..8b0d34c
--- /dev/null
+++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Fixed in file-5.12
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd file-5.11/configure.ac file-5.11/configure.ac
+--- file-5.11/configure.ac	2012-02-21 21:16:29.000000000 +0200
++++ file-5.11/configure.ac	2013-01-02 07:18:23.004856505 +0200
+@@ -3,7 +3,7 @@
+ AM_INIT_AUTOMAKE()
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+ AC_CONFIG_MACRO_DIR([m4])
+
+ AC_MSG_CHECKING(for builtin ELF support)
diff --git a/meta/recipes-devtools/file/file_5.11.bb b/meta/recipes-devtools/file/file_5.11.bb
index be6a863..52ae460 100644
--- a/meta/recipes-devtools/file/file_5.11.bb
+++ b/meta/recipes-devtools/file/file_5.11.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_class-native = "zlib-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://fix_version_check.patch \
+           file://obsolete_automake_macros.patch \
            file://dump \
            file://filesystems"
 
-- 
1.7.10.4



