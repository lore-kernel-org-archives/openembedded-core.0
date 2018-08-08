Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A34E376078
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:57:34 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 8-v6so6491459oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=vtCga/oDNtuOUYXA+dHOH5S0uZiTeFMlh1BU4xmCbTA=;
	b=ik01Veod0dXCtbv6jqD0RrIZxV8TaAiAq3yJtMkDfcOAWN+ZNhEJzicmfL2MDhzBP6
	4sYROXIkBvmm56ILxVeUufkewqni5r9seHXt66MAasO+xfFYTqVFtRHV3b+m+pSDeFG8
	XKQpPdnuTgIR1KNxnizKwPRELxDpOSNYPqA7q5ZsnHgiW0U5X4/47V0EcXHn6tRQsUYD
	EBi2FcmWyhGqOcEdyB+wmsJwoc71VcDVFdtFfKoOUtDRxTZxmqt3ppt486S8WfZx8pYD
	Ojq/1qIhMcACSjp693dG4o2aCv0CjVIhd/1N0yxR++Oj0QGJ+ZNSh0l6bHT5c8frskA3
	HxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vtCga/oDNtuOUYXA+dHOH5S0uZiTeFMlh1BU4xmCbTA=;
	b=EFoKyUO6M9Lm31UNkqM4Un9Gta76mHgduLCyqjuAgsqV9+QBM/7H8kNtmHrEsoWg78
	heHcXGz/CFMzxri65Q+w0EbDO2mJqJkCIXIkpFk18wXea1o4BEgLtjcGvAinaSNV++1t
	14F/sBgiBqyjoF23h3+Haquy7t4q1lzsUM5+aa+roOKPmhbpF6K/K6WEd1sZnkPZ14y2
	q2XNGcTi0p72XJfSHVZ3a48Sq2Oh7WTy6W6PYBbUITb6wdZ8DboZeZ8RYmd++PTxJXTL
	8dXi2awYyKd1fceA65hDzSze/FJeR7UrBnUWpYuYDMdUJH2gF0Z3dOBg8DIASbVRvsN8
	sgcQ==
X-Gm-Message-State: AOUpUlGwgyeCChVHsKq4jzrQ0Gw8lbQq2JZJz9w65Dy1BztT7Ece8s58
	CybBJ7uZMg4JtA8eBnU7rDMhhln9
X-Google-Smtp-Source: AA+uWPyh+p+oKkjwHdGqi2I/a8yWU2ESfN/ELqHPm0qoqpQjrzjBa44FAattN7aBqt9q+Sv6/5Di5g==
X-Received: by 2002:aca:ab11:: with SMTP id
	u17-v6mr4365649oie.53.1533765455601; 
	Wed, 08 Aug 2018 14:57:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm7423139oib.39.2018.08.08.14.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:57:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:57:33 -0700
Message-Id: <1533765453-10191-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][v2][PATCH] binutils: Security fix CVE-2017-12967
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
X-List-Received-Date: Wed, 08 Aug 2018 21:57:34 -0000

From: Armin Kuster <akuster@mvista.com>

affects: <= 2.29.1

[v2]
Fix patch header typo
Rename 2017-12967 to 2017-17124

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-17124.patch         | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-17124.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index b29b75a..6928285 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://CVE-2017-17124.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-17124.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-17124.patch
new file mode 100644
index 0000000..16f0768
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-17124.patch
@@ -0,0 +1,47 @@
+From b0029dce6867de1a2828293177b0e030d2f0f03c Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 28 Nov 2017 18:00:29 +0000
+Subject: [PATCH] Prevent a memory exhaustion problem when trying to read in
+ strings from a COFF binary with a corrupt string table size.
+
+	PR 22507
+	* coffgen.c (_bfd_coff_read_string_table): Check for an excessive
+	size of the external string table.
+
+Upstream-Status: Backport
+Affects binutls <= 2.29.1
+CVE:  CVE-2017-17124 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/coffgen.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+Index: git/bfd/coffgen.c
+===================================================================
+--- git.orig/bfd/coffgen.c
++++ git/bfd/coffgen.c
+@@ -1709,7 +1709,7 @@ _bfd_coff_read_string_table (bfd *abfd)
+ #endif
+     }
+ 
+-  if (strsize < STRING_SIZE_SIZE)
++  if (strsize < STRING_SIZE_SIZE || strsize > bfd_get_file_size (abfd))
+     {
+       _bfd_error_handler
+ 	/* xgettext: c-format */
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-11-28  Nick Clifton  <nickc@redhat.com>
++
++       PR 22507
++       * coffgen.c (_bfd_coff_read_string_table): Check for an excessive
++       size of the external string table.
++
+ 2018-03-28  Eric Botcazou  <ebotcazou@adacore.com>
+ 
+ 	PR ld/22972
-- 
2.7.4


