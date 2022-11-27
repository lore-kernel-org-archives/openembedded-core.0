Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4870DC47088
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.92049.1669557361761849325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U4KzGG7m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so3669106pjm.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPTxAIejrtqafPE2ouTklmSEYKRWk35r2LL2fC0Dv6Y=;
        b=U4KzGG7mmzcHZ76fUWff5MJvhuVjxFbIOTnA5JEaskMttTpe5UIa03JUefFcrjbBNb
         FC2DY+nZK1Rf2QZk3WoHxnbGbZCFGz4ImWBQ/hmLerUeQEhOwoRPIMhCEJpUl7XIMuzV
         mkC6SOvje2sfKaDfKVXP9n7LeMlHb5HR2oEj2VjymA3iAiR0XSQiINwxgy1u+2Yamgrc
         fJY1JCyFyOIPeFdG+Y1BESvfy1P6nvvOXmTIJW2fxFP9Q7+mBW0Tv6dtbVZCUIRO9bvH
         xVeb7ei8OpxmtYL9m0DYCx4uQBI8+p/RIirISkxRa08Jvf6J3DHvt3FbeqZuG0hQVbuR
         TOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPTxAIejrtqafPE2ouTklmSEYKRWk35r2LL2fC0Dv6Y=;
        b=wjF1GazQqj2d71nf0KHba2kjYnvDLwQ6MtmzBdG2/pDOqZbuJo4sGezG4iM0lnUQlN
         oxHhYrqSLhyOh2u+KI8vQDYkDWSKgbKT708TzesU6uObuYFf71PgAr0B7YM1W3JWREBC
         n7iIrxVH33eOouHrcdVL8D21w/KQPxWIeYRHUt8QO1YYS/Fhnn+96vyk/PbBCJyiLhIT
         ZRZYHfUZ4HN7v63fL/xxWbNPVDKlMdF/gA5P/XC8kQKezz392MpOko7GgSBn0PlP4mZh
         boYFxrrgjL0Al29/evjBkCOYJZ7vSUavd1/cnJGn9lu3lW8eM3TvAMFokKm0cMQgbMlN
         c+xA==
X-Gm-Message-State: ANoB5pmQ3fmjoZ3sRjbqShotEPAruQrM9esJlNYIZfFRVIGz0SqWDmET
	NlmkRcA64/6qZZiUiw6U2btHBI3+xVbRNx26uIA=
X-Google-Smtp-Source: AA0mqf4nQgMLXuw/GQeMaMF80hnR4YJKKgdthRSwd6Tm795fziuhYoTNBwA3RjL2kn6Yf7WR9LIeLA==
X-Received: by 2002:a17:902:bc4a:b0:189:6795:d945 with SMTP id t10-20020a170902bc4a00b001896795d945mr11621930plz.136.1669557360763;
        Sun, 27 Nov 2022 05:56:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/31] libepoxy: update 1.5.9 -> 1.5.10
Date: Sun, 27 Nov 2022 03:55:02 -1000
Message-Id: <6a3e430a776866c05d354d272c0513dbf188ed34.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173861

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes since 1.5.9
- Fix for building with MSVC on non-English locale [Seungha Yang]
- Fix build on Android [Caolán McNamara]
- Add the right include paths for EGL and X11 headers [Alex Richardson]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 436cb3c98c582e17e6ed2491cc6598c56976af46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} (95%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
similarity index 95%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
index 881010b1a3..c3e770dfa8 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRCREV = "ecfa8e0f083084181d36966fa084aca9a6c97d53"
+SRCREV = "c84bc9459357a40e46e2fec0408d04fbdde2c973"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
-- 
2.25.1


