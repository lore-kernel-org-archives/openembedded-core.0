Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 68C8D759B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:50 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id o11so348662195qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZE5B2LdTPUq7AXLT1GhN7CXN5Qnex4IH0iPgBFWjIP4=;
	b=bdXmEk5YZnE92M0ADy5eDIqFvmSoEwqPNRb7kAclqE4Nk8hqHLzOhLb8LqY/MLgLZP
	AQ/qFSeBFf0HdHdSgjwqPx+Lem1eoVujzSATkHFIObKU7hdnObO5502qD95uOcNA2t20
	s//CRv69QUhvZk39NYmBl/AinxAiSBbGZRzZ1zFIiHsA0h1PdpGoVBp7jOdvmtJn1cyN
	F5HuPgccMiA0w6hT+f1AreXc6mTgWWeiOKsWLcN3CqtZuF4rPpgw8nWgmW/0ATPgWBif
	+VNJPfdMJ+xcwACOcP8U19+9q+x0lX+blNhckxKmcfp8esPO1Itawjog/sA9cD2kBKHu
	E5ZQ==
X-Received: by 10.140.227.199 with SMTP id x190mr151208677qhb.46.1452248391214;
	Fri, 08 Jan 2016 02:19:51 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:04 +0000
Message-Id: <24bfde07f9d8cc6e7e88257fcaa1685039509e45.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 36/53] console-tools: Include sys/types.h for u_char and u_short defs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2016 10:19:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-sys-types.h-for-u_char-and-u_short-.patch | 44 ++++++++++++++++++++++
 .../console-tools/console-tools_0.3.2.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch

diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch
new file mode 100644
index 0000000..64b5b04
--- /dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch
@@ -0,0 +1,44 @@
+From 0fd5dda51d68e1ec2a87e27b5ed0dff3503b4681 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 08:12:38 +0000
+Subject: [PATCH] kbdtools: Include sys/types.h for u_char and u_short
+ definition
+
+on musl this gets exposed since sys/types.h is not
+included via some other indirect inclusion as is the case with glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ kbdtools/dumpkeys.c | 1 +
+ kbdtools/loadkeys.y | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/kbdtools/dumpkeys.c b/kbdtools/dumpkeys.c
+index 6159d49..c19fb21 100644
+--- a/kbdtools/dumpkeys.c
++++ b/kbdtools/dumpkeys.c
+@@ -26,6 +26,7 @@
+ #include <errno.h>
+ #include <sysexits.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ #include <linux/types.h>
+ #include <linux/kd.h>
+ #include <linux/keyboard.h>
+diff --git a/kbdtools/loadkeys.y b/kbdtools/loadkeys.y
+index b6a8e01..4468f77 100644
+--- a/kbdtools/loadkeys.y
++++ b/kbdtools/loadkeys.y
+@@ -71,6 +71,7 @@
+ #include <linux/kd.h>
+ #include <linux/keyboard.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ #include <ctype.h>
+ #include <sysexits.h>
+ #include <signal.h>
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 7e14b31..d14d683 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://nodocs.patch \
            file://fix-libconsole-linking.patch \
            file://no-dep-on-libfl.patch \
+           file://0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch \
            file://lcmessage.m4 \
            file://Makevars"
 
-- 
2.7.0


