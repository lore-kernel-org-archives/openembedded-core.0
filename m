Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B31EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 20:09:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2701.1688501353253866323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 13:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QNL8Cnby;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31434226a2eso4014854f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688501351; x=1691093351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWCQtzFYi6Jrtn0f2nTxTBUqQ+vM2fE+IJgB9Pejh2E=;
        b=QNL8Cnby8GFqk9fwVzY+O62sPwGPySBX0ZCQAlT6G+pzmwhcH2BeqtpLVIz9G10Vdf
         sr+g54CYq3fIV6MSlnqJij5/nIyb4OhYxu0ZVigYCtF9DtLW0sbyIoI9FU2BL9jmxGs9
         JCsFUce5Q06KcH9nZ3TFyRQwB/Z8eQIkKXRohtRq5P05wkKYshgHqr4dr9oA3MAM3h70
         YgwOsajROIKf/Ta4jGITpFmFNER457SzYUZfdXJiOfTYemtXJ4mcXLOYht9L9BLGa6M8
         ew15ofCgnmAmwj/5Gu+NduSZWrEqeku4TOZloyDxgmLKwduvhh16XIdQEbDMDifXAddb
         xBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688501351; x=1691093351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWCQtzFYi6Jrtn0f2nTxTBUqQ+vM2fE+IJgB9Pejh2E=;
        b=MxsmP729V+5zu1dYC8AtzUDKz+oKBPOp7jgSYwvb8gE1uHgKtBnUQjDAjpjorMfbz2
         EAS//V9liSK72celeSLM35ZiG4EZcTNvEe37uABlpeh7Kl3OSclgs75t9PZBXfRGtfXO
         17ZZJxDuP0sIlEhh5Dnh2dhw7ETAf9hsXgnNJ+SSDChCHMVNBRry8l+ujR+m196hf8xi
         OOrEP5l1Zd9nWaPLWabiHzOPMSsMZWh5Nr9sZBze4cG/Za4oCvuruUhmPxI+lzBbQ4tb
         J8qOi5mEWA8jj2gcVT4Jgq15gDuDQurJihvhUCpo2b5ENdwlYTWvdpfLondjoUO3J/l0
         /JVw==
X-Gm-Message-State: ABy/qLZizZB5UDfniOxylfnpEnn7up6rSwBLueJD5HaVjouij7Ssi88v
	4GuyJzHMaGVSuhUPuu++f/YHeM3sJ7g=
X-Google-Smtp-Source: APBJJlGhTVboRvBpTDnhbHiEL0LqXZJEJeEIFrVxsXThuISWsUdGCH/AJRGUshGj63BvL17Q0vN7sQ==
X-Received: by 2002:adf:f049:0:b0:314:1249:d5d7 with SMTP id t9-20020adff049000000b003141249d5d7mr17344782wro.16.1688501351167;
        Tue, 04 Jul 2023 13:09:11 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b003143b032b7asm4734737wrx.116.2023.07.04.13.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 13:09:10 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] python3-pygments: upgrade to 2.15.1
Date: Tue,  4 Jul 2023 21:09:07 +0100
Message-Id: <20230704200907.20403-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 20:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183871

Upstream has removed setup.py and started using pyproject.toml

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...ython3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
index 16769e9263..7e3b286f41 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297"
+SRC_URI[sha256sum] = "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c"
 
 DEPENDS += "\
             ${PYTHON_PN} \
@@ -15,5 +15,9 @@ PYPI_PACKAGE = "Pygments"
 
 inherit pypi
 
+do_compile () {
+    python_pep517_do_compile
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


