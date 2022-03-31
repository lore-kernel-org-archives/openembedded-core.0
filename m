Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4698AC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 21:57:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.3254.1648763877144251869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 14:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=yN85Kr5L;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id bt26so1582065lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wHHA8kag40sAhB1zUKRpV+3x1F8OrUNuw9i9wQpsSA=;
        b=yN85Kr5LdUuqggem5CdX8k6TyuYQM0hKOVZFzUGQA3fPPO5aeC8gRZhmpMLDXOxgIw
         i5HWMzKK/WJZx84gDSWz/Tn0+2IB6A109Xsb7+/0p0SXizOhxK34jnapXFKbrUozwQmP
         TCe2ZQEgPJcHc2gDE5k+b0+/aEvyvpqC+iIzKDixxwvYhdI/kyGzKvPerU0au8LWWzpi
         J39lcOtySLSU7/YYZWOTcxYqFFSaxx1FSUwC0i6Q+qXErb6mXdP1HBuIizyz3qg2DUsN
         vmj8aUVsF44OjIj3kZABTdO87ugUipTRLUdDeH8gKL7KvflUMPT14Ojl1hUeKp1bS/Yb
         Dtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wHHA8kag40sAhB1zUKRpV+3x1F8OrUNuw9i9wQpsSA=;
        b=fJE+Mn+19rQJtIR0bgbDmbBVIyuKoqNMHJVds87Zs7DgpUJ6DZVz4bqzbHY2i0PJU8
         AUWtpbYZFCunSHh8CN0eZIJHIhjUsmOIFTHm95jorpJnSMdkxiQF27918YTjaNSvj6FP
         CdOUdDTk1SDt5dZD24ca5TyC6Bot86mS8F56tjHqOQ0PyI8pjBoG7z1LfvYyI1zGJoCG
         HW/8TnhglVsQmU9VjP6tsgxrbEuaAZaKxs8/ZVKTzJPqCNw+nLZIb4CR3NxxyC3c7UaN
         dRc+CI8MtktiiNyqcAR5CTla46dT/MgwtNf+QOFlveeAdL+FppJeq34KgDDOFXGQkTbO
         64Rg==
X-Gm-Message-State: AOAM532wUmRsRVGa9daFJApv3Ce12D+hSl3ZA+eQqMqWZ6nayQR9E1Ob
	dfxLmUzn89L8iyEcjZSqsWuzjiJJa02MvWQS
X-Google-Smtp-Source: 
 ABdhPJxGd4r8YEMbUAB5py7KX44zKIF+BAn0hjRXDgsBnEdHhULPi42nrNqi3wO0sxFE4t7/lEXSpQ==
X-Received: by 2002:a05:6512:12d5:b0:44a:9c24:9254 with SMTP id
 p21-20020a05651212d500b0044a9c249254mr11746751lfg.39.1648763874710;
        Thu, 31 Mar 2022 14:57:54 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a056512330900b0044a1be3bdbbsm53738lfe.196.2022.03.31.14.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 14:57:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3: update to 3.10.4
Date: Thu, 31 Mar 2022 23:57:51 +0200
Message-Id: <20220331215751.1550902-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 21:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163871

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3_3.10.3.bb => python3_3.10.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.3.bb => python3_3.10.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.3.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.3.bb
rename to meta/recipes-devtools/python/python3_3.10.4.bb
index 5c0f0a9eb2..522f0d71ee 100644
--- a/meta/recipes-devtools/python/python3_3.10.3.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "596c72de998dc39205bc4f70ef0dbf7edec740a306d09b49a9bd0a77806730dc"
+SRC_URI[sha256sum] = "80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


