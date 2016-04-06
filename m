Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC761771A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 06:58:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u366woMi012000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 23:58:50 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 23:58:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 23:58:45 -0700
Message-ID: <6f90522437cb86b844e19852b3884afddd611c69.1459925867.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459925867.git.liezhi.yang@windriver.com>
References: <cover.1459925867.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] grub: remove unused 0001-Fix-build-with-glibc-2.20.patch
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
X-List-Received-Date: Wed, 06 Apr 2016 06:58:49 -0000
Content-Type: text/plain

It was used for building with glibc 2.20, now is glibc 2.23, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../files/0001-Fix-build-with-glibc-2.20.patch     | 32 ----------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Fix-build-with-glibc-2.20.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Fix-build-with-glibc-2.20.patch b/meta/recipes-bsp/grub/files/0001-Fix-build-with-glibc-2.20.patch
deleted file mode 100644
index 46aaa97..0000000
--- a/meta/recipes-bsp/grub/files/0001-Fix-build-with-glibc-2.20.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 275fe0269ecc00af4788afaf9dc151a50b25645b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Aug 2014 19:26:14 -0700
-Subject: [PATCH] Fix build with glibc 2.20
-
-* grub-core/kern/emu/hostfs.c: squahes below warning
-  warning: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Submitted
-
----
- grub-core/kern/emu/hostfs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/grub-core/kern/emu/hostfs.c b/grub-core/kern/emu/hostfs.c
-index 7e725f6..8dd8e65 100644
---- a/grub-core/kern/emu/hostfs.c
-+++ b/grub-core/kern/emu/hostfs.c
-@@ -19,7 +19,7 @@
- 
- #include <config-util.h>
- 
--#define _BSD_SOURCE
-+#define _DEFAULT_SOURCE
- #include <grub/fs.h>
- #include <grub/file.h>
- #include <grub/disk.h>
--- 
-2.1.0
-
-- 
2.8.0


