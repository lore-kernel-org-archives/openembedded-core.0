Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 16B0473D4C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:07 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so37724806pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=l6rH0KJI81Bx6OlGyE3Z16acE5Bg0RRuepZaRVfhB5c=;
	b=RBXZ0wB0hv0VjJ/S/g+3Gbi2n7fXfapLd1O25lvuCvx7I+M86h8K/c1xuRc8UqW4x2
	sqVKmmcD8nYJI7CqnbEKUFu0v1se3Qj3JGsmWwl9FtUBSpNzPZ+XdFjX+/M2YEDh3Z34
	nFaXgyn9P3OLcMcnTtmEKdJHPGODErWV05a/CNvRa9IzGZZsVgqhCpW2ucMN40WYtP9p
	LHw4HkFz755B5VMFA5XUwfD5tTSiFq4PLJv6GJEXeWjom7cw/VrjNaoSiR6xVsD5FN2F
	a7YddBz1D1LH41zKcwse/Cyk0vb4peOvf0x6OINO7RHaDE/Slkd3Via+7wwbNo60xUU8
	LZ8A==
X-Received: by 10.66.248.40 with SMTP id yj8mr7127462pac.141.1428715269095;
	Fri, 10 Apr 2015 18:21:09 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:46 -0700
Message-Id: <f71e56d6f8f6563d907c776a8104315ff6321f6e.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 15/17] kbd: Mark glibc headers under __GLIBC__
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:08 -0000

Change-Id: I4e91038ea8b05defbb9d574c61eea96ccc064e51
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Only-inluclude-kernel-headers-with-glibc.patch | 29 ++++++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.0.2.bb                 |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch

diff --git a/meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch b/meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
new file mode 100644
index 0000000..8bfcb0c
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
@@ -0,0 +1,29 @@
+From 3c5c7acc7ef874b919b26583d3892e21b907833f Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 20 Aug 2014 09:00:03 +0200
+Subject: [PATCH 3/4] Only inluclude kernel headers with glibc
+
+This fixes compile errors with musl libc
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Upstream-Status: Pending
+---
+ src/resizecons.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/resizecons.c b/src/resizecons.c
+index 5f84845..691dfcc 100644
+--- a/src/resizecons.c
++++ b/src/resizecons.c
+@@ -80,7 +80,7 @@
+ #include <sys/ioctl.h>
+ #if (__GNU_LIBRARY__ >= 6)
+ #include <sys/perm.h>
+-#else
++#elif defined(__GLIBC__)
+ #include <linux/types.h>
+ #include <linux/termios.h>
+ #endif
+-- 
+2.1.0
+
diff --git a/meta/recipes-core/kbd/kbd_2.0.2.bb b/meta/recipes-core/kbd/kbd_2.0.2.bb
index 0aa976a..136dc7a 100644
--- a/meta/recipes-core/kbd/kbd_2.0.2.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.2.bb
@@ -12,6 +12,7 @@ RCONFLICTS_${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://uclibc-stdarg.patch \
+	   file://0003-Only-inluclude-kernel-headers-with-glibc.patch \
           "
 
 SRC_URI[md5sum] = "87475eb78b1d6e6ab06686dd323ad4ba"
-- 
2.1.4


