Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 500E273D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:13:41 +0000 (UTC)
Received: by iodd200 with SMTP id d200so28494856iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WK/lTHOM9zCjqa/qHzyHo7OSyB2QnZV/ecbTLQ4r07I=;
	b=foEKGX4IBPa7X05oJj+P2FF+z7Qk6rYHHvFgMsf2kxEOxn1POvL9+fA0JnV0WPj/nr
	Lx7Yw2MByiz//AibvKdiQYo61zChT71Y0EGcXPGgJTYOKv/AMxX2GNSMA+VJ/GcXHLw1
	eKwMf+5zUdOBiLoy64TjHOvXO5UFzFtxqVqAxmq17ySDCsiZl1vvHrRu6AD5FpGjsFhG
	yju/ovRjHvldvY1/VNUrkgQYirHXkO4sPZhbX29SxbgHjp+B0yrdR/aXSB8nmdWKU5n6
	Qt4oliXunOJ1iLMrrdankPAQZ4kpPlX+baqRWzbt7n4Lb1mTm1YOUS7ODKrnFLb5pwDS
	HwyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WK/lTHOM9zCjqa/qHzyHo7OSyB2QnZV/ecbTLQ4r07I=;
	b=yMAFlH5T4OscJamwniUntkyhayi6ZdzcUBxpOX+UYGj/BpI+LkvRD82EEb1c7lIt60
	gU3oLGYDi0xPz27wIyF/1Vo/pcq4x8Cbox93gbKCN0umZ0meR95xIkzBuCxhgdysfFzx
	VDpTtl8Zqrsqr5h5dIdr6W8fqctIO3n4P5flxprzIxdRimEX5KQdggQ6Iib61jq+CCuu
	MghHE76UqvdyAM5ODSaa3UxqYkgpKfxLP8cYdqqoywQvba3XNi7tBvsh0MVv16pJhmB/
	wEEQshDcPR3oN+04QHHmWrWNMoaffR6V+ofqXZZ/eGMWqCeOepjcyPQAmbe6+ALh2Rc6
	E8wg==
X-Received: by 10.107.40.201 with SMTP id o192mr35513572ioo.83.1445876022134; 
	Mon, 26 Oct 2015 09:13:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Mon, 26 Oct 2015 09:13:22 -0700 (PDT)
In-Reply-To: <20151026151307.GA16394@deadlock.dhs.org>
References: <20151026151307.GA16394@deadlock.dhs.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 26 Oct 2015 09:13:22 -0700
X-Google-Sender-Auth: XJpQqrPGX8gDjSgp8p5ayZ36Cd0
Message-ID: <CABcZANn=aL5i2UOVF-p69yBCB2xv_Sn0G_82NetvQa4WXCiKtg@mail.gmail.com>
To: "Sergey 'Jin' Bostandzhyan" <jin@mediatomb.cc>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with RDEPENDS in multimachine builds for allarch packages
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
X-List-Received-Date: Mon, 26 Oct 2015 16:13:42 -0000
Content-Type: multipart/alternative; boundary=001a1141f410b04c9a0523043e63

--001a1141f410b04c9a0523043e63
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 26, 2015 at 8:13 AM, Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc
> wrote:

> I recently ran into a problem that I described here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8578 and while debugging
> this issue an other problem came to light.
>
> I have a multimachine configuration (armv5/imx6) and the same distro for
> both
> of them (poky 2.0 RC based).
>
> I have some allarch packages which have no DEPENDS, however which have an
> RDEPENDS_${PN} setting.
>
> I can see that even though there were no changes to the recipe itself and
> also no changes to the recipes listed in RDEPENDS, my recipe still gets
> rebuilt each time.
>
> What we tried:
>
> <bluelightning> so cleansstate the recipe, change machine, cleansstate
> again,
>                 then build it, then change machine, build it again and note
>                 the first task that executes
>
> The logs for these steps, one with RDEPENDS and one without are at the end
> of
> this mail. I can see that with present RDEPENDS "real" tasks get executed
> even though no changes occured in the recipe; this is not the case when I
> drop RDEPENDS.
>
> Is this a bug or is this just something that needs to be documented?
> What is the "desired" behaviour?
>

Afaik the most likely cause is your rdepends isn't allarch, so is being
rebuilt for the new machine, which causes yours to be rebuilt since it
depends on it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141f410b04c9a0523043e63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Oct 26, 2015 at 8:13 AM, Sergey &#39;Jin&#39; Bostandzhyan <span di=
r=3D"ltr">&lt;<a href=3D"mailto:jin@mediatomb.cc" target=3D"_blank">jin@med=
iatomb.cc</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1io" class=3D"a3s" style=3D"overflow:hidden">I recently ran into a pro=
blem that I described here:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8578" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D8578</a> and while debugging<br>
this issue an other problem came to light.<br>
<br>
I have a multimachine configuration (armv5/imx6) and the same distro for bo=
th<br>
of them (poky 2.0 RC based).<br>
<br>
I have some allarch packages which have no DEPENDS, however which have an<b=
r>
RDEPENDS_${PN} setting.<br>
<br>
I can see that even though there were no changes to the recipe itself and<b=
r>
also no changes to the recipes listed in RDEPENDS, my recipe still gets<br>
rebuilt each time.<br>
<br>
What we tried:<br>
<br>
&lt;bluelightning&gt; so cleansstate the recipe, change machine, cleansstat=
e again,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then build it, then=
 change machine, build it again and note<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the first task that=
 executes<br>
<br>
The logs for these steps, one with RDEPENDS and one without are at the end =
of<br>
this mail. I can see that with present RDEPENDS &quot;real&quot; tasks get =
executed<br>
even though no changes occured in the recipe; this is not the case when I<b=
r>
drop RDEPENDS.<br>
<br>
Is this a bug or is this just something that needs to be documented?<br>
What is the &quot;desired&quot; behaviour?</div></blockquote></div><br>Afai=
k the most likely cause is your rdepends isn&#39;t allarch, so is being reb=
uilt for the new machine, which causes yours to be rebuilt since it depends=
 on it.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clar=
son at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Ma=
intainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1141f410b04c9a0523043e63--
