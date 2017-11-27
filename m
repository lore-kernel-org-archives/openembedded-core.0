Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5B1E78285
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:28 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r12so18023578pgu.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f23KwGdCiRSYbHAmfJX3RRu1aJRzOM4wbrRaCqtDvNg=;
	b=s1nqYyB+rBmeGHwEQOol392t48LD0TXSa+J8YzusKNn0PMJ9SnvryHqdr70FdPOsqy
	fpkFiwCLjlBupEgnN7WTHxQVRAKmiIRvo2FJ49Sx5OUbHRQgIAW7VaMegJT2zuo0VlxS
	ALjvOvo4m6dz5WCJjaqL06FQvwbvzTQb1NCyf6F3hQInHRzq0mfgq1DFDVrx80TBk7Ib
	1glrdzxf5f4ayYEp0YTuSGUORVxLOmybPxYQlzD2maSQwUFqD9QRhYDdHHcXgf/Oifvr
	GXQyHop0w1McmmSWhlEobJqHAlwnKiwSEtBnEDHahRvBhNs3LWFSx26gFL94rvkfpZJ1
	HDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f23KwGdCiRSYbHAmfJX3RRu1aJRzOM4wbrRaCqtDvNg=;
	b=csgPvzdF3GpEO0elOgYdatytG53nzxwTLmTr/ivkamMEwGeMzd0/7BdXx+IlWfOkih
	06vxFmIUMJGQ+Vo+xOtYPmRMfXNTJoN1spIcnFObGXePZ3AZyCoXcGsYiOMAF6Gs+cVk
	rSA7XjLOiz8WK8PiDTzWv9LBW2pFS3e1KV8ywqxL1qDZ8jOWlowIG7yN3TZTsdfN47yq
	KbapHYOhzpPnvsZwjcFvGVHRjnOnfvez8xNU3dafgu4JM/3VrP130Z4LJ6dQ7zd+l1cq
	ABD9f/Luf5g5/ocdb8dMZoVWDDvtgnNeubOZ5aHNnia2+klWNZJbXYAatXQbXkW2+d3x
	YKzg==
X-Gm-Message-State: AJaThX6Mqgwr198gdRK9+AS39SbA+DjcnnDshMlOhKU00uM3gQ3oX1gN
	8bebivnHyBvgyIIRzAIQqTE=
X-Google-Smtp-Source: AGs4zMaSnONn3mgXNB+ktXo09/E77o8rdKT0alcUdzSAx6uG4qsB+IP/cZHhkfsLEZT8Qzon3q4Esg==
X-Received: by 10.99.116.30 with SMTP id p30mr35238828pgc.303.1511750130172;
	Sun, 26 Nov 2017 18:35:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:04 -0800
Message-Id: <1511750112-2263-18-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 18/26] binutils: Security fix for CVE-2017-9749
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:29 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9749.patch          | 77 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9749.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 8a19ac6..b88e154 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
      file://CVE-2017-9746.patch \
      file://CVE-2017-9747.patch \
      file://CVE-2017-9748.patch \
+     file://CVE-2017-9749.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9749.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9749.patch
new file mode 100644
index 0000000..3cc2afc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9749.patch
@@ -0,0 +1,77 @@
+From 08c7881b814c546efc3996fd1decdf0877f7a779 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jun 2017 11:52:02 +0100
+Subject: [PATCH] Prevent invalid array accesses when disassembling a corrupt
+ bfin binary.
+
+	PR binutils/21586
+	* bfin-dis.c (gregs): Clip index to prevent overflow.
+	(regs): Likewise.
+	(regs_lo): Likewise.
+	(regs_hi): Likewise.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9749
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ opcodes/ChangeLog  | 8 ++++++++
+ opcodes/bfin-dis.c | 8 ++++----
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+Index: git/opcodes/ChangeLog
+===================================================================
+--- git.orig/opcodes/ChangeLog
++++ git/opcodes/ChangeLog
+@@ -1,3 +1,11 @@
++2017-06-15  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/21586
++	* bfin-dis.c (gregs): Clip index to prevent overflow.
++	(regs): Likewise.
++	(regs_lo): Likewise.
++	(regs_hi): Likewise.
++
+ 2017-06-14  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21576
+Index: git/opcodes/bfin-dis.c
+===================================================================
+--- git.orig/opcodes/bfin-dis.c
++++ git/opcodes/bfin-dis.c
+@@ -350,7 +350,7 @@ static const enum machine_registers deco
+   REG_P0, REG_P1, REG_P2, REG_P3, REG_P4, REG_P5, REG_SP, REG_FP,
+ };
+ 
+-#define gregs(x, i) REGNAME (decode_gregs[((i) << 3) | (x)])
++#define gregs(x, i) REGNAME (decode_gregs[(((i) << 3) | (x)) & 15])
+ 
+ /* [dregs pregs (iregs mregs) (bregs lregs)].  */
+ static const enum machine_registers decode_regs[] =
+@@ -361,7 +361,7 @@ static const enum machine_registers deco
+   REG_B0, REG_B1, REG_B2, REG_B3, REG_L0, REG_L1, REG_L2, REG_L3,
+ };
+ 
+-#define regs(x, i) REGNAME (decode_regs[((i) << 3) | (x)])
++#define regs(x, i) REGNAME (decode_regs[(((i) << 3) | (x)) & 31])
+ 
+ /* [dregs pregs (iregs mregs) (bregs lregs) Low Half].  */
+ static const enum machine_registers decode_regs_lo[] =
+@@ -372,7 +372,7 @@ static const enum machine_registers deco
+   REG_BL0, REG_BL1, REG_BL2, REG_BL3, REG_LL0, REG_LL1, REG_LL2, REG_LL3,
+ };
+ 
+-#define regs_lo(x, i) REGNAME (decode_regs_lo[((i) << 3) | (x)])
++#define regs_lo(x, i) REGNAME (decode_regs_lo[(((i) << 3) | (x)) & 31])
+ 
+ /* [dregs pregs (iregs mregs) (bregs lregs) High Half].  */
+ static const enum machine_registers decode_regs_hi[] =
+@@ -383,7 +383,7 @@ static const enum machine_registers deco
+   REG_BH0, REG_BH1, REG_BH2, REG_BH3, REG_LH0, REG_LH1, REG_LH2, REG_LH3,
+ };
+ 
+-#define regs_hi(x, i) REGNAME (decode_regs_hi[((i) << 3) | (x)])
++#define regs_hi(x, i) REGNAME (decode_regs_hi[(((i) << 3) | (x)) & 31])
+ 
+ static const enum machine_registers decode_statbits[] =
+ {
-- 
2.7.4


