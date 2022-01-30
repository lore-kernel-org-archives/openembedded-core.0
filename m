Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E611EC433F5
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 17:13:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.20963.1643562813471295416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 09:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YQrPeIif;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id s5so35674191ejx.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 09:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=19e2uFFwWEIR7BWOm57fMcnit3dsmb2i4Y8umoZ2bvA=;
        b=YQrPeIifWztIu0n1j+rm/6hvtlHUiPGCJZRONVPX9MVvd4XKHPay1Q2qasLhIwsRzo
         wipiID5FXchpIhXBLZcnY5DbhtM2h5GC9L2qZaka5Yl0D0GwiHmQiPwxor0wilHhVPJK
         AcraZwpo/yh5zc5jwa3ImCy23BLh5sGD7dPDB+wIXNpEUeoUZtI+Mly8ZxNxvtu9b8UJ
         4VXnb75SmRmJr+AT8Re880js4B1KO9QUUvCUAjKrv5NhMOE2ag+2tiBOTntPUKltIehR
         iyJTo5uqOMCsWWbfHq56NTrFG/EEY5simrm7GX9CDg5vPI8Q12IkNrm3YCoRs+gsKQ1U
         PHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=19e2uFFwWEIR7BWOm57fMcnit3dsmb2i4Y8umoZ2bvA=;
        b=b3BkcGO9h1XsSvSJtIwL8vWPq1sUyikvB+FSzX2j72WDHT4CrQ98Joov4SPD/mBdE7
         HITyPHSLlrTY7KV9ec1T1mJtUsZz+MvDWW5eur2IE2u2nnr6IUGm7hOLieXLKMzszIMH
         w96mtRg2VhTl+bT4Yc+HEgxspplgEL7nPPzJ8yRJYuYl1HoS7bjq84DFplgkDVqjFnvI
         tm2CWNZyI7fxbIkHENaURypNZVlOHDnGj0VCi1T2sgTrvkpcHWMAWUT56yzG7yeunpIG
         9LteGRPUt17YLTgWmjdGnhhNDvnK0HfX88eE08tpYcYL/wbjAP3GIBefWbwe6c5T/gn8
         usxQ==
X-Gm-Message-State: AOAM531aAVTV26epmj6ZSDrTFrcBN50zeLV2qLjbVXaT3Cvo/eq2IELI
	nzo6JK+2v+0qQyicsRqxVOdCqRXmbWIZIw==
X-Google-Smtp-Source: 
 ABdhPJyeFp89p4u2pQOTgnTD4ognRbsoEu9C8Apztq0ixr9Nzq3l9oakQ+yF+UIYUqdAe1w3omS3ZQ==
X-Received: by 2002:a17:907:961e:: with SMTP id
 gb30mr14427072ejc.430.1643562811381;
        Sun, 30 Jan 2022 09:13:31 -0800 (PST)
Received: from localhost.localdomain ([95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 l19sm4305658ejq.139.2022.01.30.09.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 09:13:30 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] ethtool: upgrade 5.15 -> 5.16
Date: Sun, 30 Jan 2022 17:13:15 +0000
Message-Id: <20220130171315.80018-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jan 2022 17:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161112

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch | 2 +-
 .../ethtool/{ethtool_5.15.bb => ethtool_5.16.bb}                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.15.bb => ethtool_5.16.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 0ec3537198..e557d9cb8d 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index 6c9453c..7c0f829 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.15, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.16, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.15.bb b/meta/recipes-extended/ethtool/ethtool_5.16.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.15.bb
rename to meta/recipes-extended/ethtool/ethtool_5.16.bb
index 4192dec300..861fe3bb7c 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.16.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "a6a1638192209269ca74a29d73903f28531ebdf0794f3e0bdfdbdee2dc75d98b"
+SRC_URI[sha256sum] = "4160fa127d75d5a6ebd5e871118486ac730dea2f28b2f1ad40fd1ed3d0d369e0"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.17.1


