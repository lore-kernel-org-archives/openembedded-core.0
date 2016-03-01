Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4A9731DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 21:39:21 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so52345610wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 13:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=OR2grCOnidTD8kW5MoHZhvef2yhj5i2ycxi/9xYE0i4=;
	b=K3zBXqIi8vPE6u3BbaXhRT+PeLJg31XGIp/3jivwYaNqmuQTeGeOjmUny+S/4zVJQ1
	rZdXH8CfbcMOKGyafeByIJtCzGSZWIo9ky6B/dyQ5hOsD6tLxPfeWHo7pCp+wlCyC22R
	jzdXlzw9vIUcOt/iszU0JPp60OmSRzY9ks0x+NM4Byo/DzGXXSwF2/6IuvfFyIGYKK5R
	ZDF68CSvH0oHY9WklwVt1I4dDF9M6iWqoX623XmjGcLUh0fK+IW9G9hpgIkmjGEoKerw
	YMHGqVPEjjcQtk+gz5Q+s8UzptvLjcjFxbX2gxkdMUgCZ1DfD6ZqfqIyKvt7SzRKDokY
	VMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OR2grCOnidTD8kW5MoHZhvef2yhj5i2ycxi/9xYE0i4=;
	b=PzfZ6siBZdMqikZYxl3oYIKZbeZS5bwgTfTd2tZF5smBJJWvnH4wtRUGQy6HEyPbz7
	SeStVxfiazk7eL5IwWVVuoiEX0vJFgPmZkAx3D7O5BYG8VkbTxikc7U3BfZquyMmCAcc
	m9XVF1mH6kUDy6Sh/GfFwUFd2ggfcwetNcqFSwcLNsjpTr6j9kEKkVtrlO5iHhJgdf1X
	p2VIwlTVhXy9KZ0DSsrCdvS7QHjqAmoX2ocQ6yGdABY8r955s8MEs9lK++G+NQAhB27Z
	QsrP60n2VIq53Y4tAc1y7dWv0uIxbiniiIyaR4kuMKkyiPn+tAKuuCqZzjjWaJrPIvSA
	Grrw==
X-Gm-Message-State: AD7BkJKBld+XiPFjEM/zAb0oBb9L/wtMZ6F8BoePxycFLE1HBTM5SLnTC3BD0C1G6Y0VYQ==
X-Received: by 10.194.47.237 with SMTP id g13mr22843374wjn.142.1456868362182; 
	Tue, 01 Mar 2016 13:39:22 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	v2sm999476wmd.24.2016.03.01.13.39.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2016 13:39:21 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 22:39:18 +0100
Message-Id: <1456868358-9326-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [Patch][jethro][master] xcursor-transparent-theme: insert several cursors
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
X-List-Received-Date: Tue, 01 Mar 2016 21:39:25 -0000

This patch inserts several cursors which are used by Qt for example.

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../insert_several_cursors.patch                   | 79 ++++++++++++++++++++++
 .../xcursor-transparent-theme_0.1.1.bb             |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/insert_several_cursors.patch

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/insert_several_cursors.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/insert_several_cursors.patch
new file mode 100644
index 0000000..861899e
--- /dev/null
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/insert_several_cursors.patch
@@ -0,0 +1,79 @@
+--- xcursor-transparent-theme-0.1.1.orig/cursors/Makefile.am	2016-03-01 21:48:25.000000000 +0100
++++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2016-03-01 22:10:06.473326873 +0100
+@@ -26,10 +26,17 @@
+ 	bottom_tee \
+ 	center_ptr \
+ 	circle \
++	closedhand \
++	color-picker \
++	copy \
+ 	cross \
+ 	cross_reverse \
+ 	crossed_circle \
+ 	crosshair \
++	dnd-copy \
++	dnd-move \
++	dnd-no-drop \
++	dnd-none \
+ 	dot \
+ 	dot_box_mask \
+ 	dotbox \
+@@ -40,21 +47,27 @@
+ 	exchange     \
+ 	fd_double_arrow \
+ 	fleur \
++	forbidden \
+ 	gumby \
+ 	h_double_arrow \
+ 	hand \
+ 	hand1 \
+ 	hand2 \
++	ibeam \
+ 	left_ptr \
+ 	left_ptr_watch \
+ 	left_side \
+ 	left_tee  \
++	link \
+ 	ll_angle  \
+ 	lr_angle  \
+ 	move      \
++	open_hand \
+ 	pencil    \
+ 	pirate    \
+ 	plus      \
++	pointing_hand \
++	progress \
+ 	question_arrow \
+ 	right_ptr      \
+ 	right_side     \
+@@ -67,9 +80,17 @@
+ 	sb_up_arrow \
+ 	sb_v_double_arrow \
+ 	shuttle \
++	size_all \
++	size_bdiag \
++	size_fdiag \
++	size_hor \
++	size_ver \
+ 	sizing  \
++	split_h \
++	split_v \
+ 	target  \
+ 	tcross  \
++	text \
+ 	top_left_arrow  \
+ 	top_left_corner \
+ 	top_right_corner \
+@@ -77,9 +98,12 @@
+ 	top_tee \
+ 	trek \
+ 	ul_angle \
++	up_arrow \
+ 	ur_angle \
+ 	v_double_arrow \
++	wait \
+ 	watch \
++	whats_this \
+ 	xterm  
+ 
+ CURSOR_DIR = $(datadir)/icons/xcursor-transparent/cursors
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index 5e668ab..5a9df62 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -10,7 +10,8 @@ PR = "r4"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/utils/xcursor-transparent-theme-${PV}.tar.gz \
 	   file://use-relative-symlinks.patch \
-	   file://fix_watch_cursor.patch"
+	   file://fix_watch_cursor.patch \
+	   file://insert_several_cursors.patch"
 
 SRC_URI[md5sum] = "7b0c623049d4aab20600d6473f8aab23"
 SRC_URI[sha256sum] = "b26adf2d503d01299718390ae39dab4691a67220de09423be0364e9a060bf7e4"
-- 
2.7.2


