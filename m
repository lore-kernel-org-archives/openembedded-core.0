Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B2BEB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:18:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.29628.1691396314997108264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 01:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K3asJHYd;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bc3d94d40fso37239585ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691396313; x=1692001113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/uveH+g4/wGCuKVUXog/e1sq5i/H5iIW2P6YeI+lLo=;
        b=K3asJHYdfO2ozbRyu/uBZ16WaVDY5wGERJ8RhsvO+E9mplNmirwCrPgtZALvrBW4GL
         bngHJg1OC9QO55ruuc1v2gKvT3+dw6M0GKtIBaRkOye20mFhpBy/8kSi8RMN409lw4zf
         ozQ8hw/qdxk0g0Vv2a7hECYQF0TUh8Jmxvz+S9ZY+qWWmgr/629YtRsD+0JtEoJ+fbC7
         JyqmAyYKexDG3a03rnECjB13XX31K/A1yRcWmwbVmiH8ELfw0IDmg6TaYjxza6KBVk+U
         YH8jcrvrO50zyhIa/pXyvngCa6KjzLFfJMjG3kD94YUv/0kktavqRbA4ORdruIaPpK5P
         qmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691396313; x=1692001113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/uveH+g4/wGCuKVUXog/e1sq5i/H5iIW2P6YeI+lLo=;
        b=N5VAiI15rVUR/qRN5a9S2ddc5mdAirMkIVOM05lOInI3kWblIiDgYk8CuTWbqMrjfB
         3FNynPTmkrH9fuTIfFmbIy9KodhlsJ4kEy/BGEuON5e/2gTCjYY8CmNyCWk+aXQIwaAh
         VcrUX+XFyG5FOmATE53Xe/YthcCfWS4uptlYrdAM7EFsuDjbrGmrPp+2EubauXpyn83Y
         u0Shztz/icTc8M4WYBRj9no5cmiRL3fVynXLSBrld2MmEgikit4IlZMB7OBTYSWolrvA
         v+FVIxkNervLk1D0qoYF+kVKKO9YQfLxvSB720N6o/sl0Q/dXQXwQSKiuJKCa9Gz7nTi
         qY4A==
X-Gm-Message-State: AOJu0YzD1DWTOGmh5nSCLu7K1/fmDj5qWDNagm5mmYDis7IxJL0XZNFF
	TMHv/VUPINvDrKR5cTmrVRk66dEKq5Y=
X-Google-Smtp-Source: AGHT+IEs9hHLHGxzNB/smmX8uFoA5jSpA24zFZhl4Rwt56Uc6S6Hf9hoiykLwCC1ynZQJcZ0G7xYBA==
X-Received: by 2002:a17:902:ea09:b0:1bb:7b6c:983a with SMTP id s9-20020a170902ea0900b001bb7b6c983amr9836930plg.59.1691396313546;
        Mon, 07 Aug 2023 01:18:33 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.181])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902f7cf00b001b890b3bbb1sm6212222plw.211.2023.08.07.01.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 01:18:33 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.9 -> 3.0.10
Date: Mon,  7 Aug 2023 13:48:23 +0530
Message-Id: <20230807081823.47348-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185588

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Fix CVEs CVE-2023-3817, CVE-2023-3446 and CVE-2023-2975 for openssl

Major changes between OpenSSL 3.0.9 and OpenSSL 3.0.10 [1 Aug 2023]
Link: https://www.openssl.org/news/openssl-3.0-notes.html

* Fix excessive time spent checking DH q parameter value ([CVE-2023-3817])
* Fix DH_check() excessive time with over sized modulus ([CVE-2023-3446])
* Do not ignore empty associated data entries with AES-SIV ([CVE-2023-2975])

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.9.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.10.bb
index 9738d36902..c770f1c712 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "eb1ab04781474360f77c318ab89d8c5a03abc38e63d65a603cabbf1b00a1dc90"
+SRC_URI[sha256sum] = "1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


