Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA17CEB64DD
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 19:55:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5040.1689537328553205280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 12:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z1kfxQpy;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b9e9765f2cso22138715ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689537328; x=1692129328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PyZUe2KzTxymdJW4nzih27/qrFMupte/59mOZP6yQ/0=;
        b=Z1kfxQpyTZ1OiY4G/Y/E4MeYhS6Haq1/RmGspdNdmEPPXmmiAP9o38dS2vZAqLyJ5T
         eUEL+9cUbATE23+Ir3C753kWu4H5jQ+WwwTxtgo3y3PWgiBHfwmBBNnp1CszsZH9QgyH
         M+YsLSAyYtNOb5K3plNhg7XfbIB1N8MiQaL51KnZSJmEZgf44rbORPomsPjmSvyYGWFk
         bXEM6IdyplU48WUITIqvYO82o3Vdanbegxfl6X6bcIslpT7o9NRFVX8vqrXWfx1aJy0q
         BRILx9i6iAft9V64DjdcHn/XQtcwB1VI30dqPbr65c4tLVMvJ8VrvF8LhY7IfjUWucs9
         Wp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689537328; x=1692129328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyZUe2KzTxymdJW4nzih27/qrFMupte/59mOZP6yQ/0=;
        b=jjLEo0B81t6EZHEevwIGala813yjnmrIC4CMrHKOYQMS8LjoeSdVNw0KeD2Y2MeC6S
         XRFeT5iK4SBpaVqzKosuDpe7YwyLdwvms4UHUXe584p8ho1v/FRyzvnksTHbVjjW8tIG
         ML3G3NH5LRHwZDU8ccWzrYVUCEK9as6ksu1DfjyxRQ5i38rK4IKUkoTlKPVLVeUP/BJa
         kNqaLIeYHC+uxJOSpq1ImGkh2Bput7VbddX1jUnKz3w5f/mvrpW2mrHBfRKQwx7tpDDn
         p6JEV+tIxRA4o91WTomMy0ttc2kWVkYaVuf9yda7aOqYsw8+dn5Rrf6c+3t2Kc9Vgxzq
         xXQw==
X-Gm-Message-State: ABy/qLbfodnFSPKF4t1HkoBOkINgKG61sbDWLq+OaRaXtDmqjVdRghlX
	9VhZdHW1tiWlxJjE4LCrF7f9ysafxak=
X-Google-Smtp-Source: APBJJlGeRtps8WfnHNGTJUcuvi8912UTI5+Pluucb3BwC3v6QVWSLOt3/oZPumtqyK1tvFKeFIoKCw==
X-Received: by 2002:a17:902:db10:b0:1b8:5bf5:543a with SMTP id m16-20020a170902db1000b001b85bf5543amr11158212plx.49.1689537327538;
        Sun, 16 Jul 2023 12:55:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::42f0])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902988500b001a5fccab02dsm11299129plp.177.2023.07.16.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 12:55:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-lxml: upgrade 4.9.2 -> 4.9.3
Date: Sun, 16 Jul 2023 12:55:24 -0700
Message-ID: <20230716195524.346465-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 19:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184421

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-lxml_4.9.2.bb => python3-lxml_4.9.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_4.9.2.bb => python3-lxml_4.9.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.2.bb b/meta/recipes-devtools/python/python3-lxml_4.9.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_4.9.2.bb
rename to meta/recipes-devtools/python/python3-lxml_4.9.3.bb
index c7f1e1fc3cb..b911f7b2ad1 100644
--- a/meta/recipes-devtools/python/python3-lxml_4.9.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_4.9.3.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67"
+SRC_URI[sha256sum] = "48628bd53a426c9eb9bc066a923acaa0878d1e86129fd5359aee99285f4eed9c"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.41.0


