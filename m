Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.1202.1604335826514520504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YffsfEF4;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w1so13906794edv.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FC8ujCrCqyXqcZ5AO2qB7B82fCx61yTv21U4cMzSWOM=;
        b=YffsfEF46bIRKcDiLaJ/YILsFuazJhaWOSLlM53hUMTBLfynvpuTzsQXL8Vj7L/XyL
         ZsH0+QU4YNA8orvXIUxlVt3y04EvFTLUMQ1zeso+svw4JOGhh6JlQUx0UZzMFyOGx5f9
         WBr11XCZsJmibN5q5jw4SGLHT5XleCp2MxavYQxyv7Fxjo6L5Ne4DSMRtPrmMJIktAQI
         Y5iSOJSGo3awgtcyuA9t//vAsEEvZhM9iGzf3m8wwWl5b1Yq07PxrKQW0uleSxY1MqbU
         vtszkBPq2PS8GYBMbQdSxMA3vkCwkGxZV3WnT/17ku1Z3V2CK0rdFhC8k6StsEMRpskl
         Ypew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FC8ujCrCqyXqcZ5AO2qB7B82fCx61yTv21U4cMzSWOM=;
        b=jIQ/X1NbCxMfXrfu4BiJ+2oYE5Xe6LjhfUgfe2xbxIAwSlJPkj9k/dyRNEVXRpI2a5
         giracHyU7N6YotwYPP2gcGxhL6lrOb+uONaISYRaNFXbAVLPFroaXwaiEEzkIayoWDAC
         cHxOGrSjfTcidP4rMcMiAQiWU1Kp5c8yM+HHzUOzB9g21lSsubM3UKV6OtrE5PADjwl6
         rMNLRXn8kUC9kb17E7K1aaWGPuaZX8Jpoma2To6HH/z5svPkEfzg5wY35PXRxkVl8seA
         uRIk9QNuL18w8DnTVzBOmuP2SAJ06EouFrrACSe9+AyhUDIpk6+ABZEuCpfg0JKrDGw4
         1WAA==
X-Gm-Message-State: AOAM5303IMEKBYEJSZK83EflEplIxtqBSdP6FoqN4ZVzw8XyAaFueo08
	S/mvsgBmxrIvhm0zXMWXcxNJ4FqCMliadg==
X-Google-Smtp-Source: ABdhPJx9BWLX0h5Kfi7XIz5cl0Yg/E+aU9lHL2YiTt+i1hzMYftMQXdy5lwEHlFefBqn5KXV+VSekg==
X-Received: by 2002:a50:ee97:: with SMTP id f23mr10679867edr.333.1604335824890;
        Mon, 02 Nov 2020 08:50:24 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:24 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 76/80] libevdev: upgrade 1.9.1 -> 1.10.0
Date: Mon,  2 Nov 2020 17:49:03 +0100
Message-Id: <20201102164907.27572-76-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libevdev/{libevdev_1.9.1.bb => libevdev_1.10.0.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.9.1.bb => libevdev_1.10.0.bb} (78%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.9.1.bb b/meta/recipes-support/libevdev/libevdev_1.10.0.bb
similarity index 78%
rename from meta/recipes-support/libevdev/libevdev_1.9.1.bb
rename to meta/recipes-support/libevdev/libevdev_1.10.0.bb
index 633e0af995..2620cbe9f7 100644
--- a/meta/recipes-support/libevdev/libevdev_1.9.1.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.10.0.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
            file://determinism.patch"
-SRC_URI[md5sum] = "58286a834ae14536caf9cab8633419cf"
-SRC_URI[sha256sum] = "f5603c48c5afd76b14df7a5124e0a94a102f8da0d45826192325069d1bbc7acb"
+SRC_URI[sha256sum] = "3522c26e2c148be0ad68ce26fbced408a4185dea90bfe8079dc82b8ace962d4a"
 
 inherit autotools pkgconfig
 
-- 
2.29.0

