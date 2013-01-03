Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlO-0000dH-Rb
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so8673692lab.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=v/DwmUyQrGRZfSowuTnLOVqQi5Qfb2+bqFHlQTSrJ/U=;
	b=JzKZRK3RveFszDNKgZ4th8MisqtdRdgtf9U0J6YRcZ61liiuXUvHuiq1n+y/GC2/co
	KQc6j2XdV93Mls6SGwZqFyYMXRJqsJ6ilBu+fPEJiRBfp2+WCt6NS2YEN3IELck5VsHl
	m3GvAet0P1eO5UR9I2d0aj49JkwY7V9SI/vpbFtPQPcMpwne4Jb7rvgsJulUEHx1Dkdh
	uhR40UUvr5nrdJXqRd0HhDFtnCf57OBdnHEeMeOORajj0M7OleUdU8WbacQuA44z+ARR
	l4r1k8VADKI4tk9C1jJ+MkxP9ZO1Y3eLslVMqQeBca5W0Ibpp6tvsMNlTklGmotCg+BQ
	owdw==
X-Received: by 10.152.125.136 with SMTP id mq8mr47988354lab.41.1357245398750; 
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id f2sm776144lbz.4.2013.01.03.12.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:36 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002Dl-7j; Thu, 03 Jan 2013 22:36:34 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:20 +0200
Message-Id: <1357245391-11055-5-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-4-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 04/15] file: replace obsolete automake macros with working ones
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
 .../file/file/obsolete_automake_macros.patch            |   15 +++++++++++++++
 meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch

diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
new file mode 100644
index 0000000..61ee062
--- /dev/null
+++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Not sent
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



