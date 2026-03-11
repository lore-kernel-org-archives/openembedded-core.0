Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182C91125837
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 14:12:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22006.1773238355288266307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 07:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P8Z9L2v9;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: aehs29@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c2af7d09533so9162819a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773238354; x=1773843154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HyKfgPQqtPrLcO3WGtZQOGZUIZ7+lrdJTxjtzzrAVI=;
        b=P8Z9L2v9mufOLN8gMm2IXqrH7MIHPVXmWGL2lKoNlwHh56R1YvhGzwSSj37121ZorZ
         yZZLpjM2c4Zmq707VbUkFrNRePm2kceMXYkCNZpdEHr7Xiopc2X9P5B+36uk8Vc7pZWA
         eWoo6wA987UinqGxqcxCjCjWSBl4uezY9QrF6YEhwt7WFeKySNtLFcYQugDvcRaX2cE9
         hGurmW04im43D4kn8XSgcPnU4iX3h2ULQIPdty99P9NDgAx56/72ZUj0+PSUcuSUMq2c
         FFCPirabb4Ylz8UgbmzHSM0XmLYoDM70QL5AAzfLbb0CdmDkqeI1iRdx1GXZXfAbrUWZ
         I/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238354; x=1773843154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HyKfgPQqtPrLcO3WGtZQOGZUIZ7+lrdJTxjtzzrAVI=;
        b=e46Fud8R4C4e051uNb0kH+SnHIuk8uJgBFoc4X+F9sr31acvIGCqYMDfoUKKKde8Bv
         TCJmUFfbzcQqTYcQN8f5QldPtyEY/rgOhOitl2w3Zi1J94vve0jo3hSQ2VFA+NBQtw/D
         UEnV9H3CsF6abAf0BpkD0eC4X361i2rsLVVqlYVW3bnck5Y73B/Ao9rO4RSU9hNzVm6C
         tHBSoOv5G0vzJO62wUUJ/0c/LPRwXfrvAn1SCcmTq/5NyOcefOvzzFszFGb6PkdFjjHC
         INmNNrXFlR27aGpmnrBGpuH9NvrM7WqtmKa2jupjIr7QI78ggkn6HT7KmwIsTzAhqpot
         kV9A==
X-Gm-Message-State: AOJu0Yx09gg/gmMi0i98RdXiG322krZ+1JheFr40te6+HJjSStDGNhst
	zboISjFnwF9kPAgGvHC+WgsIUjzv7DBC2fzlSnvNfqsizYrh70EB0dBR5w8uHYGM
X-Gm-Gg: ATEYQzzCLFv7X8/6g+GkGb6WQGNqK92AYQhQPDfoxEtGqUZzNDO5vfdcI7VzY7w8ZWN
	OXTvwVzjtlpNYC5UY/HBpiyePs1DK9Dx3dpxSMsSjqTqHn7K2RIwZFgn60NFpvtqEmWSoG7j42Q
	vNoHWRFo9+FEq0Qg5jgr6hYSEUH3Ksn92nhDXaUcsh4eryPxm9gHspba2RwNV5stS1/NWB3vef2
	r2DS2BIbfH4zfz7PeV9wsiV5QPq1pbZ97Py9fp+TQ5Zj79aJKSFGiCuRr+0ZQToDbsGeORnqL65
	iTAvm8uyiz+Xu6yI2TtH9vKbx2VYwoGoql1oLT6yPA7qX8pJsZRL0z29J0L7xZmKT1SYw132fQ6
	HZ8LanqvmyZmw5JL0GG5C6vx2kYadg1nEuaK3UdZWosd/6Ossi119+83XXKmGkwSf2hD5ozPS2i
	Ry4ukQEBCB6c+xTXt8kl9WsXSubjY=
X-Received: by 2002:a05:6a20:c783:b0:395:ccae:d494 with SMTP id adf61e73a8af0-398c5ed2f7amr2519083637.20.1773238354253;
        Wed, 11 Mar 2026 07:12:34 -0700 (PDT)
Received: from DL-ARCH01 ([192.63.190.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc15basm3519669b3a.1.2026.03.11.07.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:12:33 -0700 (PDT)
From: Alejandro Hernandez Samaniego <aehs29@gmail.com>
X-Google-Original-From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH 1/3] libgloss: package riscv header files correctly
Date: Wed, 11 Mar 2026 08:12:23 -0600
Message-ID: <20260311141223.306264-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 14:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232889

Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/recipes-core/newlib/libgloss_git.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/newlib/libgloss_git.bb b/meta/recipes-core/newlib/libgloss_git.bb
index 92bb81050b..0739651eed 100644
--- a/meta/recipes-core/newlib/libgloss_git.bb
+++ b/meta/recipes-core/newlib/libgloss_git.bb
@@ -23,9 +23,18 @@ do_install:append() {
 
         # Remove original directory
         rmdir -p --ignore-fail-on-non-empty ${D}${prefix}/${TARGET_SYS}/lib
-        # Remove empty include dir
-        rmdir ${D}/${prefix}/${TARGET_SYS}/include
-        rmdir ${D}/${prefix}/${TARGET_SYS}/
+
+        # RiscV machines install header files into ${D}/${prefix}/${TARGET_SYS}/include/machine
+        # move their contents into ${includedir}
+        if [ "$(ls -A ${D}/${prefix}/${TARGET_SYS}/include/machine 2>/dev/null)" ]; then
+              mkdir ${D}/${includedir}
+              mv ${D}/${prefix}/${TARGET_SYS}/include/machine/* ${D}/${includedir}
+              rmdir -p --ignore-fail-on-non-empty ${D}${prefix}/${TARGET_SYS}/include/machine
+        fi
+        if [ -d "${D}/${prefix}/${TARGET_SYS}/include" ]; then
+            rmdir -p --ignore-fail-on-non-empty ${D}${prefix}/${TARGET_SYS}/include
+        fi
+
 
 }
 
-- 
2.53.0


