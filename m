Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13081C6FA90
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.862.1663362520418492160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PsT+Y/6Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z6so5451018wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Vs40WVDW6V+o30bJYFg8El/wqdOBwKXq5wDVxnZ6Db8=;
        b=PsT+Y/6YMX5gSdkVeG0kVTK7dWMT98bUG3D69nI2hMWnFAoXJjWWJJTn5Dv5+f7Ysi
         QWXowiy2YuULlCVxWUr0oX/9oT1RcXf5q1etDM8E3SBsvrNKY0QfZ/CDx+z7Pk++lFAW
         ZMvKou2yy+A40760sVIW9WxBzfp1Mvc83wHv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Vs40WVDW6V+o30bJYFg8El/wqdOBwKXq5wDVxnZ6Db8=;
        b=sLsASo8Z6XXNy+HXOhXNYaIqsebSEjXrnZM/bSP06BLR1cz53CWrNHnsP2WV0dCm1u
         tpMw4GJmWB/YqKE6tGJrzoHuDfM9kfRVzcqX7zDfKXzjC+nNrG81WVKV0Afhwubof07o
         j/+RjMsbTs2vnmRgIpbx3hS2jaL8dc9F+zpcnv7Jc/MceVlsF146KwNXAvhiIy9SXKjS
         uUfbvIqY6skKbbLF348Sg7CTebZYZhyMzO0xr9pFKA305voO1U0yTHlXhmUckIfNYEN6
         JRgqxxiW9zoaizApLPbcluxYnLLuzU1nQncMecpL2Os0YUIPVWKsvT3nXjBe/3oXueBO
         fM0A==
X-Gm-Message-State: ACrzQf0M1qfUTaWParOvraOqVGzab+O4w2rK5L/Sl21z61q2FAmve4VU
	QBhVzg58AgxwMJHhQt275oV/Nzxy0oF+QA==
X-Google-Smtp-Source: 
 AMsMyM5l+3GCihLMzl0JFxkCQpaAsqVIVXPh6LL9AuF6YLQbs8BjPA+Buuf9jcpc+m1/dF7smLpnVw==
X-Received: by 2002:a05:6000:15c2:b0:228:dc85:d1b0 with SMTP id
 y2-20020a05600015c200b00228dc85d1b0mr3936183wry.9.1663362525345;
        Fri, 16 Sep 2022 14:08:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/24] nghttp2: upgrade 1.48.0 -> 1.49.0
Date: Fri, 16 Sep 2022 22:08:15 +0100
Message-Id: <20220916210818.1228761-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170819

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../nghttp2/{nghttp2_1.48.0.bb => nghttp2_1.49.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.48.0.bb => nghttp2_1.49.0.bb} (93%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.48.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
similarity index 93%
rename from meta/recipes-support/nghttp2/nghttp2_1.48.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
index 4ff3ab829b4..b7bcd0ece0e 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.48.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "47d8f30ee4f1bc621566d10362ca1b3ac83a335c63da7144947c806772d016e4"
+SRC_URI[sha256sum] = "b0cfd492bbf0b131c472e8f6501c9f4ee82b51b68130f47b278c0b7c9848a66e"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


