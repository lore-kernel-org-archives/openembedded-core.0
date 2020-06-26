Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.2888.1593155961221423303
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzFH6pN2;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id cy7so6125444edb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RhrL4E6fzQbdcTqLOlbKS0wQaDK2HydkkS93mr+rbLY=;
        b=PzFH6pN2dGqDQG/aqU3PNZrVhePWdKTc7+/ZFfH6zr3aVFGk73FUi2yDvsiwNHqhkc
         Y5uGrSvoH/728nRUPf944y/JTpDwCMrGBnka+jgCdpw3ouEtfXWzNF3tncNaPHhLjFgU
         v53XhJ1n4ivNo5ROCTWMqwjPU1tOWG3pmqL3XHRm7M/RrKTqj1ugJ2wUNmzCEVM5W5Fp
         JX2Pi6MSHgBrq6X3R4zMwViTqetvTEZN4fG70BoMwu3ZtLq3vcn+IMulheKE74XNMMCS
         O3xZg+YuDSheyH0n0kaZxl4kX4j1zARkpf0qu6lOmtjGP4CAGrLozHpNbOSI83H5xEYD
         4lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RhrL4E6fzQbdcTqLOlbKS0wQaDK2HydkkS93mr+rbLY=;
        b=WUSexDgiq5Jmov0YOJqzPpkz5ywG8RIW3dFIyTREVngFFdxXiBrj5AvBEKJRjUd1hC
         Kj+v/55Hl+NfIqYLBe7EIckXCGPFEJ5/5EsnaYiGbLmg4a4YGNuUd23HLIiEv0Nb0D5g
         7Iylc7ft4iYcllNz4ymQ17bRczBzSSazHBpwnfXkJQ31iZaYpurZX4GfDaODA6ucUm9j
         Q1oBecJgNRM8vFOeOcmPRr02a/n2zw2+CDdo1aqvKbN5o1IQq3JAkqOKiwZZWluTunPx
         mRqIScdCRoeuMoMW59YPEDTU0ri1ro3xusCi9FaNOxHQ8z4AVSYQbvdOBhDQGBZVVzXT
         BNuA==
X-Gm-Message-State: AOAM532xz1BBao1gwml8PE5XtZR19dH/qa6PhJO7ZgTxTxuVVWF5gy+0
	TUp+UMWDHMjWk6OnC/O41WiKtzqbsD8=
X-Google-Smtp-Source: ABdhPJzL3hTl8oj/8kvxGbZKS2fGk8B1+ubpwkqBDhL913+QyyAirFTYunY945SgVeHus4F0p/K9uQ==
X-Received: by 2002:a05:6402:1244:: with SMTP id l4mr2021652edw.71.1593155959509;
        Fri, 26 Jun 2020 00:19:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/30] alsa-topology-conf: upgrade 1.2.2 -> 1.2.3
Date: Fri, 26 Jun 2020 09:18:32 +0200
Message-Id: <20200626071844.29134-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{alsa-topology-conf_1.2.2.bb => alsa-topology-conf_1.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-topology-conf_1.2.2.bb => alsa-topology-conf_1.2.3.bb} (84%)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
similarity index 84%
rename from meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
index 2901794cb9..fd949be8a0 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b472d6b567c78173bd69543d9cffc9e379c80eb763c3afc8d5b24d5610d19425"
+SRC_URI[sha256sum] = "833f99b2cbda34e0cfef867ef1d2e6a74fe276bb7fc525a573be32077f629dff"
 
 inherit allarch
 
-- 
2.27.0

