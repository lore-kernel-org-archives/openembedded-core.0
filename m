Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40312C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:01:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.1194.1661277714961615765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MK+KJj1o;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x19so11401237pfq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=wdTbvGJeVHpJhEcxhrneGahKy4+srF19VCUzuxx7FEk=;
        b=MK+KJj1oyoxoNQBJKdAigrvbORcnhHKUwaNu4tCgevOUq9rfdm91GL8pXCs4e1lIcH
         FU64aixIh48uHQ242MRM4ruuiNKutJm/0DOHLOnI6FW1ahdf5t4zJ36wwBZ25TuWnwC4
         jdKp5T56wmaPrbzt2tq7guj6FE3/8qH5/bJFqGWx4NLuhKjytA108QE4OfVcP3AnhFmq
         CIIK9XAmW4rUGUWIJIbnwHK51wHie2Fszeh+JRrTl65F+0/Q/XRsUUkF5RnoPR/DH4FS
         viiGbdP8AlD9dD/oapEiTz/pbHR3P2ZtKuJJiZ2y82Fx2cq6Du3G+XdiDXuQbqPvu6Rl
         4CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=wdTbvGJeVHpJhEcxhrneGahKy4+srF19VCUzuxx7FEk=;
        b=LIKBC1NeHmwdbXkSqlpepuF+rDzRhuQlUSUKS0PTE1ifIBS+gIqW9zvxmxKEeE7RBM
         1q4TTGE8ltt6cewUH0a1uYo7EzVglH+MXpIhllR5ow5x8Y22QTnN69HnmegOwgRD4muu
         /RNV07t/rgxfm2dnWNV2YSJ547uqiyj147hULJsJAPYwibkY7FQ/AxjNrgt/PrVnUrO6
         C/PCa/F8Dmj0t6vdwLNZ0OmWTyQ2hIAMdJ0hgTfWY1Ee1wL6XQRbcmtYTMAq7nJR1U2e
         mTBNaVeRWUWeYnHISjik+qsC4FeghYMu3j/zOFSb8ySQcLwrMhDJ/gIgEJZdtQWYKdyi
         NW9w==
X-Gm-Message-State: ACgBeo075b8bM14B6Nxk5IAXEnB1Q5Z7desQREZ9koK29nVvrUiCqCMR
	CmScS6YVSR2VzFgOCut+17ZyAkxoV9pqww==
X-Google-Smtp-Source: 
 AA6agR4rXKD1LBeqhPGWVxt2zgoM+4cvZoS3d+XHH1USBGWShC5nGqUhJCB5/Pu1RI6GJ6CuuqnA8Q==
X-Received: by 2002:a05:6a00:2308:b0:52f:8ae9:9465 with SMTP id
 h8-20020a056a00230800b0052f8ae99465mr25789136pfh.77.1661277713882;
        Tue, 23 Aug 2022 11:01:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a2c0400b001f54fa41242sm12290295pjd.42.2022.08.23.11.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:01:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] ccache: Update the patch status
Date: Tue, 23 Aug 2022 11:01:49 -0700
Message-Id: <20220823180151.3321962-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 18:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169722

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
index 4c2623e69d..aab943459d 100644
--- a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
+++ b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
@@ -14,7 +14,7 @@ Remove inline attribute to fix below build failure:
        |                  ~~~
   4371 |                  secret + n*XXH_SECRET_CONSUME_RATE);
 
-Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1089]
+Upstream-Status: Submitted [https://github.com/Cyan4973/xxHash/pull/720]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
-- 
2.37.2


