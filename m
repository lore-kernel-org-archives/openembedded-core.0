Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F14C4167B
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.12305.1668951093135757673
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RGpkGMrO;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id x5so12155700wrt.7
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH0ZzNAzFGJh3qdUs7B1NDqciZj1Zc9gxFK38XslpvU=;
        b=RGpkGMrOYNfJIyi+H9mscgkoPAeZSRCw3dM7x6c9A12a3yPoreM+IGLU/fHfYS6w8u
         FsdkKc4JmX+JAf7hpcKWD6xYMV6IzTHop/8QuWQ3tNotLRm0mcRtJq2nH8m55hMj6OJa
         nDOd6lrtK8sbCCUGnNUJ8BoGGW/L+kuJ9P037iG7DdeglSU8RiaPhWMJJVZ8L3h1q0V9
         ArmnTzNQ1nxh2kX6jM3sK/+FLgRDiwipIR/wiObSU2bs5FLpqjglkQsc2UBAUlxrUNWi
         MCTLX5jOb9rUuCl1jbfGG41/Ta3tOqBFlZVzS5n0ho/2os7uDZrZARM6KxG8FcTGYJPr
         Sj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tH0ZzNAzFGJh3qdUs7B1NDqciZj1Zc9gxFK38XslpvU=;
        b=r1unI6pKEF/7yUfppw70HW+7XHTZBE5xhrxlRE12L00R+UAewWmjgCLmyDx+XrzPOi
         q8ga+DkvlnBU1XipVclrYoqf/3LZuh4vJ8ql7eM/Wlfg8rjO972tuNXjk65lrKznude4
         1i8WHGnWpR4rUE8Eyfrzu5/lslLronK45moleJWQfM93OXvrUiyY8eTfWQThA2ftV5Df
         9EDWIN4fuZZsM7TF+tUBTJuJsJwL/+78+93pxqFA0e/ZbUrVQKaUBiJz/vrxq+EQgH+P
         AI3E5b2ABV9C3+vb2F/uB+R/KbsmsVKwAJ5RKmvnLHj44M+GY1f/nKfSw2GjDgxwt23L
         6FrQ==
X-Gm-Message-State: ANoB5pn/AQH91758GgwBf7gczBETkbgQv+4/TfGlX/CLNf8b5+ojoRH+
	Se0IxPeu6OMUUHDsaqYelAIhwKNTP1o=
X-Google-Smtp-Source: AA0mqf6/rKJVTfvWM56OhFFNB0S+CE0naqmp8qWepaLQ9nusm2C5ONbpvlOVTvPgsnP+6VvzfPUtNw==
X-Received: by 2002:adf:f712:0:b0:241:cb80:2b95 with SMTP id r18-20020adff712000000b00241cb802b95mr3295368wrp.671.1668951091625;
        Sun, 20 Nov 2022 05:31:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/17] man-db: update 2.10.2 -> 2.11.1
Date: Sun, 20 Nov 2022 14:31:11 +0100
Message-Id: <20221120133122.2464634-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173587

License-Update: upstream has clarified that it is gpl3
https://salsa.debian.org/debian/man-db/-/commit/695a3560fdf91f829f21f00a502244b0cf28e29d

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-db/{man-db_2.10.2.bb => man-db_2.11.1.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.10.2.bb => man-db_2.11.1.bb} (89%)

diff --git a/meta/recipes-extended/man-db/man-db_2.10.2.bb b/meta/recipes-extended/man-db/man-db_2.11.1.bb
similarity index 89%
rename from meta/recipes-extended/man-db/man-db_2.10.2.bb
rename to meta/recipes-extended/man-db/man-db_2.11.1.bb
index a41e2dd4d8..641ee6e398 100644
--- a/meta/recipes-extended/man-db/man-db_2.10.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.11.1.bb
@@ -1,15 +1,15 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
 HOMEPAGE = "http://man-db.nongnu.org/"
 DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
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


