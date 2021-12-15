Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62981C4167D
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.2682.1639608046301378535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2IqLa0u;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id z206so3465916wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KdOV4QDZ8Puf71M2BrK+CN+lSzB84ogl9kFMHIXfhxE=;
        b=J2IqLa0ugYBSvbqLxl8xnBv9ywSSP0hC2aD3n7gmeQLTcIa6DD6KJ4DonojgDjJ4Nn
         S6fbnAHxseDH3fRbo7yI/V9EKywIsAogh5c3Aio0gwdg7i/InjT9og7QlbE0+OWRKEmM
         dU/R9QakbnDU+XniU+kM9oWrUrrdlHMxEHYoYWMh/z2aMxzbITZBMmayOSw6X3hxE+Jt
         YzElXw3mU5gqYyTxgoOgZZAoCxvNQbZyoQ3QxdcYLEJ+7OBt3yGBZMawZi0WWOQ4EWGr
         BhOYx8nS9e5tAQrLaXzWzFgksiVib5zZmWKpgE5mfYsAZIWBdsXVruqxpKGkqw2SQkYv
         Cxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KdOV4QDZ8Puf71M2BrK+CN+lSzB84ogl9kFMHIXfhxE=;
        b=m+6rNAExmh3l5zHL0KCmWyWf7wOZso7hfWTDXpaNTXJuT5mGAtsh+Z1xTZZYeYVONH
         A3PZiybC7DjY+UB7FlC7yvlvdod/Fko+HsbNmFGBjwybXvKKnD1NghzBktngaGs1lF6w
         3fYLJDS9Mk/Csdhm9QWTxH45U0lJMs+a/FW7fwHpuFvZHle6Nx6n+KiqdftkeDDkIKyk
         hzmfqPdwW73uCRbrjyTSUdJtPGsvNU6j3RlMbaosBzbKacN4qllBmW0CF7e/pIDZdN8O
         8cPehWs+doaLULT3riPIm5q7dxr+ItXNVAi3HX4vVuIwo+//vFdVAcESfVvDQDkmh5sy
         Z/UQ==
X-Gm-Message-State: AOAM531cCthal7mz0Lff/7WLogAhf/JfmUiuSOh22XhdJDAhyn4BiLba
	XxBOAzs956fiUpKEkJhucJpokboNuoDfng==
X-Google-Smtp-Source: 
 ABdhPJzug8TTBufj1HJMeIn1AkY7k/kZZBDQQt5P2drQvxAmn4IpigqG/retplrIdyVhjMIlVbdQMQ==
X-Received: by 2002:a05:600c:3d8e:: with SMTP id
 bi14mr2204612wmb.33.1639608044824;
        Wed, 15 Dec 2021 14:40:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/26] python3-setuptools: upgrade 59.4.0 -> 59.5.0
Date: Wed, 15 Dec 2021 23:40:17 +0100
Message-Id: <20211215224034.1814148-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159751

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_59.4.0.bb => python3-setuptools_59.5.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_59.4.0.bb => python3-setuptools_59.5.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index c3ced74918..5e2ee454da 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 61ebf2a12a308a2d99023f51c9da8b1991bdc164 Mon Sep 17 00:00:00 2001
+From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_59.4.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 5ae076a165..878fa08404 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.4.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "b4c634615a0cf5b02cf83c7bedffc8da0ca439f00e79452699454da6fbd4153d"
+SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.20.1


