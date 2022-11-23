Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7C1C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 22:23:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.10025.1669242196513032671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 14:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZQGUizW;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so2572085wma.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8ZKmtZf0PwBGxpV7JymqF8sIDddhPfytyQCbmCFVvE=;
        b=mZQGUizW9BIJNJTp5ty8d4i9hMAIyrcx1HLgLDtIboQfXX9l0r5ex0SkvlgyqnBIhz
         8yVnnz2BB73dufhGgrvejGmsH3VItB5TgTB2BqjmxmrYI08DjVY5LaPfTKDlbOx04yEz
         qTT5GSIqm8Xodh6WvF2Am9DUWkCx4lOKRSGjA5xUK2AOnsAP9pwj4mdSh4qWaL3K/F2a
         O+7NnFqMLsYv9OFvNbXPyoX5J45/5AAwXYMwuw1F1MV+QqdsiOZ7PVxRzN+eNISPCz1w
         ULMgRqZC11xpfJ58pHYFRCWXRf+J1EMr+N/0lH8QBdgFLssYWHo1S7PzfW91fxD1eyuC
         PDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8ZKmtZf0PwBGxpV7JymqF8sIDddhPfytyQCbmCFVvE=;
        b=7hdsR6z+d+CIE6ewjpx+kaYFshVhtxxP7h5hayylwAGZ1+PpYQtxducnh9eWDwwSd+
         9flsY3DRhq8sBFYSQnJHqIUgSsmpW0LoI5FZT+ry0KtbKuo5KgIoGSX8Jy2lr5UnOlej
         g2qh2ggP1u7OfvmH8KcpvBe2MN3bPwTlv8CaYUfsOF69eA3R4WzIgD1y7zz0Bt/bdd1H
         3Uz8qldf4qs81CXcbzsnf7cUn1xkXAQrywgNn3nstV9265PwOYKCmH/SVJ259OLvCzOu
         QJCgA+6I4UWhXK04YwW+/kSkhwIE66MduNHmTEkiHL7EAeZY14WwoI2gYwAe81DOZHKQ
         sDxA==
X-Gm-Message-State: ANoB5pkqcTVzmIsezlv0cE2kWq/sS5VTDk0yXw5dEsjCSgZcmfTRdJ0d
	BXwWdwroTeuOc6o9w/9T5j/7RFA/w4Q=
X-Google-Smtp-Source: AA0mqf46Y6GXZXfATj77gIeR3M5NtdPvkDfllojXh3pPHsWCoNCae+E+AldS6qikRJIbSHMhF5YnRg==
X-Received: by 2002:a05:600c:92a:b0:3cf:69d4:72ee with SMTP id m42-20020a05600c092a00b003cf69d472eemr8008959wmp.122.1669242194860;
        Wed, 23 Nov 2022 14:23:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003c70191f267sm4087304wmp.39.2022.11.23.14.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 14:23:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] man-db: update 2.10.2 -> 2.11.1
Date: Wed, 23 Nov 2022 23:23:08 +0100
Message-Id: <20221123222309.2075813-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 22:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173730

License-Update: upstream has clarified that
the combined work is gpl3 due to use of gnulib.
man-db's own pieces remain (l)gpl2 or later.

https://salsa.debian.org/debian/man-db/-/commit/695a3560fdf91f829f21f00a502244b0cf28e29d
https://salsa.debian.org/debian/man-db/-/blob/upstream/README.md#copyright-and-licensing

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-db/{man-db_2.10.2.bb => man-db_2.11.1.bb}      | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.10.2.bb => man-db_2.11.1.bb} (85%)

diff --git a/meta/recipes-extended/man-db/man-db_2.10.2.bb b/meta/recipes-extended/man-db/man-db_2.11.1.bb
similarity index 85%
rename from meta/recipes-extended/man-db/man-db_2.10.2.bb
rename to meta/recipes-extended/man-db/man-db_2.11.1.bb
index a41e2dd4d8..2d539c4a5b 100644
--- a/meta/recipes-extended/man-db/man-db_2.10.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.11.1.bb
@@ -1,15 +1,17 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
 HOMEPAGE = "http://man-db.nongnu.org/"
 DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://docs/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://docs/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                   "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "ee97954d492a13731903c9d0727b9b01e5089edbd695f0cdb58d405a5af5514d"
+SRC_URI[sha256sum] = "2eabaa5251349847de9c9e43c634d986cbcc6f87642d1d9cb8608ec18487b6cc"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.30.2


