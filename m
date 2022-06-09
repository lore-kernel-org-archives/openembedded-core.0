Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9775EC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 12:45:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12723.1654778708233970633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 05:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M/t81SNo;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h5so32304230wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yqGmqKv+v0+v6pify3ZcjXpHv9tHX13ddjItv94hQag=;
        b=M/t81SNoUY9M1AlJuzscTarly56ALecr9hEfBF6OrCIA49L++TNafx0GgnFSw+9VeR
         o8F9yI1cwrG40Xq4wH7Ura56U1TXea6u80s19HyBPw+WQLmaHsK7931GvzzE45i2lGpG
         dZrm0htcsZlgsjC+7ADz/yhR+pHtZrOegfr45VFusmNtfCoDNKzuS50lJYDpqJwPmHfs
         JWrUeS+XbiEZMn4tlaDY9ZfRgBzlmNt1pfOJlM2sjvUcuBZUzGBWktUPz1Ahaomw96RN
         Oe5YQ7ZYDjVOBGU6I1+e7y2ptpTK6LZVCu6WFIiOc5isnevQcrR+hhtnhtzqu76q+mwb
         /Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yqGmqKv+v0+v6pify3ZcjXpHv9tHX13ddjItv94hQag=;
        b=c7zyFXDHd8t6prrzbw+52VeN8KYphKp/+jV4ohxLcBIYQ+yXneB23oQZuJQzqGuSQ5
         FFSlDmXTTFEvgSXpuo2oX2uWi9GDFK6z8r8Xckp+GGyRuAoT9J0YY9A5LAz5rADRRKDP
         RENSiux1RoOe08WrawRDMzOFMJVhT4T3qdeSqGBKOX10E8pRi7+S+xBSyLVD+qwmSjcp
         MhIDa78zx+UetrOoAl6WkwW8EtUttGuZ9786JtXqKShG+XnJ3ombDbqe2h9XgQemiER7
         CTWtZNAWUy68GlPRn/HHRJRtQhPSq9A8KZDWju7one7oYa4jsKzpFbXT9FmcPIfoczGt
         CiNA==
X-Gm-Message-State: AOAM530Yl5mp1eayr6o7S9IqoERd0aOt+rjz4bRKDNTolxFmwFqhy+M1
	DoWXuwrlTi+bHuWd4UPwyRPLv5brCqbb0Cij88s=
X-Google-Smtp-Source: 
 ABdhPJyDwT8fKnlxjYks9Bo36lPDuZqU3bs2MDiyVGf3h+XDPIBgXBjStiZuBQMTvq80tvAEjnzNuA2LU72Lz0bBUSo=
X-Received: by 2002:a5d:4351:0:b0:20c:f52c:f869 with SMTP id
 u17-20020a5d4351000000b0020cf52cf869mr39525548wrr.516.1654778706612; Thu, 09
 Jun 2022 05:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220606120126.3381438-1-alex@linutronix.de>
 <20220606120126.3381438-18-alex@linutronix.de>
In-Reply-To: <20220606120126.3381438-18-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Jun 2022 14:44:52 +0200
Message-ID: 
 <CA+chaQfAtrfQttR6rEVgMCV7CrXzRDUyVcW=ujFSc9uic-3CFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/21] perl: update 5.34.1 -> 5.36.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000fd552605e103303f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 12:45:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166777

--000000000000fd552605e103303f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../{perlcross_1.3.7.bb =3D> perlcross_1.4.bb}  |  2 +-
>  .../perl/files/perl-configpm-switch.patch     |  2 +-
>  .../perl/files/perl-dynloader.patch           |  2 +-
>  .../perl/files/perl-rdepends.txt              | 49 ++++++++++++-------
>  .../perl/{perl_5.34.1.bb =3D> perl_5.36.0.bb}   |  2 +-
>  5 files changed, 35 insertions(+), 22 deletions(-)
>  rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb =3D>
> perlcross_1.4.bb} (92%)
>  rename meta/recipes-devtools/perl/{perl_5.34.1.bb =3D> perl_5.36.0.bb}
> (99%)
>

Have anyone else seen perl.do_install getting stuck with this new shiny
version as well?

 690770 martin      20   0 10020  3700  3196 S   0.0  0.0  0:00.00 =E2=94=
=82
 =E2=94=94=E2=94=80 /bin/sh
/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/temp/ru=
n.do_install.690768
 690771 martin      20   0 99860  1948  1364 S   0.0  0.0  0:00.00 =E2=94=
=82
    =E2=94=94=E2=94=80 make -j 40
DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-=
r0/image
install
 690816 martin      20   0   99M  3340  1428 R 102.1  0.0  3h06:44 =E2=94=
=82
       =E2=94=94=E2=94=80 make install.man

--000000000000fd552605e103303f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Mon, Jun 6, 2022 at 2:02 PM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Signed-off-by: Alexander Kanavin &lt=
;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de=
</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://perlcross_1.3.7.bb" rel=3D"noreferrer" target=
=3D"_blank">perlcross_1.3.7.bb</a> =3D&gt; <a href=3D"http://perlcross_1.4.=
bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.4.bb</a>}=C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0.../perl/files/perl-configpm-switch.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0.../perl/files/perl-dynloader.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../perl/files/perl-rdepends.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 49 ++++++++++++-------<br>
=C2=A0.../perl/{<a href=3D"http://perl_5.34.1.bb" rel=3D"noreferrer" target=
=3D"_blank">perl_5.34.1.bb</a> =3D&gt; <a href=3D"http://perl_5.36.0.bb" re=
l=3D"noreferrer" target=3D"_blank">perl_5.36.0.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A05 files changed, 35 insertions(+), 22 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/perl-cross/{<a href=3D"http://perlcross_=
1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.7.bb</a> =3D&g=
t; <a href=3D"http://perlcross_1.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>perlcross_1.4.bb</a>} (92%)<br>
=C2=A0rename meta/recipes-devtools/perl/{<a href=3D"http://perl_5.34.1.bb" =
rel=3D"noreferrer" target=3D"_blank">perl_5.34.1.bb</a> =3D&gt; <a href=3D"=
http://perl_5.36.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.36.0.bb<=
/a>} (99%)<br></blockquote><div><br></div>Have anyone else seen perl.do_ins=
tall getting stuck with this new shiny version as well?<div><br></div><div>=
=C2=A0690770 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 10020 =C2=A03700 =C2=A0=
3196 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=94=94=E2=94=80 /bin/sh /OE/build/poky/build-st/tmp/work/x86_64-li=
nux/perl-native/5.36.0-r0/temp/run.do_install.690768<br>=C2=A0690771 martin=
 =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 99860 =C2=A01948 =C2=A01364 S =C2=A0 0.0 =
=C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=
=94=E2=94=80 make -j 40 DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-l=
inux/perl-native/5.36.0-r0/image install<br></div><div>=C2=A0690816 martin =
=C2=A0 =C2=A0 =C2=A020 =C2=A0 0 =C2=A0 99M =C2=A03340 =C2=A01428 R 102.1 =
=C2=A00.0 =C2=A03h06:44 =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=E2=94=94=E2=94=80 make install.man=C2=A0</div></div></div>

--000000000000fd552605e103303f--

