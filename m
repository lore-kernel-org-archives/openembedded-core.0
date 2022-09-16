Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E373C6FA86
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.899.1663362514713185061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d0Yh7bmg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id ay36so7285749wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=dwioUjcDCAmGdiYnFc5uk/RpYAc2IWcPosk/U0jy5eQ=;
        b=d0Yh7bmgiqtQDEttnUROhkr2V2DMU9rFzKGXzckxyH6VqGAxVTjILDZpRDyXD9kY7W
         DuPygEI93Hxsids57t/5Rl0lI0pqooONmvFAlzgzlPw92E4r9LEWXsHLB/cX1mYnuvv3
         JJOAU7TZG+kc/9VRy68c8UkugS1Zt7bNhcUsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dwioUjcDCAmGdiYnFc5uk/RpYAc2IWcPosk/U0jy5eQ=;
        b=1cmHovLr4UHP9Sh7KNLRe3vOoZE187SqkvQBqaMt9kTIiuDXTmdHQTnOXP7Rn5FuCm
         CYX8MxUIMYcQueh+2zI8TXlkz0skeQNSm+Cu9DraVEqEbl/RRULLm85LPHKjs1Ag7GJ3
         XFU+1mdx12SlQt/f5XyoJetzQmvGi2/ZGwA+gkxm8X99Rqm84n9Mf29uqgh9/MYOU0fv
         6JJESCwbJq558mfYXsSx61RLELi5+Wqvx37jkryAf6CiPvoaDZ8xavEjiYzTmp9AoeI7
         3pz6EGWoY1z/5jnTUigoYCIwZ6hUhIywehTipFlmRnHPky+H2iOxUxj3XU+mlR3Nqcs2
         BthA==
X-Gm-Message-State: ACrzQf3e3aA6vw1EUedj6PBqWZvKmyfAxu0OTLhnm/Mda7XmjXtAuTAF
	3QkvEWUBcl/5xncMlpcQBfPAkP1GUhwSPA==
X-Google-Smtp-Source: 
 AMsMyM6LOR2as/elKA2yB2MhROTwx9W2mjn05oTLjQnpSXutvky+NfaAO0uQ3NpXieWzoVQ0UDbcKQ==
X-Received: by 2002:a05:600c:154d:b0:3b4:aae6:4bd7 with SMTP id
 f13-20020a05600c154d00b003b4aae64bd7mr4614278wmg.63.1663362526607;
        Fri, 16 Sep 2022 14:08:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/24] libjitterentropy: upgrade 3.4.0 -> 3.4.1
Date: Fri, 16 Sep 2022 22:08:16 +0100
Message-Id: <20220916210818.1228761-22-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/170820

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libjitterentropy_3.4.0.bb => libjitterentropy_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.4.0.bb => libjitterentropy_3.4.1.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
index 1d291cc357e..3fb8c6b1479 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64a87180908540620ce364b5e69b3b03 \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "2e5019cfe63038faaa405ce53715effe4ea580e4"
+SRCREV = "4544e11320138ac02797af81766f4476a71bb09f"
 S = "${WORKDIR}/git"
 
 # remove at next version upgrade or when output changes
-- 
2.34.1


