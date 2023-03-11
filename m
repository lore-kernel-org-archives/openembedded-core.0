Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AD4C7618B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.55949.1678574521421922019
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PcplMDsR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id x22so156916wmj.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inCrZO2EMSO6kQueuAtFYYzBngDDrUh2ncp2rBESlLY=;
        b=PcplMDsRjJnp/ICsDvut8edy4RhBLeDUAPoCtvT3hEzGRPId/ZuO5dcMeQp06saZSs
         WGAWxL0XwQrjUPJeSZFlMBmxFWOkvICzEzhqQE/VxY+5kv7eXYvq4Ot/6y9utidYYly/
         JmzZfNwqIpsGQU97KRPv9U+YFcOE0q3SACdLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inCrZO2EMSO6kQueuAtFYYzBngDDrUh2ncp2rBESlLY=;
        b=4+U3p93KojF0H0u28ej32iLTGaCaa2TerXO98yQsktV94TGTIXJB+gisoQMA+BIMxI
         3L9K2R3K+bYg9BLFptJJpG/vLmk4q+ZoM31s9iKfI9BUlmrXC86HDnYMiRj0Kox0SEe8
         vyLSKo9eGhD4zU8Trvn4MkTZk7bohhgfZjSlbUYBamJivT7Sugti6KdJB1NE8hzlHjHf
         GATOlSFW0kGunHHyVj0P5rkM6lFYGJliWD7sgBFSSgEllmNHLzqVLn6kGadpIxXec6AK
         wo9McXe/FoXd1udItC+5T1pYcS158eoep0zV9LOqEycHrQx9z98XF99hsY4ZcGR+qdjk
         JRrQ==
X-Gm-Message-State: AO0yUKUL47BzeFnbFDqyCXrDF8Rx6qj3n4Yeo5gwmdwd+mQDvO5yQ4ib
	8YQqVPU1gMD17COpJ2VWeLMLjM0agK0HUiFMrGM=
X-Google-Smtp-Source: AK7set/Fygdw+ORZ7FWaqyw5Ond6EruK0aQnR32gherrntj2eo8e8Jn8NO+CYE6/3ZGhpDDo9QjkQw==
X-Received: by 2002:a05:600c:3846:b0:3ea:f883:4ce with SMTP id s6-20020a05600c384600b003eaf88304cemr6396562wmr.20.1678574519829;
        Sat, 11 Mar 2023 14:41:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:41:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] gnutls: Add missing python ptest dependency
Date: Sat, 11 Mar 2023 22:41:53 +0000
Message-Id: <20230311224155.3442306-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178372

Add dependency on python3 to fix execution in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/gnutls/gnutls_3.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
index 835ab122d84..7ddd2420bd5 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -80,6 +80,8 @@ FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
 FILES:${PN}-fips = "${bindir}/fipshmac"
 
+RDEPENDS:${PN}-ptest += "python3"
+
 BBCLASSEXTEND = "native nativesdk"
 
 pkg_postinst_ontarget:${PN}-fips () {
-- 
2.38.1


