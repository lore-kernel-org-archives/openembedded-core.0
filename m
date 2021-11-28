Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEE6C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.53378.1638136772971947336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Iwd0n0Lw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id b13so10509562plg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7U/rQA3HvptpJb2NhhtNp+lHv1WEkxcqiFcot1sCTzs=;
        b=Iwd0n0LwV+HoBlt4x647OhMT66wHgd4Kskqb04QoRnvHKnxILClZYmEd5kY5cgPj2H
         gPwtXxHUGUVy7irjRdTzj2eUkAWlmjfSm1fMJh3Ge+Ms68yjjWbCqjkc6C6s5BKfJJwg
         9emz2u3fDJfARd4Juz473tXIDnNdIDOXOwHxNgkp8WubXyLw3UlxO42suTsr+a1dN8iO
         j+WzT8Zk3Op3KGY/4967m7k9JcbXNoz37FCMCheK3jWygVeK6L4ZCuy/LMMPSsjEJH0o
         UhHNHsvwIjxpYFbExahJ2HciJEhdvzT5NyCA5zV1ihIMny58Ic5+WGE8/gZvidXme8xD
         Hbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7U/rQA3HvptpJb2NhhtNp+lHv1WEkxcqiFcot1sCTzs=;
        b=EUirYojDUDy/11r+IS0PUJ9zqujtRwQ4cSX7uIpkLH3zRGXBH79FVrj6Bv/KkM8Pl/
         ExtfyCacS1ztT+UtHSxA/fFRG9/wq5WLsCJkPGP3T/lx9KRO7FRlZX54lDHRdma9rUKD
         kYYyEpdIwTGzUsZ6xDvEp11DnM9YE2oTAGEaDOCo//xzVDvsJg1R9bB3BzFQldavqE/P
         UO1N5qAqbvUJk233ratxnhRY/wSZtlbFFQAd/GHp58v2kJz993F4olxawGmlafsRWrfS
         3ScVmL+ntD2MWJIbOr3Yyrs7z0wH+JZuVbr4m1R2NWMX+qV3hgEXbPbgMKVcROaRPtt3
         0lng==
X-Gm-Message-State: AOAM530c6WFoetnkv+xQtqL0dBxRmzBltXNGJ2Fhz5Ab+JtP/KaL1jJv
	uCIUCTxpI2UZQ6Vd8YLtO50pQBvFZLq87GXnik8=
X-Google-Smtp-Source: 
 ABdhPJzQXuCV9VNee5Jp3C4mjD2Wip37beghNd8x8uf4u2qLdro9xeqU3LKl8WKD0hONUF4n81eQGQ==
X-Received: by 2002:a17:902:7c02:b0:143:9d6a:8e42 with SMTP id
 x2-20020a1709027c0200b001439d6a8e42mr54924299pll.80.1638136771964;
        Sun, 28 Nov 2021 13:59:31 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/42] valgrind: submit patch upstream
Date: Sun, 28 Nov 2021 11:57:41 -1000
Message-Id: 
 <fd91bb0e74ad178361109e7cd121a0c0885ef1e2.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158911

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abc2ae3d1694e5aa393e7c28d238e90ce4f517bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../valgrind/valgrind/0004-Fix-out-of-tree-builds.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index 75bb0aa7cb..6e26512565 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -11,7 +11,7 @@ RP 2013/03/23
 
 Patch refreshed for valgrind-3.14.0.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=445211]
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-- 
2.25.1


