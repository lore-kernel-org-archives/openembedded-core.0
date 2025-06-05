Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99DBC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:16:47 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.308.1749100604585075609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 22:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9O3wp6l;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e5e6ab7b8so6203457b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749100604; x=1749705404; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJioU6KrkfIsRrk6XABJx0TT0f1r7RUJjY9XvnouCRI=;
        b=T9O3wp6lJpsiPUPC7QWHkLMrwPUXu5nsVbuRyG5QznVOd7RJGsq/c8V8Nc2SfYbvXZ
         WaW9KVN/SC2aRpjDrbJBtLYQdSIA6mHJHWLf65qGGpOcvdw2oOeFYm2L6u7cq1eY20yo
         kBKdKMwZPK6WrQGDkgEFunjGQ5ZxD+YRnSxylggE8SfobK5KIQ3sEpnRzv6R/GzF1xkb
         1uH1I6m9UDcSIJ21pfNyW28gtB5uyEzt3Gf+rMNyJVzxPqoHQ2TwL78tf3vWJHFY+MbT
         ouutM3bWgefCeDZrUtR43u0kLpJ3M9MECdaZbcmxRkfiUMv+EDZTodQbpt3IYM4TGEfV
         sDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749100604; x=1749705404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJioU6KrkfIsRrk6XABJx0TT0f1r7RUJjY9XvnouCRI=;
        b=s3RxkQGPMhkyFbTlCAEmU5in+BLu0sEopRrGML8jzUXMx4t5R4tjLfG/o3iqjkeFjZ
         gmTwJjlLmgiJLXul4OzF2FwbeCGvwLjg7h0A02nCVPTo4zkyPJTDKT/ReHTT8dzw/Y94
         RT2Shz7gyxGzxCM06OG/TPvUF6ujvpoNSbCoosJLfJvBH6aeE2G1j2C7q5EVhdyPdxep
         wdQ1KOFp6mpKGJrVMzNOMnJ483CFVLHr3l8K9z+EbNrW+cdhaipiSr9Suagi4Vhk8FRC
         HSJn3zzkOUgNm2AYDywWT1hLli7tenywtEosnkbvXYvJMzHCcxvAo47MtmdCOGWZCif3
         x3tw==
X-Gm-Message-State: AOJu0YzWDU3iN67DYuGBTeBmrk8ucFYpxV9QU4syBUZb0k30AkYJYHDo
	QueP5fYu2YF5gQDE1AmfoWSlLVDMwhV1l3aN2EpFSkjYvAJ8wTD9VHJBHI0jq88n3zUZkyBU7QM
	nMwET//WXTIl07Wvwaor/zT0QEwef7Sk1x95Q
X-Gm-Gg: ASbGnct9Qhf+WFRUdF2ci3/OsoabHvq0/0ieHvpWHp70jhjaTXkwLe230YgUnUpU/9+
	o1acc22zCvHUV0b4pAsi8nmg+5MFFMczajLCMW/kPkqDqJMSWjg7j8tan9x9vZYMXP3gXT1pGbg
	Hg+3BjwivvwR8ZZ8URn1ESKli6lBoqW9dUiVAY1yx9QQ==
X-Google-Smtp-Source: AGHT+IGAPl+KX1kQL0lOUEPmArjo7N6gpdlZ8aETH0/XB3tkijEOrxw6ZXm6Wy0JeXYF+meOlacmDVcG0tKwt3m3rdA=
X-Received: by 2002:a05:690c:5c18:b0:710:edee:74f1 with SMTP id
 00721157ae682-710edee8148mr4438337b3.6.1749100603443; Wed, 04 Jun 2025
 22:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250603062637.2915962-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1soy2iP-vv_CMHC0tYvT3OjHS5xSXWEW8srcbjpxhRpyEg@mail.gmail.com> <264d4926-ea6f-46d2-8c0f-dd42f258c9bf@windriver.com>
In-Reply-To: <264d4926-ea6f-46d2-8c0f-dd42f258c9bf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jun 2025 22:16:17 -0700
X-Gm-Features: AX0GCFsEbq0sRdQZKoJvwTJid-o6ijm_a3PmMfG9X78tNd3QJxhcQtkDiZkKTmc
Message-ID: <CAMKF1sq=8e8EmduQ_Zyc87hk-mfPL9hT4Y6d-A4Yof5V_ktSaQ@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] binutils: Fix CVE-2025-1181
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217981

On Wed, Jun 4, 2025 at 9:10=E2=80=AFPM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 04-06-2025 01:44, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Mon, Jun 2, 2025 at 11:26=E2=80=AFPM Varatharajan, Deepesh via
> > lists.openembedded.org
> > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >>
> >> PR 32641 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32641]
> >> PR 32643 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32643]
> > LGTM, second patch does have some questions on bugzilla we should
> > watchout for those to resolve along side.
> Hi Khem,
>
> Thanks for your review . Would it be preferable to submit only the first
> patch as a v2 for now? Alternatively, if both patches are acceptable at
> this stage, I can monitor the related issues and submit a follow-up
> patch once a proper fix is finalized. Please let me know if you would
> rather postpone the submission entirely until a more comprehensive
> solution is available.
>

followup is fine.

> Thanks,
> Deepesh
> >> Upstream-Status: Backport
> >> [https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D1=
8cc11a2771d9e40180485da9a4fb660c03efac3
> >> && https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D931494c9a89558acb36a03a340c01726545eef24]
> >>
> >> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> >> ---
> >>   .../binutils/binutils-2.44.inc                |   2 +
> >>   .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
> >>   .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++=
++
> >>   3 files changed, 480 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-=
2025-1181-1.patch
> >>   create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-=
2025-1181-2.patch
> >>
> >> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.44.inc
> >> index 6906ab3efb..46a95838b7 100644
> >> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> >> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> >> @@ -37,5 +37,7 @@ SRC_URI =3D "\
> >>        file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofi=
l.patch \
> >>        file://0015-CVE-2025-1178.patch \
> >>        file://CVE-2025-1180.patch \
> >> +     file://0016-CVE-2025-1181-1.patch \
> >> +     file://0017-CVE-2025-1181-2.patch \
> >>   "
> >>   S  =3D "${WORKDIR}/git"
> >> diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-118=
1-1.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.pa=
tch
> >> new file mode 100644
> >> index 0000000000..d3709c7a4f
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.pat=
ch
> >> @@ -0,0 +1,141 @@
> >> +From: Nick Clifton <nickc@redhat.com>
> >> +Date: Wed, 5 Feb 2025 14:31:10 +0000
> >> +
> >> +Prevent illegal memory access when checking relocs in a corrupt ELF b=
inary.
> >> +
> >> +PR 32641
> >> +
> >> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff;h=3D18cc11a2771d9e40180485da9a4fb660c03efac3]
> >> +CVE: CVE-2025-1181
> >> +
> >> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
> >> +
> >> +diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
> >> +index 785a37dd7fd..d2bf8e5cbae 100644
> >> +--- a/bfd/elf-bfd.h
> >> ++++ b/bfd/elf-bfd.h
> >> +@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
> >> + extern void _bfd_elf_link_munmap_section_contents
> >> +   (asection *);
> >> +
> >> ++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
> >> ++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *)=
;
> >> ++
> >> + /* Large common section.  */
> >> + extern asection _bfd_elf_large_com_section;
> >> +
> >> +diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
> >> +index 32db254ba6c..2d82c6583c3 100644
> >> +--- a/bfd/elf64-x86-64.c
> >> ++++ b/bfd/elf64-x86-64.c
> >> +@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
> >> +   bool to_reloc_pc32;
> >> +   bool abs_symbol;
> >> +   bool local_ref;
> >> +-  asection *tsec;
> >> ++  asection *tsec =3D NULL;
> >> +   bfd_signed_vma raddend;
> >> +   unsigned int opcode;
> >> +   unsigned int modrm;
> >> +@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
> >> +       return true;
> >> +     }
> >> +
> >> ++  if (tsec =3D=3D NULL)
> >> ++    return false;
> >> ++
> >> +   /* Don't convert GOTPCREL relocation against large section.  */
> >> +   if (elf_section_data (tsec) !=3D  NULL
> >> +       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) !=3D 0)
> >> +@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_=
link_info *info,
> >> +       else
> >> +       {
> >> +         isym =3D NULL;
> >> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
> >> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-               || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, sy=
mtab_hdr);
> >> +       }
> >> +
> >> +       /* Check invalid x32 relocations.  */
> >> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> >> +index 1f1263007c0..eafbd133ff5 100644
> >> +--- a/bfd/elflink.c
> >> ++++ b/bfd/elflink.c
> >> +@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *i=
nfo)
> >> +   return true;
> >> + }
> >> +
> >> ++struct elf_link_hash_entry *
> >> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_has=
hes,
> >> ++                            unsigned int                   symndx,
> >> ++                            Elf_Internal_Shdr *            symtab_hd=
r)
> >> ++{
> >> ++  if (symndx < symtab_hdr->sh_info)
> >> ++    return NULL;
> >> ++
> >> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr->=
sh_info];
> >> ++
> >> ++  /* The hash might be empty.  See PR 32641 for an example of this. =
 */
> >> ++  if (h =3D=3D NULL)
> >> ++    return NULL;
> >> ++
> >> ++  while (h->root.type =3D=3D bfd_link_hash_indirect
> >> ++       || h->root.type =3D=3D bfd_link_hash_warning)
> >> ++    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> ++
> >> ++  return h;
> >> ++}
> >> ++
> >> + static struct elf_link_hash_entry *
> >> + get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_s=
ymndx)
> >> + {
> >> +@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie=
, unsigned long r_symndx)
> >> +     {
> >> +       h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
> >> +
> >> ++      if (h =3D=3D NULL)
> >> ++      return NULL;
> >> ++
> >> +       while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +            || h->root.type =3D=3D bfd_link_hash_warning)
> >> +       h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
> >> +index 8e5a005fd36..832a5495eb1 100644
> >> +--- a/bfd/elfxx-x86.c
> >> ++++ b/bfd/elfxx-x86.c
> >> +@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
> >> +         goto error_return;
> >> +       }
> >> +
> >> +-      if (r_symndx < symtab_hdr->sh_info)
> >> +-      h =3D NULL;
> >> +-      else
> >> +-      {
> >> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
> >> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-               || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> +-      }
> >> ++      h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symt=
ab_hdr);
> >> +
> >> +       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
> >> +         && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
> >> +@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd AT=
TRIBUTE_UNUSED,
> >> +       else
> >> +       {
> >> +         /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  *=
/
> >> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
> >> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-               || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, sy=
mtab_hdr);
> >> ++        if (h =3D=3D NULL)
> >> ++          {
> >> ++            /* FIXMEL: Issue an error message ?  */
> >> ++            continue;
> >> ++          }
> >> +
> >> +         if (h->root.type =3D=3D bfd_link_hash_defined
> >> +             || h->root.type =3D=3D bfd_link_hash_defweak)
> >> diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-118=
1-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.pa=
tch
> >> new file mode 100644
> >> index 0000000000..5af743582f
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.pat=
ch
> >> @@ -0,0 +1,337 @@
> >> +From: Nick Clifton <nickc@redhat.com>
> >> +Date: Wed, 5 Feb 2025 15:43:04 +0000
> >> +
> >> +Add even more checks for corrupt input when processing
> >> +relocations for ELF files.
> >> +
> >> +PR 32643
> >> +
> >> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff;h=3D931494c9a89558acb36a03a340c01726545eef24]
> >> +CVE: CVE-2025-1181
> >> +
> >> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
> >> +
> >> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> >> +index fd423d61..91cd7c28 100644
> >> +--- a/bfd/elflink.c
> >> ++++ b/bfd/elflink.c
> >> +@@ -96,15 +96,17 @@
> >> +   return true;
> >> + }
> >> +
> >> +-struct elf_link_hash_entry *
> >> +-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_has=
hes,
> >> +-                            unsigned int                   symndx,
> >> +-                            Elf_Internal_Shdr *            symtab_hd=
r)
> >> ++static struct elf_link_hash_entry *
> >> ++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
> >> ++                   unsigned int                   symndx,
> >> ++                   unsigned int                   ext_sym_start)
> >> + {
> >> +-  if (symndx < symtab_hdr->sh_info)
> >> ++  if (sym_hashes =3D=3D NULL
> >> ++      /* Guard against corrupt input.  See PR 32636 for an example. =
 */
> >> ++      || symndx < ext_sym_start)
> >> +     return NULL;
> >> +
> >> +-  struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr->=
sh_info];
> >> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - ext_sym_star=
t];
> >> +
> >> +   /* The hash might be empty.  See PR 32641 for an example of this. =
 */
> >> +   if (h =3D=3D NULL)
> >> +@@ -117,27 +119,28 @@
> >> +   return h;
> >> + }
> >> +
> >> +-static struct elf_link_hash_entry *
> >> +-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_s=
ymndx)
> >> ++struct elf_link_hash_entry *
> >> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_has=
hes,
> >> ++                            unsigned int                   symndx,
> >> ++                            Elf_Internal_Shdr *            symtab_hd=
r)
> >> + {
> >> +-  struct elf_link_hash_entry *h =3D NULL;
> >> +-
> >> +-  if ((r_symndx >=3D cookie->locsymcount
> >> +-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_L=
OCAL)
> >> +-      /* Guard against corrupt input.  See PR 32636 for an example. =
 */
> >> +-      && r_symndx >=3D cookie->extsymoff)
> >> +-    {
> >> +-      h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
> >> ++  if (symtab_hdr =3D=3D NULL)
> >> ++    return NULL;
> >> +
> >> +-      if (h =3D=3D NULL)
> >> +-      return NULL;
> >> ++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_inf=
o);
> >> ++}
> >> +
> >> +-      while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-           || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-      h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> +-    }
> >> ++static struct elf_link_hash_entry *
> >> ++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsig=
ned long r_symndx)
> >> ++{
> >> ++  if (cookie =3D=3D NULL || cookie->sym_hashes =3D=3D NULL)
> >> ++    return NULL;
> >> ++
> >> ++  if (r_symndx >=3D cookie->locsymcount
> >> ++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_LO=
CAL)
> >> ++    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie=
->extsymoff);
> >> +
> >> +-  return h;
> >> ++  return NULL;
> >> + }
> >> +
> >> + asection *
> >> +@@ -147,7 +150,7 @@
> >> + {
> >> +   struct elf_link_hash_entry *h;
> >> +
> >> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
> >> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
> >> +
> >> +   if (h !=3D NULL)
> >> +     {
> >> +@@ -9105,7 +9108,6 @@
> >> +                 size_t symidx,
> >> +                 bfd_vma val)
> >> + {
> >> +-  struct elf_link_hash_entry **sym_hashes;
> >> +   struct elf_link_hash_entry *h;
> >> +   size_t extsymoff =3D locsymcount;
> >> +
> >> +@@ -9128,12 +9130,12 @@
> >> +
> >> +   /* It is a global symbol: set its link type
> >> +      to "defined" and give it a value.  */
> >> +-
> >> +-  sym_hashes =3D elf_sym_hashes (bfd_with_globals);
> >> +-  h =3D sym_hashes [symidx - extsymoff];
> >> +-  while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-       || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> ++  h =3D get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symi=
dx, extsymoff);
> >> ++  if (h =3D=3D NULL)
> >> ++    {
> >> ++      /* FIXMEL What should we do ?  */
> >> ++      return;
> >> ++    }
> >> +   h->root.type =3D bfd_link_hash_defined;
> >> +   h->root.u.def.value =3D val;
> >> +   h->root.u.def.section =3D bfd_abs_section_ptr;
> >> +@@ -11611,10 +11613,19 @@
> >> +             || (elf_bad_symtab (input_bfd)
> >> +                 && flinfo->sections[symndx] =3D=3D NULL))
> >> +           {
> >> +-            struct elf_link_hash_entry *h =3D sym_hashes[symndx - ex=
tsymoff];
> >> +-            while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-                   || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-              h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> >> ++            struct elf_link_hash_entry *h;
> >> ++
> >> ++            h =3D get_link_hash_entry (sym_hashes, symndx, extsymoff=
);
> >> ++            if (h =3D=3D NULL)
> >> ++              {
> >> ++                _bfd_error_handler
> >> ++                  /* xgettext:c-format */
> >> ++                  (_("error: %pB: unable to create group section sym=
bol"),
> >> ++                   input_bfd);
> >> ++                bfd_set_error (bfd_error_bad_value);
> >> ++                return false;
> >> ++              }
> >> ++
> >> +             /* Arrange for symbol to be output.  */
> >> +             h->indx =3D -2;
> >> +             elf_section_data (osec)->this_hdr.sh_info =3D -2;
> >> +@@ -11749,7 +11760,7 @@
> >> +                 || (elf_bad_symtab (input_bfd)
> >> +                     && flinfo->sections[r_symndx] =3D=3D NULL))
> >> +               {
> >> +-                h =3D sym_hashes[r_symndx - extsymoff];
> >> ++                h =3D get_link_hash_entry (sym_hashes, r_symndx, ext=
symoff);
> >> +
> >> +                 /* Badly formatted input files can contain relocs th=
at
> >> +                    reference non-existant symbols.  Check here so th=
at
> >> +@@ -11758,17 +11769,13 @@
> >> +                   {
> >> +                     _bfd_error_handler
> >> +                       /* xgettext:c-format */
> >> +-                      (_("error: %pB contains a reloc (%#" PRIx64 ")=
 for section %pA "
> >> ++                      (_("error: %pB contains a reloc (%#" PRIx64 ")=
 for section '%pA' "
> >> +                          "that references a non-existent global symb=
ol"),
> >> +                        input_bfd, (uint64_t) rel->r_info, o);
> >> +                     bfd_set_error (bfd_error_bad_value);
> >> +                     return false;
> >> +                   }
> >> +
> >> +-                while (h->root.type =3D=3D bfd_link_hash_indirect
> >> +-                       || h->root.type =3D=3D bfd_link_hash_warning)
> >> +-                  h =3D (struct elf_link_hash_entry *) h->root.u.i.l=
ink;
> >> +-
> >> +                 s_type =3D h->type;
> >> +
> >> +                 /* If a plugin symbol is referenced from a non-IR fi=
le,
> >> +@@ -11984,7 +11991,6 @@
> >> +                         && flinfo->sections[r_symndx] =3D=3D NULL))
> >> +                   {
> >> +                     struct elf_link_hash_entry *rh;
> >> +-                    unsigned long indx;
> >> +
> >> +                     /* This is a reloc against a global symbol.  We
> >> +                        have not yet output all the local symbols, so
> >> +@@ -11993,15 +11999,16 @@
> >> +                        reloc to point to the global hash table entry
> >> +                        for this symbol.  The symbol index is then
> >> +                        set at the end of bfd_elf_final_link.  */
> >> +-                    indx =3D r_symndx - extsymoff;
> >> +-                    rh =3D elf_sym_hashes (input_bfd)[indx];
> >> +-                    while (rh->root.type =3D=3D bfd_link_hash_indire=
ct
> >> +-                           || rh->root.type =3D=3D bfd_link_hash_war=
ning)
> >> +-                      rh =3D (struct elf_link_hash_entry *) rh->root=
.u.i.link;
> >> +-
> >> +-                    /* Setting the index to -2 tells
> >> +-                       elf_link_output_extsym that this symbol is
> >> +-                       used by a reloc.  */
> >> ++                    rh =3D get_link_hash_entry (elf_sym_hashes (inpu=
t_bfd),
> >> ++                                              r_symndx, extsymoff);
> >> ++                    if (rh =3D=3D NULL)
> >> ++                      {
> >> ++                        /* FIXME: Generate an error ?  */
> >> ++                        continue;
> >> ++                      }
> >> ++
> >> ++                    /* Setting the index to -2 tells elf_link_output=
_extsym
> >> ++                       that this symbol is used by a reloc.  */
> >> +                     BFD_ASSERT (rh->indx < 0);
> >> +                     rh->indx =3D -2;
> >> +                     *rel_hash =3D rh;
> >> +@@ -13965,25 +13972,21 @@
> >> +                      struct elf_link_hash_entry *h,
> >> +                      Elf_Internal_Sym *sym)
> >> + {
> >> +-  if (h !=3D NULL)
> >> ++  if (h =3D=3D NULL)
> >> ++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
> >> ++
> >> ++  switch (h->root.type)
> >> +     {
> >> +-      switch (h->root.type)
> >> +-      {
> >> +-      case bfd_link_hash_defined:
> >> +-      case bfd_link_hash_defweak:
> >> +-        return h->root.u.def.section;
> >> ++    case bfd_link_hash_defined:
> >> ++    case bfd_link_hash_defweak:
> >> ++      return h->root.u.def.section;
> >> +
> >> +-      case bfd_link_hash_common:
> >> +-        return h->root.u.c.p->section;
> >> ++    case bfd_link_hash_common:
> >> ++      return h->root.u.c.p->section;
> >> +
> >> +-      default:
> >> +-        break;
> >> +-      }
> >> ++    default:
> >> ++      return NULL;
> >> +     }
> >> +-  else
> >> +-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
> >> +-
> >> +-  return NULL;
> >> + }
> >> +
> >> + /* Return the debug definition section.  */
> >> +@@ -14032,46 +14035,49 @@
> >> +   if (r_symndx =3D=3D STN_UNDEF)
> >> +     return NULL;
> >> +
> >> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
> >> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
> >> ++  if (h =3D=3D NULL)
> >> ++    {
> >> ++      /* A corrup tinput file can lead to a situation where the inde=
x
> >> ++       does not reference either a local or an external symbol.  */
> >> ++      if (r_symndx >=3D cookie->locsymcount)
> >> ++      return NULL;
> >> +
> >> +-  if (h !=3D NULL)
> >> ++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
> >> ++                            &cookie->locsyms[r_symndx]);
> >> ++    }
> >> ++
> >> ++  bool was_marked =3D h->mark;
> >> ++
> >> ++  h->mark =3D 1;
> >> ++  /* Keep all aliases of the symbol too.  If an object symbol
> >> ++     needs to be copied into .dynbss then all of its aliases
> >> ++     should be present as dynamic symbols, not just the one used
> >> ++     on the copy relocation.  */
> >> ++  hw =3D h;
> >> ++  while (hw->is_weakalias)
> >> +     {
> >> +-      bool was_marked;
> >> ++      hw =3D hw->u.alias;
> >> ++      hw->mark =3D 1;
> >> ++    }
> >> +
> >> +-      was_marked =3D h->mark;
> >> +-      h->mark =3D 1;
> >> +-      /* Keep all aliases of the symbol too.  If an object symbol
> >> +-       needs to be copied into .dynbss then all of its aliases
> >> +-       should be present as dynamic symbols, not just the one used
> >> +-       on the copy relocation.  */
> >> +-      hw =3D h;
> >> +-      while (hw->is_weakalias)
> >> +-      {
> >> +-        hw =3D hw->u.alias;
> >> +-        hw->mark =3D 1;
> >> +-      }
> >> ++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
> >> ++    {
> >> ++      if (info->start_stop_gc)
> >> ++      return NULL;
> >> +
> >> +-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
> >> ++      /* To work around a glibc bug, mark XXX input sections
> >> ++       when there is a reference to __start_XXX or __stop_XXX
> >> ++       symbols.  */
> >> ++      else if (start_stop !=3D NULL)
> >> +       {
> >> +-        if (info->start_stop_gc)
> >> +-          return NULL;
> >> +-
> >> +-        /* To work around a glibc bug, mark XXX input sections
> >> +-           when there is a reference to __start_XXX or __stop_XXX
> >> +-           symbols.  */
> >> +-        else if (start_stop !=3D NULL)
> >> +-          {
> >> +-            asection *s =3D h->u2.start_stop_section;
> >> +-            *start_stop =3D true;
> >> +-            return s;
> >> +-          }
> >> ++        asection *s =3D h->u2.start_stop_section;
> >> ++        *start_stop =3D true;
> >> ++        return s;
> >> +       }
> >> +-
> >> +-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
> >> +     }
> >> +
> >> +-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
> >> +-                        &cookie->locsyms[r_symndx]);
> >> ++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
> >> + }
> >> +
> >> + /* COOKIE->rel describes a relocation against section SEC, which is
> >> +@@ -15094,7 +15100,7 @@
> >> +
> >> +       struct elf_link_hash_entry *h;
> >> +
> >> +-      h =3D get_ext_sym_hash (rcookie, r_symndx);
> >> ++      h =3D get_ext_sym_hash_from_cookie (rcookie, r_symndx);
> >> +
> >> +       if (h !=3D NULL)
> >> +       {
> >> --
> >> 2.49.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#217759): https://lists.openembedded.org/g/openembe=
dded-core/message/217759
> >> Mute This Topic: https://lists.openembedded.org/mt/113443237/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

