Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.13238.1592936203213536294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 11:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OIqZUrkQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id z63so7650017qkb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 11:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANC0X5vmWnI9gICvgIdwNIwrBsRWDIu/rPN1iCBvLAk=;
        b=OIqZUrkQ+DNJ8r0oSOeUaAMivEmQj+3ITAHExF/DJhbw6YyWPjbXYTELmTa3kb1noT
         EhyPIR468XIyRNc95w7potKerZnFB8fZLc5E9MSzr5NQWJzodU0Hy07St1HgKPqdD64C
         2t4sp51LaHztY0DQejh7Y5MT02hq13w0iP98Mq8eYxVLWqXDLmvjhk89kgiTjLzCAKa3
         bRLcu5OmkBtevgiLdSWkgn7DdaA3ZTv7XzmctY4F/UltG4EnA2Wu2aQYYSrMjfFYVFq9
         fBXVeDNNpXRtv4awh8UREP9d2Q8q6tGEQwuOh6NegFktWcYU7Ru29Aq1mOW3OMPoZ1DB
         W9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANC0X5vmWnI9gICvgIdwNIwrBsRWDIu/rPN1iCBvLAk=;
        b=YEJsK36EqPR+yw4meUDydzdy75BzGIYmMutiQ10nwgYjicLPyswtiTFsEbArzZvzk2
         1ck+842ia8tI345fGbdKP9CLgmpyEOBAUGYbX4FZxwDdrSzTTYlKB+L+o5H8MwcpqeOB
         IPynWeQk47EAbV2qYJwuRHAXr2mKxPWDBenG5zorEbfvtw9P/TqRfgAhvROKsg0PKn0K
         RtUk76EFDn1fc8jRv6JEAywKTk2nhXysoghv3JHvVdIYa2VAVBTipIxhHC1U70a0UnGs
         L0sUYBbVIYFKTY33+9TkRfQssBIWFTbggPaThM6G3m/NtOudvuR0AdkCkic6JYpQmlkm
         /Z+w==
X-Gm-Message-State: AOAM5313UJs+52KZ9sEsjwnIxCl7fmZT+RcN4bY3XqNO/Ai5h8paKkM/
	+PvEE5tspz4scA/npsK3h8TufpNT6vI8vKbJ1HQ=
X-Google-Smtp-Source: ABdhPJygy7fFiJq26P+eZ77tKBCdmDBI/U08jnbprQGoX3vdufUjRp7hMsLO2UVEcQ5d4FMIVIswAzr3p7D7rEsWg2Y=
X-Received: by 2002:a05:620a:8c1:: with SMTP id z1mr21350986qkz.431.1592936202158;
 Tue, 23 Jun 2020 11:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net> <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
In-Reply-To: <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 23 Jun 2020 11:16:29 -0700
Message-ID: <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
Subject: Re: [OE-core] Status of Go support
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Content-Type: multipart/alternative; boundary="0000000000007ac76005a8c45c7b"

--0000000000007ac76005a8c45c7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 9:47 AM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello Stefan,
>
> Em ter., 23 de jun. de 2020 =C3=A0s 13:37, Stefan Herbrechtsmeier
> <stefan@herbrechtsmeier.net> escreveu:
> > because of the changes to the 'GO111MODULE' variable in go-dep and
> > glide, I wonder if Go is ready for use. I would have expected the
> > variable GO111MODULE to be set to 'off' within the go.bbclass because g=
o
> > could bypass the fetch task unobserved otherwise.
>
> Is there any known issue?
>
> For me, with those fixes, it is working fine.


Yes it=E2=80=99s working ok with go-module for me but not sure of go-dep ha=
s
regressed


>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>

--0000000000007ac76005a8c45c7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 23, 2020 at 9:47 AM Otavio Salvador &lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.=
br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Stefan,<br>
<br>
Em ter., 23 de jun. de 2020 =C3=A0s 13:37, Stefan Herbrechtsmeier<br>
&lt;<a href=3D"mailto:stefan@herbrechtsmeier.net" target=3D"_blank">stefan@=
herbrechtsmeier.net</a>&gt; escreveu:<br>
&gt; because of the changes to the &#39;GO111MODULE&#39; variable in go-dep=
 and<br>
&gt; glide, I wonder if Go is ready for use. I would have expected the<br>
&gt; variable GO111MODULE to be set to &#39;off&#39; within the go.bbclass =
because go<br>
&gt; could bypass the fetch task unobserved otherwise.<br>
<br>
Is there any known issue?<br>
<br>
For me, with those fixes, it is working fine.</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Yes it=E2=80=99s working ok with go-module for=
 me but not sure of go-dep has regressed=C2=A0</div><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: +1 (=
347) 903-9750<br>
</blockquote></div></div>

--0000000000007ac76005a8c45c7b--
