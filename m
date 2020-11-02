Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.1149.1604335769870526254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bRbwn6f4;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id k9so15052144edo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TOW1fNKzWKsPtOhTc5cbG+0hp3fPVGAqyY5+4QZ9OiQ=;
        b=bRbwn6f46ywmKh9V4SbynQtjAujcFfTFzFOR5o0xzKtZQQANiNLvPsOYnSz+hcitg1
         yCwcJsK/5lYpE8l9hKX+e3NIyaO2tcQyjc+YGEKllzz4iJ5SXrmZlsTbuaKlmg717LOF
         tlUHDHmvjxdV82dBwyR1sme0uJat4wjb9SIsFaonM3NZW1gCDUBhhYcttIRGrBCx1B2W
         DAemfR1p6txDEIu6G4pMXZc6yZdFQ82FK1OLvwTo0oZTbXh81T4Qqqy5ZXRJeHK3LZk7
         Q97P6v/RBtGyDEloxe84JCCAif3E26jCqfcnSDr8jyi0NBe+hZiCM22cV0HruzVQY/Od
         4avQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TOW1fNKzWKsPtOhTc5cbG+0hp3fPVGAqyY5+4QZ9OiQ=;
        b=UdUGRJT2JKoUPoG7j9x4t+DiYlr2bdckp2rOiZvRCn6BTEscARM1G3mhtOYxeOyDLr
         puUPKul14DpC6Ey/KnXUQsnfBBJpRqeZlXJYtuMVR4X2mpuv1U1/e8BwikD7Ir9RPEyN
         glQmb5HY8SJd78zl6T9/UACqu+KraP9bopu9BGtr16gIG84t9YdxCpRCDwp/SKSq9Fsk
         EuEUzglDeXOh9Emx9QyujG1ViEoGpNxSxC2DkWUGVM4E+0H2TtwiqbzO9L/fZBVE2jg1
         z2aOtA0xAbbwrJz9gtQSH/Cf5G5SJxJk/xxylkiU/QtiDRzM8MlLcQtKZU6qZsh+gRmU
         DkbQ==
X-Gm-Message-State: AOAM5330kKV9nK0dJw4YAIJb2Qe2jBaM8rXEP52ynbwO2uxJV9N++Fhm
	+p3Yn3pVIXI6x8NoyqwisTQh4S1F/JousQ==
X-Google-Smtp-Source: ABdhPJzDY9CeJE0uRhzr9mSsyfANhSuK2x9pjsQlIPDrkppDWnR/NUkO0nTWxTqgr2qOHTFb0XNKGA==
X-Received: by 2002:a05:6402:21c7:: with SMTP id bi7mr2298152edb.54.1604335768184;
        Mon, 02 Nov 2020 08:49:28 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:27 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/80] at-spi2-atk: upgrade 2.34.2 -> 2.38.0
Date: Mon,  2 Nov 2020 17:47:59 +0100
Message-Id: <20201102164907.27572-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../atk/{at-spi2-atk_2.34.2.bb => at-spi2-atk_2.38.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.34.2.bb => at-spi2-atk_2.38.0.bb} (77%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
similarity index 77%
rename from meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
index 02a4d4712c..fce14eecf3 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "58cd278574e101363b18d9a8b7053d67"
-SRC_URI[archive.sha256sum] = "901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0"
+SRC_URI[archive.sha256sum] = "cfa008a5af822b36ae6287f18182c40c91dd699c55faa38605881ed175ca464f"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.29.0

