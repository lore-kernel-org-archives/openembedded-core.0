Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51E9C04FDF
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.20169.1687728170352170252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Yfx7Gja9;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-313e68e99c7so2042555f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728169; x=1690320169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3JilZImgzySQtGi7GGLueknd6YwXE6hF/euxQVdmow=;
        b=Yfx7Gja9AzC5DgtpA9RtzSgfn/ONhGzFdAqtQ9twEMCtYJayByn+WqdE3dGIKLEAvx
         4WCmYsPBlas4Se1Cf9mzqwFONbCHB7iT1Mavdev5trRZKMEb/0BGkPlHXKhGmdOzZ3/p
         r8kDhJouVdXzkEjzdahXD/u2DSYLW/2CoQP4kLyR3rvRmHjynAzEx7PD3pCZvIwwZukI
         /vZ2Gk5Bkc3OvAh0jAPfMx/7AuHyDyzXEyc3AhkatIAngcaK033cS1Z6B07XkdXOphlV
         3m0cbM9lR2/hk6SglwA7pJBzsyn7gd+lM5oL9UsiihPhUiTDsQCZOJE39ffD6ygj315q
         ysfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728169; x=1690320169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3JilZImgzySQtGi7GGLueknd6YwXE6hF/euxQVdmow=;
        b=BO7Duh9lFzUw7QYYsfOmf+CIvwxEAeaA0vvAP1GQsIS/BibpIJN32GZoFaiq2RYwaB
         s8BSDvBzNx7emUcoI9J32lwD0LYYrTRV/Pk2Tx2Loh3z0Qf5v2DgHejJnme0hTSWg7/X
         /5xkHCJ4/6IPB/+YYAJdjR7Zqt+rqgUXx7U+5xP/TZnq0+6Zs3oaos1/NjL4LS13RZ49
         IR/rORajIYQonXy6jHkHkX666ZkwvHH4GI4bV5Aq6xTZgg4Rr0TkWv3VswxcblU8pO32
         YapZwwaK82FrV9MIrmriroZLKq7i8vivyw8qBuf8WDQ0IpFviTP5922CcZ1RgU5f+Lm8
         f0IA==
X-Gm-Message-State: AC+VfDyB90NpCrCUBEwWUxsFQxdl7GSs/snpJPWegtzDTStgNmFmw1ie
	gc/hYRFU1V2HGuXxXMB8LwtumJXYV8gYLQ==
X-Google-Smtp-Source: ACHHUZ4o+Dyj+P4iEijW5/81f4MbxktndOXRlH7XOMyHelvpBC7dTy33JKKFgu6acfgKUF3tUlIljQ==
X-Received: by 2002:a05:6000:42:b0:313:e2c4:7bd1 with SMTP id k2-20020a056000004200b00313e2c47bd1mr4333350wrx.42.1687728168652;
        Sun, 25 Jun 2023 14:22:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/21] python3-cryptography-vectors: update 39.0.2 -> 41.0.1
Date: Sun, 25 Jun 2023 23:22:28 +0200
Message-Id: <20230625212241.915739-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183383

Convert to python_setuptools_build_meta.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ctors_39.0.2.bb => python3-cryptography-vectors_41.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.2.bb => python3-cryptography-vectors_41.0.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
index 795e27f75b4..016620e7104 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed918ec879e8afe0c2a5220"
+SRC_URI[sha256sum] = "23b08c39777ec7b2774a11f945d1746301b1e88ecff2e5326d7f50ea0f42d580"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
     ${PYTHON_PN}-cryptography \
-- 
2.30.2


