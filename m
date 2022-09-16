Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2B9ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.940.1663362506287748797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cp0Zn7Nk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b5so37911231wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=HJHYEhmFn7DZQJysSO82dRsY/hKywJ2jh17WPDAo60M=;
        b=cp0Zn7Nk1RVBUpEqs9dZhm6kCCbQRSZrzfakVWj/TFUkjokngdSibq3+c3SGGnK3pz
         FTHjGkMzr/AT36RH3BO9PYpjCWxZ6exxoACWabARSEHpFEDlcsUHjwvX6sxz1R+BNmtp
         NLLIf536mq97YQCnnk1x91PB2Qs7Xdfwzgw/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HJHYEhmFn7DZQJysSO82dRsY/hKywJ2jh17WPDAo60M=;
        b=YhBhVBNAmukkVuLvfwB4sFprRYyjO3EgSi4CrG3Qifk2GQjae/hKQ9Q8COwLjI6jk0
         j2X94/0JXidV4U5HwuSLlyah5L42oR98dK0RJh1X6ejPG/48HJt5PelOhvgmjn/2UvmH
         Ad7rn6ZtDeMQOM7+K3pFFzOZtjqZxPx+ESgma1jFm+29yMNgAESkmWl62sCQ8JCg5vMw
         sBS0jwS3qW7ml2w33lmxd9eQxQKOb+YBdCYkMKCXCKD8krgC8pSJE2g07VasUMrUm8om
         J7s0fYH220/Iu062e2mrS3A8mwJAW+W55mYw+dqI8HvUr+obxZ4IEFWfr28cYNg5710Q
         xBRA==
X-Gm-Message-State: ACrzQf2Z/7ECOp+mFGqRCYM/kQ9ZA+4NOUVeBN8+Oovk/07KeDjCxQW4
	cub8LJhhy1q+vuaObmuIwvOKf7W036BHDQ==
X-Google-Smtp-Source: 
 AMsMyM7PypS7NbjEWeBMy+Zav9KK3WJNithkrTNarpU9DRf+ss1zy60myEAy8E2pSy0WiunyVldXfA==
X-Received: by 2002:a5d:610a:0:b0:22a:2a9d:880 with SMTP id
 v10-20020a5d610a000000b0022a2a9d0880mr3865809wrt.22.1663362510511;
        Fri, 16 Sep 2022 14:08:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/24] libcomps: upgrade 0.1.18 -> 0.1.19
Date: Fri, 16 Sep 2022 22:08:04 +0100
Message-Id: <20220916210818.1228761-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170808

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libcomps/{libcomps_0.1.18.bb => libcomps_0.1.19.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.18.bb => libcomps_0.1.19.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
index dd0a1f8f952..fa1fbc8f0d8 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;p
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "dee4ae37f7818709802de28c4d16fa823bd83ae2"
+SRCREV = "9322bdcf06630cc094f094f944d7d0e2cb798b73"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


