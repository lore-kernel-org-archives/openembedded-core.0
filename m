Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 22D2460138
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 04:13:14 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id fa1so77099154pad.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Feb 2015 20:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jpV6DTVKCKHUQMPPSA+PP6I7LvWldbQno/kZeAX8uso=;
	b=t8AkDzAW/YS+ubvnbogIFo1fr4cYvTyaMFXfCN1QGRgU91zLoz5moGb79gtHM3YwJC
	SzUULuc467ZPv37TnhsYU+Ls4mRvegQYEUBU7YTIdgGpc+Xt65oqCjaNTI9Ipvowtekl
	1dSDtfh8PW/17d6sa9qbKJHJtUC9iv3cuwqTFqNpTn3DFZkmczsLW/DW7Gw/GuNrS3ge
	6hxw2W2EyEXpow7exRNiFsIhkvPRcYkK+9MJOL+I5ncbQgXew6Jncbff/Oya9eWr0wxq
	lIZn8mk8G/PQ+f3B6GB7wJkeMXlJxV4cWVOcks2hEG1XSvsbIDnkBnHek1hU0T8YyMZ9
	63uA==
X-Received: by 10.68.69.9 with SMTP id a9mr26581239pbu.154.1422850395714;
	Sun, 01 Feb 2015 20:13:15 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	zb8sm17484707pac.45.2015.02.01.20.13.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Feb 2015 20:13:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Feb 2015 20:19:16 -0800
Message-Id: <1422850757-1371-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
Subject: [PATCH 1/2] glibc: Re-enable upstream __USE_KERNEL_XATTR_DEFS patch
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
X-List-Received-Date: Mon, 02 Feb 2015 04:13:18 -0000

Re-introduce

https://sourceware.org/git/?p=glibc.git;a=commit;h=fdbe8eae2b9aed74dabba1b0a189c5d7d61bf032

This patch was overzealously removed during option groups forward port

Change-Id: I8dd01902ae8e5ee8b5c6fc9dc39c7216952dca51
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch       | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index f61d459..1910fcc 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -2819,26 +2819,6 @@ Index: git/misc/Makefile
  
  CFLAGS-select.c = -fexceptions -fasynchronous-unwind-tables
  CFLAGS-tsearch.c = $(uses-callbacks)
-Index: git/misc/sys/xattr.h
-===================================================================
---- git.orig/misc/sys/xattr.h	2014-08-29 20:00:52.644070587 -0700
-+++ git/misc/sys/xattr.h	2014-08-29 20:01:15.216070587 -0700
-@@ -26,7 +26,6 @@
- 
- /* The following constants should be used for the fifth parameter of
-    `*setxattr'.  */
--#ifndef __USE_KERNEL_XATTR_DEFS
- enum
- {
-   XATTR_CREATE = 1,	/* set value, fail if attr already exists.  */
-@@ -34,7 +33,6 @@
-   XATTR_REPLACE = 2	/* set value, fail if attr does not exist.  */
- #define XATTR_REPLACE	XATTR_REPLACE
- };
--#endif
- 
- /* Set the attribute NAME of the file pointed to by PATH to VALUE (which
-    is SIZE bytes long).  Return 0 on success, -1 for errors.  */
 Index: git/misc/tst-efgcvt.c
 ===================================================================
 --- git.orig/misc/tst-efgcvt.c	2014-08-29 20:00:52.652070587 -0700
-- 
2.1.1


