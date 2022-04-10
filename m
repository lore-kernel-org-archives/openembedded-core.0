Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D309C3A5A1
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.22997.1649632623981230372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=prm1uV8n;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 66so12631972pga.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zvL1Q0Te1cbWjt73K5wwgqyFj3HumyYXhx8t7BD4PbE=;
        b=prm1uV8nr68yBPAiYchFszHjbppyl1kBOR3bo7voBYpzUUPR2RJkRZoMcTj9iYln/4
         MLpAqsogkrqOwgJnx69Vh+jnFfA8EdDgPp0l1ZUzGWEVnu19SLHRhNMwduzSq3XvRhVd
         ZIK2sKcC12/e18dRLmJLHqlfQYp6v+6OGkvfGd5mo/n0sts+Wbw3RIUndH2WIVWY+5eg
         QF0znPiSKqLFCF9elgFQtbm1rrVw9J5QDMH2eCgFPvTZANmSCdkop8ussrEmG8w6sYOL
         WA8Ut2r8v5h4xyKVIRTMnnGF3Xnwfg0h+wiYWmszWOmc678xHg8edszmfw8UZSKiJEyw
         QcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zvL1Q0Te1cbWjt73K5wwgqyFj3HumyYXhx8t7BD4PbE=;
        b=0KKy36blr8zZxZzPI2kP5ohqlvLVxiIQjVWf2yRx4QyUCyNORLAwRk4Dj9tReWc1im
         J9GhF9epObkQpTdCypVqO6p+MTOieF7yHectQONYlNgpuuTMo7OEElY4hsMZS6Qavd+Z
         mlWGWnUSNNiYUmelkmbrvREP2E0KijiSbfyLtJ0XwUUQmOGWI33x8mgreRMIyI9lzB9m
         nKGR/jbyHs+1cRH1FuVHmJ+pS66R/utKwSYZ2nh/4wWNXyDZBN3FiliBPxxH81nd0YP1
         YtQ8lZUq6txzNB6+hgnfeO4hNoUvX+G3XwarpFTsbI93HngdjBVACXSLLQ1zg3a+BzkS
         S4cQ==
X-Gm-Message-State: AOAM531JnksU3RwYBdbA1DV3hOYRbdY2mMW+7sp98zOwarIrZ4xhGlct
	OW2YUDkgtPAcKK4NBCdU5v91Etc2lb4jTQ==
X-Google-Smtp-Source: 
 ABdhPJx0oF77+fO076q33q0KP6yeDiVWb3HxsAcEqryZ2/Btz44gY84vhPE0rztlSy9PWWmjpF8cQw==
X-Received: by 2002:a65:47c4:0:b0:39d:4f85:40e0 with SMTP id
 f4-20020a6547c4000000b0039d4f8540e0mr2517665pgs.309.1649632623132;
        Sun, 10 Apr 2022 16:17:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 y63-20020a623242000000b00505c49bd2e9sm1008208pfy.219.2022.04.10.16.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 16:17:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] pango: Upgrade to 1.50.6
Date: Sun, 10 Apr 2022 16:16:59 -0700
Message-Id: <20220410231659.717650-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410231659.717650-1-raj.khem@gmail.com>
References: <20220410231659.717650-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164211

Changes in this release [1]

[1] https://github.com/GNOME/pango/commit/37a427018c92a2bc679ef104097e07a619609c9c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.4.bb
rename to meta/recipes-graphics/pango/pango_1.50.6.bb
index 0ea621bf670..b1b9054234d 100644
--- a/meta/recipes-graphics/pango/pango_1.50.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
+SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.35.1


