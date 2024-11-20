Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343A0D63948
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13935.1732111038661709270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ms/xYJNk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cdb889222so52928105ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111038; x=1732715838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvN2nF3bynpO9E5Vi9Z641o8yv8xM6mFv+CxxPnJves=;
        b=ms/xYJNkps1bsc3eqhrAjQLdsggZKZrI+xlIzWYLdPUvRxZ3jogo/FGQsFlFT93F0r
         CC2C2HjILtQYr7vie0CqXu6qds1uRRUNvsXBDJEE7pPgkNXOgR601iesDlxBphykRErJ
         oP6L0SdQTlhEFGaRnEdPjZMwHRQ/aWJLxkvaQUXQ0gozt15qpv1W7YDsgcDYOb0fDnXw
         07V8YqNzffEi+hNbjHlSA1unHOvkthY9+i9AENRMwQIqT9mGnT5Ei6O6NO4WAE2cB72c
         8uGCuFZABSJaZFpuQXcVZv/vGmxF2FzInOfgWRuyCYjBxQ0yqnqKFme3VQ3bZaGINuWB
         4SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111038; x=1732715838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvN2nF3bynpO9E5Vi9Z641o8yv8xM6mFv+CxxPnJves=;
        b=xN7BMrzdO+g/Q1to6g0a27VQzZ/OWNtZkxGR/GfzJLGDyDD6zdyaF09ASr2em6RuhD
         EWRmIOE5q+vjekkc8PuhiEInx1K/yW0SPm0xFWNROQtLdEEfVLcgjDrT5Ij0jBuvf3gt
         6Xc0lj5fivKqqEqCBZMbcA1YC3F4AKFD0cfAi86xGvzwJQcnBYL7JsjpMgi9eU3beoAQ
         VgE8qFf9VeMb3ltvqLzeOePwmTYcHcpab2XR2PfA5VUzo1ADvrubDiT8HMR/sK9R4wTz
         ht1DiL6KLioGUvNLlPvRKT06c4s1YMLclW3mPuz9+NQmBfBOIhpuCb8ISbVhJlGElBpQ
         ew8g==
X-Gm-Message-State: AOJu0YyQchLMorx+LabzzFdyUCjy5nt/Ukkr8o0djdVrlmZsGJGCgAHI
	ze3aCJqDQydP8tO+ktqS9MMgvOYXShocCQsN6yIK9nPAeyO5Om+nCoCA1YIutbkrHjIYBrM9Dxt
	U
X-Google-Smtp-Source: AGHT+IEbdMUnXqwkwF4STvGwooXZCSC0iyJoJ3SUNzWMKi25ovPj2MNDtlKqRAdMF/aCFm/Bs3/mLg==
X-Received: by 2002:a17:902:c94c:b0:212:190c:d9e with SMTP id d9443c01a7336-2126a333a9fmr37521765ad.11.1732111037893;
        Wed, 20 Nov 2024 05:57:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/31] tzdata/tzcode-native: upgrade 2024a -> 2024b
Date: Wed, 20 Nov 2024 05:56:36 -0800
Message-Id: <42dbdd9157472d98cf1c5b0f493ccf275ed35445.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207428

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b84b29b1827624270cc1698feda2ee87d55c01e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


