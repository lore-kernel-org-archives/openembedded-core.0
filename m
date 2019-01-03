Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id E169D747E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 23:15:32 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id q8so20672842qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 15:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tSP8RyYAjToiJitcx44KeezcRWLQ2wokLF0j2KHhXlU=;
	b=ukVKVu7Ptmoz00/0XEAwP/c3L0GGmsw/r2fpy7KYEvMJkVybpPqZI7QPVYBWwoTxLV
	8AFIiCzr5Syw2ME5Kn39ciOh2D7C5IWFm0SaT25snzKLv9TiPEgdqE1Td7oUtvJKlzXo
	1Z3i1aCUEmU/Xg0NoUt7WLSoYmEKBHUBrb/p/Kc3mZOqZGtqve0ECkW+i0WS4bU8iF1h
	3LGzzQmt2rtlNSHcTLSCRQRrL5/s2NLXaauL1Q4ncUmp/dQwbANY+Wg+lnIohnPXMB2J
	iIXtJyg8JIAnhR/4OEYZdl7r4d1dk2crdqIjOHTBDIN+74aRFMK5djoDstzUvcehrobM
	7Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tSP8RyYAjToiJitcx44KeezcRWLQ2wokLF0j2KHhXlU=;
	b=k5nA5SqB3yjRi5olbPa5GlHAuVDBMTwQ4rzKpDtieoizL/D+RpuRr61U/L0YN2VHt4
	60Y9vLct8W5O+nHbXMlkUXMuPUBCTC+gCCjLwNuLOhDNS3Ic2KR2R6jjxEO9/iuL0F5l
	LA+7ynt9fgS3jbYttXKSoo9P8WuYmoFgk2ZyzRzIgNR5BldAYJYjGRidD0sphVIoWxcv
	dxlEa2ioxMm8GIku1wJSVD1RD/KmU5Gy0x8e093YS8XExONeN2ri04wTOySxTPilZAhc
	AuyFv08WMXZGyRuKOtIFTcGFWkCmpqAAkElamqcce61TzQLVDkaO18+2lDr3vKOi52Xv
	st8w==
X-Gm-Message-State: AJcUukdYpqOJZm5w/0Szs2pV2svr1jlrqyLkntfg+fB3XMJyoBNYbF1C
	Mds7IO0mM4DjSlNSNoTKNnopfDykLxcyx7AYzvc=
X-Google-Smtp-Source: ALg8bN5yZUwsl6vLVRJ6eM4n4zwo6Qtas8ffpka6BmD2FORocvXvPeVa0l9bwihmvBI3ALxHMLbx7i+hd/6RsmsvIHc=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr44850844qkf.223.1546557333519;
	Thu, 03 Jan 2019 15:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20190103223211.23531-1-alistair.francis@wdc.com>
	<CAMKF1soQ4jSBtSXCZVHDtk6nHcyKTSG9UFK6-vLETxmoSwkeQw@mail.gmail.com>
	<CAKmqyKN99yaSkjXVMCjt+HFC+QR-N+yJkrjzVTDSwUaZkcsh2A@mail.gmail.com>
In-Reply-To: <CAKmqyKN99yaSkjXVMCjt+HFC+QR-N+yJkrjzVTDSwUaZkcsh2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jan 2019 15:15:22 -0800
Message-ID: <CAMKF1srUDMrZ=T_UsSab-k91PVi3oML+L2OXoyfCLPdJKS7=cQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fts: Bump FTS to version 1.2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 23:15:33 -0000
Content-Type: multipart/alternative; boundary="0000000000007d421d057e95f070"

--0000000000007d421d057e95f070
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 2:51 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Jan 3, 2019 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Jan 3, 2019 at 2:42 PM Alistair Francis
> > <Alistair.Francis@wdc.com> wrote:
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-core/fts/fts.bb       | 22 ----------------------
> > >  meta/recipes-core/fts/fts_1.2.7.bb | 18 ++++++++++++++++++
> > >  2 files changed, 18 insertions(+), 22 deletions(-)
> > >  delete mode 100644 meta/recipes-core/fts/fts.bb
> > >  create mode 100644 meta/recipes-core/fts/fts_1.2.7.bb
> > >
> > > diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/
> fts.bb
> > > deleted file mode 100644
> > > index 02f54086a3..0000000000
> > > --- a/meta/recipes-core/fts/fts.bb
> > > +++ /dev/null
> > > @@ -1,22 +0,0 @@
> > > -# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> > > -# Released under the MIT license (see COPYING.MIT for the terms)
> > > -
> >
> > I am sad you took this out :)
>
> Do you want me to keep it in?


Usually yes

>
>
> Alistair
>
> >
> > > -SUMMARY = "POSIX file tree stream operations library"
> > > -HOMEPAGE = "https://sites.google.com/a/bostic.com/keithbostic"
> > > -LICENSE = "BSD-3-Clause"
> > > -LIC_FILES_CHKSUM =
> "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
> > > -SECTION = "libs"
> > > -
> > > -SRCREV = "944333aed9dc24cfa76cc64bfe70c75d25652753"
> > > -PV = "1.2+git${SRCPV}"
> > > -
> > > -SRC_URI = "git://github.com/voidlinux/musl-fts \
> > > -"
> > > -S = "${WORKDIR}/git"
> > > -
> > > -inherit autotools pkgconfig
> > > -#
> > > -# We will skip parsing for non-musl systems
> > > -#
> > > -COMPATIBLE_HOST = ".*-musl.*"
> > > -
> > > diff --git a/meta/recipes-core/fts/fts_1.2.7.bb
> b/meta/recipes-core/fts/fts_1.2.7.bb
> > > new file mode 100644
> > > index 0000000000..7ede6550f6
> > > --- /dev/null
> > > +++ b/meta/recipes-core/fts/fts_1.2.7.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY = "Implementation of ftsfor musl libc packages"
> > > +HOMEPAGE = "https://github.com/pullmoll/musl-fts"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
> > > +SECTION = "libs"
> > > +
> > > +SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
> > > +
> > > +SRC_URI = "git://github.com/pullmoll/musl-fts.git"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +inherit autotools pkgconfig
> > > +#
> > > +# We will skip parsing for non-musl systems
> > > +#
> > > +COMPATIBLE_HOST = ".*-musl.*"
> > > +
> > > --
> > > 2.19.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007d421d057e95f070
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Thu, Jan 3, 2019 at 2:51 PM Alistair Francis &lt;<a hre=
f=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Thu, Jan 3, 2019 at 2:46 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jan 3, 2019 at 2:42 PM Alistair Francis<br>
&gt; &lt;<a href=3D"mailto:Alistair.Francis@wdc.com" target=3D"_blank">Alis=
tair.Francis@wdc.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.fr=
ancis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/fts/<a href=3D"http://fts.bb" rel=3D"nore=
ferrer" target=3D"_blank">fts.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 -------=
---------------<br>
&gt; &gt;=C2=A0 meta/recipes-core/fts/<a href=3D"http://fts_1.2.7.bb" rel=
=3D"noreferrer" target=3D"_blank">fts_1.2.7.bb</a> | 18 ++++++++++++++++++<=
br>
&gt; &gt;=C2=A0 2 files changed, 18 insertions(+), 22 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/fts/<a href=3D"http://=
fts.bb" rel=3D"noreferrer" target=3D"_blank">fts.bb</a><br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/fts/<a href=3D"http://=
fts_1.2.7.bb" rel=3D"noreferrer" target=3D"_blank">fts_1.2.7.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/fts/<a href=3D"http://fts.bb" rel=
=3D"noreferrer" target=3D"_blank">fts.bb</a> b/meta/recipes-core/fts/<a hre=
f=3D"http://fts.bb" rel=3D"noreferrer" target=3D"_blank">fts.bb</a><br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 02f54086a3..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/fts/<a href=3D"http://fts.bb" rel=3D"nore=
ferrer" target=3D"_blank">fts.bb</a><br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,22 +0,0 @@<br>
&gt; &gt; -# Copyright (C) 2015 Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; -# Released under the MIT license (see COPYING.MIT for the terms)=
<br>
&gt; &gt; -<br>
&gt;<br>
&gt; I am sad you took this out :)<br>
<br>
Do you want me to keep it in?</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Usually yes</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; &gt; -SUMMARY =3D &quot;POSIX file tree stream operations library&quot=
;<br>
&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"https://sites.google.com/a/bostic.=
com/keithbostic" rel=3D"noreferrer" target=3D"_blank">https://sites.google.=
com/a/bostic.com/keithbostic</a>&quot;<br>
&gt; &gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5ffe358174aad383=
f1b69ce3b53da982&quot;<br>
&gt; &gt; -SECTION =3D &quot;libs&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -SRCREV =3D &quot;944333aed9dc24cfa76cc64bfe70c75d25652753&quot;<=
br>
&gt; &gt; -PV =3D &quot;1.2+git${SRCPV}&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/voidlinux/m=
usl-fts" rel=3D"noreferrer" target=3D"_blank">github.com/voidlinux/musl-fts=
</a> \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -inherit autotools pkgconfig<br>
&gt; &gt; -#<br>
&gt; &gt; -# We will skip parsing for non-musl systems<br>
&gt; &gt; -#<br>
&gt; &gt; -COMPATIBLE_HOST =3D &quot;.*-musl.*&quot;<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/fts/<a href=3D"http://fts_1.2.7.bb=
" rel=3D"noreferrer" target=3D"_blank">fts_1.2.7.bb</a> b/meta/recipes-core=
/fts/<a href=3D"http://fts_1.2.7.bb" rel=3D"noreferrer" target=3D"_blank">f=
ts_1.2.7.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..7ede6550f6<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/fts/<a href=3D"http://fts_1.2.7.bb" rel=
=3D"noreferrer" target=3D"_blank">fts_1.2.7.bb</a><br>
&gt; &gt; @@ -0,0 +1,18 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Implementation of ftsfor musl libc packages&qu=
ot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pullmoll/musl-f=
ts" rel=3D"noreferrer" target=3D"_blank">https://github.com/pullmoll/musl-f=
ts</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5ffe358174aad383=
f1b69ce3b53da982&quot;<br>
&gt; &gt; +SECTION =3D &quot;libs&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV =3D &quot;0bde52df588e8969879a2cae51c3a4774ec62472&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/pullmoll/mu=
sl-fts.git" rel=3D"noreferrer" target=3D"_blank">github.com/pullmoll/musl-f=
ts.git</a>&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit autotools pkgconfig<br>
&gt; &gt; +#<br>
&gt; &gt; +# We will skip parsing for non-musl systems<br>
&gt; &gt; +#<br>
&gt; &gt; +COMPATIBLE_HOST =3D &quot;.*-musl.*&quot;<br>
&gt; &gt; +<br>
&gt; &gt; --<br>
&gt; &gt; 2.19.1<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000007d421d057e95f070--
