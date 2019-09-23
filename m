Return-Path: <shuagr97@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8CD7CF1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:12:53 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id c17so8711614pgg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 14:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=wSj+UCPBQ3B/45dF5XQeiAYIBuzKK47AlrcqVg+V4uk=;
	b=HX1BZRTxrWp70xmX+opbksMJmYs5Y+s/TtoC1w/7AQ9Whqk0lfUj5WVXY77uxDMNc/
	iUR+vhwFu+sL9Bu8sXv/GYWpGKu2X0mJb6uuBw57woJsU2xEyKC0ohsj/9/SlCOlSpQk
	98oWrgS9eRAbeDOA1JsH2QE3832LtBzFAbuLqk2uetgtA2aDywsQi47yIDmnbsWqddF4
	xlfMrfVsV1olT/cKf1Pql/eNXN7ygVrYnD77BpK7LLqXXh3sjHUBw9/qtTjyJCF1hgLO
	SkX1Pg7bpGrVObNEssQcXw4Yaqt/v4PfMYi5F/GP80tDm5AkCKPsywRq5wuvPpze5aRG
	YQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=wSj+UCPBQ3B/45dF5XQeiAYIBuzKK47AlrcqVg+V4uk=;
	b=H3yp4TJeob5jeAh7vWwYb0dMZbUKDp0so8PnwG3K1ayOQoh2hNvZ4om/xfneXYqE+U
	gw2OavcM4SkWOO3t1dyt7IT3kdf73YEibfqqgYlYiFFL61fjLuE7m2RYXUqI6j7jUIzE
	J/oJFj6h8Y9WmpyRggHuzIbys/dmujEFuZrNjxAmUOhRYQ44vEJELr+oTje/mxaFNyqI
	uGqD2Do1Qrf53Pb4YZHOnsJl3eRI++DahSLyt36k8TjTuI0R+AsSnnriy6o6x2LjUSCA
	Wuq8lxi9alHzFsuCDahDnQyIToejhDg6n1u+8TuA/66f1k6yK8B+mNcoBjIRMHDC0GOx
	Dosg==
X-Gm-Message-State: APjAAAX75XEG0H3W3rg/eqnvuopW6m7OR+fzeJ6WqURNCz/oVsmVmyb1
	oCigYe8w02o4CLXT7MkdRmj33oW0
X-Google-Smtp-Source: APXvYqx1K6QuUIet/SF6QrF2wyBzcWf3bsBItx6E1onkBWdKuOOuE2RIKjwNfZlyKUAW/UJkWfuyZA==
X-Received: by 2002:a62:f249:: with SMTP id y9mr1725365pfl.147.1569273174137; 
	Mon, 23 Sep 2019 14:12:54 -0700 (PDT)
Received: from
	shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net
	([51.143.9.113]) by smtp.gmail.com with ESMTPSA id
	129sm14083783pfd.173.2019.09.23.14.12.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 14:12:53 -0700 (PDT)
From: shuagr97@gmail.com
X-Google-Original-From: shuagr@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 21:12:41 +0000
Message-Id: <1569273161-117523-1-git-send-email-shuagr@microsoft.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Reply-To: shuagr@microsoft.com
Subject: =?UTF-8?B?W+KAnU9FLWNvcmVdW3RodWRdW1BBVENI4oCdXSBlbGZ1aXRsczogQ1ZFIGZpeCBmb3IgZWxmdXRpbHM=?=
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
X-List-Received-Date: Mon, 23 Sep 2019 21:12:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Shubham Agrawal <shuagr@microsoft.com>

CVE: CVE-2019-7664.patch
CVE: CVE-2019-7665.patch

Sign off: Shubham Agrawal <shuagr@microsoft.com>
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


