Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6398EEB58C
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 12:55:37 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.15955.1694264134124391743
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Sep 2023 05:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6bdcbde9676so2130305a34.3
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 05:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694264133; x=1694868933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIidduQSjRh9ogaUAlGBdbgHbXwqbXy0qMcrAGgdGjA=;
        b=JNSnAcyc1BIVJUuDdl9WDJcE39S3K3JzTowf3xU+t/VaTb+U2M+beTtVmd+uiXjbEh
         ioxuFEnJ/CNXulp8odOaB3o15Y7yGPpi6FrB1xuqnCJiMCSYrbUg0snSs5JKzYKuyVDW
         1cw5ktzSiDd+58kxJCGt3Xd14cX3P59P7s3Xnq0CiJs+9408HHnZxtr25olsL2bagP9W
         RKP2NRwZaR3JPLsevBZk/uDFKQUbBwh/Y2MGnXlpdiBs5V1hnBY+0ShbuPsg0N1pEPeT
         ZDoOItnor/sCwlxrNe2dfwHJ/ecLaZ9clonz7OXnx/YUbzI4VFnWtxByjthhcW9prBH9
         LVkQ==
X-Gm-Message-State: AOJu0Yx6druis0WN2JJZRNxZH81To3pubjq/yZ3noe7n5b9tM+wG3pAq
	NvIkg0QJK4Xg5Wk98mRLNTlB50VYYcjBkA==
X-Google-Smtp-Source: AGHT+IHnJpKgodwD/w8SKIhuUv9jlqt8qePlWh1B2eH+hNYnRPCWmyY26jY7nqwl47Q9qq3uIrSK4w==
X-Received: by 2002:a9d:6d98:0:b0:6b9:c4b1:7a86 with SMTP id x24-20020a9d6d98000000b006b9c4b17a86mr5644804otp.3.1694264133151;
        Sat, 09 Sep 2023 05:55:33 -0700 (PDT)
Received: from localhost ([2804:d51:5956:ac00:e7a2:489a:8055:28a8])
        by smtp.gmail.com with ESMTPSA id c7-20020a056830000700b006af913c1044sm1558518otp.16.2023.09.09.05.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 05:55:32 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] weston: Upgrade version 12.0.1 -> 12.0.2
Date: Sat,  9 Sep 2023 09:55:00 -0300
Message-ID: <20230909125514.214512-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909125514.214512-1-otavio@ossystems.com.br>
References: <20230909125514.214512-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 12:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187449

From: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>

This is a bug fix release for 12.0 version. Full commit history bellow:

Derek Foreman (1):
      data-device: Don't make a weston_coord with no valid space

Leandro Ribeiro (3):
      drm: drop disable_planes being false as a condition to support writeback
      drm: do not pull writeback task if KMS atomic API is not supported
      tests: assert that capture info was received before trying screenshot

Liu, Kai1 (1):
      xwm: WM_TRANSIENT_FOR should not point to override-redirect window

Marius Vlad (3):
      backend-drm: Make DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP inert
      backend-drm/meson.build: Require at least mesa 21.1.1
      build: bump to version 12.0.2 for the point release

Michael Olbrich (1):
      backend-wayland: fix --fullscreen

Pekka Paalanen (1):
      man: make --wait-for-debugger findable

Philipp Zabel (2):
      backend-rdp: extract weston_output_set_single_mode()
      backend-vnc: use weston_output_set_single_mode()

Signed-off-by: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../wayland/{weston_12.0.1.bb => weston_12.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{weston_12.0.1.bb => weston_12.0.2.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston_12.0.1.bb b/meta/recipes-graphics/wayland/weston_12.0.2.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_12.0.1.bb
rename to meta/recipes-graphics/wayland/weston_12.0.2.bb
index 8c2438cdaa..cc7f95eea8 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535"
+SRC_URI[sha256sum] = "eb686a7cf00992a23b17f192fca9a887313e92c346ee35d8575196983d656b4a"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.41.0


