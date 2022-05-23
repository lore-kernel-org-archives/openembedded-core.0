Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EEFC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.27905.1653314425367897309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=itVYlZSA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso13789808pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pUVBadfkcXIoKWzcqkFKj9SM8mfHlKOLwAOPSwoHxA0=;
        b=itVYlZSAYv4L0vPtJlRsUGIv5II4PxjKJVNI63H9ix8Zb0skN8xyNiQGCeMzJT8tHn
         W5lGSKyAFPo4folXeq2+3SF35vUTtJ43FrJkzg2uSqrp46enH9Me8IyZfJNgrJyHgI/I
         KY4W5/J4S0iFCeGojbivR/vj7poeW/d7qC+hoQEi9qvHwMXQELwkdIvCHsWMoeHdOtAS
         lADVr1NMpodaMh5bYndmJHhb0RcidpNePn4rO0gVHf20iNwQbt4dGpqTA1GYAi310S1D
         M/RGd7hCfZR+o7V3yiQ/9v0q+gSFC4oEiM7NLBVYCrxUDMZIsDa1IMVAzinGVe9R6wfa
         v6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pUVBadfkcXIoKWzcqkFKj9SM8mfHlKOLwAOPSwoHxA0=;
        b=bpfYpMT3kRwG6i6Wy0mjUaXt08l4Us6HYGyYffceZ7H2l53NQjVDN3/2hIZ5BQ5t6c
         scIwrt+2BMJDKqXaixhKluPhokgT/1mc4tG59+d+0oQf7ifuUkkaSN//Du+LyYEPS/Ct
         fkVkNFCEeIoYJKyUpD2901MRasqKIb2FGmpylMGEEhoL9Uuy4XM1drLIIsl9Eb06kRB/
         RNClpbbxB4Yc21Fup3c7ghDLkd/30iaqrJHmnx3IYKs+ZNztv77kve0cz3709Tafe9Yx
         APppm+/gq2SHYeOokfrL/5b0IUmOHLg8ubhZxEEeSjuHDzyhJfinBySUrgJ0yAtto3TI
         Ehzw==
X-Gm-Message-State: AOAM530bBCWDEkbN8XwGuhlaxJZfVynN98F3M4t4ypVZo9SPzA+X+gYb
	UXKLqZ2JKe4XL9KgQxrlV0oH7gH56mTo0CwK
X-Google-Smtp-Source: 
 ABdhPJwkBfUkkv0r2TkKq3NAmzRS/NBu/gwMy9jJP1I2TzN45Iow8oEhalZoJV9EA98L0RI0y9i4Xg==
X-Received: by 2002:a17:902:8608:b0:158:b827:7721 with SMTP id
 f8-20020a170902860800b00158b8277721mr23070173plo.149.1653314423811;
        Mon, 23 May 2022 07:00:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] mmc-utils: upgrade to latest revision
Date: Mon, 23 May 2022 03:59:43 -1000
Message-Id: 
 <a0f25374ea938bcc82396357bd029abc12a6ef0c.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166027

From: Alexander Kanavin <alex.kanavin@gmail.com>

Fixes build error: when using Linux 5.4 kernel:

In function read_extcsd: mmc_cmds.c:72:18: error: MMC_BLOCK_MAJOR
undeclared (first use in this function)

This SRCREV bump includes two commits:

b7e4d5a mmc-utils: Add General command CMD56 read support
0d493fb mmc-utils: Fix build error MMC_BLOCK_MAJOR undeclared

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index addefe9abf..3e611d1306 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4303889c8bd9a2357587eb6ebacecb70098a264d"
+SRCREV = "b7e4d5a6ae9942d26a11de9b05ae7d52c0802802"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.25.1


