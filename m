Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078CDEB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.269.1686926264400193611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=l3dHtYFF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b3d44e3d1cso6664145ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926263; x=1689518263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmEGyIqom/w0YNgfZnylGOoNy2XFK7YGGZTapsAgsZw=;
        b=l3dHtYFFsrR4Yyb3XRrjOvgoaayCaeM+fdq6sz43jqLdB39esqe+voxL/HNEFase7y
         EomU9uiiL6JPs0SYI4rfKB6CAF2t8Hpjh065/KzAG2FrpD2527ncnYc/0JhLKnPkx0XR
         o35oHDwq9t7juSseV0fLLikef6fWtn47Kh4HfHKvQOBE812O5Q9mjkW1ThSzVdfWt9zO
         tPTU2vTMkCksOKn8uuQ98Q4HL6SdAxacZVd8CuS0hvDKKOHeYrm3K0GJZx3XnCPRbLkf
         Ib3i6mQhThfQkae7rz6SHgyR5e/CIiF52bujSlBiW6IjRx5hOj8+1RwqphlHxoaRDvw1
         TaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926263; x=1689518263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmEGyIqom/w0YNgfZnylGOoNy2XFK7YGGZTapsAgsZw=;
        b=lEoe7oGS3Jjqwxf6KnBzWoYWezLKexTvFHV5U694ah/DitasrPkGZlYu1+MeovA1Yb
         r4q8CXBa/5Ns00vyn3wY1KlcD7UaGjHA7Gk0VjZEP/MxYF+u4jYXWRs3rOTpG2Arx8Ua
         W2aBviGZv2urv6yd/1Hf/oLyOkctsBiGgJ+ACHz62nZII0xGp8Qro/APoRgLIbnQxy04
         gSft7P46PMBY985Kj81qbGZLYM2xDysGM86zAxj30q13r5xssO8E01gMiEZd/6IYeMIg
         o/HRHM6gaTbKsuBpa4wKPn3ZANtUCNIsVZ7RAW++ZU2FeggHjXSi3GdyauRZzwsCxz8p
         ISnw==
X-Gm-Message-State: AC+VfDwjm+u3okXuDjSb9N4LyXmozghp5aWIAJAfPJvpl9KCIZzo2bcD
	z4O15s+Qf5C6LVqn2dgtdCVVvWbBpISgc1BbceM=
X-Google-Smtp-Source: ACHHUZ7yLuUbbQbQaRPLYyHbpMGKZ/m99kzndyBKllSzVAE3IWnH8fK/QVyJ2BJKRtyJE6KSyO0ttA==
X-Received: by 2002:a17:903:1208:b0:1a5:150f:8558 with SMTP id l8-20020a170903120800b001a5150f8558mr2194428plh.17.1686926263390;
        Fri, 16 Jun 2023 07:37:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/24] libgloss: remove unused patch file
Date: Fri, 16 Jun 2023 04:37:04 -1000
Message-Id: <ab6ca3112fe84f74fa4cd6ddfec2c6ca50476539.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183034

From: Martin Jansa <Martin.Jansa@gmail.com>

* it was removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=1c9cbb27dfe37ca4574c4285fb03ce394dee5ed1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c78439a8048c30ef96e11ae698c32f4e088787d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgloss/fix_makefile_include_arm_h.patch | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch

diff --git a/meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch b/meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch
deleted file mode 100644
index 7645be7314..0000000000
--- a/meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Inappropriate  [OE-Specific]
-
-When trying to build libgloss for an arm target, the build system
-complains about missing some include files:
-
-| fatal error: acle-compiat.h: No such file or directory
-|  #include "acle-compat.h"
-|           ^~~~~~~~~~~~~~~
-| compilation terminated.
-
-These include files come from the newlib source, but since we
-are building libgloss separately from newlib, libgloss is unaware
-of where they are, this patch fixes the INCLUDES so the build system
-can find such files.
-
-Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
-
-Index: newlib-3.0.0/libgloss/config/default.mh
-===================================================================
---- newlib-3.0.0.orig/libgloss/config/default.mh
-+++ newlib-3.0.0/libgloss/config/default.mh
-@@ -1,7 +1,7 @@
- NEWLIB_CFLAGS = `if [ -d ${objroot}/newlib ]; then echo -I${objroot}/newlib/targ-include -I${srcroot}/newlib/libc/include; fi`
- NEWLIB_LDFLAGS = `if [ -d ${objroot}/newlib ]; then echo -B${objroot}/newlib/ -L${objroot}/newlib/; fi`
- 
--INCLUDES = -I. -I$(srcdir)/..
-+INCLUDES = -I. -I$(srcdir)/.. -I$(srcdir)/../newlib/libc/machine/arm
- # Note that when building the library, ${MULTILIB} is not the way multilib
- # options are passed; they're passed in $(CFLAGS).
- CFLAGS_FOR_TARGET = -O2 -g ${MULTILIB} ${INCLUDES} ${NEWLIB_CFLAGS}
-- 
2.34.1


