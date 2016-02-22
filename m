Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E507873286
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:36:47 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a4so155924554wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 02:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=B0EnZoB6U/bLzUzoq47d/ttrO9CDO1HOmx3RuVVcmoE=;
	b=UofAutMMmJYQSrmTfilch7lPZ+3w/ehuj4uDJMLN0GTmBIO0z9EK/gusdvjbjA8zWe
	cz+nTyaeVFLPgOaG+yJczudIE/ysTeYlbA9WLTfVkQ4y/hMqqemobwVmc27VBzeG6Lje
	aEkQAJYZNqSu+9CG4RgMkggaJaGfZHiavEvxIu704TxFd0y73fnxsOs8jYcJkRQBFDZx
	4jTUHmQDVkG5+fzSEg8I3M5a7mE1pjei9wNbjAke3pN1EmFu5vWSilS58OzE6zLVuJbS
	U+kBHVW3yvPnamMKQE8Kk719QJFBzDzdufMymgrW9lE/viAeN+wH4pO3Qr/0RSP10ooU
	Btww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=B0EnZoB6U/bLzUzoq47d/ttrO9CDO1HOmx3RuVVcmoE=;
	b=XywAOYEDg2+int7I47lj89lyeqiiJiGpenVPBBwxV83yPPZ703zQ+Poa/Nz98zpetz
	DQ1+EjuCWpy0hQkPprLFUCjP6bZI0Bd5P2bAMRS5rkjRxrnyb5r4gWpLhpOi0+gmVmXA
	6gNgYES3OR5xCDSOa7etB96IHqfziSzpCIaqyHhmv+bm7eLo7qoQiwOpfEeNInD/dj0Q
	dxs7LdIfEkP157Pwvx77Q6pETvcvuP4L8oNu7boeB/Rjpv0itV3JSmagn7vOXRr906bW
	91q4ck9M5BCXm0RA3xAxtUokfFoZma03tU0J8KDPs/V8pdti62pTi7aZh04w8gNGX/sK
	cB3w==
X-Gm-Message-State: AG10YOQ0swDAUjHfqMQqUhrl5dR0Q4bP06ihJM92+25dXMMaOeVauAdQCFwTJAOUEUjxZJrnSWKs+OXEAeUg/g==
MIME-Version: 1.0
X-Received: by 10.194.114.133 with SMTP id jg5mr21964575wjb.99.1456137407985; 
	Mon, 22 Feb 2016 02:36:47 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Mon, 22 Feb 2016 02:36:47 -0800 (PST)
In-Reply-To: <CAMKF1sp+xLsACBHv9NPYhOp8MEo3HcYT6Qw6ey5KEGH8b8-zOA@mail.gmail.com>
References: <1455460128.16142.400.camel@linuxfoundation.org>
	<CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
	<CALbNGRTcuFWpTEpwu1V=m6U2cz+3RiQNFmyXtaV1sg8wxx91Kg@mail.gmail.com>
	<CAMKF1sp+xLsACBHv9NPYhOp8MEo3HcYT6Qw6ey5KEGH8b8-zOA@mail.gmail.com>
Date: Mon, 22 Feb 2016 11:36:47 +0100
Message-ID: <CA+chaQciVEV+Q0vu8oopvqxO98dNKJUhsZjwX0qtAqFNEOCaNg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Mon, 22 Feb 2016 10:36:48 -0000
Content-Type: multipart/alternative; boundary=001a1130d220f27ceb052c596828

--001a1130d220f27ceb052c596828
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

meta-oe is still broken a lot from recent changes in QA checks,
EXTRA_OEMAKE, FILES_*.

Including that .inc is easy enough for distros which care (and can fix
issues caused by it in recipes they use)

I would prefer to make it default later (like in next release) - even when
I would very much like to shorten the build time and sstate sizes of
bitbake world on jenkins.

Regards,

On Mon, Feb 22, 2016 at 3:10 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Feb 18, 2016 at 2:05 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Mon, Feb 15, 2016 at 2:44 PM, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> >> On Sun, Feb 14, 2016 at 12:28 PM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>> Maintaining this list in a common location is more desireable than
> >>> everyone doing it themselves. Poky will switch to using this, OE-Core
> >>> will need to discuss that as its default.
> >>
> >> I support this being enabled by default on OE-Core as well.
> >>
> > Does 'support' mean you are taking care for recipes this is will break
> > throughout our layers?
>
> The ones that fall into distros I care, I will help, however such changes
> require many hands.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1130d220f27ceb052c596828
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-oe is still broken a lot from recent changes in QA ch=
ecks, EXTRA_OEMAKE, FILES_*.<div><br></div><div>Including that .inc is easy=
 enough for distros which care (and can fix issues caused by it in recipes =
they use)</div><div><br></div><div>I would prefer to make it default later =
(like in next release) - even when I would very much like to shorten the bu=
ild time and sstate sizes of bitbake world on jenkins.</div><div><br></div>=
<div>Regards,</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Mon, Feb 22, 2016 at 3:10 AM, Khem Raj <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Th=
u, Feb 18, 2016 at 2:05 AM, Andreas M=C3=BCller<br>
&lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemai=
l.com</a>&gt; wrote:<br>
&gt; On Mon, Feb 15, 2016 at 2:44 PM, Otavio Salvador<br>
&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvado=
r@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt; On Sun, Feb 14, 2016 at 12:28 PM, Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;&gt; Maintaining this list in a common location is more desireable =
than<br>
&gt;&gt;&gt; everyone doing it themselves. Poky will switch to using this, =
OE-Core<br>
&gt;&gt;&gt; will need to discuss that as its default.<br>
&gt;&gt;<br>
&gt;&gt; I support this being enabled by default on OE-Core as well.<br>
&gt;&gt;<br>
&gt; Does &#39;support&#39; mean you are taking care for recipes this is wi=
ll break<br>
&gt; throughout our layers?<br>
<br>
</span>The ones that fall into distros I care, I will help, however such ch=
anges<br>
require many hands.<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a1130d220f27ceb052c596828--
