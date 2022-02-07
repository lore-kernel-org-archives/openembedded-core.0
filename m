Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2167EC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.16544.1644196122996232279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=niMtPB7J;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id m5so4692149wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Q+fHKG9qZZrF/5spNOtaHi3opg3KWkHvDLI0nrDMGc=;
        b=niMtPB7JJfmJGXH35pgtpw7FOw2W5wochsATg+xwa8lVtf7bBIwGmSVpbYkOV3e0Mq
         ziBG9Ebs77GME/zVfHwsS5UNaWKZqS4xQJxsgdv/alvrVLt1xBLonuS+lU5TD14Z8oZo
         3caYDbJP/8Ae3xCdNK/rBjuJOhk9lSrx523N0ODxd008ovBE3ehaA3wdNg1gbj/LZx7i
         v96mrRepMfwnLU2HxWqR45E7Uu31zQqMopeSOp/hCaxAQV8OlHEaKZQ2wgYbyk82j+GE
         n9FdxccGk2yOJJMjEVMwT6JCRZfrGQV7jaJNJd0MeG7JLPlKnCQN0kLf8r9Z5rbt3bVX
         vgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Q+fHKG9qZZrF/5spNOtaHi3opg3KWkHvDLI0nrDMGc=;
        b=P4fI4LY2bgqi8Wtxxg2DwJjBG9BC4yt7+CrmZ2qoa+sASyBHIIEsXgSZ8Opof0IcNo
         K3XaFgijWM1jBgG3ed1YE14nfZZDAm9ifCip0NBuzW+sQJ+ywFiXNs0ajLkGx88O94cG
         ZCUfB3F+o4iAIrJzVeOct1b9uuLlXijlnev1oz0YShlb0uGI3iQppWZdW5AL0qN+zrvZ
         BvtpM2ug/AYtAJHtcccgXiokxzEwSZfwYK/JQ6YhRO7ItA0M9ERNXatFbiJEE9aYOIYL
         eZOBkNh+ULlJtZC5gapg3Fb7oTBJMJ1VhtmAZJHhAzfRG16nzNXSKfwx7GMGGcvOtD+C
         v5aw==
X-Gm-Message-State: AOAM532WkZAvjUKrO9tNnrorDiQoWgVRQ4eTRNdpeBhnz4AbPMGisEFQ
	WHJtEw1QVy5ocBixTNmabhJqSrK7034=
X-Google-Smtp-Source: 
 ABdhPJwBxtFii67CdIkAE+U+eC0Nti1MqGv1YoIptV6Nl/cfMXtDUsQ+U88Y5cE/twAPYxb1ExfOzg==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr7965819wri.208.1644196121328;
        Sun, 06 Feb 2022 17:08:41 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:40 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 04/17] glslang: upgrade 11.7.1 -> 11.8.0
Date: Mon,  7 Feb 2022 01:08:10 +0000
Message-Id: <20220207010823.143664-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161424

* Add support for SPIR-V 1.6
* Add support for Vulkan 1.3
* Add --hlsl-dx-position-w option

Update LICENSE.txt
- Expand the GPL 3 with special bison exception to the fully expanded license.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_11.7.1.bb => glslang_11.8.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_11.7.1.bb => glslang_11.8.0.bb} (89%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.7.1.bb b/meta/recipes-graphics/glslang/glslang_11.8.0.bb
similarity index 89%
rename from meta/recipes-graphics/glslang/glslang_11.7.1.bb
rename to meta/recipes-graphics/glslang/glslang_11.8.0.bb
index 30d9954ea5..a77d8bdf88 100644
--- a/meta/recipes-graphics/glslang/glslang_11.7.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.8.0.bb
@@ -6,9 +6,9 @@ either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "c9706bdda0ac22b9856f1aa8261e5b9e15cd20c5"
+SRCREV = "c34bb3b6c55f6ab084124ad964be95a699700d34"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.35.1


