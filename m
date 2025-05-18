Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95331C54795
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.37983.1747603859502129552
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L75Iek8p;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74068f95d9fso3327896b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603859; x=1748208659; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEUWJtTV+Dxn97pQ0jjmvimGwWL7FeMTIR6rhIBY4Xw=;
        b=L75Iek8pr+54W3vuBaCozu43ShVCDqf1GTciWl7ndLgxNOdHLmPu0WNpCCf6v0ae7O
         tBV3TMOszgDOf/9Sq6jXpySd0+dH00DslKP4EfBhJqc5Viea4P4pr2yW7kPW8onUR1sr
         SOXQAUbviGe7HuMeI+hmNABWFRn5qb+kUPyy8W0XH7oQV070XPY+CUWyL1mzg+poJIxR
         RGW/alRsGdEOzCe6/ChC9qKLMNEiUgCcbxRTqH+6ItTd6M8RsdnJ4W8rhcWGKspXYDNi
         b4nL3g8Hxj2RNkwSIVf7fhf3ncHQeSczCizd77mB5tYFB0Xa1Rp4OEEei0lqw7T6oCii
         x1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603859; x=1748208659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEUWJtTV+Dxn97pQ0jjmvimGwWL7FeMTIR6rhIBY4Xw=;
        b=TOJ+qqgvm7bHE/VsiHEvAewuSnaU881SrY5btmUKEwkyM4YjYPhz2XSaHY6mqcJ6Yv
         1x6vmofU36Y6/GH4MEyJSEHuZlJnsAJIS8xL67eQTjJ76PBkYgJyylaENRvGjLZLOlbp
         AtLfeTY5razyXCpCIu3YvqH4zl8Rq/y5IUA/hJ9wUb9UOp0qyrNi2+EBUxL/rl9RCy/4
         N0mrp4oNvXEea72fDcmIHCUgVOMJebFMOxIF4M6M9W6IobSu/Zt1/rCQtLpOekMEQUK8
         0syuHDKceXDjq4zgymO8DgttVLc1eepbCKSij/hwlpGdsadHDY9YrovBwfdFrh1M2CEN
         66rQ==
X-Gm-Message-State: AOJu0Yw7u//wPQ+3zGPNpH2B2rMHDm2Grwy2lKFAk0wol2k8ppaH8EZJ
	jeGWk4BVsIWDcz8W0HORefJ6O+yx8yWyN954mj2ixa+zn1PYT69hah+4evyrcFXW
X-Gm-Gg: ASbGnctZsObKJ+4QVtNQHL4iL4uXvORIDnvvYEAfasGrrJrNqsTaxoVgp1iuOfijzQe
	Nc44Vbcg715eRUQ/b3UZWSyKDvrR9AvZD8mI4iiiRp0VBLJRpIReQS4SsiKGuRpp3vLRFotXroY
	xLqh2TY1LPUXXMbm7G2CCDdiZZ5zBrS8IlgjzwT/lMXnboJQKntPK6NMxEBOW0rE7cKIVlYo1w9
	/USoXLNSdDPd/UM7m5cYMJax0k6CHrgrualuYppxi8mUwXPexOV99LCAvOIbB8cmcKSrRnJou9j
	kmG4n1pU3cG1ZBdjZDaAq1NrdATCvM/cHGt/hqE2Y98=
X-Google-Smtp-Source: AGHT+IGvSbbPXg8+GJwiFTdQXXsaOqbhWO2nqkMgJIAe5+sBgUj2Y4Ht6j7/XKcTVJ+5/aCksIrHBA==
X-Received: by 2002:a05:6a20:728e:b0:215:df90:b298 with SMTP id adf61e73a8af0-2170ce19eaemr14401634637.26.1747603858773;
        Sun, 18 May 2025 14:30:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:46 -0700
Subject: [PATCH 11/21] gnu-efi: Use objcopy from GNU binutils with clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-11-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216795

llvm-objcopy reports errors which needs further investigations but
stick to binutils provided objcopy meanwhile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
index 29d9e695a9213d63d10ca62b6e77eab291615331..cee320a510a117be0b1f4c554a9954341a065d71 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
@@ -22,6 +22,10 @@ SRCREV = "5ea320f0f01c8de8f9dd4e4e38a245608f0287dd"
 
 S = "${WORKDIR}/git"
 
+# llvm-objcopy fails
+# arm-poky-linux-gnueabi-llvm-objcopy: error: 't8.so': section '.dynstr' cannot be removed because it is referenced by the section '.dynamic'
+OBJCOPY:toolchain-clang = "${HOST_PREFIX}objcopy"
+
 inherit github-releases
 
 do_configure:linux-gnux32:prepend() {

-- 
2.49.0


