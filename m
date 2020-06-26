Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.2892.1593155963786640639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BPhSQqsz;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id p20so8324718ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1BDsF5plZCqvD/BUPsGu065bUjIbTMGExMKD1NrV/04=;
        b=BPhSQqszv+/vpOLbEmfZ6lKtIg4cGuqfRnoJB/kzROq4XN7EEBN+oIkiutsCfxNHqR
         OrxNmYCkA6f0cI4u576TmwegvWwanWIqdt8IFdG+FSB/aUmbzgKpNuImqzKZtJmB1yDv
         IkaQuYnCjW9Ft2hOwQEllInwSMlWiTDfZzhqDKZEzmm+1Ut2wVwE+V/1F+4aqpH1/wrX
         znNlEXhaUaVOjafVfMI6wmO7vTfA3HdtGuhNnnoHbGYjoHJe14wZyoIYDI9RI1yTON/X
         PdU71jLZPtHmdWTn/kjb4EpbWn1j6ieq2bduFOoMFLtQWaXjsTAwauhDDVWygEBZV+CP
         OBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1BDsF5plZCqvD/BUPsGu065bUjIbTMGExMKD1NrV/04=;
        b=R99xkc6UF+I3UOZrfCFi1TOFQi/RPGtiVrvMdWXXgUi/YzeDlLwMPAMRdm95+71hzd
         Vc4KwlFL98paDGd74P+lkys9vC7H3BHLMbkuHByNSK8psI0pDGDIm5bu9sBDorstJaO6
         kS8ac3vaQm/q8zKVcLFOr4BAucuq1TCgkfxo5QtJ/G4Ao7bM5aqi6RAdAknbSLd0lezB
         CpviQWrmDTTXVA9aKepRm4hTMsjCYim+Hy8JVBFTUC1N/nTVV/ARMUPt6iCLjcSSDCv3
         BmHJ3d4R0zB54vI849E0difB0xBm9ZvE80eKTXxqqmAiqEDQGNAhevG2JjV9/rvYlxRz
         KZ8g==
X-Gm-Message-State: AOAM530Iic6Ps7y2bcOTge2jwLy/2l8gM5vDJotjwP+4Lh10sw8q/NV3
	dKSVQwhkHZqeLyxqj9s7XF5ZeCl8VGQ=
X-Google-Smtp-Source: ABdhPJyu1l2nr1swizSBuJ+Vq2DV1WcbT2zlN3Ve9RIqQ9lpX9WzmDkAn8JJapr+LBhKvuJjqnhFhw==
X-Received: by 2002:a17:906:9243:: with SMTP id c3mr1392753ejx.400.1593155962037;
        Fri, 26 Jun 2020 00:19:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/30] alsa-utils: upgrade 1.2.2 -> 1.2.3
Date: Fri, 26 Jun 2020 09:18:34 +0200
Message-Id: <20200626071844.29134-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...alsa-utils-scripts_1.2.2.bb => alsa-utils-scripts_1.2.3.bb} | 0
 meta/recipes-multimedia/alsa/alsa-utils.inc                    | 3 +--
 .../alsa/{alsa-utils_1.2.2.bb => alsa-utils_1.2.3.bb}          | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.2.bb => alsa-utils-scripts_1.2.3.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.2.bb => alsa-utils_1.2.3.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.3.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.3.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index 8bbc5d3ef3..b523a5a832 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -21,8 +21,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
-SRC_URI[sha256sum] = "44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"
+SRC_URI[sha256sum] = "ff19ae48c22938de7a491bdb39db74a2eee2546013f39bf1a86185e426f921aa"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.3.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.3.bb
index ff8945e5c7..3430288da4 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.3.bb
@@ -1 +1,2 @@
 require alsa-utils.inc
+
-- 
2.27.0

