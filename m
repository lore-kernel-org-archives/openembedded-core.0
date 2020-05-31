Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.17612.1590940437490824355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ABBfMBxj;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id g9so5394179edw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAFY7vnDmo8y6VutHqKYjPYIMDGsn3Ut7J+xP5v8+WQ=;
        b=ABBfMBxjKtIjf0grHEJi1UO3dYI/gPPRosdZtItI+uNmU+IxjuU/3xY0qKDfjDrNtJ
         8XvXteP4IjTxqAi+mwX9AZ26WMrWDzKJT2amRXTiC1pwvYiaORfyJYeXAQNG2e5XN/71
         zOx8NBAe1e2yxlrpt6QBfSgqx9O5o6b/tFNxyRdXQYcEOy6GduDUPXKpdagXoss01WUc
         99QcQd+E9lZCf7k6r3+nO3WvSxtD/Y4nVwyKCjpOqCjDcvE7l/M/HK8L9qwDFXE5Nkfr
         LD6wRKQYygriHPmMenrzYsAKkZOPVierAFCOAvwDArxneE8Bwh6qmETBGEKJzztM2KMl
         KwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAFY7vnDmo8y6VutHqKYjPYIMDGsn3Ut7J+xP5v8+WQ=;
        b=T48/Kg+Nn3abDDJCsAGaSRBBmwVDRvdIaWcdmLg6qR8dqMh0gcFp3Kx5sT0AWboCFv
         +UY++mHlSNNEMOc6H8P2b0eXU89meU5JA40xJo2UZDFeyxjah99i+5J9CfpOgBM/oGFE
         ibX+MH5eIrmu5dRce+aLhrsITRDlxwA8xWmyX1j+SzdvugupqWx4x580jZWBmotco3yU
         FCXm6zgkXYqqKYM1znX4/YGKKhI/S4BDyUVhjJSkMkej/V5NzDLXaxI9D0A7JkBof+Sa
         L4+0+WE4stsPhRjIC3gkwKaNCKbJsbLZ7nKjq1ip5lMNyXiv5TRoSlxRlKSvyfUDcm7V
         YOdw==
X-Gm-Message-State: AOAM5334+CZDFk8M0dchdiZW3UE+UTDkkKJo9wNDxhQ8/lqkb/fGBfWP
	Vo4WQtd2hYLy1I3PVNqlln3yFZVz
X-Google-Smtp-Source: ABdhPJyfj1OJf7oAkoLTPrdH/3TMWxdr6F2HeaZ6uSfmRBbiXbrJjJWwaPiv2s0WU5xgCh/KnHKmlw==
X-Received: by 2002:a05:6402:2c4:: with SMTP id b4mr18093491edx.331.1590940435894;
        Sun, 31 May 2020 08:53:55 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:55 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/70] waffle: upgrade 1.6.0 -> 1.6.1
Date: Sun, 31 May 2020 17:52:17 +0200
Message-Id: <20200531155254.10283-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../waffle/{waffle_1.6.0.bb => waffle_1.6.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.6.0.bb => waffle_1.6.1.bb} (92%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
similarity index 92%
rename from meta/recipes-graphics/waffle/waffle_1.6.0.bb
rename to meta/recipes-graphics/waffle/waffle_1.6.1.bb
index a620295978..3f3c0e9028 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
 SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "61bfc1a478e840825f33ddb4057115e7"
-SRC_URI[sha256sum] = "d9c899f710c50cfdd00f5f4cdfeaef0687d8497362239bdde93bed6c909c81d7"
+SRC_URI[md5sum] = "c91529e579483f44fb330052872b9c73"
+SRC_URI[sha256sum] = "31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b655080"
 
 UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
-- 
2.26.2

