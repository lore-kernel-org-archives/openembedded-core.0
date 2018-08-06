Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id E6470753E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:25 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id n21-v6so22580552oig.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5JN3zZcPxe5jwOc0JWHdQP0WX3UBy9YZot761paiNn8=;
	b=IAAfnIcEIGpLlpgdR1BxhU5ozftJ3ThX4+S/bI+UXEBI2eiZQcV0TyG4yyOtWwW7Lq
	z9ANLSeGJXmwiOo2L2cT2j+rDCIk0gaQ2OarLIJ+1onRFFaTDmFZ730yOcC0qkL5qeSO
	IEv9b3Q3rtzsvPFTBinRUP0p7Aphx1UCT7au6Tm9agMHDGciNwLwkw7sz5QcP1ZjVvEd
	M0tX+JyxA1mGbuW0aYWwkXC6l61rgxMbBhfpgtmrWX7/5Txe11VSXKhQoFboci3xwjKB
	Zp2JHkdLbQrmK6BssJm2WSDAaP+fX+9a+OyNy6hYhmNKwq/FSo8t0q8GIC7S5ASnmejL
	0LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5JN3zZcPxe5jwOc0JWHdQP0WX3UBy9YZot761paiNn8=;
	b=W4xdZaEFDxZANtPe5cHpCz7v+6N2X8tBMjnNjURyUBjZlMzjQs6tnX6Yu17DC25734
	c2tLYG/hH6GC1zZxVPELDCXnbJHxBVgAZpgqA+qnQExayK4ltrCKsvtyngCbHvVHV3H0
	YiI8q2DYQxX1mLaXUSWkHfQu1N94axIWFB0ZOIFbPfqIZ1L5fLSgrb31uvp3/KaUvpV+
	zDWFRojGN1F31NPl9lPodUeO8GDW5ZK/yjRwNu6gAF1XqNAc0k5hUXstnQiUP1hcdvtY
	hW4gFCbLU6tCYHBQjM1QJ2iYAzmsl4Me+YMOpGUPlBCm4VpQ5bweWpsetDqxHsRGA4aJ
	CMXw==
X-Gm-Message-State: AOUpUlE3/lekbywB6CMaQ01lEyLqQHDDfIia072sqjwABBEVOSYJh4ws
	pfi+ZZ95y0uXW13y/5ZsY5PP/5vU
X-Google-Smtp-Source: AAOMgpfsokE8/PTABsC6cnnhgM57ceg+71ZB9dl/AAP6W1yHPvAb2ZZiEuD0QuYujtv7WW0AnsmK1w==
X-Received: by 2002:aca:c355:: with SMTP id
	t82-v6mr15595585oif.327.1533565766830; 
	Mon, 06 Aug 2018 07:29:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:13 -0700
Message-Id: <1533565758-2467-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 07/12] binutls: Security fix CVE-2018-7569
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:26 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |   1 +
 .../binutils/binutils/CVE-2018-7569.patch          | 119 +++++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 3a39d5f..32eb44e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://CVE-2018-6759.patch \
      file://CVE-2018-7642.patch \
      file://CVE-2018-7208.patch \
+     file://CVE-2018-7569.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch
new file mode 100644
index 0000000..96c0fd2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch
@@ -0,0 +1,119 @@
+From 12c963421d045a127c413a0722062b9932c50aa9 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 28 Feb 2018 11:50:49 +0000
+Subject: [PATCH] Catch integer overflows/underflows when parsing corrupt DWARF
+ FORM blocks.
+
+	PR 22895
+	PR 22893
+	* dwarf2.c (read_n_bytes): Replace size parameter with dwarf_block
+	pointer.  Drop unused abfd parameter.  Check the size of the block
+	before initialising the data field.  Return the end pointer if the
+	size is invalid.
+	(read_attribute_value): Adjust invocations of read_n_bytes.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-7569
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ bfd/ChangeLog |  8 ++++++++
+ bfd/dwarf2.c  | 36 +++++++++++++++++++++---------------
+ 2 files changed, 29 insertions(+), 15 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -622,14 +622,24 @@ read_8_bytes (bfd *abfd, bfd_byte *buf,
+ }
+ 
+ static bfd_byte *
+-read_n_bytes (bfd *abfd ATTRIBUTE_UNUSED,
+-	      bfd_byte *buf,
+-	      bfd_byte *end,
+-	      unsigned int size ATTRIBUTE_UNUSED)
+-{
+-  if (buf + size > end)
+-    return NULL;
+-  return buf;
++read_n_bytes (bfd_byte *           buf,
++	      bfd_byte *           end,
++	      struct dwarf_block * block)
++{
++  unsigned int  size = block->size;
++  bfd_byte *    block_end = buf + size;
++
++  if (block_end > end || block_end < buf)
++    {
++      block->data = NULL;
++      block->size = 0;
++      return end;
++    }
++  else
++    {
++      block->data = buf;
++      return block_end;
++    }
+ }
+ 
+ /* Scans a NUL terminated string starting at BUF, returning a pointer to it.
+@@ -1127,8 +1137,7 @@ read_attribute_value (struct attribute *
+ 	return NULL;
+       blk->size = read_2_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 2;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_block4:
+@@ -1138,8 +1147,7 @@ read_attribute_value (struct attribute *
+ 	return NULL;
+       blk->size = read_4_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 4;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_data2:
+@@ -1179,8 +1187,7 @@ read_attribute_value (struct attribute *
+       blk->size = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
+ 					 FALSE, info_ptr_end);
+       info_ptr += bytes_read;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_block1:
+@@ -1190,8 +1197,7 @@ read_attribute_value (struct attribute *
+ 	return NULL;
+       blk->size = read_1_byte (abfd, info_ptr, info_ptr_end);
+       info_ptr += 1;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_data1:
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -6,6 +6,14 @@
+ 
+ 2018-02-28  Alan Modra  <amodra@gmail.com>
+ 
++       PR 22895
++       PR 22893
++       * dwarf2.c (read_n_bytes): Replace size parameter with dwarf_block
++       pointer.  Drop unused abfd parameter.  Check the size of the block
++       before initialising the data field.  Return the end pointer if the
++       size is invalid.
++       (read_attribute_value): Adjust invocations of read_n_bytes.
++
+        PR 22887
+        * aoutx.h (swap_std_reloc_in): Correct r_index bound check.
+ 
-- 
2.7.4


