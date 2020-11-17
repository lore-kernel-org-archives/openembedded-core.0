Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.10519.1605630977216748613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 08:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EE7+Oj+m;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id gj5so2829803ejb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 08:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ooa7NFRV2f+1sqBaNN3CmR8Q37jmOpW/TwKtXIAmJx8=;
        b=EE7+Oj+mgY6DSyg2C2IwYDdOpxVWBeLPm0ZEEcFp16Y1NtpPG5qxwq2jEL5RpIce5Y
         74ZQR4//AlQwBgrCo+jREiZjzEzO7DZc2e0F9pvPjqLM2mfQvEy2/1/7CgdXubhUhDUL
         s9A7CAgvWt/M4yal2+hDXY/zk5DuJsCZC5i9ZEE5vm3KZ9XvB9CVJPTgU1UtaVWyIIz+
         eb8btNIzWVoBnbtMPglmlmORnEF0tAIU1yf9oRVXw6JqfC7qaC3uklv+J6FeO5vpQyzO
         wrV6lHXVzC+CUGfBY2WMX9brspuRrl0zTJ71/V/m0eepOfF9GsYnasl13FYWUByUroBq
         iikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ooa7NFRV2f+1sqBaNN3CmR8Q37jmOpW/TwKtXIAmJx8=;
        b=fmyYBGPtVuQmtjXvrxk/RH5jnVF+UVRFRbHmro0NNbtgf/A+e/Z+uKuGIGE0pN9B42
         F1r9BYgjiCr5usfAP0cRKIbWL6LgeRjihJm4GlSk1c50ZX3UA3/N9UApgtKlTFzwJu1m
         xIZA4EN+A2n11qQAwASVcPl6GGRFw00C+E3zL7801OfCP0P7r5tBUkQbvrp2T0QS0bCR
         nxNApCUcPWmhrcus685bu0s+brBZo8h9bABGvHPzM0b2Ol1+fiSCEr55FWDlIg+S0AHs
         obdxOeM6U+EShRGrUaJg0tS07pGthl7xHHMkOUG/ygVO7OZGTjCiVPRTCIoexBTnlR/S
         qHIg==
X-Gm-Message-State: AOAM533PHaP9t+IdLkNCrstJBPfgPhkVYQIMe9pEvw8Kc6MfR2wWp3AJ
	hauKffehOC9Ko6jPHMhszMd8iE22m4TqERJeHtA=
X-Google-Smtp-Source: ABdhPJzno6tH91/SzatUlFdD6qX4/gKItgREvsKJRmLAetL7WHtJYhqdKBOjKrdIbyoUvgIaPiyUou5/Y6n4Y+otFds=
X-Received: by 2002:a17:906:e2c3:: with SMTP id gr3mr19582531ejb.471.1605630975519;
 Tue, 17 Nov 2020 08:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20201016043341.635385-1-raj.khem@gmail.com> <c671f8ca6bdeb7d7475dbfea8ec440d103045395.camel@linuxfoundation.org>
 <CAMKF1sotEEnaqk98JEDJtxg-TWP2Qa5isQtKLptE1cX+qA95Lw@mail.gmail.com>
In-Reply-To: <CAMKF1sotEEnaqk98JEDJtxg-TWP2Qa5isQtKLptE1cX+qA95Lw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 17:36:04 +0100
Message-ID: <CA+chaQebpk-CxcZ98gtj=U2oF_bQ-LTVaKN6edhngXKr2xKoaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] recipes: Use GPL-2.0-only instead of GPL-2.0 for LIC_FILES_CHKSUM
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Meh Mbeh Ida Delphine <idadelm@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000efb1e905b4501703"

--000000000000efb1e905b4501703
Content-Type: text/plain; charset="UTF-8"

Hello Meh,

master is now open for next release, can you please send an updated
revision of this patch?

Regards,

On Fri, Oct 16, 2020 at 8:48 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Oct 16, 2020 at 2:05 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi Khem,
> >
> > This patch fixes issues introduced by a patch I tested in -next from
> > Meh Mbeh Ida Delphine <idadelm@gmail.com> (cc'd). I have removed it
> > from the queue as it failed testing. This patch may be useful so they
> > can fix their patch though.
> >
> > Note the fixes Khem found for glibc-collateral and devicetree.bbclass
> > in addition to the recipes.
>
> Thanks, other layers also rely on these names. So perhaps this should
> wait till master opens for next release
> and address those layers too.
>
> >
> > Cheers,
> >
> > Richard
> >
> > On Thu, 2020-10-15 at 21:33 -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Add devicetree.bbclass and glibc-collateral.inc
> > >
> > >  meta/classes/devicetree.bbclass                              | 2 +-
> > >  meta/recipes-connectivity/connman/connman-conf.bb            | 2 +-
> > >  meta/recipes-core/busybox/busybox-inittab_1.32.0.bb          | 2 +-
> > >  meta/recipes-core/glibc/glibc-collateral.inc                 | 4 ++-
> > > -
> > >  meta/recipes-core/systemd/systemd-serialgetty.bb             | 2 +-
> > >  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb       | 2 +-
> > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
> > >  7 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/meta/classes/devicetree.bbclass
> > > b/meta/classes/devicetree.bbclass
> > > index c772ab2ab9..ece883accf 100644
> > > --- a/meta/classes/devicetree.bbclass
> > > +++ b/meta/classes/devicetree.bbclass
> > > @@ -18,7 +18,7 @@ SECTION ?= "bsp"
> > >  # device trees built with them are at least GPLv2 (and in some cases
> > > dual
> > >  # licensed). Default to GPLv2 if the recipe does not specify a
> > > license.
> > >  LICENSE ?= "GPLv2"
> > > -LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-
> > > 2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > +LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-
> > > only;md5=801f80980d171dd6425610833a22dbe6"
> > >
> > >  INHIBIT_DEFAULT_DEPS = "1"
> > >  DEPENDS += "dtc-native"
> > > diff --git a/meta/recipes-connectivity/connman/connman-conf.bb
> > > b/meta/recipes-connectivity/connman/connman-conf.bb
> > > index 9a519ec866..85fee09258 100644
> > > --- a/meta/recipes-connectivity/connman/connman-conf.bb
> > > +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> > > @@ -2,7 +2,7 @@ SUMMARY = "Connman config to setup wired interface on
> > > qemu machines"
> > >  DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
> > >  network interface for a qemu machine."
> > >  LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> > >
> > >  inherit systemd
> > >
> > > diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > > b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > > index 61fb8cbad1..2129acd8d3 100644
> > > --- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > > +++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > > @@ -1,6 +1,6 @@
> > >  SUMMARY = "inittab configuration for BusyBox"
> > >  LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> > >
> > >  SRC_URI = "file://inittab"
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-collateral.inc
> > > b/meta/recipes-core/glibc/glibc-collateral.inc
> > > index 52880791a7..4f81f07da7 100644
> > > --- a/meta/recipes-core/glibc/glibc-collateral.inc
> > > +++ b/meta/recipes-core/glibc/glibc-collateral.inc
> > > @@ -1,7 +1,7 @@
> > >  require glibc-common.inc
> > >
> > > -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-
> > > 2.0;md5=801f80980d171dd6425610833a22dbe6 \
> > > -                     file://${COMMON_LICENSE_DIR}/LGPL-
> > > 2.1;md5=1a6d268fd218675ffea8be556788b780"
> > > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-
> > > only;md5=801f80980d171dd6425610833a22dbe6 \
> > > +                     file://${COMMON_LICENSE_DIR}/LGPL-2.1-
> > > only;md5=1a6d268fd218675ffea8be556788b780"
> > >
> > >  deltask do_fetch
> > >  deltask do_unpack
> > > diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > > b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > > index 0cc0dc8c79..9a63c9f0a8 100644
> > > --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > > +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > > @@ -1,7 +1,7 @@
> > >  SUMMARY = "Serial terminal support for systemd"
> > >  HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
> > >  LICENSE = "GPLv2+"
> > > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> > >
> > >  PR = "r5"
> > >
> > > diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > > b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > > index 8781492d47..d95d1a63f5 100644
> > > --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > > @@ -1,6 +1,6 @@
> > >  SUMMARY = "Inittab configuration for SysVinit"
> > >  LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> > >
> > >  PR = "r10"
> > >
> > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-
> > > scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-
> > > scripts_1.0.bb
> > > index 1ab248fed5..8a02bc7f48 100644
> > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > @@ -1,6 +1,6 @@
> > >  SUMMARY = "Build tools needed by external modules"
> > >  LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> > >
> > >  inherit kernel-arch
> > >  inherit pkgconfig
> > >
> > >
> >
>
> 
>
>

--000000000000efb1e905b4501703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Meh,<div><br></div><div>master is now open for next =
release, can you please send an updated revision of this patch?</div><div><=
br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 16, 2020 at 8:48 PM Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Oct 16, 20=
20 at 2:05 AM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Khem,<br>
&gt;<br>
&gt; This patch fixes issues introduced by a patch I tested in -next from<=
br>
&gt; Meh Mbeh Ida Delphine &lt;<a href=3D"mailto:idadelm@gmail.com" target=
=
=3D"_blank">idadelm@gmail.com</a>&gt; (cc&#39;d). I have removed it<br>
&gt; from the queue as it failed testing. This patch may be useful so they=
<br>
&gt; can fix their patch though.<br>
&gt;<br>
&gt; Note the fixes Khem found for glibc-collateral and devicetree.bbclass=
<br>
&gt; in addition to the recipes.<br>
<br>
Thanks, other layers also rely on these names. So perhaps this should<br>
wait till master opens for next release<br>
and address those layers too.<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; On Thu, 2020-10-15 at 21:33 -0700, Khem Raj wrote:<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2: Add devicetree.bbclass and glibc-collateral.inc<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 meta/classes/devicetree.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-connectivity/connman/<a href=3D"http://connma=
n-conf.bb" rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-core/busybox/<a href=3D"http://busybox-initta=
b_1.32.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox-inittab_1.32.0.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-core/glibc/glibc-collateral.inc=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++-<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-serial=
getty.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-init=
tab_2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit-inittab_2.88d=
sf.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-kernel/make-mod-scripts/<a href=3D"http://mak=
e-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts=
_1.0.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 7 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/devicetree.bbclass<br>
&gt; &gt; b/meta/classes/devicetree.bbclass<br>
&gt; &gt; index c772ab2ab9..ece883accf 100644<br>
&gt; &gt; --- a/meta/classes/devicetree.bbclass<br>
&gt; &gt; +++ b/meta/classes/devicetree.bbclass<br>
&gt; &gt; @@ -18,7 +18,7 @@ SECTION ?=3D &quot;bsp&quot;<br>
&gt; &gt;=C2=A0 # device trees built with them are at least GPLv2 (and in =
some cases<br>
&gt; &gt; dual<br>
&gt; &gt;=C2=A0 # licensed). Default to GPLv2 if the recipe does not speci=
fy a<br>
&gt; &gt; license.<br>
&gt; &gt;=C2=A0 LICENSE ?=3D &quot;GPLv2&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM ?=3D &quot;file://${COMMON_LICENSE_DIR}/GPL-<b=
r>
&gt; &gt; 2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM ?=3D &quot;file://${COMMON_LICENSE_DIR}/GPL-2.=
0-<br>
&gt; &gt; only;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt; &gt;=C2=A0 DEPENDS +=3D &quot;dtc-native&quot;<br>
&gt; &gt; diff --git a/meta/recipes-connectivity/connman/<a href=3D"http:/=
/connman-conf.bb" rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a><=
br>
&gt; &gt; b/meta/recipes-connectivity/connman/<a href=3D"http://connman-co=
nf.bb" rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a><br>
&gt; &gt; index 9a519ec866..85fee09258 100644<br>
&gt; &gt; --- a/meta/recipes-connectivity/connman/<a href=3D"http://connma=
n-conf.bb" rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a><br>
&gt; &gt; +++ b/meta/recipes-connectivity/connman/<a href=3D"http://connma=
n-conf.bb" rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a><br>
&gt; &gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;Connman config to setup wired =
interface on<br>
&gt; &gt; qemu machines&quot;<br>
&gt; &gt;=C2=A0 DESCRIPTION =3D &quot;This is the ConnMan configuration to=
 set up a Wired \<br>
&gt; &gt;=C2=A0 network interface for a qemu machine.&quot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br=
>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quo=
t;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit systemd<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox=
-inittab_1.32.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox-inittab_1.=
32.0.bb</a><br>
&gt; &gt; b/meta/recipes-core/busybox/<a href=3D"http://busybox-inittab_1.=
32.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox-inittab_1.32.0.bb</a>=
<br>
&gt; &gt; index 61fb8cbad1..2129acd8d3 100644<br>
&gt; &gt; --- a/meta/recipes-core/busybox/<a href=3D"http://busybox-initta=
b_1.32.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox-inittab_1.32.0.bb=
</a><br>
&gt; &gt; +++ b/meta/recipes-core/busybox/<a href=3D"http://busybox-initta=
b_1.32.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox-inittab_1.32.0.bb=
</a><br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;inittab configuration for BusyBox&quot;<=
br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br=
>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quo=
t;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;file://inittab&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; b/meta/recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; index 52880791a7..4f81f07da7 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt;=C2=A0 require glibc-common.inc<br>
&gt; &gt;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/GPL-<br=
>
&gt; &gt; 2.0;md5=3D801f80980d171dd6425610833a22dbe6 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/LGPL-<br>
&gt; &gt; 2.1;md5=3D1a6d268fd218675ffea8be556788b780&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/GPL-2.0=
-<br>
&gt; &gt; only;md5=3D801f80980d171dd6425610833a22dbe6 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/LGPL-2.1-<br>
&gt; &gt; only;md5=3D1a6d268fd218675ffea8be556788b780&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 deltask do_fetch<br>
&gt; &gt;=C2=A0 deltask do_unpack<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd=
-serialgetty.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.b=
b</a><br>
&gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgett=
y.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
&gt; &gt; index 0cc0dc8c79..9a63c9f0a8 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-serial=
getty.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><b=
r>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-serial=
getty.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><b=
r>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;Serial terminal support for systemd&quot=
;<br>
&gt; &gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://www.freedesktop.org/=
wiki/Software/systemd/" rel=3D"noreferrer" target=3D"_blank">https://www.fr=
eedesktop.org/wiki/Software/systemd/</a>&quot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br=
>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quo=
t;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PR =3D &quot;r5&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/sysvinit/<a href=3D"http://sysvin=
it-inittab_2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit-initta=
b_2.88dsf.bb</a><br>
&gt; &gt; b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_=
2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit-inittab_2.88dsf.b=
b</a><br>
&gt; &gt; index 8781492d47..d95d1a63f5 100644<br>
&gt; &gt; --- a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-init=
tab_2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit-inittab_2.88d=
sf.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-init=
tab_2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit-inittab_2.88d=
sf.bb</a><br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;Inittab configuration for SysVinit&quot;=
<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br=
>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quo=
t;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PR =3D &quot;r10&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-<br>
&gt; &gt; <a href=3D"http://scripts_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">scripts_1.0.bb</a> b/meta/recipes-kernel/make-mod-scripts/make-mod-<=
br>
&gt; &gt; <a href=3D"http://scripts_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">scripts_1.0.bb</a><br>
&gt; &gt; index 1ab248fed5..8a02bc7f48 100644<br>
&gt; &gt; --- a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://mak=
e-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts=
_1.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://mak=
e-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts=
_1.0.bb</a><br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;Build tools needed by external modules&q=
uot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br=
>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common=
-<br>
&gt; &gt; licenses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quo=
t;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit kernel-arch<br>
&gt; &gt;=C2=A0 inherit pkgconfig<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000efb1e905b4501703--
