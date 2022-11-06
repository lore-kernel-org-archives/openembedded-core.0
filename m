Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8C0C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.17887.1667750654482618491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LZ4FFzuF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id p21so9044169plr.7
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADY2A/Kon2HfilIpy7soWAB/xmYiNWJgrT+pXA/1ydk=;
        b=LZ4FFzuF5XSKMz8hPynJCEUsBrGw/+IiK3a9+9IH2eOG9Q2eIAwSobnu26lWsLSAvk
         iA/n0di9n9RaL2Q949AnrT7NPQSFgsDu+ImBx7Pma0IUynGoVZF5oLJ3PvL72nOvvSVR
         3uPZbsQIay+mBBCwcOTRmI9OgYS1gs89knf1tcrYOWUXHVKLr+6E+goO7G1mBSwdguXH
         izuj6eAyz1YUb/ZLkdrbebGWXiayj/GBclHZL/obTyyHaFEReC+xGBh3pxIqH6ZJ0lRO
         p6U91u40kSPNIyikqu1FCSX90EBV9VbuS3bdojaoJ6Obwu4eUMM5gwZ4qL7zWGs4v52O
         NGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADY2A/Kon2HfilIpy7soWAB/xmYiNWJgrT+pXA/1ydk=;
        b=p+AiPZECThpSIUWTzUwlFHPb1D7oNpJY6VIdgRh5bvBqMN7CTHjxz8D1E3KGHNarDt
         +Sj7pGDvkzf8xfwRn3ff10dwEQp9qLwqNpKdWHKtwYUfVJmhH2OW0JHxRNd4TPhi7GDi
         hl/6W9VF3KoRhCLDTTrnQ8mRK4MZyz7JnTKfTFoHZpfX1pJ5m0L1NVLvPJ4LStXWy5G/
         ThWxtjQt0U3niFUSdKzED+5VTeChBZ7GxAbdpKMDgtCUY/Odu7cic7XleQ8xqQtv+0kE
         ceSm1COulkntsnkgMlqVKMBp1DmoFszNTKvQ5tMdNHTAJATmjwmYIvbM3DoVkplRBzq0
         PHrw==
X-Gm-Message-State: ACrzQf2rCT4OPiRo4ajQVmgbYTYoTmnnICYvb27nEyfCNem0rBwmwKzQ
	X0vHDL1IUSgQiyok3TiW0kl1nN1c0UwobLvM
X-Google-Smtp-Source: AMsMyM5lwwUxkXsvDcswVmwXcqF1VNf85vi5yJt5MD226TDLk9pm1stTIPDv25y2FzT3Czns5a4pcg==
X-Received: by 2002:a17:902:e803:b0:187:3a52:d262 with SMTP id u3-20020a170902e80300b001873a52d262mr28593142plg.85.1667750653601;
        Sun, 06 Nov 2022 08:04:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] tzdata: update to 2022d
Date: Sun,  6 Nov 2022 06:03:51 -1000
Message-Id: <d325f5389a09ba03b4ded7c57c29dad773dbc0af.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172812

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ceac0492e75baa63a46365d8b63275437ad5671f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d032fed356..d3c78e9157 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022c"
+PV = "2022d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "3e7ce1f3620cc0481907c7e074d69910793285bffe0ca331ef1a6d1ae3ea90cc"
-SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
+SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
+SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
 
-- 
2.25.1


