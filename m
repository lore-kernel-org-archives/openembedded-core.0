Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89AEA78D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:25 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id s198-v6so6374500oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mIiKQa1rUdszpAjwdwDFw4Mgs/ogrqdOSGme3gIkle0=;
	b=c3WfWx2WVvoXq+4BAFcWDI2v5kHSQfQQghkRwpsQU6/GEy8WIHN0sVDw/dC/NFKoiF
	YgXCvaT8Qu2MDNvCbb2imURiKCuo4mBQZ/KjTdyp+tsSwP7i/G8w/RAjoJfC69n0xDE8
	Mqp5/qTZZR+eQfUNdQ+xLmvCeXHARS2xA+fQYta1Cp/O2axUe3s6Qxrad0ci8wrleFXa
	HFbaqkpeX9ZCw13q+DzSBjqLDRhwrsRTWFSQ3GY6nQ3QtYXWOxS/G/PnQ0I8pjcXHWBg
	lbXTCsZph+536HbaW2r0mzQihp+ccfTZ+CzU41HUjJPCcDit0kuKSM2amsKMkz33FuPK
	yIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mIiKQa1rUdszpAjwdwDFw4Mgs/ogrqdOSGme3gIkle0=;
	b=hYSY/VU199WRX7BvE9T1aExsYbzYmagh6hNfZll5y6dKM7OS9ypNmVGFs2SLrvVOf6
	KcroH0rmFzfufSZ1gtyDnDO7cVyZLK4jy4TRtJYFEW5ov+0GL1tLxoqHVBms1tKcSbdY
	1zHlSV1aUDq8FrFihxevsSwHC2BplkN06tZ5KDyFYjaUxKo4Qk3wxDNWUxTKvatXDgIx
	SwA14ssIi87l6khw6nch1fVV0isDArDeJivGJxPftTdpAULBvO08uxmndTprULqAMRzQ
	ReVUh18MwjMCX9Awr4WObDsw//QyKEtTOuOrZhSpckZI9S1tBo/CIIPdqy4MVIxeyn6+
	pAUA==
X-Gm-Message-State: AOUpUlGCzs3PYxbQQA5ma1zVb45+qeQeodlbYgB92jjDiBzQ8oIbHRT6
	yrMSI3INAEemjsVeVEyydCs=
X-Google-Smtp-Source: AA+uWPxU2kHnp84sgWJEfX9kI2p+Yq7A8BTql0TFNucGDJaQPv2M06n07Jzw34V3Dfq0Fu15JyeTEA==
X-Received: by 2002:aca:7203:: with SMTP id
	p3-v6mr4395882oic.194.1533765266596; 
	Wed, 08 Aug 2018 14:54:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:12 -0700
Message-Id: <1533765259-10091-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 05/12] Binutils: Security fix for CVE-2018-10535
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:25 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-10535.patch         | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index ab61745..4d9983b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -68,6 +68,7 @@ SRC_URI = "\
      file://CVE-2018-10372.patch \
      file://CVE-2018-10373.patch \
      file://CVE-2018-10534.patch \
+     file://CVE-2018-10535.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch
new file mode 100644
index 0000000..29b8343
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-10535.patch
@@ -0,0 +1,63 @@
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
+Affects: <= 2.30
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
+@@ -3994,15 +3994,22 @@ ignore_section_sym (bfd *abfd, asymbol *
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
+@@ -1,4 +1,10 @@
+ 2018-04-24  Nick Clifton  <nickc@redhat.com>
++ 
++       PR 23113
++       * elf.c (ignore_section_sym): Check for the output_section pointer
++       being NULL before dereferencing it.
++
++2018-04-24  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 23110
+        * peXXigen.c (_bfd_XX_bfd_copy_private_bfd_data_common): Check for
-- 
2.7.4


