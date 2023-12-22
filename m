Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1534BC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:46:45 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.20970.1703241996910766038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 02:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZC8MgLx;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cc63b3ed71so22753731fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 02:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703241995; x=1703846795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8yf+Agc2zTTJktrWGQabyjl+OJmQttvMuQK+ZphbF4=;
        b=iZC8MgLxYPSamtenU4BIO59U8XdtN7ZRVYVbOBxATdupVb40sTktd0oAgjyu6Rua0t
         zhbmpCVTXzOZSFj5uk4sh8ONjOuyIG8N1XaW8l95CrqpCI/94wQ2NdxiEDb+as2cbIee
         HOmL1x1SAKkk4AspaCvY47CloZkFc/75lol9wrIlIw0zx2hbXlobQjZZ+C+vfA9BtvQt
         d7RVJ6th+JLqbU2rSvmY/U65/c3v9Z2iP++awOl0p+Fe/HtcDZPfFRcuq2v2VowjX68W
         FBreTjpxU3aRxzq7QLoP8DJrTqFJ5/njxWI6aSnBdPdHYq71eYrAM/Zdgye6WglSym+B
         llxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703241995; x=1703846795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8yf+Agc2zTTJktrWGQabyjl+OJmQttvMuQK+ZphbF4=;
        b=g1lRKVBpoenfsKUDgJQkyVSMQOzqvh/u17KoXiH4aURmYYs6aRFvXtmVQJngJvf1/+
         j5cFAFMadirGITTG6n7/NOwtr5mVzAfSRQIbSl21VZyxmuuPFYo2EdyyAKExPyl7Y46j
         8kz80trLw7FUYz6y5Z88fkvSNa09/Wejn6ObP2jYe/3UJ+VTLG+8VAWcMDZMhyjAUv1W
         N40ZgCQ7yfTGxNxHWHsNa567v+eqnxacd2VTBStt3QUbxWoMhNeoEleI4DJh0mVS6l+p
         3O6iqOXx0R8H1XZw4ac7mg4bUbBEhJpa7DxMnlpk7jqYJ10OtTRtGKT0IJwybPW/45zD
         bhfw==
X-Gm-Message-State: AOJu0YyV8bn6r+aAAAld9kwyUvt2rzYB/Zc/w4nYC3mB8fkmshNAZE9f
	H8DcMc/pSCg+pkFm9eK8ZtNkvUWkg37vBA==
X-Google-Smtp-Source: AGHT+IE0kzqg4WEvzkq0GKqjOkYQpdoMxBwIjny768KyhGeeLEVTNIOM3T9bcU8BFRz24Q6TUj6+1g==
X-Received: by 2002:a2e:8543:0:b0:2cc:72fc:c903 with SMTP id u3-20020a2e8543000000b002cc72fcc903mr640725ljj.59.1703241994526;
        Fri, 22 Dec 2023 02:46:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402320600b0055410f0d709sm2281571eda.19.2023.12.22.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 02:46:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] libadwaita: update 1.4.0 -> 1.4.2
Date: Fri, 22 Dec 2023 11:46:30 +0100
Message-Id: <20231222104631.3810007-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 10:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192868

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
index cc057568052..edcfba54b63 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "e51a098a54d43568218fc48fcf52e80e36f469b3ce912d8ce9c308a37e9f47c2"
+SRC_URI[archive.sha256sum] = "33fa16754e7370c841767298b3ff5f23003ee1d2515cc2ff255e65ef3d4e8713"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.39.2


