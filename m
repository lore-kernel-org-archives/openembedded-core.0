Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.5408.1632217119794684046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 02:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DizgSnbU;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t7so3971237wrw.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBTWwOeqc5hrALTI/YqzO2x4yGWKwfAYogKUbrUe7ds=;
        b=DizgSnbU/zjGRYp+oL0ev/xaHdjxoB9sMPy0DWYvuX8dPRGOIK8u7Iv+hLrvGQW5iS
         pUmNDE/p6cJQUXCuBsh88BfQns9B/iFLvF6c3AIYx7EJ2D+KXBJDrMFIJh+saXqogSvv
         vLNVAAclW3QvThbB36esQLBmsQNGxrZShNNO6AknK7Z6qvHyJ0EY+s8ddsUEcO5w65IF
         3g4Exz4K4MOoYuxq9sKbuOHxMScyDgthvb03UOQP0UhNaAl8PN+JWCqMMe0xgPOcpino
         deeWgfuF1Xymb5GlXTTqiWTzeX13D2XU8K5PlPXt2YG6Izx/KDC82YelmPlGZYd/H2pr
         frHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBTWwOeqc5hrALTI/YqzO2x4yGWKwfAYogKUbrUe7ds=;
        b=llBC70vjNLDHl/1zIUa5KTYwO33hbnfx6e/nrHZWGrJgn8dhupW6GJ2z+2nv4yO9d9
         3rCKoVNLryDSc5s4iCGwgjdDjAuO+FcnGWQazFblHEEuCI0gL+FUYyrCvP+Xpxy98P5T
         l32Plgqb1WFFkb1OUOqjZ0BADPCQiCTuEaTv2yWj1tGzZJW90krH1rCjG5JhaaZm/A9t
         sVyX98bZxoyr/Bc/f5RMrnPqiyGGr79C+y0CWrnQS0adEbzmEU3Bj2orRPSnnzX1VVHC
         jIxWSoj/VmsQf0OfeIWKyWzNjxehxSvL/K6o2/NB21PaUl5EZjEx6OMEXkCsppd7FTz9
         4DxQ==
X-Gm-Message-State: AOAM532ypwq5OGzbya7rEpk9jJklfRL8RC+pcQk/9NfKWn3HGpWqBk5i
	217r4C0xoocqIBq+31lP+5uTeZSUBzCylw==
X-Google-Smtp-Source: ABdhPJyFEPI4gyLjPMclC9RyshBclMLmrTanJdejlXaUvgevZY9TEwv35qVjTG8B6ztcy6frJ1Ca3A==
X-Received: by 2002:a05:600c:21d9:: with SMTP id x25mr3429592wmj.7.1632217117533;
        Tue, 21 Sep 2021 02:38:37 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from localhost.localdomain ([2a02:8109:b5bf:e890:1429:5546:9995:f7e5])
        by smtp.gmail.com with ESMTPSA id j7sm23179825wrr.27.2021.09.21.02.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 02:38:37 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH 1/2] iproute2: update to 5.14.0
Date: Tue, 21 Sep 2021 11:38:00 +0200
Message-Id: <20210921093801.2336-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
index 44575bd50c..27fb5c8866 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
+SRC_URI[sha256sum] = "210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.33.0.windows.2

