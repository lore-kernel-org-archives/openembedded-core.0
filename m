Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660FFC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 06:58:39 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.2399.1662620315783454883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 23:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+YqhM1t;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: rak3033@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id 145so17002546pfw.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=BC0B0W8fq3ieF3o69jUQx/O/48WC2ZrZ+2zskk6qxIA=;
        b=E+YqhM1tK5EkkIDQmW7fKXki6XqBJI0DEKcJDvrWW3iAzVren5KpPH4er2xysfLjNF
         VIPKX++MB8xo27dBBOW4P8g5AbBAYBgDzpokXkbXUKk5yulQ6RfMwmUTaznomwznGu15
         i4D90tghQZl8nYaJzDGo+EApUhc704PdL3e0jYPqop2xeWk10VypNdpADPrV1mMV+mKD
         L12JbHlS7CyBO5hXzpLmwWj1zwuYu/+8kAx165dMFiyKFBsAZASNI4xU/vFdmJpghfCP
         r6SWjcj82P3KIwnrFPdO2dcf9qvBhU+lYS5o4EiaP0XFvaybI5coACdYqoxQaeFPbqhr
         PfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BC0B0W8fq3ieF3o69jUQx/O/48WC2ZrZ+2zskk6qxIA=;
        b=wKafQN5qciOcWtECP90l9PGaECdqkMSJB06mc301TxfP2Je/ZxYhCZbJQp8WfR22jz
         NQeJUl55dwVnsHa0IQix5fg7OYkQ70RDovHhyUYlAHTOp8BJ0pVPgLr7bmsc5gdFVd3u
         105seXpOgaJlPEdiAlwcGYeA+6K5yDJgewjb6/IxT4PrHs3R21knClVCxZulNfvUUr5W
         bnkH7HJBKFKNPO+o59ScCEPcRxT8dEp4Q5JUX5hasKVZj2OXzC53cyb0Xig6R02FdHn0
         p29PI45gAH4Z7gWZid/ZNxkBXrtq+NDXW0AlN6YehKnzi0PZFCbKrxoSx3UPxcXp5DYj
         bfxg==
X-Gm-Message-State: ACgBeo2TgUptZxV3vKE1DFCkvYNlmusCcJ2WDjEikC2KF5rJkicc6rHE
	wv0vppd1GlMr2vm01LAXGfOpi2Eoc6WqBg==
X-Google-Smtp-Source: 
 AA6agR4QGMR+EF3oTMuSpnX9/soCuKaWDYMyXm6m4JpELJyhZQFmLntxIyguoLBYVWX1yl9GimtSHw==
X-Received: by 2002:aa7:9f50:0:b0:53e:7cf9:e074 with SMTP id
 h16-20020aa79f50000000b0053e7cf9e074mr6147603pfr.58.1662620315000;
        Wed, 07 Sep 2022 23:58:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:33c3:2e02:685a:a9a:ac71:934b])
        by smtp.gmail.com with ESMTPSA id
 ay6-20020a17090b030600b00200b12f2bf3sm909154pjb.51.2022.09.07.23.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 23:58:34 -0700 (PDT)
From: Riyaz Khan <rak3033@gmail.com>
To: openembedded-core@lists.openembedded.org,
	rak3033@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	riyaz.khan@kpit.com,
	Riyaz Khan <Riyaz.Khan@kpit.com>
Subject: [meta][dunfell][PATCH 2/2] sdbus-c++-tools: Upgrade sdbus-c++-tools
 1.1.0 to 1.2.0
Date: Thu,  8 Sep 2022 12:27:57 +0530
Message-Id: <20220908065757.27272-2-rak3033@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908065757.27272-1-rak3033@gmail.com>
References: <20220908065757.27272-1-rak3033@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 06:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170452

From: Riyaz Khan <Riyaz.Khan@kpit.com>

Update SHA value in SRCREV.

Reference link:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.2.0

Signed-off-by: Riyaz Khan <rak3033@gmail.com>
---
 .../{sdbus-c++-tools_1.1.0.bb => sdbus-c++-tools_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_1.1.0.bb => sdbus-c++-tools_1.2.0.bb} (88%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.2.0.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.2.0.bb
index 01f66c3f2..27b965ac1 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.2.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "bca8e81037766a0454740c40307eea32831c101f"
+SRCREV = "751c1addc4fd2f949a466f488c1b7de2ca3b76dc"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
 
 S = "${WORKDIR}/tools"
-- 
2.17.1


