Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.9834.1620227985440016892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JyH1A6fD;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id n2so3453821ejy.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KcXSmyMX4hdLC2znOS95pf434bxJoxIsT6nQcsA2dmU=;
        b=JyH1A6fDLPWvTaPf5vhwW6NIxfW13xMVdd2ypvpUWgUnGzqfxESIJRTLBP2EWG7j4u
         a60xYgjIHUhdS5BDigJMAF/kV1vp2Nt01EJdwrKvCvDJ/npdRVimcs1wKZjuPfhGI7OU
         de+ZjpP7eGNuF2iZaVeIj6aeIPhYruZtN7H52tZlKvzjOuSwSDijicZgq6qZeYyUGMe+
         JiZ7fkp5GxW/07KBtyUSzjavmyzGSWytv7PtdtRW2owcHKQUC2V/iaqCiajRIUWajhan
         GpXMhYNjZgLyNprScN8gxhOAJw+Xgn2X9kLd47SHqn/QKJ345H23Bz1ok/8OQK1BT5zG
         /yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KcXSmyMX4hdLC2znOS95pf434bxJoxIsT6nQcsA2dmU=;
        b=LBFCn6KRxH5g/7LWKdPj+CANDyfgSvPaDR1f3CJ4OkLUlUEYl7pqcfTX4i48KWXyim
         DylNJE0YjREk38g10rYmglrMp5jB3D1Kmmwi04pCjVbUPe7Hi5XfToVkKAN9e9XhfOjP
         WnHY5TY+bFPM40b2WB1bkP6sFX3t3k1Z3Ob2lHYPcqC5qJha7vrL6ri5OuVr5U6SKBEI
         qigOlQoeROv6Ga1Q1JThpvJmoC6aLm6aEMUyAatIuHp7VM7fn9GRw7arhbM2xPjNI/OJ
         eVU7LRwIr0cW83s5f/yeBti10Vzi7Cej4jaRWG2zJgOHPubNN5EtXSdYqVOapOSNnQmq
         LMLQ==
X-Gm-Message-State: AOAM533Y8AMUC8F8fSuRiCqqOOLiCmull+NZ1dTbVe4IBMbGUO6ve0cB
	8qbiGtn8Hz8DM6A9830xWqlaqSAWZ8hDeQ==
X-Google-Smtp-Source: ABdhPJzVZiDZVDm/JmUwwV0TqocECwJIBfamSsgVDxwAzS3YR6jjkTVMIIJ56HHcXZehIAOeQv7o2Q==
X-Received: by 2002:a17:906:a155:: with SMTP id bu21mr28244313ejb.400.1620227964095;
        Wed, 05 May 2021 08:19:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/61] gtk+3: upgrade 3.24.25 -> 3.24.28
Date: Wed,  5 May 2021 17:18:24 +0200
Message-Id: <20210505151850.660512-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.25.bb => gtk+3_3.24.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.25.bb => gtk+3_3.24.28.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.28.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.28.bb
index 8c5426f22b..619c733a07 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.28.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "87e26b111d3b8a85ff218980a56f3e814257b8dd11e5c4d9a2803b423b08297c"
+SRC_URI[sha256sum] = "b04e09763367f1ce932cd2ee3a359d4de150e1c38e7bef7d29aa72557a6b47c6"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.31.1

