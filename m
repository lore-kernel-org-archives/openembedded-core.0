Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03F6C369D9
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:27 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.2764.1745634925602662887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vx7MYKPW;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af5085f7861so2199299a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634924; x=1746239724; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=Vx7MYKPWO9EwK2XWhMh4v9xDwr8yBlTfSY//PcjSwtugUjNGDe7SYC6nCjIkDrP7Qr
         Ws/P7Mr5i027gFERYJN1acsGA7oV7hzQ5NfbTDz4AMtNk58NbwA50SFo+vqtYiv6dvk+
         UVsCYyygLxopLgVkH6TUmUiA3U+L7CwXjlN65u5MiMuWMZ3nQFCuXmbQHQRCKAKsO1gY
         VmDG/j0PTMApVCHwJGa8d+6pLx62X+vj085cERtZSQ5u3j1ACKOsew876tc09+EnFCIn
         NV+LvWye8GR2oVNPZ1116Xg1hO2ur4KmzZZb7Cay5+H31631JF9jvc2C1EJUQxrm5dKq
         WxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634924; x=1746239724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=BH3b6yWqh6EtKRKXvIVxcrZi8JdyjH4VWUdarLwBS7JBOIFbPmziVM8UOdgxk8BfZs
         lj04ICadhwWijuapOlxmF99D6cky/Dmb/IHGhZemKCtCImAPo5wIUkHKfc/RPWe++y0F
         D4+iay8fvO/hccMEx2MjrHXtwvTu/IWEDXkGnyTK0n1IJtGv5+mmFBF+zCvLUisAvZCX
         i9FoLhu+dhqzwVI3Bll6PL0EcW06aP2DdWr/XZPAdteCfSQSUR45GdadYsKCEc/jK1yV
         C5JfU1VYBYazjKXPfY+L702DVz9VGPSKPsaATQ73DOjs8esCR7UHrnHBnFA1LzrrBblN
         qVTg==
X-Gm-Message-State: AOJu0YxTtRdWf/XThkrKk+DQIz+x2ZpEzPXEY1XCK7eAfeupzwr1XKZQ
	qvxpWb05ncNE+u/OUpWC/cMilWa+Y4IwHmFQ5A8AiRuLHGo5hyDixY1JiBaF
X-Gm-Gg: ASbGncvu2H4ff8jEY07zQyOqNFop6qgLrsMWafMinzzNkOWB+HPEM3IU2O6/cJocv5k
	1otwc510LBQ0ibS1k2SaCvj7VU1RV6waEaSZL6Vm9MnnM3L/FEqoB3kXuYy6zZa4stLclhLwfHL
	pt/6Szec36lQfW3KxXQ9WnfSMlxVx+XBWWalJnYOkuptw4vzHA3t/t/Zyiv9381FXiE9FlXcMF7
	FPQJia7AFJtAaxcQ6Tb7J772dcnvSLztPsEUoUPTod2x8lsdpZWxTTiDJFfkwkoahGUrrqViGMx
	8SvBLAJEu6RFKlEv9qhcEn7Hj+jDsFnx
X-Google-Smtp-Source: AGHT+IGYlsWzQObMiGpic8za4GUetOrFjyg32hrFQDXrGYOCyon/h28EF4fWoYckOc1YETL6n0HQUg==
X-Received: by 2002:a17:903:2a86:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22dc6a095ccmr29904965ad.22.1745634924427;
        Fri, 25 Apr 2025 19:35:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:04 -0700
Subject: [PATCH v3 02/10] toolchain/clang: Remove duplicate RANLIB setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-2-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215501

Its already assigned couple of lines above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/toolchain/clang.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
index 40bfba2fd4febec0d7316a51b10fccda3363c43f..0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/conf/toolchain/clang.inc
@@ -7,7 +7,6 @@ CCLD = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 RANLIB = "${HOST_PREFIX}llvm-ranlib"
 AR = "${HOST_PREFIX}llvm-ar"
 AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-RANLIB = "${HOST_PREFIX}gcc-ranlib"
 STRIP = "${HOST_PREFIX}llvm-strip"
 OBJCOPY = "${HOST_PREFIX}llvm-objcopy"
 OBJDUMP = "${HOST_PREFIX}llvm-objdump"

-- 
2.49.0


