Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7B73753E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:29 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id k12-v6so22495940oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UAsnQupM18iTLZi1d7t1c/VbBfwmzmIx4+TzfMqqP8I=;
	b=TZ6zlxFY4OipU3xsmycbpqObYM7BRvG4FsWbpi8HtERtccAgIoyyaXO87llWNUYBIQ
	L0f3xAHFrt/nU8lLVkwm1zStvLNLDkIs8sRcR78nJAKcNLQxJ37wsuUN6YJiuhMIYVS7
	AUoYZYAtoMEo9ipPrWbskPDMQ3OPMGHIyQ/9hEWbS6KfcSyrbILMaZMSTdR2AHGIDczX
	7pGRVggvFq7ZSsIgCvIri6I0dUkR/2704jliwPbYt+pLJkH+vOgtv0cUE6i2qgo5IanB
	XTxMpoBseoHOaudn2oTv5QCbSIov+NMsxLIYCu27kJVFdjX/0zYyqKku2GK0B5HmQU+F
	OZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UAsnQupM18iTLZi1d7t1c/VbBfwmzmIx4+TzfMqqP8I=;
	b=Qa1LzD5MhrJvQ8JeV+alCUpBw+qE/UvG7S2ykOXGGejNFQY1WzeubE2lt0Z3XoWw4V
	s6qcLaHEOHbjSleR2aeGTdABaQ5buKlv1Qr7VjaVXM5JLuofRtJ4E/EiVrEOjPlTX6g8
	Da4c0kfu7R7o3eGxQqiZFMAKRxhDgvaKsQrzbwV+dLFIzJrnkaXR6njT6vSNUQxC1tdQ
	hTyYE2r3BPKEYcw22fr9vEZ5JySJxqx2BlfmutuDaxK1VZpZDKinh4h2FtcnyOwLvKd0
	EZaBQPtJw2zsimGf0l9Uu7pVz6nO7zPzLrQGUoRfQguB1anaNJ405eBVqFR5pzRArVwY
	9DlA==
X-Gm-Message-State: AOUpUlG/WCjsKkaREeKJ6fVwnz00WR3EcV0kN0G24LddJ+7YlYNydghn
	W5HZnqHlhNLWtHFFR8KsG/o=
X-Google-Smtp-Source: AA+uWPwgWQgr/qewY8+lvKevoqyJ8ELc7Q/pOfYYJan9bKf995e0/Z+7R5paXeQyAP/fhs8BCEv5Ug==
X-Received: by 2002:aca:5354:: with SMTP id
	h81-v6mr13646382oib.299.1533565771024; 
	Mon, 06 Aug 2018 07:29:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:17 -0700
Message-Id: <1533565758-2467-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 11/12] binutls: Security fix CVE-2018-10535
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:30 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-10535.patch         | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 8693757..f8ac1ca 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://CVE-2018-7568.patch \
      file://CVE-2018-10373.patch \
      file://CVE-2018-10372.patch \
+     file://CVE-2018-10535.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch
new file mode 100644
index 0000000..fa8fbd2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch
@@ -0,0 +1,61 @@
+From db0c309f4011ca94a4abc8458e27f3734dab92ac Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 24 Apr 2018 16:57:04 +0100
+Subject: [PATCH] Fix an illegal memory access when trying to copy an ELF
+ binary with corrupt section symbols.
+
+	PR 23113
+	* elf.c (ignore_section_sym): Check for the output_section pointer
+	being NULL before dereferencing it.
+
+Upstream-Status: Backport
+CVE: CVE-2018-10535
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 4 ++++
+ bfd/elf.c     | 9 ++++++++-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -4021,15 +4021,22 @@ ignore_section_sym (bfd *abfd, asymbol *
+ {
+   elf_symbol_type *type_ptr;
+ 
++  if (sym == NULL)
++    return FALSE;
++
+   if ((sym->flags & BSF_SECTION_SYM) == 0)
+     return FALSE;
+ 
++  if (sym->section == NULL)
++    return TRUE;
++
+   type_ptr = elf_symbol_from (abfd, sym);
+   return ((type_ptr != NULL
+ 	   && type_ptr->internal_elf_sym.st_shndx != 0
+ 	   && bfd_is_abs_section (sym->section))
+ 	  || !(sym->section->owner == abfd
+-	       || (sym->section->output_section->owner == abfd
++	       || (sym->section->output_section != NULL
++		   && sym->section->output_section->owner == abfd
+ 		   && sym->section->output_offset == 0)
+ 	       || bfd_is_abs_section (sym->section)));
+ }
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2018-04-24  Nick Clifton  <nickc@redhat.com>
++
++       PR 23113
++       * elf.c (ignore_section_sym): Check for the output_section pointer
++       being NULL before dereferencing it.
++
+ 2018-04-17  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 23065
-- 
2.7.4


