Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id E3C987D848
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:57 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t22so4203834pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bvDAMfP5z4N0NJ3eXGCc3b8jc5rUQvkKPl7gpp3822E=;
	b=WMxSe6+2KtFy2j76crwtvSALUKdMExq5Vwv1CY1vgmK3FV3GwNRYShp7RZHaa2dMH9
	yLY88RmdXJYGfr4kib9FespwwE//yqDZvy39jrF1vf/IEyasSZpLtSc/vAXMFMqFMMSG
	K4WeaRBU+bcwLHnP8pAOt8FCB85s4+1XLITY6wIXFLuRZRuskJqo/Dt4ofJ7enJKRxEE
	bu8OkJiY/bl+anR9BhveQcY5bQkS4VAX6YVCG6fVhPNjJYVw3/6kb398gGtxwzAhWOzy
	2k79NScF8cSaAyfhrq2YbraPKqDwuh5JNkC8eSgVaVSfXZmLTBQDFMavntVRpYlH0+CD
	Udug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bvDAMfP5z4N0NJ3eXGCc3b8jc5rUQvkKPl7gpp3822E=;
	b=mJE3ZY9YLfrBi9c1RB52lu3rWXmO8KPmgpYnaUP0tpVvIIiUcunsTMJSAWd+jUeKXf
	G38hy3Cmt18HMDsSNCFSUanbpGpoUVW3o0ZTvI+mrfayRVUx4mBRbMmmh1Y/vzM80Qec
	Z8ianhm/13o/xTcaNgCj8VitaBhkesyUOuz0lSjUO+37ewwyNiN2MwRY6YEbO9MSdVTj
	dbparmMvA81ixYeUlZW0vdRwD4tWZXOnKpjgrgodbk9LkGjS9FPJzg2Z8NyXVXIwXcQi
	nCblgbSf4LZFozA/iV+Fg46ZfvOYd2G+eCCJadW0piliOvndi4Vf7DRbeuncgPKqP1rg
	GGiw==
X-Gm-Message-State: APjAAAWY+2ZEmCdtDS+Udp4NUhNCVYyNjBM+rJZGf2kLDmgDaF4Fp7DS
	CB2myevn3/PNPdDmGFXy0LV+l81P
X-Google-Smtp-Source: APXvYqzoOJUoWdSgNBDZvhjdc3znU//WJkDTKyGRl7euRYUR4cw8IDRcSqgpaLRmnr6bGHcqGvA05g==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr12385106pgh.96.1556983678949; 
	Sat, 04 May 2019 08:27:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:09 -0700
Message-Id: <ca1292c6521c353c8203e7b1e1a4ec72b09baf21.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 33/43] gnome-doc-utils: Remove stale patch
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
X-List-Received-Date: Sat, 04 May 2019 15:27:58 -0000

From: Adrian Bunk <bunk@stusta.de>

The recipe was removed 3 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 40 ----------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
deleted file mode 100644
index 4cfcabd..0000000
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
2.7.4


