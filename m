Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849EFC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:48 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.49.1659106058332052554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aoNgrxEw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id l193so3795121pge.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m2a0IRBc3oWIOQ7qxRXAqJ2oQ91eNLJGa70Il3v2bo0=;
        b=aoNgrxEws+qg6SZIXJ8ndX07cW0jlutQX0W3P53IT4yffbjg7CJNIOew1aA5vknUVz
         rk/ksvYXCGi3bHD7GCoP8pnnFEeEMuyVJvfpkaegI+8KDfpJw4wKFBEzxmgTVabUjwf1
         8WUalUAW244Fb+1Xoi63Tll2ZbtarvmrAlGLQFAOLH6g69gbsBfo9/R7yN6n8j1Jbwty
         Jrp8R/WtHndQHcJzouaGSDGbuSiSuC+wHNeCi6Wi4sVqQBKpMw8+yYSljnMAjaohC7ks
         3G2D7ggtm7oWqP4vg/VSALH8UVVYiGmTawPup+gMZSjxGmxDUVK0gBfTH7fCN+qBdIPH
         oU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m2a0IRBc3oWIOQ7qxRXAqJ2oQ91eNLJGa70Il3v2bo0=;
        b=acBLT938vDThRkh4tQ8RBtWkQES0vSOag44EwAYyyjtqICNeOk1SyLXMxrNfm6JZOk
         EopLdeB4XFNJWZ+/WOJWKBK79zPl32RzN8dKmVXGqJio9n+p3oOmSxt0hWRZ6ljf+3HP
         5LyX9C8NsWAEvYh5aUtqfvllX2bm3xJMLEcmhJ5PkAJjiVY9njFnDNi9QZiN7Ibt9XKo
         e+LcPADM/k0GLv2sNVTc7dYGx0V8RqMbgiGHatWWyOh7L1y8G1penp1jw95Z2iQHzYic
         uAwFDGeCNYT14S5rycD0ekMv3LUpflFn78SljvIHkih2rZX/3PFaqLvJ5IxrhmKhECaS
         fJcg==
X-Gm-Message-State: ACgBeo0DLhzmzTRVCByWnfWhh44p6rqlhp10cVKoH89faca1k5+AZz8v
	nXudZlmweXNBy1380IRaxIRNQleoXI+De2QZ
X-Google-Smtp-Source: 
 AA6agR4IrDc5xqZS73AJIp1nbLZv6Cux8I8xd0WRLMOayTve966l96aGl4BQPbmz+DY/qvOE2kSm/Q==
X-Received: by 2002:aa7:810a:0:b0:52c:e906:e355 with SMTP id
 b10-20020aa7810a000000b0052ce906e355mr776836pfi.16.1659106057304;
        Fri, 29 Jul 2022 07:47:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/29] xev: update 1.2.4 -> 1.2.5
Date: Fri, 29 Jul 2022 04:46:22 -1000
Message-Id: 
 <2f9ab1a77a170fe7d1d493470a448e42b1750c19.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168641

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

      gitlab CI: add a basic build test
      Build xz tarballs instead of bzip2
      man page: remove out-of-date reference to X(7)
      xev: fix KeymapNotify event printing

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83c9b5aead195d933a43a4782428fdfa3eb51967)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.4.bb b/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xev_1.2.4.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.5.bb
index 9407fa65f1..0e3def6eee 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
@@ -14,4 +14,6 @@ DEPENDS += "libxrandr xorgproto"
 
 SRC_URI += "file://diet-x11.patch"
 
-SRC_URI[sha256sum] = "d700e08bfe751ed2dbf802baa204b056d0e49348b6eb3c6f9cb035d8ae4885e2"
+SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
+
+SRC_URI_EXT = "xz"
-- 
2.25.1


