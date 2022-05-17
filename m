Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A36C43217
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 09:44:41 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.5157.1652780676832181418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 02:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AXeyG92G;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id gg20so6824809pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NQ/Ox6dre4jgS2t7GXrs19HKw6c9bEp2GcsopuLqd+I=;
        b=AXeyG92G2ySpXKf4ZWdxUfuBpF4kCO5ATcLA3n3cbKOGDxuPfwAY22akfVxbq0IIwS
         BrIY7EA8OsGc+94csJljX0YAnBBEDGBFyyS1XKfD4091vtAzYHL7+m/iDE8PCZeWumLr
         DNpYJFIicf3RA72ngCIcFIHo+YcjXCMn1x1SP8sTuirwDhGyP66UP98erCgMPRGuTHoA
         NLjZQoRinJJpb5JKU275197ZmyPYlE8KTMbSDH3dfmxlnlM+QOhuvtrbzzqX6MQ0TkqF
         WDG4b39J3ChgmQXOB/wSgfEniKGLHKbXG4v28njPu/JVVSKkNP8sujw9fsy5IaZGZA+1
         Bgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NQ/Ox6dre4jgS2t7GXrs19HKw6c9bEp2GcsopuLqd+I=;
        b=ku98PDtROEmZpdnOjsoWyXwMa07Q6j170GZIMCTCkWNyHj96pSUNNzf4oft+0LJhby
         ZmfRCj+Ojjto3H8Ns2KUWrAz7xRV2FWYhYPNSPt5boZlwFVJ4i0CxoMwx760EJ6Rcn8b
         cghFol5VJ8E2en/nnYDJ0cdCBCbxig+29InQatmDgOGsl8qCHWui2ujuIlMdw/HOx4Qu
         cyilDz24WhvG2c8ENNYJcsjs+Tr+preGcjvd8Pa+sXLVqS/fGGZr9YdVM0vKYLygN48B
         jnIxaSmOE1baN6ekv/nzHeYjgIpiXAEHIoQ0P4XLvK7zD2EICNwI+JSmwffguqfAJh2J
         HbRg==
X-Gm-Message-State: AOAM533ZINJKHl/Ucj1b5qmbK1+9vwhCYHfs3UfK56Ed4E9FXMcNrI5n
	g0Lh5f8pdbw1xMBwY59rzJY2b/zZs8c=
X-Google-Smtp-Source: 
 ABdhPJwA1ascvLjwun8Q557xjci1Cfid6AbPvV2EcfU5BYaFIeqmULoJuap/FAIrCCBOdEuU6RALkQ==
X-Received: by 2002:a17:90a:408f:b0:1d1:d1ba:2abb with SMTP id
 l15-20020a17090a408f00b001d1d1ba2abbmr35262166pjg.152.1652780676112;
        Tue, 17 May 2022 02:44:36 -0700 (PDT)
Received: from localhost.localdomain ([103.81.94.250])
        by smtp.gmail.com with ESMTPSA id
 fh9-20020a17090b034900b001dc37aef4ffsm1210550pjb.48.2022.05.17.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 02:44:35 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH 2/2] openssl: Minor security upgrade 1.1.1n
 to 1.1.1o
Date: Tue, 17 May 2022 15:14:12 +0530
Message-Id: <20220517094412.20616-2-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517094412.20616-1-ranjitsinhrathod1991@gmail.com>
References: <20220517094412.20616-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 09:44:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165724

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

This security upgrade fixes CVE-2022-1292 as per below link
Link: https://www.openssl.org/news/cl111.txt

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
index 8538bd5a18..c9cfc759c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
+SRC_URI[sha256sum] = "9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.17.1


