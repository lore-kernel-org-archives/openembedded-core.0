Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFA6C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 06:38:42 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.12707.1751956696582893725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 23:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=APC1Sj0u;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234f17910d8so35333865ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956696; x=1752561496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Lgx3KZb06DfCQ//jyzPowmIRZgC13YmMF8G7FIpMA=;
        b=APC1Sj0udNr1r3U+V0ruk6DB5CpPpBctGQrepqJ68Lhm56jQUSmTX+rhTi1B/xPYyP
         c6wYrZ/xR6SbwlEsIAnUJ0Lv26bakzoe2NCQgNOuUzGeDbuYxho0Fs1WumH1AWyAIx/j
         qFOdaBhRjg16ZJfS9SQp/OfL8lGOtY9bBQtl36T3Lt5B+7I7UvdYeb4MVh1CUR4UssfX
         lqNIpUzTb4fNiXQ542//YA2rK98lhX9L4vRYyohZz6tiwuKRa+I0D8vQ7FCZsTYaLPYB
         eIayKQ0pPsBck0BRKSqUHsAtCm5tB+HHX+injdxsNq8vs+6kAzFPrxSspJF77TCHg1yH
         0w8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956696; x=1752561496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4Lgx3KZb06DfCQ//jyzPowmIRZgC13YmMF8G7FIpMA=;
        b=qjpXAGhgGRPVDsbnBOj963/5So8yHsaSr9fkpxbykpYtL4yECsGllXIP2BsrEEtRsN
         YSGOowEsnHuYjW2ey6fBhhioyqza5rKeM6UuEhBGCI9Fl+cDC43tqWXoQXYEsi6+gPOc
         digkuUinj2CqU3Wpyz9AK/qekdQOBsYey07oso+R+IUXE6ofoZ0MtqHvbbN8Jf0rRt/K
         b9kGwcJVrnyW7KXm6Xhm5qjqpgAwf0gIFqZqvlkGTVtILMn2XRKrlpAvpUSFh2zAryff
         cBHqWlMsGLe2gC08VOkPNGA/MlyH7CnLv8RrQ3TcuROc8n4AZB7L1mXhH5I5S76O6L/T
         MzXg==
X-Gm-Message-State: AOJu0YwQpUJNyaKbRF7qsfIAWHisDikZvEdl7ZMazY3oC9SWMFhlBxka
	8CYo/UTE2sAxlrMS9Lg7GaOggkEd2z+Dj3EA5g1+tlttWaMYyV+R+tUrpYpoTJWW
X-Gm-Gg: ASbGncsxRAsy0CrJVXPsYmWdpwGlX0YMVklQD0tXAC448346hx6/t3lRUGMURhkqHxD
	e9Z5ZBvvFUAXRGQZOIiiE9DryfS8NhHHWslBGMrMTw6/Jmq6S2Ir1rhtTcP1NNDnHASmuIlr6ko
	tlX7PSLxKXMV1FUIKnerbU5Ci/tzdgEVsN5rd4uyp/GUVbm3AQxk8cORGVRg2pwijBOv5MT7tMM
	O/wFXot8EUhKgSkf6J3oFEHvHSfcthOFjimjyUOFolZBskTmJffm9H4kdQ+1b6Wfw+UQ6N8DgRR
	PgvjxOTDqFSkELxFUjy/SpudToQOUyfw0oH+LNtrqNw7F4JvLHTwQ3g4Ju45tPk4
X-Google-Smtp-Source: AGHT+IEGu3Up4mFrU0TM+ETG6/gnae4SsWg1ybZqjYIedgxZXj3yyw8fTKRpbst48awgXeCpAcy0yQ==
X-Received: by 2002:a17:902:cecf:b0:234:909b:3da9 with SMTP id d9443c01a7336-23dd0afac11mr29439685ad.27.1751956695569;
        Mon, 07 Jul 2025 23:38:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e9e1sm107839795ad.175.2025.07.07.23.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:38:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] spirv-llvm-translator: upgrade 20.1.2 -> 20.1.4
Date: Mon,  7 Jul 2025 23:38:09 -0700
Message-ID: <20250708063810.1921024-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708063810.1921024-1-raj.khem@gmail.com>
References: <20250708063810.1921024-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 06:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220011

Details of changes
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/compare/v20.1.2...v20.1.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-translator_20.1.2.bb => spirv-llvm-translator_20.1.4.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.2.bb => spirv-llvm-translator_20.1.4.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
index 4952e8ba4ff..14e4bb74ace 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
+SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
 
-SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
-
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "clang spirv-tools spirv-headers"

