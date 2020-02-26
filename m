Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBF261672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:16:47 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id u26so761750vsg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SpoR3RAFzcSY5PdQa5qihqiUUCnavPiu2zii8Is9J/E=;
	b=R1xJC9K/1Mo21T7dRF3nX946sMgFFaD6v2wUwqI42jSjkX/dOpsksC86hVGgN/JnzG
	/SbsYtkeaorU00b7+7jshTli9j8mirljIf8VMu+wOVmAkkktlwyXB07mGACaX2Mc6UBX
	7oTuHF0aI+WRM5Of4z9t4U9UrnGjgXNA3hHYUH3BZHJFrCskPtMVffWWsKgQBw8TWH5D
	FVB7ev2vBFonoIXy4L4i8+8N3lXndzdW/Z4FUH992JIamKUpaZsZf/xSFwFyAETAcfsy
	CPhiSoVINoYNtopqvpal9ukLythXsyF9tfeR7U2V/TxvBzvJ8pfSqZsmbeq205OuFr1M
	yTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SpoR3RAFzcSY5PdQa5qihqiUUCnavPiu2zii8Is9J/E=;
	b=ajnJDCuc2anQJUwhUFqjFGVumDzU27e2/b7J2WCuDeNUv1tN/VqmdoHgdNyuTXiRzi
	NBJRz/NdQAajy3VCiYIAenqrYbqIb6q9OoZ5X+ddXjmG/KzqvPVdnFtnYj0I/eZ8SuqU
	GsLemoifUoawJgBSiJgcZhG9PMJ/aGe2jgcCIT1jSWfRWOafMqLdaO3AW/SN1XYvwqmW
	9GSVkm9dHEGznjVm2KsQ31/ctbkzY65mnSxJQebsGf87rmtGYQaQZBPjeUjvtY90G0SV
	2X78O/tdIhIJUsaty8/uohz2epfYMB2XAsoKFqcN4y7zZivgKU0cIX+MK1uRdoSwStqW
	CSrg==
X-Gm-Message-State: APjAAAVTeYNK8E/N+RwNYh4ugbAanglJg7cuv1FTbZ+VPm4LxYSqWhI5
	RbLjl3yHgDMNAmmdvubl+/S2ARFMPA8cCJyw8wgv6g==
X-Google-Smtp-Source: APXvYqwttJV2ixjbsxlSFR99rADBkZtDokJjf56qwriSz/v6ellI8khisfhvbN+56W/8pT6sao3DRF67Hb8D947VM/4=
X-Received: by 2002:a05:6102:757:: with SMTP id v23mr305vsg.35.1582737408019; 
	Wed, 26 Feb 2020 09:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CANNYZj8MzPaJM7DMuufL_QShHtK5v5e=VjK7xmS2zz1ovf7J6g@mail.gmail.com>
	<a9d54420-9427-c153-aa2c-1586363de362@pr.hu>
	<dd5abcfe-a403-5184-4dd1-e19a050a85fa@pr.hu>
In-Reply-To: <dd5abcfe-a403-5184-4dd1-e19a050a85fa@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Feb 2020 18:16:35 +0100
Message-ID: <CANNYZj9XagmKuTr4QTRzcO0RafOx7PJGBtm+pZHFMNTM1nVhuQ@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 17:16:47 -0000
Content-Type: multipart/alternative; boundary="000000000000fa4f05059f7dc46d"

--000000000000fa4f05059f7dc46d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, then I am okay with this, as long as there are proper commit
messages, and no version in .inc filename.

Alex

On Wed, 26 Feb 2020 at 17:37, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@pr.hu> wrote:

> 2020. 02. 26. 17:35 keltez=C3=A9ssel, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n via Openembedded-core
> =C3=ADrta:
> > 2020. 02. 26. 17:12 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >> The 'circular dependency' thing must be explained in the commits, and
> not in a
> >> discussion link to some email elsewhere.
> >>
> >> I still don't get why this is needed. The -initial recipe is identical
> to the eventual
> >> 'real' recipe, so where is the circularity coming from?
> >
> > libva -> mesa -> libva
>
> And the -initial recipe is NOT identical to the real one.
> The real one always had DEPENDS =3D "virtual/mesa"
>
> >
> >>
> >> Alex
> >>
> >> On Wed, 26 Feb 2020 at 15:05, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n v=
ia Openembedded-core
> >> <openembedded-core@lists.openembedded.org
> >> <mailto:openembedded-core@lists.openembedded.org>> wrote:
> >>
> >>     The package name exploits sstate.bbclass so it's not added as
> >>     implicit dependency to packages.
> >>
> >>     Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.=
hu <mailto:
> zboszor@pr.hu>>
> >>     ---
> >>       meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
> >>       meta/recipes-graphics/libva/libva-initial_2.6.1.bb <
> http://libva-initial_2.6.1.bb> |
> >>     5 +++++
> >>       2 files changed, 8 insertions(+), 1 deletion(-)
> >>       create mode 100644 meta/recipes-graphics/libva/
> libva-initial_2.6.1.bb
> >>     <http://libva-initial_2.6.1.bb>
> >>
> >>     diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc
> >>     b/meta/recipes-graphics/libva/libva-2.6.1.inc
> >>     index ca1386d80b..5b1cdee7e3 100644
> >>     --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
> >>     +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
> >>     @@ -17,10 +17,12 @@ SECTION =3D "x11"
> >>       LICENSE =3D "MIT"
> >>       LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D2e48940f94acb0af582e5ef03537800f"
> >>
> >>     -SRC_URI =3D "
> https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2
> >>     <
> https://github.com/intel/$%7BBPN%7D/releases/download/$%7BPV%7D/$%7BBP%7D=
.tar.bz2
> >"
> >>     +SRC_URI =3D "
> https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz=
2
> >>     <
> https://github.com/intel/libva/releases/download/$%7BPV%7D/libva-$%7BPV%7=
D.tar.bz2
> >"
> >>       SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
> >>       SRC_URI[sha256sum] =3D
> >> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
> >>
> >>     +S =3D "${WORKDIR}/libva-${PV}"
> >>     +
> >>       UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
> >>
> >>       DEPENDS =3D "libdrm"
> >>     diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> >>     <http://libva-initial_2.6.1.bb> b/meta/recipes-graphics/libva/
> libva-initial_2.6.1.bb
> >>     <http://libva-initial_2.6.1.bb>
> >>     new file mode 100644
> >>     index 0000000000..828ef6fbca
> >>     --- /dev/null
> >>     +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> >> <http://libva-initial_2.6.1.bb>
> >>     @@ -0,0 +1,5 @@
> >>     +require libva-${PV}.inc
> >>     +
> >>     +do_install_append () {
> >>     +       rm -f ${D}${libdir}/*.so*
> >>     +}
> >>     --     2.24.1
> >>
> >>     --     _______________________________________________
> >>     Openembedded-core mailing list
> >>     Openembedded-core@lists.openembedded.org
> >> <mailto:Openembedded-core@lists.openembedded.org>
> >>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >
>
>

--000000000000fa4f05059f7dc46d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, then I am okay with this, as long as there are=
 proper commit messages, and no version in .inc filename.</div><div><br></d=
iv><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 26 Feb 2020 at 17:37, B=C3=B6sz=C3=B6rm=C3=A9=
nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@pr.hu">zboszor@pr.hu</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">2020. 02.=
 26. 17:35 keltez=C3=A9ssel, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Ope=
nembedded-core =C3=ADrta:<br>
&gt; 2020. 02. 26. 17:12 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:<br>
&gt;&gt; The &#39;circular dependency&#39; thing must be explained in the c=
ommits, and not in a <br>
&gt;&gt; discussion link to some email elsewhere.<br>
&gt;&gt;<br>
&gt;&gt; I still don&#39;t get why this is needed. The -initial recipe is i=
dentical to the eventual <br>
&gt;&gt; &#39;real&#39; recipe, so where is the circularity coming from?<br=
>
&gt; <br>
&gt; libva -&gt; mesa -&gt; libva<br>
<br>
And the -initial recipe is NOT identical to the real one.<br>
The real one always had DEPENDS =3D &quot;virtual/mesa&quot;<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 26 Feb 2020 at 15:05, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n via Openembedded-core <br>
&gt;&gt; &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 The package name exploits sstate.bbclass so it&=
#39;s not added as<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 implicit dependency to packages.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=
=C3=A1n &lt;<a href=3D"mailto:zboszor@pr.hu" target=3D"_blank">zboszor@pr.h=
u</a> &lt;mailto:<a href=3D"mailto:zboszor@pr.hu" target=3D"_blank">zboszor=
@pr.hu</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0meta/recipes-graphics/libva/libva-2=
.6.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0meta/recipes-graphics/libva/<a href=
=3D"http://libva-initial_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">lib=
va-initial_2.6.1.bb</a> &lt;<a href=3D"http://libva-initial_2.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">http://libva-initial_2.6.1.bb</a>&gt; |<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 5 +++++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A02 files changed, 8 insertions(+), 1=
 deletion(-)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta/recipes-gra=
phics/libva/<a href=3D"http://libva-initial_2.6.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libva-initial_2.6.1.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://libva-initial_2.6.1.bb" r=
el=3D"noreferrer" target=3D"_blank">http://libva-initial_2.6.1.bb</a>&gt;<b=
r>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta/recipes-graphics/libva/libva-=
2.6.1.inc<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 b/meta/recipes-graphics/libva/libva-2.6.1.inc<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index ca1386d80b..5b1cdee7e3 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- a/meta/recipes-graphics/libva/libva-2.6.1.i=
nc<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta/recipes-graphics/libva/libva-2.6.1.i=
nc<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -17,10 +17,12 @@ SECTION =3D &quot;x11&quot;=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://C=
OPYING;md5=3D2e48940f94acb0af582e5ef03537800f&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 -SRC_URI =3D &quot;<a href=3D"https://github.co=
m/intel/$%7BBPN%7D/releases/download/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"no=
referrer" target=3D"_blank">https://github.com/intel/${BPN}/releases/downlo=
ad/${PV}/${BP}.tar.bz2</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://github.com/intel/$%7BBPN=
%7D/releases/download/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/intel/$%7BBPN%7D/releases/download/$%7BPV%7=
D/$%7BBP%7D.tar.bz2</a>&gt;&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +SRC_URI =3D &quot;<a href=3D"https://github.co=
m/intel/libva/releases/download/$%7BPV%7D/libva-$%7BPV%7D.tar.bz2" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/intel/libva/releases/downlo=
ad/${PV}/libva-${PV}.tar.bz2</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://github.com/intel/libva/r=
eleases/download/$%7BPV%7D/libva-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/intel/libva/releases/download/$%7BPV%7D/li=
bva-$%7BPV%7D.tar.bz2</a>&gt;&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;aef13eb48=
e01a47d1416d97462a22a11&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0SRC_URI[sha256sum] =3D <br>
&gt;&gt; &quot;6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401e=
aea5&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +S =3D &quot;${WORKDIR}/libva-${PV}&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a hre=
f=3D"https://github.com/intel/libva/releases" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/intel/libva/releases</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0DEPENDS =3D &quot;libdrm&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta/recipes-graphics/libva/<a hre=
f=3D"http://libva-initial_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">li=
bva-initial_2.6.1.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://libva-initial_2.6.1.bb" r=
el=3D"noreferrer" target=3D"_blank">http://libva-initial_2.6.1.bb</a>&gt; b=
/meta/recipes-graphics/libva/<a href=3D"http://libva-initial_2.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libva-initial_2.6.1.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://libva-initial_2.6.1.bb" r=
el=3D"noreferrer" target=3D"_blank">http://libva-initial_2.6.1.bb</a>&gt;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..828ef6fbca<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta/recipes-graphics/libva/<a href=3D"ht=
tp://libva-initial_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">libva-ini=
tial_2.6.1.bb</a> <br>
&gt;&gt; &lt;<a href=3D"http://libva-initial_2.6.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://libva-initial_2.6.1.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,5 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +require libva-${PV}.inc<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +do_install_append () {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}=
/*.so*<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +}<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 2.24.1<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 _________________________=
______________________<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Openembedded-core mailing list<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"mailto:Openembedded-core@lists.opene=
mbedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>=
 <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.=
org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000fa4f05059f7dc46d--
