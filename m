Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66723D10C16
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 09:23:42 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.26631.1730021021190440621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 02:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDMBD2j8;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso3840216a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730021019; x=1730625819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEHeO+asHzoUMteqyr7sX1cfYkLxj6VxbnIFT8/uLiU=;
        b=jDMBD2j88Y/XjXgLbHawgvfjZd8y5DZkUArNosmq1T9eWIydPm3MpbuDx9aV6CdRaQ
         7NuH2nkZ8vVbx4hmbAW6UVoP7aYHjcxXs3N2lWmzGDLwaOso+nqUwE1Mqf05haQVvzh7
         19yKv857U+wd4Gbhmk6NcMF+n4t0LXAKdbSBV33dgr0jtfG8K6TZDcxUIqckuYU5fJ6+
         W9hZVDT0UOIvkCwTNgpTLo1t41cxx4UNUpxuuuipiykL8WsrXvSFzn9oxHYNU4yy+3AT
         mIwF4LwHLO5deVJUWWoL4FMUbC+sSkY/gnlMk9XnT/27pADWm6lOeRFArPJ98i0+czzE
         krEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730021019; x=1730625819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEHeO+asHzoUMteqyr7sX1cfYkLxj6VxbnIFT8/uLiU=;
        b=a/ZsNCWBPpZA00vicWh/UgW7Oia8nECtMlWd17lFbdiwKCxoQEkHYhm/qqenp4ROac
         F7Dff9rAcZebLSSQxhId/IsiJ2atkGq02vf9bXYhaJjYaTSmiWH4vbZDg0/f20R/n8g2
         VnUunsM8db4670hZhnouzQ8ldIE3v0fTsKzNV9Zm6wi/NwfAtI4Qnvzx9PcYUfz4Vqsj
         3HA+a9DwDtRv2Dj1i7zIc3Ds/MGHtX5r30RCO7DNwjfxHGqGvRQfiEBlBZLOYVPEo1vy
         BX+8YiT2YjbUnmedE0iDdWydo/V2RcfXSpKg5v5TUaj/KWtkp8Z2dP/sTupIujkYoPzh
         P9Ng==
X-Gm-Message-State: AOJu0YwGC4Q5mpp336LnqfqzTTDoVYxdSKGtQ2bBhaTT6FEMugHsOriR
	jFcQaORtNg2qUx//QFTz+B+yUNkImDqmRCA3rX0E7NLFmXSx7KThHUWitA==
X-Google-Smtp-Source: AGHT+IFIMhoQ4nIptQujAbs76+ZFYLq6v11UTGVs90N1R/xm41MCFdQd9EhLLtREmtFFA0qZSILevA==
X-Received: by 2002:a17:907:94cb:b0:a9a:33c:f6e1 with SMTP id a640c23a62f3a-a9de5c9f681mr432870266b.5.1730021018829;
        Sun, 27 Oct 2024 02:23:38 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a085504sm258075066b.202.2024.10.27.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 02:23:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] python3-lxml=v5.0.2
Date: Sun, 27 Oct 2024 10:23:35 +0100
Message-ID: <20241027092335.3109327-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 09:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206391

* minor upgrade to fix building with gcc-14 on host
* contains 31 commits:
  https://github.com/lxml/lxml/compare/lxml-5.0.0...lxml-5.0.2
  the important one for gcc-14 is:
  https://github.com/lxml/lxml/commit/663041a56a075a8fa1e6ca13ba4c6d1de7043ac2

* https://bugs.launchpad.net/lxml/+bug/2045435
* https://bugs.gentoo.org/917562

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.0.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.0.2.bb
index 66cb8b0938..d6e55a0dcd 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6990212e4d20ebefe"
+SRC_URI[sha256sum] = "6399703c40ba53e2c3b72fdb56cb908d2b83c08082ecf17de839b27e68d1e598"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.0


