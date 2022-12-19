Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C902C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 06:14:34 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.15212.1671430466861181234
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 22:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BLvUMK44;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id s196so5510616pgs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 22:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUiel1lmnJgVMRO/39wtdZZeuLkAc/edg6WE/w3FnBU=;
        b=BLvUMK44MOj90r4rBXooP19l4xlSr2QN6W9/kXLfmORiLi1lKQPZI07MrsNb6ndXk/
         QPeksdqEJ2tdVEUu0ZXJs46VKOpV1LHfU+U3g98KpCsshYH+/OIgQ3bnt8RhvqFchy6Q
         m97xtwXmVFcSxtU1MytrfjgfUYs3AuqbCw//AToUi1n6Qje96qt7iX4/uE9HbURmRO70
         fRno4YkssKU7c9m/lTliq/8i7IRRAMXX+yY4A9IZqUPOs8XaZESbB6U1fS5dkkJJGzjb
         2EY2BsLYA+e1czt0ZojK7xDupcOAb/2x0aO7VgVxfT2l6KWurudbdG7zHIp4EogMNz8M
         qW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUiel1lmnJgVMRO/39wtdZZeuLkAc/edg6WE/w3FnBU=;
        b=5sMAhhnuO5g6x9anEKMVLdbTCO/U/2Z7/KfaVoRcVqmOQ/SQ9mlL5VATHDj6JHnpUC
         K+xcdH7p/7d3DeYt8I9d8yRCfQUaf1ZR4EpclpJQEpA+gW3TnWuY4TOjT4l/5OYldEe3
         RwFZ6xOsz81YhrBCh1Hd4rh2+SVTvNEJEnBrmg4GUmW9fXwfOErmavARRiQ+mbkU8SAf
         V6FMV1qJ0TILHTdcDEZSZv9aMxQnZtPrux3DSHmD3nRE9OkYV9Oybf3ziSQrVAnKZFjS
         57rYo4Lf2XCkaPxqTlBKvPSWwg6m6Pnba0XCbclwZMMK0NWWLBVYcFy1SJ/3atkqAWj4
         LlkQ==
X-Gm-Message-State: AFqh2ko8lmzAPmmQpjYFIxhigquuG8dautT7NZQa2SA+1XfJU9Sf7bwH
	hJgxIaOBqj+IJyAohzJuXsdgHhAq3ks=
X-Google-Smtp-Source: AMrXdXuSdmwv23VvNfZOsI7y7IfXettSXbXNJh2VlULf82U60PgQO8m+dC3r7ryiOb0PO7OP/C0SiQ==
X-Received: by 2002:a05:6a00:72f:b0:57f:ef24:5829 with SMTP id 15-20020a056a00072f00b0057fef245829mr164637pfm.17.1671430465743;
        Sun, 18 Dec 2022 22:14:25 -0800 (PST)
Received: from localhost.localdomain ([2409:40c2:100d:7a67:5c1b:29d6:483:10fe])
        by smtp.gmail.com with ESMTPSA id 63-20020a621842000000b00574a82bb877sm5583125pfy.203.2022.12.18.22.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 22:14:25 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: nikhilar2410@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH] sudo: Use specific BSD license variant
Date: Mon, 19 Dec 2022 11:44:14 +0530
Message-Id: <20221219061414.24294-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174811

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: ff27ea21d7c14086335da5c3e2fac353e44438da)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1596d37ba13db3aff61975a31d865f33333fa45)
Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 153731c807..9c7279d25a 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain
 HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
-LICENSE = "ISC & BSD & Zlib"
+LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
-- 
2.17.1


