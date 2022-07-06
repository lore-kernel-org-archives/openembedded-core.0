Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE57CCA473
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:51 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.3674.1657094863550701397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X/eLIEC6;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id e40so18236683eda.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0rU923plYJ2E1R5XoeA8aXOnc+NU6AjqdHlxgqMPwOU=;
        b=X/eLIEC6e4pgQGJm4vpf/8OyhVyqMWXEr7328zxRc7IiW5lCZT6iXA7LbGC66Kwv6U
         Axy+DKLj6AlrCPCq+bR4TzLtb4vWnMWS22WD5rvcCh4iXf57PhOhWNCv37wWHZvuORBY
         Wl69zdi07xAUrqQ2tP56toor9uwiWy7kxG/sCtHGRrJzy7adAoz2bMP1lVp6EGCi21sM
         Q9TMmRbXhFUubvHThhJrAmlgNbdl2/xILUkkZ3tiyjbkpGGDMEZH/hDB0TU30vbvfGqZ
         7uTuKJBccWGgKCDdQork7dgaLMeoGZWnPrvePEoOGypmDuaU3d3kmHP6WbdupjHR7EWI
         YmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0rU923plYJ2E1R5XoeA8aXOnc+NU6AjqdHlxgqMPwOU=;
        b=untBV6M4KgLAd3ZwiURuIek7wdY7Cx6fEnKkAnTKKGqgAUvoYK/zjElu1Q5TkgZUHk
         x0abXvawJhsfLScxzHp/hAFdAhdn8iMAmfhx1F8zjnHc2kLSZuC18URqlEIrper/TQkV
         AEwN/o+rtSGqz/PwtQjPhiEm3QpKpwgu3sOVwSCP3LF2ibikqDesGhUPcO/HfXscQ5WG
         qJX51pjhEcoNh0ts9OvU6QUkWjjjdw+OXaurhVxnDLtbfbtlPf7ERqoTAPU+Iuv1bJXi
         Sr4YUW8+Y3Ra8zfqf2dka+e+cnB7rp10W/fluFmHcGWQlu4Sf2okg8k10jQMevwqhHuT
         trRg==
X-Gm-Message-State: AJIora+MnNfiC1WGCojzTlE6kmfqsVu4Py+bow4DxCu5xuEHTw5Guogg
	LdA1Gbuws7jNLGGYXXZGBklivZ+SPUmRkg==
X-Google-Smtp-Source: 
 AGRyM1tcDQeO24b/kCKXZtRK7P7m+GUfpmel8Hapucg9nn0gIVjxOI5y8ttAfRkbYl8+Zc422QUSRw==
X-Received: by 2002:a05:6402:c0b:b0:43a:25ff:ff08 with SMTP id
 co11-20020a0564020c0b00b0043a25ffff08mr24263923edb.148.1657094862124;
        Wed, 06 Jul 2022 01:07:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/27] python3-hatchling: upgrade 1.3.0 -> 1.3.1
Date: Wed,  6 Jul 2022 10:07:11 +0200
Message-Id: <20220706080721.3072553-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167704

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
index 6e7ccd743f..fd76a28fb1 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
+SRC_URI[sha256sum] = "aaa63019c9d666053d9ff318097335e766123844547c52940155c0401c3c142f"
 
 # Until we have a proper tool to invoke PEP517 builds, hatchling can't
 # bootstrap itself automatically.
-- 
2.30.2


