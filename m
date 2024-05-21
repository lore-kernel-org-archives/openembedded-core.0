Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A771C27C41
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.17339.1716290780882372107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YWYbw5gG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so2939033f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290779; x=1716895579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1jcBLOFqiQUYgFw21t1sYhBkx3ZNwqLa3c1+gRz37g=;
        b=YWYbw5gGywJswkgEZ6/Jd1FCSGKYrZYpPwVWovKLTaYXA7IndI/I+6G7Tz49iL/tsv
         FSlxnD5VoCws3eyaEL376lEVwsVKvQaLqKdqRnOPwqxSZBjE5E/SKrEUYxMCCYPSclJ+
         l5YlvCesD6KWGYt2vDFAD1Yco3nMWZyYinyLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290779; x=1716895579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1jcBLOFqiQUYgFw21t1sYhBkx3ZNwqLa3c1+gRz37g=;
        b=hXF3xzbxM+kf3gVMv4l2+xzUmgc947XqQrRUcsAUEk7YVwLaD5FJrguS0v6g9fczw6
         d0Z10VRfuOQENelgmcZOiqL+5otCApNloa90ZR28KEH9waKilF26kX7UF0/5vsNmyPMK
         ws1WGbUmcgScwTdAvs+oT+a0rAfc7uqXeJsyyhmY/RLT9zCw0/0DU84ep0WuVy7v5QQ6
         1Z/IsEX1Z423ljHasBpWJ3fqEV2evaWfgAE5Bt+u4LqLxcXqGETd2Sx+ggtduYDT2pRf
         jtdiTYRBuvEjMRBwqwvXUWSRy/8o+xl4SF//+p1hjzFqa77B5RiLsKIfDI7wLdWAPyG7
         YERw==
X-Gm-Message-State: AOJu0YwJgVPxCJxAtpioEkwB3YlA5lCVYuR3lBDuchDbt3e8FcC2tdrO
	RIU3CLDBWTmn0Ec9i8OALd4H6u4G+BrujVoeyhQEYJ7w09WUVnQFqV+/ol8iJcfrYOSz70NQ389
	B6CQ=
X-Google-Smtp-Source: AGHT+IF/kjy+/FCTVIqgRtqwOJC3FANWAmdnwEc+DAQoI2AVnhln17BYm/Rs4Dn2YxDTWyb2trbBaQ==
X-Received: by 2002:a5d:550b:0:b0:343:3542:b6aa with SMTP id ffacd0b85a97d-3504aa63c1emr20744135f8f.58.1716290779235;
        Tue, 21 May 2024 04:26:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 5/9] spirv-headers: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:10 +0100
Message-Id: <20240521112614.1137127-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199625

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/SPIRV-Headers/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{spirv-headers_1.3.280.0.bb => spirv-headers_1.3.283.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.280.0.bb => spirv-headers_1.3.283.0.bb} (85%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
similarity index 85%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
index 26bfd9c4fab..5ec7e42b7c0 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "8b246ff75c6615ba4532fe4fde20f1be090c3764"
+SRCREV = "4f7b471f1a66b6d06462cd4ba57628cc0cd087d7"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-# vulkan-validation-layers, vulkan-utility-libraries.
+# vulkan-validation-layers, vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


