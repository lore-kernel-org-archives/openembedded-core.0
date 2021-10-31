Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D21C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:59:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.32850.1635699539689379259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YDyVzNLf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id r28so15137033pga.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bJKiBFeEcrx5DAS8zTzoQnFcEj1m3Q+a/HqY085Dhao=;
        b=YDyVzNLfYvGQypdM7+b1sfZ46uW+4pb2jqh3h+R8YwfraQOpJh/FNbvW70STVwjgFm
         cJRdmOZ0aFwv7WQsJvrzesWPfhCOIhLdmm26MW5+ksD++5gZ8jS13wZklCu4/LOhC0eg
         QyWV6cZVsYI8dluCvXcVeRm2qrNDTxxheESDTiyFuwlV/ZQWjFg3xcYnBS/jLOa7a4fl
         K77pd90kGyH6Xj7F0+y8O8Lg/VkgZvwM+kUj4wqf3bHNxRHAd3qYbA7mwivjWln0b988
         RLuAlUEqN+D64l36ONWyDpVk6xbteZgVzeEvgBs46PByr0vqzWdAzSrZS9ccDukstTwr
         2oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJKiBFeEcrx5DAS8zTzoQnFcEj1m3Q+a/HqY085Dhao=;
        b=Fx6sA7FzDIuHLmmgpCRgpEfpDcCRbVN7jeYdZGO98IW5O+6xwteHm1iQDnHGWgTnQw
         TlGGYV3E4SnEAeJ/TcppGdHAIvRSUcfPsSpAIK7jAXI6rOVGuEHACbAubO4FyXHG9FtT
         5xo1X/1+k2xo1qnfWR0nyc8KElD840SpGzG9OK17O4fl3lXiiL5Ajg32BaEtqOKlIdHI
         dKvRc482EWO0eDVHf+D/uFRyVkMB5OLA2VGHq7RwHMa0hg1LmPCoaTPbO+IvwxLAvNUm
         dV8CdBEI7uWeYd07CEsgrYzdKkOLQFvjBuNfvrxk0SKCnSmGjbp7v28ubucDjRsB7Aba
         pwPA==
X-Gm-Message-State: AOAM531F0nvBdVFoAHHfY8f9BAhpZ9rRRRLHfq+6csp7ZK5CrqCps+8t
	ojSDamGVSM7+cgO23XWbfoEcxzOAiNWhnUjKyFE=
X-Google-Smtp-Source: 
 ABdhPJxmGOXFDRvha5vXcyK3SIQiQMtR+5lG07K+58iuSecBIGbE2meLZ6SqjPHRI14F0yjtE2G9NQ==
X-Received: by 2002:a63:ce0a:: with SMTP id
 y10mr18193778pgf.133.1635699538723;
        Sun, 31 Oct 2021 09:58:58 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/29] tzdata: upgrade 2021a -> 2021d
Date: Sun, 31 Oct 2021 06:57:47 -1000
Message-Id: 
 <bc252213baa0d0e4ea9289e7f502ce112004059d.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:59:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157686

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f171f4f528090fc108624de6049274aa4d4880eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index a89560b424..5c19e9a7f4 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021a"
+PV = "2021d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "eb46bfa124b5b6bd13d61a609bfde8351bd192894708d33aa06e5c1e255802d0"
-SRC_URI[tzdata.sha256sum] = "39e7d2ba08c68cbaefc8de3227aab0dec2521be8042cf56855f7dc3a9fb14e08"
+SRC_URI[tzcode.sha256sum] = "ed0d02be79b54f4449ba1f239aeaf9315da490bf32f401d302dcbba4921f591d"
+SRC_URI[tzdata.sha256sum] = "d7c188a2b33d4a3c25ee4a9fdc68c1ff462bfdb302cf41343d84ca5942dbddf6"
+
-- 
2.25.1


