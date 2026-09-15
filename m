Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03892C982C2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:52:40 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19475.1789465955203521882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UFzBM8Wy;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so19315265e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789465953; x=1790070753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sHyvcRo5e0YCg1sSli8ao7obBgoX9+oyWBdlz53KtlY=;
        b=UFzBM8WyHQ13rx4FkrUME9+XT1o8twS/1C7KWHMGBPLBcjNOrJBLNkfsJdsNu2S7vG
         QpFHtmyvtKcxwq5cJdtINrAYtT2jOhNf7kpfB7RfhmGQXq692bfaVJYrZpJ5m3F0Ls2m
         sTsJBNUnaX2el6AsFoEBld3w0qlESzLkBNrd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465953; x=1790070753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sHyvcRo5e0YCg1sSli8ao7obBgoX9+oyWBdlz53KtlY=;
        b=i3JUh8aYjK1wZbuHvmxRC4zKqw2ZgZNbsA1TwpElqItE7emGV6OWDt6MoU7xcRwuDV
         q7BTalrdCVmYrHTZX7y0prFXDp2xKIWuCU2+AAkf3PQ41Jd50PjoA3UCHe9PuNRCjmhL
         dOD2DZ42n4V4XSNYB9mc4nmuBLJVrYDiEsbG28OX507Wpi+QByruUIIXV2d9fYpg5XqT
         jukXVowOirSkvmzEkGfms+UzOxFa8wrQS/L1FAwlp2dBa4lraJxpgqHM0vKaUazyTo8t
         hv0ZUGg342uyMFXyTffNPqY0+LXaVJnSHOeo2ep7F/xdjWcRqTeJR/sbFROx5NGUOFpQ
         9Xeg==
X-Gm-Message-State: AFuF++mAiAUZD1Gd6Ns4boNI8+WoshmQwBVphCxNHTUs0bRU+Z4dMJmi
	doJjMwtsad7O51uYQ6GWUXjEucmqboobM4xpWFLcH8FcrAiwVYl/Kd1NJ7MLOxAGekzo/uXwl6o
	9ydS+u7A=
X-Gm-Gg: AYBFou3AE2SH5RZNHJ/1RCGxN8ZL6HRGFPS7if1SIRrz9YzqYdJ0jgZeWNHaKfL+7w3
	T7kpra76H4djZ/wsklh4mtD2nlEqdu6KYM3SgKIyUaTeBUwzjj1X/fhCyCDLbRA7Rzg8y2qXBJR
	baTFu5FGS+pZBQpfRnJ92mAF6ILnzb9SR0Bz2YlIHDNjLGSDSVnaocKoIyKxo4hUFBIxVH/hevX
	kZsInEb9L/PbDYeTwC2QQ/Q//DYClTleckQbl9/KAQRXrd6k/v7tzf6tbQJQIl6B7zXdy4nPnhY
	bQDE0YnEJ9HYv7b033hiJx4jEzx4H4IHE0y0yb+JN0iCUeTZdPnXsD3EbysfvqMvHlDRX4WveTR
	yTKD7Uw22MxmTWI0976OMM2nuZQYYiZL8hWzeCojWZb7FF/KPsF1TBX4FtdtDiW2QUMHNlFnYx+
	dXlrV2fPmxcImTnn9+qNR8l2EEFg9ycK7vOfrVgIqOJEt2qBETDBYjgOxRcumdpN+9fJ8f5FTkb
	0nSNYXwujrsV1sLbfHuA3MA0xj5SQ==
X-Received: by 2002:a05:600c:4e45:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49e7a68cefdmr173706295e9.15.1789465953096;
        Tue, 15 Sep 2026 02:52:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f6d6sm62617775e9.8.2026.09.15.02.52.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:52:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libtirpc: upgrade 1.3.7 -> 1.3.8
Date: Tue, 15 Sep 2026 10:52:27 +0100
Message-ID: <20260915095229.2292237-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
References: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245833

    libtirpc: Bound maxsize in xdr_rpc_gss_unwrap_data() decode calls
    libtirpc: limit XDR decode node count
    libtirpc: Fix use-after-free in xdr_pmaplist() XDR_FREE path
    libtirpc: fix rpc_gss_get_principal_name to allocate memory correctly
    Add missing exports for rpc_gss_getcred + authdes_getucred

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch | 2 +-
 .../libtirpc/{libtirpc_1.3.7.bb => libtirpc_1.3.8.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.7.bb => libtirpc_1.3.8.bb} (93%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
index 4e5844e18e7..1d2a9bf2870 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
@@ -1,4 +1,4 @@
-From 0ae4371ee63e25a48777a83c0601c85c5747cbac Mon Sep 17 00:00:00 2001
+From 801ec3f723fcf6d531cb57c9f3c6ec1c51b5eb54 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 31 Mar 2026 23:07:09 -0700
 Subject: [PATCH] libtirpc: fix bindresvport build with clang-22/C23
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
similarity index 93%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
index cef541e3d07..6d95f3f69d1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702"
+SRC_URI[sha256sum] = "8839959bfcc7a0f4c609d8e4f53f1c67ae33de23775ec35beb39ff15adf11920"
 
 inherit autotools pkgconfig
 

