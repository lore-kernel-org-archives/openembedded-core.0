Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C121C27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 07:01:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.15360.1717484505849721180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 00:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vc9YEtr4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42120fc8d1dso7116525e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 00:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717484504; x=1718089304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpYJdKUXgkbmyMGEsJyH+uOm8ZJiqivBLN2CAX6fVYg=;
        b=Vc9YEtr44NQVrTdsAaa4vSSsqfTLwKXYCUWratnsoLRRWBpsunaPpyKunUOx5uoL0Q
         DhYj/Wp9aoT/kdwFOmKjjCYoclF55hHTc+opWhh7+huUre22VEwHhKSoqDwLwvqM2qpT
         4+8IlfNu+9UUMDFeFhtLiEoJ57THoJEzSWxlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717484504; x=1718089304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpYJdKUXgkbmyMGEsJyH+uOm8ZJiqivBLN2CAX6fVYg=;
        b=vImlXpRBShzvhFoOtFubXligDce2evMT/SgtTmKijcroDsgebUyU4WK2Q3QUKw8d76
         gvYDCNCuTKt5MdF8LG92AmXuEER7mdoFV3mLRCS1ErohsjZ7dN/8a/AnwGwk7IDpgbxh
         9bNTTHAbqRExpDpfEXzPYEKZccxfzPGtiqnjNHnoGbmVIqmu2gk7nfE+21SrQ9hKsnBU
         tA/EXp6twzsg2wajnGjv3rW3z3b7ePxvTjtlGiUvsNo5/yozA9+xdfpB1pWWRg7RJwDb
         WoixqtnzgaHvPScV1MbaBydGcliJ0y6CdMQlc6KakRbtKGgg8Fdshlu38Hg2/f8oAHpb
         efyA==
X-Gm-Message-State: AOJu0YylT1AWljA89KD+1hCVKh6pKFw/K7pzy5QYbIcqgYnNu3h06iD/
	B7G+gPq8rVedq3+Hw/Z3N4ebtaLMRM3B2qZcoGSs3WsHjx+dlKvoTVqIr2NvTWw6P6g7ZK9LRmn
	S
X-Google-Smtp-Source: AGHT+IEigOl1hC2DQVN3T5nVleflKQcul3NIvHiO9KBRuJgNsi2GJFMdQtcF/vTjrVRXcE8LuRliYQ==
X-Received: by 2002:a05:600c:35d5:b0:419:f3f9:8ed6 with SMTP id 5b1f17b1804b1-4212e044bffmr105799525e9.4.1717484504126;
        Tue, 04 Jun 2024 00:01:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a5c:ae3c:1b90:53c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421387ea07csm92461785e9.15.2024.06.04.00.01.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:01:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] nasm: Upgrade 2.16.01 -> 2.16.03
Date: Tue,  4 Jun 2024 08:01:41 +0100
Message-Id: <20240604070141.3609519-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240604070141.3609519-1-richard.purdie@linuxfoundation.org>
References: <20240604070141.3609519-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 07:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200296

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.16.01.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
similarity index 88%
rename from meta/recipes-devtools/nasm/nasm_2.16.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 219cc493603..281f3940e7e 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e"
+SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 

