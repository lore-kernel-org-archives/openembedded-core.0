Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.27880.1612738594470205760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 14:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gcxw2A1m;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id b9so21677756ejy.12
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 14:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4DnaA/isIXwPRZfIL+MQehZkEbmz2i09vqpS/i/UiEI=;
        b=gcxw2A1mwy/LB0Z9r33mhFQUk1XXYWvFek30KLW5A7gcoXpEVns8wpcDTXSmHmcD/E
         7EZBjU9PGAex6fN1uGgNVB+djRxTh/qRmanVbFBkb1dMKTA9n0yQvi9pUuZbxgFUR75S
         hQI0TOCnc+1gYPGvrcAeECKiNft4KlbRtNP9+PUJyELXHr1tz1dfGChr62kW5lyA+l3p
         UBGWa95OBLpeUNByaHJI2+lFGEItmvo8aUPfxgPZdsoS+UFiSuErWqYJYXduPWHkwN07
         GKLMjcHwpdVp+O2ppQhBgUT9Xltqn9MnFpKXKhWhUI5gCk0YUxdZXNZMrUvGkC8FhvAp
         C7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4DnaA/isIXwPRZfIL+MQehZkEbmz2i09vqpS/i/UiEI=;
        b=bY2SdltQ2vY1h7XmEMNfef6iMTIHY+HEZPTCp5JpnOxz1f3kIDWugyUkOsTlVuPBhx
         AnluylhitjHU6DW2xNO4EMrNNgTYoZ950ZbTwzY5AGi1Hd7gGdnBzBfBxaal1/wN4jGS
         FGiYHcbT2AIufkriiyki2Tw/a7mWKwkcEfZlcshCdjCstNr7rSzDH2n93KBM/rno3moa
         +dwtB3bNJBx+CQQfbjKdUfEyYjVlK4rlz3H4UyQ2jy9eoqwNoXOqjj1agQu6YIAzhRDu
         +uG23E1s+IpPrlCCKJhjjNVd2GRfki2foZaGLTieIBZvNVp06z6AIELfoDyDITgOP51V
         LKWA==
X-Gm-Message-State: AOAM531CHEzL1co6G2hou6QWBS6FvHoucrCpMcN6YHhHI4YKlGTBnQn6
	eXdPmejFLHfgDPhPGRXUar8ZfNQOMpaN/Ad5OTc=
X-Google-Smtp-Source: ABdhPJyO6n9Qi4hm7iJAwmzMmDmiPQxdrfzQBchoMeMH2L6N+TBpcj4EbbqQZKFQgUXoG8UTtfb8ZvXs2UnwluvVbNw=
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr14213113ejc.408.1612738592942;
 Sun, 07 Feb 2021 14:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
 <20210207180504.1552900-2-quaresma.jose@gmail.com> <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
In-Reply-To: <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 7 Feb 2021 22:56:22 +0000
Message-ID: <CANPvuRntP03A8U696D+JoBVtvK=Kp-Dj08Eae5=Sx=CuqpTP4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] shaderc: add option to skip building the examples
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f2adf405bac6f62f"

--000000000000f2adf405bac6f62f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I need some help to analyze the log of the compilation.
where can i find it? is it possible?

The compilation log mentioned on
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1835
are
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-linux/shade=
rc-native/2020.4-r0/temp/log.do_compile.199121

On my side it build fine on x86_64 so I don't understand the problem!

Thank you,

Jose

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 7/02/2021 =C3=A0(s) 22:25:

> On Sun, 2021-02-07 at 18:05 +0000, Jose Quaresma wrote:
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  ...dd-option-to-skip-build-the-examples.patch | 45 +++++++++++++++++++
> >  ...lding-external-dependencies-in-thir.patch} | 32 +++++--------
> >  .../shaderc/shaderc_2020.4.bb                 |  6 ++-
> >  3 files changed, 61 insertions(+), 22 deletions(-)
> >  create mode 100644
> meta/recipes-graphics/shaderc/files/0001-cmake-add-option-to-skip-build-t=
he-examples.patch
> >  rename
> meta/recipes-graphics/shaderc/files/{0001-cmake-de-vendor-libs-and-disabl=
e-git-versioning.patch
> =3D> 0002-cmake-disable-building-external-dependencies-in-thir.patch} (55=
%)
>
> There is still something odd going on with the shaderc changes
> unfortunately:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1835
>
> Cheers,
>
> Richard
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000f2adf405bac6f62f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div>I need some help=
 to analyze the log of the compilation.</div><div>where can i find it? is i=
t possible?</div><div><br></div><div><div>The compilation log mentioned on<=
/div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/=
builds/1835" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/83/builds/1835</a><br style=3D"color:rgb(0,0=
,0)"><div>are</div></div><div><span style=3D"color:rgb(199,199,199);font-fa=
mily:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px=
;white-space:pre;background-color:rgb(0,0,0)">/home/pokybuild/yocto-worker/=
no-x11/build/build/tmp/work/x86_64-linux/shaderc-native/2020.4-r0/temp/log.=
do_compile.199121</span><br></div><div><br></div><div>On my side it build f=
ine on=C2=A0x86_64 so I don&#39;t understand the problem!</div><div><br></d=
iv><div>Thank you,</div><div><br></div><div>Jose</div><div><div><div></div>=
</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia doming=
o, 7/02/2021 =C3=A0(s) 22:25:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Sun, 2021-02-07 at 18:05 +0000, Jose Quaresma wrote:<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...dd-option-to-skip-build-the-examples.patch | 45 +++++++++++++=
++++++<br>
&gt; =C2=A0...lding-external-dependencies-in-thir.patch} | 32 +++++--------=
<br>
&gt; =C2=A0.../shaderc/<a href=3D"http://shaderc_2020.4.bb" rel=3D"noreferr=
er" target=3D"_blank">shaderc_2020.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++-<br>
&gt; =C2=A03 files changed, 61 insertions(+), 22 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-graphics/shaderc/files/0001-cmak=
e-add-option-to-skip-build-the-examples.patch<br>
&gt; =C2=A0rename meta/recipes-graphics/shaderc/files/{0001-cmake-de-vendor=
-libs-and-disable-git-versioning.patch =3D&gt; 0002-cmake-disable-building-=
external-dependencies-in-thir.patch} (55%)<br>
<br>
There is still something odd going on with the shaderc changes<br>
unfortunately:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/1835" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/1835</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quar=
esma</div></div>

--000000000000f2adf405bac6f62f--
