Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60D6C88E6B
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6003.1789330331527985292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J6ca0Tv1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso32322725e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330330; x=1789935130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IBWzs4BWoKNpv8SA7ACSzjM+7+LDWhiNGD3pMx0dO+U=;
        b=J6ca0Tv11j/+EVM1rdz2lU1JBTXjpWPqSpwG4F1GAuP+uflGqyX9dWkd3h+I90+TtI
         qBRax86kQvoIw1AYLGJ+IttgStWuzHWVGsfhhlc8JpaHlInqlpsolzD8iLJrWvIh7IV2
         8rdUMOcfj1aVSGbLd/bBqUzVDkVg2pUe74kUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330330; x=1789935130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IBWzs4BWoKNpv8SA7ACSzjM+7+LDWhiNGD3pMx0dO+U=;
        b=MAjImcEs5x02NEGFwoLaJtoGSbsy0RqciaZ6ze1m3HBEpV5U4ewiokID67j5DqFTe+
         PMhWa2zWWpCqD4/dvx4ZenqmnzGMDI/pvN/5mknPlN0x+yQLWWYGJopcmHNW7o0EF70l
         xjEdcB6jgJobY5S7tNAz/aTFPP4swO2f9C7R7FKnv0EqZrI2rgH/iqm9sw749Vnexv8n
         ERK7Sw4tsFGgjLIqa0X9GguxEDFWtuX1n9/iThtKYUvYU4sGvYQvxYZcndp3anYWqCzt
         AJZd4Wpti23JwqKTjoZTtIlAJzt5Of7vYrMkY0KNpk6J7KHLFcF/TvTj4qt9duovZsVl
         qJLQ==
X-Gm-Message-State: AFuF++k5JO7BIxcORr/9mZ3+NDK/WySz6L9o4r6zVH4DPC+Kwu/Dgc8J
	lKx0TrlB/fKX9XH5HQNDJFzj2a6xLkK//pk8KXfBd4/V8a+Apq7QyvoHz1MERYG9pCTbP/U7wvj
	rQcyKZX0=
X-Gm-Gg: AYBFou3N6FrpfpNUQnfJ+erxJuT82HUEy5+qv22cxGzKDRgKeT83L0ejlN3YG1JfSAO
	frKzci2IUG0eWi8ojvJY4HclpJ92P7E1viP/xlMSrtbOk1GwYjBvW8RDe7vj477oekCSsvJuF0u
	exUILSyT1UHfF8KY+g+m/t2YZWwOeXpZTezZroniVZ9wsqX8wRerYUbbe5ZPaYnyTP28MWjM1Gn
	eDwnTZrNotQOYv2ObJksxbyiK2mzLLBQO+rnMhcUM7D4KDPdtjY0NjP5o1VWJK+oTgyBr+n2xAe
	C3s/lSBaSHFiMJ5FjrycolHuQ9t4BsbcRKcyR1pG09zqoT2dUvwDnd1VMr+mY5W8bG81hh73K82
	wmYo7ID4VIZulHP5wpD4nq6Km2eLWeTv+5peMUdS5WdJ2LNQ0yui30j2ter9V/uWFte9RBG4i5K
	xRCyBpKM0vuCvkrs1sUTRe5VbuGuRf7JHWCXIyIQ794OloKyEkzRIJQxUMzl5pzhqtRH4fIchvG
	zKwIZ2HtHkJp82amqYaVHzIz6mS
X-Received: by 2002:a05:600c:8b23:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49e619804dcmr153874195e9.3.1789330329748;
        Sun, 13 Sep 2026 13:12:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] shaderc: upgrade 2026.3 -> 2026.4
Date: Sun, 13 Sep 2026 21:11:54 +0100
Message-ID: <20260913201158.687889-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245734

v2026.4 2026-09-11
 - Use Glslang 16.6.0, SPIRV-Tools v2026.4.rc2
 - Incorporate fixes for SPV_KHR_abort abortEXT(...)
 - glslc:
     option -fshader-stage now accepts all shader
     stage names as allowed in #pragma shader_stage(<stage>)>
     This includes ray tracing, task, and mesh shader
     stages.
 - Fixes an assert

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../shaderc/{shaderc_2026.3.bb => shaderc_2026.4.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2026.3.bb => shaderc_2026.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index bc324b5c0db..57fff1340ed 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From b2d321b9c493a6e36203c50ad20adb655485c951 Mon Sep 17 00:00:00 2001
+From c7ebd558e5d62af7723ba804df4f0887ce7a83fd Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.3.bb b/meta/recipes-graphics/shaderc/shaderc_2026.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2026.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.4.bb
index d2a62a4cd45..5ff3a630868 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "82757e4f72af8518fb679604d352623450cb761f"
+SRCREV = "d393a813c9b67c709d37b329203d72beb69d719e"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            "

