Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0F5C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:51 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.3741.1657094852829277067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VY9zlxou;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g26so25667719ejb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=udVIpBGmDVGKerOzfV/8nszV3+0LjucRJXKuz3iWod0=;
        b=VY9zlxou0O8382GnzpYDAIJpIZnzA8hRqrqXnt/T8b4g1l3x9tjYT5r4PKnDwzVaYy
         xrRZYXoNDwA4tVM7MOIxIKIy6I6XRCTwpgenuYTG2Uwbq7/EmXPpg+5tc+4JTwJUS/UZ
         TTuWZ0XbiAMxYUdwLvDIuCud0aIJcneg7JQx8OguUq6EFjkbl8w6BP/8Zy70q5TqVbk1
         xq7YR2mRQGjqyQCkSoXuGJBlxMC+BX6SHAAPf9lzcTOILAwX4iKGTF0xAhj22wX7eNPw
         FzQrqt0CXDkAoXGDkCz40OczLdvozEz6xXdRqgpHUZnA1p1qTyN7DILifv7BOROT3RsS
         CMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=udVIpBGmDVGKerOzfV/8nszV3+0LjucRJXKuz3iWod0=;
        b=FpmwpZ5uvTS+VP0amWbS4N+QOYrJFaSgmJhz5naguabpC66/7U/Se3P9/UeV8szfI8
         PR7AFfVmBtMVLl4ZoOYngNe2CcOGDATi6DQA2jDb6heLnBy8azeu3QlCZTk0f6HnpgYl
         jMoGNSQDx69VbXVie8NTXp+9xW8WkuiG8xS6yUiBu11NuFfphQXCXJSABL/L9+wgxKRU
         IRctJumCGVaGO0P1Ajwye9EoDew89TANO43QUYZ0m5jvp+T72NSzcevJAdP5dIEHsodz
         00+BOiGg89zbaZEBMsAXV0jrXne3NHa6iueiMOBItETaya9JW5jr3YmXpmLnPOssltsI
         eifw==
X-Gm-Message-State: AJIora9zRbZ+4Fk/UrSVhx532ByH0GqWgr1Rd5MhCH08nlwM9cUY+bOK
	rD1pc5we3eA1f2ZznXvN1/rkatXg2eUMDQ==
X-Google-Smtp-Source: 
 AGRyM1vkNU+6ZxMG+t2U1Z4OVZybBJqa8m9tuJUyp+bBGZJmYqas4ItAsr9hkxmbqUXSNRh4HlzqAA==
X-Received: by 2002:a17:907:2081:b0:726:b8d2:fba2 with SMTP id
 pv1-20020a170907208100b00726b8d2fba2mr36705426ejb.686.1657094861306;
        Wed, 06 Jul 2022 01:07:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/27] python3-cryptography-vectors: upgrade 37.0.2 -> 37.0.3
Date: Wed,  6 Jul 2022 10:07:10 +0200
Message-Id: <20220706080721.3072553-16-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167703

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...vectors_37.0.2.bb => python3-cryptography-vectors_37.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.2.bb => python3-cryptography-vectors_37.0.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
index 3dbdc8ce3e..8c0a7ee9d3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "7c65d3de51756f418142df605417ec2c6e961c364f70cc8a103030889d5a3219"
+SRC_URI[sha256sum] = "ac90c1340f73bc29b3bf964120b2db5f8e98e1fcf0074d85ddc871541974a559"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.30.2


