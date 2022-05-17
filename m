Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53685C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1084.1652811903082513119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BRC9jBzO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id q18so18059498pln.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D7jw/kS+S5h0soGo21GJeFTldqx+Cp/PpgHHahWSLlQ=;
        b=BRC9jBzOWfGF+Bs4/Qdurwoz4pzFXe6AmGFDZw2nqWQtDGnaZgeZ4O+i6ksIzH+JvW
         4mbPKOZ0YFWdQ81JTREaNe704LL/wiNbRLKmgApxFvlOEmdyxIEr+d2xvJ/ym8BBmi0G
         GsESR+fEysdgkpD6TsmVlS1gb/BerAprH9leKN7ywsBlgoAtM4cuNBJREfVmGI9iRUD9
         6Mv6Ly+9XAtohGttlItxHcTC5s7324iNwqnMYETBH0SvILd82ib4AbM9Jf3zLR8hVp+5
         RGxPsmjT5MRAera9sDLDWpetRyDDUjhL7dI7kDqSpq2h17yWl2F0YNzsKqmZfd4y7ldx
         cjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D7jw/kS+S5h0soGo21GJeFTldqx+Cp/PpgHHahWSLlQ=;
        b=EKxQPpb1ZSc9xyKUCclx2VSPaGW2Eh1FLLKtbKgBqO6ejlwTtwFOdacYVLeGwpFQdP
         uG0C6VfmixWayqb5s3tdESmjYSpc0s+hrR/JfLDIQaNyywdiNC2LaE4EM90+b8jSbcFo
         gJXrjtZqLntaQhtkIAyOsDiGsWWX3xk42Rs+2DyBbLqEqkmkx0kTM29fYk5m1+iBvbPl
         fYwPOK+vG4I/JBslqikdu0+vE70IgojyCgfPU8YAzXzj/QngCFChVvNdVLCBsUdcafwl
         bxRMPGypyxF2dd+SPlThgGllL5t3ufdCzkhprDs+k+Zl44y9bch+H4BqAW5MHlUCwEA7
         ysbA==
X-Gm-Message-State: AOAM531O5iEHnQZYwiYtr8BFbs5vGEwgRC3tAJMFSC7LhcTcmKLRJkla
	Ga+F5LMXiEIXNro4vKvzJoHEqzFfOljQp/C/
X-Google-Smtp-Source: 
 ABdhPJzF7nfT1nHVZcQVxPeuMHTqTOfPO75J7eeBS+y8n2iBgoYt8UvQfJPzlGP/nHILnYTpT/mqEQ==
X-Received: by 2002:a17:90b:24f:b0:1df:264c:e828 with SMTP id
 fz15-20020a17090b024f00b001df264ce828mr17367206pjb.174.1652811901873;
        Tue, 17 May 2022 11:25:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/31] epiphany: upgrade 42.0 -> 42.2
Date: Tue, 17 May 2022 08:23:57 -1000
Message-Id: 
 <75ade4ee2c1e417f295dde687d8f9c4da9a29eea.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165756

From: Alexander Kanavin <alex.kanavin@gmail.com>

42.2 - April 21, 2022
=====================

 * Fix Save As context menu items (#1760)
 * Fix CVE-2022-29536 (#1766)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91b53781ee883f5f40d989e398064c294030fa53)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../epiphany/{epiphany_42.0.bb => epiphany_42.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.0.bb => epiphany_42.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.0.bb b/meta/recipes-gnome/epiphany/epiphany_42.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.2.bb
index 1cf731c7d6..dc1b34ac92 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.2.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3"
+SRC_URI[archive.sha256sum] = "92c02cf886d10d2ccff5de658e1a420eab31d20bb50e746d430e9535b485192d"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.25.1


