Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.24484.1630946799639914463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 09:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RtJ17qLp;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id me10so14507992ejb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WxSctbzVyZzniqfkcO5PNqGdk7keOiPb8yc2jJo3+jA=;
        b=RtJ17qLp2PBZiHQ5HLl1rDRFIER7xXyU1vAw3KTgfZ89NE4eWCyEYjHgw8pRgQcm22
         Ml75FHhVVDLza5u0Ikj8ulkM0zcMLlj2SkeCJVPvqpRtvmBWnguXvmYo7RANrfojGUki
         MadV0SR3Bxg+ZVv3bVgxrujSRgmZgzR0nS+QdIqidQ72V6KNncIHQx28QR0ye1jVCm/4
         VpqsD4TScP2BNSnFUVjlgAdoJe0hXOma847o66+dxvAG7vPP0+ieGvRrdpLMBd6gqcCC
         962G3spvGPiWFIvJa9zaf9AGzygiV9B3ezPmM5LB0+cfuJZJ7NGmOqzbOOAYzmT8892f
         a+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WxSctbzVyZzniqfkcO5PNqGdk7keOiPb8yc2jJo3+jA=;
        b=LQamAdUcS8ONBTZhmLQ7ptle9SF+RfYdJVL+lFIzOifAzX9qX5vqbJCSn/OYP0RA/P
         gN3p8YsW3buNnQKMUN6iiNtDgMo7A4vrOlLK3JGow1DXuRzStLVKIW6ZT5t+ah3ansgO
         xx1qfZpQ5is9eTeEM/lTSbbJXd5/g056MnGNOdX3/+fQrlTDJHncNqKo1JOBwT4JGabR
         7HtGOc3hG1eMhmTBNvFhhjxQoCyJWUht9dTp/p+Opp1s9qOJAQlILIBNPbkj0QReU5aQ
         mgWzn5t3F/9TISlWCOyRDhs+cHjGTO3nFPCIjnXS89zMXcHFfCANVmlDUqfQRLs6DJbA
         UnMg==
X-Gm-Message-State: AOAM532hHO/oRUZB3eci74UXwsYcYN1t5rqXtgqKNDBT5hTTnzzyxv9U
	VWOZz6/zpHDe+aWZFPMFGBJBrnfoB4YdPg==
X-Google-Smtp-Source: ABdhPJyV8nYRKe8gF50agF/X1xjKYM84daISINdV7XWJ3clNFJ8ajUkRrFrbenemetI6YQfNJdP+MQ==
X-Received: by 2002:a17:906:8258:: with SMTP id f24mr14242187ejx.375.1630946797886;
        Mon, 06 Sep 2021 09:46:37 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from localhost.localdomain ([2a02:8109:b5bf:e890:3839:7e25:952c:f217])
        by smtp.gmail.com with ESMTPSA id k3sm4158167eje.117.2021.09.06.09.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 09:46:37 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH v2] iproute2: update to 5.14.0
Date: Mon,  6 Sep 2021 18:46:19 +0200
Message-Id: <20210906164619.837-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok <changhyeok.bae@gmail.com>
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
2.32.0.windows.2

