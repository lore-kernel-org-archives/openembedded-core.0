Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id E3F187A2ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 12:07:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id z25-v6so2936804wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2018 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ylBdD19C+0vuuqvp4Zla5bnApJ8PWBGC2MvOmk1LCic=;
	b=C/m/IzEcqMOYm7Ga2ZeAE2QvkDo/0t3X2JeOGlhvd8TdPkI/zn0Js7hfxyoZh6ExP/
	waf4o15XHFGeyJu0mZ4nTiYgP3BZbd8RMVBcucGvTXo4VtIGInIqNTB8/BwZdV1XRkEA
	27OB9RZoDpwfe5BPZS5OUsRnRD8MVI2ITNntGIdDMfoOsh1ogT7MtUAC92JMePkGYvZw
	JovVhercdL9w7/FCdncWmYddZ+8PuwGP+PcepvC8+n6ZJdLalJh3nRK1gIv1TEPQI5z2
	mcQDilbCtO9MFtfnDREt+MhrYS9EqHOre9KcaPY2mR+bOW/aaqWPow7XNJbhAEYYPphY
	A0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ylBdD19C+0vuuqvp4Zla5bnApJ8PWBGC2MvOmk1LCic=;
	b=cC0SdC9nvRzBFk8egrTodBx7jLMSp0xTbmYeUd8w1bR0Enbhr4DUD/eeCGNaAkQ8yR
	8m/VfUgU+UuXqUmhTOF22lAd2WureneS6wSmV3XOer1/JSZEhfn3f8p1qoNeebJBPGbB
	Clxo+KjHVhxcIUgg6mIxxgF5MXP61T8HGVwah/J25S83l0jfCZI63k4ObnQ21Ogn6ozt
	iEgwbGcvRZJBhDDLLWx/g80rmoYubdlOLwloJSPaJ+6/+ztJcObEF3o/X0CXR9QaJVH4
	fB6cqpd/tmgxS5jyjPrjKACZ6loMNhfDlWSuN8UQGr3JFnzitL10viaHNHBCotiTNh7n
	XByw==
X-Gm-Message-State: ABuFfoh6wQBmr3aGW1ZLkr+1ANStXIM3uJic9zkyilWF3o1ZW8Npgtv0
	HFy4wARj2QaHwOdO/pxcL8N6PS0NeXxC8QDu/Bg=
X-Google-Smtp-Source: ACcGV60MjTy4iohad61TfNxkOC75irEpltYcCSgD2jCOhOhcfvX2D9AdtJERUabRPxLFxVIDDs/NSQ9nG+VT2ak1Tvk=
X-Received: by 2002:a1c:ce02:: with SMTP id e2-v6mr157860wmg.85.1538395673718; 
	Mon, 01 Oct 2018 05:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20181001111233.29181-1-Martin.Jansa@gmail.com>
	<ef30e9f17c0bef54dab54d024f2fb2bf0a36be27.camel@linuxfoundation.org>
In-Reply-To: <ef30e9f17c0bef54dab54d024f2fb2bf0a36be27.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 1 Oct 2018 14:07:42 +0200
Message-ID: <CA+chaQfqgDQJyXDMe0SiNEhnzwA27stC6ZeGpv0-ROMsiw0kkQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: move IMAGE_NAME_SUFFIX variable from image_types.bbclass
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
X-List-Received-Date: Mon, 01 Oct 2018 12:07:54 -0000
Content-Type: multipart/alternative; boundary="000000000000a7f560057729a7ab"

--000000000000a7f560057729a7ab
Content-Type: text/plain; charset="UTF-8"

Sure, sounds good.

On Mon, Oct 1, 2018 at 2:03 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2018-10-01 at 11:12 +0000, Martin Jansa wrote:
> > * currently it's used only by image.bbclass, image_types.bbclass and
> >   meta/recipes-core/images/build-appliance-image_15.0.0.bb
> >   but if it's needed by some recipe which isn't itself an image, then
> >   it's useful in bitbake.conf, e.g. we have a recipe for creating
> >   VirtualBox appliances which combines .wic.vmdk with .ovf file to
> >   create .zip with appliance, but for that we need the filename of
> >   .wic.vmdk which now contains IMAGE_NAME_SUFFIX
> >   https://github.com/webOS-ports/meta-webos-ports/blob/4980ce52a43ac6
> > 897657602810313af359f0b839/meta-luneos/recipes-core/images/luneos-
> > emulator-appliance.inc#L24
> >
> > * we were hardcoding .rootfs suffix where needed, but for quite long
> >   time it's configurable with IMAGE_NAME_SUFFIX and might not match:
> >
> >   commit 380ee36811939d947024bf78de907e3c071b834f
> >   Author: Patrick Ohly <patrick.ohly@intel.com>
> >   Date:   Mon Mar 7 18:07:52 2016 +0100
> >
> >     image creation: allow overriding .rootfs suffix
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/image_types.bbclass | 6 ------
> >  meta/conf/bitbake.conf           | 6 ++++++
> >  2 files changed, 6 insertions(+), 6 deletions(-)
>
> You could make this argument for many of the class variables, with
> other code needing some small piece and we end up importing a ton of
> stuff into bitbake.conf and global scope. My worry is this isn't
> scalable and leads to code which is hard to disentangle.
>
> How about we create imagevars.conf which the class could include, or
> other users could include without pulling in the main class?
>
> Cheers,
>
> Richard
>
>
>

--000000000000a7f560057729a7ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, sounds good.=C2=A0<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Mon, Oct 1, 2018 at 2:03 PM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,=
 2018-10-01 at 11:12 +0000, Martin Jansa wrote:<br>
&gt; * currently it&#39;s used only by image.bbclass, image_types.bbclass a=
nd<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/images/<a href=3D"http://build-appliance=
-image_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-imag=
e_15.0.0.bb</a><br>
&gt;=C2=A0 =C2=A0but if it&#39;s needed by some recipe which isn&#39;t itse=
lf an image, then<br>
&gt;=C2=A0 =C2=A0it&#39;s useful in bitbake.conf, e.g. we have a recipe for=
 creating<br>
&gt;=C2=A0 =C2=A0VirtualBox appliances which combines .wic.vmdk with .ovf f=
ile to<br>
&gt;=C2=A0 =C2=A0create .zip with appliance, but for that we need the filen=
ame of<br>
&gt;=C2=A0 =C2=A0.wic.vmdk which now contains IMAGE_NAME_SUFFIX<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/webOS-ports/meta-webos-ports=
/blob/4980ce52a43ac6" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/webOS-ports/meta-webos-ports/blob/4980ce52a43ac6</a><br>
&gt; 897657602810313af359f0b839/meta-luneos/recipes-core/images/luneos-<br>
&gt; emulator-appliance.inc#L24<br>
&gt; <br>
&gt; * we were hardcoding .rootfs suffix where needed, but for quite long<b=
r>
&gt;=C2=A0 =C2=A0time it&#39;s configurable with IMAGE_NAME_SUFFIX and migh=
t not match:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0commit 380ee36811939d947024bf78de907e3c071b834f<br>
&gt;=C2=A0 =C2=A0Author: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@in=
tel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Mon Mar 7 18:07:52 2016 +0100<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0image creation: allow overriding .rootfs suffix<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image_types.bbclass | 6 ------<br>
&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 6 ++++++<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
You could make this argument for many of the class variables, with<br>
other code needing some small piece and we end up importing a ton of<br>
stuff into bitbake.conf and global scope. My worry is this isn&#39;t<br>
scalable and leads to code which is hard to disentangle.<br>
<br>
How about we create imagevars.conf which the class could include, or<br>
other users could include without pulling in the main class?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000a7f560057729a7ab--
