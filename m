Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D9DC636C9
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.9391.1649926647782040708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A3mMZn8+;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b24so5452351edu.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ShZbl+jrCZWXraNJFJA+orB+ppJ1m2305kWIi222pws=;
        b=A3mMZn8+dAt/ZfYy8bgoaRNiGNhtrXRpMkjku++mmCjZJ5E3gj1KeUMEwy1Lsn5Fpb
         wuQwIbTrvth2LjAU4T9RHVSclvwqDTs5pIYZH/AtDPpSxwfhSF+vgGGGmD0oEu5/SlpV
         rNJS4Epg7cj4wz6vQlwiuS991lLSDUHhd7DHb9yxdkyD4+SMnYUb0jcJMAo5ivRsDr8B
         uyTxdauveFv5iz+R6Ygc4YV0ZEx96qtIlD9pxu1saUn6RilLLKFLvgC03Iilv1mkDrx5
         NsQ71b2RJ4LNploz4SDop+io6q4jfaWebqnywZxs/i8T1XZbOHTi/5/Rr7WibNvIrJRj
         0B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ShZbl+jrCZWXraNJFJA+orB+ppJ1m2305kWIi222pws=;
        b=bhUJvjd8EmKAc8LNUGmpZWQEsvXX/CSxMUKPMWx1vRvaJWUpG1eN238eLQPEKqfRns
         k2QcoaP7fK7/J1f6ucZXsCcNyM+ZOV1KvFbr3qMSAjv560MRazZU5ErAOdOGfsIAlm4m
         fBGtpP0VWHMW85YMEz70oVL/qByhcAi5tZChGsgVhi/KT2LroIQjuhiedYO+tIa5QB18
         ozFyTa2gZoYDGyZWkBEpSkDCZoc/CrF8Z3uTMsu9ke5uL6rvSNHt5s8jlIWeuskPjZVT
         zIhxdR5vhjc2W7o5MxmpjPO8Kx6N7zhojDDH7khV4rw01n7phizDNuWi1myXHC3C4QUh
         JtvQ==
X-Gm-Message-State: AOAM533ele22F8hyHRBcSsdCVPOmqtu9Jw5rPlX+mC4Rh3KUbYAUxSRv
	mfG07s9WzNl9Kz8QFAsPB49mG4S1+bQ=
X-Google-Smtp-Source: 
 ABdhPJwMk42SLY+5dt4x0rQ4hNC3Gf9HDBhBV3oG3lKGyIUrcsljEdi6GsT2W+o5sawZD69QW6VgUQ==
X-Received: by 2002:a05:6402:34d4:b0:421:16c7:f474 with SMTP id
 w20-20020a05640234d400b0042116c7f474mr1313611edc.356.1649926646323;
        Thu, 14 Apr 2022 01:57:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm429542ejb.35.2022.04.14.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:57:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] adwaita-icon-theme: upgrade 41.0 -> 42.0
Date: Thu, 14 Apr 2022 10:57:10 +0200
Message-Id: <20220414085710.2010223-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414085710.2010223-1-alex@linutronix.de>
References: <20220414085710.2010223-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164400

From: wangmy <wangmy@fujitsu.com>

0001-Don-t-use-AC_CANONICAL_HOST.patch
refreshed for version 42.0

0001-Run-installation-commands-as-shell-jobs.patch
removed since it's included in 42.o

(From OE-Core rev: 17a08277854eb1e8776cf7790f6255ea68bf0568)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +-
 ...-installation-commands-as-shell-jobs.patch | 84 -------------------
 ...eme_41.0.bb => adwaita-icon-theme_42.0.bb} |  7 +-
 3 files changed, 5 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_41.0.bb => adwaita-icon-theme_42.0.bb} (87%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 5afba3c644..32f98e049b 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
+From 15ffd817b3e334dc7c0508761c7ef417d76379c5 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f2659a5..1e8b016 100644
+index 040975e..5f7b53a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [41.0],
+ AC_INIT([adwaita-icon-theme], [42.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
deleted file mode 100644
index a1d39cf558..0000000000
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 79da031e9811f3eef34b14cce419be93fea34319 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 13 Jun 2017 18:10:06 +0300
-Subject: [PATCH] Run installation commands as shell jobs
-
-This greatly speeds up installation time on multi-core systems.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/merge_requests/39]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- src/fullcolor/Makefile.am |  5 +++--
- src/spinner/Makefile.am   |  7 ++++---
- src/symbolic/Makefile.am  | 11 ++++++-----
- 3 files changed, 13 insertions(+), 10 deletions(-)
-
-diff --git a/src/fullcolor/Makefile.am b/src/fullcolor/Makefile.am
-index d73529b..b7d0808 100644
---- a/src/fullcolor/Makefile.am
-+++ b/src/fullcolor/Makefile.am
-@@ -9,9 +9,10 @@ install-data-local:
- 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size && find . -name "*.png"`; do \
- 			context="`dirname $$file`"; \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 		done; \
--	done;
-+	done; \
-+	wait
- 
- ## FIXME we should add a way to remove links generated by icon mapping
- uninstall-local:
-diff --git a/src/spinner/Makefile.am b/src/spinner/Makefile.am
-index c14caf6..322dc0d 100644
---- a/src/spinner/Makefile.am
-+++ b/src/spinner/Makefile.am
-@@ -24,13 +24,14 @@ install-data-local:
- 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
- 		      context="`dirname $$file`"; \
- 		      $(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 	      done; \
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
- 		context="`dirname $$file`"; \
- 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
--		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
--	done
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
-+	done; \
-+	wait
- 
- uninstall-local:
- 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
-diff --git a/src/symbolic/Makefile.am b/src/symbolic/Makefile.am
-index 957c0ee..e1f8818 100644
---- a/src/symbolic/Makefile.am
-+++ b/src/symbolic/Makefile.am
-@@ -34,18 +34,19 @@ install-data-local:
- 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
- 			context="`dirname $$file`"; \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 		done; \
--	done
-+	done; \
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
- 		context="`dirname $$file`"; \
- 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
--		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file; \
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file & \
- 		for size in $(symbolic_encode_sizes); do \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
-+			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context & \
- 		done \
--	done
-+	done; \
-+	wait
- 
- uninstall-local:
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
similarity index 87%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
index 46f9f4772c..c4f3b1c999 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
@@ -12,12 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
 
-SRC_URI += " \
-           file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
-           file://0001-Run-installation-commands-as-shell-jobs.patch \
-           "
+SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
 
-SRC_URI[archive.sha256sum] = "ef5339d8c35fcad5d10481b70480803f0fa20b3d3cbc339238fcaceeaee01eba"
+SRC_URI[archive.sha256sum] = "5e85b5adc8dee666900fcaf271ba717f7dcb9d0a03d96dae08f9cbd27e18b1e0"
 
 DEPENDS += "librsvg-native"
 
-- 
2.30.2


