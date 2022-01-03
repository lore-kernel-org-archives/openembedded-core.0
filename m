Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E355EC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:46 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.30162.1641226786456202242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id kk22so31412312qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=2pfnM9aj7c5Xo9UvGtAsOIqx8C6uu3xhzRKlLWSOhyw=;
        b=p401KmV8UT+BplXNKmuS3vS5bjQAaDFPN2mYsC3+qYrEh12++ZcxykkX12taSCQnFq
         U9gCxN86ahDCOdvs0tEQZOXOn/iYmJA/IncnN9XM6FbCZ2QoUJIllZlz/xiiIdA05iOg
         oT6XYJCx0eHSNy5Yo8bVuxRYH+QO/TinpOAdci3WNpc3fW7moWc4rZaWIa8b79aYBga+
         oFhSCwlzGBpU5kPGKzbTWEKBwDrCGZYHig/CUCzDl+1jXzgt5hPZox6bl5p7imMqQLD4
         luxwRkxbtzUbojI6ZPQphNnk2g2YhWafv/+a+YtkWhxbkGGUV28NnnCVHa0ulyrkANBK
         ygEw==
X-Gm-Message-State: AOAM530vxUNsoQudLnadD2Tdsw5P/SNoBwJ8UPZVijFE3vfqzfuTGwHP
	KXfjmnULgPv5ki8cgOXqloHEKqoFq8VpHHyE
X-Google-Smtp-Source: 
 ABdhPJwUqZjUQf2rOVWt+MkCi7S2YN0u1s/jaxBqAQ1AzPiGxa41Ok6K1icXU8dxa1dNfzGmOxONXw==
X-Received: by 2002:a05:6214:19c1:: with SMTP id
 j1mr42826539qvc.126.1641226785373;
        Mon, 03 Jan 2022 08:19:45 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 g14sm29404966qko.55.2022.01.03.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:43 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/24] python3-attrs: upgrade 21.2.0 -> 21.4.0
Date: Mon,  3 Jan 2022 13:18:43 -0300
Message-Id: <20220103161854.301148-13-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160130

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../python/{python3-attrs_21.2.0.bb => python3-attrs_21.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_21.2.0.bb => python3-attrs_21.4.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-attrs_21.2.0.bb b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-attrs_21.2.0.bb
rename to meta/recipes-devtools/python/python3-attrs_21.4.0.bb
index d52237f267..d1dde29d37 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb"
+SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
 
 inherit pypi setuptools3
 
-- 
2.34.0


