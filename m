Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D7DC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:58 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.29885.1641226798409485988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id r139so30829948qke.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=wy0yovsQgkJ7W700E7f5xa/TJoDthkdw2D1b3arDNFQ=;
        b=qr/Po8MZFGb3yoSoQKe3aKRKULsh1mxFoQkpgqFRNbym1PgMCfDRrg3HtfLIIvEV2e
         4RcN9bJUJQLd8FfLI0SWBOlRg0MDWOpYSSbH+e3nh24Kq30iOz6ZwKVHzIhfw/THyTHm
         LhoZ+gb3rY5qrBlIsRS88gmss2BiOxXVvSnE6zje4F4R2356kNqgQNBXyXVeJfyRvIFM
         bjxwwSncw+JBRQuYS8KHoVgFTd5SF/f9ufDzJJphvQmpeOlTIauPteWIDhabHs7OHPOz
         5k7x1BwHAoweQ7nMfRfk/CmC3x4nQ0wl9s+MpCxeOLhW0eu4o/O/Ou4NdcnDMLiP2vmU
         ojTg==
X-Gm-Message-State: AOAM531jMVbpOrIIuZrHqlwK04R/LZoFC/N37TI25dcNiwCBGOPIP5tc
	4OF3TZnvnLi4NTvmeWfR6VG/z6xZY7N08qNL
X-Google-Smtp-Source: 
 ABdhPJzYu9s2zblJNyQ9QDcHwQO1qKVsOTmQpZJVKqnO+cIvIIjT6DAYyODnvu+Sh1GV7gEK57IOQQ==
X-Received: by 2002:a05:620a:14a1:: with SMTP id
 x1mr32446218qkj.13.1641226797317;
        Mon, 03 Jan 2022 08:19:57 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 f21sm29749537qte.52.2022.01.03.08.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:56 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 17/24] python3-importlib-metadata: upgrade 4.9.0 -> 4.10.0
Date: Mon,  3 Jan 2022 13:18:47 -0300
Message-Id: <20220103161854.301148-17-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160134

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...b-metadata_4.9.0.bb => python3-importlib-metadata_4.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.9.0.bb => python3-importlib-metadata_4.10.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.9.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.10.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.9.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.10.0.bb
index 0f397766e9..ea19afc0c2 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.9.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.10.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "ee50794eccb0ec340adbc838344ebb9a6ff2bcba78f752d31fc716497e2149d6"
+SRC_URI[sha256sum] = "92a8b58ce734b2a4494878e0ecf7d79ccd7a128b5fc6014c401e0b61f006f0f6"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.0


