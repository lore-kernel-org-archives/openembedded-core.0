Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4F7C77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 01:12:08 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.1909.1682039521881352489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 18:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=omFb5QN/;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1a69f686345so15028355ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 18:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682039521; x=1684631521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYmYErhu6FDYQc5m2Crus4PenIvKW34fRvlTH64p6wg=;
        b=omFb5QN//4h8uVQD23ynOOdH21Y7TRzjQjUusTsIRQ9TLYAtoTTUNaQCbyhUSqbqS4
         fVc16lVQGqDDv2acjoByRwtIgveWAho+s+/yqmIqrxzJHbuWxSeGGLY3lhsI7uqVivAS
         RuUEfIv/bR/2teOt4y9c2iepxImIpLX8mjOpQYZ8IKxsXnO035RZp9XhUOkbyu1hqrqN
         dLBV9AQGrTFD5+frr0qV+qHMMJkGYzc1+tGSC0fnrZq2Th4tBvuuYcNmZTdD3dGIYbcY
         8NEJsspY9a7khTAxtto4aydkCFUbUt4e1vzLJuSEsHXwUhIt9UAJkFQHVx5x8NemhIsH
         ZHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682039521; x=1684631521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYmYErhu6FDYQc5m2Crus4PenIvKW34fRvlTH64p6wg=;
        b=SNDbO4bTgnUe2R5t94c3icxwtuen0hNz3YamiIkZ7BEnt/XaRhkhkuOD2heXbA21Jk
         rl2FHKjAPUE5PGQ0EmJBIaWZi93yDVxYdtJBx5D83MEK7TEedxxypoeTK5sqpOGUDb70
         73WX/0ui5F9aH5OFaDNMgG4fnbY1+SYzqC2A93Tupp6Jlst8wIrzfgHfHAYtv74+XqN9
         z8T7Oni2nWmyMyRtWZuN/6tyWAYYhAWO4Kr09L5n7O5cyCEoBZS0Mzl8owT7OXzlyLxD
         9EO7g9uHls8Phcs56Q0RV633R29aBJ6mvyCCl9nybLnGfBfGwyfidg0RwWuYnJ73bCTb
         36Yw==
X-Gm-Message-State: AAQBX9dkex5Xzd0wMQyNEzfYd7aJ+ARswfhyLg2zOWmZBMGjauVLcdY1
	fvulGRmFyCbiZQVuFMeNp1vb9Aiu7lygBA==
X-Google-Smtp-Source: AKy350awwYvKdeicpX57yR2eV+mLgWWJakK3i4S+XkdUzHTNGGyLxh1pXcl7Ytcvyc94/x9rOLZU9A==
X-Received: by 2002:a17:902:d2d2:b0:1a6:9d98:e763 with SMTP id n18-20020a170902d2d200b001a69d98e763mr4623273plc.26.1682039520787;
        Thu, 20 Apr 2023 18:12:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902bd0400b0019462aa090bsm1639256pls.284.2023.04.20.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 18:12:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] m4: Add locale-base-fr-fr rdep for musl too
Date: Thu, 20 Apr 2023 18:11:57 -0700
Message-Id: <20230421011158.790929-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 01:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180258

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 3b4303b7fd..0dd273bd89 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -53,9 +53,9 @@ do_install_ptest() {
 }
 
 
-RDEPENDS:${PN}-ptest += "make coreutils diffutils bash"
+RDEPENDS:${PN}-ptest += "make coreutils diffutils bash locale-base-fr-fr"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
-     locale-base-fr-fr \
      locale-base-fr-fr.iso-8859-1 \
      glibc-gconv-iso8859-1 \
 "
-- 
2.40.0


