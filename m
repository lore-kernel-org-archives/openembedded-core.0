Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3EFEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.17591.1687961618236154102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rRul9ssf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b7f2239bfdso36616815ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961617; x=1690553617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DZqVFwVZaMRalDMVQF9GIj2fP6R0pZt2qBuJutS2oA=;
        b=rRul9ssf6c6wiFDasHHiWd3n5+ejTpRlGYfj1is5u9rRds5e/jbCrvA1dJ2BoUp1z+
         EIhtIHeg4f+nu3YTVY5Nc1l+uHtJUnuPQHoHfg2gmqyz42u+pk1AqZV/Az+p2g49+SXz
         I1n+OWfsjTtVmqtxwVEcRmTNGxNiNMFPc5B94Ydzf7eBDyoNzay0VnJ59wn4AHyRyP3I
         PuO2fCdfsNXJ6CAHAxWg1Y/ED2o4Ky0D34Kp+BqaPbSMspxTrEIlG7jB0maQmm9RkON1
         rYjJu6qwSZBYSFSXBjQp6IJVJyETOI4s8qDcIDqa3ucIWkp3QNXsU8EwIm4YCQyO6OHj
         5mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961617; x=1690553617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DZqVFwVZaMRalDMVQF9GIj2fP6R0pZt2qBuJutS2oA=;
        b=EMgOZiKYOlaLievn3popau+QCQ4BQN+MZ6QB34ioDySA4msUmuX1rFck9A4NvfJXR7
         ZK9cBJpXHnZRE2aymHgXqTY+THjUDqVHHBJ1VslNp+W+t079F8S9xaNp2Z4DUhSQkNbP
         kBPoP8NCKl/yf58IywaXaApsRj6CKJTzpP3P8BDPMoCJybF3J05tmKvm4vPhGTvA0cD9
         +848j7I4rDb6VFcPeomSX9eKPYS82MKqjB5DfNk9dyEzRovSVgQbwZw3q0EZcFGDeXpk
         1gbutkE1vDuQYtIEke3uPO03xqp721aZN4haoNuPt2IvtN37DC94IjTL80iYpbFQnJYV
         uwkQ==
X-Gm-Message-State: AC+VfDx5/BnlppaH9UXGlkH2MJJ9ZsqvmtB7xowPuPPznSU/utyw0pBU
	d9H8WtlfabSgZpdK1C/6ROcCNsGwyM9TgvXeuKuZvQ==
X-Google-Smtp-Source: ACHHUZ5OF7ixnGi5SC6IhETC4tWcFFsRzxj+VXm1N7q/QRcBenCfQa/g/DnIkzBxMozFRJSHGk3vSw==
X-Received: by 2002:a17:902:6ac5:b0:1b7:fd27:145f with SMTP id i5-20020a1709026ac500b001b7fd27145fmr8804912plt.28.1687961617331;
        Wed, 28 Jun 2023 07:13:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/29] maintaines.inc: unassign Richard Weinberger from erofs-utils entry
Date: Wed, 28 Jun 2023 04:12:46 -1000
Message-Id: <d66095fa0c2ddf11a790d4d2f94ce6c2b80c0143.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183576

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 834519933fcd6e4ff54f24d0cf671ea9ce24398a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 19bc29708c..5acc80f059 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -165,7 +165,7 @@ RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-erofs-utils = "Richard Weinberger <richard@nod.at>"
+RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-eudev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.34.1


