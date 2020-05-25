Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.41061.1590446251500890460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QNXb12kr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id q16so7887566plr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n+R2h8eTVxLEUz9zR97FozOOE/bY6X1kaoJ2VQEk2Q0=;
        b=QNXb12krMSOaSdnO5WElekMNvmdLzcmv7YcPPu/L7ZQXgOPQnmDrhM7YZ4Xt8O4D0d
         5q6ALaka5UaR6e6xyWxLGQxZNpHAIrhAULE08gmusFSXg8j3sV4XhPo2BxApleZTZNP5
         mV6nnNkXMO//7p6S7tR4IWppd7Mn8ts49CmeM0hZwuZ8Po0QhALVROPpeASfq42kmGS2
         dR7hqYdehIeHIfySrch5V9DKHF0Pt+e2x0i1eYRjy7Li7wtNgkDjyWstBo9aN3KLcAsm
         9g21sbRdzi0l2FDHhm+oERmHt7ifPZTBX5I9SGh5fkQS1d6xVIOKG1zIghc04T6p0PZq
         1HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+R2h8eTVxLEUz9zR97FozOOE/bY6X1kaoJ2VQEk2Q0=;
        b=GztjXWkuyAUOpmA4QEorZv74OSnIL4qpRZHHpKRcQFNLYP3Ys7PCamkJ9ByLa5nxdP
         fPnbHomN7mvVOPsbJIVAsEWG3H7S/rQyoGz86ME0GthltVaMx77DGrtMIfgri0mDTZ8Y
         lqSIAUxE8qzGrhsyowKaFRh09awR2I8l23QhIWJGO1JOR8usb5zO/o0NPFFWRSoBgqsW
         XEmNRw+itKfowcM2EvRyd8NxFPtLQNWL3ingAz+J6yY7B62DJbTFGYzgK+kusMW9ZmF+
         rrWbbQkzKRPJpWX5+aZdZ10bdfN7ssE/FXaUgl8iVmcxTDSB+FAZl482saYm08+jc4JR
         arIw==
X-Gm-Message-State: AOAM530MpOXH2Ai2hF760Q9BQ8qvwYAELXd3mMmh7nhBIdICsoDzPjJh
	0sG8q/MXdHSxhV4a54Us2118sSGZQHU=
X-Google-Smtp-Source: ABdhPJz5C49t9yBUiqrxZovsS+j1rTRE+G8ZUBSmUxXqIZxgof6YXyySxDDtsAZGTTbaJ6VC0GqeQQ==
X-Received: by 2002:a17:90a:5d14:: with SMTP id s20mr17324247pji.9.1590446250665;
        Mon, 25 May 2020 15:37:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/17] recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
Date: Mon, 25 May 2020 12:36:51 -1000
Message-Id: <717d73e5b23a49fa8ede847168445c1340147011.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 730999efcab0b8e49f1ade4e535a59f6d8e395e0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 7173409e05..139307cda3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -851,7 +851,7 @@ FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw $
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
+FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
-- 
2.17.1

