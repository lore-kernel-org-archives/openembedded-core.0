Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25842CCA480
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.86904.1657040629934346768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZctgpymV;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id n8so16159658eda.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9OH4Y24qtv8AZjVzixNzSiwCoJkKPpzastnvATKuTbQ=;
        b=ZctgpymVpcQ5yNx3tjU3Y7Ks5Le6P7a22Vfh+Plp3cdK4swD/qFIcysCkyiLG1I+tP
         +9aISjqGmyPMFEWvFTxWxgt5nRfmKKzAW7W2qTjRUTJC2srkdnn1vfFU0qX2+fOZKe6g
         u8M3EJ8nQVmVbrUd3CPSEDXKPPt/XptqdZboMTeJ+XVhnCiA83YAB2TpRzhZrSAm/JcQ
         3qK5aiD7NrLCft5JavukvwytVCJpYJqunfrr1cvoJzGSngVva/GgkUlmu8iJQ9/lCYSH
         Hof6w4lUE6AK7pIT4vPuzoUrKwDjNQq9D/39PB4PfDBhnX3p2HIOCDD0AgfGOH6fOt+z
         FDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9OH4Y24qtv8AZjVzixNzSiwCoJkKPpzastnvATKuTbQ=;
        b=DTORzKI1uLjeTDkVUftM/SklpaZm2U0pmnAmW1N15Duv4G8lWPWC7hgZjlfWsIw97M
         sFAYFLp6AhFZRBLU01syp1VR7GZtlxOXF0n1MsQO29jkKT+974b8WGq3BMSydzaoUKAe
         yeQAPnqApM1/y7w299QZRzvbVppWHBkjQb+/iKJMvF8By+XDKs5Vznf1HGdfhAlVkXYL
         ubrpqKFTgBb9VKjp/TSJ5NhaY4gXnTmEcnL2mkSOne0I0y9TVOpJ0terN1yeuil2RI9q
         Mn9sKOnlp1TVFpy0Kis9vPokjZidpzX/WZwpTMRgJGXPA4XzpNp4H66I6WicRR5ExH1/
         UPkA==
X-Gm-Message-State: AJIora9+kYcEmz0Yp+eFbOinRbxb9fSBROU4X+6QwrNDVqxEaW0Ff8kz
	qgrDnmVVwWz+3Ds876SQ0dX5kCET8Z/lSQ==
X-Google-Smtp-Source: 
 AGRyM1t9xF9PNmJVgSj3+94mJwc2WnkSqZeOa/Xyqi6gmIE6bIJ0ZOyfCbl1SIn4biMcPa/NzaJOZQ==
X-Received: by 2002:a05:6402:430e:b0:435:9e41:6858 with SMTP id
 m14-20020a056402430e00b004359e416858mr48832846edc.69.1657040628157;
        Tue, 05 Jul 2022 10:03:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm23999886edb.56.2022.07.05.10.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] adwaita-icon-theme: upgrade 41.0 -> 42.0
Date: Tue,  5 Jul 2022 19:03:34 +0200
Message-Id: <20220705170339.771017-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167670

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +-
 ...-installation-commands-as-shell-jobs.patch | 84 -------------------
 ...eme_41.0.bb => adwaita-icon-theme_42.0.bb} |  7 +-
 3 files changed, 5 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_41.0.bb => adwaita-icon-theme_42.0.bb} (87%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 5afba3c644..56fd3daead 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
+From 985eda68d3303112791cf6858f6fef1a99288e8a Mon Sep 17 00:00:00 2001
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


