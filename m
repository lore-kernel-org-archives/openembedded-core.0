Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web09.210.1612376001300057299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 10:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=REqVNQUX;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id a8so494232lfi.8
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 10:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awArIi+f9eNi3LVrS3uPHdW23JfAHvUvkLpR2RfvIvM=;
        b=REqVNQUX49OSgkSFHZNoDBaINhY1/t7PvF8SjER1tA2RsuS54Wf95454cPKc6/H6Gd
         zrAMNSrbcSLCUd3HUitgIJN5V/2Rtl/m60jy2DvdUmw9CgS8HddLKaCUzPD7kttBw4xj
         Bnp//LJHG0mlbmd8doYdUSezHE1wQ5XJRSN2Vb76StiY2kWeYaXebMTqifDwjU5AUtaD
         diYYmJYF87c9V4m5HGRP93UBR2ylTKibzAbAqX9Xc2GIIMNHGVFCBdAQlfKgsGc2O+ck
         IQ/D5GAt0G1vPQZG2qPk45TnS5/49rIDIjU7ZP6fKgRb8YXvvLRd6KIfZutlpqUl8yyf
         g4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awArIi+f9eNi3LVrS3uPHdW23JfAHvUvkLpR2RfvIvM=;
        b=SJ7NXj6EGbtMNL3oGZq5Vtdmkuw99WX6JiIuaUyqv3Ihtjs0d1HYEJ37Twt1VSL2QR
         /JS4uR9VGL1HHNnzMMt/o/Mi8WUBZKJ0aBvJGTcQ9AYBAKVqa4cJh9VFdVM8bW1M55Oh
         MaMkfayqUSgMU4f2kcpCWBK9SUoqnQqSgptVqzVDTUgEcKAKyTWnN5B3/DMqJ57Zmzk9
         bRoju73wtab6zTHVNSTkOjh4u6e5XgQXKU2bLMfJdDi5xI6l5zrPPkfkA4cQYBFunWsf
         UU0vved+1Wg4VL5g3xTK8/AF+h380mleo1z97R5rP6StRsA3YWYHQPsrnubsP19z+Ubq
         6zkg==
X-Gm-Message-State: AOAM530xxSnfaG/SkjYPxXHCnMdg1DpcmWJsTUaniiAABZhGqr1XafZd
	MYBLGwIM6M8tbRzZYGMKKMOchHS3yZDynR7s
X-Google-Smtp-Source: ABdhPJzAIUc53IXir9JK/K1b36Yiw06eaqBioJrNDwyi8+60gdGqTYxmq0XRtw4Ywl4GX3YVoZip0Q==
X-Received: by 2002:a19:c208:: with SMTP id l8mr2401585lfc.12.1612375998774;
        Wed, 03 Feb 2021 10:13:18 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k23sm328637ljh.15.2021.02.03.10.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 10:13:18 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-smmap: update to 4.0.0
Date: Wed,  3 Feb 2021 19:13:16 +0100
Message-Id: <20210203181316.1139481-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-smmap.inc                   | 2 +-
 .../python/{python3-smmap_3.0.4.bb => python3-smmap_4.0.0.bb}   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-smmap_3.0.4.bb => python3-smmap_4.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index 7703722bca..2a2ac76f2e 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -11,7 +11,7 @@ inherit pypi
 
 PYPI_PACKAGE = "smmap"
 
-SRC_URI[sha256sum] = "9c98bbd1f9786d22f14b3d4126894d56befb835ec90cef151af566c7e19b5d24"
+SRC_URI[sha256sum] = "7e65386bd122d45405ddf795637b7f7d2b532e7e401d46bbe3fb49b9986d5182"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-codecs \
                    ${PYTHON_PN}-mmap \
diff --git a/meta/recipes-devtools/python/python3-smmap_3.0.4.bb b/meta/recipes-devtools/python/python3-smmap_4.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-smmap_3.0.4.bb
rename to meta/recipes-devtools/python/python3-smmap_4.0.0.bb
-- 
2.25.1

