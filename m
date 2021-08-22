Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.9612.1629636686677975933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VQdalAyo;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id e5so5228150wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ChxD7ri0FTmTza7R1KHPc2xkklvl2IxhxoqR9Y+nUcI=;
        b=VQdalAyoxlPU/hPwIydp2daUzglCbc7GX+d5+YeyLnEJdt2fBTXMSTPMZHqwBx/wP/
         qBTf8EdPOsQJi9LM4Av1IqMHe1ylJH/NwAwYSlyVKXFsghlD3Gqwm6j0vIJsp3NVaOqu
         HXIW1hpIhQI+z4WJZ7sJ6lcagHnLSdA/5tBXnY75uccoiFsoPL5borCN86YbHxm+EuGE
         /Da461vucXICGEJOXOIu4tqaXWNAa1eYRlkjBRJC+kCk2pkpIL8i0ED9hVnnII0ShIX4
         Pm3yp0NWFFhMvHNGZ0myEheTdfhWTTOwuqe+VZQvhsGr4RDi6qDUBycNFOYHdlb4slvM
         j6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ChxD7ri0FTmTza7R1KHPc2xkklvl2IxhxoqR9Y+nUcI=;
        b=eNs7KT1w+aLA7XV1fbIWQwrDeJWryXiWvlv8Bz1O9YkUK4U31zLa5FwIQ47NxhWtmp
         6w4rjYFojmKvxwD7bjbti7VHZ2zxZwJ08JjJoHgqVh32awvwbaOQvDr+raQcTVXcfeJI
         hR4SzjfNbeKa3XnHl5ngHLrLFJ8wyBHZmvyiAOvTV4Q+4R4iqSc/f9ZCE+jjPur2PnPv
         o1yhtZB/N/F5gWeFBNtk0/wlS3ILaE3cx8QZIiIXaFIUaT8ZHkk21VL9XHX70MyQwvzS
         ih/iVADkNPqtU4QK9KoqaySz9g6pO5+NV5C/jG6nvrnR3EojWpfEPbY/G2nKw1yOcjZM
         darw==
X-Gm-Message-State: AOAM530PWNUpJnHIC2u5BgCxJulYP7dlBj/U1SBCV9Ds5Plx2f0ZLkKQ
	Kan5230fr56hqyNKqEG2mJ5gCfWXwpijtQ==
X-Google-Smtp-Source: ABdhPJw5QKtB/1jYWFelclggINlGl5S0paui2V4uFnbZdIta4wJPdg6I/6PDAMvsACRmWHbwy9/hIw==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr8495953wrm.220.1629636685371;
        Sun, 22 Aug 2021 05:51:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/55] help2man: upgrade 1.48.3 -> 1.48.4
Date: Sun, 22 Aug 2021 14:50:29 +0200
Message-Id: <20210822125103.310416-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../help2man/{help2man_1.48.3.bb => help2man_1.48.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.48.3.bb => help2man_1.48.4.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.48.3.bb b/meta/recipes-devtools/help2man/help2man_1.48.4.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.48.3.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.4.bb
index d24e6c446e..cdc2056e6f 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.3.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.4.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8361ff3c643fbd391064e97e5f54592ca28b880eaffbf566a68e0ad800d1a8ac"
+SRC_URI[sha256sum] = "937194af8e31e97467768ec2e3ce8d396bd1e32e8ea56df23f634485b5f14e09"
 
 inherit autotools
 
-- 
2.31.1

