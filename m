Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10B8C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11779.1655667065395055413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=q2r9a/Y4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id k7so8001179plg.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+/XZik0pxh+Hbke4zcHiAvA0d2x8SEAe0OXB3jtlwx0=;
        b=q2r9a/Y47PWixMoHqD9XVbmIY1sqxb4DYzqHLOEwsS/SkLmK4tDrHYA247qilh4LS0
         v/5iLjPeSUyMbyu1etZHcAdm6mK3rGGENmipN6K3FOxWe71lP76qombM/dbiCG3FIZLw
         jtGIp1Z9+AzeFm2WC0C5cZ0lss0vXb0RUjeZgVCkp0c5F9PybjY+nL8IuWYDvbXOh7Ee
         kGtek890ctn3byRqNazVxvHe4pjPOlBxIuGv6IvVfP0CrnxDukFnRpba7PSW/pAopKvs
         LOrk4c4IMCQrFjnZhUNZPgIFbKb9WiHNs2yE91i0TEAFHkc7HfRvMxzmtu5Dv49IxPpv
         g8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/XZik0pxh+Hbke4zcHiAvA0d2x8SEAe0OXB3jtlwx0=;
        b=7ruurw/uEdKrm6g49UTEJMV4b5WceAUuIhia0MMIS8n6MG0CvzhygAkkpCY1i5CaMt
         p0i+E9VcSTsOwltbDwlLePpFrZHxXiwCSAOpQeh1VxMb1eEJgkfO6NBfNMc1pPtMVnwr
         E7tXzqw2z4cDxd1l3OkM7mdeLEuHQ1cjGA7GnADifB2srLnHfJF0MyNmLN41bOv3C6GK
         +t7Vl8TLPhArv0TQ/yl37e9oJaZHPkvWdd/c3smn7GUYcguewWkbth6jO9IOhnZHeY0r
         d4NqvJrsFht11lYKEDN6kJklngYL3lh/kFMdplz0uAovrfOuITjn+jo5alTXlsfymRQ+
         1Obw==
X-Gm-Message-State: AJIora/AGjoCwnyJ5zw2XH6fKzBq2jJtfhy7zxvUqBeFGPS0bsgr2zXh
	aNl4WjzMw9OvsJXguGG8XGqD+a2vZooWNmyi
X-Google-Smtp-Source: 
 AGRyM1vQvsRghtwl2gCghcJa6zCFVladfGkhqDTHAkvZE+N23MXBbNi243Ul0TzkwNI67NP4h01YCw==
X-Received: by 2002:a17:90b:3849:b0:1e8:7f47:5dcd with SMTP id
 nl9-20020a17090b384900b001e87f475dcdmr33477009pjb.61.1655667064442;
        Sun, 19 Jun 2022 12:31:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] vim: Upgrade 8.2.5034 -> 8.2.5083
Date: Sun, 19 Jun 2022 09:30:36 -1000
Message-Id: 
 <b85e29de4bca17834b003d499db5129fc5dee75e.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167047

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
index b22e8016ab..06707dbe11 100644
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


