Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web08.10539.1628177795074616453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BnmJzeyg;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id y18so7896983oiv.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IX/uUoBFSVPi9cnvHC30fsevdnpT8a56amW3McsbDHw=;
        b=BnmJzeygklAQWSxmOArZ2evXaYTWXgaHyHpRhkL3Yf51baVx038Ef1pkxi/oHk2WOI
         wSUr90yl9qc+K+8sOEGFcHlXwe3gbQpA6SxyG0gGFaP2uDvGatdJke7Cvb0TcrkXXRDU
         dqrQSSM/FrrA/FUzGVvDpO8JDcxVHt03tLWnTD9ATvvn0qzp3m4DmXrmOPxanTEZ72fe
         wJlqrtgq4X4UPkX0TYmL1JwvhjupXmwzvZ7lgndu2saSjUDCNee05x9QQhtfbyARAR8l
         AhZW1IduzhM4FiMaQU9Vw3xFJBV/xW17EGZ9fhnymA7cePuxT7JZ8M1miCNhPv5vkDvX
         uqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IX/uUoBFSVPi9cnvHC30fsevdnpT8a56amW3McsbDHw=;
        b=Bge/b+N1tzPubo4d7PTQ14lKADzCLORJ2TKcrbxD6KjTkmGuH6ac6ovp/NPCvy8zcS
         pVPpwrjEuHRnvKJAm1iCLFH48dJHr5n1nLZyoWccUTNgGAtAdJ9/fBfn/n58B3g7uNnl
         QcXPPlxlkYvGDiKVRuUZfekPoY2YxZyH8V3TLNq2tEhBd0DHTLYVkPatJDMIcx8NYdE5
         KOs5VkOvduThL/hcrnPZc6NXD0Z3pyOeZM5BKo8wjCiR+PVirgB/xUlVdm7+46d7gxtE
         2aCjyE5Ks6j3Z4DLDmZ5StAsQvNOPKOGZaSemFB/JyILr0aimpDGGtkvAccRxBWBaT26
         vqZQ==
X-Gm-Message-State: AOAM530XP8e2//+malUm87sh8W2XVxzn6UNgrr+zrc/uJkuPfVFzPSTf
	UHh8ppcCf3LBStfdBkU0n7H7Jy2YobbseZ1M
X-Google-Smtp-Source: ABdhPJxsGQo2W/tteck5jSFOP4Pv7wEoOhoBPV1RynXmnjDkmXXnqGuubRU56V0pMTGf4b3JQyX0PA==
X-Received: by 2002:a05:6808:2219:: with SMTP id bd25mr4055864oib.33.1628177794048;
        Thu, 05 Aug 2021 08:36:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/33] oe-setup-builddir: update YP docs and OE URLs
Date: Thu,  5 Aug 2021 05:33:53 -1000
Message-Id: <a73c10667b3ef2d0606dc5b2e4ff9605e2cd52f6.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This updates the link to the YP docs
and proposes to access the OE website through https

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87686233aeffc639c3f412fd5c4898b32b15013b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-setup-builddir | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 30eaa8efbe..5a51fa793f 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -113,10 +113,10 @@ if [ ! -z "$SHOWYPDOC" ]; then
     cat <<EOM
 The Yocto Project has extensive documentation about OE including a reference
 manual which can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org
 
 For more information about OpenEmbedded see their website:
-    http://www.openembedded.org/
+    https://www.openembedded.org/
 
 EOM
 #    unset SHOWYPDOC
-- 
2.25.1

