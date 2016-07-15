Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFF260722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 03:58:03 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l89so6403046lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 20:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=54k+U52Rm59fowLfbdoAYsY0wMX6iG0akgkfbwZmG4A=;
	b=WKXlcH2/i9uAerFJbD1viE/AulpK2c6DtTHwjlgeam6q1r5OjKK7gsxAmVJ0MJP+Nw
	KCQOa5AEisNFcgL6+yd7Lp1UMPiwsedEYypY61TY35dA7C/+lAOvkqgyrkIIKYh8mmQb
	fFRcIfy3iYUdCCiZKMURsNBlhvrQeclt/XlQjGdQv7zYVUbrrRm4maeOoQkW5BQWUCUm
	+knOvjG69Id6+Cn+w4Iktdouy6uclewRHT/tKq5FnBA48cdACO+2fO7JMzJl18UO4n++
	p1Yg0LEVebuVq4WjhN5Q4o/48AtQ8kEM3HY9BZjC6ko7QAr/9A+MphASLoboUxdLW+dj
	llgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=54k+U52Rm59fowLfbdoAYsY0wMX6iG0akgkfbwZmG4A=;
	b=f7LK4SxJyULFPAS/oGRv6LuzNDDgw+z4rFrQW/JL1L0vITApQ61CoKfI+H9SJjsCmr
	S6ZuLyOzlC4xbsfNUv43iaOqqKoamVYr0+v2njYt4pmnyLFJfeshijz478g8mlAXzJAB
	Q6vWPAo2A1cMhB9OyR3KKzcQ78zegDfl4ggC6CY2FtFDnVnorEnBoKpXIFifwgzz04nw
	jPnGDyzKMSl6UtrEr1kEapqHNdKkLKZVDwWfYDHb0zsj/QOdwLQ4dhPp5tV7G/FBwc/O
	Ak2aEx15Yj2IUfSoDQGfWddVkad/KfQPf8tbNSDCpp5MK6d4bVHV0eU6dvdagHr4N6Ry
	S6kw==
X-Gm-Message-State: ALyK8tKZwQqkjrWcW1qm7vwdhKNkGJjtJ7w2JoDuDXi3fT+8DbMv1aT/RzD+g239HSrSsMA/hwUdFJdJyWgRrg==
MIME-Version: 1.0
X-Received: by 10.46.1.148 with SMTP id f20mr8942255lji.52.1468555083902; Thu,
	14 Jul 2016 20:58:03 -0700 (PDT)
Received: by 10.25.10.10 with HTTP; Thu, 14 Jul 2016 20:58:03 -0700 (PDT)
In-Reply-To: <55FCD1E3-857F-4E09-801F-5EA1A96F2FF9@gmail.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<65069865417cc8d9a7d9f5a16daecebb2b3d4fe0.1468546499.git.timothy.t.orling@linux.intel.com>
	<55FCD1E3-857F-4E09-801F-5EA1A96F2FF9@gmail.com>
Date: Thu, 14 Jul 2016 20:58:03 -0700
Message-ID: <CANx9H-Caj+kFjyx2gHaXcCTM8_A_JKUxfb2xx=OuXhwg_cCHPg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH 6/8] binutils: disable werror on native build
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
X-List-Received-Date: Fri, 15 Jul 2016 03:58:04 -0000
Content-Type: multipart/alternative; boundary=001a1142c12e1bf9250537a4a0f5

--001a1142c12e1bf9250537a4a0f5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Can you elaborate? What am I missing or unaware of? Happy to keep digging!

--Tim

On Thursday, July 14, 2016, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jul 14, 2016, at 6:49 PM, Tim Orling <
> timothy.t.orling@linux.intel.com <javascript:;>> wrote:
> >
> > From: Dan McGregor <dan.mcgregor@usask.ca <javascript:;>>
> >
> > It's disabled on cross builds, and it's needed for gcc 6
> >
> > (From OE-Core rev: ce1b37e29dc89b67dc698e856007b59faa16c4df)
> >
> > Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca <javascript:;>>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> <javascript:;>>
> > ---
> > meta/recipes-devtools/binutils/binutils_2.26.bb | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb
> b/meta/recipes-devtools/binutils/binutils_2.26.bb
> > index b70ffbf..e976bad 100644
> > --- a/meta/recipes-devtools/binutils/binutils_2.26.bb
> > +++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
> > @@ -13,7 +13,8 @@ EXTRA_OECONF +=3D "--with-sysroot=3D/ \
> > EXTRA_OECONF_class-native =3D "--enable-targets=3Dall \
> >                              --enable-64-bit-bfd \
> >                              --enable-install-libiberty \
> > -                             --enable-install-libbfd"
> > +                             --enable-install-libbfd \
> > +                             --disable-werror=E2=80=9D
>
> How about other flavors of binutils ?
>
> >
> > do_install_class-native () {
> >       autotools_do_install
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org <javascript:;>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1142c12e1bf9250537a4a0f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,<div><br></div><div>Can you elaborate? What am I missing or unaware=
 of? Happy to keep digging!</div><div><br></div><div>--Tim<br><div><br>On T=
hursday, July 14, 2016, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; On Jul 14, 2016, at 6:49 PM, Tim Orling &lt;<a href=3D"javascript:;" o=
nclick=3D"_e(event, &#39;cvml&#39;, &#39;timothy.t.orling@linux.intel.com&#=
39;)">timothy.t.orling@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Dan McGregor &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &=
#39;cvml&#39;, &#39;dan.mcgregor@usask.ca&#39;)">dan.mcgregor@usask.ca</a>&=
gt;<br>
&gt;<br>
&gt; It&#39;s disabled on cross builds, and it&#39;s needed for gcc 6<br>
&gt;<br>
&gt; (From OE-Core rev: ce1b37e29dc89b67dc698e856007b59faa16c4df)<br>
&gt;<br>
&gt; Signed-off-by: Dan McGregor &lt;<a href=3D"javascript:;" onclick=3D"_e=
(event, &#39;cvml&#39;, &#39;dan.mcgregor@usask.ca&#39;)">dan.mcgregor@usas=
k.ca</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"javascript:;" onclick=3D"=
_e(event, &#39;cvml&#39;, &#39;richard.purdie@linuxfoundation.org&#39;)">ri=
chard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.26.bb" tar=
get=3D"_blank">binutils_2.26.bb</a> | 3 ++-<br>
&gt; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils=
_2.26.bb" target=3D"_blank">binutils_2.26.bb</a> b/meta/recipes-devtools/bi=
nutils/<a href=3D"http://binutils_2.26.bb" target=3D"_blank">binutils_2.26.=
bb</a><br>
&gt; index b70ffbf..e976bad 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.26.b=
b" target=3D"_blank">binutils_2.26.bb</a><br>
&gt; +++ b/meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.26.b=
b" target=3D"_blank">binutils_2.26.bb</a><br>
&gt; @@ -13,7 +13,8 @@ EXTRA_OECONF +=3D &quot;--with-sysroot=3D/ \<br>
&gt; EXTRA_OECONF_class-native =3D &quot;--enable-targets=3Dall \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-64-bit-bfd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-install-libiberty \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-install-libbfd&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-install-libbfd \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-werror=E2=80=9D<br>
<br>
How about other flavors of binutils ?<br>
<br>
&gt;<br>
&gt; do_install_class-native () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Ope=
nembedded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openem=
bedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<br>
</blockquote></div></div>

--001a1142c12e1bf9250537a4a0f5--
