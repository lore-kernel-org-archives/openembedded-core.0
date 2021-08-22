Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.9624.1629636707939201170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SGNXCVB+;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id n5so9436014wro.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mYILizXrG4CvtQkgA6nkQSrQf7gRYb3Ss2GyTrZjxg=;
        b=SGNXCVB+GegG/ju3bTza96LpOs9VHX9aKAZyy+VaLW8qZCglizfQP5302HqjwI8ajw
         kGj1izmJMX59dtfBShladAkrcK8L2smnYXxWoFQMPJ32B8QcK28Qc/+GKqZiC6cThhkH
         i/09eDMRD4loyzHDnP+dPGGPJgYVClYVKdI7f3iYesE9uRokaLxMLudgV9ZOozghsF6K
         IeTrK6L76w1CEbCSwVnX2CAs4EPXU8G0ukHFQE+zODZDc1NFfRCZ+nUJ19Xlsuyiy8wU
         IerxjWJ8pxuU3l/F0IKMi89smuAF94zeXdrpFjC2HwxB2FLb9V4UWnyxqxy0JeM1GxEk
         udbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mYILizXrG4CvtQkgA6nkQSrQf7gRYb3Ss2GyTrZjxg=;
        b=Un6O6ohFS+ig1TpXLGAmgpQlCh02lajXcVlQlvfyznhVRzWsRji7cSGNJR4e+j3gw6
         TCL0O3EW5lcBBK0nd7TKxzVhlG3DVMerkLMTbOrHRdc5yO/xjFdI2IkBo7uzwlv9u6oo
         oJOIJsISNkVFCo8TGHu1lysAnSnRS5kKuJtHQb0JMXUSwO/H9RXUkTJ9ij43CfYE+gH4
         9r3sFK91scpfXExKrec+wB2slsTYpyfwwoLzyc5Cmd4iivyT3uVR8+Tl6csNVDLLMdLZ
         3lfHLuYs4gpaz+KOY1CNpSmkFOoOQSI0GMcI8uFYUxPPcJ7M17ITPvrMkfpW0Uf1WF7L
         3lZw==
X-Gm-Message-State: AOAM533WWPAhFtIcMcS+5nBrQ+tsKCORJg0lcnc7201bct0zim1POS9u
	4zQoO2d8Nqsq7LP6T0h2ziLQ0uuKFLGgfg==
X-Google-Smtp-Source: ABdhPJyDFwPQ1/2rbq5AXZheaE3qX+/yoQvoCYvFfCBB4nFOgW6ndZ+uAjfb9pAS/Em8mMD7hfYj6g==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr8479291wrl.155.1629636706611;
        Sun, 22 Aug 2021 05:51:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 52/55] enchant2: upgrade 2.3.0 -> 2.3.1
Date: Sun, 22 Aug 2021 14:51:00 +0200
Message-Id: <20210822125103.310416-52-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../enchant/{enchant2_2.3.0.bb => enchant2_2.3.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.3.0.bb => enchant2_2.3.1.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.3.0.bb b/meta/recipes-support/enchant/enchant2_2.3.1.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.3.0.bb
rename to meta/recipes-support/enchant/enchant2_2.3.1.bb
index 165b08f871..72603045c8 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.0.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "df68063b6c13b245fa7246b0e098a03e74f7a91c6d8947bc5c4f42ce55e2e41d"
+SRC_URI[sha256sum] = "7b4b1afcf2cd8bfa691deea6188404d337f23174bbc39b9c2add2bf340736e9c"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.31.1

