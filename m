Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAC4C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 05:58:20 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.81852.1684130293443164022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 22:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cLdqbOTi;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-24e14a24c9dso8817048a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 22:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684130293; x=1686722293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk+io72p/Eq8MO//fwqFY532XOLB1CEGamEMSfWGbPs=;
        b=cLdqbOTimGTwQShzSb5M9pv5nxZiKSCftrCG+Ky/WMKolM3f1cRQ7OIbvymGNgixy6
         nKatOIDIfoTm/BpuG7FtEUkAuqlMEL/Rswz16Zx176K08BxESEfeijOG6V9Oh9gfWsit
         GTRUif8CVrk8QA/asnVE2Yb4NjE280mLDeyLPiQ5BlX5L3mjDneTXg+yMOSuPrAjTdCh
         CSshOx0qO+WCbKvkna4gM0qmK5RHSC23IAEtTI7UFil0DL1g1iXSzIeo5mwlxVKkQ43u
         SFjrMSlSZ2B7dqGwqLq2UU0W0PA/EO1N6+bO0Obm90+TxxZtyCfCb76gSl/3cpMLpiVY
         llbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684130293; x=1686722293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zk+io72p/Eq8MO//fwqFY532XOLB1CEGamEMSfWGbPs=;
        b=DN8qmUgWEOkNe0ZICUXLwLRX/MUFOZMeI/daGQtUVlcYgPVCMdvkB/oDek4gyqhTkC
         eZPmxCvW3NLBJRe69J0cZkKodDV1Sf/QQxazUxQ9N60QlTg8OhRwT1O2+gw3dVss5Fzu
         df7gyBj1Ldt/usAJjwSY27O6JEb3oMWE5lI985ctQEPiN9nmJl1tQJxyYKZOZGgItRS4
         bTwyh+V+0hjy6hHirIQ9QHmP2qd/FdaorB6V9feMI3+ioc3qbUxGY3HeH3OADuticHS6
         UYJFx22eeJOTpcMckVbpPy8izfzraHJULaqCWTa+MHiNZhuflvXQCyjcR2F5ZtyodrIK
         Oltw==
X-Gm-Message-State: AC+VfDwVIQsP9oWKm6LOl+A59erlndNY+mkVdLPxkb+NHMHnomewjp61
	iXgEt1xT9NnR1M8j4K+hMnJb6eWORq9W1g==
X-Google-Smtp-Source: ACHHUZ5sss2qxa14JJn9Wwk3cYhjGlPUVonqlhJWSqU+1SmBdT/RHRdWnR9FITV5awGaQDvWBcOl0g==
X-Received: by 2002:a17:90b:4ad1:b0:24d:fbaf:e0b1 with SMTP id mh17-20020a17090b4ad100b0024dfbafe0b1mr30893740pjb.19.1684130292475;
        Sun, 14 May 2023 22:58:12 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id r9-20020a17090a690900b0024e06a71ef5sm20588197pjj.56.2023.05.14.22.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:58:12 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-25588
Date: Mon, 15 May 2023 11:28:05 +0530
Message-Id: <20230515055805.1439114-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 05:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181229

Upstream-Status: Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]

CVE: CVE-2023-25588

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |   7 +-
 .../binutils/0028-CVE-2023-25588.patch        | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..e51c65d638 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,11 +50,6 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
-     file://0022-CVE-2023-25584-1.patch \
-     file://0022-CVE-2023-25584-2.patch \
-     file://0022-CVE-2023-25584-3.patch \
-     file://0023-CVE-2023-25585.patch \
-     file://0026-CVE-2023-1972.patch \
-     file://0025-CVE-2023-25588.patch \
+     file://0028-CVE-2023-25588.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.patch
new file mode 100644
index 0000000000..c019004a02
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.patch
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
+ 		{
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


