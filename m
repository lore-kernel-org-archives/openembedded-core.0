Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A933960EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:54:58 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id c16so7000367ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N4vd96KfKmlsAbHm28p0c219jc3cUp3fQlf3Uz3sYfI=;
	b=J3zZYrE8muDKoDL5xPb0agrNYZo8HhJz3eApa2EBIOgxhDJ9ihBhSiXUG9LiNxHLTR
	IiV7k/ArwsgQee9ZheotmZw4S3DjeHaP74FeWvDmqEU7tZoxfgtZPTTKCmFL4fLre+6/
	2adTeqjgaCe5Nxde+3UdPiHs060WILCp+RkrC6SzSb0QnGKIkGLtmzWiMijEkbaw8rM1
	rfKAtQdT8eQlz/qhZ5MWopNH2YyXRtlHiHkjClMtrwWhpEJWVsT4g54etaWEFbzb77m2
	hRJwXocq4QHCTVjqi4/ItzaD74GfQ4D4WrqelfSsljgqSVRciKxGL3pHxC5B3xywUSWR
	fOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N4vd96KfKmlsAbHm28p0c219jc3cUp3fQlf3Uz3sYfI=;
	b=nf/ukipU0mHRFDq/h3GFuxMZOBvl2J3cw6GfwJyWiHYL2ijGfp1zdiShNLW0bckfag
	I0veoXfJ2T5a8ZKmVbiqxFVaX/WOH3obpJjulm3VkLqF8lLDdOa/QKxuSgZJ192Tq1Zx
	SmGqqWT8/QLFSvQut+ddccwNjtBIcdmzbLOv3nG2IzdbTRhuJbTRpVmwYsqODTW+ajqD
	i6uk6D2Q53e89fRECrk13j4vm1LknwKRasbcExEvoy1cPKvCXH5zEQUODIVy8rvTnZSq
	MzvX1jWnWxoD4PtORCfQMhMTnBU1KgnRVUi3TlodE+/Uw3q7TC58frFrfVQ4r541bsZM
	gvgg==
X-Gm-Message-State: APjAAAXA0QPWWsPBtX25A1HaQwWFqtxoRK+WB4hkP/Tg1B5bD2VIJd7E
	2gYvodtLE6O76jgKzzfC1CjHF534zIMWffUJj68t977yayI=
X-Google-Smtp-Source: APXvYqwtcvw1NNEOcOxMWcQWmYsDjqyEB9zk6TXv+GaGWTPaZYNDdBdVGILdxTUSC4UXgd+PCZERsZ3quF25y/fpYS4=
X-Received: by 2002:a5d:944b:: with SMTP id x11mr21279181ior.305.1581609299554;
	Thu, 13 Feb 2020 07:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
	<fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
	<CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
	<928575d17e93b117b6f555d674089560161d6c97.camel@linuxfoundation.org>
In-Reply-To: <928575d17e93b117b6f555d674089560161d6c97.camel@linuxfoundation.org>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Thu, 13 Feb 2020 10:54:33 -0500
Message-ID: <CAE=T-s6tXBA66zqe83-sib4m-JSXS++9sQ_m-D3a1KjU+-YcAw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: add virtual supplicant
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
X-List-Received-Date: Thu, 13 Feb 2020 15:54:59 -0000
Content-Type: multipart/alternative; boundary="0000000000007937e8059e771c71"

--0000000000007937e8059e771c71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 10:27 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-02-13 at 10:22 -0500, Maxime Roussin-B=C3=A9langer wrote:
> > On Thu, Feb 13, 2020 at 9:24 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > I know its not easy to understand but we don't support virtual/*
> > > names in the runtime namespace, only the build time one
> > > (PROVIDES/DEPENDS).
> > > Grep for VIRTUAL-RUNTIME to see how we handle this (its ugly I
> > know).
> >
> > Hmm interesting!
> >
> > If I follow correctly that's mean I have to create:
> >
> > VIRTUAL-RUNTIME_wireless-daemon and then people can override it.
>
> Correct.
>
> > If the (R)DEPENDS on a recipe change depending on the wireless daemon
> > that
> > was chosen(i.e. connman), do you handle it with d.getVar and
> > d.setVar("DEPENDS... inside a
> > anonymous python function inside the recipe?
> >
> > The packageconfig would like this ?
> >
> > PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, ${VIRTUAL-
> > RUNTIME_wireless-daemon}, ${VIRTUAL-RUNTIME_wireless-daemon}"
> >
> > Example:
> >
> > if VIRTUAL-RUNTIME_wireless-daemon =3D=3D "iwd":
> >     DEPENDS +=3D "iwd"
> >     EXTRA_OECONF +=3D "--enable-iwd"
> > elif VIRTUAL-RUNTIME_wireless-daemon =3D=3D "wpa-supplicant":
> >     DEPENDS +=3D "wpa-supplicant"
>
> At this point it suggests they're not interchangeable and therefore not
> simple runtime switchable dependencies.
>
> The closest analogy is the "ld-is-gold" DISTRO_FEATURE when you have
> something that isn't compatible like this.

I realize that my example isn't the proper one.. sorry about that! We can
probably
simplify with PACKAGECONFIG.

Maybe the right solution would be to provide two packageconfig?

PACKAGECONFIG[iwd] =3D "--enable-iwd, --disable-wifi, iwd, iwd"
PACKAGECONFIG[wpa-supplicant] =3D "--enable-wifi, --disable-wifi,
wpa-supplicant, wpa-supplicant"

They are mutually exclusive, is this something that can be done through
PACKAGECONFIG?

Maybe we don't deal with the conflicts that can occur if a user activates
both? It would probably
fail at configure time? What is good practice here?

At the same time, it is VERY weird for a system to have iwd and
wpa_supplicant. If I recall correctly,
iwd has an error message with another wireless daemon run concurrently.

I would like to be able to force the user to choose only one... because I
think having both is an error.


Thanks,
Max.

>
> Cheers,
>
> Richard

--0000000000007937e8059e771c71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Feb 13, 2020 at 10:27 AM Richard Purdie &l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linu=
xfoundation.org</a>&gt; wrote:<br>&gt;<br>&gt; On Thu, 2020-02-13 at 10:22 =
-0500, Maxime Roussin-B=C3=A9langer wrote:<br>&gt; &gt; On Thu, Feb 13, 202=
0 at 9:24 AM Richard Purdie &lt;<br>&gt; &gt; <a href=3D"mailto:richard.pur=
die@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br>&gt; &gt; &gt; I know its not easy to understand but we don&#39;t suppor=
t virtual/*<br>&gt; &gt; &gt; names in the runtime namespace, only the buil=
d time one<br>&gt; &gt; &gt; (PROVIDES/DEPENDS).<br>&gt; &gt; &gt; Grep for=
 VIRTUAL-RUNTIME to see how we handle this (its ugly I<br>&gt; &gt; know).<=
br>&gt; &gt;<br>&gt; &gt; Hmm interesting!<br>&gt; &gt;<br>&gt; &gt; If I f=
ollow correctly that&#39;s mean I have to create:<br>&gt; &gt;<br>&gt; &gt;=
 VIRTUAL-RUNTIME_wireless-daemon and then people can override it.<br>&gt;<b=
r>&gt; Correct.<br>&gt;<br>&gt; &gt; If the (R)DEPENDS on a recipe change d=
epending on the wireless daemon<br>&gt; &gt; that<br>&gt; &gt; was chosen(i=
.e. connman), do you handle it with d.getVar and<br>&gt; &gt; d.setVar(&quo=
t;DEPENDS... inside a<br>&gt; &gt; anonymous python function inside the rec=
ipe?<br>&gt; &gt;<br>&gt; &gt; The packageconfig would like this ?<br>&gt; =
&gt;<br>&gt; &gt; PACKAGECONFIG[wifi] =3D &quot;--enable-wifi, --disable-wi=
fi, ${VIRTUAL-<br>&gt; &gt; RUNTIME_wireless-daemon}, ${VIRTUAL-RUNTIME_wir=
eless-daemon}&quot;<br>&gt; &gt;<br>&gt; &gt; Example:<br>&gt; &gt;<br>&gt;=
 &gt; if VIRTUAL-RUNTIME_wireless-daemon =3D=3D &quot;iwd&quot;:<br>&gt; &g=
t; =C2=A0 =C2=A0 DEPENDS +=3D &quot;iwd&quot;<br>&gt; &gt; =C2=A0 =C2=A0 EX=
TRA_OECONF +=3D &quot;--enable-iwd&quot;<br>&gt; &gt; elif VIRTUAL-RUNTIME_=
wireless-daemon =3D=3D &quot;wpa-supplicant&quot;:<br>&gt; &gt; =C2=A0 =C2=
=A0 DEPENDS +=3D &quot;wpa-supplicant&quot;<br>&gt;<br>&gt; At this point i=
t suggests they&#39;re not interchangeable and therefore not<br>&gt; simple=
 runtime switchable dependencies.<br>&gt;<br>&gt; The closest analogy is th=
e &quot;ld-is-gold&quot; DISTRO_FEATURE when you have<br>&gt; something tha=
t isn&#39;t compatible like this.<div><br></div><div>I realize that my exam=
ple isn&#39;t the proper one.. sorry about that! We can probably</div><div>=
simplify with PACKAGECONFIG.</div><div><br></div><div>Maybe the right solut=
ion would be to provide two packageconfig?</div><div><br></div><div>PACKAGE=
CONFIG[iwd] =3D &quot;--enable-iwd, --disable-wifi, iwd, iwd&quot;<br></div=
><div>PACKAGECONFIG[wpa-supplicant] =3D &quot;--enable-wifi, --disable-wifi=
, wpa-supplicant, wpa-supplicant&quot;<br></div><div><br></div><div>They ar=
e mutually exclusive, is this something that can be done through PACKAGECON=
FIG?</div><div><br></div><div>Maybe we don&#39;t deal with the conflicts th=
at can occur if a user activates both? It would probably</div><div>fail at =
configure time? What is good practice here?</div><div><br></div><div>At the=
 same time, it is VERY weird for a system to have iwd and wpa_supplicant. I=
f I recall correctly,</div><div>iwd has an error message with another wirel=
ess daemon run concurrently.</div><div><br></div><div>I would like to be ab=
le to force the user to choose only one... because I think having both is a=
n error.</div><div><br></div><div><br></div><div>Thanks,</div><div>Max.</di=
v><div><br>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; Richard</div></div>

--0000000000007937e8059e771c71--
