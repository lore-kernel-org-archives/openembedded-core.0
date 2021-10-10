Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CADC433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.2075.1633893017426051811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CLqXh0VC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id o20so48498758wro.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yVQ9SZx8UP4oX5/TnB3yB9OY8E+X6wDgO+5e5UJh0k4=;
        b=CLqXh0VCBatAMtdzANTYLagugXIgZzmZSnXvE5niyC232Xy4WpGZ2WecqSENy7YWlY
         /nAXwnczUpr7cJJLVpQkGpc1qAhhJvRJ+nkTGR/BF40Jqy8dzDEI2pP+UWz32Whvo0Lj
         1hqdPIbUbmS6d5123fV0vGMl+INWdaMSzJxXqAAJ8bv31Qfzr8h28Apb0m+AcyACdAyD
         GTHQquGi4t6Fe+1xT6PZX/9ePlACaTQ0qCPBITWfzIyKw7FRbChzXL+gcTBIN1eiEKi5
         4Jhn1CyM5hcJ2QJdzdK3bkf6UesOEqmkbRy6ynF3HLEz+uX0BUvgrwOta8VwNtp2o4Yr
         +iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yVQ9SZx8UP4oX5/TnB3yB9OY8E+X6wDgO+5e5UJh0k4=;
        b=F5MYSQUKt+W+lZLbCp8jPiS14cD3fG6/VQDjJCPAAXGWmqaZUBh4Ps4RL+wr2ev7q1
         X2hS0Ya0yGE3XE6VmNfyGu0T3BBxDUJTyU6zqUOkyclh6LMD2yLL4Rei9/cfr+/r1j/X
         /AbvNKl1VNJ+Fus/MisXo9ZJKBVh39AysTwWc7o0TS4lIYxuX7UHdtx1bGMnP9CB2KTf
         KSKGdiz9j8MzDTR5BdbZOBstETcQyRz+7P4Fnjf9yPTut2CvyJqBXq3QFZ8WI2CCXQHH
         ZEK5avBmZ1JV8MeXH+Obvvp/vJgl+swidnBGxdaoJbnnBNYEFH4vR02O2qv2QWzQnhjQ
         kwDg==
X-Gm-Message-State: AOAM532u2lY+N+oa5ohQ0ad+ejg9blaLaaYFVUD14Jlelcz4BZNIAXja
	Jcd1yXmFPGtS4zwkniAIGJiNqhDnnno=
X-Google-Smtp-Source: 
 ABdhPJxwjTKWCbnklz6U6xE6DjckQx1/aQLRPpNjT5NKhRg5CilHisZyKwtbU2t5ap/KAWcyPwljLg==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr19554578wrs.350.1633893016072;
        Sun, 10 Oct 2021 12:10:16 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Jussi Kukkonen <jussi.kukkonen@intel.com>
Subject: [PATCH 08/13] adwaita-icon-theme: update 3.34/38 -> 41.0
Date: Sun, 10 Oct 2021 21:10:03 +0200
Message-Id: <20211010191008.4122049-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156801

The original reason to pin the version (outdated librsvg)
no longer applies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/default-versions.inc |  2 -
 ...1-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch | 27 ------------
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +--
 ...-installation-commands-as-shell-jobs.patch | 24 +++++------
 .../gnome/adwaita-icon-theme_3.34.3.bb        | 43 -------------------
 ...e_3.38.0.bb => adwaita-icon-theme_41.0.bb} |  7 ++-
 6 files changed, 17 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.38.0.bb => adwaita-icon-theme_41.0.bb} (87%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 5e6fd8a267d..a88b65a74ce 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -1,5 +1,3 @@
 #
 # Default preferred versions
 #
-
-PREFERRED_VERSION_adwaita-icon-theme ?= "3.34.3"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch
deleted file mode 100644
index 4ed5e151ee6..00000000000
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8b3b153b6b95662316528ef083365b46cf5f7841 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 30 May 2017 14:55:49 +0300
-Subject: [PATCH] Don't use AC_CANONICAL_HOST
-
-This won't work when building allarch (and is only used to find out if
-target is windows).
-
-Upstream-Status: Inappropriate [embedded specific]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 449865d..888649e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,6 @@ AC_PREREQ(2.53)
- 
- AC_INIT([adwaita-icon-theme], [3.34.3],
-         [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
--AC_CANONICAL_HOST
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_SRCDIR([index.theme.in])
- 
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index c8c70c4b580..5afba3c6443 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 8b3b153b6b95662316528ef083365b46cf5f7841 Mon Sep 17 00:00:00 2001
+From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 449865d..888649e 100644
+index f2659a5..1e8b016 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.38.0],
+ AC_INIT([adwaita-icon-theme], [41.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
index c4d7e2583bd..54e3e5ee85d 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
@@ -1,4 +1,4 @@
-From 8dcd73b45a660dbdc560676835ba46f495334f14 Mon Sep 17 00:00:00 2001
+From 79da031e9811f3eef34b14cce419be93fea34319 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 13 Jun 2017 18:10:06 +0300
 Subject: [PATCH] Run installation commands as shell jobs
@@ -7,14 +7,15 @@ This greatly speeds up installation time on multi-core systems.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- src/fullcolor/Makefile.am | 3 ++-
- src/spinner/Makefile.am   | 5 +++--
- src/symbolic/Makefile.am  | 7 ++++---
- 3 files changed, 9 insertions(+), 6 deletions(-)
+ src/fullcolor/Makefile.am |  5 +++--
+ src/spinner/Makefile.am   |  7 ++++---
+ src/symbolic/Makefile.am  | 11 ++++++-----
+ 3 files changed, 13 insertions(+), 10 deletions(-)
 
 diff --git a/src/fullcolor/Makefile.am b/src/fullcolor/Makefile.am
-index 1c940a5..3998ee6 100644
+index d73529b..b7d0808 100644
 --- a/src/fullcolor/Makefile.am
 +++ b/src/fullcolor/Makefile.am
 @@ -9,9 +9,10 @@ install-data-local:
@@ -31,7 +32,7 @@ index 1c940a5..3998ee6 100644
  ## FIXME we should add a way to remove links generated by icon mapping
  uninstall-local:
 diff --git a/src/spinner/Makefile.am b/src/spinner/Makefile.am
-index 86f4d7c..3fae8c1 100644
+index c14caf6..322dc0d 100644
 --- a/src/spinner/Makefile.am
 +++ b/src/spinner/Makefile.am
 @@ -24,13 +24,14 @@ install-data-local:
@@ -45,18 +46,18 @@ index 86f4d7c..3fae8c1 100644
  		context="`dirname $$file`"; \
  		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
 -		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
 -	done
++		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
 +	done; \
 +	wait
  
  uninstall-local:
  	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
 diff --git a/src/symbolic/Makefile.am b/src/symbolic/Makefile.am
-index 24aac9b..61ba071 100644
+index 957c0ee..e1f8818 100644
 --- a/src/symbolic/Makefile.am
 +++ b/src/symbolic/Makefile.am
-@@ -25,18 +25,19 @@ install-data-local:
+@@ -34,18 +34,19 @@ install-data-local:
  		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
  			context="`dirname $$file`"; \
  			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
@@ -81,6 +82,3 @@ index 24aac9b..61ba071 100644
  
  uninstall-local:
  	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
--- 
-2.11.0
-
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
deleted file mode 100644
index f98f20c378d..00000000000
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "GTK+ icon theme"
-HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
-BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
-SECTION = "x11/gnome"
-
-LICENSE = "LGPL-3.0 | CC-BY-SA-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
-                    file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
-                    file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-inherit allarch autotools pkgconfig gettext gtk-icon-cache
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch \
-           file://0001-Run-installation-commands-as-shell-jobs.patch \
-           "
-
-SRC_URI[md5sum] = "9aea4ad9bc002aacad155ee0748b357f"
-SRC_URI[sha256sum] = "e7c2d8c259125d5f35ec09522b88c8fe7ecf625224ab0811213ef0a95d90b908"
-
-DEPENDS += "librsvg-native"
-
-PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
-
-RREPLACES:${PN} = "gnome-icon-theme"
-RCONFLICTS:${PN} = "gnome-icon-theme"
-RPROVIDES:${PN} = "gnome-icon-theme"
-
-FILES:${PN}-cursors = "${prefix}/share/icons/Adwaita/cursors/"
-FILES:${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/64x64/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
-FILES:${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/scalable/*/*-symbolic*.svg"
-FILES:${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
-                     ${prefix}/share/icons/Adwaita/512x512/"
-FILES:${PN} = "${prefix}/share/icons/Adwaita/ \
-               ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
similarity index 87%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
index f9e52cacd2c..2b21e1bb2dc 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
@@ -10,15 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache
+inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+SRC_URI += " \
            file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[sha256sum] = "6683a1aaf2430ccd9ea638dd4bfe1002bc92b412050c3dba20e480f979faaf97"
+SRC_URI[archive.sha256sum] = "ef5339d8c35fcad5d10481b70480803f0fa20b3d3cbc339238fcaceeaee01eba"
 
 DEPENDS += "librsvg-native"
 
-- 
2.20.1


