Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.1209.1604335780560898466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qr3ljkxF;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id j24so19752258ejc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xir2y6n/BMjG9CiPaDgeC4c6gASu1VnfgTIQjis8/HY=;
        b=qr3ljkxFKP1cttxSBmZxfoNnBPKZ8xWz2hqacXTL9o0fRj69Tn+q7VHzzARnEm9RQs
         1i1W/yZUpdtJ7At54LvlSXFwLRhsWwjKwJAnZbjKd+pKVqna+W9TY314iwvqjkhPfO+I
         TvTRtdCrm9Z33qi0N1bVY4ESYopbZmMIiX+Jti6cYEr2UMfjqy/Sa6G+H1J+ZoEq2UnJ
         iQEHTmmVN/k+M8b6ZANZj7rzdF0PI129e/aaUzo6E1Q2OzwD20u8RNAu++erIA5217+Y
         DFLqJXnjOjFpmjAuknTTXiiFf57RSMMS0kILTWth7eK/h+9T7iKiIUvUyWdMRwr7Udgz
         H1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xir2y6n/BMjG9CiPaDgeC4c6gASu1VnfgTIQjis8/HY=;
        b=OVIZ50drtvV3XVJyUIvj2hJt0xb49ryVqxWdBll+hm9wZH2t2ElEjlbI9o/zi7+elU
         WmIg33weETSQQ4b6/878ajCloI41eRxLxpD8/UNLSkROd9f1fzWFq8DbmmgBiW6Yg9WT
         m0+IhZab5Z0t3YBLyMj8W/Zsp6zPUMoNi9u43k2XxIlkQoSkEnVPFt355X1DNxnDdBzq
         p9bQkkJA6SU0n0jhJa6H8jWuhKrb+U87Tka/OBz8OUFwXj51uq0oaPpbYuUaodBXUeu/
         5rEujraxeFr6yHOs9Vu3UweMe9VNavBCu7687k6+9sLKjZVc3XRifsT0Z40I20l33msy
         UaqQ==
X-Gm-Message-State: AOAM532f/B3oRCkpul7AGfFyanG2xb+Ny8VTDkNZiystKp2On/PbD/Wz
	21lN+bUp523bOZLLLIVSrmi/W0uH8jZCEg==
X-Google-Smtp-Source: ABdhPJxL0FHnC86ssTP+GubGjqravSlTztquqqMUcIPh5QVdNX3vuOHGGKxL8ih5ehFuheDGZiJJNQ==
X-Received: by 2002:a17:906:3650:: with SMTP id r16mr15859748ejb.419.1604335778900;
        Mon, 02 Nov 2020 08:49:38 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:38 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/80] glib-networking: upgrade 2.64.3 -> 2.66.0
Date: Mon,  2 Nov 2020 17:48:11 +0100
Message-Id: <20201102164907.27572-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.64.3.bb => glib-networking_2.66.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.64.3.bb => glib-networking_2.66.0.bb} (89%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
similarity index 89%
rename from meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
index 074389f552..230932daf0 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "eb382907ec941fe2fb1a9676b75acf7a"
-SRC_URI[archive.sha256sum] = "937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168"
+SRC_URI[archive.sha256sum] = "c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099"
 
 PACKAGECONFIG ??= "gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.29.0

