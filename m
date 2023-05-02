Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBDEC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:14:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.737.1683040481550971337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kToJYPyF;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so39520355e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683040479; x=1685632479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89uQYLLHYlkdr0hWcqg8shD0JM+haxXyBZVZfbwBNjU=;
        b=kToJYPyF+DxFcEYfy5rBvM7H+Dy1shzWsOf+GAnjc0qZhNY4fpBgLjdeAwVMkIdEuP
         hKOL+BoTOZIBg7s3WYLDh1B57lE6tQZEek1pSjG+1tvPZIAchAu9J5Zo/GrpQVnqTfcy
         VdqErtpOmGj1dCBQcLEOY5NgQmKbcvPk9i728zav5+4eHZCADG11MAu6CABw+vQrRCaS
         ocNYah1D2RWE/ONrhZiYz9WlrraHFpByyNyNH5NkZ7p9d2rDNpqNbvg1oXH30byjVCXZ
         wnqHJCvdRnfk3FFQ+Z8PDGHZhh6r4ypNepND0+2erOPp1eTXKXNEyf9MfgjD0kQ4/zhn
         Hh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683040479; x=1685632479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89uQYLLHYlkdr0hWcqg8shD0JM+haxXyBZVZfbwBNjU=;
        b=LU1EHyZSU0FwcIZz16FRQEvCY1UjD8GQY2Wbst6OgAjJu0Kfr4F3Ire8srwItKzuLk
         DMHrDUT80SKf+FQd4IjnxVdlYSo46KGQdx0Vo5M2TmOBP/JYC9k/dQjM4JaNtQG4vtng
         xNl3TnT6GKqmZxEBdq9bOw9Mg9tJEZ2x0A0f5SWJTwcfulx5KO7NKP4QH+AnTOmuS4OA
         wfM5v44hA8l2wHkzWtCmEhwM0NzzJGA2a+V7xmdz49kJSCsvtwM5EcE8AqeddYPwc5o+
         k7tgudOMw/rHiWzMgXSHfov7oqsJ439FancerpKUtblWLR0gR4NvGvpaDQRRlnyObeCT
         stgA==
X-Gm-Message-State: AC+VfDxXYKJ6gSVwdDUTsj9h4HqS5zGCzYpB/dPPUlxkZ99S4E2baAVW
	GrYO5O34OtmtlJnFkdwGeHb8DiQtauU=
X-Google-Smtp-Source: ACHHUZ7ZyIBwNJtJYfew0Q+lDSA84cKhXl+GgJW+G0gR8KipZ2lqwUL5uSR7ieyM2G1AS5oHK71XQg==
X-Received: by 2002:adf:f58a:0:b0:2f9:cee4:b7d with SMTP id f10-20020adff58a000000b002f9cee40b7dmr11275518wro.70.1683040479434;
        Tue, 02 May 2023 08:14:39 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe0c7000000b003048477729asm21192667wri.81.2023.05.02.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:14:39 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libxt: Upgrade to v1.3.0
Date: Tue,  2 May 2023 16:14:36 +0100
Message-Id: <20230502151436.165876-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180743

Changes:
Use .xz, upstream is not creating .bz2 anymore.
Update license checksum: Change in copyright years.
Update sha256sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../xorg-lib/{libxt_1.2.1.bb => libxt_1.3.0.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.2.1.bb => libxt_1.3.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb
index f56e106ee1..1805dae772 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb
@@ -13,7 +13,7 @@ independent of any particular user interface policy or style."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73d55cea4d27ca1a09a5d23378b3ecf8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d6e9ca2c4b2276625afe025b0a2a4d8c"
 
 DEPENDS += "util-linux libxcb libsm virtual/libx11 xorgproto libxdmcp"
 PROVIDES = "xt"
@@ -21,11 +21,11 @@ PROVIDES = "xt"
 PE = "1"
 
 XORG_PN = "libXt"
-XORG_EXT = "tar.bz2"
+XORG_EXT = "tar.xz"
 
 SRC_URI += "file://libxt_fix_for_x32.patch"
 
-SRC_URI[sha256sum] = "679cc08f1646dbd27f5e48ffe8dd49406102937109130caab02ca32c083a3d60"
+SRC_URI[sha256sum] = "52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


