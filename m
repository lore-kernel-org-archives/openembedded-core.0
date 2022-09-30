Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB94C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 16:03:38 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web08.762.1664553813122192512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 09:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ICcyYFWM;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id
 k10-20020a4ad10a000000b004756ab911f8so2520081oor.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4T81Reuete2DUzKkCdV3weskk/4uXOx41M8J+JnvuNA=;
        b=ICcyYFWM+Ld7Uxz7d+Y9PbcR6p3hvbIRQH6AB0ZJ92/y2GQmmN26UIiHU7E4dsud8j
         roBl+b2tMvHIw8HzN5j3KDUYTDf69GAISDe2abDocOjfcIFru9KvJxroYzqmAfun6QUt
         wPrmP3jWvfiWGrFUSrEB4Rz8FfwEskhZn9ns57R09QrM1H6A5F+S5zwVIa1/Yeno1wDR
         6m0Jpc5cGlBcsKvb1zMI/0Ajv0fZa6Znvz3m+03OsF2dhvP46id2yXqWzm7o6yQlud71
         ys3n5ILNSCzY9GBsnrx1sZeRo+lUpNLFuFhnob6lhM7tN+0XDhF3IB/RAgiJY/IJOj77
         M0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4T81Reuete2DUzKkCdV3weskk/4uXOx41M8J+JnvuNA=;
        b=KDkRvzjKywvXZbstaXrSq/YloohtIlHNTwXAbTv8fXb84QtfXaGt0ifzspQ2LICtXk
         qvU9JEGMe5i2FUqJCI6oWQw7ycNV6N5R1zZis3TWR36hQljXLA5m2hD8yNMTzVf6Gukb
         ntxY7HTKMhVGDQSuvJRPMBNjKgsUThtbcd89b/efOPM3gT59X07SK4jhO1rUg+GmvMNJ
         UAqdH0nR4uMFPCcanwxqQe1ERrx9Z7wSJj53cmJSnkLF3NVJafzmEu6t+Fid/i+ubnmM
         ps2UZw4NFahv9ImwtWBg7o1IpELjAJXK0P/IOM+SW6LAT4aNFk0xmhcHjnUL4xCBoBVr
         ccRw==
X-Gm-Message-State: ACrzQf2Y9oAdFh1Sha2bCFrDPg4aZHIbOLAwe/uwgqeMVs6Ni9klU6PN
	KP/AB4eE+sfJaS5sK/n6gyWcdC/BdVUjFim72XA=
X-Google-Smtp-Source: 
 AMsMyM7jIPP7is6Xl2AQY21PCn3un72ULapC4Xybxh0BYbnxrNkvkXhbM1sFmQdXyTkOqUtZlr+CFh61+wgvu71aN4s=
X-Received: by 2002:a05:6830:3901:b0:658:fff4:51b8 with SMTP id
 br1-20020a056830390100b00658fff451b8mr3682980otb.55.1664553812275; Fri, 30
 Sep 2022 09:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
In-Reply-To: <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 09:03:21 -0700
Message-ID: 
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b0b68f05e9e72281"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 16:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171226

--000000000000b0b68f05e9e72281
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 3:37 AM Ross Burton <Ross.Burton@arm.com> wrote:

>
>
> > On 30 Sep 2022, at 11:16, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > On 30 Sep 2022, at 05:16, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >> -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
> >> +RDEPENDS:${PN}-ptest +=3D "bash sed openssl-bin \
> >> +                         perl perl-modules \
> >
> > I thought the point of perl-modules was to depend on the entire standar=
d
> library, so isn=E2=80=99t this a bug in perl-modules?
>
> My perl-modules RRECOMMENDS on, eg, perl-module-tap-parser.
>
> Are you building an image with recommendations turned off?


Good point I will check in think it worked fine with glibc but not with
musl based images I see that Perl-modules is fully empty in packages-split
area so soMething does not add up

>
>
> Ross

--000000000000b0b68f05e9e72281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 30, 2022 at 3:37 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
<br>
&gt; On 30 Sep 2022, at 11:16, Ross Burton via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" targ=
et=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; On 30 Sep 2022, at 05:16, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; -RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bas=
h sed&quot;<br>
&gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot;bash sed openssl-bin \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0perl perl-modules \<br>
&gt; <br>
&gt; I thought the point of perl-modules was to depend on the entire standa=
rd library, so isn=E2=80=99t this a bug in perl-modules?<br>
<br>
My perl-modules RRECOMMENDS on, eg, perl-module-tap-parser.<br>
<br>
Are you building an image with recommendations turned off?</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Good point I will check in think =
it worked fine with glibc but not with musl based images I see that Perl-mo=
dules is fully empty in packages-split area so soMething does not add up=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--000000000000b0b68f05e9e72281--

