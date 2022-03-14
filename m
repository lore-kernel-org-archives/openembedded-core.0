Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD2EC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.3249.1647298122694457109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LlPAWYk+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x15so26241610wru.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M0F6EVCwmrdtqnLfU9al70IHSAiV80GANMMERBAwMcc=;
        b=LlPAWYk+9cly1250veHg7XwH12MloerBVnTVWButODevRoR59JQx0B26Pqb/2Bswim
         Ccm+bVijdStTIb2h+C7HqoqTG4m3lDCoTsNCSR1ZPUrZ1CxFdTkOonja4zf03AU8MIzB
         nf/1wCER2aXQzrUIE3/5ssLrKDNPOOQsVdjTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M0F6EVCwmrdtqnLfU9al70IHSAiV80GANMMERBAwMcc=;
        b=t/o8vptgfDPm3I+I7kKbFuGoy3uBRnmZ1tqGy88E27eCV2Y6y1qVZt30l1BhfGgNgd
         75MippTvf6XhExRXJXup0sXrtBhIGNSZddbpNBUsPayJQq8wJCQepu0uvVoktlLgN2M1
         2nfTjPMCguf4BCwM9dP0Qu0ttGmNp2CG+PvTxn5fgWCk0P1IRffJUEGT3brzriT9H72K
         ukjdm570tq3mV/q0n6PMa5oMVP0t3uOoaH4rOmA3Cwnf3bTKKDV1EL1XDkfrTtlFhPou
         U1dAMvxEuGzBmiwq+L/AKdLA+KGOradkTfSLlNR1RVAqHX/sU0ETqoAxXXSWswgx9Ayf
         uzZw==
X-Gm-Message-State: AOAM532xJS52HejwHrhCnlmBDZxhuQWXoz5653GAkrpJuRRWbqe9HWbm
	cvJ/EjAUHEWs8+Np5Ug2gkBkoN87Zs8gSlqu
X-Google-Smtp-Source: 
 ABdhPJz7bkrWRtKp5KHucdu+EZahQ8RiUznWwCXX54xz8UrAr+bbwgJvWx7xh7u2E8a7DGvJCgTZVg==
X-Received: by 2002:a5d:5241:0:b0:1f0:1842:efbd with SMTP id
 k1-20020a5d5241000000b001f01842efbdmr17307006wrc.320.1647298121030;
        Mon, 14 Mar 2022 15:48:41 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 02/33] python3-setuptools-rust-native: remove obsolete PIP_*
Date: Mon, 14 Mar 2022 22:48:06 +0000
Message-Id: <20220314224837.834776-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163168

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-setuptools-rust-native_1.1.2.bb            | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
index 73dcbb26e67..2b929727005 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -17,10 +17,6 @@ SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a
 # until that can be resolved
 inherit cargo pypi setuptools3 native
 
-# For some reason the wheel is built in ${S} not ${B}
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-PIP_INSTALL_PACKAGE = "setuptools_rust"
-
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
 RDEPENDS:${PN}:class-native += " \
-- 
2.32.0


