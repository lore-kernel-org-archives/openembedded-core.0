Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39A2C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 17:01:20 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.10362.1645635679260382700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 09:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KWxq9tnR;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g20so3358603edw.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 09:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2eQLx98g+bCXJXueXDWwsL0l8UL6X9Xkc2i3chn2O4=;
        b=KWxq9tnRf4oKWFdVmBuYMbgCQwizU44HMx6EI2dZrxDY33iIn6HBCXIn8Y+EsDVRo8
         rtPN6i4w3frOwIbrAya66oA5relqKiHbAtPAcP29GdydAV+tz4V1e0Yr9XD3jR8J743D
         WNyzNcwmtjM4PMOpHBZ/OnWnB8oV8zbYeYqIhmIgRSOOxkhArQJWu5gdJiWyz6504sJm
         FYMRmBpQ3DvOW4omIJ2UDwhzN7NYcuUWJU3ITqP+fAtEW356yy3FzixdKrCXDOVVn3dF
         3QmVVXwkZ8lyFlkUd0b/u8LeoZzvuZz/Oz6ECKxwvpbp1HcC54HXADYMnIUhekiCXiyL
         dPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2eQLx98g+bCXJXueXDWwsL0l8UL6X9Xkc2i3chn2O4=;
        b=U4EMu8FKyf5Ye1UXi0xX8yJTgQAq33+c/gZzAQ3TWu5ohV0tg9umSYVtUwcgywnO/P
         0+n2KiLdqheinxTAayk6ggXV3rcdN0E2v13NLi+6Fg8TUdeiAVtrasYTo02hVKPvp4/I
         LsQHdU68VHghJtDaqBh3gTUX2VGJj42tfQQd9rqdKuNu8Y7nyGpbQ3vv0d98WY00l2QX
         +HUzl4E0iZ9yHuTNdyvHIfNXrFhuHszMBwKkrlAQqQo33UBUDxHlwyjGHDppwIGV9lt0
         JMu87fLQ2NkBLTNpuippiFSMUDheyQO2z6GpLqeGRWkHZB8QFSqghluk891dHNpwNyyM
         yKFg==
X-Gm-Message-State: AOAM530Ufv6qEQxKak9cs2vI1P1vPCyuRiGEapph+ABaZkJCSN0ZFAm5
	in7Y28DkwJrKn9/IqS1Tw9MlfaFGAsr+n3iX+ac=
X-Google-Smtp-Source: 
 ABdhPJymP/rhSTRUvcfEEV1RfQJ1uF7PuY8DM7toaFqxFEqmUYtRG72cSFw/LC7JOV9TjQo/5X0PZ+uW3krRx2Vf4D0=
X-Received: by 2002:a05:6402:4242:b0:413:1190:1a1 with SMTP id
 g2-20020a056402424200b00413119001a1mr342534edb.456.1645635677434; Wed, 23 Feb
 2022 09:01:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <2c82b18cfcc34dce08fa4600baa2bbdc046a0350.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1spqY_0TrwW7ojxZ2CX2x7CebZLbuceYDNbgt9rPFfEpGQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spqY_0TrwW7ojxZ2CX2x7CebZLbuceYDNbgt9rPFfEpGQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 23 Feb 2022 09:01:06 -0800
Message-ID: 
 <CANx9H-D1cas-3VFc_SC05Shm24a46sRwfEdq3_2Z5K64uvaUKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/32] python3-wheel: move 0.37.0 from
 meta-python
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fbb8ca05d8b2698d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 17:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162272

--000000000000fbb8ca05d8b2698d
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 23, 2022 at 8:01 AM Khem Raj <raj.khem@gmail.com> wrote:

> this series is breaking things quite a bit in rest of world.
>
> https://errors.yoctoproject.org/Errors/Build/141298/


I understand, but we do need to be able to modernize. And getting oe-core
stable is currently consuming all bandwidth.

Most of the failures will be because the wheel has a name like
setuptools_rust*.whl but PYPI_PACKAGE = 'setuptools-rust'
The fix is to set PIP_INSTALL_PACKAGE = "setuptools_rust"


>
>
On Mon, Feb 21, 2022 at 1:24 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > This is one of the "new build tools" which are part of pypa (Python
> > Packaging Authority) toolchain.
> >
> > Wheels are the official delivery mechanism for Python packages, replacing
> > the now deprecated Eggs (egg-info).
> >
> > [YOCTO #14638]
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc             |  1 +
> >  meta/recipes-devtools/python/python3-wheel_0.37.1.bb | 12 ++++++++++++
> >  2 files changed, 13 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 740e5fe55c4..72cd0125814 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -651,6 +651,7 @@ RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander
> Kanavin <alex.kanavin@gmail.
> >  RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> >  RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <
> tim.orling@konsulko.com>"
> >  RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> > +RECIPE_MAINTAINER:pn-python3-wheel = "Tim Orling <
> tim.orling@konsulko.com>"
> >  RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <
> tim.orling@konsulko.com>"
> >  RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> > diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> > new file mode 100644
> > index 00000000000..6c7a31db9e7
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY = "The official binary distribution format for Python "
> > +HOMEPAGE = "https://github.com/pypa/wheel"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
> > +
> > +SRC_URI[sha256sum] =
> "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
> > +
> > +inherit pypi setuptools3
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162077):
> https://lists.openembedded.org/g/openembedded-core/message/162077
> > Mute This Topic: https://lists.openembedded.org/mt/89304009/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000fbb8ca05d8b2698d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 23, 2022 at 8:01 AM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">this series=
 is breaking things quite a bit in rest of world.<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/141298/" rel=3D"nor=
eferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/141=
298/</a></blockquote><div><br></div><div>I understand, but we do need to be=
 able to modernize. And getting oe-core stable is currently consuming all b=
andwidth.</div><div><br></div><div>Most of the failures will be because the=
 wheel has a name like setuptools_rust*.whl but PYPI_PACKAGE =3D &#39;setup=
tools-rust&#39;</div><div>The fix is to set PIP_INSTALL_PACKAGE =3D &quot;s=
etuptools_rust&quot;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
On Mon, Feb 21, 2022 at 1:24 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is one of the &quot;new build tools&quot; which are part of pypa =
(Python<br>
&gt; Packaging Authority) toolchain.<br>
&gt;<br>
&gt; Wheels are the official delivery mechanism for Python packages, replac=
ing<br>
&gt; the now deprecated Eggs (egg-info).<br>
&gt;<br>
&gt; [YOCTO #14638]<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3-wheel_0.3=
7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheel_0.37.1.bb</a> | =
12 ++++++++++++<br>
&gt;=C2=A0 2 files changed, 13 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-wheel_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-whe=
el_0.37.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 740e5fe55c4..72cd0125814 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -651,6 +651,7 @@ RECIPE_MAINTAINER:pn-python3-typogrify =3D &quot;A=
lexander Kanavin &lt;alex.kanavin@gmail.<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-vcversioner =3D &quot;Bruce Ashfiel=
d &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.a=
shfield@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-wcwidth =3D &quot;Tim Orling &lt;<a=
 href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsu=
lko.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-webcolors =3D &quot;Bruce Ashfield =
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-python3-wheel =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-zipp =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-qemu =3D &quot;Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-qemu-helper-native =3D &quot;Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-wh=
eel_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheel_0.37.1.bb=
</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-wheel_0.37.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-wheel_0.37.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000000..6c7a31db9e7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-wheel_0.3=
7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheel_0.37.1.bb</a><br=
>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +SUMMARY =3D &quot;The official binary distribution format for Python =
&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pypa/wheel" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/pypa/wheel</a>&quot;<br>
&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D10;endline=3D1=
0;md5=3D8227180126797a0148f94f483f3e1489&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5=
b8c9e8b65a5e39d49529c1c4&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; +<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162077): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162077" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162077</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89304009=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89304009/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000fbb8ca05d8b2698d--

