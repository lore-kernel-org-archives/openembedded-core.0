Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EDCC43219
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.3573.1652871530816043440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CYOXVxdH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n13so1166743ejv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gdl4eAu+hQ8x82IWcC8KVi4MNmzoBO5gUzmZHse4fjI=;
        b=CYOXVxdHwctcWX8HoDDGTFEkWy5UhAd2vTeKFLfr6/RVnSHXixOvRzF2PzvZTDjCos
         w+dwNA4Epzz0KSjHgJ5wtxNN8IynMQdiOGTwxytUxxxA7Mwx43eAMS4FhU9dOsG/QC4P
         Vynk6S6lbpCAYwnC2HqoUeYN9m6R0VPkMM7r1xOEYyn9Z1xv/GKmQcwbHVvd4pJUGchj
         DxtLg0V0muzaGjMIo0xE6wR19Afq53oPc6SMv3h/NFnD+ktJpN5jVpwGYEVGoLuiZjR7
         tbI/dG4l6w6+qi8FRzmMXLw6tkYExPeJbEAAa2JIePGPSA0jDnJh0RIGnRU4a/+vvu8w
         iajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gdl4eAu+hQ8x82IWcC8KVi4MNmzoBO5gUzmZHse4fjI=;
        b=BWv1bV+bXXuoEWAed5X/Fboh95xRFvniuNx50vM1JKBdxV2afJTNW6usM2YXI7uwBc
         ZZMJIeal9prybzEaXcsWzriBe/Doks8jzIIUbM0Hk0v2nGqUK2122Og6i9reoFbJwO+p
         VCLLzbdik5brG4eZXGksLgBIjIwCBxnxRW/nbQSkpaftheSAy1Eseh2f18aziLkWTd1l
         6FITzt4y/j47P2TiJ2I5oenW0q96+0k674w8YTXXUL7Pm+uPRf4mQFtp33WT+fyswgOD
         Iy6WG1TlLLp3KeVWvfApK1osEp7cUK3xwqZ0emVqVBrtO1os1ez3Ql415+uz2/I8IJyl
         t3og==
X-Gm-Message-State: AOAM533Gg9HMs+PbXEQfi/0Ntldb3KRCfKjnhqVYkfy50eftfY7IfGyl
	WzqIQ+KJF01wBqoHfZhcR80RxLtrmCI=
X-Google-Smtp-Source: 
 ABdhPJxtVvuharaAACHBplISDCj/7srYJUANsvAWwf32FEolKOZUaU2ixHgqR8ihzt5yGpDDQDJLKw==
X-Received: by 2002:a17:906:9b8b:b0:6fe:55db:14e with SMTP id
 dd11-20020a1709069b8b00b006fe55db014emr9298421ejc.327.1652871568912;
        Wed, 18 May 2022 03:59:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/49] python3-markdown: upgrade 3.3.6 -> 3.3.7
Date: Wed, 18 May 2022 12:58:35 +0200
Message-Id: <20220518105843.3299331-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165838

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-markdown_3.3.6.bb => python3-markdown_3.3.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.3.6.bb => python3-markdown_3.3.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb b/meta/recipes-devtools/python/python3-markdown_3.3.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-markdown_3.3.6.bb
rename to meta/recipes-devtools/python/python3-markdown_3.3.7.bb
index 5ce9fef7dd..c456cecc78 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed1ecdb1e8cefc7006"
+SRC_URI[sha256sum] = "cbb516f16218e643d8e0a95b309f77eb118cb138d39a4f27851e6a63581db874"
 
 BBCLASSEXTEND = "native"
 
-- 
2.30.2


