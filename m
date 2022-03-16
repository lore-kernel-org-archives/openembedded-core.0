Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CFBC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 22:25:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.3270.1647469530591497967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 15:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H9MpkU9m;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so17649pjm.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pc5TOKYkRkemEE7WJyOwvPiSF4lLwQbvocy8BT/etZU=;
        b=H9MpkU9mZ6axCNUoKvKCexKHr1+G3jHdygHHc3ZduY25iftAblAcQMVsuM24BoDCke
         jhvSMb+yDVynAtTUZmGGpf/akobX+rpnsSZRmxt9Dka7GjzdMniaNpJjpnzVvjpOlA5Y
         6V56Y725itKwMiiHg5xvRymwhvyBzfrsDuGblIZirhmj6seuqT7zv0B9JsBE87iYqlXQ
         1btj0HfmqjqBYkX1Pagv72IarjQZmSOe2e/1b/ePVg6he1Iiy/txEZOkHKs2scqb4yZc
         zSfEWHbgKbl9Cr42eZbaZu5/gQCQ8y0/RNShRyPh7eitN9LLgr/wH0tEo3s0wvqcc5jg
         JrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pc5TOKYkRkemEE7WJyOwvPiSF4lLwQbvocy8BT/etZU=;
        b=5XhISJlql8y7AmkLP4YQJHBSwyI0Q1RwlavYlVSaLlq35IBB3/osHrJzSw1IBm9hxw
         of9YZPfUXrMW6wrNE9JQmh/EP+OVQKejv1XRZxMq1+dQYTulJlm7nbDTmnGNBhzzeGgx
         0Lk+B54xZtTCgGo96GHxrGO1W9i1NDqm1Srocv9UBU8lZ3lC1w2wF0jch5rJiXssNmpB
         El+Iv2WDKJsXJX0Wp6VpwHX9TkDadhFOSAzZGvaMzVDg/SO9/rTz5r9Wx0wUsDmGhwPu
         Nc3Hn04+xo0fozWguxAaj2mYK8pCXB+bbArd1mXDpx03HmKPH+f1wkLKk69l1/+qk58J
         Ptng==
X-Gm-Message-State: AOAM530XVrtNXYoXvyWl8rx6IGw3lDyPAs5855BMhp3NP0SjMmLRmpa2
	w0qkF5lG1xmXQmke4scO0SnjW6s7WArwhA==
X-Google-Smtp-Source: 
 ABdhPJwiwSkRDw3ikedlH/60qp0BjCenhbMXwVwKea0VspTBL7d/yKhPWS/trjAp6QjNwVgimtsY3A==
X-Received: by 2002:a17:90b:1e4b:b0:1bf:8dbc:581b with SMTP id
 pi11-20020a17090b1e4b00b001bf8dbc581bmr12375942pjb.41.1647469529756;
        Wed, 16 Mar 2022 15:25:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 oc3-20020a17090b1c0300b001bf8c88a8c4sm7781150pjb.35.2022.03.16.15.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 15:25:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-cryptography: Upgrade to 36.0.2
Date: Wed, 16 Mar 2022 15:25:26 -0700
Message-Id: <20220316222526.264261-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 22:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163362

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-cryptography_36.0.1.bb => python3-cryptography_36.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_36.0.1.bb => python3-cryptography_36.0.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index e33eaa50834..940df60d441 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
+SRC_URI[sha256sum] = "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
 
 SRC_URI += " \
     file://run-ptest \
@@ -42,7 +42,7 @@ SRC_URI += " \
     crate://crates.io/indoc/0.3.6 \
     crate://crates.io/instant/0.1.12 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.112 \
+    crate://crates.io/libc/0.2.120 \
     crate://crates.io/lock_api/0.4.5 \
     crate://crates.io/num-integer/0.1.44 \
     crate://crates.io/num-traits/0.2.14 \
-- 
2.35.1


