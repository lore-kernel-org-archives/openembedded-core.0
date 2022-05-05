Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3970C3527E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.7216.1651727152914044293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JsC1TT6/;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id m20so6526859ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9gaHGcH/swLMMSEzJn5Rp97XYV34DUUw34N8tsP+Hik=;
        b=JsC1TT6/KbnuV/qc1V5Fu6YCGnIv+ahtSjfYjD/OJ/DOjH23BEAzqX+L+RCwWC+Qqc
         VvqkB4ltmyFweV7i0iK6649FsXdl5Y6+mh7QxQo45P+s2rTwX30tzBQuDOiFpmi5E6Ux
         /bQ/M9QRBovTxfaXWf7mB0ORGBHxFN+U+8z6coG4z+LQ5v/muT8xy73r2qSjV5b5WOKD
         Z3H4n2v3DFynjdiGAg+K3/lCJo0LvtFlgaWxZNcudMqzKJdxtVHg79I8Lhy+5CS3MM1d
         kAUG4sDXt0gfzh7sqc+jgxCwiL+5o5F77tIgoNRXeC5YCcN+sCmU2M6ua82563jaavJj
         dYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9gaHGcH/swLMMSEzJn5Rp97XYV34DUUw34N8tsP+Hik=;
        b=PTt+QBRwK69tvs/61hkSq1/HXdXRTKCQB2BKfpBSWFDL4qwbnq0Q/BrsjQ0EQaTGnO
         Th1baWe2wcrT/pJfw76GpmHsgdi4bUpzDXH1EZ/TQF55N6MMtAq0dadbc0o7LwTi6jOl
         s9dH5fPFgq/h/lRrWUYjpa3PjJKdp65AZ8B3oQ8buZDnN/WV6mxvIt1OZa2zEv9wZ7yw
         KTkac1QRaZlAqO4Q0KK2yH2oFrpHPtTs/jUdqU0cmP9pJEyzcRjKuLGQAOhzfkLZ00uw
         jF6EGWbmC8W7pBnLTPVTB74wXXifWi97G+ntChLjD5uadlto3cgrHiw7JiZ0jBk8nqO2
         4ySw==
X-Gm-Message-State: AOAM5300mAdZus7taHzz/FtBJlaKNxKngq/XdsTCqK4pj3EWLlzzX1np
	45Bejn1yYg6MOebFsSjmgVDOZq9a8/Q=
X-Google-Smtp-Source: 
 ABdhPJz8tlgIrTbAD/P942LCUq/UA48ayE1MkAT1Hs1zQpCJ8lCdZwv8rHdBtq/JuoWryh7S1LuCQA==
X-Received: by 2002:a17:907:80c8:b0:6f4:3177:a0c9 with SMTP id
 io8-20020a17090780c800b006f43177a0c9mr20927252ejc.188.1651727182694;
        Wed, 04 May 2022 22:06:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/61] webkitgtk: upgrade 2.36.0 -> 2.36.1
Date: Thu,  5 May 2022 07:05:28 +0200
Message-Id: <20220505050544.651895-45-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165274

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkitgtk/add_missing_include.patch       | 19 -------------------
 ...ebkitgtk_2.36.0.bb => webkitgtk_2.36.1.bb} |  3 +--
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.0.bb => webkitgtk_2.36.1.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
deleted file mode 100644
index 8f59db3130..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Include locale.h for LC_MESSAGE definition
-
-This fixes build error
-Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp:115:51: error: use of undeclared identifier 'LC_MESSAGES'
-            return g_variant_new_string(setlocale(LC_MESSAGES, nullptr));
-                                                  ^
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=239030]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
-+++ b/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
-@@ -30,6 +30,7 @@
- #include "FrameView.h"
- #include "Page.h"
- #include <glib/gi18n-lib.h>
-+#include <locale.h>
- 
- namespace WebCore {
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
index db8a565511..65757c36a7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
@@ -15,10 +15,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
-           file://add_missing_include.patch \
            "
 
-SRC_URI[sha256sum] = "b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d"
+SRC_URI[sha256sum] = "0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.30.2


