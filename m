Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1860.1596045408404525129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 10:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OV/aehZq;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id e13so23071374qkg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s7W/8rJdpKAPCl9CJ3dmr1OP64KD33ZTvKYyzmuA8cc=;
        b=OV/aehZq+3CdJ1Z38rPdi2W8XJSqOK2+y/+Zs3tQ//vnQ6+49nT1ahRSbK3mbFH7EZ
         EQjA6fbI7aYi4XoJavT2dpwfJQV5CeUIafklKtWyhAFBwf2rUtECK27aDwpzN1+53/uq
         Ru7Xpx5ZFNRZjmm+Vel3AOVWNH7CjWcwUipehuJeucXJi812zmgelflHuXCDtTHe+oBJ
         md/CDpU/APT4b5lCm+Fda3l4lpgVmEPMSlbihyQga1Afnb4EXrMnd7kzo5L89pNQkqka
         MPSQIJYRIwdl8Qud8BVxtYgC7CpQe2tAhJytCU2zqdO6WXvRrnoApSe5VuAYppacls+m
         NRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s7W/8rJdpKAPCl9CJ3dmr1OP64KD33ZTvKYyzmuA8cc=;
        b=QWsolfY0QO8FEotLgwpJZ2AgvDyNe5QtEpqhhutUMcDECmY3qaTB33T/IBErOp89ty
         TsWjKDkjV/UKl39aT9WzFe2iZzJhUQU2I6jz6opnieZU3FWMjJaiuRGIcYYI/MQSuMRQ
         bne1OUBPeUxZ9QCv4k6KHBDKmJnEYgM8cC5PRlJVXVvzXzhRjT3AuZbVAf/LFilxRq4L
         z3MtGbDqBFWu6voYkwOGWvYmODbMI9rNsZdsEOmtkDVW2U8gw/gYjNeNRXcUxpX1ogmk
         ghZM1Xkn102VrKtuzicB6fv6UUNb7cLvQds7YOZ90NUl25lt0ez2i1jUZ1QagDfYzvH9
         mQaw==
X-Gm-Message-State: AOAM531K6kGhKnqcjhrDmPeVsuTgyxJPriFxiq4pdkuTUIeuPetGbpV2
	CLmIGq22gUDP9fJhBOsyiUQIazJ/KVkBTNJvupA=
X-Google-Smtp-Source: ABdhPJzzo0WjKBIL7dVKap601y4wnn8rCfAYRNM0Cj48Yysy+I2n8QsY7+onedDFbIa6vwCMVWSwpMWdz4vk/ZtAHUM=
X-Received: by 2002:a37:9d0d:: with SMTP id g13mr13360637qke.165.1596045407447;
 Wed, 29 Jul 2020 10:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 29 Jul 2020 10:56:21 -0700
Message-ID: <CAMKF1sp2DvqP3vMF2reLvn4Kv85w=oZED7xuM5sO53sKQ_vsOw@mail.gmail.com>
Subject: Re: [poky][zeus][PATCH] libpcre: Add fix for CVE-2020-14155
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>, 
	Rahul Taya <Rahul.Taya@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2020 at 5:56 AM Saloni Jain <Saloni.Jain@kpit.com> wrote:
>
> From: Rahul Taya <Rahul.Taya@kpit.com>
>
> Added below patch in libpcre
> CVE-2020-14155.patch
>
> This patch fixes below error:
> PCRE could allow a remote attacker to execute arbitrary
> code on the system, caused by an integer overflow in
> libpcre via a large number after (?C substring.
> By sending a request with a large number, an attacker
> can execute arbitrary code on the system or
> cause the application to crash.
>
> Upstream-Status: Pending

you don't need this here. its needed in package patch header which you
already have
secondly do we need this on master and dunfell ?

>
> Tested-by: Rahul Taya <Rahul.Taya@kpit.com>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../libpcre/libpcre/CVE-2020-14155.patch           | 40 ++++++++++++++++=
++++++
>  meta/recipes-support/libpcre/libpcre_8.44.bb       |  3 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2020-14155.p=
atch
>
> diff --git a/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch b/=
meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
> new file mode 100644
> index 0000000..d6cb9bf
> --- /dev/null
> +++ b/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
> @@ -0,0 +1,40 @@
> +--- pcre-8.43/pcre_compile.c    2020-07-05 22:26:25.310501521 +0530
> ++++ pcre-8.43/pcre_compile1.c   2020-07-05 22:30:22.254489562 +0530
> +
> +CVE: CVE-2020-14155
> +Upstream-Status: Backport [https://vcs.pcre.org/pcre/code/trunk/pcre_com=
pile.c?view=3Dpatch&r1=3D1761&r2=3D1760&pathrev=3D1761]
> +
> +@@ -6,7 +6,7 @@
> + and semantics are as close as possible to those of the Perl 5 language.
> +
> +                        Written by Philip Hazel
> +-           Copyright (c) 1997-2018 University of Cambridge
> ++           Copyright (c) 1997-2020 University of Cambridge
> +
> + -----------------------------------------------------------------------=
------
> + Redistribution and use in source and binary forms, with or without
> +@@ -7130,17 +7130,19 @@
> +           int n =3D 0;
> +           ptr++;
> +           while(IS_DIGIT(*ptr))
> ++           {
> +             n =3D n * 10 + *ptr++ - CHAR_0;
> ++            if (n > 255)
> ++               {
> ++               *errorcodeptr =3D ERR38;
> ++               goto FAILED;
> ++               }
> ++            }
> +           if (*ptr !=3D CHAR_RIGHT_PARENTHESIS)
> +             {
> +             *errorcodeptr =3D ERR39;
> +             goto FAILED;
> +             }
> +-          if (n > 255)
> +-            {
> +-            *errorcodeptr =3D ERR38;
> +-            goto FAILED;
> +-            }
> +           *code++ =3D n;
> +           PUT(code, 0, (int)(ptr - cd->start_pattern + 1)); /* Pattern =
offset */
> +           PUT(code, LINK_SIZE, 0);                          /* Default =
length */
> diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-=
support/libpcre/libpcre_8.44.bb
> index e5471e8..81b38bb 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.44.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
> @@ -11,7 +11,8 @@ SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre-${PV}.t=
ar.bz2 \
>             file://fix-pcre-name-collision.patch \
>             file://run-ptest \
>             file://Makefile \
> -           "
> +           file://CVE-2020-14155.patch \
> +"
>
>  SRC_URI[md5sum] =3D "cf7326204cc46c755b5b2608033d9d24"
>  SRC_URI[sha256sum] =3D "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec=
62b714c84399366d"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
