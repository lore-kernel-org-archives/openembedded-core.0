Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2C3C6379F
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3938.1676835090265726467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Np/mUIPM;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id s17so834093wrt.8
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THx881h6DHvssYYtYTu+/yOsDvorWwT73kxJBZjqGu8=;
        b=Np/mUIPMwQ67U4Aa/n59y2yNLfA/ZER8EBAfg27YmS+FHE+jg1p7IH3c3cmZivZEE2
         BtXqbqLL5SU7K/kCCd8UhUX3AQlu7hklAYAFPeW5gHtXq7iwe8/YB3+H2XetgzZJlJNt
         Sa/+n7awJ92n1GnXL2JhweM1/3uVVUP/HOmz5Rk+PYCt/zj4L8+QFZc9Ig+Kk5C7JW+7
         KAvIm3Z+qBNBQU9Xc/HNzx0EU/h7I4IlMC8DTP76JuCjg8k9G7yeYbQSSIAHKQhxDMry
         6RGEZ88R1lEdesjsGm/s/KeAxME2NL2vVmOQZsZ6lpdDPuVXWYuzmwGVcRonIBNaZ71p
         PMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THx881h6DHvssYYtYTu+/yOsDvorWwT73kxJBZjqGu8=;
        b=AM0Xe1UHblKkuRsJkCE6vDuyUFZjxxmtiXTTAKlheewgzWbP+bcuu3zbqXk6EU6FAq
         odlZ2SeqVZjTGauEXhc3xpGFMskDf8uS2AsdfteULnWVanhgPDfZb0IQc822juBoA3lm
         vu4KaRyif0S67CpLx217tBhcx4oPUrGJDWoUxpOVDKO+5NZcae/8fd5MaQwaeQj8MHW/
         xU4aAYu3nTMJnzcLfqZjDJlTuotmZqh4PSeUguuDkeW83u1RMOd9ubk7Gj9kxiIFgNJX
         3bFb/bIOevyye5I8FueRDINvIphapQLJnOm8jYf3GRhT8kz+zp5G105qXZVsdKmyhIfK
         PyIw==
X-Gm-Message-State: AO0yUKVWvS1tpvN5u7XiMWDl+XKbbkB0DbQpURqgbjRwcC4MnWNHr2Z2
	uxNo8JNurIvMEPZfroe7OI4SaA+OJKo=
X-Google-Smtp-Source: AK7set8100lfQ76t6O6SrHKac42TDtxg/Ih1osfWdRyj6nC2xrStiiEVorPyMQq6ws9pVvjmc04a4A==
X-Received: by 2002:a05:6000:100e:b0:2c5:4ccc:a770 with SMTP id a14-20020a056000100e00b002c54ccca770mr1253719wrx.7.1676835090970;
        Sun, 19 Feb 2023 11:31:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/39] python3-hatchling: upgrade 1.12.2 -> 1.13.0
Date: Sun, 19 Feb 2023 20:31:01 +0100
Message-Id: <20230219193101.338397-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177381

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-hatchling_1.12.2.bb => python3-hatchling_1.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.12.2.bb => python3-hatchling_1.13.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.12.2.bb b/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-hatchling_1.12.2.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
index 7f5a29879b..17e7f86ba6 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.12.2.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "8a6d719d96653a0f3901072b12710c9c3cc934f9061b443775c6789b45333495"
+SRC_URI[sha256sum] = "f8d275a2cc720735286b7c2e2bc35da05761e6d3695c2fa416550395f10c53c7"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.30.2


