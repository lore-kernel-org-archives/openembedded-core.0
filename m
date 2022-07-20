Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25028CCA48B
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.51644.1658306707520253040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qOzaLAmC;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x91so22891164ede.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WuhoLeP0431tksg9LP48t+HgKc/IjDYCg2RYi9f/iac=;
        b=qOzaLAmCTDNYhuwmyJqc84Indk6GJt6kSyFcXPhLai0sXFzrn3n2xUb0N77ktg2rKP
         4rZcN9wM0z9134agX1HDehpla5suJP6aY1nIGS6x7ezoMExGFAbeAm3rRfwFcldR/7qI
         uBbDbmRGVCU74t8gi+blfDVXAOBIazAkPxNuQKcrofo6l1kicEbosEbzS4kQfYYJjMjm
         DIRNhmNdXVYYrHYhJzJ3HxEm7FLohmiht7hFqHZllck8fYN+TqVGowQr7sQ5Gnqk2nQL
         JFwaA8K42NZEuT2kiQoy9nJj2ShyIdhiJmOrgkScPfymYWMfHc9pZJAiV27vZXE2cmQC
         NmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WuhoLeP0431tksg9LP48t+HgKc/IjDYCg2RYi9f/iac=;
        b=GK+9OA4Ohf+kUWsuPEqsFTHVsFr5DouceEjWlbdIe9bcXRM21LANkBk7YEip0F7asC
         0DebzGe7Ly8MP2c4vxYTS/9wJrDhdyN9P6MmN0w290nQqqHGg0E0wSweel/77Bll0nsO
         N8GoOdyKraNwJ+wBMO+pphdxrVbm2LL9i70jcO/Wzii6TPUgNDBJ41rsFqPm7Ymaok2n
         mQ2YI6buEvEHvoTmYxbIvZvMfjqFRL8d7W9pe0tRypnrBW600f3DjXvHGv5+L+p75HlR
         HbfJKbKrHfxdom9ZvpE6uCNC28Pg++nXp/pBMPp+4wz65HhM5ZPJGLTzblNZ9D7CpSnJ
         NXHA==
X-Gm-Message-State: AJIora/1agnNA4PtffTu4u7HWTZkzcZpKMlq5P/xf2GH9jUilpY0LI2X
	tUUTlABCweny2ydsIWckoGrn/V/DX9Y=
X-Google-Smtp-Source: 
 AGRyM1scaLlrIeEEGqrFAuAXEsk/eOHjpEEH1zCTdnRAcwEwHKhv90cgEEnQ8SWogznMyw9ayck0Jg==
X-Received: by 2002:aa7:db8a:0:b0:43b:75b1:92e9 with SMTP id
 u10-20020aa7db8a000000b0043b75b192e9mr10036615edt.223.1658306705943;
        Wed, 20 Jul 2022 01:45:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/51] rt-tests: update 2.3 -> 2.4
Date: Wed, 20 Jul 2022 10:44:07 +0200
Message-Id: <20220720084442.2940187-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168310

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 6 +++---
 meta/recipes-rt/rt-tests/rt-tests.inc                       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index 43c2a2f33b..5410ec94e9 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From 05ccf5045adf4248f29623ad0db2d2a55ae5cd06 Mon Sep 17 00:00:00 2001
+From 5a7caafe04cac805b5057db2632b0defe703eacd Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [other]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index ec5d693..ab8a8de 100644
+index 3fbf882..04d3c0f 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 2.3
+ VERSION = 2.4
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index e519dfdc61..93fa390bba 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "338843c1ee157ae5d990c6f544f66b447b24fa8b"
-PV = "2.3"
+SRCREV = "ca4a6293da23ad0fd708ea1fecb2d465a9ea6093"
+PV = "2.4"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
-- 
2.30.2


