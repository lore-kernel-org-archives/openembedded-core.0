Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F13C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.2934.1643917894224848566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZL0jC4xG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id d5so3392797pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T6fpMUelOll/ngCnYRwTZhiHnqwjvC64cYSFTNkhBJg=;
        b=ZL0jC4xGo9iIzTgADkINogZZ9wFa7R/z61o6wMunYihNmSFWW2nQg0Vwaf2+fjhbyn
         fAnHqSPQ11rVv/ZX7O4ZF6IgiEM0r9gKEcbwv4T1UvsJoeHPCKcyo9o3D5l7OnOwoud3
         kCSRRF5odHrdsnrD4bFTQVl5V+SwqCYpJLwyIf/kbIDVMFk9XfThrArl3DLGUIS55sma
         paMUC3qVmRvGg+1kSne3PAtDgBqznRvJc7c8C6qfU8QzSNXX4M2czItMiwPzReTveiQS
         4t+YBKRD4OC7LbBsk9b6N7HeHxT5iNEEGjiID5Vm759s7XPEAFPrCjmH6xBe6HqfUMvi
         dNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6fpMUelOll/ngCnYRwTZhiHnqwjvC64cYSFTNkhBJg=;
        b=WFpIO79oN0a/wbdt4Z6Ga3S82uNOMcy6kfyNNAc/dzPqQvCR2EK3hmMDRUv16a1cj2
         W9R9xw1utiT/IxRzKfiWmtPjaE5AuhT9tAjMAQLyk5tuKgNT6pulleRFidurrozKnp2O
         8d54adqe1kgjrWn+w34Kj2XL9Wg+aicIxocAP+tph7Tmwfnndlt7R83hZqy8RW+DsFSN
         nmWdqLawGYgNOsRyxXCMU8yboegIE9f4h599GWEultnThEhI2Hwuii+SHAndJ572eR7Z
         3HOoQ8dl1h2PKBY3pgPiAPKCha35IzYHP+Lrd3O+IiDXMRevq6/qZbGTDmoSTCtIc5Aq
         mzxA==
X-Gm-Message-State: AOAM530BbUdVpSB2QPRgUg1mQmWL6rzj5Fe+TPa9dBS9fqU6TE4J7v4D
	4sxXkokAevnuj1kWPC4GHJMs5NGp0ofui6Wv
X-Google-Smtp-Source: 
 ABdhPJx7hI4/Nce++k7aAB3AiQZSe2Xosr2CbxzOL4Yx8hx5gR7IFFcVVhk5b5Nytmzr0oa+yoDTAw==
X-Received: by 2002:a17:902:e552:: with SMTP id
 n18mr37313976plf.152.1643917893235;
        Thu, 03 Feb 2022 11:51:33 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/20] e2fsprogs: Use specific BSD license variant
Date: Thu,  3 Feb 2022 09:50:38 -1000
Message-Id: 
 <d723ce5586e6febcd9a506a0319cf90106b2543f.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161309

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 966fb77981e4fed0ab7998439940b1e05dd0ee43)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 45fb9720ee..57e4665a34 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
 fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
-LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
+LICENSE = "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
 LICENSE_e2fsprogs-dumpe2fs = "GPLv2"
 LICENSE_e2fsprogs-e2fsck = "GPLv2"
 LICENSE_e2fsprogs-mke2fs = "GPLv2"
-- 
2.25.1


