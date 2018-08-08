Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4840B78D97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:30 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id j205-v6so6437393oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fprVEXs43a8tKGePUumZMM739o+QPQTcPhOST6poCd4=;
	b=i8yWG1RagHZoZLmA/+Gd6ryrFyNLPSxypgb4pZjFzvakFQ6mTpLEP8BFRvHoPt/Axz
	a1mI7mEqPL1wvCK7RgEzk6x2oHFIVrh54mYOJ7/jgqs1Kb1aNeGf0iLvcMlWJUKsQfX4
	8au8z1UjqFFqeI5ti5eq2PiQcdRAybhmL8Dv9P7HffM9B+GVT+F2b3kWWOi5Zkdv1DIV
	kq+9HgbtZKut6GMYGnUbm6AUTKopKl1+qJ8tqb6QGUO7z15uJbyLQz8xP+n35sdjRHSs
	YXYMhmKDfbpxeKJ8wfNgRDe5keC75SnB8M6BGCD/SFzf8cYcZzFjXlvoVS8EXhWlwzZc
	Ttcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fprVEXs43a8tKGePUumZMM739o+QPQTcPhOST6poCd4=;
	b=WcFFSHrPSwpUpBT2EpROMixb7+AUtHMLpAszbNKsNqtCq426Sb6GRIebA8vY08w4eg
	fE12IJvT/68WxzKEzHusuObeOHqi+03klVKI+Pg2YHs+kUX9CQMR3oAq27K9ziGW0EX6
	/BWDNPWkUZ/RZd4GZiMPROQUf5ZmHB015j2aSDFlzSNoz5m5pv+QFITreafTJJVnfIQd
	QIK6od89TTOMTwj+iYNgnXY7Ej5s3+q7EQH/7NQYGFBFMnd6djOstYCZwV3Ko+htYM1i
	coQB0l7FxGVEJvABJESr2BxnG1RNMGPVzbyN+kPHsOprR6dQR0Hl1no0Rvjn1PDv4SVS
	ej5Q==
X-Gm-Message-State: AOUpUlHV0imM0vO9zV9WlOLMusWkhNiDtLzxyI+ZIB0wcsUcyVRY6aK7
	5j8TVHxr7Ro9HHoaDIaiw9s=
X-Google-Smtp-Source: AA+uWPw5UeOrRPhrdg4NBm/G7XPFC5BKj5m5hChpzxy5ViugbE8TFbZyQhpqZGAz4fW/e/aQdifxKw==
X-Received: by 2002:aca:e510:: with SMTP id
	c16-v6mr4964894oih.44.1533765271397; 
	Wed, 08 Aug 2018 14:54:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:17 -0700
Message-Id: <1533765259-10091-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 10/12] Binutils: Security fix for CVE-2018-7568
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:30 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   2 +
 .../binutils/binutils/CVE-2018-7568_p1.patch       | 161 +++++++++++++++++++++
 .../binutils/binutils/CVE-2018-7568_p2.patch       |  73 ++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 13389a1..ceb8e85 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -73,6 +73,8 @@ SRC_URI = "\
      file://CVE-2018-6323.patch \
      file://CVE-2018-6759.patch \
      file://CVE-2018-7208.patch \
+     file://CVE-2018-7568_p1.patch \
+     file://CVE-2018-7568_p2.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p1.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p1.patch
new file mode 100644
index 0000000..b014080
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p1.patch
@@ -0,0 +1,161 @@
+From 1da5c9a485f3dcac4c45e96ef4b7dae5948314b5 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 25 Sep 2017 20:20:38 +0930
+Subject: [PATCH] PR22202, buffer overflow in parse_die
+
+There was a complete lack of sanity checking in dwarf1.c
+
+	PR 22202
+	* dwarf1.c (parse_die): Sanity check pointer against section limit
+	before dereferencing.
+	(parse_line_table): Likewise.
+
+Upstream-Status: Backport
+Affects: <= 2.30
+CVE: CVE-2018-7568 patch1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/dwarf1.c  | 56 ++++++++++++++++++++++++++++++++++++++------------------
+ 2 files changed, 45 insertions(+), 18 deletions(-)
+
+Index: git/bfd/dwarf1.c
+===================================================================
+--- git.orig/bfd/dwarf1.c
++++ git/bfd/dwarf1.c
+@@ -189,11 +189,14 @@ parse_die (bfd *             abfd,
+   memset (aDieInfo, 0, sizeof (* aDieInfo));
+ 
+   /* First comes the length.  */
+-  aDieInfo->length = bfd_get_32 (abfd, (bfd_byte *) xptr);
++  if (xptr + 4 > aDiePtrEnd)
++    return FALSE;
++  aDieInfo->length = bfd_get_32 (abfd, xptr);
+   xptr += 4;
+   if (aDieInfo->length == 0
+-      || (this_die + aDieInfo->length) >= aDiePtrEnd)
++      || this_die + aDieInfo->length > aDiePtrEnd)
+     return FALSE;
++  aDiePtrEnd = this_die + aDieInfo->length;
+   if (aDieInfo->length < 6)
+     {
+       /* Just padding bytes.  */
+@@ -202,18 +205,20 @@ parse_die (bfd *             abfd,
+     }
+ 
+   /* Then the tag.  */
+-  aDieInfo->tag = bfd_get_16 (abfd, (bfd_byte *) xptr);
++  if (xptr + 2 > aDiePtrEnd)
++    return FALSE;
++  aDieInfo->tag = bfd_get_16 (abfd, xptr);
+   xptr += 2;
+ 
+   /* Then the attributes.  */
+-  while (xptr < (this_die + aDieInfo->length))
++  while (xptr + 2 <= aDiePtrEnd)
+     {
+       unsigned short attr;
+ 
+       /* Parse the attribute based on its form.  This section
+          must handle all dwarf1 forms, but need only handle the
+ 	 actual attributes that we care about.  */
+-      attr = bfd_get_16 (abfd, (bfd_byte *) xptr);
++      attr = bfd_get_16 (abfd, xptr);
+       xptr += 2;
+ 
+       switch (FORM_FROM_ATTR (attr))
+@@ -223,12 +228,15 @@ parse_die (bfd *             abfd,
+ 	  break;
+ 	case FORM_DATA4:
+ 	case FORM_REF:
+-	  if (attr == AT_sibling)
+-	    aDieInfo->sibling = bfd_get_32 (abfd, (bfd_byte *) xptr);
+-	  else if (attr == AT_stmt_list)
++	  if (xptr + 4 <= aDiePtrEnd)
+ 	    {
+-	      aDieInfo->stmt_list_offset = bfd_get_32 (abfd, (bfd_byte *) xptr);
+-	      aDieInfo->has_stmt_list = 1;
++	      if (attr == AT_sibling)
++		aDieInfo->sibling = bfd_get_32 (abfd, xptr);
++	      else if (attr == AT_stmt_list)
++		{
++		  aDieInfo->stmt_list_offset = bfd_get_32 (abfd, xptr);
++		  aDieInfo->has_stmt_list = 1;
++		}
+ 	    }
+ 	  xptr += 4;
+ 	  break;
+@@ -236,22 +244,29 @@ parse_die (bfd *             abfd,
+ 	  xptr += 8;
+ 	  break;
+ 	case FORM_ADDR:
+-	  if (attr == AT_low_pc)
+-	    aDieInfo->low_pc = bfd_get_32 (abfd, (bfd_byte *) xptr);
+-	  else if (attr == AT_high_pc)
+-	    aDieInfo->high_pc = bfd_get_32 (abfd, (bfd_byte *) xptr);
++	  if (xptr + 4 <= aDiePtrEnd)
++	    {
++	      if (attr == AT_low_pc)
++		aDieInfo->low_pc = bfd_get_32 (abfd, xptr);
++	      else if (attr == AT_high_pc)
++		aDieInfo->high_pc = bfd_get_32 (abfd, xptr);
++	    }
+ 	  xptr += 4;
+ 	  break;
+ 	case FORM_BLOCK2:
+-	  xptr += 2 + bfd_get_16 (abfd, (bfd_byte *) xptr);
++	  if (xptr + 2 <= aDiePtrEnd)
++	    xptr += bfd_get_16 (abfd, xptr);
++	  xptr += 2;
+ 	  break;
+ 	case FORM_BLOCK4:
+-	  xptr += 4 + bfd_get_32 (abfd, (bfd_byte *) xptr);
++	  if (xptr + 4 <= aDiePtrEnd)
++	    xptr += bfd_get_32 (abfd, xptr);
++	  xptr += 4;
+ 	  break;
+ 	case FORM_STRING:
+ 	  if (attr == AT_name)
+ 	    aDieInfo->name = (char *) xptr;
+-	  xptr += strlen ((char *) xptr) + 1;
++	  xptr += strnlen ((char *) xptr, aDiePtrEnd - xptr) + 1;
+ 	  break;
+ 	}
+     }
+@@ -290,7 +305,7 @@ parse_line_table (struct dwarf1_debug* s
+     }
+ 
+   xptr = stash->line_section + aUnit->stmt_list_offset;
+-  if (xptr < stash->line_section_end)
++  if (xptr + 8 <= stash->line_section_end)
+     {
+       unsigned long eachLine;
+       bfd_byte *tblend;
+@@ -318,6 +333,11 @@ parse_line_table (struct dwarf1_debug* s
+ 
+       for (eachLine = 0; eachLine < aUnit->line_count; eachLine++)
+ 	{
++	  if (xptr + 10 > stash->line_section_end)
++	    {
++	      aUnit->line_count = eachLine;
++	      break;
++	    }
+ 	  /* A line number.  */
+ 	  aUnit->linenumber_table[eachLine].linenumber
+ 	    = bfd_get_32 (stash->abfd, (bfd_byte *) xptr);
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-09-25  Alan Modra  <amodra@gmail.com>
++
++       PR 22202
++       * dwarf1.c (parse_die): Sanity check pointer against section limit
++       before dereferencing.
++       (parse_line_table): Likewise.
++
+ 2018-01-29  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22741
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p2.patch
new file mode 100644
index 0000000..b5511d7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7568_p2.patch
@@ -0,0 +1,73 @@
+From eef104664efb52965d85a28bc3fc7c77e52e48e2 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 28 Feb 2018 10:13:54 +0000
+Subject: [PATCH] Fix potential integer overflow when reading corrupt dwarf1
+ debug information.
+
+	PR 22894
+	* dwarf1.c (parse_die): Check the length of form blocks before
+	advancing the data pointer.
+
+Upstream-Status: Backport
+Affects: <= 2.30
+CVE: CVE-2018-7568 patch2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  6 ++++++
+ bfd/dwarf1.c  | 17 +++++++++++++++--
+ 2 files changed, 21 insertions(+), 2 deletions(-)
+
+Index: git/bfd/dwarf1.c
+===================================================================
+--- git.orig/bfd/dwarf1.c
++++ git/bfd/dwarf1.c
+@@ -213,6 +213,7 @@ parse_die (bfd *             abfd,
+   /* Then the attributes.  */
+   while (xptr + 2 <= aDiePtrEnd)
+     {
++      unsigned int   block_len;
+       unsigned short attr;
+ 
+       /* Parse the attribute based on its form.  This section
+@@ -255,12 +256,24 @@ parse_die (bfd *             abfd,
+ 	  break;
+ 	case FORM_BLOCK2:
+ 	  if (xptr + 2 <= aDiePtrEnd)
+-	    xptr += bfd_get_16 (abfd, xptr);
++	    {
++	      block_len = bfd_get_16 (abfd, xptr);
++	      if (xptr + block_len > aDiePtrEnd
++		  || xptr + block_len < xptr)
++		return FALSE;
++	      xptr += block_len;
++	    }
+ 	  xptr += 2;
+ 	  break;
+ 	case FORM_BLOCK4:
+ 	  if (xptr + 4 <= aDiePtrEnd)
+-	    xptr += bfd_get_32 (abfd, xptr);
++	    {
++	      block_len = bfd_get_32 (abfd, xptr);
++	      if (xptr + block_len > aDiePtrEnd
++		  || xptr + block_len < xptr)
++		return FALSE;
++	      xptr += block_len;
++	    }
+ 	  xptr += 4;
+ 	  break;
+ 	case FORM_STRING:
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2018-02-28  Nick Clifton  <nickc@redhat.com>
++
++       PR 22894
++       * dwarf1.c (parse_die): Check the length of form blocks before
++       advancing the data pointer.
++
+ 2017-09-25  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22202
-- 
2.7.4


