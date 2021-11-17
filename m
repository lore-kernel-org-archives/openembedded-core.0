Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75693C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8679.1637163336447394826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1sospLF;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2423524wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9d1q9ZeiCXkKZOvUaSfEcxwm91pqBYVs+SOCefnqY/Y=;
        b=E1sospLF9gG2EkLs+4GGUKvbsS84uLlpJJqzCHnvEYk0sASULKr2sQTZA8oasRF9HE
         djrF1V2cwSqtZSVt8w4lfyPln9B0wcdchYnf68fz7JO6kAi6gjhM+iPhi4UR+Wt2WMId
         haA4Au28QhTygrjpCt0OJF5N+e8CjgjjhzcxPPgnY94zQJ7L+VBqyvlnNAMKlW2kHzfU
         fQorMbfbtfw9VZxKdXwkj2XxowgHbTmaKXuKoeQfShJZR6ENH59TlA9MBodhi/1m1FSE
         2c0LoLcpIeHgzEng5UNVnFS0+iS/rI9hYPtucrMS9mXXUuzScyMJ4v9PGLfVW8x2X1Yu
         VTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9d1q9ZeiCXkKZOvUaSfEcxwm91pqBYVs+SOCefnqY/Y=;
        b=OH9XdCbrGR6zE2kCNk5ddBgQssHUvz/oqEp14h6CHqiUSuQljyuYDlKVRogBtFtegD
         vh/wBbEBsValcBGsBTEEnRWq2oIUUtMnGhwuav54cs1Qzdugj6NMte5BzVeSPswTFoS8
         y4+cROYx8CWIbsEvyeKCGPYM4lS5ibrsGfx7Fr3Yn5SQKwwrN+2DBWLsxZJ0rCTkZxhu
         Tzn/BvLbeK2K5iPLjOzZnBISK51WRQqK1cEupc9EKJ9r83icyFuU3FfdgDTFemX29XJu
         +A8nh1P3uxmHXzunGyGR83yJtCexvCl9w9ps8LjNkgcY3ipqFhwkMgupWLyX06mhUeK6
         fjyw==
X-Gm-Message-State: AOAM5300dQiIph3AlYN09AAbIf6ttfTiFBYng/8uUGo/eVYagS4QDbPk
	jR4VMdkzyViVyKtAJczqnSD3y9ivB8M=
X-Google-Smtp-Source: 
 ABdhPJyZD7NJV/sXmqpX03Zd5hbz4FlDqwLIyWBLeAfMN8RWfVEwlJ1EX43JiajEY3pUvO/mxaArbQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr621776wmq.79.1637163335063;
        Wed, 17 Nov 2021 07:35:35 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/36] asciidoc: upgrade 10.0.1 -> 10.0.2
Date: Wed, 17 Nov 2021 16:35:02 +0100
Message-Id: <20211117153525.257146-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158408

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_10.0.1.bb => asciidoc_10.0.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.0.1.bb => asciidoc_10.0.2.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.0.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.0.2.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.0.1.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.0.2.bb
index 40574df6e2..1b618175bc 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.0.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main"
-SRCREV = "74823bed08e7b823d2b6cba8636a1fd67fed6cc9"
+SRCREV = "7bad9d2e77f7d384ac9042732adaefd4f6ed8979"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.20.1


