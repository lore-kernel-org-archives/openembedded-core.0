Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DEC6E60236
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 09:51:17 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id s12-v6so1341346wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 02:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f+RIPHfQDd4y3ZmuTrS4UMffLz79t4tK6q7oN8skSsY=;
	b=U59eNsu5xKxbMKYWSdv0COkuWAnwuCdLMShg3Qqnr88moAeDGrBIO0yp34QeXCKvbk
	x+9dS7tJS8Pc0HuOfhRJgGTTZrljfc7TwlGhv8XVq3k2TjNGEAm5VMuNLrMERjqwMf1M
	xFkt5u237f7OVctyGpK+DZoW6ybfG7iWxgtTIDewpCUXrmRFB9b65lD44h3rhgkSGIpr
	pzoo/qgDmgY4kVUIqMMfRhVt2XIHfIVI5Im2HAAJ5HSk8mlYlR4AWlB2Kmp0S0pCW//t
	KN5pGSzVwJbaM9uGfn/toV4IO4iiVPuMvz7Oh/N9oS5laRJbMdgsdtFjf354Z0c9WRQO
	csUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f+RIPHfQDd4y3ZmuTrS4UMffLz79t4tK6q7oN8skSsY=;
	b=GSkockxXY53zaNOZ99lpbbfCwgvX4x6wMxLPPW3WA46GaTU9RNM1emctQwqeklUSnD
	zg1dLf/AcEsw2ZIlvh+9bdixKJh/ytRQ//x1DOuhTG8ruIf6f/i1rqnNkbyihUyRTZlF
	z0axIFgFXfmxH97uTSpLAjBgwG1XapNG4/hKzf3zsfWjP5NxFEbbKgbOiro461sr9J53
	ss007ohbyytxbEhgog0Si0q9+uCraQfi1aMegMHdDgsfEaeInBU/8HmqpB7ymg379G33
	jCFYJ1cGNYUR7NRcPh+fNv75HA1pGna12sG8aT5ncY27DEiq19TtU6q0lb230dmpMvAF
	gm3A==
X-Gm-Message-State: AOUpUlEoHtFbSk3TqIFjk0vZXjAuQIsX88jd3eanjzWF0Rxa90qYAQuo
	S20RQXcUej5X3fIr3b5PUFR8n6REViW4zu+qw5E=
X-Google-Smtp-Source: AAOMgpdK93YGe9zrmVMUNChpwMqVWMk8JNmkPFqUIJ6ccQhw62V/zBlXdASRDvKkyGCbs7T4+cdDKe+DJ+Sm2TGg5sM=
X-Received: by 2002:a1c:8f0e:: with SMTP id
	r14-v6mr1131948wmd.79.1532598678475; 
	Thu, 26 Jul 2018 02:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180725164107.8891-1-kai.kang@windriver.com>
	<30c2f9cc5e10db824fb7df312bee88e17814221c.camel@linuxfoundation.org>
	<0ca7463e-1966-0956-f21d-d23058a7a4ff@windriver.com>
	<de82bfbc618d5bd3414f0c6942779bab2a866524.camel@linuxfoundation.org>
In-Reply-To: <de82bfbc618d5bd3414f0c6942779bab2a866524.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jul 2018 11:51:08 +0200
Message-ID: <CA+chaQcjgPROzYaSSb4m0snEGJ07Q2UcFOut31nYx__gRRFk8w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/2] Install rdependent of allarch package with same multilib variant of image
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
X-List-Received-Date: Thu, 26 Jul 2018 09:51:18 -0000
Content-Type: multipart/alternative; boundary="000000000000d058f30571e3ef4d"

--000000000000d058f30571e3ef4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: the later is what I did in morty based build to get multilib working
with allarch.

It was actually combination of both, in some cases the dependency was
already pulled by something else and it was relatively safe to drop from
allarch recipe (e.g. I did that for ca-certificates), in some cases I've
just dropped allarch.

I also don't like building things twice, we have allarch web apps which
have runtime dependency on web engine (which includes chromium build) and I
really don't want to build chromium twice just to satisfy allarch
dependencies, when we really want to have just one chromium in the rootfs
in the end. So it's not only the multilib toochain and small things like
openssl, but it can get huge. Building small allarch web app multiple times
(per TUNE_PKGARCH) on the other hand is relatively small price to pay.

On Thu, Jul 26, 2018 at 11:07 AM <richard.purdie@linuxfoundation.org> wrote=
:

> On Thu, 2018-07-26 at 14:53 +0800, Kang Kai wrote:
> > On 2018=E5=B9=B407=E6=9C=8826=E6=97=A5 06:47, richard.purdie@linuxfound=
ation.org wrote:
> > > There is a bigger problem though since the allarch recipe signature
> > > filtering doesn't change what bitbake will actually build, only how
> > > its
> > > represented in sstate and the circumstances under which it would
> > > rebuild it. If ca-certificates DEPENDS on openssl, it will build
> > > openssl whether you're targeting core-image-sato or lib32-core-
> > > image-
> > > sato. This potentially means you can end up in a situation where it
> > > wouldn't build lib32-openssl if nothing else in lib32-core-image-
> > > sato
> > > depended upon it more directly.
> >
> > That's why extend rdepends of allarch package with all multilib
> > variant.
> > In bitbake inner environment, make ca-certificates depends on
> > openssl, lib32-openssl and even libn32-openssl for qemumips64. It may
> > cost a little more build time(I didn't test yet), but the dependency
> > relationship is fixed and make sure that all multilib version
> > of openssl exist in 'oe-core-repo' which is used for do_rootfs.
> >
> > When build ca-certificates, both openssl and lib32-openssl will be
> > built. And when write package of ca-certificates, remove openssl and
> > lib32-openssl from RDEPENDS and keep noarch-openssl.
> > And make both openssl and lib32-openssl provides noarch-openssl. Then
> > some tweak according image multilib type could be done at then end
> > of do_rootfs.
>
> Requiring that all variants of openssl build in order to build ca-
> certificates will have huge build time impact as it will need to build
> both multilib toolchains.
>
> At that point we'd probably be better either building allarch recipes
> twice (which I don't like), or, banning non-allarch dependencies from
> allarch recipes. If a recipe needs a non-allarch dependency we'd make
> it non-allarch. We may just have to accept the latter...
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d058f30571e3ef4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: the later is what I did in morty based build to get =
multilib working with allarch.<div><br></div><div>It was actually combinati=
on of both, in some cases the dependency was already pulled by something el=
se and it was relatively safe to drop from allarch recipe (e.g. I did that =
for ca-certificates), in some cases I&#39;ve just dropped allarch.</div><di=
v><br></div><div>I also don&#39;t like building things twice, we have allar=
ch web apps which have runtime dependency on web engine (which includes chr=
omium build) and I really don&#39;t want to build chromium twice just to sa=
tisfy allarch dependencies, when we really want to have just one chromium i=
n the rootfs in the end. So it&#39;s not only the multilib toochain and sma=
ll things like openssl, but it can get huge. Building small allarch web app=
 multiple times (per TUNE_PKGARCH) on the other hand is relatively small pr=
ice to pay.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On T=
hu, Jul 26, 2018 at 11:07 AM &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Thu, 2018-07-26 at 14:53 +0800, Kang Kai wrot=
e:<br>
&gt; On 2018=E5=B9=B407=E6=9C=8826=E6=97=A5 06:47, <a href=3D"mailto:richar=
d.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundat=
ion.org</a> wrote:<br>
&gt; &gt; There is a bigger problem though since the allarch recipe signatu=
re<br>
&gt; &gt; filtering doesn&#39;t change what bitbake will actually build, on=
ly how<br>
&gt; &gt; its<br>
&gt; &gt; represented in sstate and the circumstances under which it would<=
br>
&gt; &gt; rebuild it. If ca-certificates DEPENDS on openssl, it will build<=
br>
&gt; &gt; openssl whether you&#39;re targeting core-image-sato or lib32-cor=
e-<br>
&gt; &gt; image-<br>
&gt; &gt; sato. This potentially means you can end up in a situation where =
it<br>
&gt; &gt; wouldn&#39;t build lib32-openssl if nothing else in lib32-core-im=
age-<br>
&gt; &gt; sato<br>
&gt; &gt; depended upon it more directly.<br>
&gt; <br>
&gt; That&#39;s why extend rdepends of allarch package with all multilib<br=
>
&gt; variant. <br>
&gt; In bitbake inner environment, make ca-certificates depends on<br>
&gt; openssl, lib32-openssl and even libn32-openssl for qemumips64. It may<=
br>
&gt; cost a little more build time(I didn&#39;t test yet), but the dependen=
cy<br>
&gt; relationship is fixed and make sure that all multilib version<br>
&gt; of openssl exist in &#39;oe-core-repo&#39; which is used for do_rootfs=
.<br>
&gt; <br>
&gt; When build ca-certificates, both openssl and lib32-openssl will be <br=
>
&gt; built. And when write package of ca-certificates, remove openssl and<b=
r>
&gt; lib32-openssl from RDEPENDS and keep noarch-openssl. <br>
&gt; And make both openssl and lib32-openssl provides noarch-openssl. Then<=
br>
&gt; some tweak according image multilib type could be done at then end<br>
&gt; of do_rootfs.<br>
<br>
Requiring that all variants of openssl build in order to build ca-<br>
certificates will have huge build time impact as it will need to build<br>
both multilib toolchains.<br>
<br>
At that point we&#39;d probably be better either building allarch recipes<b=
r>
twice (which I don&#39;t like), or, banning non-allarch dependencies from<b=
r>
allarch recipes. If a recipe needs a non-allarch dependency we&#39;d make<b=
r>
it non-allarch. We may just have to accept the latter...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d058f30571e3ef4d--
