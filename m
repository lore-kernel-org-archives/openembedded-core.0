Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5009BC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.11517.1634657680312677113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pghFkJpb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3395944wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=14TRhUhUDBPFkovMyN+haM1Afy0Msv9YOto44V0oCZM=;
        b=pghFkJpbkmmbKhFpFy1TsYiJQvDFtHy7dykPSOI6i9uqZTtDtKIfzqpr2sXtM17e+0
         yYNQnFoPV1tlih4e9VEQg5cBIg1bX3EAkLDuVOmnddFQ77ch9UyETa1ponYllUaeJT+I
         Eb/RoaatKSoc+2nXfAPHz2Ir2TF8/kdhLVipQp0mD54Un96z+WjhtShS08HlN9Qr6hQk
         bSqb0jzoDl6dKC/GfLEPdkN6+goHgCucmBk8oK36bfDtDbR3xS6mo95+Si0+xrxC+HoL
         wsi85ktyaEgsgo7L8FKogei8S0Jv2cRrkVdY/lVKbfq2yX4khxBJvTIRqaT8hdT0lLBM
         HpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=14TRhUhUDBPFkovMyN+haM1Afy0Msv9YOto44V0oCZM=;
        b=hKPqUgwxd2ss3eIAQNBKHUfp1NI1TLB08BM2Yq+idrwYJES8438IkntvhVVgljt57z
         3aqEz2nw5SCwa1P/EQ0b7uGuzsIa+3Covsg1DB3AuqOE7jqGkh1VcEoQPoL9sKYZ76yq
         W9yprh99TjoTNol+flvX36ubVHLlYd+Oaew9kwse/cPvQ7vMcKJ0Vog+qHvYnR114gw0
         nnxE+Ws5c7g4Y8SebXY3ifG4G/tRaDYKgIIFbfmlepTOdOe6yLWNZObTHJwQ0zXFzaEB
         T//d60rwJKLbVMGWWvNBvdvnBVCs1itmvLqXoIsLSGLKxgcpnPNd3RLkz06KQ8Uc+CYs
         +Cog==
X-Gm-Message-State: AOAM533ErqhStcn4F5J5STfBNZjNNPp9PtrR1XxSh2llSHaeYk22baec
	sDKtCU3lhgU77llVpZZjBzNssrp9kpo=
X-Google-Smtp-Source: 
 ABdhPJzHN8FCLa6HkOt0iqEYMw8kuIaXj342fj52p70xx2kadK1Qlum3n8I/E/uFCs2ovhC8C4qLcA==
X-Received: by 2002:adf:bb49:: with SMTP id x9mr45795958wrg.413.1634657678958;
        Tue, 19 Oct 2021 08:34:38 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/65] cmake: update 3.21.2 -> 3.21.3
Date: Tue, 19 Oct 2021 17:33:35 +0200
Message-Id: <20211019153419.3319802-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157140

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.21.2.bb => cmake-native_3.21.3.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.21.2.bb => cmake_3.21.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.21.2.bb => cmake-native_3.21.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.21.2.bb => cmake_3.21.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.21.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.21.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.21.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 2bdfd6061a..43d4fe57fb 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "94275e0b61c84bb42710f5320a23c6dcb2c6ee032ae7d2a616f53f68b3d21659"
+SRC_URI[sha256sum] = "d14d06df4265134ee42c4d50f5a60cb8b471b7b6a47da8e5d914d49dd783794f"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.21.2.bb b/meta/recipes-devtools/cmake/cmake_3.21.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.21.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.21.3.bb
-- 
2.20.1


