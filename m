Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E6FCCD19F
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 23:27:44 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.6500.1761002856287156063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 16:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6ky1JqR;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-784966ad073so21687077b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 16:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761002855; x=1761607655; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1frYTDEmkDC8iyfc7iE30ethxJTUDh0dXV4dtA+GEE=;
        b=m6ky1JqRO65PQua+nCdbwhE+V3ug9cRzuWOeGfHXDT9QQz8kArCNNYUDKk5/OzqQRx
         6USTxvzuwAGdmFpFqJ6IYIDGh64VoDaUsf+R9IzdVlUzROdaN2H/eO0Dqfw6zttMOFsg
         giFIhd9ugltfD3VgilEDUFCW19E1PU3LDE81DFaDbNi73fIQDNRlyQMPL6odQs3h/CV8
         isOVrBpm7TFmwdr0n+C75wjjeuHt1wYVNihSqH8swzqv6tqChEGYFRuDKJ47R0WMPkIu
         DTPJvZ+L5AROaWKRli6BY/d55JIyFA/AvIrXbIOQfMvDL7bTd34lxlpomxYQrA5JZUvg
         wb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761002855; x=1761607655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1frYTDEmkDC8iyfc7iE30ethxJTUDh0dXV4dtA+GEE=;
        b=mDO4QH28yiNqajYDLNyjtcBcH0ze/mOcE8ie5Y7x0VXgKTf20xRQ/sK38fu4iaLKdv
         ehEp7aK/Rta+S9K6HNK5/GP7ry+FzCw6/rBUoF2+6/jkLPHeRJa4MCuujgRCnyqDWHId
         D2VJptagRMQXu7ZmPTFT/ukoujp8dhkuQfnPcwqbyRFOFZo7Jg1OjYddx1PWoJett1aw
         1uCyEHrlR6PQb/RA2Qrtqpgfgs3OUsBdcVH19/LzhFFiZVmcE3VDulAARnHcMf55SQGl
         Y9Lv30iBniIwinbJkkTyK+qNAxKzM1vK6RyzknzbZxfXYBQ2obPYbZzNqd5mPKkBfof4
         e9lA==
X-Gm-Message-State: AOJu0Yz1O+9xfJmX8BDanqWcotxI6MA3eATHhjJiRU60Te7DtIReTY5W
	HzCKgJLg5QFQXTs3jAFu38oI28UV6Upy7cQwVyPZ4Br4uB5m80t+3r54TXmPcZ7xoY3KdSs6Wc6
	JbE58IgK4HmAT5fal7kJKaAAs3hIpmSw=
X-Gm-Gg: ASbGncuXAvoKV1Tw0OD+xwNAk7wju305sMQj035d4k8/x3mSV6jEpvXrD5ozyw2/7pm
	+rYMDkkh2t/5Gs/d1z6KrUGbHsFCOJMRbf78qLS8cfv887OBYQYu1IN6kzpPyqJM6Kd59YFu5K+
	Hy+xeDIgxihb5Yqq2KoAT0x4jXrXNnpQk34mCjX6oGdYlGSPreI512Y3zCpTP7vVWciyxKmna9r
	3dXsTmhd221N/ZBkg5NpTsgLdzDNwAO3kTXCGq3s9ME7dVLTh9O0akKmSzDqIiCa3ODaEpdPT83
	iDiJWm9p11u7SW+OZ99xSxxeXwadK20G2R/DWjKeIEEjNF6gDOO9kKMmUBdAfYlvLET1eATJozF
	m1BGdXoiYZzLjCgNmDye0cnY=
X-Google-Smtp-Source: AGHT+IF1u2Fa9QKbLfBH5Us3z0aGfU+BieR7vkZL+VdtvrmR76szymMUMRFWGhBMWTwkrqCmXkOKppw8GuOjXUYVWc0=
X-Received: by 2002:a05:690e:130e:b0:63e:30d0:2500 with SMTP id
 956f58d0204a3-63e30d026eemr5741447d50.9.1761002855155; Mon, 20 Oct 2025
 16:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251020220912.483748-1-peter.marko@siemens.com>
In-Reply-To: <20251020220912.483748-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Oct 2025 16:27:09 -0700
X-Gm-Features: AS18NWCvIanwfavubYzyA0gSSWV3eXa1Dkx3r9niMcujaHoiw1eMWZn8l9mDKRQ
Message-ID: <CAMKF1sqH4BOrLyc5jn3FknqZbxn_obRQQ+iZevGVrPgwWc2btg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/5] binutils: patch CVE-2025-11414
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 23:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225140

all 5 Patches are good, thanks.

On Mon, Oct 20, 2025 at 3:09=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit per NVD CVE report.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../binutils/binutils-2.45.inc                |  1 +
>  .../binutils/binutils/CVE-2025-11414.patch    | 84 +++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1141=
4.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 391b0157d3a..2adff3c4562 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -39,4 +39,5 @@ SRC_URI =3D "\
>       file://0015-CVE-2025-11081.patch \
>       file://0016-CVE-2025-11082.patch \
>       file://0017-CVE-2025-11083.patch \
> +     file://CVE-2025-11414.patch \
>  "
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
> new file mode 100644
> index 00000000000..21f98f075ed
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
> @@ -0,0 +1,84 @@
> +From aeaaa9af6359c8e394ce9cf24911fec4f4d23703 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Tue, 23 Sep 2025 08:52:26 +0800
> +Subject: [PATCH] elf: Return error on unsorted symbol table if not allow=
ed
> +
> +Normally ELF symbol table should be sorted, i.e., local symbols precede
> +global symbols.  Irix 6 is an exception and its elf_bad_symtab is set
> +to true.  Issue an error if elf_bad_symtab is false and symbol table is
> +unsorted.
> +
> +       PR ld/33450
> +       * elflink.c (set_symbol_value): Change return type to bool and
> +       return false on error.  Issue an error on unsorted symbol table
> +       if not allowed.
> +       (elf_link_input_bfd): Return false if set_symbol_value reurns
> +       false.
> +
> +Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> +
> +CVE: CVE-2025-11414
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3Daeaaa9af6359c8e394ce9cf24911fec4f4d23703]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + bfd/elflink.c | 21 +++++++++++++++------
> + 1 file changed, 15 insertions(+), 6 deletions(-)
> +
> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> +index 66982f82b94..54f0d6e957e 100644
> +--- a/bfd/elflink.c
> ++++ b/bfd/elflink.c
> +@@ -9127,7 +9127,7 @@ struct elf_outext_info
> +    <binary-operator> :=3D as in C
> +    <unary-operator> :=3D as in C, plus "0-" for unambiguous negation.  =
*/
> +
> +-static void
> ++static bool
> + set_symbol_value (bfd *bfd_with_globals,
> +                 Elf_Internal_Sym *isymbuf,
> +                 size_t locsymcount,
> +@@ -9148,9 +9148,15 @@ set_symbol_value (bfd *bfd_with_globals,
> +            "absolute" section and give it a value.  */
> +         sym->st_shndx =3D SHN_ABS;
> +         sym->st_value =3D val;
> +-        return;
> ++        return true;
> ++      }
> ++      if (!elf_bad_symtab (bfd_with_globals))
> ++      {
> ++        _bfd_error_handler (_("%pB: corrupt symbol table"),
> ++                            bfd_with_globals);
> ++        bfd_set_error (bfd_error_bad_value);
> ++        return false;
> +       }
> +-      BFD_ASSERT (elf_bad_symtab (bfd_with_globals));
> +       extsymoff =3D 0;
> +     }
> +
> +@@ -9160,11 +9166,12 @@ set_symbol_value (bfd *bfd_with_globals,
> +   if (h =3D=3D NULL)
> +     {
> +       /* FIXMEL What should we do ?  */
> +-      return;
> ++      return false;
> +     }
> +   h->root.type =3D bfd_link_hash_defined;
> +   h->root.u.def.value =3D val;
> +   h->root.u.def.section =3D bfd_abs_section_ptr;
> ++  return true;
> + }
> +
> + static bool
> +@@ -11862,8 +11869,10 @@ elf_link_input_bfd (struct elf_final_link_info =
*flinfo, bfd *input_bfd)
> +                   return false;
> +
> +                 /* Symbol evaluated OK.  Update to absolute value.  */
> +-                set_symbol_value (input_bfd, isymbuf, locsymcount,
> +-                                  r_symndx, val);
> ++                if (!set_symbol_value (input_bfd, isymbuf, locsymcount,=
 r_symndx,
> ++                                       val))
> ++                  return false;
> ++
> +                 continue;
> +               }
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225135): https://lists.openembedded.org/g/openembedde=
d-core/message/225135
> Mute This Topic: https://lists.openembedded.org/mt/115863664/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

