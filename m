Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 525817F38D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 12:13:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n11so76660489qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VYO0aVwjRM1naS5fT+iISAyNu0iYSwZi8yvNTuzAPpU=;
	b=WhIHoKtc9Aj9GqMPDafUZphIH4INEL0DAM0KqUhfkWiCP8/1GOlXx9m/P/6S9qVOLL
	UM4ksZ5Oh1OpW5bt2WOtL2QaX3g5+QdBBVm4sdCi7eONJIvecmm9OweE/1anRxoqnnmN
	7mJcbQbQ2oSMj3t0h5gHcFdjEOW5CS+oDCkuxRTCua+Q8k7DYM5Q0cWB0MP9l4rAkVjf
	mGObqSvVQBdaz+8IC0UFERkNCWKMe1ObFOlOA4khUpt9yROl/xedWI1cs+JoxUugQDqc
	E9Dg17VPZRS2lZJ6DtgNwNf2hSc5ML7/soVgtFvrwysjRROBBZMKClBfdzFGvOiqem8B
	S72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VYO0aVwjRM1naS5fT+iISAyNu0iYSwZi8yvNTuzAPpU=;
	b=llpZ/rSiLXASJUwrND/SVjSKE0u82bTwSRvs53W93m9h+gmFT8UZDNtkWSEtBicbYW
	AsfcVVxiudhBsXpaq7/DsqK4UkTdmAvV1ouc4FBiTXbMvXTZmV6HkfgWvOIL4QNgRR0i
	FxbR4GtyO6iA6KSSNah+Vy8NTjHkwmN93qjK162zUNFs4Xrs8bqYHCnz/FoOWPg2vu01
	aU/XloP/AMCUMYP9xydduv1n6AsV0OLmRK9ayEsJxPdijJ+lRxvpA+kf9GD74kEKLF3A
	mNKo5506BxKHp1u+pHqJ6nvU4TQ7A8n4bLpcUglKzQ9vnaZ8NoS7th8ck5+G0Qtntq02
	c1RA==
X-Gm-Message-State: APjAAAVNFEMjdJbRiFDj630hdCdI8uuCWP/daQ10B612nkBtPwJo3vpG
	j+2CQ+fkUhdtdM6wKXOHCExBSiY686nqcG3269U=
X-Google-Smtp-Source: APXvYqywigqXtovCeUR/N8ChHlvCvDA6+GDcHP/xg/qrPCxHO1ScZ3jnAt0b9FxD6fzV7kPSTCLDXVKkVGpHg4O2HZ0=
X-Received: by 2002:a0c:bd1d:: with SMTP id
	m29mr103217536qvg.181.1564834406664; 
	Sat, 03 Aug 2019 05:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190731174820.16459-1-raj.khem@gmail.com>
	<20190731174820.16459-2-raj.khem@gmail.com>
	<232eed90aa6b376d8505d94f0b51e9352101fea7.camel@linuxfoundation.org>
In-Reply-To: <232eed90aa6b376d8505d94f0b51e9352101fea7.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 05:13:15 -0700
Message-ID: <CAMKF1so97t0zFsDB3PRaGaXD=VeTn8159WZojW29ctTEngyzYg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] llvm: Update to 8.0.1
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
X-List-Received-Date: Sat, 03 Aug 2019 12:13:26 -0000
Content-Type: multipart/alternative; boundary="000000000000f10d81058f356635"

--000000000000f10d81058f356635
Content-Type: text/plain; charset="UTF-8"

Thanks for taking care of this I noticed this failure last night as well

On Sat, Aug 3, 2019 at 3:53 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2019-07-31 at 10:48 -0700, Khem Raj wrote:
> > Add missing dependency on libedit
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-
> > devtools/llvm/llvm_git.bb
> > index 0067635c2b..6d3d69b9fb 100644
> > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > @@ -8,7 +8,7 @@ SECTION = "devel"
> >
> >  LIC_FILES_CHKSUM =
> > "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
> >
> > -DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
> > +DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
> >
> >  RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
> >
> > @@ -19,12 +19,12 @@ PROVIDES += "llvm${PV}"
> >  LLVM_RELEASE = "${PV}"
> >  LLVM_DIR = "llvm${LLVM_RELEASE}"
> >
> > -SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
> > +SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
> >
> >  BRANCH = "release/${MAJOR_VERSION}.x"
> >  MAJOR_VERSION = "8"
> >  MINOR_VERSION = "0"
> > -PATCH_VERSION = "0"
> > +PATCH_VERSION = "1"
>
> I had to tweak MESA_LLVM_RELEASE in the mesa recipe to match this
> change...
>
> (squashed into this patch in -next)
>
> Cheers,
>
> Richard
>
>

--000000000000f10d81058f356635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks for taking care of this I noticed this failur=
e last night as well=C2=A0</div></div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 3, 2019 at 3:53 AM Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Wed, 2019-07-31 at 10:48 -0700, Khem Raj wrote:<br>
&gt; Add missing dependency on libedit<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">llvm_git.bb</a> | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> b/meta/recipes-<br>
&gt; devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=
=3D"_blank">llvm_git.bb</a><br>
&gt; index 0067635c2b..6d3d69b9fb 100644<br>
&gt; --- a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">llvm_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">llvm_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SECTION =3D &quot;devel&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE.TXT;md5=3Dc6b766a4e85dd28301eeed54a6684648&quot;<=
br>
&gt;=C2=A0 <br>
&gt; -DEPENDS =3D &quot;libffi libxml2 zlib ninja-native llvm-native&quot;<=
br>
&gt; +DEPENDS =3D &quot;libffi libxml2 zlib libedit ninja-native llvm-nativ=
e&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS_${PN}_append_class-target =3D &quot; ncurses-terminfo&q=
uot;<br>
&gt;=C2=A0 <br>
&gt; @@ -19,12 +19,12 @@ PROVIDES +=3D &quot;llvm${PV}&quot;<br>
&gt;=C2=A0 LLVM_RELEASE =3D &quot;${PV}&quot;<br>
&gt;=C2=A0 LLVM_DIR =3D &quot;llvm${LLVM_RELEASE}&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;d2298e74235598f15594fe2c99bbac870a507c59&quot;<br>
&gt; +SRCREV =3D &quot;19a71f6bdf2dddb10764939e7f0ec2b98dba76c9&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 BRANCH =3D &quot;release/${MAJOR_VERSION}.x&quot;<br>
&gt;=C2=A0 MAJOR_VERSION =3D &quot;8&quot;<br>
&gt;=C2=A0 MINOR_VERSION =3D &quot;0&quot;<br>
&gt; -PATCH_VERSION =3D &quot;0&quot;<br>
&gt; +PATCH_VERSION =3D &quot;1&quot;<br>
<br>
I had to tweak MESA_LLVM_RELEASE in the mesa recipe to match this<br>
change...<br>
<br>
(squashed into this patch in -next)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000f10d81058f356635--
