Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.1159.1604335785713580542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpKAOe8V;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id gn41so2500054ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uyYjawMifDvvvFtRHaFepzHm/J7kzaILWEAEEhoiGgI=;
        b=RpKAOe8VlDYz/BU+5+tpfGWeJW27/M+2TJB2IwZq22Y9bAGwgTeZ+OPFbTrjVh1u2N
         gl6Ls/eoFW9k9ece2dpYo6lbhXki0kOVN2xRyGmt5rREkDjbDvsWx7SDFQCfqPEeJo5Z
         wX4/P+BUw8yiW5o5vmX8YW7dif5syPpnUE9v4vlxflcSU6LMa/EGwQTNqbm3ZTfz2IGA
         K4Kp65NWV9Ejp/HTU9Bs9rVkTMFcyyuTLem0EgweaseOzwvc0/S6bC0x82+N6t2PiaJd
         qjV12O25emMVzMOmEVjws1Uq6vEqANi0Ckox6cY7lSFTK8fRCP8aI/QLG/OuZGyAZO3F
         Eiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uyYjawMifDvvvFtRHaFepzHm/J7kzaILWEAEEhoiGgI=;
        b=rdQNseZr7YteNc+EY0e9+9t2ElJySCtMipaAB+cI2HczVXicDA0ESZFKMU9OiyJXbe
         TcV7wWKEdlJlo9/zifdATUvkoJ3WwcZtJaK5Znb6pRxp2KFwTw+rKwKXxgCMGSPd+lGJ
         PoyU2GSMT8GSV3CmfCdY46kSQZasLASTNJ/eQItPI1j/0c+DwobnxQyrxqVmf0xLBVxn
         Z/YnhO1K289w0D4UKUtK6Bj5zhKt2V9WbACvKTaHjsX0cAbu5A2oeMbryJBt03QTN5vm
         IhDGUNcWBKtkge8PKcsPemJQ80bsxHDjJJEJqCatpYHc9sUIglOuOZL85QFFUzRgmz0G
         ajGQ==
X-Gm-Message-State: AOAM530vACAoWT9UTQn+en8+GgZnAdFVnbZXEd1CyCOXfJ2+uhqELEqf
	c+j2EgkQTukEPPYO597C/wjT5ZwHrkwmxw==
X-Google-Smtp-Source: ABdhPJzr4O7kjjWHW6G0framBb7P3ZrTG5j1Y6dI6OJR0v4Kd1K46yqQbpBTqjieLr6vwXnyfspcng==
X-Received: by 2002:a17:906:2850:: with SMTP id s16mr16722678ejc.276.1604335784015;
        Mon, 02 Nov 2020 08:49:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/80] less: upgrade 562 -> 563
Date: Mon,  2 Nov 2020 17:48:17 +0100
Message-Id: <20201102164907.27572-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/less/{less_562.bb => less_563.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_562.bb => less_563.bb} (89%)

diff --git a/meta/recipes-extended/less/less_562.bb b/meta/recipes-extended/less/less_563.bb
similarity index 89%
rename from meta/recipes-extended/less/less_562.bb
rename to meta/recipes-extended/less/less_563.bb
index c900574674..123522b5dc 100644
--- a/meta/recipes-extended/less/less_562.bb
+++ b/meta/recipes-extended/less/less_563.bb
@@ -28,8 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "0371a9678cb42f37b9bf9b86e8aa7903"
-SRC_URI[sha256sum] = "eab470c7c928132441541aa49b1352c0fc699c30f762dfaeb3bf88e6f0fd701b"
+SRC_URI[sha256sum] = "ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.29.0

