Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73890C32796
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4535.1661294179804728120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cLQJ7y8/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id g18so15333089pju.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ECLJ+OVJROsRP0Q8f42hVPNrXTTqrSjISjG8eVDMXB4=;
        b=cLQJ7y8/8IwM7z/K8XLc03ZGeoqsdVjygmZZe4e+agozzi6PNTUaWOTX7ASVJ9Uu60
         hWjgXqSEImBIeojBp/6kULE6kQ3ZwLWMEv26bcBt//KHr9DHalPsEPFV1zE0rouO5aY4
         gSGS41oDs/gHGmodO0K3gSLR/fhRXr0OYq7md2GgFI/6Lroup44OKknGmot6vPKmRhPl
         oOvevANaMGA4rT8UFAd9tOXyrBRxH7Vy2qPu21JLyl2OuPjFeRAhgrjU6JSIViOcd5UI
         hkHu4Oys4e8Iq6cmAsA9gFJCp3QUdBQwqZN2zNfN9uPNmCOvuNnPwLqazVnPQAeExgUH
         swIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ECLJ+OVJROsRP0Q8f42hVPNrXTTqrSjISjG8eVDMXB4=;
        b=cnf9bx2/NxgE3CvErEPu66yy+cKsTsdYHW+0oqd7MjS7kjWhpIka61eGHfsNT9abaq
         TjhrZL33TpWlcUL1ybJ84Admcut+C0srhtYvB+P7NefGcv+y7gGvfvAj1bt2LlXo92Kp
         fZg4fiBwSbtnEcXhFDNgqTf6gDYzbhh8FfUSCVTiJ9BaF2gbhV6Ag7o4vE0B3qyfgX/o
         l5ndzUiSQsNJFHc6omA7VRsGQqe1dWBSsmFgRVhY+Zuw5fPkVlCLBgkTWphQudHqQdXr
         89mPYKWcDR+LMN/flN8PThh6dTSLsyNiS/6nBr46ZMLK+16arrCba5FFrHbYSnxFTsWD
         QASQ==
X-Gm-Message-State: ACgBeo1CeJNxXs2SKA97BcS0ozCLFuZWN7iSzBmSyhHOWaUiXjligQMI
	7jZe0HF2CqTHyoCCV/q1xbzzZYamj5lwTzRP
X-Google-Smtp-Source: 
 AA6agR5SotMniNRzekuSKXv/XxCsGaih5fwlUHjeqO+rKEdNlGTUid5rhD/HW8Tkb0ZgrFpzZjgLyQ==
X-Received: by 2002:a17:902:cf0d:b0:172:715f:69b6 with SMTP id
 i13-20020a170902cf0d00b00172715f69b6mr26162671plg.110.1661294182818;
        Tue, 23 Aug 2022 15:36:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/28] mobile-broadband-provider-info: upgrade
 20220511 -> 20220725
Date: Tue, 23 Aug 2022 12:35:28 -1000
Message-Id: 
 <63b38e57618d6c18c71d1b2b35fb16c63041ddfc.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169748

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96185dac787e14fa9eb77d009653a2fd4d926e3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index e6f216e5cb..2cc92b7b47 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "3d5c8d0f7e0264768a2c000d0fd4b4d4a991e041"
-PV = "20220511"
+SRCREV = "fe19892a8168bf19d81e3bc4ee319bf7f9f058f5"
+PV = "20220725"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


