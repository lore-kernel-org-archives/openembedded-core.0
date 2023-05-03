Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD266C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:54:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.14313.1683104052042106884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 01:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MFadLaK/;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so48679265e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 01:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683104050; x=1685696050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIwlkFprogGNXkQEPagRAnEjPgSekSr2FCf3YzqzLkw=;
        b=MFadLaK/Vn1ciMcuSEO5SW1VAxb3Q7H161P+3v/Y1yf8kKbkGrogb34VamBIKKIvZu
         KK1tZyRwraLAPdxWKYrQbWrlkze3b5ifNpZ5XetfikhLMSYbtIcrCxrqoNTN99OZaxhd
         cRMzMUL/58PFFrzu1o42/DlmYkDw7JgxGYz8XczLSbaVHtVCwQTK9wGidrc616bvwM6r
         2M9mXJtBQR6KmjTeuvG/P7JPJUtHoLQDokeLzevklGdFrd0omt426plMYrmfIu1ShfRg
         2CZKbTK62xyqcbOXixDKceYu9CzbF+VmgqS/k3opKkvdon3i/ZX9E+NMH4mnqm/kpsRn
         p3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104050; x=1685696050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIwlkFprogGNXkQEPagRAnEjPgSekSr2FCf3YzqzLkw=;
        b=ieez4vBkgBAptl19odBlQmMkZbgo36GJizVaC4x6Igp/E3YDsIuqfi9t0X5YT86yE9
         qtZ5lQVZW8F4nTiEeQaKkWau6sHzy5vsieiXZxX/HtdjoD7Z7lIYX0k2JoTw3SkkkAem
         0v1FDAhBV1KhX1SZzCO07HxvCovRwnh+wtpCnhn9eIUaSLYB5Rdrrq61FHMWBwRIIHgJ
         HM+sNfTPOXW5usEUi98Z29fYouYsE3p0LXDlkCmnEWrqsn9cP0ZTJLTuuiVIRlcEgqOK
         rkXC9u1eemLy0jQy5ch9julJBYcixHU3MUmpzazEnS8K/0zwOXPcggcHL2SVYHlY/xKQ
         xlEA==
X-Gm-Message-State: AC+VfDzqTqxrIXPo0YZfIwFghtvDX7vmT8LFij6QcjYT7f0IbqkV7Zoz
	qZ9XZC2pzjiBjHA4QPI6DLTGdDyIEJk=
X-Google-Smtp-Source: ACHHUZ6TzYYbNReIdGlcY/kaclh6ICBthaOsqPcnhD4aXMGGEaGXa3zE+2LEu3MDL9u+Wufw36jXnQ==
X-Received: by 2002:a7b:cb85:0:b0:3f1:7136:dd45 with SMTP id m5-20020a7bcb85000000b003f17136dd45mr14153313wmi.30.1683104050162;
        Wed, 03 May 2023 01:54:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003f175b360e5sm1263679wmi.0.2023.05.03.01.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:54:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] vulkan: add a comment explaining upstream version policy
Date: Wed,  3 May 2023 10:54:01 +0200
Message-Id: <20230503085401.1398104-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180790

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/glslang/glslang_1.3.239.0.bb       | 4 ++++
 meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb    | 4 ++++
 meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb      | 4 ++++
 meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb | 4 ++++
 meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb  | 4 ++++
 meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb   | 4 ++++
 6 files changed, 24 insertions(+)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
index 6bcde521e2d..295a8fe1901 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
@@ -13,6 +13,10 @@ SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
index 4c39b0c351a..8e4402a94e7 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
@@ -10,6 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 SRCREV = "1feaf4414eb2b353764d01d88f8aa4bcc67b60db"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
index 290c53e8e4d..44ffc72b08d 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -10,6 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "44d72a9b36702f093dd20815561a56778b2d181e"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
index a6b30fa8310..19b13bce63c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
@@ -20,4 +20,8 @@ inherit cmake
 FILES:${PN} += "${datadir}/vulkan"
 RDEPENDS:${PN} += "python3-core"
 
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
index e11f936a0a1..e45996e5a5c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
@@ -35,4 +35,8 @@ PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SU
 
 RRECOMMENDS:${PN} = "mesa-vulkan-drivers"
 
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
index 934bd53ee18..5dc6bcad453 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
@@ -29,4 +29,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.30.2


