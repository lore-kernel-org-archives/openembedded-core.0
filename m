Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F70C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:22 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.2223.1643826500794356927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QhtRJlGr;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id o12so166918eju.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/OIS4Z6X4fXzfwAkjamisR752Ktlyttl6TJAE5dPydQ=;
        b=QhtRJlGrMnu28m9hSFxcmBPXZjaq3VnqptptzJ38KptbYFXE0o0PArcowEDQAKR5/E
         mxVjYJ2OiKcKqy+TnvQGJQ2vtf1FIdhy9PJ1xKzGnOiDrXYkGamNdQOhdQJLbpcKdDxM
         7VNHoq/AnrYbn0fTsu7iN647x/bFxXrhxZJT8PrmvL+TQhhDmp1XnQQ6Ff9NWClZjUHI
         GEmePqewlua5BnltM3UZcmqQYAAmYXGryV4C802eJUKY8maydRglY3+xMBorXlzuW5E6
         3gyEhtRYNZuR71Jw5cJsOwu8c1014O/elLAdPxg3MhEn+dRmfLCbFNiKcNZzm8ZaCLwg
         AvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/OIS4Z6X4fXzfwAkjamisR752Ktlyttl6TJAE5dPydQ=;
        b=36MP+ISVzqhF4DVbicMRJx842nXB0Jsn8dAx9qriBpTTHwVMVd5PuRM72vdIHpf1UV
         0lhWas0iVo5dpuOyPQQs+LwUn/JUYrrT87lwSIAhKf9nwMBhevJlNdgvKJnhcJM+6AXS
         /HOauIyZixERA3pfi6YBQMA1g8Pe+JSO7DTG4kZJcLf2embk3GRkXJr7dN2x8wTcfV1E
         7Xn3vlxNOL49ttIMk8pXLktsXsgpmJEMIZZaIgqpDuAGOqkDEvUhROLMW49DQqPf19Aq
         0KjmmmFa2wzF7X1zDVB4dEH7e3h85eQnYF6LKgOU0rGhs4BxsxvukUIBkmKB5mS4rJbt
         ru1A==
X-Gm-Message-State: AOAM532icJnqxzE7DuBSGhNFFb/WwLBr1DloImgntM8t4dM30aNbNUXn
	EhPMMFgN+h4CEq3Xk+EKC56OZAGFobU=
X-Google-Smtp-Source: 
 ABdhPJx9z6d7O846V4UWTjUvOZ9wjGBzJsJoZ9YqjtyxDgYJsu5F5RatYQpH+GQhVs1DrRCyAnZgvg==
X-Received: by 2002:a17:907:3e9b:: with SMTP id
 hs27mr26425509ejc.72.1643826499434;
        Wed, 02 Feb 2022 10:28:19 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/33] python3-cython: upgrade 0.29.26 -> 0.29.27
Date: Wed,  2 Feb 2022 19:27:44 +0100
Message-Id: <20220202182758.919991-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161244

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.26.bb => python3-cython_0.29.27.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.26.bb => python3-cython_0.29.27.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 278da5ea72..aeff3e77ef 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "af377d543a762867da11fcf6e558f7a4a535ff8693f30cce123fab10c00fa312"
+SRC_URI[sha256sum] = "c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.26.bb b/meta/recipes-devtools/python/python3-cython_0.29.27.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.26.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.27.bb
-- 
2.20.1


