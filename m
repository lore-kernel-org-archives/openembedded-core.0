Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id B8A85766E1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:29 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ho8so157839283pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZE5B2LdTPUq7AXLT1GhN7CXN5Qnex4IH0iPgBFWjIP4=;
	b=jcHDzStYbFit65RC8n8QFlYIuobqAvycS72+7hHEbF61NXqoECtfzRCpmAudJxhpBN
	Lfi3l1s+nlj6DvPwhaju1wYVb6AwJvK5UMOS3VTXLfpflY95kS92wDpNs9NSy9V5yJgk
	TaLN0jn31jIp5yr71/g0jlnMLiS+qKes5jYvvlm/BNwTKig+wXyt9EOR/gfgNLolI6I7
	U4LI0zlot+8N1rvK+fYXzzkN5dKiFkkS4GGGb7YpDBQeNufE5bKsT2sDf7In0HUdTQ8C
	8emDWlM+2jFQRbRtGHbhAkyGbOlibux9HeXEWPCtjsd//k94f8OjzEonvHoxFAt2l1SC
	R9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ZE5B2LdTPUq7AXLT1GhN7CXN5Qnex4IH0iPgBFWjIP4=;
	b=fK5oeBt+B8lu3EhPJx4MXacLH/cGMRM9Q/dtgm/aiUjjdNtDxc1XYzALwPbGbIqpYW
	YgKZtXuX/LedacAPyJpn2uEWEjV+hEtf3CWAg8H/t5ZHXBASFFkWREuLFfp7QiJbT1bK
	CzzK8W/iWQ/5BRbpn58P8Ztz4JqonJU+2QriCVH3c0zwNyYmi9Fr/0JKGXf0fwNxrwpR
	FDoTdoNiRzqD2JyqgbWmPVxQcHWSjHwPqikDDmWUysJtZhxJwULrxjraSVQPuqKSdAgb
	LR7m71zQDRP3HJiRCNUy01QvUqeYCyHj1d53DcVw8gXaU1Z1IyFdOaJKUdi+YkFA3Lku
	qjaA==
X-Gm-Message-State: ALoCoQlGomfzgDYrQgBkIYVemjJULOR0sgEY0kgXKCtklwlWYr/OEJSfQ7kcd+d9FNlzeX2FGZoRpKmajZrYpcINdfjeGKX6FQ==
X-Received: by 10.66.156.106 with SMTP id wd10mr28622511pab.150.1453030650549; 
	Sun, 17 Jan 2016 03:37:30 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:06 -0800
Message-Id: <b4e69a1aca39e73eb0f487abf7c7b55fab128472.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 33/73] console-tools: Include sys/types.h for u_char and u_short defs
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:30 -0000

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


