Received: from mail-lb0-f170.google.com ([209.85.217.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfE-0000qb-47
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-lb0-f170.google.com with SMTP id j14so151096lbo.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JBICHOpkhTDzBMSIdZCTAl7c8vNPEeBomc6JZf97YcY=;
	b=oAZTiD/bgHmUTUQpMbv0axLVT9tqZkPjvgclR2sYV004wJMNCDBHoWZUdtaV3HMV/9
	1fXmft5AJLIWMdsVgIHlmmqPBwytlHugzEAPkdv3puk2TlzCjS6adPcoR02T6WnGVJvw
	+m0obaeSTKyNp3acihnkhM4qn3YyxSsY9usCmAAj+ULGg7s5ZQLgbQSi0ZETlh43unM4
	MAMzuTdlIjLtLxHOm2Za0rGYlcXWkSiuFtVBYs6YGI/uSS4tDw3Ctb0ZsTyIUjlNMx9d
	tAt30w90YWiAXeBBIuIKqjxeQ/GlY6q+g3mblNlxeW/nI7WEWzuRUwmFzM7yxUTZpiUH
	+5SQ==
X-Received: by 10.152.131.137 with SMTP id om9mr59727519lab.18.1357629409868; 
	Mon, 07 Jan 2013 23:16:49 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ns7sm22607485lab.5.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kD-96; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:34 +0200
Message-Id: <1357629404-22020-3-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-2-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 02/12] file: replace obsolete automake macros with working ones
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
 .../file/file/obsolete_automake_macros.patch            |   15 +++++++++++++++
 meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch

diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
new file mode 100644
index 0000000..84a78a5
--- /dev/null
+++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport [fixed in file-5.12]
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



