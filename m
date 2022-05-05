Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0297FC4167E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:34 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7300.1651727163890420281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GF6poDxH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id kq17so6565366ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxSMA/G4TRk3wLAji+558dCzMMJcRLwHGBG3Gc6lGC0=;
        b=GF6poDxH6/tleQHNsSb15w2kPNjW8CGnIgnM0BFVkNitzpkXCJjORh3Q5ZDHNMax8X
         Xup0d+TLC9JyDKxuD8uGrp00axdCphHu4moucxENziEPEydyIdKHAV40aavCCqnrPE6Y
         SGfzDwVoVopSvQBLIzurTHhaqbSQ7h2IkEWku4QdxXsdAlxA8+RBR13ytPM1Z9w5Jqn+
         SDF5X17OdoVW8K+C7hOTFghC/WsM0SRd+aPPGgnzrBsugC07iG6OdAesMwn1h+uX3dcj
         9J6rwXctV7+ibHYtNGX/nN51OxXNRv+FDjX8z15GzGpy5f5MRbQyaZOYMDi+2dd3jI/x
         ycMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxSMA/G4TRk3wLAji+558dCzMMJcRLwHGBG3Gc6lGC0=;
        b=Oil9APYHR39O8ZBOJXGMKfEbaeoXMZdkvZXUZzcHKMRlEXitsWHPttzC99Y+iq5DJi
         TBrKJUs8TjPMM6Vd+FXtXCx5msN14uNno5QAP/vmKglyVIh6brYqqQ+SqH7++hDKEzt6
         PRB3AGgVVk1gQPj4b80qqi1rNRYx4lKRa9HtTfGUskhFlLGBvFEpGBMsiCvgcUU9fVIz
         wwTSoOXYFyokF7VIxkD2gWIzRtA27Vir+ZKx4uhLlWepMum7761LARPwxPClIc44CcAn
         TuwTpN87p0WaASF4zpP9gl900FHXbHUeWUluveek8CSoicFKQ9DFOeifVdiJWEbT0xOX
         e5nA==
X-Gm-Message-State: AOAM533fxQNx4YD3ZM8+fpm/oB8FWLjp/HfVT+QeIRKG+iVa4S7gPguT
	DN04xK5iGXkAJgzpPJNvpO4uteSY800=
X-Google-Smtp-Source: 
 ABdhPJzKgoavoiqigsSRQM3VzCAQStYf2cfWJxRKXPVjzsnUb7j9CIgB5r7WwqAFKwpDDFwMCnq8Ow==
X-Received: by 2002:a17:907:3f8a:b0:6f4:3f00:b1e9 with SMTP id
 hr10-20020a1709073f8a00b006f43f00b1e9mr18747148ejc.59.1651727192806;
        Wed, 04 May 2022 22:06:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 57/61] libhandy: update 1.5.0 -> 1.6.2
Date: Thu,  5 May 2022 07:05:40 +0200
Message-Id: <20220505050544.651895-57-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165286

Doc generation has been migrated to gi-docgen from gtk-doc.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libhandy/0001-Add-private-headers.patch   | 37 -------------------
 .../{libhandy_1.5.0.bb => libhandy_1.6.2.bb}  |  9 ++---
 2 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
 rename meta/recipes-gnome/libhandy/{libhandy_1.5.0.bb => libhandy_1.6.2.bb} (80%)

diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
deleted file mode 100644
index 7b2a512738..0000000000
--- a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 8 Dec 2021 07:35:52 +0000
-Subject: [PATCH] Add private headers
-
-After the commit(8157ecc Separate public and private enums) introduced,
-there comes a race as below:
- | In file included from ../git/src/hdy-settings.c:11:
- | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
- |    16 | #include "hdy-enums-private.h"
-
-So also add private headers like private sources to libhandy_sources to
-fix the issue.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index d087323..6f11f27 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
- )
- 
- libhandy_public_sources += [hdy_public_enums[0]]
--libhandy_private_sources += [hdy_private_enums[0]]
-+libhandy_private_sources += hdy_private_enums
- libhandy_generated_headers += [hdy_public_enums[1]]
- 
- src_headers = [
--- 
-2.32.0
-
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.6.2.bb
similarity index 80%
rename from meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.6.2.bb
index 722593dfb1..8d9904637f 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.6.2.bb
@@ -9,18 +9,15 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
-           file://0001-Add-private-headers.patch \
-"
-SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
+SRCREV = "f050453109db05621b9a47b9931fe1b571905e67"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-GTKDOC_MESON_OPTION = 'gtk_doc'
 
-inherit meson gobject-introspection vala gettext gtk-doc features_check
+inherit meson gobject-introspection vala gettext gi-docgen features_check pkgconfig
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2


