Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA19CC433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.3099.1639000813491959348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mpW3yFQ3;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5227246wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XNo63M7fYoOha0qpIk6HDo73muv1rxEWyRcpqv+nzo=;
        b=mpW3yFQ3XOvm9K+GqvQHhvUSN2MxdgGJStXefhxVVRL3lFrJZcB7KATfhAKBTksvQk
         avPutsAC62GEPC90y6y6O/DCc8avSDUVshMoR9/q933FeYxsrc7Zduz3QEcdtaryVlGC
         4lEY0GiwXmsvY3mvbyJrcXDjOAcHWsc9hei0WC+Y2KGJaIguXWDbc1BbYiwzLnP7pAm8
         MuLuuBYekZrGm2Onw0V7+vEkRSm6uRsqvSizkf0A/XaClrXcz6slm0f5VcI3K41iLVGl
         7k4omP4flP64UKice1ngJCCkdCpjkem8YJfU5pBfE6hsSLTF7EeznFa2k2A/fAIP1yKV
         WcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XNo63M7fYoOha0qpIk6HDo73muv1rxEWyRcpqv+nzo=;
        b=6ISXFtYcpgP67SaHFmVMalZW6mX1DVuJRLn8LGSO4K/T1BJnHznT5v7xAZsvTsO1SE
         PfMV8f6p/OcXmzj+Bhfzgid9iYP4QGAKXVhdUq2uPCXQoEOzHBKn8yo5cPT3Y8r5yoDK
         A2qFk5R6zMu25mN4FXv174NyWxKEyLWQoJFqA/PFS4+3OlxP0EAZWTbkToFrZs0ATRLE
         WAcsPOXbmlZRwrf4JSaJtAp9mVnFe+SykRmtmuSBT8YgPcb2lUUOU5U7f9r0vkaE+vgi
         MrUBmFPdqq9NcoF5Ne+dlGdBxF4YUDCBeJASthZhDGtAe0tT8nLhqZRkLAbfqY8+6xEB
         e0hA==
X-Gm-Message-State: AOAM533CkrwSZov9bB5mjiB3sGB+zz0JTmytWj0IwpIEss84b5UkR1FN
	ypaV+H1b3yMvzJwim1gHtqi+cQiri+PWAA==
X-Google-Smtp-Source: 
 ABdhPJwyk13fzEorIanvDfKrF8F5dNT2bvR5a80a+ou3nZ/il/ZIfCob9kwC+PqI8h4B5WlEq8O5iQ==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr1695114wml.148.1639000812080;
        Wed, 08 Dec 2021 14:00:12 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/29] vulkan-loader: upgrade 1.2.198.0 -> 1.2.198.1
Date: Wed,  8 Dec 2021 22:59:40 +0100
Message-Id: <20211208215947.1979470-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159388

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{vulkan-loader_1.2.198.0.bb => vulkan-loader_1.2.198.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.198.0.bb => vulkan-loader_1.2.198.1.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
index a538f6b270..446a2d5c05 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.198;protocol=https"
-SRCREV = "fe8479aa022a011d74fd862749825e07891e854e"
+SRCREV = "0ca96994f92b6f21b37badd6c99b22f61bfec932"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


