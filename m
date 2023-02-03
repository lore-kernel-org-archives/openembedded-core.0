Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50818C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.17903.1675446663082409502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QBU3JDJH;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so9504361pjd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2G96/UgPgclRz4bzFQr2SdgPyrcvDJJ+Nro3odf7rvY=;
        b=QBU3JDJHaK9KQQUVg2WBFLREEyCGQ6GsNi88syiCcKLHFZ51GppVyCcpmF5ViHQQ6T
         XJJvv2nNfQSM3QWa/ysISCJClrHiPZ/0GKg/z1AAL4NABa1QUQsZ4hv2hGYy0HzDwoSA
         WwZDVnDJRD1xgz/h/TlGPq7UJ+m75ccw6LfbXJuOSU2iBinnmbx/vGLouNnDn6CRUMWo
         U22xwqpadxJXX8xVHYdzZWm2xTW5OUS4sgfGLOM2l4UVb7KqAIMS3T2KweyirANwSltw
         0A86tGOOx1QgD4lBXm7dEFpat5Spgr1j5VRW4yYWJ0VfeoUT5BDCIw3a9/r5r3lJ4DI7
         ff8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G96/UgPgclRz4bzFQr2SdgPyrcvDJJ+Nro3odf7rvY=;
        b=yZUo7ISl7BwJew0+rGRyAUEh50V/5G68L/AN+H5tQ7l7d+pM6n6OUOYe/Dzutfyfyg
         mB9SVtpIdJ0lSvD0bCZljLHBNLWxcVUYp7TgRoFMBc0Xdigu5jqQ1xs6dL84f986K3JP
         rBz1BfIbi0FQu6hQtIm8vSqpW+cDuYfW/FkFousmnjMlIE4ZsXeBjwVGaroTRtoiqFYS
         OXysiam1dYBiUtSy7O2y7MWtw1kLkMaqevJoYxZmRhcKmokpEkBuMjlKeFTS/pJLnnXZ
         veaq/mNfVpGu5ORu276L88FmgztY5KRmX+Fg8FJSSIUmVKr9vOOcDR6Fq/Tp3MqteBM/
         J/dg==
X-Gm-Message-State: AO0yUKVfN7mpIJBqU8/R7i48hTtHyly6QtDQHI3PKozmimgCu/tfWlo6
	JPl0YVu2vXnPfbSXIBW04ni08wBFOk4=
X-Google-Smtp-Source: AK7set/RJjlfFX61M1jlDrAenKg3uNvlBwVXxv+c45ikUON019GYgfce+4/3DO2J8bWrI/oVjMAaZQ==
X-Received: by 2002:a05:6a21:150c:b0:bf:5d4e:1315 with SMTP id nq12-20020a056a21150c00b000bf5d4e1315mr9946908pzb.48.1675446668101;
        Fri, 03 Feb 2023 09:51:08 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] python3-sphinxcontrib-applehelp: 1.0.3 -> 1.0.4
Date: Fri,  3 Feb 2023 09:50:30 -0800
Message-Id: <29d11c0557f13616874b70520d80e38197ff7a87.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176743

* Tarball name changed so we can drop custom PYPI_PACKAGE
* Switched back from flit to setuptools
* inherit python_setuptools_build_meta instead of python3_flit_core

https://github.com/sphinx-doc/sphinxcontrib-applehelp/commits/1.0.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...lp_1.0.3.bb => python3-sphinxcontrib-applehelp_1.0.4.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.3.bb => python3-sphinxcontrib-applehelp_1.0.4.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
index c97d204c068..4d14216c524 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "83749f09f6ac843b8cb685277dbc818a8bf2d76cc19602699094fe9a74db529e"
+SRC_URI[sha256sum] = "828f867945bbe39817c210a1abfd1bc4895c8b73fcaade56d45357a348a07d7e"
 
-PYPI_PACKAGE = "sphinxcontrib.applehelp"
-
-inherit pypi python_flit_core
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


