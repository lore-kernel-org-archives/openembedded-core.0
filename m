Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07C6C7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:33 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.3589.1684914811135853563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aAfOcRSd;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-96f8d485ef3so82611366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914809; x=1687506809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD7Rm08nMlg75DWBDxD0jZRqCOS2HRw5rYr16sTB1n0=;
        b=aAfOcRSdT/mmzh3tYmd31JFTJ2gUcWenr4pHuYn7c0hRYoK0AJDYdGbXOsJRYCW4E0
         +eLPdL0ONgTGnhcOuKU/nYKB5pWiZ1RMAomB2c/1/xXH8mib+8MgI5beceDq/fcTHxnZ
         vxrsuv9U5acywQkG+xM63gQRcfe8JdEfbLalXJ+7vq2Io41DEAqMGAdN5MOPmHpMrkHG
         BF34wWqmiYuNG7O1BSOOkhURJ82/wVh2/hm/qBNg5wcM/Ojzih7gM3aq1/207jEf5+XM
         tqGsv4BfnMvAJdyXWjr+CpWLV5arg0R8lbLxo+fDNpMnARtZICdeLDWqvfHVEbYHbxbV
         JoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914809; x=1687506809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pD7Rm08nMlg75DWBDxD0jZRqCOS2HRw5rYr16sTB1n0=;
        b=B2Q37dmd6zHtoymY/dACKS+FwwFtgC6G73/hOTNSCNBU153KFcEUhfpBoyISye3j+e
         vtiZN5Btt6P2jLayOJxsgTutvGhgnxqA7SJ1bUeRf30/PZkQjgfMMdU1dbj6of3Q+eCs
         Jl8pC1ZLv8dHB9OvbZ1gvcnKK6yz4NhMlHJ5KfcKClAJSf3Swk2DH72sOVdJBJGSgZ6v
         zwS8SJqbNj38JtusxmhweOP37jXsH9WaaavJo8UCkSSfb2DOWHyLZGBfjx4cS2bMTIye
         uYkqHRvZvHh5EnLOvWLUvOTMF5dJP61TvoR+CdP7qzXqGWzRa43gE2nfcYUDvM3vlNl+
         fdxA==
X-Gm-Message-State: AC+VfDyhpS+sjF46qB1sl22ox9sqfoI4Q9hG9lI2Up7tq8djH22lY2nm
	Yc8hsH3n1bylDvXGJEnMATg710H+HBo=
X-Google-Smtp-Source: ACHHUZ7Tv97ai+ze0wX5eGvG/oqyqNAFUA+C/r3jZv+aOWvVT2NvhMx9yGVBE54NK7qXRHV2TF/hNQ==
X-Received: by 2002:a17:907:842:b0:966:17b2:5b0b with SMTP id ww2-20020a170907084200b0096617b25b0bmr15355981ejb.49.1684914809585;
        Wed, 24 May 2023 00:53:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e11-20020a170906374b00b0096f641c6167sm5372469ejc.181.2023.05.24.00.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] libgloss: remove unused patch file
Date: Wed, 24 May 2023 09:53:19 +0200
Message-Id: <20230524075320.1086358-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181666

* it was removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=1c9cbb27dfe37ca4574c4285fb03ce394dee5ed1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.40.1


