Return-Path: <avery.brian@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE5278289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 16:38:07 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id o88so14152103pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RgN/HOS/nH0i5wKlWJRaK7rU+iFWO7fiYWvuCZ0gfnQ=;
	b=PihDGH3uL8DAriXmWULhujJFZ6QuPEEkWLqW6QFiym/SpRUqSHvDQpyI+GxXUG56ls
	RXS7UCaZ5VN21W+xx+XifE0MzebRj6cdQJYGS1npb+FPGnzI6jegabyLfSwPO8v5dxeF
	7H2TnUxUX78acrcLPeQtuMVJZkfK6ToE0cveQiKfSbLuNf8lM1CsutFfxvJ+Rg8rdJPx
	qGmsSt5ZgDKxmZ4nVUL0WB+GDXJ5O2XRBHLhym+8Ug/YoHPP1jhJk4v+sq3OavBZg+XM
	2EilkZ+3d3eEZXfGz6dBCAw14tlcqokJfPQoHrhop0zUj5YWOGWsEWGsiH1mTrMmqN6M
	vErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RgN/HOS/nH0i5wKlWJRaK7rU+iFWO7fiYWvuCZ0gfnQ=;
	b=U3Z+N0Bv54iVnkCvduuWdvEQU8uGcy0Efz8B1LtD+P1ui7+yDKQuKfg+0TrN/+Db09
	COr1bp+z6JSmvgYkr8bXUmcqeHc6SNKVOK9uZwqeH5BK/VtdUejnnptrTbVmFg5cabFY
	SfNGE94Za0SzuTJH57hG/zlZAtt71EUIf5QBGy2C5ArfHHq9e49ggYuAgjXs+Hx9zc1T
	0my363AKPOma2W1/dPx8bTc75ziXSq6mnOKB7hIJNOZ/hbebiSXteiGvY5tKVihQCHrA
	sDoJJrW3Q4T5kBH44JJjX+imi7R+yUr2GFJ6L+eCMOrrxN2zXD7Jf9NHhhRSDygg0X/X
	Sp6g==
X-Gm-Message-State: AIVw112QUK5ojvv296ncDeU1izHnRJCnPF8A3OiZrVRtygaw++vTElh1
	rZYQ183Dp8unlHttvuNH/BpGek3UOg==
X-Received: by 10.84.168.195 with SMTP id f61mr5096026plb.234.1500568688346;
	Thu, 20 Jul 2017 09:38:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.68 with HTTP; Thu, 20 Jul 2017 09:38:07 -0700 (PDT)
In-Reply-To: <CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
	<CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Thu, 20 Jul 2017 09:38:07 -0700
Message-ID: <CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 16:38:07 -0000
Content-Type: multipart/alternative; boundary="94eb2c116b62a14e5b0554c25f9c"

--94eb2c116b62a14e5b0554c25f9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 6:35 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jul 19, 2017 at 7:26 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > On Wed, Jul 19, 2017 at 2:57 PM, Bystricky, Juro
> > <juro.bystricky@intel.com> wrote:
> >>> precisely, the problem is that some host compiler may silently ignore
> >>> unknown warnings and some host may not be using gcc as default system
> >>> compiler at all e.g. mageia distro and may be more in future.
> >>
> >> Yes, it does not nor it attempts to solve all toolchain issues.
> >> The expectation is that a compiler will choke on an unrecognized optio=
n.
> >> For example, gcc will do the following:
> >>
> >> $ gcc -Wnot-cross-compiler hello_world.c
> >> gcc: error: unrecognized command line option =E2=80=98-Wnot-cross-comp=
iler=E2=80=99
> >>
> >> As for non-gcc compilers: yes, they may silently ignore unrecognized
> options
> >> (which IMHO is just wrong). In that case the new options does not work
> as intended,
> >> but it does no harm either.
> >> Anyway, the intended use was to add something like this a .conf file:
> >>
> >> TARGET_CC_ARCH_append_class-target =3D " -Wnot-cross-compiler
> -Werror=3Dnot-cross-compiler"
> >
> > Personally, I think we already try to pass too much via CC or the
> > compiler command line (e.g. -fdebug-prefix-map=3DXXX). Has there ever
> > been any thought of OE providing a toolchain wrapper, which could pass
> > these kinds of housekeeping options to the underlying toolchain while
> > keeping build logs clean and without the worry that CC, CFLAGS, etc
> > get ignored or clobbered by a custom Makefile somewhere?
>
> we could do it by providing customized spec file
> but this will not be good for external toolchains
> --
>

I understand that it will only addresses the case where your target =3D hos=
t,
though as Ross points out this can apply to more than x86.

I also get that it will not help if the host compiler just eats the warning
rather than erroring.

However, there are actual cases where this is an issue and I only noticed
it because I happened to be building on an old gcc version that choked on
some new flags.

I think a customized spec file could be an even better approach, but in the
meantime, it seems like this would help and could be added to distributions
that want it (in an overridable way, so you can turn them off in config if
you are using an external toolchain).

Also, it doesn't cause harm unless the distro or recipe decides to turn it
on. Very Hippocratic compliant!

-b
an intel employee

trivia - turns out "first, do no harm" isn't actually in the Hippocratic
Oath, my mistake! https://en.wikipedia.org/wiki/Hippocratic_Oath

--94eb2c116b62a14e5b0554c25f9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 19, 2017 at 6:35 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span c=
lass=3D"gmail-">On Wed, Jul 19, 2017 at 7:26 PM, Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt; On Wed, Jul 19, 2017 at 2:57 PM, Bystricky, Juro<br>
&gt; &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.bystricky@intel.c=
om</a>&gt; wrote:<br>
&gt;&gt;&gt; precisely, the problem is that some host compiler may silently=
 ignore<br>
&gt;&gt;&gt; unknown warnings and some host may not be using gcc as default=
 system<br>
&gt;&gt;&gt; compiler at all e.g. mageia distro and may be more in future.<=
br>
&gt;&gt;<br>
&gt;&gt; Yes, it does not nor it attempts to solve all toolchain issues.<br=
>
&gt;&gt; The expectation is that a compiler will choke on an unrecognized o=
ption.<br>
&gt;&gt; For example, gcc will do the following:<br>
&gt;&gt;<br>
&gt;&gt; $ gcc -Wnot-cross-compiler hello_world.c<br>
&gt;&gt; gcc: error: unrecognized command line option =E2=80=98-Wnot-cross-=
compiler=E2=80=99<br>
&gt;&gt;<br>
&gt;&gt; As for non-gcc compilers: yes, they may silently ignore unrecogniz=
ed options<br>
&gt;&gt; (which IMHO is just wrong). In that case the new options does not =
work as intended,<br>
&gt;&gt; but it does no harm either.<br>
&gt;&gt; Anyway, the intended use was to add something like this a .conf fi=
le:<br>
&gt;&gt;<br>
&gt;&gt; TARGET_CC_ARCH_append_class-<wbr>target =3D &quot; -Wnot-cross-com=
piler -Werror=3Dnot-cross-compiler&quot;<br>
&gt;<br>
&gt; Personally, I think we already try to pass too much via CC or the<br>
&gt; compiler command line (e.g. -fdebug-prefix-map=3DXXX). Has there ever<=
br>
&gt; been any thought of OE providing a toolchain wrapper, which could pass=
<br>
&gt; these kinds of housekeeping options to the underlying toolchain while<=
br>
&gt; keeping build logs clean and without the worry that CC, CFLAGS, etc<br=
>
&gt; get ignored or clobbered by a custom Makefile somewhere?<br>
<br>
</span>we could do it by providing customized spec file<br>
but this will not be good for external toolchains<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">--<br></div></div></blo=
ckquote><div><br></div><div>I understand that it will only addresses the ca=
se where your target =3D host, though as Ross points out this can apply to =
more than x86.</div><div><br></div><div>I also get that it will not help if=
 the host compiler just eats the warning rather than erroring.=C2=A0</div><=
div><br></div><div>However, there are actual cases where this is an issue a=
nd I only noticed it because I happened to be building on an old gcc versio=
n that choked on some new flags.</div><div><br></div><div>I think a customi=
zed spec file could be an even better approach, but in the meantime, it see=
ms like this would help and could be added to distributions that want it (i=
n an overridable way, so you can turn them off in config if you are using a=
n external toolchain).=C2=A0</div><div><br></div><div>Also, it doesn&#39;t =
cause harm unless the distro or recipe decides to turn it on. Very Hippocra=
tic compliant!</div><div><br></div><div>-b</div><div>an intel employee</div=
><div><br></div><div>trivia - turns out &quot;first, do no harm&quot; isn&#=
39;t actually in the Hippocratic Oath, my mistake!=C2=A0<a href=3D"https://=
en.wikipedia.org/wiki/Hippocratic_Oath">https://en.wikipedia.org/wiki/Hippo=
cratic_Oath</a></div></div></div></div>

--94eb2c116b62a14e5b0554c25f9c--
