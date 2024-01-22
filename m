Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADE1C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:03:02 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.78002.1705939376769063869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LC1T4aKv;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bd884146e9so2819228b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705939376; x=1706544176; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEIX5wV1WoV1CBIpxtwxmgJ6hmIgD+0wPlSdiK4i5M8=;
        b=LC1T4aKvW5LnT8skR1s/j2VHB6nPwRBU26TMZ4Seq57nAYBilZBXYvlmveLq9Z4g/+
         J/wtdAEQRKVt2QNtRc/6CmuyuBA3i1qFtOK68fI+6PztnLrLJMzGXBY5GywwO1A+0jkU
         o1fETx2vXhFFBKRci7WCcv88xtevEy3gP5C09NEEkZrViUkYcj3ONRifIzVd0I/6BvP2
         608Xp3TkZwrJ5KjXPDJiyDVnaU0eFH9/wXmcH8Zv0N36KHXP4jQFmnn0exan0nTA8iYt
         3KT765F2B9jSaHs9EjrK0cxQjDoS+98vg4i6mbnjJtUgsheOhfUvWGCUlFaIGRVxHKF2
         Aojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705939376; x=1706544176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEIX5wV1WoV1CBIpxtwxmgJ6hmIgD+0wPlSdiK4i5M8=;
        b=wDOLwHsAPEomUIuEuElHR8wajnPexhkUdg1cyB1lgsphnYgsXD42juGEkjLL/o55AN
         Qc1J0XkuhaF9HFVNuu8c0RupXpEJzY0uSwcdxUaduHCdD0LmB3mKxoZKjO1+wf4KCTo8
         lWnTlEUUdqL+CzvVrR2sgl4dlmWzIKTvUSh5kL+RHyhENYvnz4AVgjkkQCZayXLdiY0P
         FfmBb7Canpdc7fcnEMFSdgUbEgzF70NrhtVhkN0I2bggMPn4bJekpuEGjXM+kMHX7lSm
         cnbIYpn16EkOcuX8QEJY8Ia+w6hbHSqhmkpjzSY9NOwoxiDc7q8BBkEnKbTIgD9M+xxc
         VWWQ==
X-Gm-Message-State: AOJu0Yyfhxj50n7vMMObApG7+/c5GteHVcJiXqrS7syzWGArAKYM0U13
	glWlhE3DsN6+GoTXbZ9E7XJJ1WSIhOGZvObiXSArKR6H6ydCJJwIirLCNg4FodAOQXxftlzJXKW
	c4bBPtBYxzJZyjIgqkHTIq+yopM0=
X-Google-Smtp-Source: AGHT+IHQ4vX2J8Xkvuwcwp7aqIjYuV4A50JXcKOaRJx4PVhHPXEwZ6ew26jRTz0CWuuKb9e7n8elfasLDGYQAA2IJFw=
X-Received: by 2002:a05:6870:4712:b0:214:4305:eb30 with SMTP id
 b18-20020a056870471200b002144305eb30mr105761oaq.77.1705939375702; Mon, 22 Jan
 2024 08:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20240122075626.1216098-1-ashish.emailaddress@gmail.com>
In-Reply-To: <20240122075626.1216098-1-ashish.emailaddress@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jan 2024 08:02:29 -0800
Message-ID: <CAMKF1sqyYREo8gOB3Zjto=eUBEOQzn3Fszn3D7dE5f6-u2Wkdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils : CVE-2023-25584
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194180

On Sun, Jan 21, 2024 at 11:56=E2=80=AFPM Ashishx88
<ashish.emailaddress@gmail.com> wrote:
>
> Closes: CVE-2023-25584
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dpatch;h=3D77c225bdeb410cf60da804879ad41622f5f1aa44]
>
> Signed-off-by: Ashish Kumar Mishra <ashish.emailaddress@gmail.com>
> ---
>  .../binutils/binutils-2.39.inc                |   1 +
>  .../binutils/0016-CVE-2023-25584.patch        | 534 ++++++++++++++++++
>  2 files changed, 535 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2023=
-25584.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/reci=
pes-devtools/binutils/binutils-2.39.inc
> index 419571d56c..5b84ee1a8d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.39.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
> @@ -36,6 +36,7 @@ SRC_URI =3D "\
>       file://0014-CVE-2022-38128-2.patch \
>       file://0014-CVE-2022-38128-3.patch \
>       file://0015-CVE-2022-4285.patch \
> +                file://0016-CVE-2023-25584.patch \

This looks like tabs and spaces mixup. Please keep it consistent.

>  "
>  S  =3D "${WORKDIR}/git"
>  # Already in 2.39 branch
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.=
patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.patch
> new file mode 100644
> index 0000000000..876322b75e
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.patch
> @@ -0,0 +1,534 @@
> +From 278ba66aa1d2f1a355940ae2c706ad804becda07 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sun, 21 Jan 2024 20:10:49 +0530
> +Subject: [PATCH] CVE-2023-25584
> +
> +Lack of bounds checking in vms-alpha.c parse_module
> +
> +       PR 29873
> +       PR 29874
> +       PR 29875
> +       PR 29876
> +       PR 29877
> +       PR 29878
> +       PR 29879
> +       PR 29880
> +       PR 29881
> +       PR 29882
> +       PR 29883
> +       PR 29884
> +       PR 29885
> +       PR 29886
> +       PR 29887
> +       PR 29888
> +       PR 29889
> +       PR 29890
> +       PR 29891
> +       * vms-alpha.c (parse_module): Make length param bfd_size_type.
> +       Delete length =3D=3D -1 checks.  Sanity check record_length.
> +       Sanity check DST__K_MODBEG, DST__K_RTNBEG, DST__K_RTNEND lengths.
> +       Sanity check DST__K_SOURCE and DST__K_LINE_NUM elements
> +       before accessing.
> +       (build_module_list): Pass dst_section size to parse_modu
> +
> +Closes: CVE-2023-25584
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dpatch;h=3D77c225bdeb410cf60da804879ad41622f5f1aa44]
> +
> +Signed-off-by: Ashish Kumar Mishra <ashish.emailaddress@gmail.com>
> +---
> + bfd/vms-alpha.c | 213 ++++++++++++++++++++++++++++++++++++++----------
> + 1 file changed, 168 insertions(+), 45 deletions(-)
> +
> +diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
> +index 5a867f71..9b0b2a51 100644
> +--- a/bfd/vms-alpha.c
> ++++ b/bfd/vms-alpha.c
> +@@ -4340,7 +4340,7 @@ new_module (bfd *abfd)
> +
> + static bool
> + parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> +-            int length)
> ++            bfd_size_type length)
> + {
> +   unsigned char *maxptr =3D ptr + length;
> +   unsigned char *src_ptr, *pcl_ptr;
> +@@ -4361,7 +4361,7 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +     return false;
> +   module->line_table =3D curr_line;
> +
> +-  while (length =3D=3D -1 || ptr < maxptr)
> ++  while (ptr + 3 < maxptr)
> +     {
> +       /* The first byte is not counted in the recorded length.  */
> +       int rec_length =3D bfd_getl16 (ptr) + 1;
> +@@ -4369,15 +4369,19 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +
> +       vms_debug2 ((2, "DST record: leng %d, type %d\n", rec_length, rec=
_type));
> +
> +-      if (length =3D=3D -1 && rec_type =3D=3D DST__K_MODEND)
> ++      if (rec_length > maxptr - ptr)
> ++      break;
> ++      if (rec_type =3D=3D DST__K_MODEND)
> +       break;
> +
> +       switch (rec_type)
> +       {
> +       case DST__K_MODBEG:
> ++        if (rec_length <=3D DST_S_B_MODBEG_NAME)
> ++          break;
> +         module->name
> +           =3D _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_MODBEG_=
NAME,
> +-                                          maxptr - (ptr + DST_S_B_MODBE=
G_NAME));
> ++                                          rec_length - DST_S_B_MODBEG_N=
AME);
> +
> +         curr_pc =3D 0;
> +         prev_pc =3D 0;
> +@@ -4391,13 +4395,15 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +         break;
> +
> +       case DST__K_RTNBEG:
> ++        if (rec_length <=3D DST_S_B_RTNBEG_NAME)
> ++          break;
> +         funcinfo =3D (struct funcinfo *)
> +           bfd_zalloc (abfd, sizeof (struct funcinfo));
> +         if (!funcinfo)
> +           return false;
> +         funcinfo->name
> +           =3D _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_=
NAME,
> +-                                          maxptr - (ptr + DST_S_B_RTNBE=
G_NAME));
> ++                                          rec_length - DST_S_B_RTNBEG_N=
AME);
> +         funcinfo->low =3D bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
> +         funcinfo->next =3D module->func_table;
> +         module->func_table =3D funcinfo;
> +@@ -4407,6 +4413,8 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +         break;
> +
> +       case DST__K_RTNEND:
> ++        if (rec_length < DST_S_L_RTNEND_SIZE + 4)
> ++          break;
> +         if (!module->func_table)
> +           return false;
> +         module->func_table->high =3D module->func_table->low
> +@@ -4439,10 +4447,63 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +
> +         vms_debug2 ((3, "source info\n"));
> +
> +-        while (src_ptr < ptr + rec_length)
> ++        while (src_ptr - ptr < rec_length)
> +           {
> +             int cmd =3D src_ptr[0], cmd_length, data;
> +
> ++            switch (cmd)
> ++              {
> ++              case DST__K_SRC_DECLFILE:
> ++                if (src_ptr - ptr + DST_S_B_SRC_DF_LENGTH >=3D rec_leng=
th)
> ++                  cmd_length =3D 0x10000;
> ++                else
> ++                  cmd_length =3D src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
> ++                break;
> ++
> ++              case DST__K_SRC_DEFLINES_B:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SRC_DEFLINES_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_INCRLNUM_B:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SRC_SETFILE:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_SETLNUM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SRC_SETLNUM_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_SETREC_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SRC_SETREC_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_FORMFEED:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              default:
> ++                cmd_length =3D 2;
> ++                break;
> ++              }
> ++
> ++            if (src_ptr - ptr + cmd_length > rec_length)
> ++              break;
> ++
> +             switch (cmd)
> +               {
> +               case DST__K_SRC_DECLFILE:
> +@@ -4467,7 +4528,6 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +
> +                   module->file_table [fileid].name =3D filename;
> +                   module->file_table [fileid].srec =3D 1;
> +-                  cmd_length =3D src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
> +                   vms_debug2 ((4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
> +                                fileid, module->file_table [fileid].name=
));
> +                 }
> +@@ -4484,7 +4544,6 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +                 srec->sfile =3D curr_srec->sfile;
> +                 curr_srec->next =3D srec;
> +                 curr_srec =3D srec;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_B: %d\n", data));
> +                 break;
> +
> +@@ -4499,14 +4558,12 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                 srec->sfile =3D curr_srec->sfile;
> +                 curr_srec->next =3D srec;
> +                 curr_srec =3D srec;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_INCRLNUM_B:
> +                 data =3D src_ptr[DST_S_B_SRC_UNSBYTE];
> +                 curr_srec->line +=3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data));
> +                 break;
> +
> +@@ -4514,21 +4571,18 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                 data =3D bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> +                 curr_srec->sfile =3D data;
> +                 curr_srec->srec =3D module->file_table[data].srec;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETFILE: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_SETLNUM_L:
> +                 data =3D bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
> +                 curr_srec->line =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_SETLNUM_W:
> +                 data =3D bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> +                 curr_srec->line =3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_W: %d\n", data));
> +                 break;
> +
> +@@ -4536,7 +4590,6 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +                 data =3D bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
> +                 curr_srec->srec =3D data;
> +                 module->file_table[curr_srec->sfile].srec =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETREC_L: %d\n", data));
> +                 break;
> +
> +@@ -4544,19 +4597,16 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                 data =3D bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> +                 curr_srec->srec =3D data;
> +                 module->file_table[curr_srec->sfile].srec =3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETREC_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_FORMFEED:
> +-                cmd_length =3D 1;
> +                 vms_debug2 ((4, "DST_S_C_SRC_FORMFEED\n"));
> +                 break;
> +
> +               default:
> +                 _bfd_error_handler (_("unknown source command %d"),
> +                                     cmd);
> +-                cmd_length =3D 2;
> +                 break;
> +               }
> +
> +@@ -4569,18 +4619,114 @@ parse_module (bfd *abfd, struct module *module,=
 unsigned char *ptr,
> +
> +         vms_debug2 ((3, "line info\n"));
> +
> +-        while (pcl_ptr < ptr + rec_length)
> ++        while (pcl_ptr - ptr < rec_length)
> +           {
> +             /* The command byte is signed so we must sign-extend it.  *=
/
> +             int cmd =3D ((signed char *)pcl_ptr)[0], cmd_length, data;
> +
> ++            switch (cmd)
> ++              {
> ++              case DST__K_DELTA_PC_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_DELTA_PC_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_INCR_LINUM:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_INCR_LINUM_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_INCR_LINUM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_INCR:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_INCR_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_RESET_LINUM_INCR:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              case DST__K_BEG_STMT_MODE:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              case DST__K_END_STMT_MODE:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_B:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_PC:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SET_PC_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SET_PC_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_STMTNUM:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_TERM:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_TERM_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_TERM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_ABS_PC:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              default:
> ++                if (cmd <=3D 0)
> ++                  cmd_length =3D 1;
> ++                else
> ++                  cmd_length =3D 2;
> ++                break;
> ++              }
> ++
> ++            if (pcl_ptr - ptr + cmd_length > rec_length)
> ++              break;
> ++
> +             switch (cmd)
> +               {
> +               case DST__K_DELTA_PC_W:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_pc +=3D data;
> +                 curr_linenum +=3D 1;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_DELTA_PC_W: %d\n", data));
> +                 break;
> +
> +@@ -4588,131 +4734,111 @@ parse_module (bfd *abfd, struct module *module=
, unsigned char *ptr,
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_pc +=3D data;
> +                 curr_linenum +=3D 1;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_DELTA_PC_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_INCR_LINUM:
> +                 data =3D pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> +                 curr_linenum +=3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST__K_INCR_LINUM: %d\n", data));
> +                 break;
> +
> +               case DST__K_INCR_LINUM_W:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_linenum +=3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_INCR_LINUM_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_INCR_LINUM_L:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_linenum +=3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_INCR_LINUM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_LINUM_INCR:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_LINUM_INCR");
> +-                cmd_length =3D 2;
> +                 break;
> +
> +               case DST__K_SET_LINUM_INCR_W:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_LINUM_INCR_W");
> +-                cmd_length =3D 3;
> +                 break;
> +
> +               case DST__K_RESET_LINUM_INCR:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_RESET_LINUM_INCR");
> +-                cmd_length =3D 1;
> +                 break;
> +
> +               case DST__K_BEG_STMT_MODE:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_BEG_STMT_MODE");
> +-                cmd_length =3D 1;
> +                 break;
> +
> +               case DST__K_END_STMT_MODE:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_END_STMT_MODE");
> +-                cmd_length =3D 1;
> +                 break;
> +
> +               case DST__K_SET_LINUM_B:
> +                 data =3D pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> +                 curr_linenum =3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST__K_SET_LINUM_B: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_LINUM:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_linenum =3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_SET_LINE_NUM: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_LINUM_L:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_linenum =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_SET_LINUM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_PC:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_PC");
> +-                cmd_length =3D 2;
> +                 break;
> +
> +               case DST__K_SET_PC_W:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_PC_W");
> +-                cmd_length =3D 3;
> +                 break;
> +
> +               case DST__K_SET_PC_L:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_PC_L");
> +-                cmd_length =3D 5;
> +                 break;
> +
> +               case DST__K_SET_STMTNUM:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_STMTNUM");
> +-                cmd_length =3D 2;
> +                 break;
> +
> +               case DST__K_TERM:
> +                 data =3D pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> +                 curr_pc +=3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST__K_TERM: %d\n", data));
> +                 break;
> +
> +               case DST__K_TERM_W:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_pc +=3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_TERM_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_TERM_L:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_pc +=3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_TERM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_ABS_PC:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_pc =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_SET_ABS_PC: 0x%x\n", data));
> +                 break;
> +
> +@@ -4721,15 +4847,11 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                   {
> +                     curr_pc -=3D cmd;
> +                     curr_linenum +=3D 1;
> +-                    cmd_length =3D 1;
> +                     vms_debug2 ((4, "bump pc to 0x%lx and line to %d\n"=
,
> +                                  (unsigned long)curr_pc, curr_linenum))=
;
> +                   }
> +                 else
> +-                  {
> +-                    _bfd_error_handler (_("unknown line command %d"), c=
md);
> +-                    cmd_length =3D 2;
> +-                  }
> ++                  _bfd_error_handler (_("unknown line command %d"), cmd=
);
> +                 break;
> +               }
> +
> +@@ -4859,7 +4981,8 @@ build_module_list (bfd *abfd)
> +       return NULL;
> +
> +       module =3D new_module (abfd);
> +-      if (!parse_module (abfd, module, PRIV (dst_section)->contents, -1=
))
> ++      if (!parse_module (abfd, module, PRIV (dst_section)->contents,
> ++                       PRIV (dst_section)->size))
> +       return NULL;
> +       list =3D module;
> +     }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194117): https://lists.openembedded.org/g/openembedde=
d-core/message/194117
> Mute This Topic: https://lists.openembedded.org/mt/103882398/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

