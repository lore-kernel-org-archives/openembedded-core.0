Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3702.1795810329670996549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QNrZUAzs;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so49669545e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810328; x=1796415128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCoBxx+J63bZGFi9RKSTTKk2UmGLVVndqalk8S1GlVs=;
        b=QNrZUAzsnGXwFF4AQVh9r7F1IzIt3HG9WVxtATmPE0C42UoCFcMBcTvlsFBKN6yoa+
         S9e4QFCt3dAT660lZiwEB1lEFFML4//2MEhSbzQo4i6oof9fmwZXKH2FVr6m+LKY3S6n
         ZtxtUhUuAl6rhP9Qo0aKxXRInHZZ2k8DnyFQzNl5qR/RUUb8VhxfXcG//dWGMQ4bQbHX
         KDg2x4nnFkTIh0ZqEaTu1GUc19pbtmme66vouoIPFxkrKM2vB3Y2CGZ3KOUdc6eT138B
         g4Wv2FBhEVzrVamIjhxlD6ERQIIVMpYhXnmHo8Vp00pUbJEIuUndoYB7/YVooOzj0utX
         Zdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810328; x=1796415128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCoBxx+J63bZGFi9RKSTTKk2UmGLVVndqalk8S1GlVs=;
        b=cD2vp2A5izXQTr0uhF/bAxPaB24ryiXC3gHdCLmJnqlrtXXFfs0w1aGeZIY9kYmnYA
         p5xjvdan+aqpAlvdm/WJIaLw+sTDrQblBV1Yw5M3f7foncqgWavWiaGIAWtVut5GpOlI
         Mu25dursWGfydafVZvLlmRCucfSeJOYQntD4jzHRv/sP/BKpjm0KJnSoKdCADwfD1kR+
         dRccu23Sxe8D+s6bFK6zezI7e632hQRpd14eUVYnwYjVwY1RA1rPK8O2+RPc6CTzhvCC
         F9NPgS1rlZcXHF81AmUuFRSPXNl4AGqlVPc52Ep41lCDyjtToO9LVichTnLZEFEUu1ve
         a6kg==
X-Gm-Message-State: APuU4Z+6s+qR3InmuinpPbgeoRoDpAKiqRu6LKMtudgjG/GPqSv53qgM
	6BN58BbTvkQGuMYkqoWmHVKbPtpkZiVjv5oqV7wPFHIbx6SH5/7gRj+nwf+pQA==
X-Gm-Gg: AZFdTZfefvXr4p2YUMuftCxH928hNqRmVtl0sqS47dr7+1gxS5vEZqms/PV9OJJa4S5
	RWzL098wlUce23bickgncdXAsfqYZIPbPBBC9YXI7I0BcFsL/+p/rqPsGzcSeYrsNCL6gzyW8Hf
	X1zd4VFieEXjNCysVw8lwSXviK6lPzOCjZZ7bv719wl8SENAcpUW3p2BlJk2lKUDByE60lq5Eas
	hO1/ktKSIOlMgsPkYnm7CwHahSv4sJDnTwZ3/zxDCaq8Su2We/PYUrjNO2vg3a1oU+Bs9nEDzSc
	b42UPWR/Cq1ZI18KFN/4qb0/yA7/9H3GkVI8hHtmghratRi/r+RkCYV+g3j19f+vy9FF6Ug0p8Y
	DfbJ7Bt5qWmBgxss7vrKrZUIW/mt50Z1tIUXy8uB3dMqZ695Gd2DK+P82SynmEG3kVEdij7on1n
	bX6yVGV5pUD5yJEsFtdvc43HBfOdw8fk/cqxn48wEEI5KzmWQXr7noSwZxMz19902+PpcIvsbwq
	rNMcFv89913M45dbmZDAvcgZdjtnixNRXektd5VJJe8sAPC0w4sXAfaEZU0Uq4VFH87IRQLvxVz
	kCom7Fo/Zq7QhT5+xYR3Ttp/xTW+ukh07f9GqGkwK53DayhI9FNbseAySNTPDLe3pQ==
X-Received: by 2002:a05:600d:82e4:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb8882677cmr543338895e9.7.1795810327771;
        Fri, 27 Nov 2026 12:12:07 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm994530835e9.11.2026.11.27.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] packagegroup-core-x11-sato.bb: replace pulseaudio with pipewire
Date: Fri, 27 Nov 2026 21:11:57 +0100
Message-ID: <20261127201159.914833-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201159.914833-1-alex.kanavin@gmail.com>
References: <20261127201159.914833-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251451
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

Just the core package seems sufficient for the server to start
and run; this can be further fine-tuned later if needed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 3f735e072b2..228dcec7652 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -35,7 +35,7 @@ RDEPENDS:${PN}-base = "\
     shutdown-desktop \
     ${NETWORK_MANAGER} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'udev-extraconf', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio-server pulseaudio-client-conf-sato pulseaudio-misc', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pipewire', 'pipewire', '', d)} \
     "
 
 FILEMANAGER ?= "pcmanfm"
-- 
2.47.3

