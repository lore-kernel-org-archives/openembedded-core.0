Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8F2C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:00 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.3862.1668003658219768169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=M0O9ur3O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id k7so17222364pll.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/PnEYqkCsdrtHjrWSeCZOZavEgRQQzcywaUyfzIAKs=;
        b=M0O9ur3OhGLedgvg9CgC48jZ3lQQX15ZzjsFS4rl1gCZI9v+BpsFjCsD9TK/7pRmmJ
         00wUwoD39u64eety/ktLfST8/pyjwKhtrRKj/368JX817wDIfPNvnQtp66pycJEhz8sx
         Q+CuGrNGRBYGaN8SAMDSOXGAJofTsn7uPmZH/qLl/j/hrDcylR+dJI58HuMDn1SYtq91
         ADppSg9mNlibDjMIlP2KRSP1ztEtRwXnP4Z7EAJzRAAK657HhM54/CL09dEGxEKiZEhV
         +6L6D55HQSWWD9KbFp6wuGN5LA+5mu8vBWXq74VE0NTi7y9P998SABs1qpjEHWu+9y/E
         gmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/PnEYqkCsdrtHjrWSeCZOZavEgRQQzcywaUyfzIAKs=;
        b=mLSz1MSntQXkbmkjpBNoRmiS+qCNSUbubiGsnCQrKxuPmquqcxHOUknoBWbelNvrXV
         GQ0c94K4UHUINHg5M7URTA1Tdz4H1oMMDL2GVtnuxFNi6zlXI/gZr6mSVC0jckPQnXkN
         Jz/1dTOLOSEVSDG3BMV952QjWaKJvlzEz58i5xk2U4nwYac4hfwAXRc+FHv2dVpEZLA2
         fPj7awCduDyQ/9w5DL1Az9C1YfQNLXvyj6I55AUsWDYGztwwQ1E8fQWWxSTiOoLgeENP
         NSwEiufc2qXCcApoU54wOQxeZ3jw1w7Svlfpk0bRopsM5TwdKxhmpumtnecgquTQsOgG
         LupQ==
X-Gm-Message-State: ACrzQf1UXSEiQTLVAxGl4Mnxq1AHska3n3cqyrgZQ67cRdIVo7zTXKyS
	zYEJQatBXKqm3EkTTL1pUgxo0V3tJNdv114H
X-Google-Smtp-Source: AMsMyM5BzFKrH6NivDwOWvyoAIODT4hCxGKGpD51d8SG6N6CW9CQtniLWPaLMpB/io+4GWYg9mr5Lw==
X-Received: by 2002:a17:902:d4ce:b0:188:5340:4a3a with SMTP id o14-20020a170902d4ce00b0018853404a3amr34939913plg.79.1668003657195;
        Wed, 09 Nov 2022 06:20:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.20.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:20:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/10] shadow: update 4.12.1 -> 4.12.3
Date: Wed,  9 Nov 2022 04:20:34 -1000
Message-Id: <30fe8df131a3ef5efa5c35e69fce7b2d1bdc2f7d.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173023

From: Alexander Kanavin <alex.kanavin@gmail.com>

4.12.2 changes
	* Address CVE-2013-4235
	* Fix uk manpages

4.12.3 changes
	* Revert the removal of subid_init as pointed out by Balint.
	* Address CVE-2013-4235 (TOCTTOU when copying directories)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5b9fc88d06f79e8dbd2375172689f2fbf3e2a8a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow.inc                         | 2 +-
 .../shadow/{shadow_4.12.1.bb => shadow_4.12.3.bb}               | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.12.1.bb => shadow_4.12.3.bb} (100%)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index a87e23569b..5656a375b7 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
-SRC_URI[sha256sum] = "9fdb73b5d2b44e8ba9fcee1b4493ac75dd5040bda35b9ac8b06570cd192e7ee3"
+SRC_URI[sha256sum] = "f525154adc5605e4ebf03d3e7ee8be4d7f3c7cf9df2c2244043406b6eefca2da"
 
 
 # Additional Policy files for PAM
diff --git a/meta/recipes-extended/shadow/shadow_4.12.1.bb b/meta/recipes-extended/shadow/shadow_4.12.3.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.12.1.bb
rename to meta/recipes-extended/shadow/shadow_4.12.3.bb
-- 
2.25.1


