Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2DC7D6A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 13:03:32 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id j17so15448076lfp.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 06:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wAhMmh2eSPGcCyLVS6WbqzBMykGXa9AWH/hEOCA3WvE=;
	b=BH2kE2sJxxAxjnBBFDmKXg1bJwHFWhzoeC501cqs3JyCCpIYZyJ7WZai66QBAp9tm9
	LwAttcqW37yv8Na8c0bhfme9fpPHuMdo9PSY95o9X0qHb4NIVsfAG1gN1uv45eO8+6i+
	ptQOKT3wtIfPWV7GyELW4U5w/n0a/sws7sCmrgqsYYAKlTEZ5HsV+Zy21esx08LEvW5Q
	DqRJ0qa2mdAdKG74DdHpXjrFE4YSTmugMswtYTRz1T75k3BXxsfpkHLTi0wXU57ps1Cx
	YyQx149x2V4diRc1evMsy37Rh4qgP2M2hfXlgZIVcn0os7eZb69tV40r7I7N79iXmS0I
	O6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wAhMmh2eSPGcCyLVS6WbqzBMykGXa9AWH/hEOCA3WvE=;
	b=Yn8//9arGrwz6SJbhYT+7B9a0CL0vhPEZns1g5wiSgQ/+TnPz6NCmCaX+5Odg0/+e3
	UF9CsqOm10qiuAGKNSFommWPvYRBntdXZ+mhp5dY8S5y/uSI2CU31JaW2NevvhQcxnhy
	gRxvgQ191bwAm8u8rSVErjRvksnQNFGq8Pw/Q64iEqosB9hUecMQtD+4ow6360cbZlyy
	jJ/aKoMxiGWjZ4Kkc6EOwFcH/VQlVb/5bhh0qAYqw1+CTMS2Hg9+GYI5pPl1SSC7wy0n
	D4d+ACgZRXQ0iWXMwaYNlIgqXaGRKvSbz1/YaKGjv6jlhxmwklQdFN6oKQJ47RE0iS0O
	K/qg==
X-Gm-Message-State: APjAAAWlZiBWwPZVnVci8MxQU3HgMxESFJKKCjWgLh7sY2VYtVZ0WT9j
	J/H+ny3RyFSkAHXz6/wrJg2RCYcD/Iw=
X-Google-Smtp-Source: APXvYqyPE4cEE9EU7FeKKofHNI2uOl1Je6fjDPY10RYyqdILq2PAnzwXgNitSxEdk+LXNp2pdOFMFQ==
X-Received: by 2002:ac2:55a9:: with SMTP id y9mr13069548lfg.28.1565355812152; 
	Fri, 09 Aug 2019 06:03:32 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	b30sm4499767lfo.49.2019.08.09.06.03.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 06:03:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2019 15:03:28 +0200
Message-Id: <20190809130328.25754-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3] aspell: update to 0.60.7
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
X-List-Received-Date: Fri, 09 Aug 2019 13:03:32 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...60.6.1.bbappend => aspell_0.60.7.bbappend} |  0
 meta/recipes-support/aspell/aspell/gcc7.patch | 40 -------------------
 .../{aspell_0.60.6.1.bb => aspell_0.60.7.bb}  | 10 ++---
 3 files changed, 3 insertions(+), 47 deletions(-)
 rename meta-selftest/recipes-test/aspell/{aspell_0.60.6.1.bbappend => aspell_0.60.7.bbappend} (100%)
 delete mode 100644 meta/recipes-support/aspell/aspell/gcc7.patch
 rename meta/recipes-support/aspell/{aspell_0.60.6.1.bb => aspell_0.60.7.bb} (77%)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend b/meta-selftest/recipes-test/aspell/aspell_0.60.7.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend
rename to meta-selftest/recipes-test/aspell/aspell_0.60.7.bbappend
diff --git a/meta/recipes-support/aspell/aspell/gcc7.patch b/meta/recipes-support/aspell/aspell/gcc7.patch
deleted file mode 100644
index 6ffd0772fa..0000000000
--- a/meta/recipes-support/aspell/aspell/gcc7.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8089fa02122fed0a6394eba14bbedcb1d18e2384 Mon Sep 17 00:00:00 2001
-From: Kevin Atkinson <kevina@gnu.org>
-Date: Thu, 29 Dec 2016 00:50:31 -0500
-Subject: [PATCH] Compile Fixes for GCC 7.
-
-Closes #519.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- modules/filter/tex.cpp | 2 +-
- prog/check_funs.cpp    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/modules/filter/tex.cpp b/modules/filter/tex.cpp
-index a979539..19ab63c 100644
---- a/modules/filter/tex.cpp
-+++ b/modules/filter/tex.cpp
-@@ -174,7 +174,7 @@ namespace {
- 
-     if (c == '{') {
- 
--      if (top.in_what == Parm || top.in_what == Opt || top.do_check == '\0')
-+      if (top.in_what == Parm || top.in_what == Opt || *top.do_check == '\0')
- 	push_command(Parm);
- 
-       top.in_what = Parm;
-diff --git a/prog/check_funs.cpp b/prog/check_funs.cpp
-index db54f3d..89ee09d 100644
---- a/prog/check_funs.cpp
-+++ b/prog/check_funs.cpp
-@@ -647,7 +647,7 @@ static void print_truncate(FILE * out, const char * word, int width) {
-     }
-   }
-   if (i == width-1) {
--    if (word == '\0')
-+    if (*word == '\0')
-       put(out,' ');
-     else if (word[len] == '\0')
-       put(out, word, len);
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.7.bb
similarity index 77%
rename from meta/recipes-support/aspell/aspell_0.60.6.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.7.bb
index 161bb5ce20..1da29a089a 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
@@ -4,13 +4,9 @@ SECTION = "console/utils"
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PR = "r1"
-
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://gcc7.patch \
-          "
-SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
-SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[md5sum] = "8ef2252609c511cd2bb26f3a3932ef28"
+SRC_URI[sha256sum] = "5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
-- 
2.17.1


