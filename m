Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 39849731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:00 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 145so4261338pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=y6ZlPavBrAMAZwmalYMV5auOpKxzGXHWfuXlyx6DOik=;
	b=mOD5UgkXoTzrgSs81kVmppVOXGQzPdprAJAgWQKSA5qmr66srGZ1F/zkIr8v2Dyx2K
	kHgCYuGbRuKtDFE60z0vOVySjNVXebIDHCkhzukhRDflgb0f6AoEMaEe6wZRfjRN0W6u
	gHwF53XewAx76qemi2y1xXJ3xWyw3m0qPRS2Um4/ikdxqFVbBFp0UySvby8WjDw6IemB
	Hc8qLqQN/0DoYpkTMDx/WOMdbBQd6BzRPSDg8ALojlwHJ4sSpzGGDy4ayy7gl4fY/Lk1
	O+DTlzKXkUZAt+O0R7ruqv2G/jHIZP/tZSftWdiXjtUjm1aa51gOZg7m1FE0K+Cg842I
	89zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=y6ZlPavBrAMAZwmalYMV5auOpKxzGXHWfuXlyx6DOik=;
	b=ELtKseM5KC31NZGb+eao5q9Sxwmbua0XFkoCllVrWJR3nRv2gukKhhJmczbyrSPuAg
	pWNFScKK3Wq+K8N3QKZ37Xj6zKj6bbI3K7gwrF11QeWEiOoGzYFw96iq8231GaaJWMcD
	nsiY0wjNNs12qsddjl5ca4ItXHvbbnYl4Q1H55WmfV/ZPiGhbS6b98dsx5eWXyD/EYzK
	hUPe6qcX90coekvN14fS+DPmB2IjlX4Okc1rXbVaNZ949SAWhYMeBL0E0iFx69Jr8wX1
	NIQMTD+uCQ4hh5PKcX6VOe5GjVDH/6BF3UeUzAyQZpWMwwj62y0kevJvQeCEepdFhcnZ
	DHyw==
X-Gm-Message-State: AOPr4FVtUa6T8rkaxIhkshFBRWzitsOUx4v2fyKuRB5M+ABK3Z8slhv6ETVj2EhQKX8Ptw==
X-Received: by 10.98.48.71 with SMTP id w68mr6756869pfw.18.1462988161246;
	Wed, 11 May 2016 10:36:01 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:09 -0700
Message-Id: <3478c8d23f6d73e35573d68fd533585989f43163.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 06/42] alsa-tools: Fix build with gcc6
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
X-List-Received-Date: Wed, 11 May 2016 17:36:00 -0000

bb.utils.contains was spread over multiple lines
collapse it into single line, make it more readable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...idi-Explicitly-cast-constant-to-char-type.patch | 75 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb   |  6 +-
 2 files changed, 78 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch b/meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch
new file mode 100644
index 0000000..bf95cac
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch
@@ -0,0 +1,75 @@
+From 1cc0aa4dbd3c7f1267809e0e1ca57d46f4803bfd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Apr 2016 23:25:18 +0000
+Subject: [PATCH] Cus428Midi: Explicitly cast constant to char type
+
+This is flagged by gcc6
+Cus428Midi.cc:83:1: error: narrowing conversion of '-1' from 'int' to 'char' inside { } [-Wnarrowing]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ us428control/Cus428Midi.cc | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/us428control/Cus428Midi.cc b/us428control/Cus428Midi.cc
+index b9e6783..bef7bb1 100644
+--- a/us428control/Cus428Midi.cc
++++ b/us428control/Cus428Midi.cc
+@@ -32,22 +32,22 @@ char Cus428Midi::KnobParam[] = {
+ 	0x2A,
+ 	0x29,
+ 	0x28,
+-	-1,
++	static_cast<char>(-1),
+ 	0x10,
+ 	0x11,
+ 	0x18,
+ 	0x19,
+ 	0x1A,
+-	-1,
+-	-1,
+-	-1,
+-	-1,
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
+ 	0x2C,
+ 	0x2D,
+ 	0x2E,
+ 	0x2F,
+-	-1,
+-	-1,
++	static_cast<char>(-1),
++	static_cast<char>(-1),
+ 	0x20,
+ 	0x21,
+ 	0x22,
+@@ -64,14 +64,14 @@ char Cus428Midi::KnobParam[] = {
+ 	5,
+ 	6,
+ 	7,
+-	-1,
+-	-1,
+-	-1,
+-	-1,
+-	-1,
+-	-1,
+-	-1,
+-	-1,
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
++	static_cast<char>(-1),
+ 	0x30,
+ 	0x31,
+ 	0x32,
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
index 9e633f1..916bf08 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            file://autotools.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', \
-                                'file://makefile_no_gtk.patch', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
            file://gitcompile_hdajacksensetest \
            file://0001-as10k1-Make-output_tram_line-static-inline.patch \
-          "
+           file://0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch \
+           "
 
 SRC_URI[md5sum] = "b476a5afaa3ea3230855553ad59d259d"
 SRC_URI[sha256sum] = "7d34558c590a50294b36576d257316a1ac5cd951eb8cd7d330e09f8cc757ab51"
-- 
2.8.2


