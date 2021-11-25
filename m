Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF87C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 16:20:41 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.13865.1637857240178677455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 08:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qhy7a9FF;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id d2so12143946qki.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c6ZOU3KoHEQ4vY5ibE36zEjs1R81vys+1hqd4GFfaqY=;
        b=Qhy7a9FFBh2HDW5LPAKayTHGamKTHSKQoJUVWyZzGKk+lHvM09JBygPxU98B8zEkIc
         JESHRWTyO40pf7x6qwaD6APL7clKq2Hc/dy3mGcyoI3Gc0l5fcXWTor5Ru62T2F/HZSL
         7IaGqLbD/1JJSEd5c3/gLdr3FbQP24Vj1tmJIJQ1ld4FlbgZgyk50gIy6umqYFs2VeGL
         chknkuHsmkHpcJz81QMilNy2Ut4cnMMWNjhxz8GOAhEOqZ3vN3SPL+hxkJu5nVwC7M1a
         prMNFzjR7lyTLv5h8dPdHvOJChakqZY6pZmme7hF1l/ZRO4hvw5QKMKkM7vESajYyEyg
         U2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c6ZOU3KoHEQ4vY5ibE36zEjs1R81vys+1hqd4GFfaqY=;
        b=Bb0wvOP/APBRLu3Tv/ztI5A2oKqjmY43A483J1akJ/BpHbUZncLvQQKm1TjdBSYdps
         5y9SEwna+79CSUkIFTeqQuYc9Az4ZB0C4Z78xPLbRVUnKObTXZSiOPZzGuZ8/6obtyDI
         U4M6YZ62G7oIH1EgBQCfRUbwE45TDPHtzMYn1ybAdejkrwI/nRBWfvoxwTncZALGf4FO
         dzQNwqOWVPckwgQJhmnVOuorHxf6iqjGO6P3a6b4IRsSTG2afZxbLQLqggLEGmt/nWyN
         wPZwbuVWFHumTGVxbpaDf+nS8/5F1NiCAJ8jxFEJ4j08SNdHfP5goIiXhJDrIEpYYLW+
         yqIw==
X-Gm-Message-State: AOAM533/ufi8og1SV+AjjJzEWVLvNfFXSnN7EOA07v/o4xHnnUkyis8T
	Ij2X2yaLoVbDuS7z9R9Pie0=
X-Google-Smtp-Source: 
 ABdhPJzuOC0UaY7YO9e09S+w/rg05ptssh6LFGscJheKbh5HNNme6lYcGw0MlVsMDCEY1eAQ7yXpFA==
X-Received: by 2002:a05:620a:4251:: with SMTP id
 w17mr13644106qko.284.1637857239192;
        Thu, 25 Nov 2021 08:20:39 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 f34sm1754212qtb.7.2021.11.25.08.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 08:20:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] python: update jsonpointer to 2.2
Date: Thu, 25 Nov 2021 11:20:37 -0500
Message-Id: <20211125162037.21363-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 16:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158787

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The import from meta-python was slightly out of date, and the
2.1 version was grabbed. We bump the oe-core version to 2.2
to match the latest meta-oe version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

This goes onto the queue I sent for dt-validation. While I
was preparing my removal queue for meta-oe, I realized that
I had grabbed an older recipe.

Bruce

 .../{python3-jsonpointer_2.1.bb => python3-jsonpointer_2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_2.1.bb => python3-jsonpointer_2.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
index fb3d9e0da9..225fde7556 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962"
+SRC_URI[sha256sum] = "f09f8deecaaa5aea65b5eb4f67ca4e54e1a61f7a11c75085e360fe6feb6a48bf"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.19.1


