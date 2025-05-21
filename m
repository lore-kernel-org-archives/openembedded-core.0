Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CCFC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4695.1747808394279818354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bg9S/Zf7;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c9563fafso3010166b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808393; x=1748413193; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXpBEqSv8rf3qkRdPzLv5vu2nWb0mlgocHoTc3Nrgfg=;
        b=Bg9S/Zf7DK1dAW7zpKn2mIES3Q2VmL/me/GtVAJIHdAL72zTsQFwAkQc/TFThc6Ne4
         y7ZjMkxxFqlLRh4hGrwKmJ2EsSyjngfZFc6YwCRZfYveNyKtciHrhIPkVwc4lml88P2R
         Dt62fDKsxNUV9ovXWNkBa/Rj85OwlXzOX8BV6unRFCzmh1z9ACTljeUeJNZRaTJEOYhX
         7pwSj8msXAAifyuM2mtE7WRCu9oZ1w+aOuw5rFpcwa+RzCTBJa0/NJXNFPcj19AwEKQ2
         lY/PMatN/vV0ad6xRg3yAQt20+n1+3A6adduTzxF0nLNoM1IVuaJei0c4dM/8xOAUFH/
         vJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808393; x=1748413193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXpBEqSv8rf3qkRdPzLv5vu2nWb0mlgocHoTc3Nrgfg=;
        b=k9UDugo/qt7+m61Et1Y1+Q/pcQeh613KvJ3v4BMn2157+/U36b5tAYVvkJEdVNZhrb
         9dBP43MzqWLD3UeeYZKuk2tDdT2M3ENAOQ1wn2MHgcO9+QZbutPcKlTwFZWv2kPRcRKu
         mrrrXYW9M4wd4LN0gjKRPtSBXfolvRFHBY/s5QKdic4I/UDizVSch8MWQbWRBe9Ufbbz
         LAdqdy0Jnl7XZbOxiiC+T3ui24xcFEHbsOr0Lb3xpbmtBuaEmsfi63rSZ0E5lO8eg+Vj
         /0QZv2J5xpZ8stnBiyAvA0c1bEVzk0fTXQsKUurMXvSNp0A8jGJqU8Rqe16ZvFn7akQi
         4MVA==
X-Gm-Message-State: AOJu0YwNdsw6aMxEQmRrubYNGFzAKh+0mima1SU2wWxzpTahrm4RBpqJ
	5jHUuFdWTfXiscew7gMMkNjWhemhKJopjNG6jw2J6YnY2abm0fB9pYRIdp+9kj89
X-Gm-Gg: ASbGncvuzKP4+QdGi7m0fAcdwB2U0IgGoULLfoNavJYb0lSMj5bbP8DwWshG6Lv6/mc
	A++jhAuPcA/ZEZ1/K7auOdhN9zc64oWUXgromISEZphal1FkvgiTv2EFUd9Z7zkZ+R65BWhMf8k
	d+ApLV5ZDAT9Tp9jCH8cf+NdMszKz15SuCZUjk9ZVB9rHCPgqGpyo/GnX7fCvxySTVX92Cutyj+
	uOWpZ27prG86a5kTnTODPCOjBeYgyskLN9hRIeazOu6aEIYHXBvcs1joAItQO4sQeNH8fCD48G7
	AUU322rqPzB1PhoNu5+1sRY7X0RZ18ib7N1XhZy06UU=
X-Google-Smtp-Source: AGHT+IF6k8WKZvxL6BjX87fBV2VwzQaFdOGZoDC+Zxbsx6eFixkcAbXHET/Maby1isn1BH72LF7taw==
X-Received: by 2002:a05:6a00:2e9b:b0:742:a4e0:6476 with SMTP id d2e1a72fcca58-742a9787ae5mr29425384b3a.4.1747808393400;
        Tue, 20 May 2025 23:19:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:39 -0700
Subject: [PATCH v2 03/28] vte: Disable gi data generation when using clang
 on arm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216971

Fixes Qemu usermode crashes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vte/vte_0.78.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/vte/vte_0.78.2.bb b/meta/recipes-support/vte/vte_0.78.2.bb
index 0593d16cd8678d010c240581138caf22f2908659..e37d59833cf3313bdb369f4e0957dfc5e3cb3ace 100644
--- a/meta/recipes-support/vte/vte_0.78.2.bb
+++ b/meta/recipes-support/vte/vte_0.78.2.bb
@@ -26,6 +26,10 @@ SRC_URI[archive.sha256sum] = "35d7bcde07356846b4a12881c8e016705b70a9004a9082285e
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+# qemu usermode crashes when using clang as system compiler but works with gcc
+# see https://patchwork.yoctoproject.org/project/oe-core/patch/20240923234336.3978188-1-raj.khem@gmail.com/
+GI_DATA_ENABLED:pn-vte:toolchain-clang:armv7ve = "False"
+
 EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
 EXTRA_OEMESON:append = " ${@bb.utils.contains('GI_DATA_ENABLED', 'False', '-Ddocs=false', '', d)}"
 

-- 
2.49.0


