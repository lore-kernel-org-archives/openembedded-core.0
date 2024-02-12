Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5335CC48BC0
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6813.1707746095786396115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BT05Ywfa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e0939748ecso2268157b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746095; x=1708350895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H05dsQvF5xuAcIGe+YfF6lte8hn1xuAVKbkR0iNWE9Y=;
        b=BT05YwfaVimfAZxafTNoN2LeHUxzfkjpJVXKQP9ZafyCpEneoEbk5W2TqAw0/E+eku
         WAQ9tLd0p56JiaE6J2wsaMRrtw+fsKK+6GAKFkMDaHtzF0eA/GXXcqZIz8/XTKQt2K1U
         TKiJWETrhdqAvsCEoo8GqcieAPzUbHMHadOgLs0vRgUmffT5MtfvpCQSHdLqHVz6QgCj
         ZJ9S/++UcigaGW2SD3SPWTfsKt0lZRXrimJcmulManmOrmW5mCoZyCDBRW3EimGiE3hh
         m0HQUoVYFX1ycCqUcP2WbJoppRE0lg81l4JQ2VyyuucOBO1dl8fuj5BwBCFLo/GDMDBt
         QEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746095; x=1708350895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H05dsQvF5xuAcIGe+YfF6lte8hn1xuAVKbkR0iNWE9Y=;
        b=E7LuKvx4KjHCBRdV8jpIeMMqrY9l1SdTkwQmGLVxIJp255kt8J/7Owz8Q3Z83sS+rK
         Y74wW7uZ/f+MQpbXGNhcG0sAnLJuKwPlel9I4beHB+5BZq2fYnKzMbilZqJd8c948taQ
         9LpF4pydbczT3ZBVofueHmbWxKYrZFFVsU/XgwMBz61lpoD+cKmPj8/N2bFXafqfOMeQ
         noEyynbVan1/ntlnxnv7BHJ/q31pvwRqS79DPxuNmzXKRD7q2OoApII8f/jEVx1nr7MR
         LPwX/QX/ZSf3aaOPvOIdTDU5qfpVuYsSCkoJraa0TO997t9nItPW2OZ4oHCkfZkRBjen
         P38Q==
X-Gm-Message-State: AOJu0YwMWRM7/+68fd1NPNwC8dGz60WULJhevDBKorREVw8QjEXAVzI4
	PSLRXqsbmZHFaqpMzDyHPyHd+Aejf4WSxf24dj7xiq50iz8xwcaaLyYzI17maOrrnJfj4jrqvCy
	QLTg=
X-Google-Smtp-Source: AGHT+IGzLZ+pvRoMQcSB4GV7NlSxcqL2gFpi7X6EpRDhF/l2e1xx+kMwWMufsVKxV6HjxZTcs1XcKQ==
X-Received: by 2002:a05:6a00:2fc3:b0:6de:5e6:8ade with SMTP id fn3-20020a056a002fc300b006de05e68ademr7072101pfb.24.1707746095051;
        Mon, 12 Feb 2024 05:54:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] ghostscript: correct LICENSE with AGPLv3
Date: Mon, 12 Feb 2024 03:54:19 -1000
Message-Id: <8e192a2e0c2fdad18ea4c08774493225f31931a0.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195329

From: Kai Kang <kai.kang@windriver.com>

The license of ghostscript has switched to Affero GPL since version 9.07
via commit:

* 3cc5318 Switch Ghostscript/GhostPDL to Affero GPL

https://github.com/ArtifexSoftware/ghostpdl/commit/3cc5318

Correct it with `AGPL-3.0-or-later`.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e0d1e4618f..e99c740685 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \
 HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
-LICENSE = "GPL-3.0-only"
+LICENSE = "AGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
-- 
2.34.1


