Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A84CCA481
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:37:09 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.4024.1657773423515922757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vcfs62lQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id h132so481569pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M+IJ/81zX76zH1W7tTq8BwF5R5cDH5c0+IXTTQSP814=;
        b=vcfs62lQuQehXxtWciX0YhjVAiJtin1e485ufmeXhtSRmwd+rCNeWBZnHgR2iGG0Va
         58kz+2QafMipCZuS/qV0MhVEz9vdYdRM+qOqG7qfmuXwZf1XHnO+g46n52NGsAWY87S5
         JCyBN/PJbvENcunGmRY/c3Xz4khefLzM4slsEHJlysUv11ppFcCcGO7vnRpELzAnuHpH
         lhLt0yap2ke6aHWlZ3wRdZsbMWaHd4p2u5/WTrNtTOwYmbHTGRcQPIMY8oH92jJrGUKG
         rGwxauaTfi3X1wp7HOL4VRaGr4Unuo7LxCKIheLRTe8w24F6o7P/4OkQltrcULIXZoQn
         3FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+IJ/81zX76zH1W7tTq8BwF5R5cDH5c0+IXTTQSP814=;
        b=rKOj3MDfbIkZrXtwhc8I66UXFlo52K8ynDFyjWUHf7+2tU+kW9NhqTHKiEiLqXwwcn
         B3eEnwcXoK0b3WRljbgrQ4pVoDjX1QHtzB8yswtrawPdQsUmfp85wMkNRbjzmjxiFNJB
         qh6ITcJPq5oU2gyJLrG2gd6B4bl8SHd6/NIonXIuw+ou00gF5cAsxOpea6MBXuVEy/dz
         lwtQR25DY+ehmsEnpG/dzJVjvKJPuUYbO6ERTxCUV8gyzaBg4dfUdRbTaThW69SGMr3a
         utaFX8xr455PGfyzTKFCEKSA1IACxvyGfZTJ4AbPDRc2ZIzwIOtoc59ITGiL/0YRaOyA
         V1/A==
X-Gm-Message-State: AJIora9o2/cHfrEdoeJ2s6OUfbjqaW7nUDAg7L6fyLySSCivrc8HEQJv
	ny1eOFzefq4g68HLIvSJ7+cW3CPDBAoY6jMx
X-Google-Smtp-Source: 
 AGRyM1vSL3S36FEd/n/MF6dFmSBTstE0w9GKFVgo3ORAz4bx/GbYSAFlgRkWOmI16grKU7KjFd5wqQ==
X-Received: by 2002:a65:4d45:0:b0:411:83dc:9625 with SMTP id
 j5-20020a654d45000000b0041183dc9625mr5921498pgt.359.1657773422448;
        Wed, 13 Jul 2022 21:37:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:37:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/27] gstreamer1.0-rtsp-server: upgrade 1.20.2
 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:42 -1000
Message-Id: 
 <4f00cdf81529ddbc3b9f440a9f384358811db283.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168019

From: wangmy <wangmy@fujitsu.com>

No changes from version 1.20.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71baf93a42ce719b143c863beae07200a1f82361)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rtsp-server_1.20.2.bb => gstreamer1.0-rtsp-server_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.2.bb => gstreamer1.0-rtsp-server_1.20.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
index fd6e16c2bf..fd4f82fcc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6a8e9d136bbee4fc03858a0680dd5cbf91e2e989c43da115858eb21fb1adbcab"
+SRC_URI[sha256sum] = "ee402718be9b127f0e5e66ca4c1b4f42e4926ec93ba307b7ccca5dc6cc9794ca"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.25.1


