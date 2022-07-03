Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B40C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:55 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.64005.1656877012656779331
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OeNzPhuH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id b2so6831260plx.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hOosUmVBZxbFO0laKqnxwyWxFa/DTCPE2w2tlClJDhM=;
        b=OeNzPhuHzZtqI7al7oR7N4mzGfpL9aaPGlSC63L4jXMJQDVpcvjmWc734sMUhgOTNv
         y5OJSaApF8BUmlEBWh3hqNXQh5wwDrxmIYJZ3Wqp4chJRJ72XqoWu/u5/iL2PmT8Jps1
         RAriEuU7jhkAIfzYUAqd+Gjl79BkiUxgFIsYQvgj6hzPxfGoeycv19dp9vFGHClAR7oo
         89JgNCX6EbKVFYgV1X7aB3QJmA2PseqwAEYPbsGkDfy2We3adLUAN+GDIZ5+uZoqhOlt
         w09uzdrOFI7ijff0DYPK+Vv//7CCdF6em9GTtGxQBWETt854bSFY/AHQA//aCTOc1vxa
         5Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hOosUmVBZxbFO0laKqnxwyWxFa/DTCPE2w2tlClJDhM=;
        b=i1ucuX84aJo4noxwpPi2D+EiSMARX8Qxdpvp80Yr9cADwBGa6/cs6mrpl6uWLzQxAH
         qpQ3eF9acj/fWA9JTHg6a4RfNn5oPITu7IUZG+4Vnn5ZaCKGR5keV7SQQ/9OMLD7eltb
         JNhfXftVv+vtQGFTDsrjSVyeYtUqVOeQyFaTsrkFvmWD6jOYSBUNACarsjSIYbEp8JMv
         7attzjr4k34/w+EaaIxTrGIu8+yqEX386QpRORCa0p2MGx4YXWJkc1femsrj/Hz09Jv3
         vvPWivUp8lq6aO5vgJbwiKBQ/rP6prdtMeVveIjQA+kZJ+9GVggucNN/tbAy2rTJBVIz
         jzwA==
X-Gm-Message-State: AJIora8UVwOjSt2cd58naDjGWs0juEkhzFx1XrrQ+a+N2jwzQMoKkCNp
	lrykZtVOicKMew0zzbcqICPq49YXBW2lUePS
X-Google-Smtp-Source: 
 AGRyM1t+XqN4+iJ2gqS9NolwxNsySXStsyVj8CwUou8P8I2ZGLwWeUBg+LEq3tY9okcp8QhRRXJF/w==
X-Received: by 2002:a17:90b:1e42:b0:1ec:f362:8488 with SMTP id
 pi2-20020a17090b1e4200b001ecf3628488mr30950556pjb.32.1656877011656;
        Sun, 03 Jul 2022 12:36:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/30] wireless-regdb: upgrade 2022.04.08 ->
 2022.06.06
Date: Sun,  3 Jul 2022 09:35:43 -1000
Message-Id: 
 <681df7c4a761cc92234baf08fbd3d82f83b4bf10.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167568

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c27711292f93dfad1ffdeab6d715becad32a4ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
index cd42039680..2eba4f873b 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
+SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
 
 inherit bin_package allarch
 
-- 
2.25.1


