Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907CBECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:11:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.1212.1663182664765970415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oexk/GZn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id u132so15840022pfc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=c30t7WO6Bm+orEdBduWoaEjERwZI2HuWhobJ+/lfYg0=;
        b=oexk/GZn7Wvdc+yS5Etqdz27tCyLB58bIovmi7MimRLgRueRen/zxPWgOGvvxeSXsp
         BGQoVUUkzjYGpfFo5rSo1Hd55C9IPWj+qmHExEcLoctOcrmoJkCuLycjhh9Vb8n+DfMj
         b4hydCcLFJjV61J+FOfThp3pAcx9/yXWkE8BmIVEXGptXKpOtFqE1oQayTxy3RyxCyp6
         nQuepjn48PbLQ1ArqZsbPqlat1iDuUSSsD60UglUJ6sTJiElSlruLmQ89y21DIzydLTL
         q6i+ysoT/BOeYS4CkN4vm5aziGhFbk+/cSjp8OfRto8CIxVF94FgMeKQOsoLNuwp9k2K
         t59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=c30t7WO6Bm+orEdBduWoaEjERwZI2HuWhobJ+/lfYg0=;
        b=Q5/dIXA5E1SRlIoFuYQ3kL09gSCyU617RzxAyNAOi7WDcQPsK63i/ebbpVj72VAYu7
         PO4CjJr2hJfRSJ7VOQaSLpIP4qB1JS5B4piw8VnNnDexajF4lqIjxjYYxUl0/4ueZNfu
         yU/H8Fxi8xVUpJhRV/2I1zCkFouRVJCRPUD54LdlCqXFsaR3nJ3uEKJnJsxaR7ZQPPSg
         kDXTucwjrtUz85A4nQoDFVXAxhoUMkbmyMTDD5GZYlV6u5Bm71y45wp2O54yuWKRTT3p
         UDTJwU3MqkLFIrNPtKhAPtdKAzZPjjEZdMv1tQGNZxt9hu8fiHbV5xYE6eE2kCTuYM2H
         bXjQ==
X-Gm-Message-State: ACgBeo2hq8vjLSC72D9bnIB0uO2LF5NBzD9UGfIp3hGLMsahfmFGJ9gv
	xos8GkmswsvmszKQRHHCwPQwgfzA+yKNRJpr
X-Google-Smtp-Source: 
 AA6agR4rZjRE3oNeoqhE7Ep4Fk/cg7UeXhHBeXbAusbOtqV+kMHSEZoIj/xV3CzYLpiWpWUgy0+GIA==
X-Received: by 2002:a63:c7:0:b0:42e:8690:960e with SMTP id
 190-20020a6300c7000000b0042e8690960emr34106403pga.234.1663182663765;
        Wed, 14 Sep 2022 12:11:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b00535e950aa28sm10551156pfq.131.2022.09.14.12.11.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 12:11:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] lighttpd: upgrade 1.4.65 -> 1.4.66
Date: Wed, 14 Sep 2022 09:10:32 -1000
Message-Id: 
 <ce5d088d2f8780e16f271a79d6718dc90b351855.1663182524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663182524.git.steve@sakoman.com>
References: <cover.1663182524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 19:11:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170672

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3163134b0f58c58aaabe4e957c30109e63b2d60f)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lighttpd/{lighttpd_1.4.65.bb => lighttpd_1.4.66.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.65.bb => lighttpd_1.4.66.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
index 10aa27f072..801162867c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "bf0fa68a629fbc404023a912b377e70049331d6797bcbb4b3e8df4c3b42328be"
+SRC_URI[sha256sum] = "47ac6e60271aa0196e65472d02d019556dc7c6d09df3b65df2c1ab6866348e3b"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.25.1


