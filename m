Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B568C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.3337.1647298136515470994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IxkPz7Cb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso413355wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WkAcsSi5QAniT2BE49jH8x6fDHhUdPFjjSte62QaGFw=;
        b=IxkPz7CbSVVYbcX+F58au/OaiHFejxGIF0bRxWaKhJJLWw+/RNRMSOEdLWijOSRqzz
         5DJ0K+eu49HyA/yfvfSy8heZzXEl2kKJzCunSZ98kb8f6wZTilPecZHFbwrNj7/ijh1I
         KxnYVgS36rwH3XJbxv1N3fsueiStIR9Zy6IM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WkAcsSi5QAniT2BE49jH8x6fDHhUdPFjjSte62QaGFw=;
        b=PBjR8+AV7Fg2JCUZf7+u8EM73uUICYPGr/GdtuTbNLW4MrK8RnC5EaKP+mHy96ZD9Q
         eswysn4l/aBYHyeIJyi3Q8Z5+ImU0l7FirQ+RlK/cXNHcQ+waGS38YV0+mFicWIUdF08
         /9ViIeUI9EVjb03ke6AEJtMlvk1HDHoyL67pUfHDgNTbBmM8wb8HU5uSLCBfJ+5qzt1G
         H5BVWjhlHLwbV7BaiLhwa8C2N9Dfx/RC3amMpRIat/v/Z/+1HZYlV/jW1uT6vLAizu30
         6HPWuBVL8etIrBklLrQErwcjpWK1mBiHvxZnT4dTUcaL0rLc1KcYDaSP9TM3iU9erpbq
         VyGg==
X-Gm-Message-State: AOAM530cfposCcunLqgg/CzkYye8sm2HY1HREVKRi92fRLTzrWjXIN8a
	5lRkll5uHzq6oJvyKDRpDhLZlUi5ECUgZInx
X-Google-Smtp-Source: 
 ABdhPJyoXt1cSUaLca1mQwIwWYpYMAvc+K01nHB2smkjAiTRYbzGG9AVkF6bRLEg+D9HQKenp87LXA==
X-Received: by 2002:a7b:c844:0:b0:37b:b986:7726 with SMTP id
 c4-20020a7bc844000000b0037bb9867726mr1015644wml.160.1647298134877;
        Mon, 14 Mar 2022 15:48:54 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 16/33] python3-poetry-core: remove obsolete
 PIP_INSTALL_PACKAGE
Date: Mon, 14 Mar 2022 22:48:20 +0000
Message-Id: <20220314224837.834776-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163182

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
index 99ec763c4d5..22d7076d01b 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -23,8 +23,6 @@ SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa4
 
 inherit poetry_core pypi
 
-PIP_INSTALL_PACKAGE = "poetry_core"
-
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
     python3-core \
-- 
2.32.0


