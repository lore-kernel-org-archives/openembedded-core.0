Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7A5C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.60660.1745875582420445271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eLYJeQey;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso60009305ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875582; x=1746480382; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=eLYJeQeyVxECx+HvuGfDArjOeYxVS4QQH1agLxxgAQ5/QNobaFEoDRx4gvx//VgqFG
         nZ/SEA1Hr509/R32j59C9pcAd7mj17Y6v7KbAhafL2PcxeqhinI0TfKm0oObdiZfWaYB
         NJYwgpASDCzZEQAAKdbHHq2N9/WZ1luUnz/WUZPfaXpUMjsqczB6IO24I5Kam4tm8Ifn
         f5YT9x0q6Al1OLsJNS3fC+fHe/+UN5jrAZuMD19H+FvehAhnGhflGbtpjLJ1ElvBCHll
         JnMtjIp64Cupa0LXKpbzeTP+rO6lahk3EwcV8INBV5pulV2S/jx3+SzKt7VYTg3fIAYg
         8UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875582; x=1746480382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=lW/x88QTKAbdc/1tRkgkB8KMfKTGqgnwFGL6N3o8BkVKSZV3ojf3bZO4A5/UEu8Cck
         9BlAYZTWE2FITPFShXoj3bx31hPo8pylheTE8wpI2dabydEhotvRaMmpuOcgiG8XGtV1
         T81X9HuWXOIsTtOrh3XxkHUtHvs51IuXlbx/XhcWoJk4Fc6Hpdgv1oRXQ4WrVtOM4de/
         rQBT571l+AmacWnnFJnYh56wOX63ryhrji4CnBbrNC2xymk1JIc4ctO5sptK1DBB8lka
         uZ5YHDCC8Blm8MP0jquOt0wjbNXLAnm3jFjg5tYJfJXUFwCWqLvnoS8M2uOAimCwPAcy
         Bccw==
X-Gm-Message-State: AOJu0YzWiTUOwJIV9S+7Km56uaRrGYSwATeWdbie9UkoNTLFUjw483n8
	SqEzr8vJu6M+R3jEazTQ1nF7pLXNm6+e3Pff6yGJqcpd5MQIWp10vu+gak0m
X-Gm-Gg: ASbGncvvjZmg/5YjuQsTFn6gHDV9hDEfUsLRmp/YdG4+pyj478LTcJeNvHzsEJYiUDy
	cwHUwV1lqx5NvMwVez+01snCt1rDYaWccjQhagTcOIoPh3MSeO6AI8jMxnoCZF8ggZCl2btsWWe
	7G9mcKlN9Mvy0/cIcvtB2JH8wxhlXX9O7RfsKzRnE5MNFEi4b3Lf5r9jqsnwauOMjOkQCxKZB5d
	oqIFWgvrxewjuJbAjoNagYafEC1+UwT7nwQxBXT/IMm/o1hji3hGj4bM8ssHkINlZUy27RgULa/
	k7ydhwac7jTvJsAJut4TBhlUyLAjvD0l
X-Google-Smtp-Source: AGHT+IEeWmr/Mty44Yp7/sWedwCLKEqWSBHQk0yrBmfx+7K/1JGcq3BmK/k8eZDO/7AEXbCsjWpqIQ==
X-Received: by 2002:a17:902:cecf:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22de6f2e40emr9798275ad.53.1745875581761;
        Mon, 28 Apr 2025 14:26:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:17 -0700
Subject: [PATCH v5 02/10] toolchain/clang: Remove duplicate RANLIB setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-2-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215636

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


