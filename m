Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E09EC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 08:41:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.8796.1642408899589989886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hJy5r8qH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so7449063wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t31xBOhZ3U1WmpyjRqXdbTendSN/O7KR18E62FhC0Dk=;
        b=hJy5r8qHX5jQAQanrAhATKOA48Z/IKlU3GrSw6xuhD7P5mnC1TaF8jC1UMsu5NA8Cj
         UTvf4aChMjALC+u5WyFjy7YLhu23PaG+4SaJjDGgrjvw5qtuqvAYMPxp6X5ja+JHgz3G
         i8+d2zexpiiZf4iLss8WZrDP/R/jQFQXnAgMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t31xBOhZ3U1WmpyjRqXdbTendSN/O7KR18E62FhC0Dk=;
        b=ghZo2RcYvIHYlihoZ9hBFHWZIbpKhTEh8AJHEJwdtMaxXd+LYeRDGnr7eBmzqqWSxO
         vWbgyz4rdYRQ7WWtG92xCM1WjNTzvj2iPV8mUopf0swYJqA8XJ5uyBfzURuObSdHYyxN
         8LO676IHZ3q1JUILrh78riCT0wXxD0whmuBo/2nZ5SXGYvpEVH2XXD7LNHypNrneONUW
         ScFO0hprfi/2Srjn6PSj546/GHcVOCSVy7oZzNuSH7I0EkTerAubfwaWWR/BbMtxO2Q5
         VUqC59qJwmFja/NgpaCPhHPuM+62qS1PwsiQ+iZmKgOfIeTJYTxHsV8oVyVKLEMk/tRT
         gpWw==
X-Gm-Message-State: AOAM531GtxeLzZ41qSTIj517tjm0N8uOAZXQ6E8W1rIFd5p6X/4OMQIp
	E9/aykedNn+nVwKnBZbXAUtOUedmDKqugg==
X-Google-Smtp-Source: 
 ABdhPJy3A1MZm84Aw8Ao/b3p5lN4qBOV9bQGKGB/qf9mkGa0/7G+hiimeeloGPsw8tkr9whcltiX+A==
X-Received: by 2002:a5d:4e4d:: with SMTP id
 r13mr18373948wrt.302.1642408898090;
        Mon, 17 Jan 2022 00:41:38 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 o13sm2862362wmq.18.2022.01.17.00.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 00:41:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.4.2 -> 2.4.3
Date: Mon, 17 Jan 2022 08:41:37 +0000
Message-Id: <20220117084137.1841878-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 08:41:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160636

Primarily a security fix release which includes:

    CVE-2021-45960
    CVE-2021-46143
    CVE-2022-22822
    CVE-2022-22823
    CVE-2022-22824
    CVE-2022-22825
    CVE-2022-22826
    CVE-2022-22827

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.4.2.bb => expat_2.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.2.bb => expat_2.4.3.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.2.bb b/meta/recipes-core/expat/expat_2.4.3.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.2.bb
rename to meta/recipes-core/expat/expat_2.4.3.bb
index 2718d609a05..279774af439 100644
--- a/meta/recipes-core/expat/expat_2.4.2.bb
+++ b/meta/recipes-core/expat/expat_2.4.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "e40737134bdc08b8ea7d23a2c0a5cd11c04d5be152fe562d3253c1e4a0be6686"
+SRC_URI[sha256sum] = "6f262e216a494fbf42d8c22bc841b3e117c21f2467a19dc4c27c991b5622f986"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.32.0


