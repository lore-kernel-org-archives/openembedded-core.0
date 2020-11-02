Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.1196.1604335821717674422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F0U1tyKT;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k9so15055073edo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w9y4glp+4Q6vc/mC9LPDjmQPP5GsPUMQhAUfRsfm5Mo=;
        b=F0U1tyKTEXGf+VDt+omxpFxoNshChFUz034G2QMPAbcQBQgtW80r3k4Rnw289KLmvS
         uhFW17Gi95+7nV4ZhyXotBo6XaBCg1V4tFL83EJ5hv5yp3tDZ4F3Wo2A90O1ed6e3N1+
         SfS6T6cPl806wtCqOaFSl12JzEK2BCfrltwcfTcmKmESfCizIyYB8oUev76tqsDqleNj
         bbaTyKJHjt92IK80Fes5RxpxbBPPW0L2H9gAQMsfRYAT6kyQJaY7/gbYpNs2GC2L1OEF
         wAemaA66DW5yue4DqBrpT2XscBeKgAJscZGM3PqdKSVlKH8SQ6D29YmDhQ6eGDTqDBU7
         T6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w9y4glp+4Q6vc/mC9LPDjmQPP5GsPUMQhAUfRsfm5Mo=;
        b=WpDOtX0PSjBR/Csgz2+K+IH9f00b8NSCcYY7NXew1LdsNrlx1PJkKDwJD2Dt5QUeaw
         9TxL4uRxAELlHK+kS/Y8jxlz9IwrXmKUwv0VY2OXlopZpNgzrXtW1/6nxjO8G2ek/ThP
         m8rBnfeJCYyzsmfIR4Bi1Ir1nmEHtFvTp8hVee2b8Plz5GfUukT1V9Opc4QEl4Bs49lY
         rZeLB18tcLlBpByIQypwz84xkZwrs3GWcm7INXsicMU3vSJfowWmOy0cQs8NQX74XE21
         Y3wjdIX1g3MOvOYVpPWMdc4yWr4QjwJB8hR12WLDu3q2Vasz585zFOc9hD+W4xip1LRl
         9baA==
X-Gm-Message-State: AOAM530pwWKmXIoUL5r96KCK0xSxqBZC8s/SNwpa0iHLHn/MeA89MMpL
	5CH2xuNPD4DKOiTx4Pgt6sUsoc9hdnxRJQ==
X-Google-Smtp-Source: ABdhPJzq3iyAHHWmFigeqZ7yMgAxb9ZVhdh5thzYY4qOOff99OrDBB24FpLBlLhVMlHFwZmpcIjq0A==
X-Received: by 2002:a05:6402:c8d:: with SMTP id cm13mr15086010edb.340.1604335820001;
        Mon, 02 Nov 2020 08:50:20 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:19 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 70/80] rt-tests/hwlatdetect: upgrade 1.8 -> 1.9
Date: Mon,  2 Nov 2020 17:48:57 +0100
Message-Id: <20201102164907.27572-70-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 7 ++++---
 .../rt-tests/{hwlatdetect_1.8.bb => hwlatdetect_1.9.bb}    | 0
 meta/recipes-rt/rt-tests/rt-tests.inc                      | 2 +-
 .../rt-tests/{rt-tests_1.8.bb => rt-tests_1.9.bb}          | 0
 4 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.8.bb => hwlatdetect_1.9.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_1.8.bb => rt-tests_1.9.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index c18928ed02..8fd94b176c 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17 00:00:00 2001
+From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
 Signed-off-by: Randy Witt <randy.e.witt@intel.com>
 
 Upstream-Status: Inappropriate [other]
+
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 05fc5ed..7a289c8 100644
+index c3ebbd7..2176835 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 1.8
+ VERSION = 1.9
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 5d28c7e63e..2dd890cf95 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
 # Version 1.8
-SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
+SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.8.bb b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_1.8.bb
rename to meta/recipes-rt/rt-tests/rt-tests_1.9.bb
-- 
2.29.0

