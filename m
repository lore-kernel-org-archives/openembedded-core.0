Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.25210.1591602495900405068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bIJ+7LH3;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id d15so83348edm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0vvoJFwPjh2v2XeagowZvWWezsK5VntOFzA6SgS6NU=;
        b=bIJ+7LH3mZuzaz2UuzxgJ2rssRgylr/0btOlBepHyt7zcKY8EOH9tfw3VpqpcwmDb8
         QNL8Ud3Gor0GqUFb+R3mitpGZ0gGtODcl+RGIeBH7uXIc4cSKVQqztt3PtOHUWE1TGGa
         dGKJhuKSe003EImwNJJI5EGGj52NGrL7PLNvnRIjty8V8aj0jYkac8FdXjY1Bd+PPojo
         OMNFx1JmToP/R4OstawdsnCAgswVvz5OArfIZ97o7prPd1QqGNGWsgWLcfuKl75DSlrR
         K+L0SFwGSwAeUtUwte/IHrJ6637e5wSUXq9VUJ5YkPCRM/UFTADnnwir66KxP1v3jjFC
         LDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0vvoJFwPjh2v2XeagowZvWWezsK5VntOFzA6SgS6NU=;
        b=rk3L9UTvuHfGJ4t2PFm3foL2K0Hpf7EqvB12PEnhfRy7v1oDa58Vrn791LAPUIF18I
         tks9/CjiYHRQsOXdXbxHmwOFPrJM/75GE2dyRJ1BxH2O3WdSPLaleguUNoXxWdsOF62Z
         UCA41kHlOIuVCq+xvfa1lLr5fBi658aMDcat54F92eUGUyN5H5LdIP8BDns5iPPuMb3B
         Y9W0iyYWn5IBLw6sJo0b2SErY17h5ThFOAKRqmL+nR1gw361sqq0FaYsptuKNMo9kpnK
         Y3YUa2zq98up1496Jv92/sJYQ9NTSx76PhTqlU3V7/YQDMmDiBhteXbBjliLsoGCl7b2
         lLwg==
X-Gm-Message-State: AOAM530XCIRqWIeILh3gVk+IDwr1TVUi9Am5/TFaAHQdT/lDutnCf4Sn
	CxviZuVaRf5JKJ3/ypKkt/niM9mytNU=
X-Google-Smtp-Source: ABdhPJyyYfwQvCM6FkOG/7zgY7YIgF0SpbtxcOO2jPY0JI5kDkdTOZZrLrzdGXfn5RCvY/vlVD1K6g==
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr951986edr.289.1591602493879;
        Mon, 08 Jun 2020 00:48:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/42] linux-yocto: exclude from version checks/automated version updates
Date: Mon,  8 Jun 2020 09:46:18 +0200
Message-Id: <20200608074659.7051-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 ++
 meta/recipes-kernel/linux/linux-yocto.inc                     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 4481aa430c..20139a8497 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -32,6 +32,8 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
+RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"
+
 python __anonymous () {
     major = d.getVar("PV").split('.')[0]
     if major == "3":
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index f560dec589..bd37006f88 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
+RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
 # by the use of AUTOREV SRCREVs, which are the default for this recipe.
-- 
2.26.2

