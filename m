Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D40C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 10:55:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.10395.1663671343818944946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1hQtvdL;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 3so1298041qka.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=E+QZDESrgGB7ORUOZH3jHrYMJaxonYB5BBGU847Dxoc=;
        b=h1hQtvdLPb4SrtM5F41iwToXKQcxO70byX1u71fiEuXmvP6MUKO9bv0gQPdtBv0B0f
         h1ZZ7HDdwdyyBntnYinaQjYUKtpJSoIr7Agc06VkaP9kNtwjnP09vV/cW1utgj/F4MeC
         f9uioLNGKqquvJo6N5oKsC6LDgOLRmJYplRJR1Q3JBA8LfHuLGlhiB1apxKaL6z1RWsS
         hVbM8kylSG/gHcCGjXvFGF1xRVDSKo0QsulyBg0zJ5ZfKrRE278yVB1bsqEytr6CwIpZ
         DAuexowiftirHiHFF0QN6/arwe9W34PKVmgp7w8mY1Bgx5ddFsT0TC1W4QtP0wY08oob
         dbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=E+QZDESrgGB7ORUOZH3jHrYMJaxonYB5BBGU847Dxoc=;
        b=df4jdWckJ/ZUD3PGZQLKyAbolyoL43969xl8sWGJKlezt/TQ6jgoAiYpj2isqI2+Ac
         ekycK5DB0tpCFwGJRQ7xvCKiB6CziS1wH23thlStdgy+3FC6M5YbjcOF2+rltfzZcjp6
         Ml9pVkfYZwsLEsEuGEShQtoAp6HhNxUWKJiDcG22irqiSSEcWfgBiwYxuG9UwHk2+nS+
         ixSixtNI5qAfMNoXgYGgJaGmW5Guv0i4fdqIYNCw8vOv4sOzPy2/0gZWHICXjEX5haNJ
         9/+edVwCiOocIDHSRdvIdfDLo0ChirPs9FSRPl7X/lH3hZMa7MZxYyazoVaLswDkYGxy
         3tcQ==
X-Gm-Message-State: ACrzQf0lCdLk8iiLodhVQPeUqg3t/eAEY7/PAwjo2AyuH12zUUl1jZvu
	ZSLeWNMqG4PnQtAJFcR0OurIHupmsnp2Ww==
X-Google-Smtp-Source: 
 AMsMyM64DcffduUO7UggPKF2OOlNZHLxyRJHMff5hIOEG20p2IOVr+9vNflecsYpsKkpHq5J1pQ5iA==
X-Received: by 2002:a05:620a:15a1:b0:6cc:f925:7c89 with SMTP id
 f1-20020a05620a15a100b006ccf9257c89mr15639772qkk.319.1663671342546;
        Tue, 20 Sep 2022 03:55:42 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([84.232.223.213])
        by smtp.gmail.com with ESMTPSA id
 r9-20020a05620a298900b006cbbc3daaacsm827936qkp.113.2022.09.20.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:55:42 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] expat: upgrade 2.4.7 -> 2.4.8
Date: Tue, 20 Sep 2022 13:53:48 +0300
Message-Id: <20220920105347.17853-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 10:55:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170893

Changelog:
=========
 Other changes:
     #587  pkg-config: Move "-lm" to section "Libs.private"
     #587  CMake|MSVC: Fix pkg-config section "Libs"
 #55 #582  CMake|macOS: Start using linker arguments
             "-compatibility_version <version>" and
             "-current_version <version>" in a way compatible with
             GNU Libtool
             see https://verbump.de/ for what these numbers do

 Infrastructure:
     #589  CI: Upgrade Clang from 13 to 14

 Special thanks to:
     evpobr
     Kai Pastor
     Sam James

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.7.bb b/meta/recipes-core/expat/expat_2.4.8.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.7.bb
rename to meta/recipes-core/expat/expat_2.4.8.bb
index bf1ca8d56e..980c488640 100644
--- a/meta/recipes-core/expat/expat_2.4.7.bb
+++ b/meta/recipes-core/expat/expat_2.4.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "e149bdd8b90254c62b3d195da53a09bd531a4d63a963b0d8a5268d48dd2f6a65"
+SRC_URI[sha256sum] = "a247a7f6bbb21cf2ca81ea4cbb916bfb9717ca523631675f99b3d4a5678dcd16"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


