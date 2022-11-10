Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71EBC43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.10.1668103984304330355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hqdXG0Mj;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id w14so3437018wru.8
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DmTaw2D+OADAErlzb9lWHgrmkKO6OiNr74yJ/QrnqM=;
        b=hqdXG0Mjm6zISLc6gsA64aQKOVh2wozQZ3V4VVeajTgEKaC2NqUPOR1yViN4bKgMx2
         vM/WY7ISYAQAyl58kJVRupnmpDe9DrgnEfgK2FanG7Gy28tGwQyRFRfMtQRzturmr7hS
         O+WnnR60zSHTWVQHLPE7/k15dRT2tsmxBz66MVNYJsSbQtvfEcWcU0QiTYsgDvUbfBBV
         85PY3pQMgJTa5HRijc9LYhGIAxVwBLTkH9brwoZK5iJV4lXdkBDnY9xF0S4WuuASNrca
         ZTdO1qtnTEgPm+7UfYLJPKpM7EWn7HCTPZxXcohKGeFJmpncLTDXDGcObOutRx1JrZtJ
         +7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DmTaw2D+OADAErlzb9lWHgrmkKO6OiNr74yJ/QrnqM=;
        b=IiHgbzKbjTE/HUwLjoTskbRW5sKmpn1E4Pybq6C+sF3G7U/dXoVtxBIYheRxZM+DAc
         /ja6i8dv0gSqOgCUPi+UXxD/h6lG2oEhaxmhWA8iG8fkMIyXG0Ksey6GueK+IhA4fknA
         gKPFjzXRcXSc03H9nQxQCiejpzS22M24boRAMAhW7e1C2CWChS5K7uzQNg4tBmEt4Ef6
         skJSRO5tMcspbtzEmodfqMA+cnAX9eyMJeWyr9befRqN8FfttKShbZuPsnBm8lQghFu6
         wCNezeOYXZ0wacEhTCyQELcw43c2GjRqaNswOCIPUZuOkrMeXJsBWLkW0xeNQN/2VJio
         J6tw==
X-Gm-Message-State: ACrzQf1v7ySDSTV0W92LX4nnzcjAj3yu/rxXTRnhIGLOqvDgKIg8xTZ4
	2P6Xd0B0M0sRbsc3MrpP6XVGGVBCmDY=
X-Google-Smtp-Source: AMsMyM7TVVsZLigbEQ7RBwPurl5vg5q9Dd7XOoz/LZjDmWHkB2YaiEgX2iTEDM1pBFIv83TgBWLwSg==
X-Received: by 2002:a05:6000:118c:b0:236:bc26:7e0d with SMTP id g12-20020a056000118c00b00236bc267e0dmr39659460wrx.662.1668103982799;
        Thu, 10 Nov 2022 10:13:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/19] libxkbfile: update 1.1.0 -> 1.1.1
Date: Thu, 10 Nov 2022 19:12:34 +0100
Message-Id: <20221110181249.1240200-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173087

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxkbfile_1.1.0.bb => libxkbfile_1.1.1.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.1.0.bb => libxkbfile_1.1.1.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb
index 0fd0e3f47f..17ff588fdb 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb
@@ -13,6 +13,5 @@ DEPENDS += "virtual/libx11 xorgproto"
 PE = "1"
 
 BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "dd7e1e946def674e78c0efbc5c7d5b3b"
-SRC_URI[sha256sum] = "758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "8623dc26e7aac3c5ad8a25e57b566f4324f5619e5db38457f0804ee4ed953443"
-- 
2.30.2


