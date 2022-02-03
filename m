Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EC0C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.2850.1643917889790152492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MfHeRqrF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id y5so2172928pfe.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Wi4/6tHOvSQkarDWq2HYCRuCS2wVdsorjrrW6ME4KGM=;
        b=MfHeRqrFNeBLAam/nNG9uF3221x0XzhDj8wsWTc7NthaJXkhKq7wHkteQF/l4UCqhv
         AbxoqoqXnh3bQ7zTBFKk9agq2Jr0GNMX6zVc8JgMkfCMmluN72a90oHPEGxNF5StI+kb
         WxDyj8yUtyrJH9MwcN+dkgMgi/gGNbEZnpnp2GcUgtnS68obiLO751vfnDnc2lkvHmzA
         CQg2J67BpvSUxZa2aZLTu4XqvDP0lZ6XbNpfkm2ad/lHK6oytnV3BuH4tZ8WYl9ULOR/
         dAtE20pSNDI2O6fnjR2dm4r8Sjb6/2QunoHMdhWTcsjXL5YmQN+2UxeRnTAopNq4oHTc
         aY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wi4/6tHOvSQkarDWq2HYCRuCS2wVdsorjrrW6ME4KGM=;
        b=8CXAnb1EP7o3XCP4w1Rw0lW8EZCe8do5ohqGsgC765dwmRX8/+EE0p+yBLMpg9rsJH
         sHhETE/L/TLOT5SxeALzUag7Hw7SMzOAvBU5WyBYY6xgQ4BrdASB4xTK7FNu9fJg2KKe
         0BpKpvtYjJWB0ngKMgq3rZEiprXGnQzHoz3L77ifRFd46nVxlyeBRxsSx2M2nwAvnNOb
         xq5+q8AbEcC1spDZUBPy3j7m5q2d6s3bhgF9YUPe9nV4+/xdR5xhAMzj6HSyq5gVWqX/
         dtHvD8Y47uqXcYsfHmVcwa7Z/SXGE6e2Z71V28ZWfLox97uh3hM7w5rZJmBozNKpE9da
         Bggw==
X-Gm-Message-State: AOAM532MExpC+v0FTN/pEwohp60NZsxRHK26XxSWqejFN62IYyCFGFAg
	JJTUU2CQ3pf24dyw38EBvnX4143HcQ00IOFD
X-Google-Smtp-Source: 
 ABdhPJy6wuMDDNC6HhRUnOi6ifdUAZC9LULFQ373ska2rqwH/RGjG4zi61nKJduIWnG5cr4LW7idZA==
X-Received: by 2002:a63:fc64:: with SMTP id
 r36mr29691834pgk.529.1643917888803;
        Thu, 03 Feb 2022 11:51:28 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/20] lsof: correct LICENSE
Date: Thu,  3 Feb 2022 09:50:36 -1000
Message-Id: 
 <ef5e1e0b877c8147e6041acb2be4e7c6fa78c6fb.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161307

From: Ross Burton <ross@burtonini.com>

The lsof LICENSE is superficially BSD-like, but it isn't BSD.  Now that
we have the full SPDX license set in oe-core, use Spencer-94.

(From OE-Core rev: 5c1d61d1d4dfacb643a366285c0392e6a31087ed)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsof/lsof_4.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-extended/lsof/lsof_4.91.bb
index b3adfd57af..7c85bf23fc 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 HOMEPAGE = "http://people.freebsd.org/~abe/"
 SECTION = "devel"
-LICENSE = "BSD"
+LICENSE = "Spencer-94"
 LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
 # Upstream lsof releases are hosted on an ftp server which times out download
-- 
2.25.1


