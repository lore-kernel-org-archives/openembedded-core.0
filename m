Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 659A577AC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:38:23 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p189so24093751pfp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 20:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h9Lj4BajrbR8QxuI5mQnVqYssn0jnXPGzLAQ3Jt1wEQ=;
	b=GKZ6+WDpfcqIzle3OV1vWA3+n6MMH5PGxvOBsh8GmjySA3SA7CZ66YaW7xQrKBsKBO
	5DX1ypt9MNEZB8ffq1KrE+Oh9aYdLTxvTu/lcAwfdNjerOVM1fsCL7ZmJgQf7ofba5GS
	V/aRx1q35Ijc24VI/fdyEE22I7HE2eyJfam5JIekV0ndCyhUJxT2ajEnTS40CCmayw2f
	M4pGy8jfXiW0hGV2UbqBOixcEOHjHw7fCnCPYI9+bQ75JrqARl0WbjBbyZaehIBn2mTO
	HQJGvJLDyn4pJ1Jqx8Xm4R6vBzq4/GeM9sOSIk8dp1LcyBG8V2f/041vRlF/CZN4FwaB
	Wujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h9Lj4BajrbR8QxuI5mQnVqYssn0jnXPGzLAQ3Jt1wEQ=;
	b=A0lkMkU9khrNeGxh5ZJdUlxvOK9B5I3YhK9iu5UuYpuRJmoL3Ai6nkJ23yGlT7EKp7
	pwnDYmqkJdd2MOgGP924Yo393/tLU9nXRMfrD9VDt+704358Ry40fC6XNtsj80j9Oyxv
	S8GD3YSqDBNx6tQziSU8kQdoSb6w9AX9T6qSaDttJfukNOHrwMhpp0/m7t9T28E7ZnJ0
	eypvyG9OY7BYJ4BI1nEaR8FeMdhovzh2pxHBliQg/LBq+eSv3wtDGfrcJYyS+D38139i
	zkglopPkMClKbMePqg6iufSnEGE9LuNDPbxGp212QMle41UyIeHm2cBVZGPMwJUEe+0Z
	DXkw==
X-Gm-Message-State: AFeK/H0oW64N0hMMI+kJh+Xn7Q/tC+eW6fIjdn0d6UCef6hZNbZmqFpvAiRaVGT4pWCHLw==
X-Received: by 10.98.100.88 with SMTP id y85mr455510pfb.112.1490240305139;
	Wed, 22 Mar 2017 20:38:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i124sm6277651pgd.66.2017.03.22.20.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 20:38:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 20:38:14 -0700
Message-Id: <48d4089afac5042cfa742120e79f561f9b415d2b.1490240196.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <cover.1490240196.git.raj.khem@gmail.com>
References: <cover.1490240196.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] libvorbis: Contain gcc specific compiler flags using configure option
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
X-List-Received-Date: Thu, 23 Mar 2017 03:38:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libvorbis/0001-configure-Check-for-clang.patch | 56 ++++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
new file mode 100644
index 0000000000..7dad0cd8a5
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
@@ -0,0 +1,56 @@
+From 44b4511784f9b51c514dff4ceb3cbeaf9c374d08 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 16:06:55 +0000
+Subject: [PATCH] configure: Check for clang
+
+Disable gcc specific options if using clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eddd02d..00ecba5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -93,6 +93,16 @@ AC_ARG_ENABLE(examples,
+  	
+ AM_CONDITIONAL(BUILD_EXAMPLES, [test "x$enable_examples" = xyes]) 
+ 
++AC_MSG_CHECKING([whether C compiler is clang])
++$CC -x c /dev/null -dM -E > conftest.txt 2>&1
++if grep "__clang__" conftest.txt >/dev/null 2>&1; then
++  AC_SUBST([CC_CLANG], [1])
++   AC_MSG_RESULT([yes])
++ else
++   AC_SUBST([CC_CLANG], [0])
++   AC_MSG_RESULT([no])
++fi
++
+ dnl --------------------------------------------------
+ dnl Set build flags based on environment
+ dnl --------------------------------------------------
+@@ -127,10 +137,15 @@ else
+ 	AC_MSG_RESULT([$GCC_VERSION])
+ 	case $host in 
+ 	*86-*-linux*)
++		if test "$CC_CLANG" = "1"; then
++			ieeefp=""
++		else
++			ieefp="-mno-ieee-fp"
++		fi
+ 		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES -fsigned-char"
+-		CFLAGS="-O3 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char"
++		CFLAGS="-O3 -ffast-math -D_REENTRANT -fsigned-char ${ieefp}"
+ #              	PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math -D_REENTRANT -fsigned-char -fno-inline -static"
+-		PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char -fno-inline"
++		PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math ${ieefp} -D_REENTRANT -fsigned-char -fno-inline"
+ 
+ 		# glibc < 2.1.3 has a serious FP bug in the math inline header
+ 		# that will cripple Vorbis.  Look to see if the magic FP stack
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 636e0f307b..56c5b0a9cb 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
+SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
+           file://0001-configure-Check-for-clang.patch \
+          "
 SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
 SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
 
-- 
2.12.1


