Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.25935.1599944649424338154
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 14:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L1ZCPNXv;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id v14so2033190pjd.4
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 14:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/G0PpIlmfpVO/1o+vzPuHdsXaDaeyf1F7zZeUwwH+k=;
        b=L1ZCPNXvkMKOyCMi9I99Qfu0+J1ParkJ8Ij13hhQQpNzd49MC14UQpdze94MCT5yNi
         OwS3Cum3MCtRs0bXxxpgizrrfgogYL1HugsNTqcE1uIbgifDR+Rv7EFuW7tf/vUMClcD
         /SoUWOiqPlPwFrQsVLcBy/zmTbnzMU9Pzx7oBX4oEvqOADfZFF4gwrN0T4UrNpB5ri62
         FIbVJhFeq/HyJ1YH3UCghc5VSS3Bzaz2XBDMpMMOn67c8auZuRADbiuTMa9J0TY5YFhN
         EM9LJrgvSg+OV0yCBYLLaxf41ZhSOgqHkSepVobiMbjuBot10lgEoP6KUUnEiIXeAYVc
         0U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/G0PpIlmfpVO/1o+vzPuHdsXaDaeyf1F7zZeUwwH+k=;
        b=mfsRxg/HDRZnIg0d6skkH88xs1OvWHSKjeic26xEhry+//8lrZaA3q68TTU8Hv94V0
         o9pVrVRXZnYZWfKCiWzgSzM6cy8T18ERvMXkoWa1DC6XXVlQliwN9YyI9CC/beku8iL1
         ZaDZ/vgi+Q4/h3KgVb+ybVk7rd/6LXwhLS/3gqGCDWYdHIqNgkeQLYAWaY77cr9I25eY
         ug7QBvS9FLtfYjH7YATbc6vDQrZgRjl7BB9GSWtJaFVy7B43TUnPEtQPX3Jx9fpmKoyg
         f0YQn9AngPW6nHmlAxg4/9kkeyLTuoNzIAnGQ3+9x0VDpeZSoBaFraydAKjePXzKLKry
         y1RA==
X-Gm-Message-State: AOAM532BrQx4Wm75yxcPRvSUt5sg/kzrfbgnsZ4ks1RE5Dp+a8H2rfLt
	2ZPXGIGNe7Iz/uft8vuifd/WFIfi/ABWeg==
X-Google-Smtp-Source: ABdhPJwvcR4jAs1bzsJeHNEvksPrrrXr91CfLneCsQBnWoo9DsEiMIPt3jx16oN1WvH6KVLt3d3Eow==
X-Received: by 2002:a17:902:c3d2:b029:d1:9bc8:15f8 with SMTP id j18-20020a170902c3d2b02900d19bc815f8mr7700044plj.29.1599944648676;
        Sat, 12 Sep 2020 14:04:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id 64sm6271787pfz.204.2020.09.12.14.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 14:04:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] weston-init: Do not use fbdev backend
Date: Sat, 12 Sep 2020 14:04:03 -0700
Message-Id: <20200912210406.3328090-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This works ok with latest weston/kernel to use drm backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini

diff --git a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
deleted file mode 100644
index 17ebd7fdab..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
+++ /dev/null
@@ -1,2 +0,0 @@
-[core]
-backend=fbdev-backend.so
-- 
2.28.0

