Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275BBC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.6401.1646731960173946019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K0psL4wK;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id kt27so37936635ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNiEF2hZqTh+wqcwsS7RSKHsRRBC9109FqQ9xhhwTyg=;
        b=K0psL4wK2mxmfFGwhJL55jFiWZJeR94SRq5S2zPQFQhfOObuzV2Ox1VSSrgBCPd+PZ
         We5DQ2ue96deW6eR8+f/lYqUNaSa5WVZP7RQLRbpANp6WJ4rlHu/jmRZTKXW45uiHIJ5
         NKK/A5RLompTb/rR23jJnluYoKrPtke4H6ygQ7Gcf2VhWivU6ZH7MSoROQCQW1+bcts8
         1+ZqIZ2+lrTt/BEhO0Nyx0Zj9VDZXNXTLGEj3pQsEK2OH8wkjMe4+GVvvCFY0GVnyhLJ
         Yqano8L12DRRb6+aWkeYxvbKlSf2dQ/vsZw7+Yt8fWgQywwTGLMk+lAa3qJ+57OLhJcU
         xJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNiEF2hZqTh+wqcwsS7RSKHsRRBC9109FqQ9xhhwTyg=;
        b=Ub2w3va08TQJe71vbJIckPgP4eapAvfcAQ97Viy4wTKn1pq7BrQkmQEi0q4VgAfk+r
         BO5GRHkyyEGv59Uw5MDlI8Hzqt4tk6nf+o2whX79RL5lVxb+jj8Ratsl8Kbh6DfxHmbG
         RQQogYALRxqrhs0s1K4bb1KKFESR+Es8a6gay4asc5td8eDv4/fq3WloN6iSsReVsgeL
         L3w3zbFa94WU5s0TduH6AGaflDVnmehMsgxWTcCedd5IKmxPXm4HLzMORum7Oggn74I+
         nJPnI2uBlatU3FBw060Fb5OqRw10VSECGcMG76mgk+4/XbzDvBNmtilgMQjp0qAvcseq
         sC6Q==
X-Gm-Message-State: AOAM532IQVYukt107JDNAgicOCAm90gTZbw9Gwhwl2Pvqo5AINeoQ7Qa
	YtWyf9o2BD7RhvIhcGxb6p5BXo4J/ys=
X-Google-Smtp-Source: 
 ABdhPJxmSNV4yFXnVfzn4ArbGJz64iqJN1YM4BqSgUJ/1RQwF4s5Ky8WY+NSo1V5ykQ8qCrfipntag==
X-Received: by 2002:a17:907:6d97:b0:6d7:49e:275e with SMTP id
 sb23-20020a1709076d9700b006d7049e275emr12184053ejc.410.1646731958726;
        Tue, 08 Mar 2022 01:32:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/16] vulkan: upgrade 1.3.204.0 -> 1.3.204.1
Date: Tue,  8 Mar 2022 10:32:22 +0100
Message-Id: <20220308093224.3436483-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162891

From: Alexander Kanavin <alex.kanavin@gmail.com>

Only vulkan-loader has actually changed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_1.3.204.0.bb => glslang_1.3.204.1.bb}      | 0
 .../{spirv-headers_1.3.204.0.bb => spirv-headers_1.3.204.1.bb}  | 0
 .../spir/{spirv-tools_1.3.204.0.bb => spirv-tools_1.3.204.1.bb} | 0
 ...{vulkan-headers_1.3.204.0.bb => vulkan-headers_1.3.204.1.bb} | 0
 .../{vulkan-loader_1.3.204.0.bb => vulkan-loader_1.3.204.1.bb}  | 2 +-
 .../{vulkan-tools_1.3.204.0.bb => vulkan-tools_1.3.204.1.bb}    | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.204.0.bb => glslang_1.3.204.1.bb} (100%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.204.0.bb => spirv-headers_1.3.204.1.bb} (100%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.204.0.bb => spirv-tools_1.3.204.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.204.0.bb => vulkan-headers_1.3.204.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.204.0.bb => vulkan-loader_1.3.204.1.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.204.0.bb => vulkan-tools_1.3.204.1.bb} (100%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.204.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
index 23e178588e..8924ca34a6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.204;protocol=https"
-SRCREV = "6a2458b649aae2a8bec8259c2485e7c0bd0465ae"
+SRCREV = "f3e995134211d3fd663febede48e740e44982e27"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
-- 
2.30.2


