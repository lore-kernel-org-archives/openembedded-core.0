Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B22A78875
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:23 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k19-v6so1335736pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=3xB/VElMCNVWCAxgh5g234njBHtnAAE5MEMZNdMwkWo=;
	b=UuabVpmCBCg8LsDoR67WWGfOrIufCIO/pBk5KMAxHIMaPoav+1grhhkZnGWwuzFFCb
	WOR2rB0DhzomkXyiUh7Jy1TzgRMXFrQ8oWRDbpXXzCt4PKZdH7AxsXuEMDsy8jjg/tXB
	WesGUWgD5NYyDC3En25m5inImVUUKMaqeFiluOl2cT1RXdw/Gm0aY8od6jnEq6unsdjf
	LVQkU4nEk1LFkPtXnAY+5HbY6FG6K/YgrEEfhIZZxCy0jKUC/HxxRg17UbEOgS9MC+iH
	VOkdoGcnBgCeZk7zbs6GS8uROBAzp1o/XJKuXbZ3RnYpJO8zVBOh9A73JcNmCARoqBg3
	ISEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3xB/VElMCNVWCAxgh5g234njBHtnAAE5MEMZNdMwkWo=;
	b=gtn6EkNQGmxlq7CLGj2/FQ2d47yCun3iljE5/5nLh1qIYHVwoeZz16OggxaJl7NJOp
	iuWjJ1BMGt1KiwqN0XszDJFGrdvz+Y7UMt3SsFko39/mQIV2N5NcDIP2ZEj7CfSPXtXM
	efW1PVOw+KkcO6P6kjAPpjbjjGH6i0aq+H9vcIQy9n8niS66bpWZ8s+ZnZrhRDZYtKbd
	XEsQQZcSHAyogJ8d5jNkpIXXXdJHKTFWgH+SeD7Q1096LjrimPtHJQCdKbL7ojM1gARP
	FHOubLPcWmQ8rw6CFaSTUulL1Jf/aGQK04zh8SCjRoUiBxX3GuaqRNZ+dM1bAMbbbBD3
	fqhQ==
X-Gm-Message-State: AOUpUlGM4OdZtCfJKNgFEgBNr3z1Ej7rT0+72XgyXS5/oPA7GH8Xk3+A
	NMeLcoOdq6JxVmkl0o5Z1UI=
X-Google-Smtp-Source: AA+uWPycNBMd29x/UdxbTmWkrPtpe1sO7tYW0FOA3/feaDbEtjIRWEVhKGtm7rRah9zlTfTW2/VWMw==
X-Received: by 2002:a63:ae02:: with SMTP id
	q2-v6mr3006262pgf.189.1533742524670; 
	Wed, 08 Aug 2018 08:35:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:34:56 -0700
Message-Id: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH 01/27] binutils: Security fix CVE-2017-12967
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:23 -0000

From: Armin Kuster <akuster@mvista.com>

affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-12967.patch         | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index b29b75a..12b579c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://CVE-2017-12967.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch
new file mode 100644
index 0000000..ab19d21
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch
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
+Upstream-Status: backport
+Affects binutls <= 2.29.1
+CVE:  CVE-2017-12967 
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


