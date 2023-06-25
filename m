Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3B7C3DA40
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.20353.1687728175579467189
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J0GqFncG;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2120320f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728174; x=1690320174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL/HnOAkbpGDnH1nCHJTEA0C2LTfD40qQdS10fxbK8E=;
        b=J0GqFncG0PfaJT0vi0k4047NpI3psbs+UpKd733XTZfez6ZVPaoniEI1zr166BYbtc
         Y9puD7VgnZpLwozP9kJUfbENJsGexvF/6a39eZsoYMuIU97kWqeHknexaU4nzs+EJ7VS
         wRVvsYt5eTu/n2YfB47OiHZMK2Jy3k0L5wbSIY+n7WK2cAUqmCEzH3ayrM8fwu8OuMwl
         0HslpYqNkQOLJ1B2U1LytgcUkphUlTIZ4OxruNHSr8M4bHhsBjx0OL3wH6bnb+m80kII
         eXFfztiKVWl1VslmhWtvtkVIpNpV2gdt7pFLOSVwkdsLhMehLN8DGy+a9I+bMqC/0r7w
         480w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728174; x=1690320174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL/HnOAkbpGDnH1nCHJTEA0C2LTfD40qQdS10fxbK8E=;
        b=JDOqaLhNHhjuE+5R2ENKcGqeaLQMdzSyzu1xklYwvXhxg8Npw2v/80l+/qPLJ/vO0W
         mFkQgiG3Fcx6avSgpuA81jidPBvH30CYHXXIJUmMiYi7dF3NUsXZ62iQfGfR8khtRtuK
         +HtzdCfQx7DhkLxaf0Rxdk16XJ8AcvcFS/szSpZMymp2JZ9Q7s+LtSzS6mzS8ajJ9OEo
         cedIIniP5IQH22KYXkMhQph1ePVW+XEYLNYXpvJgv6duGYXbxIGoaI1hFcrJ2PgjTqFn
         P70+p1uCFMLo2XgKPreMY+NolZG5mwNs12V8cTNrxhyfYTekNp9rOhHR6P6bPoI4XukU
         VxVw==
X-Gm-Message-State: AC+VfDy04gCZShkZrL5Tl840orKiLDhMDqpPn/WQdIKLSjDu+I9tYPH0
	YgGpSKudSvfq3szRSWBwYq5T8UR3bHsluQ==
X-Google-Smtp-Source: ACHHUZ65prcD3IZhg4cGVZ1zFzv154QnH2iKo4DxodLs0ti+j6mX/3mc63dJ4SYeYPBo7gJcXxoBcA==
X-Received: by 2002:adf:f60c:0:b0:313:edaa:2508 with SMTP id t12-20020adff60c000000b00313edaa2508mr1549284wrp.18.1687728174015;
        Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/21] xtrans: update 1.4.0 -> 1.5.0
Date: Sun, 25 Jun 2023 23:22:38 +0200
Message-Id: <20230625212241.915739-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183393

License-update: removal of 'all rights reserved' sentences.

MIT & MIT was an outcome of mass-cleanup of licenses, so it can
be just MIT.

tar.bz2 has been replaced with .tar.xz which is the default.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{xtrans_1.4.0.bb => xtrans_1.5.0.bb}        | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.4.0.bb => xtrans_1.5.0.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
index cd5aedb59df..781382e5169 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
@@ -9,10 +9,8 @@ except in the X Transport Interface code."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=49347921d4d5268021a999f250edc9ca"
-
-XORG_EXT = "tar.bz2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bc875e1c864f4f62b29f7d8651f627fa"
 
 SRC_URI += "file://multilibfix.patch"
 
@@ -24,5 +22,4 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "ce2fb8100c6647ee81451ebe388b17ad"
-SRC_URI[sha256sum] = "377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773"
+SRC_URI[sha256sum] = "1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd"
-- 
2.30.2


