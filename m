Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6F74FD5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:20 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id b16-v6so9165583oic.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sSfb+INFnMoZrSTQHD9qz80IMfIkCmSLWWy0vHpj1qA=;
	b=U1aO9R9b29/nDJIPEVZN+5MYQzBPVGprghYJWwzKuMtQSEMBVQ8heLILoKl4pRknQo
	WHoUKeoqvgy/mkbIOsD9rucxolXCCtkFMkacDF/WDET6dV4mx/Xt8f6yAZlNIbmuhMLF
	ylwkbs2dq9LinP8klMKimWevaPfs+Bmgovm4uMORz30juaQP0g8IjWXOWovZ6lWxF3HV
	yduu3Qvt0t4KOuNmuOv1ELvbpxLlG3n+b1ajx6pv6pIOj2xBwmbePuWYwNGzX84crjVc
	c2S3QQ29vG1Q6qCRFbFfU2XGNJnZJ2QWyWC3bJKs8KZ/W+Aszb4+HqNOajqGJHFJO1qZ
	7JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sSfb+INFnMoZrSTQHD9qz80IMfIkCmSLWWy0vHpj1qA=;
	b=J1VfY4WK47zR8WVWThAwNoIYTiETi3hklslhuDazJAySfytffrwDLN1W0yS0ViNwp/
	m39slqyqr5SJWJlMEQFX2rmWTDCncvv484gjuPkp/48iWxxO4JaLv3HGWsr3MxL+Mq3C
	FDgw1bBJ+TeC8gpdSA8RXcGd0Buf0Tht8Zztz5ZpWDKoQ9qZUQEb0kPxofOZscpE/GpT
	RTwBEG2StDkqpPp3GFz5g1rP747HR7BSG9aNwukbPfRYXPQDj0GM0IPb3Ed6e/P2ZNKU
	Jn3K8u0PldDVVPZ0q85LyyHG19CKoYyz36wIFLEkjZIeK7lWV6XFD0WurWeyaeNU5Q6M
	wWqA==
X-Gm-Message-State: AOUpUlG2MKhP8cMZxOneVOfuqn32Qh+vV7VCF295pBDBkDvog273+LWT
	cXRK+kJDmYWmpajF8YTFCQ8=
X-Google-Smtp-Source: AA+uWPwTTmovYralUHgy0Xc2D6RNrOom68sFhR4n1mdImHMWBjpsLPfTeOQ0DlClFyX0u5T48Ndl6g==
X-Received: by 2002:aca:90d:: with SMTP id 13-v6mr1925835oij.300.1533565761559;
	Mon, 06 Aug 2018 07:29:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:08 -0700
Message-Id: <1533565758-2467-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 02/12] binutls: Security fix CVE-2018-7643
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:20 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |   1 +
 .../binutils/binutils/CVE-2018-7643.patch          | 102 +++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7643.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 349fa5a..1952d46 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -36,6 +36,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://CVE-2018-8945.patch \
+     file://CVE-2018-7643.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7643.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7643.patch
new file mode 100644
index 0000000..2a2dec3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7643.patch
@@ -0,0 +1,102 @@
+From d11ae95ea3403559f052903ab053f43ad7821e37 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 1 Mar 2018 16:14:08 +0000
+Subject: [PATCH] Prevent illegal memory accesses triggerd by intger overflow
+ when parsing corrupt DWARF information on a 32-bit host.
+
+	PR 22905
+	* dwarf.c (display_debug_ranges): Check that the offset loaded
+	from the range_entry structure is valid.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-7643
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/dwarf.c   | 15 +++++++++++++++
+ 2 files changed, 21 insertions(+)
+
+Index: git/binutils/dwarf.c
+===================================================================
+--- git.orig/binutils/dwarf.c
++++ git/binutils/dwarf.c
+@@ -387,6 +387,9 @@ read_uleb128 (unsigned char * data,
+     }								\
+   while (0)
+ 
++/* Read AMOUNT bytes from PTR and store them in VAL as an unsigned value.
++   Checks to make sure that the read will not reach or pass END
++   and that VAL is big enough to hold AMOUNT bytes.  */
+ #define SAFE_BYTE_GET(VAL, PTR, AMOUNT, END)	\
+   do						\
+     {						\
+@@ -415,6 +418,7 @@ read_uleb128 (unsigned char * data,
+     }						\
+   while (0)
+ 
++/* Like SAFE_BYTE_GET, but also increments PTR by AMOUNT.  */
+ #define SAFE_BYTE_GET_AND_INC(VAL, PTR, AMOUNT, END)	\
+   do							\
+     {							\
+@@ -423,6 +427,7 @@ read_uleb128 (unsigned char * data,
+     }							\
+   while (0)
+ 
++/* Like SAFE_BYTE_GET, but reads a signed value.  */
+ #define SAFE_SIGNED_BYTE_GET(VAL, PTR, AMOUNT, END)	\
+   do							\
+     {							\
+@@ -441,6 +446,7 @@ read_uleb128 (unsigned char * data,
+     }							\
+   while (0)
+ 
++/* Like SAFE_SIGNED_BYTE_GET, but also increments PTR by AMOUNT.  */
+ #define SAFE_SIGNED_BYTE_GET_AND_INC(VAL, PTR, AMOUNT, END)	\
+   do								\
+     {								\
+@@ -6543,6 +6549,7 @@ display_debug_ranges_list (unsigned char
+ 	break;
+       SAFE_SIGNED_BYTE_GET_AND_INC (end, start, pointer_size, finish);
+ 
++      
+       printf ("    %8.8lx ", offset);
+ 
+       if (begin == 0 && end == 0)
+@@ -6810,6 +6817,13 @@ display_debug_ranges (struct dwarf_secti
+ 	  continue;
+ 	}
+ 
++      if (next < section_begin || next >= finish)
++	{
++	  warn (_("Corrupt offset (%#8.8lx) in range entry %u\n"),
++		(unsigned long) offset, i);
++	  continue;
++	}
++
+       if (dwarf_check != 0 && i > 0)
+ 	{
+ 	  if (start < next)
+@@ -6825,6 +6839,7 @@ display_debug_ranges (struct dwarf_secti
+ 		    (unsigned long) (next - section_begin), section->name);
+ 	    }
+ 	}
++
+       start = next;
+       last_start = next;
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2018-03-01  Nick Clifton  <nickc@redhat.com>
++
++       PR 22905
++       * dwarf.c (display_debug_ranges): Check that the offset loaded
++       from the range_entry structure is valid.
++
+ 2018-05-08  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22809
-- 
2.7.4


