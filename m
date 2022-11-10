Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47AEC3A59E
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.5.1668103987485677856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TGGelZWt;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bs21so3458800wrb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8b6zG5ZPe1fRr/959nu0lwLVrg/vaH22olhiPK28RE=;
        b=TGGelZWt/2de+Ut2eVSHFlhCC6znKB8SyuQIwjO7Nt4caH04Nyh2+7iQsA2om8HhSZ
         wWmEpb/nC19FKgYEdicdpjJrslLMTWlB2p+kLF6KAydxXIa/WsXQwyuAYOfQ1pDbGhYV
         sb9C2ikTT1hdb/b6sjuhxFiQdloC6K2gl4q1KdF8kmBS4dcIWzxQqxVknKjkvRXchRVk
         hNacB/+dCKiALl7+iz1Z/MKlmM74XDjoBtDPkVPOwDZEizzQFBLSB7hUvsrDRopfw/l8
         PhdBEc9G5fTss2cyEif9PJ+FlPUpXx5b5pZyVr8V7B1ObSnrivklCntsJd0yiSXGJsN/
         ZgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8b6zG5ZPe1fRr/959nu0lwLVrg/vaH22olhiPK28RE=;
        b=R1+kp6yFw9QNf10q2FR3ppaYdVewfSKpVX9eq46byQNOdEeZxR1TWVJK4VV3gEMEtx
         3d2CWJfSdEGigW7woCR48QFd4lu/eoIc6Aog8Gs9GfCOqO9tNOeFDv36u++MLcK3Fk5Q
         yDlKwE3HDR5vZCjRiIqR9TtfT/jGtvn9X7ka+XyJACJkAR4Z/eNP7dL54GfRM1dtwCBI
         +JyY/0ukx+IU4XP7L7uSiCg/FMgCIav+EYcH/U8V7eu/WbGO5Ha2BqTZo+5+cyrqTvWW
         Bpl9XYcvxuVYUACAU17acIOZoEim0Vi9RPhe10WcZNYdomGz7jmYyR+h8atAcikAZJfi
         8Tig==
X-Gm-Message-State: ACrzQf1NaNKYzQNpAtiUWiFYUU+miALlejG16g6pK6sqeGLUR+KyOetP
	zyxfampziHXvDn9IF5HhmyRnAuBfP0Q=
X-Google-Smtp-Source: AMsMyM4DW3+9XpSigGhMqiaQq9votEYXpWx6y1Z/X41oXI3uNWmiJUURIH/awfm8PJ2ryd4exG6Prw==
X-Received: by 2002:adf:e805:0:b0:236:5635:9520 with SMTP id o5-20020adfe805000000b0023656359520mr40734278wrm.154.1668103985928;
        Thu, 10 Nov 2022 10:13:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/19] libxxf86vm: update 1.1.4 -> 1.1.5
Date: Thu, 10 Nov 2022 19:12:39 +0100
Message-Id: <20221110181249.1240200-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173092

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxxf86vm_1.1.4.bb => libxxf86vm_1.1.5.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.4.bb => libxxf86vm_1.1.5.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
index 1612a50f19..a586159ee3 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
@@ -15,8 +15,7 @@ DEPENDS += "libxext xorgproto"
 PE = "1"
 
 XORG_PN = "libXxf86vm"
-
-SRC_URI[md5sum] = "298b8fff82df17304dfdb5fe4066fe3a"
-SRC_URI[sha256sum] = "afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "247fef48b3e0e7e67129e41f1e789e8d006ba47dba1c0cdce684b9b703f888e7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


