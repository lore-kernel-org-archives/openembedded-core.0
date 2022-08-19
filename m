Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AD5C48BE4
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.470.1660894069618602835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qy+/CEjs;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e20so3685983wri.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LtpNJhqQJ+nZC2sOADZnH0K3Oo0ery6pt5Ba9heDhyI=;
        b=Qy+/CEjsDVS4+UFfuwOR2QVlecUIWQsiu60QLjVzyF4jvtU/n0RTEoL2YWJ8rIGZEG
         GB5Wvz819qb78ca70hDV8fokZFlKEYJ7UjgxylE0k3MoCORA/ULRE8lQsA06bmKNKDCY
         pkVIlQtZzDsJslsEnF0Y/5flay4Z+Te0Lmye8OtPlq51JVeMxbj10D+VAPoV+pO5FviW
         2XNM5vuFxhvLA6IZVIF+Q+hdbJMMYkwkXHnWlrdiSLrprhwqWc0/XaattnkGOf82M1Kc
         X5w29vNNQOrJ0nzEFhjoJrTvYT+iC3HMpP1R6nQbIxD1hIyzE0eGv+fQIFQHKwBJSDVF
         CPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LtpNJhqQJ+nZC2sOADZnH0K3Oo0ery6pt5Ba9heDhyI=;
        b=lYDjorUmk4gQOY3iAjTzh1ZR4NkFBojmfYOtDPmo+tEx2m/sygGPZ+zWxK2aBEZby5
         5yuiWFOpH+C3jG6g3ymcR6kdjwz+d3ANGcqrXLTsGo/my+ADHYgel3sI3EEa08gC1G6x
         yPsAPXZh28MFdo9Exu+GWxGNxgvLpJtQFaTjx3omGl4+QJbK5NwC1EjPbuKEqDgW0XsI
         WjD0bhv4GjRxHvHdT22rEDSJYmsCAd2uMYX7NrUDythtajnFspzJ9d2/2mMkyP94QlPv
         gkNQHCdyXkCZ39yUMTUhgjmrNRJZaT2HgGTj1hBeiDFInK8oBpf7wsFssheVVV81KAux
         rs7Q==
X-Gm-Message-State: ACgBeo0ZjTd2Scw/vhEKyo1DEH0hsxwyASMeOcmZwYbUGytq036DNgmE
	hLlQrkCvda4tVawp7M4FJSXOYrLV8hk=
X-Google-Smtp-Source: 
 AA6agR7y2zb8mvVqxJ1uS9Z63unXw8lSR6jUIYxykmfpxTcqJFMsnvZzEqeqDbFZbUr7qjC0TjQSRw==
X-Received: by 2002:a05:6000:1d2:b0:225:2ce7:2559 with SMTP id
 t18-20020a05600001d200b002252ce72559mr3461853wrx.157.1660894076063;
        Fri, 19 Aug 2022 00:27:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/42] vulkan-samples: update to latest revision
Date: Fri, 19 Aug 2022 09:26:57 +0200
Message-Id: <20220819072727.2236928-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169583

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pp_vulkan_resource.h-add-header-incl.patch | 27 -------------------
 .../vulkan/vulkan-samples_git.bb              |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch
deleted file mode 100644
index c2bb43fe76..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8c069a1c4452f626e5bafc547463507d86111319 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 19 Jul 2022 16:55:40 +0200
-Subject: [PATCH] framework/core/hpp_vulkan_resource.h: add header include that
- defines std::exchange
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/501]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- framework/core/hpp_vulkan_resource.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/framework/core/hpp_vulkan_resource.h b/framework/core/hpp_vulkan_resource.h
-index 0e30f5a..8d83019 100644
---- a/framework/core/hpp_vulkan_resource.h
-+++ b/framework/core/hpp_vulkan_resource.h
-@@ -18,6 +18,7 @@
- #pragma once
- 
- #include <vulkan/vulkan.hpp>
-+#include <utility>
- 
- namespace vkb
- {
--- 
-2.30.2
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 54994c683d..332411b312 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
-           file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
            file://0001-Qualify-move-as-std-move.patch;patchdir=third_party/spirv-cross \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ee6c1522af8ba9b56f8416c2eedafb440f681085"
+SRCREV = "74d45aace02d99d766126711a8aaa0978276ca00"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2


