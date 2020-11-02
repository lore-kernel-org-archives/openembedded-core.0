Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.1173.1604335770663375851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uzIOKSVN;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id a71so9658633edf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eo9A9Ky03zXJFA4QAEMLzs4+QBSsJynxOVAwwOjXmvE=;
        b=uzIOKSVNOhQ4IUYuEfLIPej5O823k8wjG20f+i6TqWoQjmAf9eDH52Lwm3PL47fxSy
         tHRW6FxNoxwUmU7eNO9XtgFQs9HXnKgdSsaSxcu63umDWYkehiBrcTzXjdV+bysUzu7P
         +gAqZ6ndvoSL6toz+yyfXqFNJ7ryJ/+XEtMCRuAW2kfSojU7sr7prbsfyVKALalMs6EK
         dacrnnXQzmpQn7Y3qrmKDg3ZsSkVGOTb2edyhqW3k4VQAjKzdmkoJRclSrEiJW1XgGKI
         NgAJf9ZpdOGBJRgW9ga4Wn9zsrXEJszIxLNZWrTk23Ys2WN95zjLuw9gEcs0mGSQfNZv
         XRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eo9A9Ky03zXJFA4QAEMLzs4+QBSsJynxOVAwwOjXmvE=;
        b=UxB+vVBuli/GVs7DfquhtGyC1a0B8dbupb1ailHAGRWGZemMIu+9gXl0YjI3pkvrjl
         rDzGiO2oUSrI6gwBmXXbLUrOiQI4srwbzUsD6UU363AyIwAMdH/FMPCFsXfdXKy5mKKa
         YWcNwuXt2WxROFRPuOYYPDn9bZFro35Fxb+balISHBXxiplNdsBpF/axoNutSE/6fjgq
         /bGEUFanLKcfIrZT1gJd+wTLnVZ40loVJiRPxfjqAOs/dqt9VhHIAXbdtVwtAi7BuhJh
         evGmkElIdlQReqlz/ApWlR+Uk7QC06G8iMds2SP3VA8W2cZLpQjc9t8tf2UCFaNJSVi3
         FSow==
X-Gm-Message-State: AOAM531rutQaDRSZ5VmaPoqx2DWuDv2SZPAR7QjXB/EQiDZI2g6U7Q8R
	mr5cMvffTi0xxXaIBfSSxjfI49WVom2TwA==
X-Google-Smtp-Source: ABdhPJzyq/9McSyDdpDh82EHJ3zEFPvowhOHf2tXoVD1eWqww3KjVCHh7Xd0A9iBIC9Y2unR3GNnXQ==
X-Received: by 2002:aa7:d9c2:: with SMTP id v2mr1031096eds.95.1604335769029;
        Mon, 02 Nov 2020 08:49:29 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:28 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/80] at-spi2-core: upgrade 2.36.1 -> 2.38.0
Date: Mon,  2 Nov 2020 17:48:00 +0100
Message-Id: <20201102164907.27572-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../atk/{at-spi2-core_2.36.1.bb => at-spi2-core_2.38.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.36.1.bb => at-spi2-core_2.38.0.bb} (89%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.36.1.bb b/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
similarity index 89%
rename from meta/recipes-support/atk/at-spi2-core_2.36.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.38.0.bb
index 218af6afa7..88add83dd1 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.36.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
@@ -7,8 +7,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d01e5326b4eb15ac3c27eed73ecf26f1"
-SRC_URI[sha256sum] = "97417b909dbbf000e7b21062a13b2f1fd52a336f5a53925bb26d27b65ace6c54"
+SRC_URI[sha256sum] = "84e36c3fe66862133f5fe229772b76aa2526e10de5014a3778f2fa46ce550da5"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.29.0

