Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028DBC54F32
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:04 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.4734.1747808401056585391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfhiyC3H;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74267c68c11so5579616b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808400; x=1748413200; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6BD0804prU/ogvhdUFE4LZNWLps+rcl77/1l18y1aI=;
        b=mfhiyC3HUYuYJ9lALjFyQGNH+Bv1uI76RX/CRr0+lXkR3vGVCcOVL88l85L8IuBYau
         0yhv0PQRk9TA/vDIyXVdKtZZgMySpDPzsMYPL/hfpptoynTwPVf7sJmch4kl9+8XKnF3
         6owNXv0mdl7g/AVF1cryfZv9kmji+/k7JaNr9/ko66O/l7AyWny4gaTL22O9lc61uSCo
         84NuWWLlLYWesto6W5mM44duK6TZrxlPinNmSYmShr/Ihkzd5CWKHkv3rnZxTDdVAtKi
         05F6FzCLLnf+nP5OQTlQYstB6ES2F/S4pPmVxXcPbTPxPMacnzgGovRtxQKQZL98OKLY
         9Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808400; x=1748413200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6BD0804prU/ogvhdUFE4LZNWLps+rcl77/1l18y1aI=;
        b=d6hAsgG3SQ2V2KAKH0a7NXrX3yEbvEsjb97pBzSgNix7lxxDPcFY2T1Z81BYb9Oa/C
         QYieBZU7sM1oZwtZzBUkXudyD7Sh3NESmGOJBsoaU5Te5nMGdt63YMhZYJIc2Mnobgbq
         pK7k4SDKVHzyQ44Zuknz9p0RjlbF9eztw1osDQtMj/VS+ClYzC9pmSPnZ39CT5EEoDOe
         gTx7U3oOiXZFzUEsF5UXLbcdQwdUEkMosXvS3JP5/iVK/fLwsdQok0MMqs4mKN5V9r5g
         J7oK1492O9rn3nzdo2Vm/6QJGBL6OOQtcVdLbE9+6ONmvDkJ5v1mvq2w+azK6gUpiKO/
         ZLIg==
X-Gm-Message-State: AOJu0Yzu97xDnsTqbzIAhNZEiDD4v35sqcPrVZC35fAVqcLBhkZSguol
	UJ7JdXBReKIA+rSUoQcZexGerOEiWG5zfca7HY1DcwDU7j3ZVQ1KOh96wg4DwODk
X-Gm-Gg: ASbGncsUQ6gOU8ClIxOqgBvtzrejj8neOVZdyRQ3Cu0p4jZGb/KEnBnjdOZyCfeZceU
	KjM/IwXQvnp9RCl+vBfPL9KClNMmIA/bu5et+wOfHX4VoWoxqDGMim5JyXOUWzd7wnRmAwLBbnp
	73817FduQThrS64tJ3re1DRLjOZWp7b+5OHCO8LOikzVyOUNGdet1Nxzh/b4oUTDmltYr4pSCtr
	+SyoJ1DM+LodVAuVWqiKqiltOmhJZq+hsicBBwX7BEo7rxEuHK0miZfstomNo9Yg2TJP5eN8ogi
	Sb937XM7V77aeKAdrRZFGFrHdhM7BV7yfpMyjt2vdVA=
X-Google-Smtp-Source: AGHT+IEhOTKj4H4XxJIuZYkToaDtPYousCfBbOfNW9iq90kDAHuEWo4WxO8s5Vciy5qEBmDMAai4YA==
X-Received: by 2002:a05:6a00:4b04:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-742acc8e235mr30262400b3a.3.1747808400261;
        Tue, 20 May 2025 23:20:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:47 -0700
Subject: [PATCH v2 11/28] vulkan-samples: Disable overriding-option as
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-11-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216979

Clang complains/warns about mixing -ffp-contract=fast and -ffp-model=precise
lower this to warning only, this does not impact code generation, we still
get the diagnostic messge but wont break the build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 554e6eb29022e763de755dd550464cbd986de61e..505b6ab2f2865fec26339c9f1c4aa10c6735355b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -33,4 +33,8 @@ EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
 # This needs to be specified explicitly to avoid xcb/xlib dependencies
 EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
 
+# Clang is fussy about incompatible options on aarch64/x86_64
+# x86_64-poky-linux-clang++: error: overriding '-ffp-model=precise' option with '-ffp-contract=fast' [-Werror,-Woverriding-option]
+CXXFLAGS:append:toolchain-clang = " -Wno-error=overriding-option"
+
 COMPATIBLE_HOST = "(aarch64|x86_64).*-linux"

-- 
2.49.0


