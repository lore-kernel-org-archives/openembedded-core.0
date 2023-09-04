Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAE5C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:17:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.49354.1693837069559479952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a8R5KTPn;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c22103bce7so6878625ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693837069; x=1694441869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGeulKbzEWyA/iY7CCJy1eTAkp8wfkMbrHB10YrdCqk=;
        b=a8R5KTPnMzr7m89jtX3h3zokV1pGt47jM2tKmsWQXGTFfZDaXKa/kyNb23Oz5DkqQ9
         WbyYl7/gIBnTEVX6mCy+FdswGbSQOhIi9nGJse3a2ZczF3YXzHyWLDfhGEBrMA5G9yb+
         xbdNGbhXbT3dUK9b2WgO6olytXgBj8Fp1VDb0Ig3+Kid56hSSTWbkmEoIOJcOV2fXcVR
         lF4omRbFXNjAcHGxQEv8xFk/udXKlQMuFlijI5j8jr7Yhsx9h/YGpUjIORYdiHYEtm2D
         dHOzqzAs33GTHazkGxddAaP7z81V35ocuGqqNFHqbATKBDlH+Msk6fLabV3yO2yy1ZXh
         Wy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693837069; x=1694441869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGeulKbzEWyA/iY7CCJy1eTAkp8wfkMbrHB10YrdCqk=;
        b=ZbqRp76XLPNxsq5gGLRmWpPoJehervwhgz32O4CXntNQnCHF7qL5hPibbxKzZ1y6aY
         9EgTJmxYRvGH/QEdvtby+uVbAKQBaHCCVIJg+/yMaZbBI/rGrgj9NgkVdKEB7STguYwR
         JmkJL4LQ5BLB2spZ3CezsJiizno7kO1BHIP0PwL6IsuHh2BsqNIfhC7eZLPAF8tqTn8n
         0DzF/GQvTJuRhFZ28XMvif5bucDq8hPYtWtNShrKQMdMA/Mf9SpuwD4Te413bYClGD7x
         U2CxG111w5EdeCj8nx9P5qudvsF8kXLxFSI1o+1k/+X4sVODwlhTkXY/5NWhTnEyMDvi
         pcYQ==
X-Gm-Message-State: AOJu0YwLecH+mB1EAod5j/tpYTzx8XgvNdiTHbv5WEnPduzmJFTRP+4i
	TZGA6HwrDNNnXDzUAST7z4+kmODaH1OwIA==
X-Google-Smtp-Source: AGHT+IEVwDAa+Y5BkyVn0TuuU/4/a2kQFGReVFYNZdDMdsrkNLSo7YVn+SSceSINTPU/Y0gy05QtpQ==
X-Received: by 2002:a17:902:ec92:b0:1b7:e646:4cc4 with SMTP id x18-20020a170902ec9200b001b7e6464cc4mr9506918plg.28.1693837068792;
        Mon, 04 Sep 2023 07:17:48 -0700 (PDT)
Received: from L-14805.kpit.com ([43.231.237.211])
        by smtp.gmail.com with ESMTPSA id iz22-20020a170902ef9600b001b8a00d4f7asm7666778plb.9.2023.09.04.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:17:48 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] pixman: Remove 'PD' from 'LICENSE'
Date: Mon,  4 Sep 2023 19:47:41 +0530
Message-Id: <20230904141741.113006-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187181

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Remove 'PD' from 'LICENSE' for pixman recipe as it is not part of package.

PD license comes as a part of the generic do_populate_license task
and not as a part of the actual package. It is nowhere in the source
code pixman - Pixman: The pixel-manipulation library for X and cairo.
(mirrored from https://gitlab.freedesktop.org/pixman/pixman)
(cgit.freedesktop.org)

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
index 5873c19bab..1e3ccb0443 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & MIT-style & PD"
+LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.25.1


