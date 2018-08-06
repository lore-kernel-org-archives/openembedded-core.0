Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD1CF78860
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:26 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id m11-v6so22578430oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8ncOzPzAWllASDozf96R3QIHtQT5AV16z0zpkzeeiIQ=;
	b=sDnt+26idkXdO2qqN4/Hk7wI3J6VxwSEwQ0BgOflfqfZ3O5j5KLI599YAcmtkgybZh
	dNe1yH9jEy0xf94XS2LTFWHTyhGXS1YKp/3Np1/xVmfEEVsta3oOJRBNh16LVEj8p210
	8NIvpnp+MQXYIKFls0Nlzo59jM+exFLz/dtrRflc0TjH1mvVX02dVQGqzAVWnZyuG3lW
	vXWzO46cj0fZwrKmFVg1HJLEnhF9r6tz+xyFe375pKLAIQv5vqnofxO53jEn9lwBe63G
	lArY6DnuIO+ccevvYVbb56JL9yHuDJOOded0f47LIKBe5LDI96PKbsQU/qsEe87bOEYH
	qgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8ncOzPzAWllASDozf96R3QIHtQT5AV16z0zpkzeeiIQ=;
	b=N2MrZe3vUifspz09JJp52WAe7GSz3mo+1wx7ks3hEyem+c8bU8p9DxydEfkKMRmSTa
	s/nhccM5Hi+lCS0V64UuS3c4ib7YNGIwJRCSmNxlyRf2sn/w1WUaHMvMyjnSgcmRPnIC
	4U8eR52cWk3D9bqP7HOwV2EiPYh4kROF7amShmgMVeq8nq9Gd6G6APww0RIoaQMnu0wB
	gJ1EsLm3t4nMBVRxrnwB7xidcxSXd1O1XT+EL01a2vOyNiZYlktsFDssW23/SjjlBgke
	UtepLRhXMmr1VjsVC1jD1xyGwO0H6tosN7P/RrSxWmDXROY2R+Q0Ma3OihuqnCty3ZbV
	dZqw==
X-Gm-Message-State: AOUpUlGxnsyMA3uLiKiq68GmbZUHEGaLhZjltGCMVW1faR1KqhU3Vs8p
	jPxDLFWdGEQjd3bZmH5vi9s6a/Sx
X-Google-Smtp-Source: AAOMgpfS7XJdQTEClP87R5IjA/1b2MwAFH19+OPrqsP9fu6SU+gh3pZBKhMUcvKT4UrBHYZqzjDj5g==
X-Received: by 2002:aca:bf88:: with SMTP id
	p130-v6mr13704645oif.344.1533565767785; 
	Mon, 06 Aug 2018 07:29:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:14 -0700
Message-Id: <1533565758-2467-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 08/12] binutls: Security fix CVE-2018-7568
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
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-7568.patch          | 85 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7568.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 32eb44e..8995715 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -42,6 +42,7 @@ SRC_URI = "\
      file://CVE-2018-7642.patch \
      file://CVE-2018-7208.patch \
      file://CVE-2018-7569.patch \
+     file://CVE-2018-7568.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7568.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7568.patch
new file mode 100644
index 0000000..815b32c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7568.patch
@@ -0,0 +1,85 @@
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
+Affects: Binutils <= 2.30
+CVE: CVE-2018-7568
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
+@@ -213,6 +213,7 @@ parse_die (bfd *	     abfd,
+   /* Then the attributes.  */
+   while (xptr + 2 <= aDiePtrEnd)
+     {
++      unsigned int   block_len;
+       unsigned short attr;
+ 
+       /* Parse the attribute based on its form.  This section
+@@ -255,12 +256,24 @@ parse_die (bfd *	     abfd,
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
+@@ -4,7 +4,11 @@
+        * coffgen.c (coff_pointerize_aux): Ensure auxent tagndx is in
+        range before converting to a symbol table pointer.
+ 
+-2018-02-28  Alan Modra  <amodra@gmail.com>
++2018-02-28  Nick Clifton  <nickc@redhat.com>
++
++       PR 22894
++       * dwarf1.c (parse_die): Check the length of form blocks before
++       advancing the data pointer.
+ 
+        PR 22895
+        PR 22893
+@@ -14,6 +18,8 @@
+        size is invalid.
+        (read_attribute_value): Adjust invocations of read_n_bytes.
+ 
++2018-02-28  Alan Modra  <amodra@gmail.com>
++
+        PR 22887
+        * aoutx.h (swap_std_reloc_in): Correct r_index bound check.
+ 
-- 
2.7.4


