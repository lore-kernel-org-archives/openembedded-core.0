Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68010CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 22:11:14 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.1537.1760393473942584750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 15:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ln3Ulcnn;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-394587df7c4so2212672fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760393473; x=1760998273; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQhAjJflKL8aHZ1CBO4VumBJvPmEGWj++wamb+azIBA=;
        b=Ln3Ulcnn+XxjleC7VnJl+1zk0JMJ/5rDshAZ9Ym1hbQrjF197GLs4pWBpxXRQAyiS3
         jLzlrrNZ/4777A8P+8OW8oL2e796RYEBdkLkPnzRGDp+WYWqkImRf4wQ50iDHtFmvjnZ
         yM0le5N4TiEsdSHFGr/aqWaiYIneH4yd1WFQOv1ttCH9VOcTN3S5m571BfBCCbrNOzcm
         uYn71B6WMDPzisvHVWYzE6EdgFtOrFNjjIsDNZy9nXGki4e98z0TeTqKemtQBvS9yrbI
         NZTGzmA4LY7OTr0k9jvs1FyNnZd/JLawDkq/3PONyA6Ntzgb1Hsn6D/4vn8+zNzNYFIx
         DGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760393473; x=1760998273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQhAjJflKL8aHZ1CBO4VumBJvPmEGWj++wamb+azIBA=;
        b=f9Wal7OYN+XpKEJUBThgm4Lu5m1YmwHcNiF/wMnPHRp5X5ZGK9hrU/An0POiZxHkjd
         bWgQiMpdBZoE1rrdgJe/X0GJ02s6Bt8Gw2DKtLf3jHGl9Vx/vEmQzYsqCoG/sHFc1+WN
         juMkp/deRCfUAbua+tlceah1bw9QHOvj20WCa6HTpEVOHorjxodIQVyJKuCcRfS89mQP
         /MEBIGbMZaF2wY/IHy7r5FtlNs7dQue6Z/Pg7cQmonIim8JdPeiQKENJ87cq2aAeC/uD
         HfK6QV5ESUIkCajmsNlCklKMGZ4Fy1ap3kVbyr93chprm+W0S8Viy6GDlFzxNlUc9j/j
         1Avw==
X-Gm-Message-State: AOJu0YyPFymZ0TS/K+lkbDc+tMLJDKhSCtrIFjZWZmqjaKmaX0c2LJxF
	IUT4sO7qqPgzkAVstHAkTQWEUmSmxmAIni604cbPwcQ0SU5HQLvtAjXesvL/pC3EVqfrdfVh6NM
	3jbPc+WrGlkk7M/51L3iR5ToS3z3kuxE=
X-Gm-Gg: ASbGncsHDXXA0W2lvN3R/LCuJbLC9XhvS+DfPs1tuBNcYkpz4dCDTgb2NYiglFfws/H
	Clb1v93Rzfzyz4hVGymPndndZw4EzF9Bc+bN5c79DHifX9+yyITe7Clk9sIO050NwH/08UqS5DZ
	kwn86P0sZOF3tqEiazd1dOvZVStuGn/XBERiWQCrJHNyteuNYWNFQXsYmQb9/C7jfELe4CwBLa+
	pPRcTR1sD38z7EMAqTCaMmvoTqHYCJMYBgQ4pI=
X-Google-Smtp-Source: AGHT+IE/pUaTxes6/BocFus+efziostFh7Yju41DoIvaJW9ABlcSl5dyySKty0XC8zPkB54kqzuB7GeLyfm8UnVLGLA=
X-Received: by 2002:a05:6871:5b16:b0:349:de3c:bfbc with SMTP id
 586e51a60fabf-3c0f9e6b0d1mr9125798fac.33.1760393473124; Mon, 13 Oct 2025
 15:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251013210954.12041-1-phanirajkiran.a@gmail.com>
In-Reply-To: <20251013210954.12041-1-phanirajkiran.a@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 14 Oct 2025 11:11:02 +1300
X-Gm-Features: AS18NWC8I5dMl8iQtmWq7PNYWUFsu0vmYPpAvNhMv-ZrngvO-0RFh_T_E_fFkTE
Message-ID: <CADySD0Hzhbd+_g3-svkXi4k4RD8N6e1Tog7jYDPg9Gbvc=vHbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
To: phanirajkiran.a@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Gunda Swetha <swetha12g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 22:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224801

Seems you intend this patch for scarthgap but your patch is missing branch =
name.
Can you please resend with updated "--subject-prefix" to make sure
this patch is included for scarthgap.

On Tue, Oct 14, 2025 at 10:37=E2=80=AFAM Mallapuram Phani raj kiran via
lists.openembedded.org
<phanirajkiran.a=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
>
> Fixes [YOCTO #15932]
>
> The musl libc code in LTS (Scarthgap) is missing
> the fix addressing CVE-2025-26519.  This patch backports the upstream
> changes (or applies the required fix) so that LTS builds include it.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-26519
>
> (From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
>
> Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
> Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
>
> Reported-by: Cristian Morales Vega
> ---
>  ...x-for-CVE-2025-26519-to-LTS-branches.patch | 50 +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl/0001-musl-backport-fix-fo=
r-CVE-2025-26519-to-LTS-branches.patch
>
> diff --git a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2=
025-26519-to-LTS-branches.patch b/meta/recipes-core/musl/musl/0001-musl-bac=
kport-fix-for-CVE-2025-26519-to-LTS-branches.patch
> new file mode 100644
> index 0000000000..3f0b14a5d0
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-265=
19-to-LTS-branches.patch
> @@ -0,0 +1,50 @@
> +From 7ee0592397ea0e3d4b47018631642864864d443d Mon Sep 17 00:00:00 2001
> +From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
> +Date: Tue, 14 Oct 2025 01:40:45 +0530
> +Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
> +
> +Fixes [YOCTO #15932]
> +
> +The musl libc code in LTS (Scarthgap) is missing
> +the fix addressing CVE-2025-26519.  This patch backports the upstream
> +changes (or applies the required fix) so that LTS builds include it.
> +
> +Reference:
> +https://nvd.nist.gov/vuln/detail/CVE-2025-26519
> +(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
> +
> +Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
> +Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
> +
> +Reported-by: Cristian Morales Vega
> +---
> + src/locale/iconv.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/locale/iconv.c b/src/locale/iconv.c
> +index 3047c27b..0729465e 100644
> +--- a/src/locale/iconv.c
> ++++ b/src/locale/iconv.c
> +@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t =
*restrict inb, char **restri
> +                       if (c >=3D 93 || d >=3D 94) {
> +                               c +=3D (0xa1-0x81);
> +                               d +=3D 0xa1;
> +-                              if (c >=3D 93 || c>=3D0xc6-0x81 && d>0x52=
)
> ++                              if (c > 0xc6-0x81 || c>=3D0xc6-0x81 && d>=
0x52)
> +                                       goto ilseq;
> +                               if (d-'A'<26) d =3D d-'A';
> +                               else if (d-'a'<26) d =3D d-'a'+26;
> +@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t=
 *restrict inb, char **restri
> +                               if (*outb < k) goto toobig;
> +                               memcpy(*out, tmp, k);
> +                       } else k =3D wctomb_utf8(*out, c);
> ++                      /* This failure condition should be unreachable, =
but
> ++                       * is included to prevent decoder bugs from trans=
lating
> ++                       * into advancement outside the output buffer ran=
ge. */
> ++                      if (k>4) goto ilseq;
> +                       *out +=3D k;
> +                       *outb -=3D k;
> +                       break;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 324269a968..db6f5ce2de 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://git.etalabs.net/git/musl;branch=3Dma=
ster;protocol=3Dhttps \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.pa=
tch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-t=
o-l.patch \
>             file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.=
patch \
> +           file://0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branc=
hes.patch \
>            "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224800): https://lists.openembedded.org/g/openembedde=
d-core/message/224800
> Mute This Topic: https://lists.openembedded.org/mt/115743075/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

