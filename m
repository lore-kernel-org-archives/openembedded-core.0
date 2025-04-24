Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5ACC3ABA1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9733.1745479257699741634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKCd+309;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240b4de12bso9628375ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479257; x=1746084057; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=kKCd+309I3MWyhAhhqYm1OTCi12St2DbJ2HtdxG6z1x4tCdHA9RNd0raIivBxsD3Xe
         lcWQiCVV6nOFnU7cqezed5WGqB5o6A1P0sjCDubo/4Dl9IO+AVTnwskLTz0S8eZKCfG+
         eEXechACKMcIO9V3m1TpxX1NOdzCn16V+GIHhNj0QvlAxwTcga3dhb7vheP8VWFSbuEb
         zNRBaAXbXKLl05OmB2FYI51jPc/nNXu/ofUzZw1Eqv0SetfSJqifc8g6rDc4X83Fk+zs
         6KsdvbTEs2+MVuf+MfcwC3WoaKGfqn+79ZhTV0B9bdURfMQVecex6kj5HhHPV8Hq9fQK
         DnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479257; x=1746084057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=V3/catJwXax1LXGmVv15i9ZDSzfNOUuu8SJ/WolVJcv5ndA7Trv5PJL82DWLZqjutz
         NEBwWr+5aYC6KsKtXvyFmCvR/wRgp28ejIC1w2VsDhuV+s7D50Q7o0EWLwNL2+UvvVvN
         tuENziFXdlM4gadym6rknsCUm3TPYpFuqkwzNMA9m5o/cuHeWWIAph3/mslk/Ovpl2mF
         Dp3tJl5Lb8gQdqGpuQMWX1DMssASxmHR9mTF/FPB6NYK2Junp/98j5mRD1kJbbJp5PTG
         8m8qPBAbYZm5HnmhzRxkOs9SVty4cjuJptGEenEdE31aTAIehnuM+pcPhxkiRd5tlaQt
         4g+g==
X-Gm-Message-State: AOJu0YzRkwDSSuLeyCdfCxS7+2Iy2i9xTudgLelsqNN6csqSc35gRerV
	+ywxTu43czDsRDcWSN4/5J5c7p2/fr142H3ya8tMrK1jGiNLQkZtMJ3aLqy3
X-Gm-Gg: ASbGncucTSmzTbLxiJoT/lbAlIaS4M/BntMuMe/SFAqXH0sneJliy/g7rH3LxVVu/C+
	mk900Un+S2k2dD87t/UXBZkUPUi+6B0nrP4iq5daQrvJ8TxCSxKiG44WUq9Ymp1/7MyRhVVyI3r
	Ay+hYJNhAibtLpZE/EV7nmijrPnmzw9zycHXG/7sJmk1SXkzEQIKpCIiANz/XIlS5rIpt/x4Mgn
	FbMra3YL7gfsRH4HNaTaj+Zap6mnnKTRdHUXvAYV/VyXKj7NrRID/TtqVUoqBmMWdNhZoYACEK5
	K5r4VcnkRwy2kk7Kkhb9zXL5t2HKqBpkMSupsGG3RHI=
X-Google-Smtp-Source: AGHT+IEjOYFiJuBYqJ+ohsAfOZOoLlOvI3tliqoVCgugm4p9HhtEXfbGZWD4YMOwQGSuHFMdT2STCg==
X-Received: by 2002:a17:902:e891:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22db3d9861bmr22718755ad.43.1745479256965;
        Thu, 24 Apr 2025 00:20:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:39 -0700
Subject: [PATCH 05/11] kernel-arch.bbclass: Do not use weak assignment for
 TOOLCHAIN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-5-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215331

If a distro sets TOOLCHAIN with ?= or = then it overrides this
too, however, we demand GCC to be in there due to KERNEL_CC etal
Make it hard assignment, it can still be overturned via a bbappend
in that case it is intentional to use non-gcc compiler for kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 749a266ea36c04fea34fd60d4b93d340db998936..7aea9cd3e8e3329412ddee07e2f3d43a7722ad5e 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -81,4 +81,4 @@ KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
 KERNEL_STRIP = "${HOST_PREFIX}strip"
-TOOLCHAIN ?= "gcc"
+TOOLCHAIN = "gcc"

-- 
2.49.0


