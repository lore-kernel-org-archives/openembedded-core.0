Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.41058.1590446249131364805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yMQzZW12;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id z64so4761152pfb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vGP5v4vX+W8zuzuwF6qkbYHpP49yKIdPQ1nzBwAdzWE=;
        b=yMQzZW12Ymo9v/VE2OU3Eudq5UjMSsRLo74y1gUstYLNp4vDYTYWA2BUA4s//LW+b7
         QjwSbU0Y9KGc8AjpgOdgUxtldjZdNaajZOWGg9lZ5l5alLax16SKaX7aRCPLDGh3MBHQ
         Z9ccW6Q8SSsHfsJNDy69rmeFhFjXFyF0SQ2EcQKZGCRBaGH+ETRmIpVYW6Z4/0gZLiTx
         rzwSBxtcQMBPdxiZCO/AvuRBylbQlCmQe+Hi27N5bTNasSc5ANeTn6pE0FDuM+N08weE
         9M+8M+VBH6ryc7a/2tSWyVI2S4E8XflVkM4ZgQrXYuVB6YQ+tkr6IqCNqqE1nK5dykyK
         88tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vGP5v4vX+W8zuzuwF6qkbYHpP49yKIdPQ1nzBwAdzWE=;
        b=UKuFlH3lJgFKPuxowgIZJmGyUEIJ65vBrwuXKQSop9wWmL5id378PYtNk3aQJGPVwM
         DQU6MrO2CNjcgrHJq5SQ5Umu6q9bAAVPa2MHukDfPCKbA0AaW/VJgwfjr4zFUsBRUbsx
         ze3lEfVhchZcADPZbFhQHHhNamEQ8Lfwj5z++EbxbDFk0OjiIjMZ0rW5LsQEgfSKJ/fJ
         JWLK6bWvrYqAnQ7d13dWvg1k/GJEj86wlZvQVNEFHlz47SKclAG5p3D+BMZvy1GXB9Xm
         QTvr9Uw0/bHoh2vQGb4uVqi9u8AnENMqpr4WR/IXN5fD7JkrVlgnofrClTD3Raxn8NFT
         xgvg==
X-Gm-Message-State: AOAM5322ZV0MvMNbzrfsDmEg/kYGp+BXnf8M6M3MIn73sSEzz9dJurVf
	9e6TtYDQodIpX/fNX0pObELEcF+L8I0=
X-Google-Smtp-Source: ABdhPJw/CnfPYRi4NXmScMRGx4/OGGEmJCcaQXYeDi7IIjyGbAkSK1mL9vdfaoZgEUkU7f0/uMEviQ==
X-Received: by 2002:a63:1608:: with SMTP id w8mr28546868pgl.232.1590446248196;
        Mon, 25 May 2020 15:37:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/17] python3-setuptools: add the missing rdepends
Date: Mon, 25 May 2020 12:36:50 -1000
Message-Id: <d19d1ccca3f86a59a72023727d3d804c2e9d18dc.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import setuptools.lib2to3_ex
 [snip]
 ModuleNotFoundError: No module named 'lib2to3'
 ModuleNotFoundError: No module named 'pickle'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit be5c3c989d75290863cc7aef9949cf6e82d3070f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 58267966ba..29be852f66 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] = "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992a
 DEPENDS += "${PYTHON_PN}"
 
 RDEPENDS_${PN} = "\
+  ${PYTHON_PN}-2to3 \
   ${PYTHON_PN}-compile \
   ${PYTHON_PN}-compression \
   ${PYTHON_PN}-ctypes \
@@ -25,6 +26,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-json \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-pickle \
   ${PYTHON_PN}-pkgutil \
   ${PYTHON_PN}-plistlib \
   ${PYTHON_PN}-shell \
-- 
2.17.1

