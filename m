Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 734147F393
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:26:51 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u12so8591786pls.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0cZiUqLgLHv1Mi7Klf0bZxR2/5QNbYfaOAmFJZfLjs4=;
	b=S6codblRJLIH3sYerzUQCKKywwnUYH+XwRWwqT0C7uecTx0JMTfUIup2/WRgS/TvFk
	gueMsUsbWM6dkNA5dBg8vrLePbjYCzo2/UgZaK78qhxY+RaJTRj9maYKV/1rUKNXD4ge
	uqYWNSxOp5xM+KrlpCGUdg4hVx/kJoJ65gjKmKZ+IlMdcew58HrBB0WSIUH+fDL9QVGR
	KKmRgU3AlaN1GGt5X0M3fHhfJzGQr1Ek0JG1wKviFl2Strq63gfHMmD55dMJdadc+xNg
	yr0/ZFFF6t0Pqn5av3fSZKaEWZ0guWmBPw7eo4cWBk4DEJpMiE9IbATSbIBB3N26GniJ
	C9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0cZiUqLgLHv1Mi7Klf0bZxR2/5QNbYfaOAmFJZfLjs4=;
	b=JBTNS7TEvpuiY4Tu7jiPKU+Lff22k9k5uN18UkA/G0a+pIprMPslZ/Pz9Y5i0kG84v
	5SEn4B+grgfRjn6Ubbd7oIZj4+ME2g/DukYMIbRX+iCeFzZr+/AnEpmP4UdKV4TmTt1L
	2mBmM+zBz1yyZq10iLVpcaKBoZGALRm4jEWRcfwFiYZSt3gsQrw1WNMAOBcx1ZPfjn2K
	zGIIo7n2Afnwnr2pKua6AlLUfXtDtDVoaepX/Li1vfzf7aQDni9wkZiY5Gmg0Idzkhh+
	tLNGsStd+r6pime37Wh/TAP2fDNdAomsQhc/HDt/shEAdEbVXPMXhyWt5sWU06vr8p95
	MYqw==
X-Gm-Message-State: APjAAAXvvoL3J4haJDlzH0EMJwFYA7p64lik84q4cz9mH9/qerARaRs+
	VI/uRQd3NuTDeisPMTHEOjXG47crJ9s=
X-Google-Smtp-Source: APXvYqyzmn0z/pjVsTYeB13rJ+QBie2vR/BK+DIcZLg+ZfZWQ3pj1AVi9Bqp4kJttQuC/Qrn8L+Sgw==
X-Received: by 2002:a17:902:8d98:: with SMTP id
	v24mr35694655plo.265.1570548412312; 
	Tue, 08 Oct 2019 08:26:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.26.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:26:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:35 -0700
Message-Id: <8ca80002aa21897834b8c9869137461221e50225.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 03/12] elfutils: CVE fix for elfutils
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
X-List-Received-Date: Tue, 08 Oct 2019 15:26:52 -0000

From: Shubham Agrawal <shuagr@microsoft.com>

CVE: CVE-2019-7664.patch
CVE: CVE-2019-7665.patch

Sign off: Shubham Agrawal <shuagr@microsoft.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   2 +
 .../elfutils/files/CVE-2019-7664.patch             |  65 +++++++++
 .../elfutils/files/CVE-2019-7665.patch             | 154 +++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
index e94a48e..862a9b6 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
@@ -31,6 +31,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2019-7150.patch \
            file://CVE-2019-7146_p1.patch \
            file://CVE-2019-7146_p2.patch \
+           file://CVE-2019-7664.patch \
+           file://CVE-2019-7665.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
new file mode 100644
index 0000000..e55dc5a
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
@@ -0,0 +1,65 @@
+From 3ed05376e7b2c96c1d6eb24d2842cc25b79a4f07 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 16 Jan 2019 12:25:57 +0100
+Subject: [PATCH] CVE: CVE-2019-7664
+
+Upstream-Status: Backport
+libelf: Correct overflow check in note_xlate.
+
+We want to make sure the note_len doesn't overflow and becomes shorter
+than the note header. But the namesz and descsz checks got the note header
+size wrong). Replace the wrong constant (8) with a sizeof cvt_Nhdr (12).
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=24084
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Ubuntu <lisa@shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net>
+---
+ libelf/ChangeLog    | 13 +++++++++++++
+ libelf/note_xlate.h |  4 ++--
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/libelf/ChangeLog b/libelf/ChangeLog
+index 68c4fbd..892e6e7 100644
+--- a/libelf/ChangeLog
++++ b/libelf/ChangeLog
+@@ -1,3 +1,16 @@
++<<<<<<< HEAD
++=======
++2019-01-16  Mark Wielaard  <mark@klomp.org>
++
++	* note_xlate.h (elf_cvt_note): Check n_namesz and n_descsz don't
++	overflow note_len into note header.
++
++2018-11-17  Mark Wielaard  <mark@klomp.org>
++
++	* elf32_updatefile.c (updatemmap): Make sure to call convert
++	function on a properly aligned destination.
++
++>>>>>>> e65d91d... libelf: Correct overflow check in note_xlate.
+ 2018-11-16  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* libebl.h (__elf32_msize): Mark with const attribute.
+diff --git a/libelf/note_xlate.h b/libelf/note_xlate.h
+index 9bdc3e2..bc9950f 100644
+--- a/libelf/note_xlate.h
++++ b/libelf/note_xlate.h
+@@ -46,13 +46,13 @@ elf_cvt_note (void *dest, const void *src, size_t len, int encode,
+       /* desc needs to be aligned.  */
+       note_len += n->n_namesz;
+       note_len = nhdr8 ? NOTE_ALIGN8 (note_len) : NOTE_ALIGN4 (note_len);
+-      if (note_len > len || note_len < 8)
++      if (note_len > len || note_len < sizeof *n)
+ 	break;
+ 
+       /* data as a whole needs to be aligned.  */
+       note_len += n->n_descsz;
+       note_len = nhdr8 ? NOTE_ALIGN8 (note_len) : NOTE_ALIGN4 (note_len);
+-      if (note_len > len || note_len < 8)
++      if (note_len > len || note_len < sizeof *n)
+ 	break;
+ 
+       /* Copy or skip the note data.  */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
new file mode 100644
index 0000000..a1bb309
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
@@ -0,0 +1,154 @@
+From 4323d46c4a369b614aa1f574805860b3434552df Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 16 Jan 2019 15:41:31 +0100
+Subject: [PATCH] CVE: CVE-2019-7665
+
+Upstream-Status: Backport
+
+Sign off: Shubham Agrawal <shuagr@microsoft.com>
+
+libebl: Check NT_PLATFORM core notes contain a zero terminated string.
+
+Most strings in core notes are fixed size. But NT_PLATFORM contains just
+a variable length string. Check that it is actually zero terminated
+before passing to readelf to print.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=24089
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Ubuntu <lisa@shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net>
+---
+ libdwfl/linux-core-attach.c |  9 +++++----
+ libebl/eblcorenote.c        | 39 +++++++++++++++++++--------------------
+ libebl/libebl.h             |  3 ++-
+ src/readelf.c               |  2 +-
+ 4 files changed, 27 insertions(+), 26 deletions(-)
+
+diff --git a/libdwfl/linux-core-attach.c b/libdwfl/linux-core-attach.c
+index 6c99b9e..c0f1b0d 100644
+--- a/libdwfl/linux-core-attach.c
++++ b/libdwfl/linux-core-attach.c
+@@ -137,7 +137,7 @@ core_next_thread (Dwfl *dwfl __attribute__ ((unused)), void *dwfl_arg,
+       const Ebl_Register_Location *reglocs;
+       size_t nitems;
+       const Ebl_Core_Item *items;
+-      if (! ebl_core_note (core_arg->ebl, &nhdr, name,
++      if (! ebl_core_note (core_arg->ebl, &nhdr, name, desc,
+ 			   &regs_offset, &nregloc, &reglocs, &nitems, &items))
+ 	{
+ 	  /* This note may be just not recognized, skip it.  */
+@@ -191,8 +191,9 @@ core_set_initial_registers (Dwfl_Thread *thread, void *thread_arg_voidp)
+   const Ebl_Register_Location *reglocs;
+   size_t nitems;
+   const Ebl_Core_Item *items;
+-  int core_note_err = ebl_core_note (core_arg->ebl, &nhdr, name, &regs_offset,
+-				     &nregloc, &reglocs, &nitems, &items);
++  int core_note_err = ebl_core_note (core_arg->ebl, &nhdr, name, desc,
++				     &regs_offset, &nregloc, &reglocs,
++				     &nitems, &items);
+   /* __libdwfl_attach_state_for_core already verified the note is there.  */
+   assert (core_note_err != 0);
+   assert (nhdr.n_type == NT_PRSTATUS);
+@@ -383,7 +384,7 @@ dwfl_core_file_attach (Dwfl *dwfl, Elf *core)
+       const Ebl_Register_Location *reglocs;
+       size_t nitems;
+       const Ebl_Core_Item *items;
+-      if (! ebl_core_note (ebl, &nhdr, name,
++      if (! ebl_core_note (ebl, &nhdr, name, desc,
+ 			   &regs_offset, &nregloc, &reglocs, &nitems, &items))
+ 	{
+ 	  /* This note may be just not recognized, skip it.  */
+diff --git a/libebl/eblcorenote.c b/libebl/eblcorenote.c
+index 783f981..7fab397 100644
+--- a/libebl/eblcorenote.c
++++ b/libebl/eblcorenote.c
+@@ -36,11 +36,13 @@
+ #include <inttypes.h>
+ #include <stdio.h>
+ #include <stddef.h>
++#include <string.h>
+ #include <libeblP.h>
+ 
+ 
+ int
+ ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
++	       const char *desc,
+ 	       GElf_Word *regs_offset, size_t *nregloc,
+ 	       const Ebl_Register_Location **reglocs, size_t *nitems,
+ 	       const Ebl_Core_Item **items)
+@@ -51,28 +53,25 @@ ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
+     {
+       /* The machine specific function did not know this type.  */
+ 
+-      *regs_offset = 0;
+-      *nregloc = 0;
+-      *reglocs = NULL;
+-      switch (nhdr->n_type)
++      /* NT_PLATFORM is kind of special since it needs a zero terminated
++         string (other notes often have a fixed size string).  */
++      static const Ebl_Core_Item platform[] =
+ 	{
+-#define ITEMS(type, table)				\
+-	  case type:					\
+-	    *items = table;				\
+-	    *nitems = sizeof table / sizeof table[0];	\
+-	    result = 1;					\
+-	    break
++	  {
++	    .name = "Platform",
++	    .type = ELF_T_BYTE, .count = 0, .format = 's'
++	  }
++	};
+ 
+-	  static const Ebl_Core_Item platform[] =
+-	    {
+-	      {
+-		.name = "Platform",
+-		.type = ELF_T_BYTE, .count = 0, .format = 's'
+-	      }
+-	    };
+-	  ITEMS (NT_PLATFORM, platform);
+-
+-#undef	ITEMS
++      if (nhdr->n_type == NT_PLATFORM
++	  && memchr (desc, '\0', nhdr->n_descsz) != NULL)
++        {
++	  *regs_offset = 0;
++	  *nregloc = 0;
++	  *reglocs = NULL;
++	  *items = platform;
++	  *nitems = 1;
++	  result = 1;
+ 	}
+     }
+ 
+diff --git a/libebl/libebl.h b/libebl/libebl.h
+index ca9b9fe..24922eb 100644
+--- a/libebl/libebl.h
++++ b/libebl/libebl.h
+@@ -319,7 +319,8 @@ typedef struct
+ 
+ /* Describe the format of a core file note with the given header and NAME.
+    NAME is not guaranteed terminated, it's NHDR->n_namesz raw bytes.  */
+-extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
++extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr,
++			  const char *name, const char *desc,
+ 			  GElf_Word *regs_offset, size_t *nregloc,
+ 			  const Ebl_Register_Location **reglocs,
+ 			  size_t *nitems, const Ebl_Core_Item **items)
+diff --git a/src/readelf.c b/src/readelf.c
+index 3a73710..71651e0 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -12153,7 +12153,7 @@ handle_core_note (Ebl *ebl, const GElf_Nhdr *nhdr,
+   size_t nitems;
+   const Ebl_Core_Item *items;
+ 
+-  if (! ebl_core_note (ebl, nhdr, name,
++  if (! ebl_core_note (ebl, nhdr, name, desc,
+ 		       &regs_offset, &nregloc, &reglocs, &nitems, &items))
+     return;
+ 
+-- 
+2.7.4
+
-- 
2.7.4


