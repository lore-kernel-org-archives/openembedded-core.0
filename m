Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web09.1672.1605928512683545087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 19:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=jdWn5C9c;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id z24so6735956qto.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 19:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+cDshA1276zT7TJapCE9FhZ2GumbQuIFHilfKq97CPk=;
        b=jdWn5C9cec8i0vttQyV4KrZqsfukkqhNxHTYwEvWDVYRZ87MTscK5AQQPQ36CMyYzq
         5ABkhLn2tKUuVkDcJ6acjG0Vu4qaecs19cVXCX9bczvt2QLAiAqMkRl0wDFoXDE2iRZo
         t4sq5RvqMd1t0C/OnLypK01XcYEtxmDZ7Lc2lo4pDuy1Qv8SySeEloM+SgL0h5Gkr7Rv
         ay/CqlyoOcbdkW0Ry5pgAs6ewBK13cOpRtB+vhS0DRYhPCrcIWQSYF4KAVRDXOW0dxtV
         j2ERmHUX+ONDBiK6zQoMT9fb7lMnqxpHodXEViicT8vsTD2wQqN6pLF+I5PoMapEH8w5
         Fnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+cDshA1276zT7TJapCE9FhZ2GumbQuIFHilfKq97CPk=;
        b=hw4G9sEi5gatBxpn6kTDuT61Ne5tQUItrifdHnHMYJIJ04HRCIRrMIVlllUyulX+G1
         pyC2TqFZyPIdgvvPuP43VIqCT3CZYJHl6afjQXncHqC/lBy3eYdrp5DOaS4sixZ+aVUp
         DAlc1ukY1sLOW9NPZRztLK1UWuXPy5V3XYLUTLWgqzqJ7wugX/0s6eOq4BQZhFPrdOU7
         imx8aJi3ZW22f80ed/iTDuL0DRtgNVM6kcmDjEUt30Mzhez2JGvf3QstvmfdMEa1100D
         nSoEjR66UaQuVH37GGjK/c2q9bqmx/lX8k4KMwURhyzCjJBfHY2NGFRxRleIHrE+zOli
         Qvgg==
X-Gm-Message-State: AOAM531deh6Qf79yuNUOlS8h+G1dQWmlLscnWwgVLrHN+IMP3Ku5dl+/
	ORGGbJGxLkRdRY+OGp67CWoaPlb5FXxIXICN
X-Google-Smtp-Source: ABdhPJz8+i4cibW+XFvbKN8X5kJOUDzlyFkIGuxdu2/aacXCcET1YlJN+tlJWIlgX4DbjSsCEJwjoQ==
X-Received: by 2002:ac8:4748:: with SMTP id k8mr19799745qtp.336.1605928511470;
        Fri, 20 Nov 2020 19:15:11 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id z133sm3671872qka.20.2020.11.20.19.15.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 19:15:11 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f181.google.com with SMTP id y197so11038598qkb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 19:15:10 -0800 (PST)
X-Received: by 2002:a37:b0c:: with SMTP id 12mr19798372qkl.247.1605928509735;
 Fri, 20 Nov 2020 19:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20201121031136.21075-1-okaya@kernel.org>
In-Reply-To: <20201121031136.21075-1-okaya@kernel.org>
Date: Sat, 21 Nov 2020 00:14:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrP3UQdXCQnXU=L+=8qn8znyXg+=yxtwfLeVzSUep-Ddw@mail.gmail.com>
Message-ID: <CAP9ODKrP3UQdXCQnXU=L+=8qn8znyXg+=yxtwfLeVzSUep-Ddw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] heaptrack: add bitbake recipe
To: Sinan Kaya <okaya@kernel.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 21 de nov. de 2020 =C3=A0s 00:11, Sinan Kaya <okaya@kernel.or=
g> escreveu:
>
> Add this useful tool to the devtools list.
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../heaptrack/heaptrack_git.bb                | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
>
> diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-o=
e/recipes-devtools/heaptrack/heaptrack_git.bb
> new file mode 100644
> index 0000000000..143274d816
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Heaptrack"
> +HOMEPAGE =3D "https://phabricator.kde.org/source/heaptrack/"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +PR =3D "r0"

PR as r0 is the default, please drop.

After doing it, please add:

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
