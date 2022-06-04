Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6D9CCA481
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.8734.1654338391908104990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E0DJoPVt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id a10so2654990wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zhn1KI88N1RnF+bvvYpg0n+AmcCCyRw27ET600NKv+k=;
        b=E0DJoPVt2TNDdFirfzQJUV/0NLGqhLpfwqu7h7t9kM9/mrG25lFI06yAdJJgFvEvYT
         lOFug7cfFk3ggcMVneugXALJQYSTZxCu1Oe1TViNS0e5AKodBNeqmlGChswd6y2krBmf
         /n5llGzouLhntWuKyY/T/NERH3fAuasIpcFJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zhn1KI88N1RnF+bvvYpg0n+AmcCCyRw27ET600NKv+k=;
        b=JxUMYUqfW7kWLF3H8E/qkTbVW1sz+Ofiy49Ub6Lw4fGNTwwqlFSeVJASJarxZLvA+h
         jiNJuA346938RaNe/lBP8SyntWwZH3QCf2VcEGIfMeDogXPN3N+DRhFA18bHlHvI/6Cr
         6snKixJrlAWS/jtmEdveWgkM7/6ZqeD+KZW3Gipub16M7oWvTcxhNVLyPUb1roAZ5tCr
         +dPid98TA2aw6nVs84E3mhhFQFzRoiCqV5xm1A8QVHhxM5JgSEP207MzZisCv/RhIYtS
         Fxfu0ckbY7jNjSVnhbgtWMhawzrS/8hLWAdmH7uJmfzaMiPdtdsQHvwjE4uxNpxxjpMw
         iabA==
X-Gm-Message-State: AOAM532jVQuAdPfZyNE3cjupHPwWOn8DxoD9ebOcmyFPz4UMwfWJ4xKe
	IKnUBD54NSqvnQsi4o/naH0PrvGBlk9G7IuO
X-Google-Smtp-Source: 
 ABdhPJxSjB3WEErEIEh5ztKojzl/ZBvtD9a5ikUtQJR99XfbmdOzHhtG/guGq6WjDHNzxEZU1NQhkw==
X-Received: by 2002:a05:600c:35c2:b0:39b:fa1f:4f38 with SMTP id
 r2-20020a05600c35c200b0039bfa1f4f38mr12841325wmq.22.1654338390074;
        Sat, 04 Jun 2022 03:26:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/17] python3-sphinx: upgrade 4.5.0 -> 5.0.0
Date: Sat,  4 Jun 2022 11:26:12 +0100
Message-Id: <20220604102625.199845-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166550

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-sphinx_4.5.0.bb => python3-sphinx_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_4.5.0.bb => python3-sphinx_5.0.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb b/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
index f4d27f32753..93edd9db7e0 100644
--- a/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "7bf8ca9637a4ee15af412d1a1d9689fec70523a68ca9bb9127c2f3eeb344e2e6"
+SRC_URI[sha256sum] = "464d9c1bd5613bcebe76b46658763f3f3dbb184da7406e632a84596d3cd8ee90"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


