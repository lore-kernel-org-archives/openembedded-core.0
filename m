Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.27402.1603635841890378534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JnY8Fwun;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id j7so9558552wrt.9
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LrmR8jxu4p+7cwIIxRafqla6CUUpejuhEQAaRcqeJCk=;
        b=JnY8FwunORcrFj2/xdfrW744fDi4IVSaWAS+P5SziAD78n3quDh2c1p0ejXUlU1KMg
         mDwEQgt5IxF5AT0t8gxIHk5smhmd/ASjPtxXWAi2+fas4nBU7DS1Dg/o6fB08wclKxGD
         gKHIOl0qzz4Fh4at7h0TLXZJX9pjUGjnLHtDOZ6iamtjFiz+OmFvjPz5B0N+xPaDU/L3
         HkLt8N0gUBlQzw0pdLM1hP0PxC8hXSmUxp8EJ1ErHQveBXETF4upk0UNluqvqQW/odGJ
         LVKnFdXbFHMlUNdXaQ9XD84S2TAiacbhQhg3Dx/NtXKHQhHqoWchhfJ8zNXOo//YQwp8
         ZhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LrmR8jxu4p+7cwIIxRafqla6CUUpejuhEQAaRcqeJCk=;
        b=Lt7Rh4Pu/qN2vA/vqltMf7odrVAnleCpi/nsEFIUCOSn8KsAQWfe8/wWJczaU7LVvJ
         bMCTDNwl6KBxI9h4/VwiITngZynKVpga3f/A0mb3WI+gvb0FyVfrz5Zo5oEUIbR/FP24
         E/SlI0dzyTv9IpLODm3LC4Lye3PiN0VbCHoRKft/Lau4hcladRVvDvw4oZOp1W3MzkPg
         XT4++tX0h7e7La4cDdUoeh4AXJVAngzeh+IGwKmhjD1GZnxCT48QE2/w3VqnM9sNH65m
         3nncvXhaxSqrV/iVwSCSMolC2qV3PzYXMwnTna3gQIyVfWc91G7wW+EndVMWzhnvpQmP
         GR/w==
X-Gm-Message-State: AOAM532SItjjUW6IZQFxYDxVAtVCGwWoUeVSLRyLAvMe8JZYCY471599
	MlkHvgHY0uOhSh71QhvXfu0a01JVUuTrlA==
X-Google-Smtp-Source: ABdhPJyavEstOkN7DaLTR3FjoyI5ly0aTV81Qwq7BZRkQyYEde7nmWUInu+I9ygBRP3k+YTqqCT6ZQ==
X-Received: by 2002:adf:ec0e:: with SMTP id x14mr14105821wrn.204.1603635840275;
        Sun, 25 Oct 2020 07:24:00 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:23:59 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 06/12] gstreamer1.0-plugins-ugly: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:47 +0000
Message-Id: <20201025142353.1929717-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
index be10800389..d9ec82d887 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[md5sum] = "b025125a6c928024cbd300cc27b5d712"
+SRC_URI[sha256sum] = "403c21688065f41e53008874402b5c07832567cc1309a60df597eab7ff5843f0"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.29.0

