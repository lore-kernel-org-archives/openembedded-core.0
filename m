Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D47578D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:31 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id j205-v6so6437437oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DtFitaaPriL09SYC6NZ5znF7bkOSjeoWlccvlpe1pkU=;
	b=ST/k10yAHs3Tdol3xbvzsAgFep3CISmjBybOHpf1y41ZC66BgQ/MLVudiMwpKpdE2W
	koHgPgc49KY9YbdDx7ORPr7adoeTR1WWeJs51RKeCX1pTdvzNK/TkEgASI/aPciEmbez
	9aJOFR0Heg42J9ZsFG6AEh3wu5qjOwEJ18skeXsZ05/wStfgqlHC4iHHMlWI6Qpmot7M
	Klk7jdQ/GiIJYMXqjFRP8JJ6tBX9kTESztmVVMosZ8HBvdg3B7uX5zRKteBFIzK99+/Y
	znE4/g3LDcZTb91K1dWWxaYNdWjLxXnMnG75K8n8hpIbZn6Z6S4ODVuI072vEVnF+2Hm
	KSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DtFitaaPriL09SYC6NZ5znF7bkOSjeoWlccvlpe1pkU=;
	b=rUaFkWTtXz4GhY822ITosNgPUtCEAzU54lORGXmF57qBSuAiSPcdd6h9sA8WY6V9W+
	mdMC4Q/4ZdcHSDXjT2OYHJNmngakgs5d/v6X8+6JDQCfaO/gxbZmLa9BNu9M9LANkzoP
	GQuj/xC9MHEaa2rofGxFzKprMqC8oJMlA9L3dlrutUJrJfVrGLo2/fSS6hSQ07V/xT0E
	+/0h4Qt/7DbNRgKxPRInRDuTXZr9toPI39gvhSCq/Fu4JJdoAf3ikYDrPrk6MhZdlS4t
	2O0c7+9oIGHi+wI9sQfJWGdshdHDlLz6o87k/GmxqV3W/usVCOR/07gn9hc4mrhNrvne
	sGbw==
X-Gm-Message-State: AOUpUlHLde1FL7bvt/j3OkF2sbRPqRMjZWLALibOrqAB+RKbTfyWPeV2
	Zu6uYamFSl21y10IvlNiX1I=
X-Google-Smtp-Source: AA+uWPzf9OpuZMr3ApJ/vLlk/G9TnD02Gv7PX+MTSLx/jYdxXDNiS4lpau7GDi+sHVXGp3ZydgGR1A==
X-Received: by 2002:aca:3110:: with SMTP id
	x16-v6mr4516458oix.126.1533765272211; 
	Wed, 08 Aug 2018 14:54:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:18 -0700
Message-Id: <1533765259-10091-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 11/12] Binutils: Security fix for CVE-2018-7569
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:31 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   1 +
 .../binutils/binutils/CVE-2018-7569.patch          | 120 +++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index ceb8e85..cfde35c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
      file://CVE-2018-7208.patch \
      file://CVE-2018-7568_p1.patch \
      file://CVE-2018-7568_p2.patch \
+     file://CVE-2018-7569.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch
new file mode 100644
index 0000000..e77118b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7569.patch
@@ -0,0 +1,120 @@
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
+Affects: <= 2.30
+CVE: CVE-2018-7569
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  8 ++++++++
+ bfd/dwarf2.c  | 36 +++++++++++++++++++++---------------
+ 2 files changed, 29 insertions(+), 15 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -649,14 +649,24 @@ read_8_bytes (bfd *abfd, bfd_byte *buf,
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
+@@ -1154,8 +1164,7 @@ read_attribute_value (struct attribute *
+ 	return NULL;
+       blk->size = read_2_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 2;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_block4:
+@@ -1165,8 +1174,7 @@ read_attribute_value (struct attribute *
+ 	return NULL;
+       blk->size = read_4_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 4;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_data2:
+@@ -1206,8 +1214,7 @@ read_attribute_value (struct attribute *
+       blk->size = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
+ 					 FALSE, info_ptr_end);
+       info_ptr += bytes_read;
+-      blk->data = read_n_bytes (abfd, info_ptr, info_ptr_end, blk->size);
+-      info_ptr += blk->size;
++      info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+     case DW_FORM_block1:
+@@ -1217,8 +1224,7 @@ read_attribute_value (struct attribute *
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
+@@ -1,4 +1,14 @@
+ 2018-02-28  Nick Clifton  <nickc@redhat.com>
++ 
++       PR 22895
++       PR 22893
++       * dwarf2.c (read_n_bytes): Replace size parameter with dwarf_block
++       pointer.  Drop unused abfd parameter.  Check the size of the block
++       before initialising the data field.  Return the end pointer if the
++       size is invalid.
++       (read_attribute_value): Adjust invocations of read_n_bytes.
++
++2018-02-28  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22894
+        * dwarf1.c (parse_die): Check the length of form blocks before
-- 
2.7.4


