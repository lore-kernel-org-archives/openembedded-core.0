Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8569C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:05 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.30166.1641226804616794107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id o17so30912845qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=+Gw0lRKS3HTWU5gKJiQTqbSZyi5/N+RWPNaPmZvdwAo=;
        b=rB+QVkwACFc6NCFs5mFYliy4n9sbmh780Jx+1jo7ZeeGr4NPvYqs56mbR3axUUo1yA
         hbDBOYGMT1WYUynh8ZlzCKuwLUiSMyiChhTkNvau/Y73y/K2Slo7M5jNGY1zXu08sibN
         6U41n+v5Pt/M/2iqsLQw0q0+pIp/nj2jx4PNH2eil+QUuCVHoIHWW3XBVxHSvHl8F3Cq
         +j3l571nD7nyAx3okv148cr8/BecxeLzRRGpOgunaQq59roPV5KkZy/nxHs5iNJAjVoF
         rScx+zyFRcEwDFgDUO8U6x+1rt18jFxMRl0NB6jIdp2y5v+P+sVh7GoFjpmBY4e8WOkD
         Y0Iw==
X-Gm-Message-State: AOAM530ijQ/NFziYDg5qqLLrpw5V4wC9oUGTCHFz4PrEL4fd6iVROkGU
	alAvM26s0KEJknbB4aBAjldv+HksV6pPoP+H
X-Google-Smtp-Source: 
 ABdhPJxSLh+0DmOZJPN8+/2KlWETGvSYz6zKz6LKX53EscuWK3ggHepN6TJ5MwJ80RjRSmfvTFWaFQ==
X-Received: by 2002:a05:622a:1705:: with SMTP id
 h5mr40952650qtk.331.1641226803548;
        Mon, 03 Jan 2022 08:20:03 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 b11sm30200651qtx.85.2022.01.03.08.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:03 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 19/24] python3-ruamel-yaml: upgrade 0.17.17 -> 0.17.19
Date: Mon,  3 Jan 2022 13:18:49 -0300
Message-Id: <20220103161854.301148-19-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160136

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...n3-ruamel-yaml_0.17.17.bb => python3-ruamel-yaml_0.17.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.17.bb => python3-ruamel-yaml_0.17.19.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.17.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.19.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.17.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.19.bb
index 4eb0274166..a0f5c89846 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.17.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.19.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9751de4cbb57d4bfbf8fc394e125ed4a2f170fbff3dc3d78abf50be85924f8be"
+SRC_URI[sha256sum] = "b9ce9a925d0f0c35a1dbba56b40f253c53cd526b0fa81cf7b1d24996f28fb1d7"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.34.0


