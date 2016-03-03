Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 051BF77112
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:31:40 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so51454891wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lnOZYEhGyHU5TbEG8n0tpNvs2NDhZXWTulXPMNksC8A=;
	b=XO4k8gSdxrHs4d0YIEcuFfJQGSh8BuSDYdtDFlcw+H7cZKDZj4+N34xI1IrNJlBs1M
	/2kYvgI8mHydUL4IcKMbQli1e04F0vNsyJTmwt2kfV1dEFsDrNU8lB/2w/f482FGcxVX
	C0k/JTqqkBQ7WCtyDkGnam0aNIbQ/bsA4HU0LFpuHNUnmCoCIFSZIZVDlqCZiNec+5F/
	S41UHvJ9fmqdOuOdjq0lG1WjpAZ+lvYJ4CzUTNoE0OW5B74M8o5AZFNqOMcNPTuf8dZT
	XOA4unjuyhK+EAXN57Sa/RnnzxKTPDLFVUbWvfW5B43Shcr6YD2nD+Je9loSdh9vGuA7
	LJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lnOZYEhGyHU5TbEG8n0tpNvs2NDhZXWTulXPMNksC8A=;
	b=WCHFbPnxFEg2OgUyUoAkXp1IONdrgWkYUSXKHUnrcNYrFIbuNiupSBRfKYlT5vs4ne
	/dZulxBZeUJmX4IqEwkTRZg8K4qsdht/wf1IMMuenqDu1I9CjoYc+QR8UqUKMrqvr6bQ
	uJZI7FOpQUCzbJGeZuCEQ78k/DWd5I7ftf/gufdfNpXadmerb4HrpMqfvoicrJlXNDHU
	nWlURg5bwNOaqr62JYMHmX9y7f95xpzr5VbuzyZeSKsJQNhNdfhJuy6kOUyxk9fVxiwg
	s8x2BYgFtWz389THPrRwbi82otyvjXn4g4aAnALepMWdQi1iMPbzFtUnkQ0RIsoziqO5
	8tiA==
X-Gm-Message-State: AD7BkJJ5iCbi6o/o+FYKiqhw4by37zIjcFQGmhJDJYTH/Pxnq3/WIaEIM1PpAuPOcGw2rg==
X-Received: by 10.194.187.240 with SMTP id fv16mr5909412wjc.53.1457037101032; 
	Thu, 03 Mar 2016 12:31:41 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	y62sm162930wmg.12.2016.03.03.12.31.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 12:31:40 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 21:31:27 +0100
Message-Id: <1457037087-13715-3-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
References: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
Subject: [yocto][xcursor-transparent-theme][Patch 2/2] xcursor-transparent-theme: Remove old recipe and related patches
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
X-List-Received-Date: Thu, 03 Mar 2016 20:31:42 -0000

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../fix_watch_cursor.patch                         | 17 ---------------
 .../use-relative-symlinks.patch                    | 25 ----------------------
 .../xcursor-transparent-theme_0.1.1.bb             | 19 ----------------
 3 files changed, 61 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
deleted file mode 100644
index cfac55c..0000000
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix typo in Makefile
-
-Upstream-Status: Pending
-
-Index: xcursor-transparent-theme-0.1.1/cursors/Makefile.am
-===================================================================
---- xcursor-transparent-theme-0.1.1.orig/cursors/Makefile.am	2013-03-07 22:25:04.001435305 +0000
-+++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2013-03-07 22:25:04.061435302 +0000
-@@ -79,7 +79,7 @@
- 	ul_angle \
- 	ur_angle \
- 	v_double_arrow \
--	watcha \
-+	watch \
- 	xterm  
- 
- CURSOR_DIR = $(datadir)/icons/xcursor-transparent/cursors
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
deleted file mode 100644
index 5028fd6..0000000
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Use relative symlink for link rather than absolute path which 
-doesn't work well in DESTDIR setting.
-
-Also fix out of tree builds to use correct srcdir.
-
-Upstream-Status: Pending
-
-RP 2013/3/8
-
-Index: xcursor-transparent-theme-0.1.1/cursors/Makefile.am
-===================================================================
---- xcursor-transparent-theme-0.1.1.orig/cursors/Makefile.am	2013-03-07 22:25:03.933435307 +0000
-+++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2013-03-07 22:25:27.293434755 +0000
-@@ -88,9 +88,9 @@
- 
- install-data-local:
- 	$(mkinstalldirs) $(DESTDIR)$(CURSOR_DIR); 
--	$(INSTALL_DATA) $(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/ 
-+	$(INSTALL_DATA) $(srcdir)/$(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/
- 	for CURSOR in $(CURSOR_NAMES); do \
- 		echo '-- Installing cursor '$$CURSOR; \
--		ln -s $(DESTDIR)$(CURSOR_DIR)/transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
-+		ln -s transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
- 	done
- 
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
deleted file mode 100644
index 5e668ab..0000000
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Transparent X11 cursor theme for touchscreens"
-HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SECTION = "x11/base"
-PR = "r4"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/utils/xcursor-transparent-theme-${PV}.tar.gz \
-	   file://use-relative-symlinks.patch \
-	   file://fix_watch_cursor.patch"
-
-SRC_URI[md5sum] = "7b0c623049d4aab20600d6473f8aab23"
-SRC_URI[sha256sum] = "b26adf2d503d01299718390ae39dab4691a67220de09423be0364e9a060bf7e4"
-FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
-
-inherit autotools allarch
-- 
2.7.2


