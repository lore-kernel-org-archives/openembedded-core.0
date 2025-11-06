Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4970CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 17:30:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3484.1762450191036260264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 09:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LvCRm9ZZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29555415c5fso16252705ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762450190; x=1763054990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w6nWt+kzEa5UYwr/iyUYspfk86fbkNPpdLrhjETUCo=;
        b=LvCRm9ZZy2q7qUFc2slznLdRuuEXIzj3fYHABvTtW1TkjXlJGrS6H7VECmGr7vU+g6
         x/sqHrRR+/5RB0VdC1LitzB8GpwBysjCwqG5dRR2S675hoaP0np7coo6PDHqcrlYfXdS
         8FKJPexkB91zbQKKSbfImV3+183Gl2hiaQDoN2X4FEFHB9Ni0WCUkoEkzyXoTT0ocena
         BSuLNtT4DhuHqgIGRlXaDIyoXl19T0PW+D7dfPqO+Afb2Q2TptjPtj5eigPtSdsZV5CK
         eJMjAdiKsOdzsgude5Q+xZsR63anBPGH+ux8qZ76gfGMmNb0FDyKAjiKz8hCViM27kPE
         b4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762450190; x=1763054990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8w6nWt+kzEa5UYwr/iyUYspfk86fbkNPpdLrhjETUCo=;
        b=Si/eVKNKDHimfKPTNwrjb0DK5L/jqagh333BCYAdohh7DuVY48ZZd1nlQMOH9PxHAU
         ghKDkc3AMCWonc3oR4K24hbh3xRbiZtW2Ef96XkOW7Ymi0bsifulL/dXBr9yB09OILcM
         qdEi/5UVfjITpuS7IVVE5yCbXY0SHXcIGc70J8DyuSK7vMoi4zKkybbm0lYoBVGBHX1S
         egLn6wbwfedLlZmx2A107JB0ZSiv7f8/7c5rrk6YFwBYT204qtEVXd2bUxeJ5lLr/2mT
         Si49t4Tgx/6JAcpGIJrILjgF5Ym/q/qY5Iz3nNSX/Y2WaEMg7Bos3i4xAVblYMa36Kwy
         YBPA==
X-Gm-Message-State: AOJu0Yzz/koWTYR9sXoc5KZFSuWPrpmJhrn8fOIKjUuaUzUzIM67+zk8
	swgsLy+oeOBWc7ww+Y5E5BkwPsD9qvbtJEMa5KSn572goKUgVTq2uSBasGTTtzHr
X-Gm-Gg: ASbGnctq8AwAexgdfEb+n9oji88AXCsk90dVjQRIWy2Y0TCi4vKoJroUIzupAOcVdD0
	p3312XjGuGOZHm6GE9pGQXSXwBE7L/mVlq+sau2AGoxa5DoyE/FVIXFGGkM8a5Q4dWpmx7h4sFy
	eBLVg2fK3ReKEw+4FUVRhghS5zj9A9LcQLwCXbsIN/wmBFlT9O0k7bOhsdn9NZgtCMvA74c+J13
	3tiOh5Fs9vwGf4jIRZjPnG10z1B/1Afmf0wQ7yHVDz1ZRV7pQ8CejhOkznCbeWeuYtl5gYmLDzJ
	uotnBum8zRZBz6lCw2NIke/L7I5hIVEdPC1WslTzoLX8WB8Y9ZeEcK+apdSf4k9hh1u2HuU8OxX
	kk+FWUaz5XqFUm6BajEMVdXjr+ZHYhq8Et/5GS9OQPy1o2HUopavzNOnItikqIqxBqUQ2TfCQor
	SzraUj3Zgts3K86BQLdKC+OEKXbaMFqEU49egDG69Rf5TCho31PgADFbzSm0MFzGp/yldPp6kn
X-Google-Smtp-Source: AGHT+IES6gaKS99wEYF0m32SfUL8WghhrWhTgIp8O0lTg3GmyMflCVSgh7V1gNO2Vczst9AXkhEVYw==
X-Received: by 2002:a17:903:fae:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-297c03c76a7mr3200525ad.19.1762450190187;
        Thu, 06 Nov 2025 09:29:50 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682b4sm34081915ad.12.2025.11.06.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:29:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] spirv-llvm-translator: Upgrade to 21.1.2
Date: Thu,  6 Nov 2025 09:29:40 -0800
Message-ID: <20251106172942.2654398-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106172942.2654398-1-raj.khem@gmail.com>
References: <20251106172942.2654398-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 17:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225984

[Backport to 21] Implement SPV_INTEL_predicated_io extension (#3370) (#3386)
[Backport to 21] Fix incorrect translation for AtomicCmpExchangeWeak builtin ptr arg type. (#3390) (#3392)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
index 503e7df6440..763afbd6080 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "29758b55816c14abb3e4142d42aca7a95bf46710"
+SRCREV = "a37544fc0bb90b4e8b8d755580119c018891dfa4"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "

