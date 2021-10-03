Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C8AC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.2529.1633304545261228770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PsM+WGGd;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d26so27175800wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lg1uQH0C2T9+EvrShCck4YIo7TQS2tv4ZlVWg16RPC4=;
        b=PsM+WGGdj4ofRhZmrAoXlOIMZFwlpRS3VqqgNAH5hYEvAH5+SqxoTefYr3Tfme1bPM
         +kFXeiGg0ciWXST94AHQexY0wxUL7s0b/BOCZ0J5HsSPCswzWpnUO0sQspGtKp+qfK3N
         CMwlrUz5ooafE1em7Ouuzbv0xyMI9EvvrvG5rgZTKyHPH/QTfK+Awg13r6zvbR0f51Wm
         KdMxk3eoSB9eSjqtEPFuRxJxqBlHoqpf6lvA0qTR07Gjl+hPr6Oc1f0vkgenKEuOb57U
         XYE5cuYyxRPrdx08OHtL6LDgC5nH7sL7LU+7Z1hEEznhtLCGy62NNExPaaoNn5Bfynz4
         i4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lg1uQH0C2T9+EvrShCck4YIo7TQS2tv4ZlVWg16RPC4=;
        b=Z/5xrYA6Fn8YSTfJyYTT+ZN4jbp2lpsc845/911t7ya654+l0SJSqWpKIotN4wV9Vh
         b6TsK2rRTb99/qJZNYHVFMszNBBIbO6tPQMxAcDnqKpaIHz+X6DYeNlL7iIdP7CyZUEe
         GYto3vh1By0VoFtB/hRshHa4ylwx3ETJeU9cgaE1CDmtxIdSy8nlWtm6qhHk9vwUBG9t
         OlZrfhLDQwigzXBHDurT49GnIcKVwLvA6G6HVxOnoxSygC3vf24ebPKbtUmVTUx8k3T5
         kstccIdSsCkjFIfdWVZhC+wVBIGhYHZzuxYPZ6LKQST+Ylj0MrWY5XNz82UyAai2Wd+p
         Ck4w==
X-Gm-Message-State: AOAM530buAAtvxYs9yn2YpuJkiaVzXc2TQ78DPU+gDuNQGd5tKhNgWeB
	bsmP2TGoV/IQmHvweNXhRZK6hf/EkHblVg==
X-Google-Smtp-Source: 
 ABdhPJxJJy9KZOnvuVDN7eqE9HzIh+xTMQ//cjecaJ+ChfM+jc+h75QUAyep82z/zYT7eZ7B+gtjdQ==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr11068912wru.230.1633304543616;
        Sun, 03 Oct 2021 16:42:23 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:23 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 11/12] gst-devtools: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:05 +0100
Message-Id: <20211003234206.949967-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156575

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-devtools_1.18.4.bb => gst-devtools_1.18.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.4.bb => gst-devtools_1.18.5.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
index be554a6a14..1b46b89cb9 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "ffbd194c40912cb5e7fca2863648bf9dd8257b7af97d3a60c4fcd4efd8526ccf"
+SRC_URI[sha256sum] = "fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.33.0


