Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF0DC4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7162.1667530922595474511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o1TEW57S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id j12so3719803plj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEZUUwQqgf+Fh8ZnHR6RTi7BS7g+CUvUW/UT9/rpC6c=;
        b=o1TEW57Sqm2hgi881EbwhCc2BSsGawd4o8Xgj/ISZhDbqrDlF/V5G0tzKDcyYb89+r
         8X16RcvowGlZpEkPnsfDpfYn01MjJlS6y9oBYqhgo4Oa/wMpfkSdfnBrn/HoQeO3t6m0
         Fayj56F0kFNycSP52zArXCbSV9/+h7TeCCG9mSV30+5JuQZKXKV/sI3qZisv3Yodqics
         ZpUgnPiUoxLQHpNgyQWVfuPs+UDINpkYw9dlNH3d8/n7G52ScI12dwQg63Z5cbjQj4WQ
         LNsNOLOfmcjX+wrgirwR5VQhlOLbwVUW5LdumlOOCVD9UrGWK/7tj1rM8xoutV8TFGvb
         Yp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEZUUwQqgf+Fh8ZnHR6RTi7BS7g+CUvUW/UT9/rpC6c=;
        b=A6BeKkRe2gO4NIThWq7TQb0Iymx9WA8ONVA6w/nhtqGHObCFS7gVgloXPpE7GsS63q
         01u+ESB8koJdYOyNH8w4gGtCNzQuEnwLtkayME0xgTV8w2jFCBn+On1AlHPAofwkLav4
         9ve3l7wO0gCvxgl+E4STMUjmpatULswp+3IxATMmoqjOTKAoMg0bmNnyZ43UuMnmsRmk
         7mwL7+lGmY3yIec5oB3Y3ptET0aGY7x3Q094FazmigIOIiFZ+KTiYacd2otGKlAKNJvC
         N0ZR6Et66Jxn3BESQx2yOkP8UiYK7KwJ4+Oha5aG6XAjZtIQAPf0TAMZgTvyLBupBLjS
         Ii2w==
X-Gm-Message-State: ACrzQf16qKLhnA2bJoN6jDi4nDT7zsc/RzaGwS8LxXEKm2IFa3IZUlra
	6Jm+ZWGlDsTTrCEnKHpNAmU/UGvPbwCr+LuT
X-Google-Smtp-Source: AMsMyM6x15mZCafpZfZyByLtaTaph7TPwTDuhUF3qgSvQt/8U67QA8rgVHNSi2G4d28LJ5B315PZUA==
X-Received: by 2002:a17:90b:3b44:b0:213:34f7:facb with SMTP id ot4-20020a17090b3b4400b0021334f7facbmr52350829pjb.150.1667530921680;
        Thu, 03 Nov 2022 20:02:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/31] gnutls: Unified package names to lower-case
Date: Thu,  3 Nov 2022 17:00:57 -1000
Message-Id: <f35654181ae27db44f30292191c084f924e61f1e.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172683

From: Keiya Nobuta <nobuta.keiya@fujitsu.com>

create-spdx can't detect the license properly if the case doesn't
match, so fix it.

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c87828493784d996910d742006268a626ef0130)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 94e7f0d58e..fb06337efb 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-xx = "LGPL-2.1-or-later"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
-LICENSE:${PN}-OpenSSL = "GPL-3.0-or-later"
+LICENSE:${PN}-openssl = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
-- 
2.25.1


