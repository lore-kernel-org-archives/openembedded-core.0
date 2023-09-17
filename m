Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB11CD13D3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.27418.1694943558447967458
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jFeDlJq5;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so9905168a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943557; x=1695548357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs1Fk3wCiAV6ApgrVYz/7WlFhzc9UoPYGuFlJZOaLFY=;
        b=jFeDlJq5Po5gBx8P7ETUrGkm1lP/Guro7Askg9/9jWYd2g8gi8vMMiGzsQwV7+ymoy
         W1Mp9h+AiUg2CD1T1vzoe6rgNOSq+7Xvr0TaHjS1fRzMMuWV95ywG8gWhsccYJzXl2e8
         5CT7yyZdHZlSpqzVPZRaoUWCgUfnAIdHJJwMlmOiLL3hTjlZ6Sz8/LFDe92ZfV0Jcxnw
         Jytqr6+rP7924vwZ+eXsec/5NI66IBGsip8kpRq695CO2+tmVzKym6k/1wfUCbh6M8MK
         1Lf65i+Py7vwMI5ZdbCJrpcTngR9cNfUigb00H1wS0bDJRJohY04kH0fE9a04D2SsWOY
         jIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943557; x=1695548357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs1Fk3wCiAV6ApgrVYz/7WlFhzc9UoPYGuFlJZOaLFY=;
        b=kRMVQBn24V0p+WxwHi33ni60DjPjngboqC27viW+iGSfGCZ2gv0uoGTI6tbL4r83XK
         2iwR30cCmS/zfxXYytD2KeTGvHWwHBySH2jXp/hd8fxoM7J16N9RetzAicSmokNDiINf
         0Da2QuEW3g16b2t5qgRG0jCE7WKYvFteHys2/GVW1SIt9vcc1WBRu8BBsLVmPIkZ3/3u
         99HOpPzOPvhdodwWeEhxzsc7r/YsqfnOsRxoxeoLc4NyZ6Y3P1NxaIiZRflyRzzpTnzO
         gJ9Zp/GpUKiEW0bMMI44kLY0T/JhHT1qlVuSku7F9gOrObacCE63BKTU8fLs11J8J38I
         zJZQ==
X-Gm-Message-State: AOJu0Ywjh0dS/yoYZx5Xl69zBcSq6dBA8B2xhnSGgRHcjmhRvKvaf09L
	ycv0T+ZjF/wuYrztdTsUV1k+o8nGQvY=
X-Google-Smtp-Source: AGHT+IG9lGGSHSFi1xk9bhaVddOuRGRnJ89okH7ypoI4JLFYB41jrN9y1UlRv81Yq9XzFY9Ke8w1LA==
X-Received: by 2002:a17:907:775a:b0:9a9:f0e6:904e with SMTP id kx26-20020a170907775a00b009a9f0e6904emr8678253ejc.16.1694943556909;
        Sun, 17 Sep 2023 02:39:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/29] python3-pygobject: update 3.44.1 -> 3.46.0
Date: Sun, 17 Sep 2023 11:38:52 +0200
Message-Id: <20230917093901.428214-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187793

Replace a patch with a recipe option.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Do-not-build-tests.patch             | 30 -------------------
 ..._3.44.1.bb => python3-pygobject_3.46.0.bb} |  8 ++---
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
 rename meta/recipes-devtools/python/{python3-pygobject_3.44.1.bb => python3-pygobject_3.46.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch b/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
deleted file mode 100644
index 0f2465bb520..00000000000
--- a/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c125a806de951359ab7e302b0584f7c92fa451ad Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 12 Apr 2019 16:25:58 +0200
-Subject: [PATCH] Do not build tests
-
-They require installing tests from g-i, which we do not do.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 278fa16f..aacbd4a2 100644
---- a/meson.build
-+++ b/meson.build
-@@ -175,6 +175,6 @@ configure_file(input : 'PKG-INFO.in',
- subdir('gi')
- subdir('pygtkcompat')
- with_tests = get_option('tests')
--if with_tests
--subdir('tests')
--endif
-+#if with_tests
-+#subdir('tests')
-+#endif
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
index 797a7cec8ba..28129fd66ab 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
@@ -19,11 +19,8 @@ DEPENDS += "python3 glib-2.0"
 
 SRCNAME="pygobject"
 
-SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
-    file://0001-Do-not-build-tests.patch \
-"
-SRC_URI[sha256sum] = "3c6805d1321be90cc32e648215a562430e0d3d6edcda8f4c5e7a9daffcad5710"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "426008b2dad548c9af1c7b03b59df0440fde5c33f38fb5406b103a43d653cafc"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -37,6 +34,7 @@ RDEPENDS:${PN} += " \
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo python3-pycairo, python3-pycairo"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,"
 
 BBCLASSEXTEND = "native"
 PACKAGECONFIG:class-native = ""
-- 
2.30.2


