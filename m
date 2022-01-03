Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6D7C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:16 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.30344.1641226755753693079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id kk22so31410782qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=YJFFa+ZJ90Zg6hVK7uIMBBN/pzcjw8DXUvA9VMM/MTc=;
        b=bglFDYvDVi3VEg4Ws+n2BT+Rce51tJ9Jl/k0Yo0UPcOwPUAVU38exnHMbRKDTUZIXl
         rPdCD1QRPWw3j93ma+RFnmYh1/JUR98PwrwHADkZAAmIn4Qo3g2P24sdmKh5ETkm5suC
         hPpOx4VvBEmfQ8Cg5452wYQgTz4l53FKSUMXJNY+pjVKcW8AQflcZK1uZo/o0Wp4w9B3
         K/+vqvz6NDNNE5ieb7V6UrlylH5Ktxs0jE0UWbUKGBrp6k2dlzHT44ADh0RNv4U033Wo
         3WN+7TEfCW+zhsPHgqFPJLZwg2hd9OJptanbHtlUVO1p0Nx3HNkwXCXYEpmhxIq8KO3B
         TRjw==
X-Gm-Message-State: AOAM530DuoK4e896J/h7d/Eggu7ElXZcuj5AK0PqZSFTAx2TU5NA3QRr
	3raG7LxHlG9am0mF7KrpqunqCGwZiJuaD0Bl
X-Google-Smtp-Source: 
 ABdhPJw/aRka2G4locvNsLBNwdSi0Yp7DTyjXnFKhJArfbPRkogYFBPw9gSj+VWw+gn+v9dXptOGUA==
X-Received: by 2002:a05:6214:20e9:: with SMTP id
 9mr42274058qvk.28.1641226754504;
        Mon, 03 Jan 2022 08:19:14 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 r16sm30290062qta.46.2022.01.03.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:14 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 03/24] asciidoc: upgrade 10.0.2 -> 10.1.1
Date: Mon,  3 Jan 2022 13:18:33 -0300
Message-Id: <20220103161854.301148-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160120

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../asciidoc/{asciidoc_10.0.2.bb => asciidoc_10.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.0.2.bb => asciidoc_10.1.1.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.0.2.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.0.2.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
index 1b618175bc..1e7bcae1fb 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.0.2.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main"
-SRCREV = "7bad9d2e77f7d384ac9042732adaefd4f6ed8979"
+SRCREV = "9bb083349e66a6b7195675b04e9adb2d6e21093f"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.34.0


