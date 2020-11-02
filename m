Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.1206.1604335777636754928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A0P1nRiA;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id k9so15052576edo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wO2sJqNvbsnYbKi2PnPBVzpP3daAKQZPuFvifNdenFk=;
        b=A0P1nRiADFnSbwoSllQqWqqKOjn0skJeTh2pBUVqS72Za3tCEm2MKFVE8fOzDqrfPh
         X3g2ULuco59BG69o6ayVQoljxIsqNddWnrsQvWeazZT95536DiyOhMmtGXT82hF+7GhE
         Ff50lx4bKf2iaU4kJUrAiOPqDpmfKQ8Wgb8LHPZXpy6jslv3lCPaX2Mxw16XpVuQ5n1/
         55bDis1X7rLPVf7Kqmth2ORJXtoi2/ysGQhT9L8lICBySN3vT5U4FYxBCrzSWeRlIuy9
         GlpLB4wsw3E5d/00C+kVxXq8S2W0JBes9Sosa5R7v9CHS2NxBpUXuYwW2TDIYhTsl+01
         MIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wO2sJqNvbsnYbKi2PnPBVzpP3daAKQZPuFvifNdenFk=;
        b=jP4j+Gu3xB/EFwX66Jmv2aQ2Xrzh9R2QcnZiCsfFBZ2O3F78OIVf78FwvWYpP2Q8mJ
         c5q1eJYvY+V0wNSKku2PCoigiHu23R9T+R7IXCVzf+RMgJ4XhqK/Mu0QrYwOvJSWlG7L
         NbcP6sW5ruhCoY1IVYt8ufbZgYdeyEwP0TnXgcYOVjr4dXuJgI1QuyZ2/IHdPhF7JaPn
         HRYbD9mBOqK1tkWSNovUeXQvB/qcpDDMDqT0RmnjJsFXaoGfZduW+X9D1NoTqo9Ufcgi
         Q60zeWCxrvG9jydEd+LiH4ZI/3wC7yixhNi4kuETyCOCPCLHkjzJ/S7KSUfmd0wbuNyg
         E6zA==
X-Gm-Message-State: AOAM532+ug3Y8zezgX50Zwl8ihhRLujShIw4yM/IJMesgxQx26ysd7AM
	ZuVG0UG9iLhCcy8oO59qJe8DSQ/Py5jQcw==
X-Google-Smtp-Source: ABdhPJx3Umi2UuTQwdoKJTPjAPFoT+4B7J2WNMzKRyzsSCfHiZaLgcQrj9u1RL0WtOrl097ZVtOd/A==
X-Received: by 2002:a50:ab0e:: with SMTP id s14mr11788794edc.172.1604335775860;
        Mon, 02 Nov 2020 08:49:35 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:35 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/80] ethtool: upgrade 5.8 -> 5.9
Date: Mon,  2 Nov 2020 17:48:08 +0100
Message-Id: <20201102164907.27572-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.8.bb => ethtool_5.9.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.8.bb => ethtool_5.9.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 75a3841f2d..673b35033f 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From afecc8791f904dc1893858d68a642b491356c74b Mon Sep 17 00:00:00 2001
+From 538bd5ec36d88f17803cb848cbbfe62ad51fc2f4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 19223f7..8a58d15 100644
+index 0162155..6866e72 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.8, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.9, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.8.bb b/meta/recipes-extended/ethtool/ethtool_5.9.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.8.bb
rename to meta/recipes-extended/ethtool/ethtool_5.9.bb
index 0403f0e3a9..2d2f9b77f0 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.8.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "91e8bbda48a7fd5d374efacca542364ceb3a6c1f286f024b64ec40ccc799e125"
+SRC_URI[sha256sum] = "f934a830554c46d7d60b1a9147f4cab15589b7e09344c4b79b1948b740f0a725"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.29.0

