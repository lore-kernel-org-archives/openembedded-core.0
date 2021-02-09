Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.6151.1612845219793841988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 20:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gOafPWoj;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id q72so854596pjq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 20:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxoBhVDtGUGo5GhuFttZ+jA0om3fag3JNXgHTKYLRVI=;
        b=gOafPWojGvBdAvguwyfix7+2Qm1FX9Y4BHZsutYAf78o7NRnCyu6lq6SjJuRObgAJ/
         Ifh+gcNz8MhaatMmkmUDievbz7vsYNE4OMdyI2rg5eq5qCGav1BfeIrue1VZrUD/obh4
         cfb3umq/2b+PHWz5L8M8/H+DjzjTqt4tupITLqYbBR/eW+buXx1B7xvxrR2BUFwtHyzX
         1DYVf4NWbymDa5wUwtamsrnxaMZn0bq1/rxkSxH+SYuBJRPWjimikLQdhc+TtpACcP2v
         I1B2jWVK0yR4LowuxzAu+DiouGDSVPODgn8NJ6squPdzJXv+mGmkJBuVG0buCzhvSXg/
         t4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxoBhVDtGUGo5GhuFttZ+jA0om3fag3JNXgHTKYLRVI=;
        b=DMl7MiUKw0vvmu+T9NQ4k0mcVI6MuCDr/hu9F3Tu0OA4B140kKY0XnRwK7w39ZiMt/
         8Qdqsp6cn6FLiI4MvNzxJJF7HhVtx8JCigKqBFoIjAB0UL5Bm+aSd1TJmlg+xm2Kem8H
         skQhQ8MShjwJ8/MXHxCo5cEypTUpHPvwLpasOleFXWXINL9qNwUwxduUv6EaN8b/T8/9
         cHs9H4+dyc/NGT8vbjQ4ULdA56ndGvcuFfEEfObjLgRzvVN+d8mcLZ9yCugL2bm1a4pf
         yDwP4hNG4zH2a5bDs1dn7S1Me2a3EWPFnd730D7eJjRF0HHVr2ALnisetCsipwcjPxAj
         roPw==
X-Gm-Message-State: AOAM533Iwg2g/dm557w9mZFkcNRuIVWcqczf/fPTIFfC8MG8dqGMj7gA
	uXfndsKbR7KvriUZ79Hsk/qibXWxD/k=
X-Google-Smtp-Source: ABdhPJxFuLPWTTfxZkTtMOKLVW4Xra4uWrlHMnjAuXGY4TGsROxmtoUQj8JlffIvx1nxbWPgtTq5Cw==
X-Received: by 2002:a17:902:82cb:b029:e1:2b0f:da57 with SMTP id u11-20020a17090282cbb02900e12b0fda57mr19537809plz.33.1612845218977;
        Mon, 08 Feb 2021 20:33:38 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id j3sm10886299pgk.24.2021.02.08.20.33.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 20:33:38 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] documentation.conf: add both CVE_CHECK_LAYER_*
Date: Tue,  9 Feb 2021 04:33:37 +0000
Message-Id: <20210209043337.894992-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/documentation.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index eee3c43ff2c..c5a38b07642 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -123,6 +123,8 @@ CONFLICT_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check clas
 CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
 COREBASE[doc] = "Specifies the parent directory of the OpenEmbedded Core Metadata layer (i.e. meta)."
 CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
+CVE_CHECK_LAYER_EXCLUDELIST[doc] = "Defines which layers to exclude from cve-check scanning"
+CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-check scanning"
 
 #D
 
-- 
2.25.1

