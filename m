Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29798.1793868219644195375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YWuLl1Nm;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16978445e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868218; x=1794473018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sPBYwinaf9QruSbSjTe8Q3xRtcofeGCXtj6vFQZEjMg=;
        b=YWuLl1NmpiuktUx43OHIGHwI8Fv2k4M8j256nvYEq5fgrjrSs9zc5Zw9z5/Pklf9hO
         WmQAKcNa9G0wTsNwcH/XpNW/R3IpJTckDsF5nUjGLfLv/ctiJTFCW4llREbWeqFX/Nvv
         EyUimnmNdOgUAlvA+KanUKK6vqlg2Gr2/SfF5ZyvITwRUuQ/LK+LzP+Xl8nZuBtX8bkT
         wWtsWtgZ364TBYJSOHjSv5i02gKIaeGjm90t1Atbxd+7ii9sYa/N49OVhoZ9sFfnASWd
         LgS1dmWRBg/Nlbya671YyCK3gD2E9ELEXlmlPDD1ZCdI/z5ZwshKKATJ0EqprBgNlgNz
         +Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868218; x=1794473018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sPBYwinaf9QruSbSjTe8Q3xRtcofeGCXtj6vFQZEjMg=;
        b=cbOPxpu/P8ggQEUxlTJBAdJWMiAqeQqHio5qknk22Iay/DHlXGk35EQJdAje2UX9L9
         tu8R3qoIKcIpReTcYaVTskF3JlI1Jlvp6IwdJVwTcvOG/1RAu0IKWl9d7GwedtZws6t5
         ZlB8kgxT2EJfFbSLBGVPcDo/3/i/UPjFNQU5382mQDO8VGf8PWl8vXHw7im+X+joL3e/
         ONzNzssC2hJ6Gf3QJakW6nDZk+BKaRGZQvGCehrx+zm4BvPYEJsJATUZjt9wycmP5Jwd
         yQ9WxRj5l8rjH+xgDjwrHa9weHRCh0gRNNsufGJGFtVgmDzSH/Duz3g+p6HcvEVuBaFQ
         8Jow==
X-Gm-Message-State: APuU4Z/S9tphSyGwRKbS2DYC8qdKmO+FUAiSEAGz8KBYXR55rL6pxVDD
	YQcA1esWbb4pgXfOjrj2QUe4I1BlqR2HEdoin8Qb8g3mkfO6BFv+nOQR24MRm1qeM/I+/b9bX6q
	PgYlt2t8=
X-Gm-Gg: AYBFou1tVMk7uFhZjddS/FBSWrq0d4urEve59ZIJma2v+rgKt+3QQP+rsutBoYuIuBf
	dQf+CsipVP84l3w2jIHdjS8X1WaVEWbYrvRBt+sCxVACMJXDATwtxF4cQxHMcf3M4HZ0WudKXXX
	NAzkLawg1ciHfL1yFNhyM9gH2EV24Zag8IX38GklVhB72CX9rutN4WGUtjcbm1G01Kru7s3ZOeq
	glBaX8Hug9QzUPUC8rOp4KvhmeRSWrxkfqP+3lQ7x4wAPHQDBxrk288IkwrU3Gj1x2FPNyrWLjR
	WhxEGOfafwrpDyudViGh2P4XNclDRe3DglzST20rfk4j9Kw0VrAllq+KNPDCrNgzed2oC3YUABl
	8EHwdhxBk6iDpEjouFsVA2dXTOZ/L2r9s5O3GJzRex5+00p63yV6B/I0UFdmisa/Kbaq+PByIe+
	0sNCj0LMhAGL3DpilqYOGDX/P1BHXC8oFHKM9pR0fviA0HpxF+fQuvb674iwSyiiZGIjtrsoCxf
	8RUPRa10yZAFxa4BZUEfiN6yRjM3nXAtlGHzecYsWYSD6i1peUE+b4dFW5E7VFfRYyD1KVcFllt
	hJNN5aFVMZzpVi3XfJCeQkHlQ1RgnawEln4FUojso+oNymaF9jXhA43EfAQLFdIF8XoNRGXTRMX
	27421Rp6x0FJ/BspNp0py6lRBLhTd
X-Received: by 2002:a05:600c:1d16:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4ac151a8fd2mr411556295e9.2.1793868217721;
        Thu, 05 Nov 2026 00:43:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 01/60] gstreamer1.0-plugins-bad: use gtk+3 dependency name
Date: Thu,  5 Nov 2026 09:42:20 +0100
Message-ID: <06add9576c5f0ca8d303819e5e14e02abd83b54b.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249460
Content-Type: text/plain; charset="utf-8"

From: Shantanu Majumdar <shanmaju@qti.qualcomm.com>

Replace the PACKAGECONFIG gtk3 dependency from gtk3+ to
gtk+3 to match the recipe name used in OE-Core.

Signed-off-by: Shantanu Majumdar <shanmaju@qti.qualcomm.com>
Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 7993331246ac675eef1712ea7fba770518cef5b1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
index 7964d5b6deb..de143b26a04 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fdkaac]          = "-Dfdkaac=enabled,-Dfdkaac=disabled,fdk-aac"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
-PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk3+"
+PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
 PACKAGECONFIG[nettle]          = "-Dhls-crypto=nettle,,nettle"
