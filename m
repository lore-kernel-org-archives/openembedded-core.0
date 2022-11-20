Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E96C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12404.1668951093813364598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAK/7S+2;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so16308349wrh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWCwVXiylMSQONlObCfvZRp9+p+FpEgDi8UHp47u12o=;
        b=TAK/7S+2wLhErZvJ3dTR2w1IfU4/BAk4wTgSu75PJIoqLdKbl7Jz2l+Z5ohiOgcsUZ
         fbQEhEqbgAHEq4nLNVkxPUHY3xvmjDhlstneBgZQWGHakPwjouhCFfKHJBcefT/DJCww
         tNtKya1Vycjrna39pGONDsJ9iOPxRy5uePnjOKDb+MGvj7dRabWBYU6R/WUDxBD+HohX
         zGmhEAOC1Ps0zr3GzpWAWbzBLQhJTswni2iuslE/KxGaSZmyDJm5ZQe13PiZXGbE5rsQ
         PO0NkAA9lbaAkl29Paq14UoORc5hE2yUcM9QFv/wBoP8vsAj36jpEQeqSTmVYriiQa6y
         OXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWCwVXiylMSQONlObCfvZRp9+p+FpEgDi8UHp47u12o=;
        b=DUtXXmN+rGhxgULL/e/hW/pC86T8brK8jNiva79Gf3cyYRtSYzQRkP4tgx3SVAmidu
         vwuEp1k68dzGxmqo5DO2oZQu580rsavJhe0cq6qY+bjdfOrLX3+v72q0j1Np+B99nk2W
         Y9Ytr1LpnPq6JuyCFQ58fIU+HnBKfr/9RibOjTQYbKsGeJ/mLO2NEfNur6fvzWif8eFp
         eRawdB7/QPXdSFOXU/H799RTn1gETLwU7sVgvT3xZw/vcN2RKbVQ9hkKZSUEq+XNMqnd
         gEIneLSuuZ0Uc+g5yQipVCebelnT/UVgM186WclTAGNtJe1lA1CdZzLJjOeph2ec9wlP
         SaYQ==
X-Gm-Message-State: ANoB5pkJHUV1wG16fsM79BrAt/6y49UPjsCmGDQh+Avr6bFlBJYQaz/G
	MvULtof7yUpLL85dU+YLI7n/EDFa8+M=
X-Google-Smtp-Source: AA0mqf6rUWs9k4rRomy7pYuVYu8wksyuANoHARRRzb5sfXgv8KMy75PH81irUVykBx7ktkUQgKXNnA==
X-Received: by 2002:adf:ead1:0:b0:238:55af:b5db with SMTP id o17-20020adfead1000000b0023855afb5dbmr8720759wrn.97.1668951101387;
        Sun, 20 Nov 2022 05:31:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/17] vte: update 0.68.0 -> 0.70.1
Date: Sun, 20 Nov 2022 14:31:22 +0100
Message-Id: <20221120133122.2464634-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173598

Transition to gi-docgen from gtk-doc.

Drop vala tweaks: gobject-introspection already does
it correctly (with STAGING_LIBDIR included).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rrectly-substitute-gtkdoc-qemu-wrapp.patch | 24 -------------------
 .../vte/{vte_0.68.0.bb => vte_0.70.1.bb}      | 16 ++++---------
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch
 rename meta/recipes-support/vte/{vte_0.68.0.bb => vte_0.70.1.bb} (73%)

diff --git a/meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch b/meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch
deleted file mode 100644
index c69a52e5d0..0000000000
--- a/meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From daa30d0039397a735d49ea535305ed0bc5f9d73b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 26 Oct 2021 09:38:42 +0200
-Subject: [PATCH] Makefile.docs: correctly substitute gtkdoc qemu wrapper
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- doc/reference/Makefile.docs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/reference/Makefile.docs b/doc/reference/Makefile.docs
-index b18f0a4..da18440 100644
---- a/doc/reference/Makefile.docs
-+++ b/doc/reference/Makefile.docs
-@@ -233,7 +233,7 @@ INSTALL_DATA = $(INSTALL) -m 644
- 
- GTKDOC_CC = $(CC) $(INCLUDES) $(GTKDOC_DEPS_CFLAGS) $(CPPFLAGS) $(CFLAGS)
- GTKDOC_LD = $(CC) $(GTKDOC_DEPS_LIBS) $(CFLAGS) $(LDFLAGS)
--GTKDOC_RUN =
-+GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
- 
- GTKDOC_CHECK_PATH = gtkdoc-check
- GTKDOC_REBASE = gtkdoc-rebase
diff --git a/meta/recipes-support/vte/vte_0.68.0.bb b/meta/recipes-support/vte/vte_0.70.1.bb
similarity index 73%
rename from meta/recipes-support/vte/vte_0.68.0.bb
rename to meta/recipes-support/vte/vte_0.70.1.bb
index fc4324872d..ee53fcd799 100644
--- a/meta/recipes-support/vte/vte_0.68.0.bb
+++ b/meta/recipes-support/vte/vte_0.70.1.bb
@@ -15,24 +15,16 @@ DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
 
 GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_OPTION = 'gir'
+GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
-SRC_URI[archive.sha256sum] = "13e7d4789ca216a33780030d246c9b13ddbfd04094c6316eea7ff92284dd1749"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI[archive.sha256sum] = "1f4601cbfea5302b96902208c8f185e5b18b259b5358bc93cf392bf59871c5b6"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-# Instead of "inherit vala" we do the relevant settings here so we can
-# set DEPENDS based on PACKAGECONFIG.
-
-# Our patched version of Vala looks in STAGING_DATADIR for .vapi files
-export STAGING_DATADIR
-# Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
-export XDG_DATA_DIRS = "${STAGING_DATADIR}"
-
 # Help g-ir-scanner find the .so for linking
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
-- 
2.30.2


