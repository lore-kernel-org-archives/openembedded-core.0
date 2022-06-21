Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BF8CCA483
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.48351.1655842611630756622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ji9qp1mP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id u15so2168031ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=grZLQ71WhdPTxBARdYqJ3tEhnR9dYRIgNdSIzmPOcc4=;
        b=Ji9qp1mPxH7vZnQPXtF9Yy53guBVznMKiDf0KkAn8a+JqrXdpanBSgMJGmpvCNrADh
         gBkcabtQeGa8srl2+oddk+iDuXBAsDRRDXRBu0l4FzI9y5+ICo+l5lGcjzkbjJCRcU8c
         zzIc7nuoXgecmfaPjxFz0ejr4nk89loChLTGy/FXiNlc2tgbG+1UElw/L32KLq5GjxnM
         lgaY5zRvZgWL+fUbnabb8dd80J7TLOFlUYaxHS4EUcZlZFmx8ANzm2BUd+KLcm4dzBlO
         yrZzAQKseytxxasySo5jz9OGR/HaEhfKD4QEdZEaaTeCFD0eBYMgwTl75r4BBKwnN/8P
         Qx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=grZLQ71WhdPTxBARdYqJ3tEhnR9dYRIgNdSIzmPOcc4=;
        b=7UiEidUNFopg0jNv6G1QK7ygZK8evOkMbSzZtUI7pa4TLl3IzzrGRSAzgg9jy8dKZ7
         oTp0g4/fuayOZZ1g45KTPp3XARNYt0R034DEL+OTFeW/9wvVFCPNyONNAdF9VaJlvvtf
         u6mRAUAJ7RADu/IKbCErVHU15ZrUxO/pFDuBHrEBL8lxxbGV0Adpivshh5xfqF/rlKgr
         HIyN6zN5+1UReTg0387sUpuWnzo8ZeHm6CkoRU9+3IWZMgjOh55a/viAfN85Zn45VExM
         UTEFfUbiBCdv5F4EpDUbbxNgSQDOCE+vZ2dlkkpbIaL815vS2J/jRYH/lB4alwmWQ2c3
         h/tw==
X-Gm-Message-State: AJIora+4ckGTkU35/C5paTQSUXuPTS+YeU4B2NVsjqjVBwXcV+x6Yt32
	Wcr+RUBxVSYSxsIooGiz7gP4V/0SKAI6lQ==
X-Google-Smtp-Source: 
 AGRyM1u7hNyh0VgNJ+3s0g/VFO0L0swldfkBXfhDuwUIfB7NVfIh12KwYI102McqqNej9KK62xWUZA==
X-Received: by 2002:a17:907:da0:b0:722:c42e:25b9 with SMTP id
 go32-20020a1709070da000b00722c42e25b9mr10894363ejc.260.1655842610173;
        Tue, 21 Jun 2022 13:16:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/18] python3-numpy: update 1.22.3 -> 1.22.4
Date: Tue, 21 Jun 2022 22:16:23 +0200
Message-Id: <20220621201637.1378306-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167172

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...y-do-not-write-full-path-to-output-f.patch | 28 +++++++++++++++++++
 ...umpy_1.22.3.bb => python3-numpy_1.22.4.bb} |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch
 rename meta/recipes-devtools/python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch b/meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch
new file mode 100644
index 0000000000..41dea89682
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch
@@ -0,0 +1,28 @@
+From 3c7deaa3a961a0f3ce4ff108468e3d70118f17b3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 9 Jun 2022 17:23:42 +0200
+Subject: [PATCH] generate_umath.py: do not write full path to output files
+
+This helps reproducibility as those paths vary in automated
+build environments.
+
+Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/21707]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ numpy/core/code_generators/generate_umath.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/core/code_generators/generate_umath.py b/numpy/core/code_generators/generate_umath.py
+index 292d9e0..df37941 100644
+--- a/numpy/core/code_generators/generate_umath.py
++++ b/numpy/core/code_generators/generate_umath.py
+@@ -1233,7 +1233,7 @@ def make_code(funcdict, filename):
+ 
+         return 0;
+     }
+-    """) % (filename, code1, code2, code3)
++    """) % (os.path.basename(filename), code1, code2, code3)
+     return code
+ 
+ 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-numpy_1.22.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.4.bb
index b5b1c4e714..8ad3442413 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
@@ -11,8 +11,9 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
+           file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "a906c0b4301a3d62ccf66d058fe779a65c1c34f6719ef2058f96e1856f48bca5"
+SRC_URI[sha256sum] = "b4308198d0e41efaa108e57d69973398439c7299a9d551680cdd603cf6d20709"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2


