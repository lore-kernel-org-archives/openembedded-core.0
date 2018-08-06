Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5832C7545B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:19 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id w126-v6so22522231oie.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=hodgHFA0nHDrfv3NYwgH3ZvaePZuS5LEBUYVcU6Kof4=;
	b=upSYFDCxH0ThRXSdWy5gtGoeEXHyRkkHwHOddxxqR+jQm8JBHIDsICeFrWFycDHadC
	Mgtaqs2CM34UUWeVMsy+w17gYyNhb7pZu1ag59FExdIjbtcyCU4NMqoEpzHiMeLSB+N/
	loiQ6oUJ8stKjb7kmvimW4wxk93xvIFNd8PR2bp2asKeyvdq/y9XD79eTxA65OTqfFFp
	SFPqycq1UhLsws8+0Hodhs8msUi0jhFxK2R0r7oW+Myz9dK/WXmRivJenWHJJaIzAu6h
	OFbTn4GvYKaFPc9NMH2UcIBh9YZ2PJK/iIo10DHiSt7xOJC99dbzawlrqxo3yjX28X3V
	nbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hodgHFA0nHDrfv3NYwgH3ZvaePZuS5LEBUYVcU6Kof4=;
	b=D6wm0rKfljsrI/cWU1tmMrIMqsL2VD2vKr+smVk4enKGTHjyJ/sdxHy/BnjTRXJ2/2
	Ty8VDhxL+dySF1enoYPHS057cc5PZUUD7ZBWenodELN5lyOs8gZ+gKOfbx6Qu6Av7tq4
	Bp4/27l4xr3ON95t+W4u8bgE63tdPpw2eO8IazQPU+k6zrMAJRsMFlymmxPwsCZYN9aC
	0cjjRuVEmUMr9t/ZpWbiukzEqCu0dhARiFxFGyqNU33W+EnqUbPEjspUJqYJgeHXQREm
	kjBwx1xg08nMhqPWcK99FSwkYp3WsMS49sdBUPzwuj1GBf/pju0d7AKxHLn9EZBMkn2T
	AEmQ==
X-Gm-Message-State: AOUpUlHdBy8ORExZ5n8vTzgFdcCdj+Xy2zWjC7cOOuxwHmVJlgilMa7J
	QMEW3PoQHsZPUYq8ywjQJMFhVoSz
X-Google-Smtp-Source: AAOMgpcml3frwrop1mSjiv3dpuYJDB12sWSVftfq729FM8KhJVobPwl1JrsCx69oYFlLPuzl2SS5+Q==
X-Received: by 2002:aca:bf88:: with SMTP id
	p130-v6mr13704233oif.344.1533565760366; 
	Mon, 06 Aug 2018 07:29:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:07 -0700
Message-Id: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [SUMO][PATCH 01/12] binutils: Security fix CVE-2018-8945
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:19 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-8945.patch          | 70 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 9c883ac..349fa5a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://CVE-2018-8945.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch
new file mode 100644
index 0000000..6a43168
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch
@@ -0,0 +1,70 @@
+From 95a6d23566165208853a68d9cd3c6eedca840ec6 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 8 May 2018 12:51:06 +0100
+Subject: [PATCH] Prevent a memory exhaustion failure when running objdump on a
+ fuzzed input file with corrupt string and attribute sections.
+
+	PR 22809
+	* elf.c (bfd_elf_get_str_section): Check for an excessively large
+	string section.
+	* elf-attrs.c (_bfd_elf_parse_attributes): Issue an error if the
+	attribute section is larger than the size of the file.
+
+Upsteram-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-8945
+Signed-off-by: Armin kuster <akuster@mvista.com>
+---
+ bfd/ChangeLog   | 8 ++++++++
+ bfd/elf-attrs.c | 9 +++++++++
+ bfd/elf.c       | 1 +
+ 3 files changed, 18 insertions(+)
+
+Index: git/bfd/elf-attrs.c
+===================================================================
+--- git.orig/bfd/elf-attrs.c
++++ git/bfd/elf-attrs.c
+@@ -438,6 +438,15 @@ _bfd_elf_parse_attributes (bfd *abfd, El
+   /* PR 17512: file: 2844a11d.  */
+   if (hdr->sh_size == 0)
+     return;
++  if (hdr->sh_size > bfd_get_file_size (abfd))
++    {
++      /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: error: attribute section '%pA' too big: %#llx"),
++			  abfd, hdr->bfd_section, (long long) hdr->sh_size);
++      bfd_set_error (bfd_error_invalid_operation);
++      return;
++    }
++
+   contents = (bfd_byte *) bfd_malloc (hdr->sh_size + 1);
+   if (!contents)
+     return;
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -298,6 +298,7 @@ bfd_elf_get_str_section (bfd *abfd, unsi
+       /* Allocate and clear an extra byte at the end, to prevent crashes
+ 	 in case the string table is not terminated.  */
+       if (shstrtabsize + 1 <= 1
++	  || shstrtabsize > bfd_get_file_size (abfd)
+ 	  || bfd_seek (abfd, offset, SEEK_SET) != 0
+ 	  || (shstrtab = (bfd_byte *) bfd_alloc (abfd, shstrtabsize + 1)) == NULL)
+ 	shstrtab = NULL;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2018-05-08  Nick Clifton  <nickc@redhat.com>
++
++       PR 22809
++       * elf.c (bfd_elf_get_str_section): Check for an excessively large
++       string section.
++       * elf-attrs.c (_bfd_elf_parse_attributes): Issue an error if the
++       attribute section is larger than the size of the file.
++
+ 2018-02-07  Alan Modra  <amodra@gmail.com>
+ 
+ 	Revert 2018-01-17  Alan Modra  <amodra@gmail.com>
-- 
2.7.4


