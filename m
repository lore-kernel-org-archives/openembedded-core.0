Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2FECCA480
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:32 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.3670.1657094849293178961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=afc6LRMO;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id k30so10096029edk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJ916wRsvnN0pU5JMuH53DlnZa1JGGaABnSHEvK1fnU=;
        b=afc6LRMOYUf4bS1f6xB9EQELSOYcl+xDZWq6fj+Pqw/5pQXBlyPPlnJp9zmcNBLMFq
         eKEiHPrXAtfs1jF4dKJJXcJo53q+Cfo0oTsvPK0ZVsXbI8gzIkIBlz70Zc2+f8ZINlXb
         c5Kb4PaXx7eJPrHY8ebj/cHZk+P0YHD/d9u1f+iNh/tFSeMa32NFWt0MaNMriyobHDxY
         4wwqX2jfmFQrmWv/0yeflzTgfUuE/HeO2NjUwVFbjuQ9zsMYkwf5CUwN2PBGth50LBGp
         ldQJfk9vzMI7vsOm7ewMtvA6RXzHshxMGjFiijd1ZkvLw8x59oZe/dg2gi89usQtZKQP
         9Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJ916wRsvnN0pU5JMuH53DlnZa1JGGaABnSHEvK1fnU=;
        b=K+b5y4gIr+lQQd0Du6SSChumQ321cVioA3UTpeklbiIgO+aPrbCUTMKWYbId4b2tOT
         rVECE/c6aYgZIyYS4zut0ShEfHhyYI232QtTqULx1p+8rSRhau12FFcUgvyFAAmSElsS
         1leZcIy3nXSdBmEOzd3Q2gP6rrCz3VneXMB5qCdJgtb6oun6/JtnMOvA7GjCx9hZg11i
         CZcGT0LMews7aLZU1F5q7vJEgeMqfN+pJ4RaKU8KPjuIYjVZBhnlfyZje/YvHFjCtca3
         neZnzGrooajuuWBYdHGNue+EITXegLEy2BIZIKPPIy+IslB/OSVRLXLDpZFyBSAPYro5
         wFQQ==
X-Gm-Message-State: AJIora9rf7eN7eeUob7pudGbQRIHjPV3GWHtOBveMYokzZFA7Inwsu/P
	K0Qiib5uNUSWgH6otfBdvVkbKcPNprPQtQ==
X-Google-Smtp-Source: 
 AGRyM1uKsEKwsTmy8Mn8BpGKz6VrknQdl6e22Knhz9UH2qy5MEiYDAgMSFLtBvONOPx6L5RxcQ7D7A==
X-Received: by 2002:a05:6402:2911:b0:43a:2b8b:4c76 with SMTP id
 ee17-20020a056402291100b0043a2b8b4c76mr23074297edb.206.1657094847858;
        Wed, 06 Jul 2022 01:07:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/27] glib-2.0: upgrade 2.72.2 -> 2.72.3
Date: Wed,  6 Jul 2022 10:06:57 +0200
Message-Id: <20220706080721.3072553-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167690

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.72.2.bb => glib-2.0_2.72.3.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.2.bb => glib-2.0_2.72.3.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index fb50fff6a5..c0114397d8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From a30eb17c20e070124b55523d86729348f2929f95 Mon Sep 17 00:00:00 2001
+From 9a66887179d28d696562dcac43ad05d67580cfdb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index c4a8a4b8ad..dd1ea508d2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "78d599a133dba7fe2036dfa8db8fb6131ab9642783fc9578b07a20995252d2de"
+SRC_URI[sha256sum] = "4a39a2f624b8512d500d5840173eda7fa85f51c109052eae806acece85d345f0"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.30.2


