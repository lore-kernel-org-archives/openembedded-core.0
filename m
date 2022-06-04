Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE6CCCA477
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.8749.1654338398426644527
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KRk61SUc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso213562wml.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TUeWG6qY53JL//wTTrhHPIQ4vKVRX+i3AnDcVnbbti0=;
        b=KRk61SUcQiWcnvj5tJ2CUrk4deIkPytoDiwCqybYmhdcFUToJwBYA6lHtcRbvxWGgv
         HnpT3PqZlIr6iDt9Jp4qGpX5qnHedgKn4QRG9ECi7H8fbV+mMfsKwhr98XuU3ZL80eYn
         ZCIH6AbGnzInSAObRvp9ILJYWN5trK1sk/8s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUeWG6qY53JL//wTTrhHPIQ4vKVRX+i3AnDcVnbbti0=;
        b=5Ryz+RqOa/R1xTnpd3qHjC0jF3YflaCjHXVT2UkbPBPUwvKqqQ/agECNskSTsgQCHk
         UOg10Hlbbxj35dsf/WH17D+GmsU8gYUeUtjsvKmc37Xhb3WdE+yMCComwF0hV0qmHSb1
         l5KNFljk35WoLHoBwS5VR2Emt3pjZHVr/tg5qsURTVlEVr4uepf8Ip0m58dpEbbwF3kE
         JrKFs++Evp0i/TvakLzJC7FnxwYpw60ToMk4ihxwBiNlVCO5KnfE9/PaPPysGkTwHvjI
         fQBjUkuieXeYflHeQXZntpSyCpYUbOoPWjbKIBbM1YRrcqfwL8ka1rav1LNUjtvKTbAk
         bUEA==
X-Gm-Message-State: AOAM533/umiOfRSS2Xc4+/5r8Sfp6DdI8IQOIgpQQBNVcm759Fizaris
	167OUpAFE3YGlySYC49aME/BO0A18B3C3nPs
X-Google-Smtp-Source: 
 ABdhPJxnNK7KeEG84tFEomR45wSi06aR7OgQYT59eOrU3liCyPdcOSHoKggQDiAizvd9XvweDItTCA==
X-Received: by 2002:a05:600c:35d4:b0:39a:5b65:2b66 with SMTP id
 r20-20020a05600c35d400b0039a5b652b66mr32701720wmq.112.1654338396704;
        Sat, 04 Jun 2022 03:26:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/17] harfbuzz: upgrade 4.2.1 -> 4.3.0
Date: Sat,  4 Jun 2022 11:26:19 +0100
Message-Id: <20220604102625.199845-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166557

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_4.2.1.bb => harfbuzz_4.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.2.1.bb => harfbuzz_4.3.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb
index 05d5aefd870..909b8c57d9a 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bd17916513829aeff961359a5ccebba6de2f4bf37a91faee3ac29c120e3d7ee1"
+SRC_URI[sha256sum] = "a49628f4c4c8e6d8df95ef44935a93446cf2e46366915b0e3ca30df21fffb530"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.34.1


