Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC1FC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:43:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.45391.1683193412358863361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 02:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mSMfn/oV;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so1412485ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683193411; x=1685785411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFtZFgVKpaVcdhjpIIaSCEiI46Ny/l9Y/Q0UxTtpIKQ=;
        b=mSMfn/oV8hViavjczCnCx675vlG9rwL30Ii8bDfZ2/bBpcZfuhW/ssTU7t3GfCy36D
         WQ+v8tbwdJ14TsEgPj5sgGKLA95QahEcBVHMp6wKNUIf14m1D0//+b8XYbctYqzADNnx
         Q7cWiwzQ2IhuBl6LvXJSJPwRWWxtalSDW426ANXkLVExE5KwQYE3lx6vBCo4mXaU7QUi
         cZRX7m6gW0Dngi9eVohD3b6mUhiTLEhSKm0YODeZBflevuIL01v/Klun6+Z5L2cWCzr8
         zAiMqqN5qJAtU28l3/8dAxBurygGOJ0UKvd3zQzwY0d1MMox1ZY3NI+KiE89ZgZThPwi
         SGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683193411; x=1685785411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFtZFgVKpaVcdhjpIIaSCEiI46Ny/l9Y/Q0UxTtpIKQ=;
        b=XScriXUDjbNcl1tfrYKZH1VTgEQOIx8mPm2Roi3WomFKgpIql0XJNtd2Ek5RkdhO9Y
         80opOcNa0tp/OO5DTNXZYM1iEDVkHlJ9aqEJyhxWAN7omVzRoUzbqoAjrPMrpp3gA5QS
         xETvMNwhBwLl/LDOaETRZ6VNuQVGAMNQvaM4ryN2KBfp8TRKnZ0rjPztfhQX7oORzh3J
         zV69476hX+Gm82nx7diRvZTTlxKUr+0MLNic3z4oV1G7PvyFnCLrfChAIJmzQIhwGp5P
         P5XRDI51xU/m8oWaPBKKF7oRuC9EIT8TR/6aMLiBBuEJkZg/xGhLZBTrR0S0LMA3E8ms
         aVEg==
X-Gm-Message-State: AC+VfDwtGiKo44/4L5KWJuWBPGN1vOWhJ1MLKpS94tE4nqPapVMxWsTo
	0x7QpXc2QJhkMZPyvWSWR7t5Ykf6etatRnD5
X-Google-Smtp-Source: ACHHUZ5IWC3kvIiPGhHYy65kpCCBHYByXLsykYG6pmwral6wZrPkGUj1TMA9BogGTYpe7eSSeFfGRA==
X-Received: by 2002:a17:902:a5c6:b0:1a2:2091:eeae with SMTP id t6-20020a170902a5c600b001a22091eeaemr2635414plq.40.1683193411497;
        Thu, 04 May 2023 02:43:31 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709028a8500b001ab0d815dbbsm4633253plo.23.2023.05.04.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 02:43:31 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-25588
Date: Thu,  4 May 2023 15:12:57 +0530
Message-Id: <20230504094257.1213378-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180859

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0025-CVE-2023-25588.patch        | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bf44e6c762..c9e455b36a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,5 +50,6 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
+     file://0025-CVE-2023-25588.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
new file mode 100644
index 0000000000..142d201c40
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
@@ -0,0 +1,147 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 14 Oct 2022 00:00:21 +0000 (+1030)
+Subject: PR29677, Field `the_bfd` of `asymbol` is uninitialised
+X-Git-Tag: gdb-13-branchpoint~871
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1
+
+PR29677, Field `the_bfd` of `asymbol` is uninitialised
+
+Besides not initialising the_bfd of synthetic symbols, counting
+symbols when sizing didn't match symbols created if there were any
+dynsyms named "".  We don't want synthetic symbols without names
+anyway, so get rid of them.  Also, simplify and correct sanity checks.
+
+	PR 29677
+	* mach-o.c (bfd_mach_o_get_synthetic_symtab): Rewrite.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
+
+CVE: CVE-2023-25588
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/mach-o.c b/bfd/mach-o.c
+index acb35e7f0c6..5279343768c 100644
+--- a/bfd/mach-o.c
++++ b/bfd/mach-o.c
+@@ -938,11 +938,9 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
+   bfd_mach_o_symtab_command *symtab = mdata->symtab;
+   asymbol *s;
+   char * s_start;
+-  char * s_end;
+   unsigned long count, i, j, n;
+   size_t size;
+   char *names;
+-  char *nul_name;
+   const char stub [] = "$stub";
+
+   *ret = NULL;
+@@ -955,27 +953,27 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
+   /* We need to allocate a bfd symbol for every indirect symbol and to
+      allocate the memory for its name.  */
+   count = dysymtab->nindirectsyms;
+-  size = count * sizeof (asymbol) + 1;
+-
++  size = 0;
+   for (j = 0; j < count; j++)
+     {
+-      const char * strng;
+       unsigned int isym = dysymtab->indirect_syms[j];
++      const char *str;
+
+       /* Some indirect symbols are anonymous.  */
+-      if (isym < symtab->nsyms && (strng = symtab->symbols[isym].symbol.name))
+-	/* PR 17512: file: f5b8eeba.  */
+-	size += strnlen (strng, symtab->strsize - (strng - symtab->strtab)) + sizeof (stub);
++      if (isym < symtab->nsyms
++	  && (str = symtab->symbols[isym].symbol.name) != NULL)
++	{
++	  /* PR 17512: file: f5b8eeba.  */
++	  size += strnlen (str, symtab->strsize - (str - symtab->strtab));
++	  size += sizeof (stub);
++	}
+     }
+
+-  s_start = bfd_malloc (size);
++  s_start = bfd_malloc (size + count * sizeof (asymbol));
+   s = *ret = (asymbol *) s_start;
+   if (s == NULL)
+     return -1;
+   names = (char *) (s + count);
+-  nul_name = names;
+-  *names++ = 0;
+-  s_end = s_start + size;
+
+   n = 0;
+   for (i = 0; i < mdata->nsects; i++)
+@@ -997,47 +995,39 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
+	  entry_size = bfd_mach_o_section_get_entry_size (abfd, sec);
+
+	  /* PR 17512: file: 08e15eec.  */
+-	  if (first >= count || last >= count || first > last)
++	  if (first >= count || last > count || first > last)
+	    goto fail;
+
+	  for (j = first; j < last; j++)
+	    {
+	      unsigned int isym = dysymtab->indirect_syms[j];
+-
+-	      /* PR 17512: file: 04d64d9b.  */
+-	      if (((char *) s) + sizeof (* s) > s_end)
+-		goto fail;
+-
+-	      s->flags = BSF_GLOBAL | BSF_SYNTHETIC;
+-	      s->section = sec->bfdsection;
+-	      s->value = addr - sec->addr;
+-	      s->udata.p = NULL;
++	      const char *str;
++	      size_t len;
+
+	      if (isym < symtab->nsyms
+-		  && symtab->symbols[isym].symbol.name)
++		  && (str = symtab->symbols[isym].symbol.name) != NULL)
+		{
+-		  const char *sym = symtab->symbols[isym].symbol.name;
+-		  size_t len;
+-
+-		  s->name = names;
+-		  len = strlen (sym);
+-		  /* PR 17512: file: 47dfd4d2.  */
+-		  if (names + len >= s_end)
++		  /* PR 17512: file: 04d64d9b.  */
++		  if (n >= count)
+		    goto fail;
+-		  memcpy (names, sym, len);
+-		  names += len;
+-		  /* PR 17512: file: 18f340a4.  */
+-		  if (names + sizeof (stub) >= s_end)
++		  len = strnlen (str, symtab->strsize - (str - symtab->strtab));
++		  /* PR 17512: file: 47dfd4d2, 18f340a4.  */
++		  if (size < len + sizeof (stub))
+		    goto fail;
+-		  memcpy (names, stub, sizeof (stub));
+-		  names += sizeof (stub);
++		  memcpy (names, str, len);
++		  memcpy (names + len, stub, sizeof (stub));
++		  s->name = names;
++		  names += len + sizeof (stub);
++		  size -= len + sizeof (stub);
++		  s->the_bfd = symtab->symbols[isym].symbol.the_bfd;
++		  s->flags = BSF_GLOBAL | BSF_SYNTHETIC;
++		  s->section = sec->bfdsection;
++		  s->value = addr - sec->addr;
++		  s->udata.p = NULL;
++		  s++;
++		  n++;
+		}
+-	      else
+-		s->name = nul_name;
+-
+	      addr += entry_size;
+-	      s++;
+-	      n++;
+	    }
+	  break;
+	default:
-- 
2.34.1


