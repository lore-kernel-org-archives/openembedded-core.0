Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7633BC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 17:41:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.20013.1676914891684650009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 09:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N58zx4OO;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id iv11-20020a05600c548b00b003dc52fed235so1397907wmb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 09:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bk2P20WzdXURuNzguqD/3kew2+UV1NDsYWsr4kcS0Rc=;
        b=N58zx4OOJc0ZSN+5vmBz/s0C14wCaD8p93gl+dUdx/oNSWm/dBP4HxJGR91ELdrklo
         cP8Q9EW5DiugEnc7rzQ20ZkrCTr47uY4SDkzPJW0OamHvg1YuhUTdTnqO+4hV/Hntcp0
         xZ0Htdgki/IRNaN1AdX8afA5846es01CKgG2mINZg22KCYtMe3uT1dHPKUPxhzSPtAvH
         xhEzY1TQW+VoEEsBtSjP/9Ji9t1q7Zz8ESZTiBIYCYJoZwC4NAhdwdFxwmsNewMVjUrS
         bL8YeSn+Sh6FxJ94N0b3nSfHPDgJezssC7/W96xKyt8VA1gGpMIYy+F1Xi8/5sDrNa21
         LFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bk2P20WzdXURuNzguqD/3kew2+UV1NDsYWsr4kcS0Rc=;
        b=TQcw+PoD5dP23dA6dLel6QhUj9M49N9DvDti5HlfUPab8pakjBXIiO/XpHJ0uTaLvg
         prrn7/Qoeqw+xiJbujHWOxzJzD9jCawKz7BBa3OQBwmu6+S8eTyRKC16XzY+/Xghu9yw
         alcjZYAQL5IQa7mbuJO2ncU1qPwjIg5KRB/9cNZITpmFC5rFvoXhcO7PkqCOVFAMipIq
         L58centgQhDS09Yud39GyNzy3+9VeDy2CKLQckTAOq6WZ2L3b5TxOxXAzd4zQ5sL48oS
         RA7bLQKl8CxUUVFBy7QFOYKlpUTLuxVpqjaiRBLD4vNv8tDj5kXvCGYZ2hdy6aX7P88j
         4Q2g==
X-Gm-Message-State: AO0yUKUBwFMkCaR6ng36b8HYCAnYHfSV+zcu/gCYbNXcPKmCsCN9zyKQ
	SMnJcyLgpVotk/wbQyDWZHwyLjZ2KHcYwWs/
X-Google-Smtp-Source: AK7set/g862kFrsi43+FlYsnM7wUeo1JpKZWpxSAEcqhc8KSalz8WPsxyM9DqpEBlfYDE84faJMxOA==
X-Received: by 2002:a05:600c:3b8d:b0:3df:9858:c039 with SMTP id n13-20020a05600c3b8d00b003df9858c039mr1167747wms.14.1676914890009;
        Mon, 20 Feb 2023 09:41:30 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c441000b003e21638c0edsm1490125wmn.45.2023.02.20.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:41:29 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][kirkstone][PATCH] ti-img-rogue-umlibs: drop unused patch
Date: Mon, 20 Feb 2023 17:41:21 +0000
Message-Id: <20230220174121.2731340-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 17:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177448

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...kefile-handle-firmware-with-usrmerge.patch | 32 -------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
deleted file mode 100644
index 92c1b362..00000000
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <jose.quaresma@foundries.io>
-Date: Tue, 24 Jan 2023 12:39:30 +0000
-Subject: [PATCH] Makefile: handle firmware with usrmerge
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- Makefile | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 48f9b9c..04b4154 100755
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,5 @@
- DESTDIR ?= ${DISCIMAGE}
-+FWDIR ?= lib
- TARGET_PRODUCT ?= j721e_linux
- BUILD ?= release
- WINDOW_SYSTEM ?= nulldrmws
-@@ -13,7 +14,7 @@ all:
- install:
-	mkdir -p ${DESTDIR}/${etcdir}
-	mkdir -p ${DESTDIR}/${usrdir}
--	mkdir -p ${DESTDIR}/${fwdir}
-+	mkdir -p ${DESTDIR}/${FWDIR}
-	cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}
-	cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}
--	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}
-+	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}
---
-2.34.1
-- 
2.34.1


