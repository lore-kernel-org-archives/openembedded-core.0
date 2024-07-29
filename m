Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2013C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.55674.1722258817669041841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vDwv7jQj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7a2123e9ad5so1938079a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258817; x=1722863617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sfka7jcnveQyP7J0llF7Gg+UbDGTk72GmseDGdv0EaI=;
        b=vDwv7jQj3bAVMwUNovgwTBK0lnmm3ZDYyRDKJtAAB73e5TnVP/EFfEprI/GI7n2VOv
         1v4zOxrPzpg0i8zQVfr037B/+lw3S7DPW/O4IZAVsGAH1pMRM0M/WGOE/xrU56G60gcT
         eJFeoJLvHXe5Kgh6j5b6Ibk7JMQP1h4SFBrXJW0/z9KmEjvqOzSMWn88CCjpxf+Bz7P3
         8sNGVKClDcVrQcXBh8U4vRUFPzMw8iBzmDia4cg/Jd+uVVScsQeJNo+7remYphC+ROUe
         NYG8TzK1KirsV6uJNtPoQ2Xnw5MaZ/BCQ/yOHg1Bxtq9bEuSNe2zD7E/ZbDhR8UW+QuL
         C/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258817; x=1722863617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sfka7jcnveQyP7J0llF7Gg+UbDGTk72GmseDGdv0EaI=;
        b=kKdryZKxjJI2dgtScve5v23p8oe3qFV0A+bbwosh195//sq6GJj9VofXd7pGJv6tmN
         nWsFApE6dG5hM9jcbCos6PO4EoUbLSBBR8FCBJHpKG+ksw8YYgDRlLmPM8UFDG2speHl
         CWlNSKzxbUXK00+Pv3vPcSTLmfizzylORpP81G/vJRew/tnho2i6RBTjsu1W4/D6RBk1
         PjoE17qvPhTiM6tw2FL9ETRU0KdW8SSGhjz6n2D6TxDN8ImTkApgU/wB8ldUQXRP7mmC
         xljihCLTaha3Gcqp8doa7u39wXaRWBEtHvhhT1Kvk5CV6CIrJw0W7DRfe/Nc7GVw/khp
         hryg==
X-Gm-Message-State: AOJu0YwsxQb928n6aiBY3GOTJb3BApQkS1SxWamfNJRbw7m0JpgXJR2A
	os006D2+kUOpxtahZbtJUpB5DIFpDh3SePx1bXCQk14JdEwqCQW6hbpi2/K5leAbt+B3wupuF6S
	JEMNQMg==
X-Google-Smtp-Source: AGHT+IGbmdSg2EKOwCCsP8jEcSCbWF33uwfv4nzq7cCkma41cW76BL+P/hOVgFmYZZtBOOqrh8NABg==
X-Received: by 2002:a17:90a:7c4c:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2cf7ce854a1mr12490454a91.3.1722258816849;
        Mon, 29 Jul 2024 06:13:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/37] automake: mark new_rt_path_for_test-driver.patch as Inappropriate
Date: Mon, 29 Jul 2024 06:12:39 -0700
Message-Id: <c7a8632469913638070878022bffac5588201006.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202643

From: Alexander Kanavin <alex@linutronix.de>

The patch is specific to how oe-core runs autotools-generated tests:
by cherry-picking needed bits from builddir and srcdir, then hacking
Makefile with sed until it runs.

As GNU is not interested in installable tests, they wouldn't be
interested in this patch either; and if they become interested,
it's probably going to be done in a whole different way.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd13c29bee330d381e1e574351348e526500e396)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../automake/automake/new_rt_path_for_test-driver.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
index 1f71722334..f92ec6b548 100644
--- a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
+++ b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Set relative to top_builddir path in Makefile to access
  test-driver
 
 Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [specific to oe-core target ptest installation]
 Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=19042
 
 ---
-- 
2.34.1


