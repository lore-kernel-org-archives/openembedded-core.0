Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B461C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.56.1659106075831474462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=H5a0pWXJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id y1so4836676pja.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MAed/aU/tNAWQMRmnU6Sd5zirr7LaUpoPRNJpb1PO5g=;
        b=H5a0pWXJrXdTC4YPWyTU83eTI3AbR7QN/d8wbXOWQStqO97v8xUDGlqpl2K6TYvkMW
         FSMFp+VzAW6FatQ/8sW26G0DzcJmZKXixa6v/ty2QO1JbL09R8c4H/69ZnRoaTvoUiT6
         UGeh0G0j6ICcwcJ8fn+rAb7GIuml0Cr+TOKCeO8gVEw5db8OBqvif7ClCRGinSfzrpJC
         A+PM3thC5gUQ0Z2YKEaO/Y83v02TuXnPDNo0/bPiItszJTRanU+VsL1l7rp3CTAiE7/k
         XPadiAsRphWqtMYPDdUSMyOLr2MVoofueRiyGOu4SLkO04QPXUVWheRqkldKFt1UuV3b
         xtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAed/aU/tNAWQMRmnU6Sd5zirr7LaUpoPRNJpb1PO5g=;
        b=wUQ51NYq1Q/+7iFdRCostcjptSQmg7dg2/YFd2WmTJJmmuIAxGSrC+2Xz07zpRo3LJ
         KC6ODsbcuWI59o9i6Vp6bmJN2r8mpkxkqVFpT/w1b+387cHDrUanBatXW+8kRjGMpOIh
         aqbMZ7oYKaHKSoYmy1Q+hgTr18vu93uyb7IkNQ1SbeZp559VxGlDun0DYcpo5YgmjZ5M
         cBRfxkEwH6e9XrY+JjRqgKGIyVfZVYOVAn/dcqlpqBky7FWsXJBRLf1WbpeCfplPWJRJ
         k3K+c5mJFayNohMk3GzYdDb5U2aaJDUp7PFVd7t9NmHyWj+W5am60youfYLxSRYmTZ1U
         ObXw==
X-Gm-Message-State: ACgBeo1CDswTv47nwOSbZJUteDg4WarvXkFYy0Np1HpetZWFJXSbuFNj
	84bTMDDUKMlZRopbTKTKv7bDwqfkJQD3VApC
X-Google-Smtp-Source: 
 AA6agR56quNuMEmcg761qbRQcd2G7OfGGFwZEP/AZ9OE8CFjRVaAQnDRAkjho/z4OMBpW6+vSDZ3Ew==
X-Received: by 2002:a17:903:244e:b0:16d:d5cd:c184 with SMTP id
 l14-20020a170903244e00b0016dd5cdc184mr2400952pls.44.1659106074753;
        Fri, 29 Jul 2022 07:47:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/29] log4cplus: upgrade 2.0.7 -> 2.0.8
Date: Fri, 29 Jul 2022 04:46:30 -1000
Message-Id: 
 <1dae5b5482b0d8c1c7832fc69d9e2998e5311dca.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168649

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

Add CMake alias libraries
Add an option to disable tests to configure script
Fix C++11 compatibility: C++11 does not have basic_string_view.
Look for Android's log library
Fix handling of ,aux extension for FileAppender
filename should not be empty for TimeBasedRollingFileAppender

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e09ffe4ec692329502165282ac80cf552113a4d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
index 3798b93f76..bbf4ce6218 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "086451c7e7c582862cbd6c60d87bb6d9d63c4b65321dba85fa71766382f7ec6d"
+SRC_URI[sha256sum] = "cdc3c738e00be84d8d03b580816b9f12628ecc1d71e1395080c802615d2d9ced"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.25.1


