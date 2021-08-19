Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.71323.1629388024558837272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 08:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ICodlGP9;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id k8so9812825wrn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wfu2WYYXb1Osnxr7C0JJPyXBLa0VQ0Pnsn+tDDLk808=;
        b=ICodlGP9M0q3x7QxE/gEnozhvHP+1JRqwLprmxvZX59KizB+jce4hnNfqKXfiZmERI
         Gj7SosoDvyg8dcFTITFMMa+gUZ5MPfAl3IoSSt26/a3ZNk7RHowzJ5kCeGK+NnJWFKm/
         sGEmq81y6K26REhgCCPxUKNqzOtBTnSmIcFNqsEThI7BZi6bVwXM379WsQEYE8JGBr5/
         Ts0RsQz0/Z/LLnOyLoDW5xh2rCoSGnyI7TndRBTsvj3gM027TUo1prFt099FVxH/6gEc
         RCcneoJoX0pIvhuwTXEkkRGdvjEAbBACDEI1f7ymhvECvNQSHBWdr2qDVDryhahA7VR8
         imxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wfu2WYYXb1Osnxr7C0JJPyXBLa0VQ0Pnsn+tDDLk808=;
        b=GsTMNufDBqKczhBUzoHxarbfYAhqmxNaBC1jYKwWvwknhacgx6h775B6pskmngKqA7
         4Rmf4NCbaYXOx6lxXU4dTWcqrgybXwnnCjlmm3z02I3SqnQ12VzdIjGcCJpgm7Lkm3It
         Kuw1XIVyoXCd3TtI2KPIhr2IlpLJVNHiEvU8pdH/9AU88a68ohdF8ck6xXBQzeDEs04V
         sT29KFMo4sOiS8VRzcr2NkKUH0cg/nWD7fJccO5ykCAmtwJoVtzfqRJp/DyFOUz/F/US
         nEoBeHeLLfN/N5g8Cor0wNreLfrcjlE05WmYVPc3t42BsGhZ6Nt84GSDts1m8mt2IDnU
         euug==
X-Gm-Message-State: AOAM531NTM2dGcYLV4YCxWU5/RJMyiPfZvJCjMcGOWSmXPVo/mT+jq7S
	qV9xx+4rFO+OaRadfbiVKHpRCd/+oQ8ITS36i8g=
X-Google-Smtp-Source: ABdhPJyo1zMjr2M/d4Ozp/j38x7SlaTk9TLltHSWfn5wuBkv/7TNiZS3Ecbl/4H5uHpMlu7E8jrJP1eaQD3d8YeetfI=
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr4797929wrs.395.1629388022960;
 Thu, 19 Aug 2021 08:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210819063335.3670-1-rybczynska@gmail.com> <CAAnfSTtzG6sSkKtUEmkopf4hp1bFKXczy6d8ASemVOmD77y_9w@mail.gmail.com>
In-Reply-To: <CAAnfSTtzG6sSkKtUEmkopf4hp1bFKXczy6d8ASemVOmD77y_9w@mail.gmail.com>
From: "Marta Rybczynska" <rybczynska@gmail.com>
Date: Thu, 19 Aug 2021 17:46:50 +0200
Message-ID: <CAApg2=TnTLP=8GX6-UYfRR+1zjeFxwEF+1ny2Mn5xfRvrd=x_w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] lzo: add CVE_PRODUCT
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004f562d05c9eb7651"

--0000000000004f562d05c9eb7651
Content-Type: text/plain; charset="UTF-8"

Thanks for looking into this. I've used the cve_check pass from
https://lists.openembedded.org/g/openembedded-core/message/154677
and just with 'lzo' there are no results. I can add both if that seems
safer, fine for me. Will submit a new version.

Regards,
Marta

On Thu, Aug 19, 2021 at 2:54 PM Ross Burton <ross@burtonini.com> wrote:

> This replaces the default value of 'lzo', it might be safer to use +=
> so both this name and just lzo are searched for.
>
> The CVE database isn't very reliable for consistent naming, so I
> prefer to cover all bases.
>
> Ross
>
> On Thu, 19 Aug 2021 at 07:33, Marta Rybczynska <rybczynska@gmail.com>
> wrote:
> >
> > lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607)
> were
> > not reported.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> > ---
> >  meta/recipes-support/lzo/lzo_2.10.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/lzo/lzo_2.10.bb
> b/meta/recipes-support/lzo/lzo_2.10.bb
> > index 85b14b3c5c..31a229c7f5 100644
> > --- a/meta/recipes-support/lzo/lzo_2.10.bb
> > +++ b/meta/recipes-support/lzo/lzo_2.10.bb
> > @@ -18,6 +18,8 @@ SRC_URI[sha256sum] =
> "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b42
> >
> >  inherit autotools ptest
> >
> > +CVE_PRODUCT = "oberhumer:lzo2"
> > +
> >  EXTRA_OECONF = "--enable-shared"
> >
> >  do_install_ptest() {
> > --
> > 2.30.2
> >
> >
> > 
> >
>

--0000000000004f562d05c9eb7651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for looking into this. I&#39;ve used the cve_c=
heck pass from</div><div><a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/message/154677">https://lists.openembedded.org/g/openembedded-c=
ore/message/154677</a></div><div>and just with &#39;lzo&#39; there are no r=
esults. I can add both if that seems</div><div>safer, fine for me. Will sub=
mit a new version.</div><div><br></div><div>Regards,</div><div>Marta<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Aug 19, 2021 at 2:54 PM Ross Burton &lt;<a href=3D"mailto:ross@burtoni=
ni.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">This replaces the default value of &#39;lzo&#39;,=
 it might be safer to use +=3D<br>
so both this name and just lzo are searched for.<br>
<br>
The CVE database isn&#39;t very reliable for consistent naming, so I<br>
prefer to cover all bases.<br>
<br>
Ross<br>
<br>
On Thu, 19 Aug 2021 at 07:33, Marta Rybczynska &lt;<a href=3D"mailto:rybczy=
nska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607) =
were<br>
&gt; not reported.<br>
&gt;<br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@huawei.com" target=3D"_blank">marta.rybczynska@huawei.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/lzo/<a href=3D"http://lzo_2.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">lzo_2.10.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/lzo/<a href=3D"http://lzo_2.10.bb" r=
el=3D"noreferrer" target=3D"_blank">lzo_2.10.bb</a> b/meta/recipes-support/=
lzo/<a href=3D"http://lzo_2.10.bb" rel=3D"noreferrer" target=3D"_blank">lzo=
_2.10.bb</a><br>
&gt; index 85b14b3c5c..31a229c7f5 100644<br>
&gt; --- a/meta/recipes-support/lzo/<a href=3D"http://lzo_2.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">lzo_2.10.bb</a><br>
&gt; +++ b/meta/recipes-support/lzo/<a href=3D"http://lzo_2.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">lzo_2.10.bb</a><br>
&gt; @@ -18,6 +18,8 @@ SRC_URI[sha256sum] =3D &quot;c0f892943208266f9b6543b=
3ae308fab6284c5c90e627931446fb49b42<br>
&gt;<br>
&gt;=C2=A0 inherit autotools ptest<br>
&gt;<br>
&gt; +CVE_PRODUCT =3D &quot;oberhumer:lzo2&quot;<br>
&gt; +<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--enable-shared&quot;<br>
&gt;<br>
&gt;=C2=A0 do_install_ptest() {<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--0000000000004f562d05c9eb7651--
