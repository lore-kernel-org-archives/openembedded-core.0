Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 783FD7C40C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 22:27:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i12so23799326wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8zHutLJaEuMBaNWBDetceEWR8AQOJo6zHCN5aFKACME=;
	b=vAI7fb6L32XTvfVHqDbj4LCahMxmnYWLFcb2fEsBfDQb9qZEdO3rZHfXViEoZOuUNq
	V6yrJ/l7XYC8YINTZnbcraTuokLMrkiJ/Xo8My4PTzPR+5fmK8pROe80vcjHII8a0K/t
	riskXNPvz69vXNNcif5Gr/9Oo+SMe5gjszI4uyHGilGtdA5tMyh98LxsAQIM3NS2fMID
	ZXYq4Fs+ESpAnmulf48mmJr0zL44vP7kB20NRrDred68KU5Rnxq8XevS6mu69aquQ5xy
	Sr05idGVj6FKt4IlNuH6Bc9HpByQev5UbLaiPAJJ8ab6f+3q4oXt5g/slBBJ8mVAGLmD
	cL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8zHutLJaEuMBaNWBDetceEWR8AQOJo6zHCN5aFKACME=;
	b=GLg/yI2E79d6CcfN0CfOdNuCsuOcQTWjbCaaN7Hcw3XYXMmzZAtGRneLpfcX3Bs4B3
	gIQUqK5x4DnsSWKgoxngzZlZFog22L7p5MJaREQG/YWd1/LGQzhhse8sv5GdKvJuh3gI
	/eO8qUei+kmd2kBFCBM4WboixhJmO/POowEFDBni2Sdc4oIZUWW2MNIPaE60tA/YsGpw
	QxAzU2dQKTq9hjqD5QIyf6k/Qqxyn49CgDJffmhFjBRh8mn3RNQKL5vvBxLWaPzjjJc5
	Vly4D1anOKmrJYF8A01iskNfNyNjaF3YEgC3i1j7ApME55/ls+2qGIrs1CsciPG3AaV+
	CXrQ==
X-Gm-Message-State: APjAAAVBhgqsET9TZtdcqyWQK2PVG6Cyl7BK24MnqcRD1yQbT5jGwGDf
	Pm4D75UuhrMib8ZbaeT3U+RAvEA6uP1vSE89eT8=
X-Google-Smtp-Source: APXvYqxYO5Pf4Hlua6N3Kd7gokOCIwBEtjViN070pqlT87MljIDinymS8Me5NaNOb2+2gxk7biXC4u0YelvcO4ujnHk=
X-Received: by 2002:adf:f846:: with SMTP id d6mr1159153wrq.53.1551392848058;
	Thu, 28 Feb 2019 14:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20190228183224.26536-1-alistair.francis@wdc.com>
	<CANNYZj_Qc1in4voneFDom8pJ-rqzBQbtWQmU=ycO_v1g5N_rNA@mail.gmail.com>
	<CAKmqyKN_ZzhCD2TYiC2yGiNa-fa0Ye0bPgX8mShsoyLNF-3t1w@mail.gmail.com>
In-Reply-To: <CAKmqyKN_ZzhCD2TYiC2yGiNa-fa0Ye0bPgX8mShsoyLNF-3t1w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Feb 2019 23:27:15 +0100
Message-ID: <CA+chaQdmoa8c3vKVzCXmA_2F2eiF7T__gz+YXxYv5Xq7yRq8ew@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing dtc-native dependency
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
X-List-Received-Date: Thu, 28 Feb 2019 22:27:27 -0000
Content-Type: multipart/alternative; boundary="0000000000009d9f760582fbcbae"

--0000000000009d9f760582fbcbae
Content-Type: text/plain; charset="UTF-8"

Can you check if it was failing like this when --disable-fdt
(from qemu.inc:PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc") was
passed during do_configure?

If yes, then we should try to fix the PACKAGECONFIG first (before just
enabling fdt for everybody).

On Thu, Feb 28, 2019 at 10:05 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Feb 28, 2019 at 12:15 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Thu, 28 Feb 2019 at 19:33, Alistair Francis <Alistair.Francis@wdc.com>
> wrote:
> > > diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > index c8acff8e19..e3efd873ca 100644
> > > --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > @@ -1,6 +1,6 @@
> > >  BPN = "qemu"
> > >
> > > -DEPENDS = "glib-2.0-native zlib-native"
> > > +DEPENDS = "glib-2.0-native zlib-native dtc-native"
> > >
> > >  require qemu-native.inc
> >
> > The dtc dependency is pulled into qemu-system-native recipe via 'fdt'
> > PACKAGECONFIG. Is there a reason it needs to be in qemu-native? (which
> > since today provides only the usermode bits)
> > If there is, it should be in the commit message.
>
> I'll send a v2 using package config.
>
> DTC is required to avoid this error when building:
>
> hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file or
> directory
>
> Alistair
>
> >
> > Alex
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009d9f760582fbcbae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Can you check if it was failing like this=
 when --disable-fdt (from=C2=A0qemu.inc:PACKAGECONFIG[fdt] =3D &quot;--enab=
le-fdt,--disable-fdt,dtc&quot;) was passed during do_configure?</div><div d=
ir=3D"ltr"><br></div><div>If yes, then we should try to fix the PACKAGECONF=
IG first (before just enabling fdt for everybody).</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 28, 201=
9 at 10:05 PM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">=
alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, Feb 28, 2019 at 12:15 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 28 Feb 2019 at 19:33, Alistair Francis &lt;<a href=3D"mailto:A=
listair.Francis@wdc.com" target=3D"_blank">Alistair.Francis@wdc.com</a>&gt;=
 wrote:<br>
&gt; &gt; diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu-na=
tive_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a=
> b/meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a><br>
&gt; &gt; index c8acff8e19..e3efd873ca 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a><br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;=C2=A0 BPN =3D &quot;qemu&quot;<br>
&gt; &gt;<br>
&gt; &gt; -DEPENDS =3D &quot;glib-2.0-native zlib-native&quot;<br>
&gt; &gt; +DEPENDS =3D &quot;glib-2.0-native zlib-native dtc-native&quot;<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 require qemu-native.inc<br>
&gt;<br>
&gt; The dtc dependency is pulled into qemu-system-native recipe via &#39;f=
dt&#39;<br>
&gt; PACKAGECONFIG. Is there a reason it needs to be in qemu-native? (which=
<br>
&gt; since today provides only the usermode bits)<br>
&gt; If there is, it should be in the commit message.<br>
<br>
I&#39;ll send a v2 using package config.<br>
<br>
DTC is required to avoid this error when building:<br>
<br>
hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file or director=
y<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000009d9f760582fbcbae--
