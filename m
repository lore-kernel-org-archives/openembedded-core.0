Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB5EC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 18:38:55 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.2087.1654540727986264747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 11:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AnxiK8Zt;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id n10so30668683ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1QAjpfNGLNJOko5lVtQfkqcluZ08BUWaYf8Bga/QO7I=;
        b=AnxiK8ZtbZFk3Mq7UMRBJH3QzuozXnRKvPZ/6MtxygGEsAbMQkEBzrZ1V2F1EijYLx
         OM50Wie3FPF2SRB1ZGpCnpG3u3eJGMdMax0cxai6HjygAo+anvNw8bKEU4F/CKCy05zU
         jIGTTrEhWTs/1e4K6Avt4ai0EgicdDTbg43AYJg6U615ZcLCEOuC/BsXAk3Hi9WA7LBy
         ZO15k3QhiOx++rGlsDlRlrkJ1aa94SBtjLF+Q6rg2XIlyAodYQwBYgof+Sh1pd6kf74K
         3c6RJXd6n27WcL3onwgDmCPZM8K9K8lY9CqB8mdYtfwPuubw6tfhPwXvXfGeuO7nAPZC
         sEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1QAjpfNGLNJOko5lVtQfkqcluZ08BUWaYf8Bga/QO7I=;
        b=HWSUPIApf4SLxjbL3Yi/Pf+pheXvCIgEi1HpvLSUzuLh5s/2YfOBPPVP47H9gdSF8g
         BAxyDUn7g1GcUQ8AxLIYsvw4RVciSc8npvf0xV/FKJEHoZWH6vNTo0acVWk9iAN018BL
         7EwxOzNfuccT5rsR3aUPKQSuISmEvtGSCR3PdxFpinj5W+AC2Jtjyu7Y2g45j5OuLYFD
         BqltBthnWsq//ghKdtbWqwpM/1pYMlQTkbIm+pOAReOU+c4HtcVEZ1ttSZ2w1GiuIpAr
         Xc/INGaz4TvjII8BQ9jymf4hfZg7njkKl3elAFMkEF0KMiD8SrxIXXD0hv6L9MXd4S1X
         DjYQ==
X-Gm-Message-State: AOAM531C8I+Y1bO8mDCluUODWKBv2uWLtqB/F8ifGaaTZN+/SMXehm31
	z/yxKlvP2lczz++zExFPVnRlxoemtIXANJlb5IE=
X-Google-Smtp-Source: 
 ABdhPJw6nUqwV11CNCSf3jF1xzxjer6Sl2B3R7a681/jGuZ+8gfhaGRMcWJE5LynIjJWa28A7BKFe0zhU1EBA36V8ww=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr22163663ejs.190.1654540726395; Mon, 06
 Jun 2022 11:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220606141056.2054477-1-jan.vermaete@gmail.com>
 <CANNYZj8FfTTwMqh8Ct59pUT=RkXNnmKPH_0hwQCw-DL-V_JnXw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8FfTTwMqh8Ct59pUT=RkXNnmKPH_0hwQCw-DL-V_JnXw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 6 Jun 2022 20:38:34 +0200
Message-ID: 
 <CABF_=yhapjOuwHqaYeVQG8cpDbWXs-vMXBudV61x3Xu5Qi0PNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: added compression and decompression as
 packageconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000436a7705e0cbc8cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 18:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166654

--000000000000436a7705e0cbc8cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

As far as I know, pzstd is used in the scripting of Yocto/OE.  Or at least
it's useful to have it there.
So having it at native it a kind of must.

But for target, it's best to have it as an option for those who have to
have it tiny.

Is this info added to the commit message enough?
Or is PACKAGECONFIG not the correct way to create this option.  After all,
it's not an option for the configure stage but for the compile stage.

br

On Mon, Jun 6, 2022 at 5:25 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> pzstd changes need to be either explained or split into a separate patch.
>
> Alex
>
> On Mon, 6 Jun 2022 at 16:11, Jan Vermaete <jan.vermaete@gmail.com> wrote:
> >
> > The default is the same as before.
> > So both target and native can do compression and decompression.
> >
> > Native will probably always needed both.  E.g. to create rpm packages.
> > Target could have enough with decompression only.  E.g. for OTA systems=
.
> >
> > The difference between default and decompression only:
> >   packages/cortexa72-poky-linux/zstd/libzstd: PKGSIZE changed from
> 661912 to 210776 (-68%)
> >   packages/cortexa72-poky-linux/zstd/zstd: PKGSIZE changed from 1430839
> to 785007 (-45%)
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  meta/recipes-extended/zstd/zstd_1.5.2.bb | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> > index 3887f31ecf..924e7db7f7 100644
> > --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> > +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> > @@ -18,22 +18,31 @@ CVE_PRODUCT =3D "zstandard"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG:class-native ??=3D "compression decompression pzstd"
> > +PACKAGECONFIG:class-target ??=3D "compression decompression pzstd"
> > +PACKAGECONFIG[compression] =3D
> "ZSTD_LIB_COMPRESSION=3D1,ZSTD_LIB_COMPRESSION=3D0"
> > +PACKAGECONFIG[decompression] =3D
> "ZSTD_LIB_DECOMPRESSION=3D1,ZSTD_LIB_DECOMPRESSION=3D0"
> >  PACKAGECONFIG[lz4] =3D "HAVE_LZ4=3D1,HAVE_LZ4=3D0,lz4"
> >  PACKAGECONFIG[lzma] =3D "HAVE_LZMA=3D1,HAVE_LZMA=3D0,xz"
> > +PACKAGECONFIG[pzstd] =3D ""
> >  PACKAGECONFIG[zlib] =3D "HAVE_ZLIB=3D1,HAVE_ZLIB=3D0,zlib"
> >
> > +
> >  # See programs/README.md for how to use this
> >  ZSTD_LEGACY_SUPPORT ??=3D "4"
> >
> >  do_compile () {
> >      oe_runmake ${PACKAGECONFIG_CONFARGS}
> ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT}
> > -    oe_runmake ${PACKAGECONFIG_CONFARGS}
> ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false',
> d)}; then
> > +        oe_runmake ${PACKAGECONFIG_CONFARGS}
> ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
> > +    fi
> >  }
> >
> >  do_install () {
> >      oe_runmake install 'DESTDIR=3D${D}'
> > -    oe_runmake install 'DESTDIR=3D${D}' PREFIX=3D${prefix} -C contrib/=
pzstd
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false',
> d)}; then
> > +        oe_runmake install 'DESTDIR=3D${D}' PREFIX=3D${prefix} -C
> contrib/pzstd
> > +    fi
> >  }
> >
> >  PACKAGE_BEFORE_PN =3D "libzstd"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#166632):
> https://lists.openembedded.org/g/openembedded-core/message/166632
> > Mute This Topic: https://lists.openembedded.org/mt/91577767/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--000000000000436a7705e0cbc8cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alexander,<div><br></div><div>As far as I know, pzstd i=
s used in the scripting of Yocto/OE.=C2=A0 Or at least it&#39;s useful to h=
ave it there.</div><div>So having it at native it a kind of must.</div><div=
><br></div><div>But for target, it&#39;s best to have it as an option for t=
hose who have to have it tiny.</div><div><br></div><div>Is this info added =
to the commit message=C2=A0enough?</div><div>Or is PACKAGECONFIG not the co=
rrect way to create this option.=C2=A0 After all, it&#39;s not an option fo=
r the configure=C2=A0stage but for the compile stage.</div><div><br></div><=
div>br</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Jun 6, 2022 at 5:25 PM Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">pzstd changes need to=
 be either explained or split into a separate patch.<br>
<br>
Alex<br>
<br>
On Mon, 6 Jun 2022 at 16:11, Jan Vermaete &lt;<a href=3D"mailto:jan.vermaet=
e@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The default is the same as before.<br>
&gt; So both target and native can do compression and decompression.<br>
&gt;<br>
&gt; Native will probably always needed both.=C2=A0 E.g. to create rpm pack=
ages.<br>
&gt; Target could have enough with decompression only.=C2=A0 E.g. for OTA s=
ystems.<br>
&gt;<br>
&gt; The difference between default and decompression only:<br>
&gt;=C2=A0 =C2=A0packages/cortexa72-poky-linux/zstd/libzstd: PKGSIZE change=
d from 661912 to 210776 (-68%)<br>
&gt;=C2=A0 =C2=A0packages/cortexa72-poky-linux/zstd/zstd: PKGSIZE changed f=
rom 1430839 to 785007 (-45%)<br>
&gt;<br>
&gt; Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.c=
om" target=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a> | 15 ++++++++++++---<br=
>
&gt;=C2=A0 1 file changed, 12 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.2.b=
b" rel=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a> b/meta/recipes-ex=
tended/zstd/<a href=3D"http://zstd_1.5.2.bb" rel=3D"noreferrer" target=3D"_=
blank">zstd_1.5.2.bb</a><br>
&gt; index 3887f31ecf..924e7db7f7 100644<br>
&gt; --- a/meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a><br>
&gt; +++ b/meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a><br>
&gt; @@ -18,22 +18,31 @@ CVE_PRODUCT =3D &quot;zstandard&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; +PACKAGECONFIG:class-native ??=3D &quot;compression decompression pzst=
d&quot;<br>
&gt; +PACKAGECONFIG:class-target ??=3D &quot;compression decompression pzst=
d&quot;<br>
&gt; +PACKAGECONFIG[compression] =3D &quot;ZSTD_LIB_COMPRESSION=3D1,ZSTD_LI=
B_COMPRESSION=3D0&quot;<br>
&gt; +PACKAGECONFIG[decompression] =3D &quot;ZSTD_LIB_DECOMPRESSION=3D1,ZST=
D_LIB_DECOMPRESSION=3D0&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[lz4] =3D &quot;HAVE_LZ4=3D1,HAVE_LZ4=3D0,lz4&quot;=
<br>
&gt;=C2=A0 PACKAGECONFIG[lzma] =3D &quot;HAVE_LZMA=3D1,HAVE_LZMA=3D0,xz&quo=
t;<br>
&gt; +PACKAGECONFIG[pzstd] =3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[zlib] =3D &quot;HAVE_ZLIB=3D1,HAVE_ZLIB=3D0,zlib&q=
uot;<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 # See programs/README.md for how to use this<br>
&gt;=C2=A0 ZSTD_LEGACY_SUPPORT ??=3D &quot;4&quot;<br>
&gt;<br>
&gt;=C2=A0 do_compile () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_S=
UPPORT=3D${ZSTD_LEGACY_SUPPORT}<br>
&gt; -=C2=A0 =C2=A0 oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPOR=
T=3D${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd<br>
&gt; +=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;p=
zstd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD=
_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake install &#39;DESTDIR=3D${D}&#39;<br>
&gt; -=C2=A0 =C2=A0 oe_runmake install &#39;DESTDIR=3D${D}&#39; PREFIX=3D${=
prefix} -C contrib/pzstd<br>
&gt; +=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;p=
zstd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake install &#39;DESTDIR=3D${D}&#3=
9; PREFIX=3D${prefix} -C contrib/pzstd<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 PACKAGE_BEFORE_PN =3D &quot;libzstd&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#166632): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/166632" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/166632</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91577767=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91577767/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--000000000000436a7705e0cbc8cf--

