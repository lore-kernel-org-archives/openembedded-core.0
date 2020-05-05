Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.6115.1588679927131626211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 04:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MUpCxQ2b;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id s11so1021924vsq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5hcOV6yIxGRAdoUs+qkA5eRB49RlKDqR2SoG90FTgk=;
        b=MUpCxQ2bzTO6Gnr0ei5iUwVujz/tbfhlLlc2vB8vfPqWu+vax9DmeHfVPvgZu8S1vb
         e/n9qcyj/gIQh6E4znYMPe1wTYZtumn8kN7UHq4lH9wqkY19GhJNUx7ORbi5RJuHuGUy
         Je8neB6lBBVuD3GEuszx2QtZi2+lLg66WzXyRiBRkorLoortVCybsrp57uETJXsxCiYX
         ry0fBn7tSdbQ39NFITLd30aZxkD+du7Cr71cMXPi5CIgACGucnHG3vE6c6VzAayS1aWb
         4tFF5J/00KjRUS7iO2MtsZ7RCQ1CLWqG9M6z2269eR8hijshQsxjQhf1h7C7cnmSC+jn
         d0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5hcOV6yIxGRAdoUs+qkA5eRB49RlKDqR2SoG90FTgk=;
        b=DWZLkHMZRtEkIj4MbfV2CdUwK/lfH78bZ25Do2Wg5JgPLbmiWkqdmVTDEsMmBNKmiz
         urRprFOv5NxCIdp8oOiWWPk92DydjAz/4bNiSQVNxzwDt0nmnM7Tighi+OkpXPZ+oTBz
         9TItf42hxHyR1bx6/yO6lmf4ZTcfBFT/XYdFfmtcdK8pW+ej6bchmBDOP0vDlKHmKsnF
         /0AXoQEUeeK9jnMg7rux0tKYSOx4YJooeFHeSuxtlJJA4zoUyhsusNhDepa431F1fAPg
         6+3USNgq7KbcVYPzeSofWJJD1el8plWXfcVim8zADC3tuZ43z1YPLiYlSt4SPVqEL1X6
         k3hw==
X-Gm-Message-State: AGi0PuYl8lhcPuSm0B8AqWxjBqKH1QcBbEZPj/d4/NyXQ1w28LT6JqjF
	DjpPamA3X8RwEXZU/a1ndxVb4eOKaOhuVz6lyE8+CQ==
X-Google-Smtp-Source: APiQypLADDPbt+ijX0CuLTt+VhSTQwMNwnFMEhFTJ/1OSX9YpPD/idan01SQ64xNnHp1v935R1e8ZNAeKO7qI1L4jS0=
X-Received: by 2002:a67:7d10:: with SMTP id y16mr2456168vsc.23.1588679926232;
 Tue, 05 May 2020 04:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200503162559.946-1-alex.kanavin@gmail.com> <86cf328e4c36050eb971f350babe3fc1a7a8c602.camel@linuxfoundation.org>
In-Reply-To: <86cf328e4c36050eb971f350babe3fc1a7a8c602.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 5 May 2020 13:58:34 +0200
Message-ID: <CANNYZj9c5pJD0vY5vjaJhSoLCK9mJhe=tN1z4a6sMovDms-h_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/17] libinput: add ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa380405a4e55e0b"

--000000000000aa380405a4e55e0b
Content-Type: text/plain; charset="UTF-8"

Thanks, I fixed this and other reported issues, so will re-send once what's
left of the last batch makes it into master:)

Alex

On Tue, 5 May 2020 at 11:43, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-05-03 at 18:25 +0200, Alexander Kanavin wrote:
> > The test takes about 17 minutes, and fully passes.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/ptest-packagelists.inc  |  1 +
> >  meta/recipes-graphics/wayland/libinput/run-ptest |  9 +++++++++
> >  meta/recipes-graphics/wayland/libinput_1.15.2.bb | 14 +++++++++++---
> >  3 files changed, 21 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-graphics/wayland/libinput/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc
> > index c13ff724b1..ab44757a11 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -72,6 +72,7 @@ PTESTS_SLOW = "\
> >      glib-2.0-ptest \
> >      gstreamer1.0-ptest \
> >      libevent-ptest \
> > +    libinput-ptest \
> >      lttng-tools-ptest \
> >      openssh-ptest \
> >      openssl-ptest \
> > diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest
> > b/meta/recipes-graphics/wayland/libinput/run-ptest
> > new file mode 100644
> > index 0000000000..5a84c568b9
> > --- /dev/null
> > +++ b/meta/recipes-graphics/wayland/libinput/run-ptest
> > @@ -0,0 +1,9 @@
> > +#!/bin/sh
> > +
> > +/usr/libexec/libinput/libinput-test-suite
> > +if [ $? -eq 0 ]; then
> > +  echo 'PASS: libinput-test-suite'
> > +else
> > +  echo 'FAIL: libinput-test-suite'
> > +fi
> > +
> > diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> > b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> > index 810532774e..31652cc342 100644
> > --- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> > +++ b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> > @@ -10,9 +10,10 @@ SECTION = "libs"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
> >
> > -DEPENDS = "libevdev udev mtdev"
> > +DEPENDS = "libevdev udev mtdev libcheck"
> >
> >  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
> > +           file://run-ptest \
> >             file://determinism.patch \
> >             "
> >  SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
> > @@ -20,7 +21,13 @@ SRC_URI[sha256sum] =
> > "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834
> >
> >  UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> >
> > -inherit meson pkgconfig lib_package
> > +inherit meson pkgconfig lib_package ptest
> > +
> > +# Patch out build directory, otherwise it leaks into ptest binary
> > +do_configure_append() {
> > +    sed -i -e "s,${WORKDIR},,g" config.h
> > +    sed -i -e "s,${WORKDIR},,g" litest-config.h
> > +}
> >
>
> Nearly :)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1869
>
> (I think its failing when ptests aren't enabled)
>
> Cheers,
>
> Richard
>
>
>

--000000000000aa380405a4e55e0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I fixed this and other reported issues, so wi=
ll re-send once what&#39;s left of the last batch makes it into master:)</d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 5 May 2020 at 11:43, Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Sun, 2020-05-03 at 18:25 +0200, Alexander Kanavin=
 wrote:<br>
&gt; The test takes about 17 minutes, and fully passes.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/ptest-packagelists.inc=C2=A0 |=C2=A0 1 =
+<br>
&gt;=C2=A0 meta/recipes-graphics/wayland/libinput/run-ptest |=C2=A0 9 +++++=
++++<br>
&gt;=C2=A0 meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.15.2.bb</a> | 14 ++++++=
+++++---<br>
&gt;=C2=A0 3 files changed, 21 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/wayland/libinput/run-pt=
est<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; index c13ff724b1..ab44757a11 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -72,6 +72,7 @@ PTESTS_SLOW =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 glib-2.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gstreamer1.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libevent-ptest \<br>
&gt; +=C2=A0 =C2=A0 libinput-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lttng-tools-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 openssh-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 openssl-ptest \<br>
&gt; diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest<br>
&gt; b/meta/recipes-graphics/wayland/libinput/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5a84c568b9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/wayland/libinput/run-ptest<br>
&gt; @@ -0,0 +1,9 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +/usr/libexec/libinput/libinput-test-suite<br>
&gt; +if [ $? -eq 0 ]; then<br>
&gt; +=C2=A0 echo &#39;PASS: libinput-test-suite&#39;<br>
&gt; +else<br>
&gt; +=C2=A0 echo &#39;FAIL: libinput-test-suite&#39;<br>
&gt; +fi<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://libinput_=
1.15.2.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.15.2.bb</a><br>
&gt; b/meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.15.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libinput_1.15.2.bb</a><br>
&gt; index 810532774e..31652cc342 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.15.2.bb</a><br>
&gt; +++ b/meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.15.2.bb</a><br>
&gt; @@ -10,9 +10,10 @@ SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D1f2ea9ebff3a2c6d458faf58492efb63&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS =3D &quot;libevdev udev mtdev&quot;<br>
&gt; +DEPENDS =3D &quot;libevdev udev mtdev libcheck&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software=
/$%7BBPN%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://w=
ww.freedesktop.org/software/${BPN}/${BP}.tar.xz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://determinism.patc=
h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;eb6bd2907ad33d53954d70dfb881a643&quot;=
<br>
&gt; @@ -20,7 +21,13 @@ SRC_URI[sha256sum] =3D<br>
&gt; &quot;971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;libinput-(?P&lt;pver&gt;\d+\.\d+\=
.(?!9\d+)\d+)&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit meson pkgconfig lib_package<br>
&gt; +inherit meson pkgconfig lib_package ptest<br>
&gt; +<br>
&gt; +# Patch out build directory, otherwise it leaks into ptest binary<br>
&gt; +do_configure_append() {<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &quot;s,${WORKDIR},,g&quot; config.h<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &quot;s,${WORKDIR},,g&quot; litest-config.h<b=
r>
&gt; +}<br>
&gt; <br>
<br>
Nearly :)<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/47/build=
s/1869" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/47/builds/1869</a><br>
<br>
(I think its failing when ptests aren&#39;t enabled)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000aa380405a4e55e0b--
