Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9821C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:27 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.22293.1655667323529440942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T4ETvA2L;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id d129so8442821pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hvbEm0R6oebZxUKXmJws1hmfoAurif3zuW99DhK8YMM=;
        b=T4ETvA2LYC0L1Kj+up/RFZ+GiYyThFLKbtZddJKt4rF9i8nc4ZH1lK7U/Hx1NB247h
         RXjUPikdGcNYFausbm+wl069JOC5nxloLBaM3ybHOYmv8Yv/AbDDI2VD0cIiTIm/V0YR
         flMAz3XeRQBsn0Z4QkFO4tqiDuuAnmQTn1wSL6h3asnnaNZHEiePoSzwInczw1njrK4j
         2+pALazXxnLBLwio2PzDML9xhx71KfH53CihRDnH+9M6Y6Ijjo2bEJGp9C9vpqI0sNYQ
         Px26Mi5GYChaz8lOkOVjnpn1l72pVsGfbZKjYGspq0E6K0eLkFB6iU2H4WxA3iqURggN
         YXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvbEm0R6oebZxUKXmJws1hmfoAurif3zuW99DhK8YMM=;
        b=XXd69ay291lRkkd1lP/hIEGxChMdZTQvJMuUR6562djZezI4ImI7Cl3mZFk+SmP4jh
         tdbuQmHoWL7CvriRADlZFOG4E4cvJhnUCYUAjropGZTTyy5LSjMX2rpr3FPAJR+wUkVC
         Rj8T6di20KdmIFCtQNCvsxlMbGHho2t32LLYzy7aaG7gGg5+a3Og3dyLhD6d/WrSvllB
         3y0r5w7fpUq8Q/Nk1l6kBSh2ijZvG4pVfbS0P+kWk3eoeDq2bWmc/1cjjSNBUJNs+4hf
         hkXwMfX0DArm4Qu+minnRYnM6j7xxwrYscKWm6WGYwnstYgyjEMeNmLCrlKEQnTMoh3j
         19Fg==
X-Gm-Message-State: AJIora+jaOEsVwyMZrYUzl4VF9L6qE/5S4qa8duKyZS2IUdg9LdCltBk
	fR50YRX8sqeM4ZL26Re6wwKlhvzFNpoV4xMv
X-Google-Smtp-Source: 
 AGRyM1uAX8m5syjCsbQU5t8atlfPEGefBsSIO4EH6rwtFRTLiHrK0A7rX0eAD8vKC2mQTJPZaf+uYQ==
X-Received: by 2002:a63:145e:0:b0:405:70e2:1d04 with SMTP id
 30-20020a63145e000000b0040570e21d04mr18427984pgu.487.1655667322452;
        Sun, 19 Jun 2022 12:35:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] vim: Upgrade 8.2.5034 -> 8.2.5083
Date: Sun, 19 Jun 2022 09:34:57 -1000
Message-Id: 
 <2bba60d687fb45a8367cb683a8e9d385384ad51a.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167065

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2022-1927, CVE-2022-1942.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e740b5c2227c0040621ae63436d06db4873670f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9d918379b4..31a1b57be8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5034"
-SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
+PV .= ".5083"
+SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


