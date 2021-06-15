Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.6420.1623744774629789325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aVNT0f1R;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id u24so49878613edy.11
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MraKdtZxZQtJnGLwGMHQpEkVi2QEtiVAhljCL+BNZo=;
        b=aVNT0f1Rio+WO4BIqb1D5uaSNaLaDQh2c4B/sIqE+g9HzueqkNXz3X5HhTXoa7OhNc
         +VxPiu1taGqjuWBdCyK7gd67AC243TFMYstisPCFDyHsu2Q2broJLCcg3o2KquaepLHM
         FqM0ExeLRq+7K2s55/q0CHPXmbBIoxglWhuylz3I/1LBp+I2LG/SguvWJcrMnM2YVS33
         3zLr9WW+hPBWndPEO7eerrwrTPgOdJ9WWowqI+v3D1okPFAZWame5/oH8PR28iISAMoN
         GNof6XG4FrfhWBDbg83AFPesbHseFviZP68moHKOPGzffnwa1NWHJ564V09kMA2J8Xf2
         SMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6MraKdtZxZQtJnGLwGMHQpEkVi2QEtiVAhljCL+BNZo=;
        b=RHgL/wmAnpuOOZrHTwIeOSaaXT1dTMMq6eVoytIa0d2eOkYPlrAMjohK/NrjnGTNLT
         QyfVgjrUb/XBjfD66PfqiTsodSWRJ5tF9TVGiHZw9RzCgFPjVOO4Gn3mQeRNiUUEVgtr
         2OgGvV/W4P88lGleGb38a3yKzFQYUQ9fGdip9N/8LkUmuNLyZC3HlCGZXUzfn7EpSdM8
         +DG8Agf14ZATcxnmeuDHQTAVm1pYzEu6o7H0gfyJYhWFEnUJZDRJq5cXmzFKtK03N3ZY
         lPEgTPHQ66C+ndwMgq2fiM6+i4Z5dENhcHi6qH5vRV/nICq+IHoiDKBElcaQUCA3YuEO
         2nNw==
X-Gm-Message-State: AOAM5310l8ZDXz1+SsucCbapUwGyB5kr4+8SwFzyHKnQ+UvZ+Fjynoer
	AY/m5qra/+ZsSnVT4nOPc8bEpt3K2Tb9sA==
X-Google-Smtp-Source: ABdhPJw+EY5sNlD5Vn8Yhv5j6PMXEAGr8RUnNfoLr/UypTrfdoixoos0HRsW4xR58nM6gNLKiigIHw==
X-Received: by 2002:a05:6402:144d:: with SMTP id d13mr21203538edx.288.1623744773311;
        Tue, 15 Jun 2021 01:12:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:52 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/31] glib-2.0: update 2.68.2 -> 2.68.3
Date: Tue, 15 Jun 2021 10:12:21 +0200
Message-Id: <20210615081240.1734087-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.68.2.bb => glib-2.0_2.68.3.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.68.2.bb => glib-2.0_2.68.3.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 7fbc07af58..f34f30bb3c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From b7abbba886d3743616f8cc0e8b441c879128bbda Mon Sep 17 00:00:00 2001
+From e56cdb8c343dd6a6ed3b10bd54e353d633ad6158 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
index 0cf16884ef..2a3a00fada 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb"
+SRC_URI[sha256sum] = "e7e1a3c20c026109c45c9ec4a31d8dcebc22e86c69486993e565817d64be3138"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.31.1

