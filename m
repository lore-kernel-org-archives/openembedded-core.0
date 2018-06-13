Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id F2DD6745B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:39:22 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id 128-v6so1026138vkf.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sGwcshG7gZ3tKDiiSyakp4OmMZ7/pU2FUMbbj0RqVkc=;
	b=cjpgCguz380gClOfSJb37OYDVR2falGO/2GSj1qbfKnWBbqv3iNKTC67Cg70eptrbK
	euynAVXrIhId5g1LDH/KAFpvWWJjvacky6Tw8WVXpU+XtNsdHgWqU8kxD29MkmisQjHX
	896jYvpo5hSJUV8xsUCHEFIdkkBekE9DyVPOoiuLJFfKAkGl2ra/Q7gIiB3YbKGuZbfb
	G2NpOses7u83Q+JG3FMoKZ9/C7yhqE8DfO3ASLbB2itakef73OVi4F/oafkclKDLRpga
	nTw2T4IJUnpiPzmhUt8+mLTXf6vByTTWgL9Ox3uxh5rXloEkoO/bIiZXErrpDciaBhgx
	PxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sGwcshG7gZ3tKDiiSyakp4OmMZ7/pU2FUMbbj0RqVkc=;
	b=Cgb7t1trNbDkG55o/5FjGhD1vFKd60uYKuvTvrVNBIIzkDzH10B/TV5MQXdOmu7T/M
	0sGYH0e35jioiMBPiOpOeJpF+i4B/Q+Ft55k33YQgs9kNjwCqtGNuJ+4nxv4oGQ7ygw0
	vVzkOvv73KCm94E5LCFWM4bYDLXywPSqbKWNQAqS9JGMd2suE2uCFy6Qmd0BuS2kCNnm
	Lx4R249W+2NPzot3WS0sprZQmmv+SJ0+rWOji1jRhlh5A99N8tb6JRzXBlYcTFzdtjyS
	3AGhsFnBDPXWncIe3UoPYUS0uoTe60fuTakvgeo/bOQ+e1FAqjp+Iubfw1a9ImRN69ga
	awMQ==
X-Gm-Message-State: APt69E3MFWOLlTejGRBQpxVqe6K+xb90qL0Vsd3VPUIa6nyw940n3nD9
	4PjiHNwE2rm0tT8sdynvfLpvZFl6mFhnuJVQBw4=
X-Google-Smtp-Source: ADUXVKJGp+kX7Ckm7A2j4ERUql7jqICOzL8G7UZHiM5xzJ2tL4YYV1xW1NvhYKyvENW3ehKHWTS4/e5+WrxaiQzP0Is=
X-Received: by 2002:a1f:4a04:: with SMTP id x4-v6mr2395303vka.88.1528879163726;
	Wed, 13 Jun 2018 01:39:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:4b48:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 01:39:23
	-0700 (PDT)
In-Reply-To: <CAJ86T=XckYkuaAgtMbX-Epkdi8J8tmv3VeyTan10HuvM0DG_yw@mail.gmail.com>
References: <1528716867-20270-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=X_BFLzGB4PDKSOJR3Boiv+gQvTN-3D+d+tk=Otw7iwew@mail.gmail.com>
	<CALatG=4B7RYeuxm3QovKGDPjig6=J=kXufomJ=c0uczetU3r0w@mail.gmail.com>
	<CAJ86T=XckYkuaAgtMbX-Epkdi8J8tmv3VeyTan10HuvM0DG_yw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 13 Jun 2018 10:39:23 +0200
Message-ID: <CALatG=60bt8EHpUt1MdecHnfZfOFAekEkjVtWVOsYjhRbY4oXw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Wed, 13 Jun 2018 08:39:23 -0000
Content-Type: multipart/alternative; boundary="000000000000755eff056e81eb24"

--000000000000755eff056e81eb24
Content-Type: text/plain; charset="UTF-8"

Yes, that is true, but then I will need have a mc-default override set in
local.conf any way, since I need distinguish the build for all
multiconfigs, that makes me think it'd better to have a single
mc-${BB_CURRENT_MC} set in OVERRIDES.

//Ming Liu

2018-06-12 19:49 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Tue, Jun 12, 2018 at 4:43 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> > Hi, Andre:
> > The reason for needing this multiconfig to be in OVERRIDES, for me, is
> the
> > scenario that I have one recipe but some variables/tasks in it are
> different
> > for multiconfig, for instance:
> >
> > do_install-mc-default () {}
> >
> > do_install-mc-foo() {}
> >
> > and I do not want split them into several almost same recipes with only
> one
> > task different.
>
> Yes, that's clear. But the question is whether you can make the
> over-rides you need self contained within the multiconfig config file?
>
> e.g. to enable an over-ride when you build with multiconfig foo, add:
>
>   OVERRIDES .= ":mc-foo"
>
> to foo.conf
>
> If it works, then it gives you more flexibility - you can pick your
> own over-ride naming, define multiple over-rides per multiconfig, etc.
>
> > //Ming Liu
> >
> > 2018-06-12 1:15 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> >>
> >> On Mon, Jun 11, 2018 at 4:34 AM,  <liu.ming50@gmail.com> wrote:
> >> > From: Ming Liu <liu.ming50@gmail.com>
> >> >
> >> > This is useful when the users want different variables/tasks when
> using
> >> > multiconfig.
> >>
> >> Isn't the idea of multiconfig to select between configurations which
> >> already fully define all necessary over-rides?
> >>
> >> If a particular multiconfig build needs a custom over-ride then the
> >> multiconfig can append to OVERRIDES (or MACHINEOVERRIDES etc, as
> >> appropriate) directly.
> >>
> >> ie to avoid confusion isn't it good if building with a multiconfig
> >> enabled is always equivalent to building with the contents of the
> >> multiconfig file copied directly in local.conf?
> >>
> >> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> >> > ---
> >> >  meta/conf/bitbake.conf | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> > index 3b2ef9f..0c803d5 100644
> >> > --- a/meta/conf/bitbake.conf
> >> > +++ b/meta/conf/bitbake.conf
> >> > @@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
> >> >  # And finally '<foo>_forcevariable' overrides any standard variable,
> >> > with the highest priority.
> >> >  # This works for functions as well, they are really just variables.
> >> >  #
> >> > -OVERRIDES =
> >> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${
> MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:
> forcevariable"
> >> > +OVERRIDES =
> >> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${
> MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:
> mc-${BB_CURRENT_MC}:forcevariable"
> >> >  LIBCOVERRIDE ?= ""
> >> >  CLASSOVERRIDE ?= "class-target"
> >> >  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> >> > --
> >> > 2.7.4
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>

--000000000000755eff056e81eb24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that is true, but then I will need have a mc-default =
override set in local.conf any way, since I need distinguish the build for =
all multiconfigs, that makes me think it&#39;d better to have a single mc-$=
{BB_CURRENT_MC} set in OVERRIDES.<div><br></div><div>//Ming Liu=C2=A0</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-06-12 =
19:49 GMT+02:00 Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armcc=
urdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</span>:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">On Tue, Jun 12, 2018 at 4:43 =
AM, Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.c=
om</a>&gt; wrote:<br>
&gt; Hi, Andre:<br>
&gt; The reason for needing this multiconfig to be in OVERRIDES, for me, is=
 the<br>
&gt; scenario that I have one recipe but some variables/tasks in it are dif=
ferent<br>
&gt; for multiconfig, for instance:<br>
&gt;<br>
&gt; do_install-mc-default () {}<br>
&gt;<br>
&gt; do_install-mc-foo() {}<br>
&gt;<br>
&gt; and I do not want split them into several almost same recipes with onl=
y one<br>
&gt; task different.<br>
<br>
</span>Yes, that&#39;s clear. But the question is whether you can make the<=
br>
over-rides you need self contained within the multiconfig config file?<br>
<br>
e.g. to enable an over-ride when you build with multiconfig foo, add:<br>
<br>
=C2=A0 OVERRIDES .=3D &quot;:mc-foo&quot;<br>
<br>
to foo.conf<br>
<br>
If it works, then it gives you more flexibility - you can pick your<br>
own over-ride naming, define multiple over-rides per multiconfig, etc.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; //Ming Liu<br>
&gt;<br>
&gt; 2018-06-12 1:15 GMT+02:00 Andre McCurdy &lt;<a href=3D"mailto:armccurd=
y@gmail.com">armccurdy@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jun 11, 2018 at 4:34 AM,=C2=A0 &lt;<a href=3D"mailto:liu.m=
ing50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is useful when the users want different variables/tasks =
when using<br>
&gt;&gt; &gt; multiconfig.<br>
&gt;&gt;<br>
&gt;&gt; Isn&#39;t the idea of multiconfig to select between configurations=
 which<br>
&gt;&gt; already fully define all necessary over-rides?<br>
&gt;&gt;<br>
&gt;&gt; If a particular multiconfig build needs a custom over-ride then th=
e<br>
&gt;&gt; multiconfig can append to OVERRIDES (or MACHINEOVERRIDES etc, as<b=
r>
&gt;&gt; appropriate) directly.<br>
&gt;&gt;<br>
&gt;&gt; ie to avoid confusion isn&#39;t it good if building with a multico=
nfig<br>
&gt;&gt; enabled is always equivalent to building with the contents of the<=
br>
&gt;&gt; multiconfig file copied directly in local.conf?<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmai=
l.com">liu.ming50@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<=
br>
&gt;&gt; &gt; index 3b2ef9f..0c803d5 100644<br>
&gt;&gt; &gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; &gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; &gt; @@ -731,7 +731,7 @@ DISTRO_NAME ??=3D &quot;OpenEmbedded&quot=
;<br>
&gt;&gt; &gt;=C2=A0 # And finally &#39;&lt;foo&gt;_forcevariable&#39; overr=
ides any standard variable,<br>
&gt;&gt; &gt; with the highest priority.<br>
&gt;&gt; &gt;=C2=A0 # This works for functions as well, they are really jus=
t variables.<br>
&gt;&gt; &gt;=C2=A0 #<br>
&gt;&gt; &gt; -OVERRIDES =3D<br>
&gt;&gt; &gt; &quot;${TARGET_OS}:${TRANSLATED_<wbr>TARGET_ARCH}:pn-${PN}:${=
<wbr>MACHINEOVERRIDES}:${<wbr>DISTROOVERRIDES}:${<wbr>CLASSOVERRIDE}${LIBCO=
VERRIDE}:<wbr>forcevariable&quot;<br>
&gt;&gt; &gt; +OVERRIDES =3D<br>
&gt;&gt; &gt; &quot;${TARGET_OS}:${TRANSLATED_<wbr>TARGET_ARCH}:pn-${PN}:${=
<wbr>MACHINEOVERRIDES}:${<wbr>DISTROOVERRIDES}:${<wbr>CLASSOVERRIDE}${LIBCO=
VERRIDE}:<wbr>mc-${BB_CURRENT_MC}:<wbr>forcevariable&quot;<br>
&gt;&gt; &gt;=C2=A0 LIBCOVERRIDE ?=3D &quot;&quot;<br>
&gt;&gt; &gt;=C2=A0 CLASSOVERRIDE ?=3D &quot;class-target&quot;<br>
&gt;&gt; &gt;=C2=A0 DISTROOVERRIDES ?=3D &quot;${@d.getVar(&#39;DISTRO&#39;=
) or &#39;&#39;}&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.7.4<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--000000000000755eff056e81eb24--
