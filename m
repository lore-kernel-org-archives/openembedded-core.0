Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.1038.1603478643663612859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jT//zNWn;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id i1so3248812wro.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=msQ6ZgvmXiJnLL3F5klShcvu711tH+vtOzhh5MKTmV8=;
        b=jT//zNWnr91SWpdXpw7RbGjgf/P/rRbWw1kULxw0BnnbxLnDBvjA81W6QmKWITC9gy
         XVF7f/Zgbnx3uqkBGyXiGV0mM5yxXPngsi4X0UvfYFDGbbXN2Pl+WKPIE1TauDPRpmlw
         +lBLYw8SFV6Mn6XgT+hqOrvrinl6Vnbi227fBQBCZ+hmxYahO3wHJUo8pvujwgQyNGXg
         Jj2lEbzY0zrFM9Z5ABvAkxCMqvG6Lm73pq8sMNPnfDOTXA7P99y0+UydTzAVZ+jfmOv0
         /My0wGPrAiH76pPxzZHhack4fgni76BacoHPIP8AWGKaupudps0NTmcbKprDhSmFgGcW
         cHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=msQ6ZgvmXiJnLL3F5klShcvu711tH+vtOzhh5MKTmV8=;
        b=o/wwPxUWgKpIZTcLEF6ji4MW/yWa8vEGTcXGAJb4WBfqTAcmzsB7NyIU32VWZ0AKzC
         tEhwb+HJh6TZy+dmwDJlNP5wanm2RiqgY+fxE3Mq5/yeGYznNG6guMDiGUE1dMySUZnY
         QAdAlGNG3eh8XJumABMyE7/nWjrN1WPOCsp2s62moCvoGUKfJbZFEJbqqhzPGSh2TExh
         hP1GB62WdIU3UEc1uHlSVvgUZg6K/eq+rpCefymikDPSZ7L0S1y31w+kUEyyqZnbKqgh
         0F3mZCT5n6axydb7siqmPiJhUrY0HgyaAcsPtn4QrAUQtQDbRjg1DKT8Kahpd9KU3VWL
         m68Q==
X-Gm-Message-State: AOAM533hNZR4qiYgcdYNCBRPKg7HPVw922Cx7JfJRnytSo2u385nXpQN
	5wRz8AAtM6d+LMLfh+4FK9MGWJsPbkvyYQ==
X-Google-Smtp-Source: ABdhPJylIaO7p3G0nMAS1BFEkxb+soEKjgBTUbCIjdnj+uQqEKZbL6TPeL4NDfwJ+MWdyouLBK/RcA==
X-Received: by 2002:a05:6000:12c2:: with SMTP id l2mr4000369wrx.76.1603478642061;
        Fri, 23 Oct 2020 11:44:02 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:44:00 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 17/21] gstreamer1.0-omx: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:28 +0100
Message-Id: <20201023184132.3208737-18-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index f1bdbd235d..c4855034e0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
+SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.29.0

