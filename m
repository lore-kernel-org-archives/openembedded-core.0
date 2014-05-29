Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (unknown [209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id CC9376FC45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 05:23:18 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id kx10so2399369pab.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 22:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B4+pWCZBRLunxApVzQDOYjDAPtKqVjv6FUrVI/midz8=;
	b=qSyjLi+A2m4GJPRxqfYnmsOIsV+MGt/yXeo61MJYRCjSx1D5kw4NPdLvvsKtJRSv08
	+ViitttGc4Z3nPBCo6pHUKV4PyNT3LLwz4cMAshvKtJwKmh+lp/nLWRjAj1UtW/qC15o
	u36COn3YATwjOLtBQ52bhIyA/Vh8PP5HaN0/hWylwPiWk3MwA/xLiM4UP2ZRb1aMHfyd
	8UtMpr+AUYPAKAbTTpMfswYgeNEVK16RfR03OK+lKlzUYDhFyNU5g35E7W6bcir2SmiM
	fcwEJ9i5RI9yVP1PtTy3J4/ZrmAAN5PaJ/tsiHvJAShDVgsBLX4nZgIdcMW9Cit1nMFg
	PKXQ==
X-Received: by 10.68.130.38 with SMTP id ob6mr5336199pbb.141.1401340999558;
	Wed, 28 May 2014 22:23:19 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	ox3sm31227955pbb.88.2014.05.28.22.23.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 22:23:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 22:25:59 -0700
Message-Id: <1401341159-23434-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1401341159-23434-1-git-send-email-raj.khem@gmail.com>
References: <1401341159-23434-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc, uclibc: Add/Fix Upstream-Status in patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 May 2014 05:23:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch | 2 ++
 meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch                 | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch b/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
index 3062ae4..c596db6 100644
--- a/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 From 8e19e651145554fbcb90179f3dfbc7ea8a07c900 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 09:32:20 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch b/meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch
index 868a4f3..9afd55c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch
@@ -31,7 +31,7 @@ RP 2013/10/9
 
 [YOCTO #5133]
 
-Upstream-State: Pending
+Upstream-Status: Pending
 
 Index: gcc-4.8.1/gcc/toplev.c
 ===================================================================
-- 
1.9.3


