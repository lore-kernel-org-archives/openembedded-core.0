Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5572DC4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:17 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.1177.1652811908700518213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=43UCmVjx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id a19so17459199pgw.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DH7rL1KkyUaFdTC9QmVHOEslVaaPkdstq17pTLSXRzU=;
        b=43UCmVjxEReLcF/I1lVPpIjHh4BbsRIu+cqBSsdtXnQSL8HUOvT+R4Gn8X0VfbdngJ
         nNrMT8UfZ2kEevVORsB5/p4Kon2zaNha8yMNbp0zvqlCuXxKL5AlB66Z95ibM3ZA8wnC
         4V87SCVjdqAttdDZdYBiFPPnl2/5AEBu696AHSxhA3NjipTk2OGB1/8xB+35UIoA4bEO
         5RKFSTR5ymUPIF2P9p/Ni8Mz2R+GDtvj0OaNoBx0fcgjHR/oiXpbdkDo+RxPaPk9Qevg
         5PNDSWRrlHavqCA2MH8DLdxGPWzHSpudmevBzm/6LQLLiIrtJLpF6p9PyH98E20G0bcX
         pSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DH7rL1KkyUaFdTC9QmVHOEslVaaPkdstq17pTLSXRzU=;
        b=6/AMZJwNf2YDd1Wt3pZ07S5K89GkWUYBh+FkMSjbtIg4N7gW7wzP4sEtmEXNdySkT1
         r8wA5ZQKPfkTJQd+5MJrCG+TNatR/mdZ7yFkDgYDcakVcmKNCrLC7foiJk8vJBXxW7do
         F5NXF5VjqJfByym4jIU0v3LWkdIRQJ7v8eMdohyXIslhutFKTb+h2xPrqYljuHhObHaS
         aYpoLEUfT8TJAZKnFZR3KgBDN7/iNG0W3RNjmlO7Thi2yP0uaGB/eiOQ7VciuGT7GQTL
         QLT+Kv2D5IeoubWPbCJ8E1LDQ0nQd4a0PTR0vmGwuWHD1ClPqtTV9MxpKhcGTfdByw3Q
         CCMw==
X-Gm-Message-State: AOAM532YvXx8JWCmliScmbsHm2NwGYBjosX9n/DhZ+qT8fHWcCowRz6B
	BZDE7eJ+V0Sf849qzxemmfWxK15AjLWBhieK
X-Google-Smtp-Source: 
 ABdhPJyLzbvG03qaPzTl7lSH6LppGBchUgn/B5gWbQmG1ci2RTaLGmDZO71vyCO8qgf+yNMcJdYDVA==
X-Received: by 2002:a62:5ec6:0:b0:510:71a1:f2f6 with SMTP id
 s189-20020a625ec6000000b0051071a1f2f6mr23723669pfb.69.1652811907547;
        Tue, 17 May 2022 11:25:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/31] fribidi: upgrade 1.0.11 -> 1.0.12
Date: Tue, 17 May 2022 08:23:59 -1000
Message-Id: 
 <e42ff3c56228359f4dfa1de2303dfa64fd29f311.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165758

From: Alexander Kanavin <alex.kanavin@gmail.com>

Overview of changes between 1.0.11 and 1.0.12

- Various fuzzing fixes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5396115fc726f0a9f8a76d1b3ec27ea73062367b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb} (90%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.11.bb b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
similarity index 90%
rename from meta/recipes-support/fribidi/fribidi_1.0.11.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.12.bb
index 56ca734558..b29c47822f 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.11.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d"
+SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1


