Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341E0C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.32833.1635699522841539357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sck1eSNh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id s24so10126574plp.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N50AYu1ZBmK7df0Pu/EPvirc3u5rLj3AwSjkLDoaJW4=;
        b=sck1eSNh/C9Zaw5k2m9LGA0V3qEwQC96vtd6J2klKLeacWKFokhne2cJSwG/h72bZg
         Um1EdUH5lEcHvQl6yHwHG6lYS4W3rAl/C17Nbcz21dVim4rbLLL3+yfyqa1BVzXYFyZP
         /LG8mqBtOnDp9bLcKRJ2rjZmTqBXkAqau73jsUdOtExKtKKYSXIPNzndiuDRVOTgHrWS
         I4xOh0/BWji0Olwb5lFTfjxJVDnjpZeJMyGMfZIe3RuTvqr/tou5TyiubwMRmqvV6OU7
         7ucs96hexGfDM1jOKlzrIC1eeC0JVBUYovHVgQvPndtTex5Yd5mJuk7ij1W5LunggPfP
         9Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N50AYu1ZBmK7df0Pu/EPvirc3u5rLj3AwSjkLDoaJW4=;
        b=fX9B43Hus0dU7u3rYrwrXRtkwNKwHkah+Eq1tAG2x1JOuEnrSWAvMysQE36arfJoRE
         tDPkGTm6PmrzHtVfcG93iRxDvmPeRqnlIAzaliyTlzcOfwN7wucGod+nUzFXdYw/xtTS
         FyQeFwmCTWQ3MmAuALVR8F3YW83x1XUvQN4wowtFBLr63GU1RtBoaO7dWBZoi4X+jXf9
         JGzqoR/7P3kHFYxIi8XJZF/4V7Z6b40XwxJ5gfQWB4q9cMybzHTjdI7JAyBFLwowpxpU
         7Kc7Wg3SPHgYeyLzGdzgM/K26QQWIfXoJKN5tr7j2F1GWbYsw6WjRTf3ZXGWj7qnitxD
         LTAQ==
X-Gm-Message-State: AOAM531MUbLjnKy1SoKTqQI4cGf0KeDxl+PmQWz98rOJuyuqWIJooAfe
	mKbYqtk2gVCz8cu1BNC5nB7/Z4FiRMQnnZgE4l0=
X-Google-Smtp-Source: 
 ABdhPJwFfhaLah6EZN/BZUPmAdF30oOPaF6IGtNgeLDCKgmV/WT5yYvuqLevWxPSop/AH7HpGHqn2Q==
X-Received: by 2002:a17:90b:50c:: with SMTP id
 r12mr24018000pjz.71.1635699521939;
        Sun, 31 Oct 2021 09:58:41 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/29] stress-ng: convert to git, website is down
Date: Sun, 31 Oct 2021 06:57:39 -1000
Message-Id: 
 <fb0014018ad6be61320e29e28b7b72f0ff1c7574.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157678

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
index 9b987c7bde..af8e77ece2 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "7b89157c838f2bb4bdeba8f46e3c56ae"
-SRC_URI[sha256sum] = "860291dd3a18b985b3483190a627bbede2b5c52113766c1921001b3fb4b83af0"
+SRCREV = "e045bcd711178c11b7e797ef6b4c524658468596"
+S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1


