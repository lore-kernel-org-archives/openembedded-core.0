Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 90E987DB69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 20:44:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44rQyF4gtgz5l
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 22:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556311445;
	bh=lnVb2u4lUQ4vCZBbDpiU6UOEI+/21IthYdnJHu87xio=;
	h=From:To:Subject:Date:From;
	b=UDZZSZNfSSf/vmjRAPQ5ZhviRcDTX/BKvR2wYlogKXfWNEeVTjMiFFKGvB8A/F6y/
	Qgc4YFqKgqIRO7pS8tg52xd7onu52blfE1aaljPAZkJ6357U/Zx+G3QX7jtDM46XXq
	VwYOax2gpUAxZnXROhIexcgy/zS5tadLeDt5yw1lGQRpvyuSFukRvg4xqGbWUlni6b
	1KTgg/gTsETNSZ5L2jDkfB7k1tOGQnO2l81NJfKHjrwp9kaLmRVhFuar4waTuALCWj
	qUoj426a2cQOlDy/s9eGU0jsujyzw4/yHxBaDZOoOBKtgZ5ovqvQJgr0vdGLWgBvYG
	cbhtKAqUpydHWF3zfFmd+MvfUJE9wyedWtjAkvpnb+w85UbjzA9eOjlJAxZC5Igf35
	+o92oPQM+3TMPE73XErJhDS5Ax0XnWzxnvaJuA36I/tkEJMYxepOsGkmdcaSzQWzsq
	ZGoqc6HiYSbA6RUXSO7A1KG5zgV51Tc848j95IZ1S7YKIDYFx+xypYIggy3Y7f0Ap4
	CPrNlaB5y8NhQVTrcxZ6AUnepxWSMiS5Z9o/CfEwDTMiY6Y7RJupLkjBjTLnBO4yzV
	llPQ8P+TPAlsJQG18a3QBgB2tR4okr85vRHWNqJZcRrwN01pzTDqI1U40wRqQHuLC4
	3eCqhOXGdHY0lsbBs/LTdlG0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2019 23:44:04 +0300
Message-Id: <20190426204404.14856-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnome-doc-utils: Remove stale patch
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
X-List-Received-Date: Fri, 26 Apr 2019 20:44:06 -0000

The recipe was removed 3 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 40 -------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
deleted file mode 100644
index 4cfcabd385..0000000000
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 426e38468463a4abb495cf6a269b9635b2107519 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 17 May 2016 13:51:24 +0300
-Subject: [PATCH] glib-gettext.m4: Update AM_GLIB_GNU_GETTEXT to match glib
-
-This avoids
-  error: m4_copy: won't overwrite defined macro: glib_DEFUN
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Inappropriate [No upstream]
----
- m4/glib-gettext.m4 | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/m4/glib-gettext.m4 b/m4/glib-gettext.m4
-index 81f8fd2..e2b142b 100644
---- a/m4/glib-gettext.m4
-+++ b/m4/glib-gettext.m4
-@@ -310,7 +310,7 @@ msgstr ""
- # on various variables needed by the Makefile.in.in installed by
- # glib-gettextize.
- dnl
--glib_DEFUN([GLIB_GNU_GETTEXT],
-+AU_DEFUN([GLIB_GNU_GETTEXT],
-   [AC_REQUIRE([AC_PROG_CC])dnl
-    AC_REQUIRE([AC_HEADER_STDC])dnl
- 
-@@ -381,7 +381,8 @@ glib_DEFUN([GLIB_GNU_GETTEXT],
-    rm -f po/POTFILES
-    sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(.*\) \\\\/\1/" \
- 	< $srcdir/po/POTFILES.in > po/POTFILES
--  ])
-+  ]
-+  [[$0: This macro is deprecated. You should use upstream gettext instead.]])
- 
- # AX_GLIB_DEFINE_LOCALEDIR(VARIABLE)
- # -------------------------------
--- 
-2.1.4
-
-- 
2.17.1


