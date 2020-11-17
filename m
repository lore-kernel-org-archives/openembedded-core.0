Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web12.16798.1605656912902263195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MoK3ijlw;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id q28so5204659oof.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5vnBW2qoT/e8HcdIO85OnrVZ7qgfS+QMd0JbFttb0Y0=;
        b=MoK3ijlw/YUJdd/NuGC6pwqJaoizMNJpLzXs1NU2d5lRaySqEhKqVUhzQfXPfjQ7R/
         s2bZSfxKML+ERWSKc8DZ2HU22NyILuIfNROh3CnDcDyt0C15jSYlQ0m5n9Fy+sOFsqqv
         49B+1VAIf2OxsfVcoxVMsG/4wyRTDBjEiG0Df9s7oLeegsVrHaFEMeE5X09sYA0w7Xwg
         nBG6QoNhoPYYQ3zI340i6WKJXqC56jIUfhJ2jP7fpgw2wLTfY0ARzQOWNhr7L3RQZZUO
         4giM6sM85PNUnpA4SYyVYOM1SGM9++kN2gdq+1j3k1qNyoVYpBsqXioSBtwhjlH1eYjh
         yELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vnBW2qoT/e8HcdIO85OnrVZ7qgfS+QMd0JbFttb0Y0=;
        b=K1+wXAPS39wKd4eW4vZycHjzx+c8VE7t72U5Ep1TNA3S3hP1kXmFFCi05c8sS1qL71
         7DxcVrQv3A83KTVOA6rLo1EOKVzUpsMWF1aIKJsgxIXV3CwPy4XcRSH61W4QCe+Z+RGv
         q86neDw3LKBU7ShqyUXEcq7qRPWB6sybEvwag6FOuTSEgZX4h3ropxTaK1zCrVw/55T1
         p7suww7XN2Y5NmAd98xPR9BPd/4oPSEtMshxLY0uvmJZ335ptj2yVf4EJ6NEzmmq3InM
         mB+lPtLkSH2wl9hsLdCmw/tLgk2A6QkCXESyRPSAbPxGekSXd1vjua0nhfeHJvMGPWrE
         g8RA==
X-Gm-Message-State: AOAM531Eh3GMvDRYNgy/tZcj/8rZJgozPB0MLk9dYV1unbVQOqwVa765
	PR4AU8k2mggClps1pewJtUUjYUKPpIiYEwOd
X-Google-Smtp-Source: ABdhPJx5U99xIUPrKP7TgDiMXPJRKGIsRMQdyVi9BKCoBRUOP+H/tjyBwgMNFUvyUz0ZPL6cnMNa4Q==
X-Received: by 2002:a4a:d752:: with SMTP id h18mr4688008oot.62.1605656911844;
        Tue, 17 Nov 2020 15:48:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:31 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] ptest-runner: Bump to 2.4.0
Date: Tue, 17 Nov 2020 13:47:35 -1000
Message-Id: <bd7de7dd0992e0d7a6cc322a54cf9e69b052acca.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anibal Limon <anibal.limon@linaro.org>

Add support for un ptests in multiple directories, useful in multilib
builds.

Changes,

1e9a845 Add support to specify multiple folder for ptest-runner
287ba30 Makefile: Fix TEST_LDFLAGS gcc cmdline position

[YOCTO #12604]

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1203ee86e3cf4d73f6ba513452717f1c4f78c501)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ptest-runner_2.3.2.bb => ptest-runner_2.4.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.3.2.bb => ptest-runner_2.4.0.bb} (90%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
similarity index 90%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 3a0dbf84fd..9e62c486ac 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7015e9199ce748c0717addeebe7a8c47448bab03"
-PV = "2.3.2+git${SRCPV}"
+SRCREV = "1e9a84585909b970cc8850d3ea02a7215dcfa5a3"
+PV = "2.4.0+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
-- 
2.17.1

