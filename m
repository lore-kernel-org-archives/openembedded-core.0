Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.13824.1629891513844710388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a59FLVIV;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso4050193wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DbYznb8u3uf5C6qHEn8SGlNNPqBSuwsb5FEoHs90o2k=;
        b=a59FLVIVTmlUPta6e1tBtoZoo0NfXo6PCSwggsW7m1SQc1sdGX8PYkxzwFUS3W1WjA
         /NRwm74Z0069W+SGO16Sa2k525xmg52XJAeIFU3NbrD8KpxZ3nvnAZomRVxvcDewd36z
         OHhlr0YkzQudpTnJx6WuPbvwoizTdKfl5b5wp/x9eXHJBmPoj+ABRp3+I1UcSknrfnMp
         nB8lzLu+/P/zu8oIhmLcdtCTbFXoTtUM4wurn0Edd8g4pIohwC2W06WevLgdyFhIjCrc
         5nwHBwQFEcPYQurx2nbVntfvWCKRTga4xvd17Fyd2S8Fg82UDjgsm2O4Yvi8GNAyKyIH
         0vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DbYznb8u3uf5C6qHEn8SGlNNPqBSuwsb5FEoHs90o2k=;
        b=ClPI4ZxgGps2MgMEpvRWBOavwHk9g4r7bfHfUg/B1+IknOcvpTcqQTFymLCJO3AYAT
         YPYZ377YPc64N4BjOabbZANbg8Qf8MQ4RU9IzYrUkqZS0MXmc8ksfrDS7E+wnQuJcSNB
         ffjmMjxBEmk7HzkRwm8gXbMfxCCr0MY2s/E4rmtlUyV43KWzVOz5PO+ohKGXA7HfpUpj
         UNLUEQbYKttk/2fNRT9qKELG9Z8WYprXHBRxXppmBuv8o2F4NGvb/04GTS4MTDLs6+j0
         D+ggZJLSO3lhdmE6IRm2RbaqwPCG2b7E8tFN6r+GvMhmCD0oP/EEoQMhlHc1WIOjagi9
         G14g==
X-Gm-Message-State: AOAM5322ABr+3J53Lr6XqUxKWCJMdEOYEmzmaC76dS1ni3D2MWqMEejU
	UmP6aUWCkb7MzxF0B+HieRkbCfJu+ib2ug==
X-Google-Smtp-Source: ABdhPJzxEREPhFYwOJB/u/EBJ6IvRT0UTm3TOG539VSb1y5OUlJaCLBmRmkf0r/zNEO8gOB8lBqfCA==
X-Received: by 2002:a05:600c:19c7:: with SMTP id u7mr8601437wmq.121.1629891512466;
        Wed, 25 Aug 2021 04:38:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/16] vala: upgrade 0.52.4 -> 0.52.5
Date: Wed, 25 Aug 2021 13:38:00 +0200
Message-Id: <20210825113804.779395-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.52.4.bb => vala_0.52.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.52.4.bb => vala_0.52.5.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.52.4.bb b/meta/recipes-devtools/vala/vala_0.52.5.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.52.4.bb
rename to meta/recipes-devtools/vala/vala_0.52.5.bb
index 8e2869d408..2f78c4a447 100644
--- a/meta/recipes-devtools/vala/vala_0.52.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.52.5.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "ecde520e5160e659ee699f8b1cdc96065edbd44bbd08eb48ef5f2506751fdf31"
+SRC_URI[sha256sum] = "84a1bb312b3e5dcae4b7b25c45598d375e2cb69233cefb59a15d2350c76bdd91"
-- 
2.31.1

