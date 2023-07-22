Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E2AC41513
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.11711.1690052235634931315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VAXoiIjL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666eb03457cso1755492b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052235; x=1690657035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtRsR5qrGc9NFbHuViNW8a/+oCiam+Iic4zYfIElTQc=;
        b=VAXoiIjLQ9zsEGcxKwZfebXUE0cxQO81E8NZcJkIEsjE9OAmFRofzleO7sfd3HNTJU
         SJJH+uJskYkIii5q0nwofQIJ9pJTiJOgEqyEizziAfw4choxpDLkhkhuR4WQTNJBDOCe
         iAQDqRooVPOyB6aoTjrd0+WzubOV9iBioRmxop0mcZX7UJ815z/7bo51fTvpk3hHP217
         q4ajNelF6lHqkUq+ceOh+227/9bH65gn0lC+6OjkXzekKTRxU7LQWbzzN3ykMzeRMEdH
         WzRQ/RE0iFBjkr19LMZe7NZ13Zj1aSvF1OyxTOnH6//SEEIQYIp9v4zXKgtRJAm2US9g
         8CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052235; x=1690657035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtRsR5qrGc9NFbHuViNW8a/+oCiam+Iic4zYfIElTQc=;
        b=Fe3MkJqLuWr7S3JYamU2N1m85o4PMPGDNAkpmlA4Tp6wCkYejxvRlsYS/d4YTVupej
         dajxtNOhcWB7O9D562eXEdq3K1kbdDyjql3fL3uQG0TL7mlqgkM9I4j238Q/R4QR/baL
         ZfVEbqa2SANOp1h+1HUYLxURoYjo8XCoXSINOpwYI+ybI4d+NDU+StEfWjnZN1Yz9iac
         ZIn++3Rtj7F3iUdqvwiku5CC+pOq7kUy2EYSXqjRAWw+ooqQOYQuOBsJhr+AkT2v7cuL
         B0WxiBDWGfT044MlaRwFZrjoD94GX6pyaQ/y0+mXrMHun/2pkFP5YfWwXNmPp+7r5wdB
         PdAw==
X-Gm-Message-State: ABy/qLa0H9/Ef+PbX3J8QhOe9XFf74wzQ09AJbMyC3nziTQsnNXdM1Co
	K5dRcgRnvD77cNlBxdICwG2XvuKcfh6qK52gYoc=
X-Google-Smtp-Source: APBJJlHsA4rknmdjEPYnMadEinpwv7aLucyiNyUuh+X5fpRW2SVWbX0qnwIzCCxOLIHDJy+oB39tWA==
X-Received: by 2002:a05:6a20:8f2a:b0:133:fd64:8d48 with SMTP id b42-20020a056a208f2a00b00133fd648d48mr4842864pzk.4.1690052234761;
        Sat, 22 Jul 2023 11:57:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/11] vim: upgrade 9.0.1527 -> 9.0.1592
Date: Sat, 22 Jul 2023 08:56:50 -1000
Message-Id: <5893c605060983db08a4b2d19b1dbfef23f9910d.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184729

From: Trevor Gamblin <tgamblin@baylibre.com>

Fixes:

https://nvd.nist.gov/vuln/detail/CVE-2023-2609
d1ae836 patch 9.0.1531: crash when register contents ends up being invalid
https://nvd.nist.gov/vuln/detail/CVE-2023-2610
ab9a2d8 patch 9.0.1532: crash when expanding "~" in substitute causes very long text

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e1d2563316..33ae0d8079 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1527"
-SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
+PV .= ".1592"
+SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


