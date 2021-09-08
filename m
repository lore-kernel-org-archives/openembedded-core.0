Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.15616.1631124105778073898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LsKr+f5a;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id v10so4565198wrd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kqR8G66cSDgtgfi7l7Jz1AWejRl490sVsjXE8qLQP2g=;
        b=LsKr+f5ayNaQbo11NqGg0LxJ2R9CMEedl3+NK7qoRqHFO/Vjkja+VZEUmVQeBnLLpA
         1hg2pO0G4UZbFZUk3S574+jDI4/OMzJokikPH8rn0xKTFrbBS+PKKXigg9I/VVTRk8MX
         XjmCLLx7ydVTH/5IaAAqN/4saOgkW7WSFQo7Nh+Uh7yCyALPAgqeGWofWu/NRgtWqQmt
         4aot4Rwi4qrcIxanzEEFCReJShmwp64cG6Us5yqHFgk6sxvfs5UmRRxHBP376ho/Ziby
         lS2311Tu4OC2ZlAiUHqR6uz5wIBKvBrQXKzZ2kkTOBxCT7mcgnmHN9AnRuykZV0YY1A+
         +myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kqR8G66cSDgtgfi7l7Jz1AWejRl490sVsjXE8qLQP2g=;
        b=yb2ClUAvlqjIuvEm5fGUHD4CCcIjkv7pL2x37fuR/70f0B9INKDW58ZiAVxI6K97Ss
         1+OBTDvRDfeERYgjaPGWRcElCFI8TMAKqmjWN0JmlfJceaS010zcSm5sEs955XMEET9N
         pzPgMGCEh3IaEqu2uVp24ar0bf6iibGcvkKQcV7R2MOjiynBIxdNYCq23JzrTC5QCziE
         5EqSm9OUNTRqVDNwVRG0gnrE9lxSrcMt2bJkxpexcbKp3oD5/bVJmFaYDZur34572XbR
         PZ27dZ2T4S7UbcRV7cbIc1S41lEzjOEJ1442W7nGp8pjCgiug4QVmh3azdUFa97WY5qm
         7iFA==
X-Gm-Message-State: AOAM531dZoDeC0cEhvQ8SJMdKXCljeKRXefbuvUJUM+JmaFkMxu0df+p
	usWXGe3xi8luZpRvMot4RMpvT9NyJXo=
X-Google-Smtp-Source: ABdhPJyh4trevqqMDN2Q/qug7FthzWpg8nGnai59vkKnfAo5rspEUY6Z6aSvmvpWmwjxkT53xtB0Hw==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr5479938wrj.211.1631124104447;
        Wed, 08 Sep 2021 11:01:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/26] libhandy: update 1.2.3 -> 1.4.0
Date: Wed,  8 Sep 2021 20:01:22 +0200
Message-Id: <20210908180125.103473-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libhandy/{libhandy_1.2.3.bb => libhandy_1.4.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.2.3.bb => libhandy_1.4.0.bb} (92%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.2.3.bb b/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
similarity index 92%
rename from meta/recipes-gnome/libhandy/libhandy_1.2.3.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
index 3921099412..39ee2aab86 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.2.3.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
@@ -9,8 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-2"
-SRCREV = "e9ca4ac4b134bbd6ab91b6f916a915192fd3a465"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
+SRCREV = "f8626427acebfa08b2b4ee1166d51e416d3d7407"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.31.1

