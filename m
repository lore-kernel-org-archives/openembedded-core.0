Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1T2TlV-0008TZ-Ff
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:07:33 +0200
Received: by yhjj56 with SMTP id j56so4773483yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vFG1VFwnflNEiY6rW3LsC/4koDFImbWaM+XnmQ2aDe4=;
	b=B5w85xX6oyDm2U9EOawyQL0egX5AbFkaH+Sr5Xhv/x9cI7QpFP1WA4B6KgJdVo5nWL
	0aNwywGC2vEYPGiuPlH1ND6iQx8VgwLNBGnBzm/gTCBk/p3KYKA83NCWtJ8ES+rogxGj
	kH0hy7Et1fvnUl0QV9MPQEWG33Scw6Bphz7r0kDXoAqmJF8JJqy/EXdScUOu3i2IABIW
	HcNJuSrYT2MOritBUfRTES/gVocsRXP9udHr4E8fCtvcuI32YQgpxo0rHz3+ATb1a2ju
	MgG8mcyB7NoOVbCuUMtQzjdFHcoppTaW7ZSMLKpf970qt8PgVkx8z0n/4/Uod29AFQq5
	ADFA==
MIME-Version: 1.0
Received: by 10.50.160.202 with SMTP id xm10mr3281488igb.10.1345236933876;
	Fri, 17 Aug 2012 13:55:33 -0700 (PDT)
Received: by 10.64.41.98 with HTTP; Fri, 17 Aug 2012 13:55:33 -0700 (PDT)
In-Reply-To: <1345208124.2673.2.camel@phil-desktop>
References: <CAOd_LFz6abBqUcMvOVBudGF_ec_ezs_=y5e3qKyC5c0Js0J=7A@mail.gmail.com>
	<1345208124.2673.2.camel@phil-desktop>
Date: Fri, 17 Aug 2012 22:55:33 +0200
Message-ID: <CAAQYJAsSZUOdZQ3N=8joGbBkJS=aVv1vCN2QF+YKDPUZDXY=kg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DEPEND on an image recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 21:07:33 -0000
Content-Type: multipart/alternative; boundary=14dae9340eb7951c8204c77c6108

--14dae9340eb7951c8204c77c6108
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 2:55 PM, Phil Blundell <philb@gnu.org> wrote:

> On Fri, 2012-08-17 at 08:51 -0400, Cliff Brake wrote:
> > I would like to add a DEPEND to a kernel recipe that causes an
> > initramfs image to be built every time before the kernel is built.  It
> > seems that a DEPEND on the rootfs recipe triggers the rootfs build,
> > however it appears that the kernel recipe does not wait for the image
> > recipe to finish before it builds.  What is the best way to accomplish
> > this?
>
> do_compile[depends] += "ramfs-image:do_rootfs"
>
> p.
>
>
> Yes, that code is as well in kernel.bbclass so you can just add

INITRAMFS_IMAGE = "foo"

to your kernel recipe.

Andrea



>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340eb7951c8204c77c6108
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 17, 2012 at 2:55 PM, Phil Blundell <=
span dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org" target=3D"_blank">phi=
lb@gnu.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex">
<div class=3D"im">On Fri, 2012-08-17 at 08:51 -0400, Cliff Brake wrote:<br>
&gt; I would like to add a DEPEND to a kernel recipe that causes an<br>
&gt; initramfs image to be built every time before the kernel is built. =A0=
It<br>
&gt; seems that a DEPEND on the rootfs recipe triggers the rootfs build,<br=
>
&gt; however it appears that the kernel recipe does not wait for the image<=
br>
&gt; recipe to finish before it builds. =A0What is the best way to accompli=
sh<br>
&gt; this?<br>
<br>
</div>do_compile[depends] +=3D &quot;ramfs-image:do_rootfs&quot;<br>
<br>
p.<br>
<br>
<br></blockquote><div>Yes, that code is as well in kernel.bbclass so you ca=
n just add</div><div><br></div><div>INITRAMFS_IMAGE =3D &quot;foo&quot;</di=
v><div></div><div><br></div><div>to your kernel recipe.</div><div><br></div=
>
<div>Andrea</div><div><br></div><div>=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left=
:0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">

<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--14dae9340eb7951c8204c77c6108--
