Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190ADC25B75
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.17320.1716290783895246770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CNEd8DCd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-354cd8da8b9so888357f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290782; x=1716895582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGKVBrvL1ag4bBw/mmIuG+ZHS1WMMQYt7YmuzyoR+SE=;
        b=CNEd8DCdmxbINzGSHJJ3zrtJI7M35YRThG5hyGV0rGdv0qWG4JO07WGkp6dq8Fx/yQ
         M8WpbVYREJHxxlpul1OqOSPy3JpnJ3pM6utJ/1OzLXBxoLaYqllvRk/vh/CZ4hCV079M
         z39T4m+TWDlsioGfnFLJ1+OEj6Q/d6bpG0p6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290782; x=1716895582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGKVBrvL1ag4bBw/mmIuG+ZHS1WMMQYt7YmuzyoR+SE=;
        b=pOPUGYgjCJ+DWcujOAg9YHqLNJ0CgV9aaQv90aWRV5XpAKtZgo/7C/TIpLAHS9nrSA
         /a1GuEhhVfP5K0obXjfKBfZ9Qpv+eKEn2/yBtHCf36lU0rWwBXbjlfNCXhn7oV7cS+wC
         +51VBmfkaMNe4OitQ5dgdI2hQWb8Qe2mgAzkXKu7HA1BpHuL0JZOFAbcMnYx0aB4JBfb
         rfgkoFwr+IIbjCpkQBQkHkS+SUD7gX4dBcfC1hDKZ7f9jJCcaX76VMC/WVt4AYLjEmof
         NRIIZxDC1T8U7/5+NDymx/hWEIbkjZiIAsE/qrabSbqRVPkSdPzYlSouxsp97J/qMKM0
         jR7A==
X-Gm-Message-State: AOJu0Yw/7u5m0nLWfNyyCNboR+gqmDhRfF9SOeKz0UxKcY7vN/ZhSeWt
	Qu5JKkiip/xBP/0F/pNDBgmMyfGi872qIuswni1ZkQ68Xh21DBq8DZc18MGIeWBGapDh0h+Hq5Z
	G390=
X-Google-Smtp-Source: AGHT+IHB0R/qjw1MkwNXVp/RNO5a1lyiQoZhfUattAbxh4k1ktNllLqYP+PwlvdXrr1NfE8R04uDiw==
X-Received: by 2002:a5d:698d:0:b0:34d:354:b9ba with SMTP id ffacd0b85a97d-3504a73e32dmr22077097f8f.30.1716290781939;
        Tue, 21 May 2024 04:26:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 8/9] vulkan-utility-libraries: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:13 +0100
Message-Id: <20240521112614.1137127-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199628

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/Vulkan-Utility-Libraries/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ies_1.3.280.0.bb => vulkan-utility-libraries_1.3.283.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.280.0.bb => vulkan-utility-libraries_1.3.283.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
index 3ab31af96a9..3274bea8fdf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "a4140c5fd47dcf3a030726a60b293db61cfb54a3"
+SRCREV = "ad7f699a7b2b5deb66eb3de19f24aa33597ed65b"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +27,7 @@ inherit cmake features_check pkgconfig
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools,
 # vulkan-validation-layers, spirv-headers, spirv-tools,
-# vulkan-utility-libraries.
+# vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


