Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C31C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:05:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.14459.1683104722093286609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kD1PCBCR;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1aad6f2be8eso42651735ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683104721; x=1685696721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IypGBUwkttG8q5P4s33v3se1eofQyteLOQkQWmtcK0=;
        b=kD1PCBCRgp/l8w9gTJsS2qtzdNDw/CxxrkdCR52s/1Zhzrj3O6EKNRzHk5u6aEQOw/
         6Y1n3fRaA25x8+o0zI0V0Xa748dY/43ATCieWD559B6hc3WlxvOaxpgPo2n8ZNBWp/Fz
         NCgQhQ183BjH/J3sWyOLT+5Js0VG/Hq35KudG+fk50VEl7n57xoa+3RRZx/gmvJ37pVl
         Gn1gKy20TBwUVOVlbb3/DOePcgLlqibwYMpwQlR0G/VtUNx+Bx2qa4+achlQj6PgFlNC
         jWZrXkjS47URSWOOmZbDJgsoDxbQq5xTgJQxYIwM4DEFdw11WT7tDYjvwf+BB7gIu6Bx
         bVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104721; x=1685696721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IypGBUwkttG8q5P4s33v3se1eofQyteLOQkQWmtcK0=;
        b=Rk/8IP7rDew6fk377Ywjdujrncd5IobqQyGzQ5KlONa2Re7rrD3TZEdCg6FzwgSAfz
         in6AMZwcIZ6YaOT3Qq+iu/0wHCHIVWj4Cu5RLAmWguuuKT2h3L65ONA0aXbm2sWYUzDq
         qrn70xLDFw5cMkON61biTwwaiH5HiyMekxpmVPke/pJ44o9AJ8xFvGS036b7qVmwkjZD
         kkkIGrtAGtL/gZw2+gb2973fpZPbkLYbIqltteHFc2avN4Ln6Dar34xLJQQbiC1qz57Z
         uz+qXyCzfcfURDCR6XyBK1cRQVThFKfUEM+N+1KDZ3o3+lj/27HUofR9dfFob9WK30w3
         yqRA==
X-Gm-Message-State: AC+VfDw/imBSAr2ug6c4kC0fyM/wIZBeV0Wv1NRallTZhJWNo/Nbcl9n
	pYJp8YKg0lpMHtowJ3GpXil+YN82OBU=
X-Google-Smtp-Source: ACHHUZ51kVQSPyKEWDDsGq7gtJKCssItkV6k8M7FK6vB/eeWqtG+6NDCVx293cbs+A9KnIB5nESH4w==
X-Received: by 2002:a17:902:ea05:b0:1ab:19f6:ef00 with SMTP id s5-20020a170902ea0500b001ab19f6ef00mr1863758plg.3.1683104719686;
        Wed, 03 May 2023 02:05:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:101d:b472:32a1:2248:5bbe:aed0])
        by smtp.gmail.com with ESMTPSA id dt20-20020a17090afa5400b00247601ce2aesm882778pjb.20.2023.05.03.02.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:05:19 -0700 (PDT)
From: ranjitsinhrathod1991@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][kirkstone][PATCH] libbsd: Add correct license for all packages
Date: Wed,  3 May 2023 14:35:12 +0530
Message-Id: <20230503090512.69190-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180792

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

BSD-4-Clause is only applicable to the {PN}-doc package as when I
check for the source code I find below files which only uses the
license BSD-4-Clause

~/sources/libbsd$ grep -rl "All advertising materials mentioning features or use of this software" *|grep -v \.1|grep -v \.5|grep -v \.8 | sort
COPYING
man/arc4random.3bsd
man/getprogname.3bsd

~/sources/libbsd$ grep -rnB5 "BSD-4"
COPYING-9-Files:
COPYING-10- man/arc4random.3bsd
COPYING-11-Copyright:
COPYING-12- Copyright 1997 Niels Provos <provos@physnet.uni-hamburg.de>
COPYING-13- All rights reserved.
COPYING:14:License: BSD-4-clause-Niels-Provos
--
COPYING-40-Files:
COPYING-41- man/getprogname.3bsd
COPYING-42-Copyright:
COPYING-43- Copyright © 2001 Christopher G. Demetriou
COPYING-44- All rights reserved.
COPYING:45:License: BSD-4-clause-Christopher-G-Demetriou

So other all PACKAGES should not contain the BSD-4-Clause

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/libbsd/libbsd_0.11.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.5.bb b/meta/recipes-support/libbsd/libbsd_0.11.5.bb
index bb8766a070..21af37882f 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.5.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.5.bb
@@ -29,6 +29,13 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dbg = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dev = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-doc = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=0b31944ca2c1075410a30f0c17379d3b"
 SECTION = "libs"
 
-- 
2.25.1


