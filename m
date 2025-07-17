Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A538FC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 01:33:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.38793.1752715987496223864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 18:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJyMeVQy;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7183d264e55so4052617b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752715986; x=1753320786; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJfoempc0CpRj2/6Oo5XWZLcno1q8jmNw/v5SL/0Bvo=;
        b=XJyMeVQyl+H707w8/rgGCsI9K71zaGnLcznsAA4SGBUHt7r9ioUsZ+nMGmaiMgo+qQ
         WNi2elhQhLHQoGahlB/3FFMBztbLPo0IRz9Z7YBowpn5UmFxmysK7OZUMqO6KFdgsLL4
         GOGC8YZ0gXIRfjAAIwib24/p8nLz9IFKP4Sy4EGAzQL0x5c4KFIb2AoIulBvTWUfe7br
         fSJpxHoD0qTS+dayPPY+7m9WLPJVlZgYy2ghmjS2WW1BkzDGzKOdHEY9jSnL2aFShoka
         dWoN8OB9NFdBjF57OHjATa//RaO62gmxou16J2/BotgDU7lbbtACrZ/zzMiw/8G9mnXl
         ShpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752715986; x=1753320786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJfoempc0CpRj2/6Oo5XWZLcno1q8jmNw/v5SL/0Bvo=;
        b=k3Lx9vXKzHY6mMdpFxZK1MxCadGeF6W754jfd0dQNmeldUUpMW2Ro5qtAef0a4CtrN
         7QA619uP7aqeXQsjJ9Tk5mv+b3dY6Psoqvd2kPJ4vDEanD7IY4ScdSM6eJZ3VYyIYpoP
         tgjpH+8IHZfzCeeG3lYjCizq8ci237LZTAp9g26Yz5hcKj4G/WUvJgxlshmlaO/RvwO9
         vmm8Fw4Dxt2hGGv7AyJ0oR7O1HlE0cJ8SboD1K0MAfl3whvB5CB1REWZ91evDt2uTcrd
         x3FfBC+0p6nUT1GaYN3yVfymy7/ax//WAzJIiYLwplzrE8MTovrFRGEDLSQ05rMpdBol
         ozGQ==
X-Gm-Message-State: AOJu0YyOG3GHK+h3uq3+rg2a2lKAcFJQ+2Kj0+XAybpyI2v7cuZ59/pk
	T/52/S2JzcGiKYzVpWmtc/3GGHDm4OWgE1UwLO+thEbOvXATAui1mpQ6+M1BFUBL9J4IfGkCDq9
	q6w15jgTxwf2fKLi8ygfOdcVqZv5TpqCLl5yX
X-Gm-Gg: ASbGncuY5RbCyMerg5AbMaGGL0o/KPB206xUDP2gXwiNDtISWVAwNhYL2Ln5ENjDqVq
	5fiaozJcyEFESnrNtHPxFkWd1OfX3HSNVOl0KncCXC3u43TzJTA59UePRfy07n53lfK7fQwLlya
	6K/3Zne2xd9uBykwwOg4JHlETdp443Y37NQTBJdglXbA7kxmcbu3nRTZ5wPAgPMzvu0wnAWbuR3
	bL29HrblMwTrIGl
X-Google-Smtp-Source: AGHT+IGpuZ6qXn3RV3U4//PHa1DTsjri8Xeu99SPriBexVjSN/f8DsRfaYkZ9+z8JaE7hCB4E6C5i2wKbexn4qPuZhw=
X-Received: by 2002:a05:690c:4d41:b0:718:3982:d577 with SMTP id
 00721157ae682-718a9820872mr13417907b3.38.1752715986297; Wed, 16 Jul 2025
 18:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250716123455.901574-1-Yash.Shinde@windriver.com>
In-Reply-To: <20250716123455.901574-1-Yash.Shinde@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 18:32:40 -0700
X-Gm-Features: Ac12FXwnegMw8D_FZh58Ot597eArkUijxfzxnmjgzyh1dnbK5kjFV6LdMjjuFts
Message-ID: <CAMKF1sryT9YRiOPw5Egv6zVKS7+UDrdZngzYwY7_MEotwX3jcA@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] binutils: Fix CVE-2025-7546
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220481

LGTM

On Wed, Jul 16, 2025 at 5:45=E2=80=AFAM Yash Shinde via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Report corrupted group section instead of trying to recover.
>
> CVE: CVE-2025-7546
> Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinu=
tils-gdb.git;h=3D41461010eb7c79fee7a9d5f6209accdaac66cc6b]
> PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D33050]
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../binutils/binutils-2.44.inc                |  1 +
>  .../binutils/0018-CVE-2025-7546.patch         | 58 +++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025=
-7546.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/reci=
pes-devtools/binutils/binutils-2.44.inc
> index e5df62b14e..3c32ad6cc2 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -42,5 +42,6 @@ SRC_URI =3D "\
>       file://0017-CVE-2025-1181-2.patch \
>       file://0016-CVE-2025-5244.patch \
>       file://0016-CVE-2025-3198.patch \
> +     file://0018-CVE-2025-7546.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.p=
atch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
> new file mode 100644
> index 0000000000..23c38091a2
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
> @@ -0,0 +1,58 @@
> +From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Sat, 21 Jun 2025 06:52:00 +0800
> +Subject: [PATCH] elf: Report corrupted group section
> +
> +Report corrupted group section instead of trying to recover.
> +
> +       PR binutils/33050
> +       * elf.c (bfd_elf_set_group_contents): Report corrupted group
> +       section.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D41461010eb7c79fee7a9d5f6209accdaac66cc6b]
> +CVE: CVE-2025-7546
> +
> +Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +---
> + bfd/elf.c | 23 ++++++++++-------------
> + 1 file changed, 10 insertions(+), 13 deletions(-)
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index 14ce15c7254..ee894eb05f2 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -3971,20 +3971,17 @@ bfd_elf_set_group_contents (bfd *abfd, asection =
*sec, void *failedptrarg)
> +       break;
> +     }
> +
> +-  /* We should always get here with loc =3D=3D sec->contents + 4, but i=
t is
> +-     possible to craft bogus SHT_GROUP sections that will cause segfaul=
ts
> +-     in objcopy without checking loc here and in the loop above.  */
> +-  if (loc =3D=3D sec->contents)
> +-    BFD_ASSERT (0);
> +-  else
> ++  /* We should always get here with loc =3D=3D sec->contents + 4.  Retu=
rn
> ++     an error for bogus SHT_GROUP sections.  */
> ++  loc -=3D 4;
> ++  if (loc !=3D sec->contents)
> +     {
> +-      loc -=3D 4;
> +-      if (loc !=3D sec->contents)
> +-      {
> +-        BFD_ASSERT (0);
> +-        memset (sec->contents + 4, 0, loc - sec->contents);
> +-        loc =3D sec->contents;
> +-      }
> ++      /* xgettext:c-format */
> ++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
> ++                        abfd, sec);
> ++      bfd_set_error (bfd_error_bad_value);
> ++      *failedptr =3D true;
> ++      return;
> +     }
> +
> +   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
> +--
> +2.43.5
> +
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220450): https://lists.openembedded.org/g/openembedde=
d-core/message/220450
> Mute This Topic: https://lists.openembedded.org/mt/114183822/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

