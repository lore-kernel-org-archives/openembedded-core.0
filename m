Return-Path: <alex.kanavin@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id AE565608A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:01:39 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b22so1435848pls.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HeRiPi1MRML+WlRLGqnKRQrihSzVngoiXOxWE384iXU=;
	b=ZfQRtVfML92OG7cZYclGcIf6qVDP2oN6SzbgE1cTqv/YWjKAqP1DdoB0Vb0ejZGe3n
	uJ+8wZidH0rUNdDk/FM1/W7a45GCGzkXqqbEeegaC/sxyoPf7wo7kaJuEOSFvytjsaDO
	xWjEPgcfdkUCUjTUdiVt5X8chZDFu6ieW4luzgk13IE0l2SICwCVbJai8JxZiG6hbHS+
	sAFAO5Lsl4liqNxTR4VsDHBcE8xkpDeKg115ZNj/lMSrENFq/6BiK2AcXcg84I8dqAvg
	1kKdDVHjbQ70DaGrvkTNLMxCY45P7gySL0V4VRLvjSDMA67ItyQKsY+XdN8Iu4FbpOYy
	TeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HeRiPi1MRML+WlRLGqnKRQrihSzVngoiXOxWE384iXU=;
	b=dntctmpJFeKM/thdZtUu4Csj3r1X+gMBEEErWXfjyBRRcn/Vv6l2bm2RqG+gZ/zsf/
	FDSXYVDcaO9TpdKosUitu3NpE+UZPPTRU5SuXcy2rKpxwBHsn6sLLaaFhxDLVgHz6BLD
	iRxqCsLxSSPX6GRMLgB+A3lqQ1+PE1SZHPZO6T0QpFMT/sbXbDHVJk3Kkpxua/vbFGeF
	RX8mlMzo90HvT7hz8/iLA7ZqzFGr8Axb1+65LHQ6wAXFX+OatMXOIRD7nv1U73vQBcjt
	OG9fwwSnj+omE1fIVnjLLcvEY2EoDeBTjleACmkcD6qe3nfO3rnNjlp1RNFeftxWQ9cy
	b+ew==
X-Gm-Message-State: APjAAAVEm4+o9UUOq2dqdUBrwmJcDFelhkBv0gyqncCvr9i5SJoB9Xi7
	qKEYAus1yf4O9em4toUZmkrRiD0AxoTvRfim2Zc3/ofH
X-Google-Smtp-Source: APXvYqzYKBwMK7RY6v1gYWUi0TUA3xaNiqvGLBlQbH9fUD8dkncwY0bBBDXq8mRDOKrms3UULlhz2lp+zRk4JycbZd0=
X-Received: by 2002:a05:6102:405:: with SMTP id d5mr167403vsq.94.1580315430238;
	Wed, 29 Jan 2020 08:30:30 -0800 (PST)
MIME-Version: 1.0
References: <1579595173-23336-1-git-send-email-sumit.garg@linaro.org>
	<2736c79c-ff8e-3d90-52cd-b264bba74d09@gmail.com>
In-Reply-To: <2736c79c-ff8e-3d90-52cd-b264bba74d09@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2020 17:30:18 +0100
Message-ID: <CANNYZj9pLvB+buTyq0gWx_1Jh0D8V1SwyDdwbEOkmKfMLUGhxQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [zeus][PATCH] core: recipes: fix some native tools dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2020 15:03:35 -0000
Content-Type: multipart/alternative; boundary="000000000000da3dd9059d49db17"

--000000000000da3dd9059d49db17
Content-Type: text/plain; charset="UTF-8"

I think a separate, somewhat different patch was sent for master?

Alex

On Wed, 29 Jan 2020 at 17:15, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 1/21/20 12:26 AM, Sumit Garg wrote:
> > Some native tools dependency issues were seen while building with
> > external GCC tool-set rather than source GCC tool-set. While building
> > with source tool-set these dependencies were implicitly met which is not
> > the case with external tool-set. So explicitly state these native tools
> > dependencies.
> Do these changes need to be in master?
>
> - armin
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  meta/recipes-extended/man-db/man-db_2.8.7.bb       | 2 +-
> >  meta/recipes-extended/psmisc/psmisc.inc            | 2 +-
> >  meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb
> b/meta/recipes-extended/man-db/man-db_2.8.7.bb
> > index 083b237..0d73b03 100644
> > --- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
> > +++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
> > @@ -10,7 +10,7 @@ SRC_URI =
> "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
> >  SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
> >  SRC_URI[sha256sum] =
> "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
> >
> > -DEPENDS = "libpipeline gdbm groff-native base-passwd"
> > +DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
> >  RDEPENDS_${PN} += "base-passwd"
> >
> >  # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939:
> undefined reference to `_nl_msg_cat_cntr'
> > diff --git a/meta/recipes-extended/psmisc/psmisc.inc
> b/meta/recipes-extended/psmisc/psmisc.inc
> > index 594a10c..6de5acb 100644
> > --- a/meta/recipes-extended/psmisc/psmisc.inc
> > +++ b/meta/recipes-extended/psmisc/psmisc.inc
> > @@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is
> specified) to \
> >  processes identified by name.  The fuser command identifies the PIDs \
> >  of processes that are using specified files or filesystems."
> >  SECTION = "base"
> > -DEPENDS = "ncurses virtual/libintl gettext-native"
> > +DEPENDS = "ncurses virtual/libintl gettext-native xz-native"
> >  LICENSE = "GPLv2"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
> > diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> > index 3529cb2..211e399 100644
> > --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> > +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> > @@ -12,6 +12,6 @@ INC_PR = "r8"
> >
> >  SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
> >
> > -inherit autotools pkgconfig distro_features_check
> > +inherit autotools pkgconfig distro_features_check gettext
> >
> >  FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
>
>

--000000000000da3dd9059d49db17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think a separate, somewhat different patch was sent=
 for master?</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 29 Jan 2020 at =
17:15, akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<br>
On 1/21/20 12:26 AM, Sumit Garg wrote:<br>
&gt; Some native tools dependency issues were seen while building with<br>
&gt; external GCC tool-set rather than source GCC tool-set. While building<=
br>
&gt; with source tool-set these dependencies were implicitly met which is n=
ot<br>
&gt; the case with external tool-set. So explicitly state these native tool=
s<br>
&gt; dependencies.<br>
Do these changes need to be in master?<br>
<br>
- armin<br>
&gt; Signed-off-by: Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org"=
 target=3D"_blank">sumit.garg@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/man-db/<a href=3D"http://man-db_2.8.7.bb" =
rel=3D"noreferrer" target=3D"_blank">man-db_2.8.7.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta/recipes-extended/psmisc/psmisc.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/man-db/<a href=3D"http://man-db_2.8=
.7.bb" rel=3D"noreferrer" target=3D"_blank">man-db_2.8.7.bb</a> b/meta/reci=
pes-extended/man-db/<a href=3D"http://man-db_2.8.7.bb" rel=3D"noreferrer" t=
arget=3D"_blank">man-db_2.8.7.bb</a><br>
&gt; index 083b237..0d73b03 100644<br>
&gt; --- a/meta/recipes-extended/man-db/<a href=3D"http://man-db_2.8.7.bb" =
rel=3D"noreferrer" target=3D"_blank">man-db_2.8.7.bb</a><br>
&gt; +++ b/meta/recipes-extended/man-db/<a href=3D"http://man-db_2.8.7.bb" =
rel=3D"noreferrer" target=3D"_blank">man-db_2.8.7.bb</a><br>
&gt; @@ -10,7 +10,7 @@ SRC_URI =3D &quot;${SAVANNAH_NONGNU_MIRROR}/man-db/m=
an-db-${PV}.tar.xz \<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;ec0b23c8314a1654c4d059b2c18ce43d&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;b9cd5bb996305d08bfe9e1114edc30b4c97=
be807093b88af8033ed1cf9beb326&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS =3D &quot;libpipeline gdbm groff-native base-passwd&quot;<br>
&gt; +DEPENDS =3D &quot;libpipeline gdbm groff-native base-passwd flex-nati=
ve&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;base-passwd&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939=
: undefined reference to `_nl_msg_cat_cntr&#39;<br>
&gt; diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-ex=
tended/psmisc/psmisc.inc<br>
&gt; index 594a10c..6de5acb 100644<br>
&gt; --- a/meta/recipes-extended/psmisc/psmisc.inc<br>
&gt; +++ b/meta/recipes-extended/psmisc/psmisc.inc<br>
&gt; @@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing i=
s specified) to \<br>
&gt;=C2=A0 processes identified by name.=C2=A0 The fuser command identifies=
 the PIDs \<br>
&gt;=C2=A0 of processes that are using specified files or filesystems.&quot=
;<br>
&gt;=C2=A0 SECTION =3D &quot;base&quot;<br>
&gt; -DEPENDS =3D &quot;ncurses virtual/libintl gettext-native&quot;<br>
&gt; +DEPENDS =3D &quot;ncurses virtual/libintl gettext-native xz-native&qu=
ot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.=
gz&quot;<br>
&gt; diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta=
/recipes-graphics/xorg-app/xorg-app-common.inc<br>
&gt; index 3529cb2..211e399 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc<br>
&gt; +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc<br>
&gt; @@ -12,6 +12,6 @@ INC_PR =3D &quot;r8&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar=
.bz2&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit autotools pkgconfig distro_features_check<br>
&gt; +inherit autotools pkgconfig distro_features_check gettext<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES_${PN} +=3D &quot; ${libdir}/X11/${BPN} ${datadir}/X11/app-=
defaults/&quot;<br>
<br>
</blockquote></div>

--000000000000da3dd9059d49db17--
