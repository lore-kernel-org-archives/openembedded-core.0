Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBD3C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 18:42:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.36706.1643654522969704621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 10:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TLX3N/RM;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so14308809wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Q+fHKG9qZZrF/5spNOtaHi3opg3KWkHvDLI0nrDMGc=;
        b=TLX3N/RMt1v1Cjdd4zzPn3GT4u1VyynQK5gFeWtOkoU5XM1+pvvVDv//prz2l03WDy
         3iktXuuTOmSYsFeKw/h3G5hN1HY/0Sa4xST5oanxYokJmJ1qI9uMXVPTSW2B+dUYf2PW
         bwK6Py1xImSPzbT9lPkknjMz+YbjU9oQHNktBnyLhQWkOC62ThLNFebJd4BWkrh+W6Xk
         Yx7sRb5F6Sm7Ir5mEIGZ440ApEBzzIE6ebPqS9KOT4oIRDf5Jmaz9vWm+2B8M7Nx5HU8
         E3k41FHEKvovQP3w/U5wCYvdrgB9Xj3YgBt4X4s87Ay6fW5SJi/OWqZiwLHJOegBDoDb
         ydZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Q+fHKG9qZZrF/5spNOtaHi3opg3KWkHvDLI0nrDMGc=;
        b=UUGcbrfR+pg3FYF68KvLi6jGjASi/E7YlaF7LNm2RqcOtIWlML57yIU22goMnqlPkr
         WeKIt2JeuL6oS4vHdhjDmHJYeCRBq3Z8GttTsBNUkhMurhvaqlnnL7+IAZW20ldHknap
         +LTJDpuiU8YWWmIRb8hMOu9Gy0bfFtdJgC5E10b9eK8J8FdW0LiRRslTw+k0zHUZrGD9
         K6wNjXymvnILyq/V+YuqxuqTm409z8xRnWzZn8tzuTprCJvk01QFauOXxbG4y/NV1U1a
         y/jCjyhgw1658vvGf5oNln1dD6epf5ZokRxz2aUYup7zXfI8+sQ5qptl746DmmqHJ/hM
         DafQ==
X-Gm-Message-State: AOAM530na6uNLdhtV5svKtbmpDrlbMr2+z5KMXvZFw641OsLHiAJb0o+
	tk+3+fhjR7ZYijMqaK+3CYoNFov4aZ8=
X-Google-Smtp-Source: 
 ABdhPJzq5HhEaF9TAzrPdyq/RzIQelrom2NDV5bmM1VeLsG7jjLWCCOmvuv/T8gLZXrErMBfR3MQvw==
X-Received: by 2002:a05:600c:1911:: with SMTP id
 j17mr19192508wmq.143.1643654520978;
        Mon, 31 Jan 2022 10:42:00 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 l24sm115554wms.24.2022.01.31.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:42:00 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/3] glslang: upgrade 11.7.1 -> 11.8.0
Date: Mon, 31 Jan 2022 18:41:50 +0000
Message-Id: <20220131184152.46233-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 18:42:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161132

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


