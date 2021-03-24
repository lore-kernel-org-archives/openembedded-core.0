Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.249.1616605653157682241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P7c09QaB;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id o16so25223471wrn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+F1KLB20DnIulIm6jdHSFlicYmBYvqpdmTc/+JmepM=;
        b=P7c09QaBbEqjq+FKubBtU+u95TBMiI1yIKAeHIHk6FmoUoZSwdZsL8rm0qSz4OQ5gZ
         PXfimkaQ3cZT6jP+qysMFGPW6l6c1V+G7scISejBTh1A9/fJINHDSoI0+U6sty2Du+n7
         xkZlZwLk3I6/XrcYikAPIL6RcZow2Z7kgRvOSCrtish17vSBMMdX27Gme4+/mdzhNIYo
         VaRAZ2KVxk08zfENO18urmSaXLf2sEyPA/sQyjWwNkkQPWN0rba/KJQG20ZamzR//kGK
         GPE+cBdubLR1aGC3Jjf9gIXy8o3QfbB3U3dJODRQyfnOXSUKEldJs0LjSZDYmVXOffQ4
         X/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+F1KLB20DnIulIm6jdHSFlicYmBYvqpdmTc/+JmepM=;
        b=kFTbMuUTeL8D6B7+GMjIyLmSo1hiGLQqL+vhmWL633kFWlUK+JBEvowU8nm7M1BBlX
         KCm3Bc0PiWGw6638atQRFp9+yJvoYPccgD55+gNUoB00b+OJ7C6VkKjmPlc42GscbvFq
         yzYq+Y/QSQOfXbR9iC84lZ/ECDOjjRImn1BqU3KYEWPGsDatgtGpKfMpJeo4WbvAmKGM
         koKQRJg3TOhc7p6JRifOK0fGBhOrlbxkm/WJRR28muE9CJYh+3eMwSh9payeWomIzrKJ
         V6Hz5peCUOkcclTNqjB7Yp7NAR3igWEuwAXNA4X/O50VuakqOW5/G4MgmGpZsSAVixmg
         /9ZQ==
X-Gm-Message-State: AOAM530PVltkeTl/WT7DIvuL16NnHHvyAEgiEN1FP9jq5r1/pXJZNKUM
	lzfb6SQItMSTUGsamzWPN4TuHHzh3On3PQ==
X-Google-Smtp-Source: ABdhPJygpTw7xfuFD/vYXbhViftPbYOINBBSkXppSQFVfzAQIYcnh9Yx1DEXONIXpH8+DOxd7jP7/g==
X-Received: by 2002:adf:9043:: with SMTP id h61mr4545514wrh.216.1616605646932;
        Wed, 24 Mar 2021 10:07:26 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id u20sm4173723wru.6.2021.03.24.10.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:07:26 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: scott.branden@broadcom.com
Subject: [PATCH] util-linux-uuid: include /usr/lib/debug in FILES_util-linux-libuuid-dbg
Date: Wed, 24 Mar 2021 17:07:22 +0000
Message-Id: <20210324170722.566059-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Apparently some users have /usr/lib/debug instead of /usr/lib/.debug
so add it to the FILES matching.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
index 65e4d23b7e..1ff37a4dcb 100644
--- a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
@@ -11,7 +11,7 @@ PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-staticd
 FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
 FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
 FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.a"
-FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
+FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug ${libdir}/debug"
 
 do_install_append() {
 	rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
-- 
2.29.2

