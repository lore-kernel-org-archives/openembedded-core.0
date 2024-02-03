Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CDEC4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 07:56:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.13491.1706946986822303458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 23:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dcb8Xh7d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33b18099411so1667174f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 23:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706946985; x=1707551785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu+K5gab+YNBj1VfPahSVCiwSG0ascLGstP69MvuOSc=;
        b=dcb8Xh7d0bqwZfm1uKOJPdvkJasHPqnwM4dF9xEU+KuwnZ+J0Km7yLnAVYUm27ySIZ
         E+vfm7eV5JUni2hvZnnubMIrE5w67WpiAeQVQIKMOQKP441hYnwC3j0DCFvt2oJPbk5R
         SEdbgAaLN92zXCbQKjhL9n9FiVXFGokO2ZAMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706946985; x=1707551785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu+K5gab+YNBj1VfPahSVCiwSG0ascLGstP69MvuOSc=;
        b=RoWJDNE1qVnfnQG1MJc3K4S/SDsj3NbcamxdTtBNVgto6APwDHNuWPEGiI5hI7gCcw
         rjOWWZQx+EO3xHZXzQzBsAdwY0+HaAgGemWRQJalfAPURh6/l8UfeWd+r9/Y9zZ6UHdN
         L92gqbthGOgBdS3O7asOd05CsNbQV3fljE/t/Sd3g3cWaonmMWi/RNLG1WYiYp8jYytL
         l6Ius8u/Uk51YZWq7Qfz7TakHL9FjqE62en4KtfEKdFbyLoV1HlMm9N9IAuQZpxewU8f
         yohbGcHJH8bvOlpUtTnskqaE/KhrlzA5iKSfz/R1wdcw3mNNjGemsZlPS0rBn7wKe+RH
         v7mg==
X-Gm-Message-State: AOJu0YxyDj55OdrziXzh7vVjl5Pg4Ygko8m1ETQQKAKSdgQ/QU1CBZ/u
	z7IzRhnz+Inf9DpclrkyNJpZbpnKpAUefwJ95j2qcad8JWNzA4b4J5/1Q/K2DDUDZxaqw+LdGpp
	h
X-Google-Smtp-Source: AGHT+IGRZ3nHSSDXsjkewV7saqO3+fuGaiT9qQQkVninf+p/h6QIJAuf2+B7oF6jMwYzNJqDN/aHGg==
X-Received: by 2002:a5d:4d10:0:b0:33a:fdc3:a61c with SMTP id z16-20020a5d4d10000000b0033afdc3a61cmr2941485wrt.31.1706946985080;
        Fri, 02 Feb 2024 23:56:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5be5:6aa5:96ae:21ea])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d40cf000000b0033aeb0afa8fsm3490195wrq.39.2024.02.02.23.56.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 23:56:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-markupsafe: upgrade 2.1.3 -> 2.1.4
Date: Sat,  3 Feb 2024 07:56:22 +0000
Message-Id: <20240203075623.2150849-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240203075623.2150849-1-richard.purdie@linuxfoundation.org>
References: <20240203075623.2150849-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 07:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194833

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-markupsafe_2.1.3.bb => python3-markupsafe_2.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.3.bb => python3-markupsafe_2.1.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.4.bb
index b346cc85d9e..b245ce6fe95 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad"
+SRC_URI[sha256sum] = "3aae9af4cac263007fd6309c64c6ab4506dd2b79382d9d19a1994f9240b8db4f"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3 ptest
-- 
2.40.1


