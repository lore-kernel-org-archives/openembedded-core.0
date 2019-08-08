Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5ED7F2AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:07:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id d24so89203767ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0xt1nvevEazBCLoClGvEitMXMswYY/aDZM/C+aJb63o=;
	b=UU0ldwDbJx5dADB71Us9m8gLnxAUDtCYhMRhvcM/PbkG+3IfYcMhCjSqJHa7h9VnGa
	3Zwl5vQ2Rjl48r2LKTE2FC5jNqDKIb4h31wylyD4+aVYxS5G9d3A/M6ROoyV9Pn9RKIZ
	cvlSPOsqKml+QEJpSvlaWo7EkZ1EmsK7cxSAHkcKyhgXW92mhd+f9gN7+MT1XZKq709/
	LvxRcmJivMKHJrelqsmpgA2triY1BXPvOK4adYCEUN0fKwnNckygDHCZrAuF2ohxUZPI
	MnTZH3CN4I7OV5n7x7IlknnkJHLgV7sJWdoURuC0ssv4dda0jHXkTwkIOgYDGXuuVF/C
	9MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0xt1nvevEazBCLoClGvEitMXMswYY/aDZM/C+aJb63o=;
	b=J5oU1oTnWE/YpxLImCKM0tkz/8aI1ys6EtdZqpDKl5Yuvnw4C6mZAwUyACIYE+YvLx
	Mm9VMCk8o254EcKnR3t4/TCO4ZEwGFDoDKdKpsNe4N1KZ5tVunm0Q7BEc66HiyKjR5+t
	orcsRoyVkJICEol42WBBAwwWMeKQkRyhrlDc3kE2xMWzE9moRjbxLQiWixsmUnHElaBE
	hter5UuMK9wB4BQ2dT57AxcOFdwoqeatj/eZEKVXwLOwzOSw0q10IKSivBixWagLCieM
	jjzfYMYhxb5fVZ59hz2psSpBv7YtjNY0GWlc4EZQ/VS8IMEDNTSKM6rrB2UzNgGCFfzl
	eAqQ==
X-Gm-Message-State: APjAAAXOiMfI0j0QS1QIP0S4rXRqRcfLsWnPJhkv447/DRRdY3GcxE6T
	LrCb/lmAsfXlW/irqWatXhyOz8DId8s=
X-Google-Smtp-Source: APXvYqwFgOqIvq6Tj2EczTvjZ4L9CzoZUXpXC0/+WrsJQF2gcj1TkpYhGJHIXd3sEUI1XR54qN0S6w==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr8572667lji.223.1565276871137; 
	Thu, 08 Aug 2019 08:07:51 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j7sm21108204lji.27.2019.08.08.08.07.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 08:07:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 17:07:47 +0200
Message-Id: <20190808150747.25694-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] aspell: update to 0.60.7
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
X-List-Received-Date: Thu, 08 Aug 2019 15:07:51 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-test/aspell/aspell_0.0.0.1.bb     |  2 -
 ...60.6.1.bbappend => aspell_0.60.7.bbappend} |  0
 meta/recipes-support/aspell/aspell/gcc7.patch | 40 -------------------
 .../{aspell_0.60.6.1.bb => aspell_0.60.7.bb}  |  8 ++--
 4 files changed, 3 insertions(+), 47 deletions(-)
 rename meta-selftest/recipes-test/aspell/{aspell_0.60.6.1.bbappend => aspell_0.60.7.bbappend} (100%)
 delete mode 100644 meta/recipes-support/aspell/aspell/gcc7.patch
 rename meta/recipes-support/aspell/{aspell_0.60.6.1.bb => aspell_0.60.7.bb} (78%)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 922518bc39..9f905a5198 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -8,8 +8,6 @@ SECTION = "console/utils"
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PR = "r1"
-
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
 SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
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
similarity index 78%
rename from meta/recipes-support/aspell/aspell_0.60.6.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.7.bb
index 161bb5ce20..da99d12630 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
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


