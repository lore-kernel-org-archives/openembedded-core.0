Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919CDC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:07 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.7194.1667530918792572195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iTTpzjgA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e129so3300534pgc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Yn+A3ocZCkSSiNfExAD1/bKvrcPRtn7JeuuGGphWhc=;
        b=iTTpzjgAEEb9foE0LRWcem1xkfYMLUiyG3u4SXHsLCY1GtuO0CsvG63lp5vh61mmwC
         BzUcqeyEBfC3KDiHiSL95OXy3Yv5QfI6Jbo6PGAZmR8O//f5kEdHia2Ds2RaD3JskAjf
         ylSaxf90rug9hAjeTZwYdTYhYHJK3zPe+th7Qi4RJ2SeBFEvde+TWkrM2TfTa4H356xF
         7LvfdzHr/OzVA8i6fkSCCPBuD5J94LlrYUQlxE5IpQRdUyS+5b/UwtJeQGxAIiOzuLL7
         iZE9teOxVWnyNFDTSLuzCEYDHS8InS1hWwhuJL1+2J8WRx3CZVq0PnEHDouPSGSZMKiS
         ZEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yn+A3ocZCkSSiNfExAD1/bKvrcPRtn7JeuuGGphWhc=;
        b=kgL4wUvFMlgbmGhvoXDtOqpQ5sPawjeJCUZ0jlzSKz3CFyyVsXyZfsLQXjZCMsXFlz
         oIubwuaODC2MfdsRevL17xobZ8uyCy7FoB/6DlanZFnfA4DVh6iGxnofOzp3PF8+RehW
         ngNgkfvc5LchcbgyxKtK+6CG+umVUMOqMD9xTIIDHwKUIOJ9mssfW7MBv2wlicPVUEO1
         woRveT9ueRNAOCtOdCTm22moPTOeAOecSzeYen00i21ATQ37TVqZU9U/yD/1AQbsJKYe
         p3q23POxcmVtSdVeoJe0csY/0fUt535YckdZwIUS4jBIqzRst1auj58AqYbuupI/Sv8U
         aHXA==
X-Gm-Message-State: ACrzQf1qgLA58D/35gJPapyX5pVeEckWnQP4mWUR5DyvO4EiH4jGjzZo
	ccLms9nOh6uPzKE2RrqKfWreOISo8E8pF+Mq
X-Google-Smtp-Source: AMsMyM6UmbHdNI+DM2fb7x1+1klrUAgG/oEJW1iXes03CqimTYrOh9Tl4g/G6IPq6z5ibEuRfo1VZQ==
X-Received: by 2002:a65:6bca:0:b0:46f:5de2:30d4 with SMTP id e10-20020a656bca000000b0046f5de230d4mr28976182pgw.323.1667530917955;
        Thu, 03 Nov 2022 20:01:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/31] bluez5: add dbus to RDEPENDS
Date: Thu,  3 Nov 2022 17:00:55 -1000
Message-Id: <93c8639bfe47242760b8b8a760e7cff360dd9001.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172681

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unless we're using systemd, dbus is not pulled into the system
automatically. Bluez5 will not work without dbus so add it to RDEPENDS
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 377ef7009a8638efe688b6b61f67ae399eb1f23d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..f07e318897 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
 DEPENDS = "dbus glib-2.0"
+RDEPENDS:${PN} += "dbus"
 PROVIDES += "bluez-hcidump"
 RPROVIDES:${PN} += "bluez-hcidump"
 
-- 
2.25.1


