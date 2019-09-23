Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 82B6F7CF1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:19:17 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id a2so9911873pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ESeneRjHt6x6vEDXkaK16JtqpnHHQ8c+HP98Zqo99N8=;
	b=QeyvT6TpnpbxKOMkzRqYR0KSYT/qfgJjy07+EuVVKL13s5i9TjR3YGsEjOkGBmONtC
	5durhogetLNI14k+TciJXy9/GLH4znH/4mRZxziodTZXxBFxpdwHic3PvAsYFy5G0Pjw
	mIszq+XwOyvTZoH6o+nPkfV5/yrNfi6eN4Ca7f2auKlEOBFx1nfPoogvmTlB9Aqe62xd
	IICiitQztqH3HT4lWpDEuSTXpsj2RNnvhaoooWR5+1acnUhEOBuxc34+6VJHGzedXNu1
	p1Q+P7rE4v/GTW7BdcCFlmMh036ip24vm3zBE0nLkUX+Sy5NuPN4o6ZaJtWnl7Zjscmm
	I75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ESeneRjHt6x6vEDXkaK16JtqpnHHQ8c+HP98Zqo99N8=;
	b=GcSp11McAJtlCM7q86HvCL//1c/m3VMdCQ5c8gVUImdAiKSr6+ZsBWd24paaRZbqvg
	WtOBjSaS3fTF5mKFxZ/e1H44Hja1aTNmKM1gmLhzAg469DkgUB6D2ZgdZKSowMMwnT7+
	cViKIIzPk2CwTHz2PpsN0luDaOGDVf8geEl0uDB90rNee4F9EutMu2GVYbaBvzWi3fZS
	+sc82jgld2PaHUyO4YsPomb1NYsA0ZIYtSrcGGG7Ov8q54G3V+Yxi84frC6WYu2s4CWG
	e8+NATOb34dtoVHJMzIln86+etdJN0b7Ss8j+R4Obn+5xYcv5k3bcE543nbtbKaS2lc/
	Fy3w==
X-Gm-Message-State: APjAAAXVIDFL1RYt7CZIjP5L4r7YekfwRECC3BmNOUPhHLzbD1Vm5mfZ
	d1BU5u8pDtTPEV2HJo+igc+N7RQdFmk=
X-Google-Smtp-Source: APXvYqwMP3/hwlNO7My6Oy3AXtuELnHdcfvegNwNFhJUvS6BxOK9NKZVc7X/we/ym4WYwjo9K0z4aQ==
X-Received: by 2002:aa7:94af:: with SMTP id a15mr1761558pfl.157.1569273558189; 
	Mon, 23 Sep 2019 14:19:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:ec07:55c0:9c8c:b3de?
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	z4sm14238630pfn.45.2019.09.23.14.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Sep 2019 14:19:16 -0700 (PDT)
To: shuagr@microsoft.com, openembedded-core@lists.openembedded.org
References: <1569273251-128066-1-git-send-email-shuagr@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <54b8bdc7-c735-2e7a-2652-9891dd3f1d1b@gmail.com>
Date: Mon, 23 Sep 2019 14:19:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569273251-128066-1-git-send-email-shuagr@microsoft.com>
Subject: =?UTF-8?B?UmU6IFvigJ1PRS1jb3JlXVt0aHVkXVtQQVRDSOKAnV0gZWxmdXRpbHM6IENWRSBmaXggZm9yIGVsZnV0aWxz?=
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
X-List-Received-Date: Mon, 23 Sep 2019 21:19:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/23/19 2:14 PM, shuagr97@gmail.com wrote:
> From: Shubham Agrawal <shuagr@microsoft.com>
>
> CVE: CVE-2019-7664.patch
> CVE: CVE-2019-7665.patch

This is the third email patch on the same issues. Are they different?

regards,
Armin
>
> Sign off: Shubham Agrawal <shuagr@microsoft.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   2 +
>  .../elfutils/files/CVE-2019-7664.patch             |  65 +++++++++
>  .../elfutils/files/CVE-2019-7665.patch             | 154 +++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> index e94a48e..862a9b6 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> @@ -31,6 +31,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://CVE-2019-7150.patch \
>             file://CVE-2019-7146_p1.patch \
>             file://CVE-2019-7146_p2.patch \
> +           file://CVE-2019-7664.patch \
> +           file://CVE-2019-7665.patch \
>             "
>  SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
>  
> diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
> new file mode 100644
> index 0000000..e55dc5a
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
> @@ -0,0 +1,65 @@
> +From 3ed05376e7b2c96c1d6eb24d2842cc25b79a4f07 Mon Sep 17 00:00:00 2001
> +From: Mark Wielaard <mark@klomp.org>
> +Date: Wed, 16 Jan 2019 12:25:57 +0100
> +Subject: [PATCH] CVE: CVE-2019-7664
> +
> +Upstream-Status: Backport
> +libelf: Correct overflow check in note_xlate.
> +
> +We want to make sure the note_len doesn't overflow and becomes shorter
> +than the note header. But the namesz and descsz checks got the note header
> +size wrong). Replace the wrong constant (8) with a sizeof cvt_Nhdr (12).
> +
> +https://sourceware.org/bugzilla/show_bug.cgi?id=24084
> +
> +Signed-off-by: Mark Wielaard <mark@klomp.org>
> +Signed-off-by: Ubuntu <lisa@shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net>
> +---
> + libelf/ChangeLog    | 13 +++++++++++++
> + libelf/note_xlate.h |  4 ++--
> + 2 files changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/libelf/ChangeLog b/libelf/ChangeLog
> +index 68c4fbd..892e6e7 100644
> +--- a/libelf/ChangeLog
> ++++ b/libelf/ChangeLog
> +@@ -1,3 +1,16 @@
> ++<<<<<<< HEAD
> ++=======
> ++2019-01-16  Mark Wielaard  <mark@klomp.org>
> ++
> ++	* note_xlate.h (elf_cvt_note): Check n_namesz and n_descsz don't
> ++	overflow note_len into note header.
> ++
> ++2018-11-17  Mark Wielaard  <mark@klomp.org>
> ++
> ++	* elf32_updatefile.c (updatemmap): Make sure to call convert
> ++	function on a properly aligned destination.
> ++
> ++>>>>>>> e65d91d... libelf: Correct overflow check in note_xlate.
> + 2018-11-16  Mark Wielaard  <mark@klomp.org>
> + 
> + 	* libebl.h (__elf32_msize): Mark with const attribute.
> +diff --git a/libelf/note_xlate.h b/libelf/note_xlate.h
> +index 9bdc3e2..bc9950f 100644
> +--- a/libelf/note_xlate.h
> ++++ b/libelf/note_xlate.h
> +@@ -46,13 +46,13 @@ elf_cvt_note (void *dest, const void *src, size_t len, int encode,
> +       /* desc needs to be aligned.  */
> +       note_len += n->n_namesz;
> +       note_len = nhdr8 ? NOTE_ALIGN8 (note_len) : NOTE_ALIGN4 (note_len);
> +-      if (note_len > len || note_len < 8)
> ++      if (note_len > len || note_len < sizeof *n)
> + 	break;
> + 
> +       /* data as a whole needs to be aligned.  */
> +       note_len += n->n_descsz;
> +       note_len = nhdr8 ? NOTE_ALIGN8 (note_len) : NOTE_ALIGN4 (note_len);
> +-      if (note_len > len || note_len < 8)
> ++      if (note_len > len || note_len < sizeof *n)
> + 	break;
> + 
> +       /* Copy or skip the note data.  */
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
> new file mode 100644
> index 0000000..a1bb309
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
> @@ -0,0 +1,154 @@
> +From 4323d46c4a369b614aa1f574805860b3434552df Mon Sep 17 00:00:00 2001
> +From: Mark Wielaard <mark@klomp.org>
> +Date: Wed, 16 Jan 2019 15:41:31 +0100
> +Subject: [PATCH] CVE: CVE-2019-7665
> +
> +Upstream-Status: Backport
> +
> +Sign off: Shubham Agrawal <shuagr@microsoft.com>
> +
> +libebl: Check NT_PLATFORM core notes contain a zero terminated string.
> +
> +Most strings in core notes are fixed size. But NT_PLATFORM contains just
> +a variable length string. Check that it is actually zero terminated
> +before passing to readelf to print.
> +
> +https://sourceware.org/bugzilla/show_bug.cgi?id=24089
> +
> +Signed-off-by: Mark Wielaard <mark@klomp.org>
> +Signed-off-by: Ubuntu <lisa@shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net>
> +---
> + libdwfl/linux-core-attach.c |  9 +++++----
> + libebl/eblcorenote.c        | 39 +++++++++++++++++++--------------------
> + libebl/libebl.h             |  3 ++-
> + src/readelf.c               |  2 +-
> + 4 files changed, 27 insertions(+), 26 deletions(-)
> +
> +diff --git a/libdwfl/linux-core-attach.c b/libdwfl/linux-core-attach.c
> +index 6c99b9e..c0f1b0d 100644
> +--- a/libdwfl/linux-core-attach.c
> ++++ b/libdwfl/linux-core-attach.c
> +@@ -137,7 +137,7 @@ core_next_thread (Dwfl *dwfl __attribute__ ((unused)), void *dwfl_arg,
> +       const Ebl_Register_Location *reglocs;
> +       size_t nitems;
> +       const Ebl_Core_Item *items;
> +-      if (! ebl_core_note (core_arg->ebl, &nhdr, name,
> ++      if (! ebl_core_note (core_arg->ebl, &nhdr, name, desc,
> + 			   &regs_offset, &nregloc, &reglocs, &nitems, &items))
> + 	{
> + 	  /* This note may be just not recognized, skip it.  */
> +@@ -191,8 +191,9 @@ core_set_initial_registers (Dwfl_Thread *thread, void *thread_arg_voidp)
> +   const Ebl_Register_Location *reglocs;
> +   size_t nitems;
> +   const Ebl_Core_Item *items;
> +-  int core_note_err = ebl_core_note (core_arg->ebl, &nhdr, name, &regs_offset,
> +-				     &nregloc, &reglocs, &nitems, &items);
> ++  int core_note_err = ebl_core_note (core_arg->ebl, &nhdr, name, desc,
> ++				     &regs_offset, &nregloc, &reglocs,
> ++				     &nitems, &items);
> +   /* __libdwfl_attach_state_for_core already verified the note is there.  */
> +   assert (core_note_err != 0);
> +   assert (nhdr.n_type == NT_PRSTATUS);
> +@@ -383,7 +384,7 @@ dwfl_core_file_attach (Dwfl *dwfl, Elf *core)
> +       const Ebl_Register_Location *reglocs;
> +       size_t nitems;
> +       const Ebl_Core_Item *items;
> +-      if (! ebl_core_note (ebl, &nhdr, name,
> ++      if (! ebl_core_note (ebl, &nhdr, name, desc,
> + 			   &regs_offset, &nregloc, &reglocs, &nitems, &items))
> + 	{
> + 	  /* This note may be just not recognized, skip it.  */
> +diff --git a/libebl/eblcorenote.c b/libebl/eblcorenote.c
> +index 783f981..7fab397 100644
> +--- a/libebl/eblcorenote.c
> ++++ b/libebl/eblcorenote.c
> +@@ -36,11 +36,13 @@
> + #include <inttypes.h>
> + #include <stdio.h>
> + #include <stddef.h>
> ++#include <string.h>
> + #include <libeblP.h>
> + 
> + 
> + int
> + ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
> ++	       const char *desc,
> + 	       GElf_Word *regs_offset, size_t *nregloc,
> + 	       const Ebl_Register_Location **reglocs, size_t *nitems,
> + 	       const Ebl_Core_Item **items)
> +@@ -51,28 +53,25 @@ ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
> +     {
> +       /* The machine specific function did not know this type.  */
> + 
> +-      *regs_offset = 0;
> +-      *nregloc = 0;
> +-      *reglocs = NULL;
> +-      switch (nhdr->n_type)
> ++      /* NT_PLATFORM is kind of special since it needs a zero terminated
> ++         string (other notes often have a fixed size string).  */
> ++      static const Ebl_Core_Item platform[] =
> + 	{
> +-#define ITEMS(type, table)				\
> +-	  case type:					\
> +-	    *items = table;				\
> +-	    *nitems = sizeof table / sizeof table[0];	\
> +-	    result = 1;					\
> +-	    break
> ++	  {
> ++	    .name = "Platform",
> ++	    .type = ELF_T_BYTE, .count = 0, .format = 's'
> ++	  }
> ++	};
> + 
> +-	  static const Ebl_Core_Item platform[] =
> +-	    {
> +-	      {
> +-		.name = "Platform",
> +-		.type = ELF_T_BYTE, .count = 0, .format = 's'
> +-	      }
> +-	    };
> +-	  ITEMS (NT_PLATFORM, platform);
> +-
> +-#undef	ITEMS
> ++      if (nhdr->n_type == NT_PLATFORM
> ++	  && memchr (desc, '\0', nhdr->n_descsz) != NULL)
> ++        {
> ++	  *regs_offset = 0;
> ++	  *nregloc = 0;
> ++	  *reglocs = NULL;
> ++	  *items = platform;
> ++	  *nitems = 1;
> ++	  result = 1;
> + 	}
> +     }
> + 
> +diff --git a/libebl/libebl.h b/libebl/libebl.h
> +index ca9b9fe..24922eb 100644
> +--- a/libebl/libebl.h
> ++++ b/libebl/libebl.h
> +@@ -319,7 +319,8 @@ typedef struct
> + 
> + /* Describe the format of a core file note with the given header and NAME.
> +    NAME is not guaranteed terminated, it's NHDR->n_namesz raw bytes.  */
> +-extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
> ++extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr,
> ++			  const char *name, const char *desc,
> + 			  GElf_Word *regs_offset, size_t *nregloc,
> + 			  const Ebl_Register_Location **reglocs,
> + 			  size_t *nitems, const Ebl_Core_Item **items)
> +diff --git a/src/readelf.c b/src/readelf.c
> +index 3a73710..71651e0 100644
> +--- a/src/readelf.c
> ++++ b/src/readelf.c
> +@@ -12153,7 +12153,7 @@ handle_core_note (Ebl *ebl, const GElf_Nhdr *nhdr,
> +   size_t nitems;
> +   const Ebl_Core_Item *items;
> + 
> +-  if (! ebl_core_note (ebl, nhdr, name,
> ++  if (! ebl_core_note (ebl, nhdr, name, desc,
> + 		       &regs_offset, &nregloc, &reglocs, &nitems, &items))
> +     return;
> + 
> +-- 
> +2.7.4
> +


