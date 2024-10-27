Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65B8D10C19
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 10:34:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.27402.1730025246513106274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 03:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cIJ80VZH;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so34210265e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730025245; x=1730630045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnVeO3VgxCfPe7N8i3fIEHjIPc5VPHOILCpfWEypXcM=;
        b=cIJ80VZHsPl+EXrzTFjEHT3K2ufrU74lwLsEYDMnf2wVVdQvT5yVFlYcn0w0w/5i5J
         n4XR+v4wDgILclP7wOCFkFOBmr2Gg7dCIHkekGPAEeFzJbjqe+iDXW7KKyItSkRrbDJa
         vYb2y45iDWC4Nf9Y7CUVeINFPO7jJjgRWV4ykQax29PfbxsptqkW7PoIohJwUnbJM8gF
         p5yy76ahw314/QsaEbSkKZmTbQmkNVbFS7yotFAUdi1vdCKMsBAZ8PMGvYOjNvIFBd18
         VLtbbTokqzunm0M+w5yrA30QuApnFRoQGtlSuGVfLVSI6lYdhOb68lHS5JApXd+3Z/Us
         ZLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730025245; x=1730630045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnVeO3VgxCfPe7N8i3fIEHjIPc5VPHOILCpfWEypXcM=;
        b=jOULhRE0OU5W4/zlSQT2duvxdXw/Cec0Ld5eUy3o7QnXIraI4YgxXPQOSO7+w/mnBf
         E5RgWrUQAuIPcrj4rb1quuuC116zg0gj4+dYkw998MleWYtvYX+LnftTWiyOnONYCJ72
         gj4vQYlVSRT2MwQqKWTW5Zb1hyl0FPu1JG+FnsXhDFruzO9yCtBnlChm1xnzGvfCBrtg
         0WWTOd5ioodFru3RGs6FqpfYF37hU6+JL3LjqgJ293w37348gWoZB1qrbkdpCOXClScN
         b2TlSyflBWKzQqw8uJk99j3BPgy6k5REhGQ47g7PV422/7raE83pR54nFzSM8Ulxor1U
         7vxQ==
X-Gm-Message-State: AOJu0YwWgiFQaIM+Ne/uGtmiQTrrRe4s87P0yvT9QFJtxlyT1hGP9lU1
	AeO0DbXpaqUBlmlUvCdv0q0YvKphohTlAyhEXcn4RV4LyVaw2GFqBqw+qg==
X-Google-Smtp-Source: AGHT+IHtkIgpEKhLRDL3UCrqC1nIX8H4mVrcglNsClHNunUFfOLZGhQWkb/qAN2C7TFkzZWBbTY31g==
X-Received: by 2002:a05:600c:1d19:b0:431:5655:1ef3 with SMTP id 5b1f17b1804b1-4319ad0d11dmr32445385e9.23.1730025243147;
        Sun, 27 Oct 2024 03:34:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573ce2sm71695215e9.10.2024.10.27.03.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 03:34:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2][scarthgap] python3-lxml=v5.0.2
Date: Sun, 27 Oct 2024 11:33:55 +0100
Message-ID: <20241027103355.3299994-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206392

* minor upgrade to fix building with gcc-14 on host
* contains 31 commits:
  https://github.com/lxml/lxml/compare/lxml-5.0.0...lxml-5.0.2
  the important one for gcc-14 is:
  https://github.com/lxml/lxml/commit/663041a56a075a8fa1e6ca13ba4c6d1de7043ac2

* https://bugs.launchpad.net/lxml/+bug/2045435
* https://bugs.gentoo.org/917562

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: drop PYPI_PACKAGE_EXT (I had this locally while testing, but forgot to include it in v1)

 .../python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-lxml_5.0.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.0.2.bb
index 66cb8b0938..c0b385c7ea 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
@@ -18,11 +18,10 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6990212e4d20ebefe"
+SRC_URI[sha256sum] = "6399703c40ba53e2c3b72fdb56cb908d2b83c08082ecf17de839b27e68d1e598"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-PYPI_PACKAGE_EXT = "zip"
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-- 
2.47.0


