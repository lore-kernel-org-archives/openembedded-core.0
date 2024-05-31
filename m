Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDD5C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 13:02:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11238.1717160527755096151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 06:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9ScS0d7;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso9808455e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717160525; x=1717765325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9kxnJ2II7LZxJLBD6+kxqz1QsdWmCyGf1j+F+llt0g=;
        b=j9ScS0d7XYt0PRAwkBIuf6Ay3+GAFxkuZ8VJFWit2tLp3FZVaabGDGZ9kH/3MBRaFS
         ORoirmFduXaK7r9xUFn9JCKezgbFht4WWXAksqB8JuQS4HKA9ctG/fBesxf4wXJYZMBN
         i4IiG1MaTCedp9BRVrPD7VVgILTpKDCBTB8TFsRxnLVzk1F8H5a3WK0j4iVGwGR7i8yh
         1hIwnwT0b6UOdCGCztGAphulV0qRQN+lNtDaBsKezInmmo4dXUelAz+svLJWUr9ApoiX
         V4Uw1QjL6oinMEtxmyDdOPo/6fr2GbqGIrzGikz9Vgb6appoWkz+BUMxSWZTK+y9JcyZ
         Ul8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717160525; x=1717765325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9kxnJ2II7LZxJLBD6+kxqz1QsdWmCyGf1j+F+llt0g=;
        b=B+kAis/Fhkq5rg84AFp9pQ1ZBh25Zdgnfs6ImlmiHJPT9rLW90/Q3wNnseHjuyYC6d
         uJUhDlrtzaE0tQBkQb84u7sIHAISTHQ3Xm6cx6JEAtbY8zwyDNTjWHU1voVjGqV16p/o
         AOdcAgx8kvbyqH2eod2A323LfabxM3YykAu6w48OfOVEtjRY79rl6njPKZR1+5TBGjFw
         XbO+jkAyh/MvoSq6tOOCLqVkky5BCIGh8pcE0j6lxzUaUWta5hiopZGM77ljQ4g1flcA
         t6k6d20V66JEk79HTaGEreAvFIPdFZCbmmPsK75ANmc8V2sSeK1oVMFaYe13XJbLSJ4P
         HsVA==
X-Gm-Message-State: AOJu0YyKgyQIhbvcjVRyCAizv9R22WcEGwttBIlzfACymqtk5C+aHc3Z
	H8DfouO1zrNDh9afo65jmr/hB89iusLe1EgHtoH3dVyh+Nzw6Blgxu9F9w==
X-Google-Smtp-Source: AGHT+IEFTHgsSrzEQ69eHzUls5IgBKX0k8LHFEGCuCKDgzRtkLq1sUJYpwfDJ0h5Z9nRoL1WlV/kYQ==
X-Received: by 2002:a05:600c:35c5:b0:41a:a4b1:c098 with SMTP id 5b1f17b1804b1-4212e076530mr16629325e9.19.1717160525491;
        Fri, 31 May 2024 06:02:05 -0700 (PDT)
Received: from localhost.localdomain ([80.215.210.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270ad52dsm54599665e9.42.2024.05.31.06.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:02:04 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC][OE-core 3/3] linux-yocto: update CVE product name
Date: Fri, 31 May 2024 15:01:28 +0200
Message-ID: <20240531130128.1258909-3-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
References: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 13:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200076

Update the CVE product name. The new Linux kernel CNA uses simply
"linux" as the product name.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0132fcffb3..f469bae8bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -9,6 +9,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"
 
+# Kernel CNA uses this in their CVE entries
+CVE_PRODUCT = "linux:linux linux:linux_kernel"
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
 # by the use of AUTOREV SRCREVs, which are the default for this recipe.
-- 
2.42.0


