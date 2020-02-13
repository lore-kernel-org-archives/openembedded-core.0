Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9B05C60C58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:22:38 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id f5so5284274ilq.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AGnTUHAm9NtVqZK2jHcp2QsbXyBOd8ywtU6KVhPOiwY=;
	b=HnN20NxVrs3ezzpwErIo+oWx5vsRu/qYDorEO7YnuPRQmcFTa47AUnIPncbDGQGBGd
	Oly2kg0mIFQgPIRdsMoSAHPlXhs21mTOx8c/s5ehIhqTwUiyNbQB9QlCLkaA++zbPHWB
	eORD502BCH7VTGdJZoMOmyaJERvDpPreozLFeCY+suZFqfohAizwd4jvRHoie0v4hOtP
	0+IxHxOe8jDTY0cynPl/1Q0OyvFwb5f4GADImpVGS8G36w2CaZ1Nv1e8QmlUwtI4eK5J
	o4DrHpiMCIzrbHOg5AFjZO8uXQzhjW0GdI2LAByx/FWIGlMHywY90bF46DcxlNMIYLT+
	w6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AGnTUHAm9NtVqZK2jHcp2QsbXyBOd8ywtU6KVhPOiwY=;
	b=R/KFsi5D7QzmEzayFr7ztzudVMycWQg6qN553+DLpz2nYtJZFhZrRRW1s8DybteUye
	8/VWMqMgWZx83dLH++Q9MWsgjn1uuHrjZDkarg9M2OlQ9T1uV9ePcoMNXZ4US0R6GD37
	X/H7obh4CjTshzDAWm1s2Yg3L9DlagBbr16Ke6xzZ4K6BvFbYxMBBr886c438VL+qypF
	GPHxCxluFwpwTAVsLpoaincvRePHZjXRcRH40uYqNHxfytqLeWsH7MkSMrjuo84Mvqm1
	EPlt1WV8izJO7ST97rcnpT43LWl1MCoLyu/ZnZcHzrXpFaIpUGPl8wu6TOd19sVYX6ze
	IqsQ==
X-Gm-Message-State: APjAAAWwyge/NSY6tS4jAz8el0eJNjv/EhXAfqXnbOvdoUFdei5eQNnN
	/QM5JuVxhWPK7+xNucrpFL7X5NJTmgUQY7UEpk8=
X-Google-Smtp-Source: APXvYqyxqS5zmyHb23GHHlx0gcLY1mosKVfz1+gBiBtY5+hP0JVYGCigt8WcEKXsv6kyr8a66k/9FqRqrOfHweaKx8g=
X-Received: by 2002:a92:4448:: with SMTP id a8mr15543885ilm.256.1581607359330; 
	Thu, 13 Feb 2020 07:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
	<fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
In-Reply-To: <fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Thu, 13 Feb 2020 10:22:13 -0500
Message-ID: <CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2020 15:22:38 -0000
Content-Type: multipart/alternative; boundary="000000000000d3be9f059e76a8f8"

--000000000000d3be9f059e76a8f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 9:24 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-02-10 at 16:42 -0500, Maxime Roussin-B=C3=A9langer wrote:
> > There is a second supplicant raising, iwd. User should be
> > able to switch between wpa-supplicant and iwd. Let's provide
> > a virtual package.
> >
> > ConnMan, systemd-networkd and NetworkManager supports iwd.
> >
> > Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gma=
il.com
>
> > ---
> >  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 3 +++
> >  meta/recipes-core/packagegroups/packagegroup-base.bb           | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
>
> I know its not easy to understand but we don't support virtual/* names
> in the runtime namespace, only the build time one (PROVIDES/DEPENDS).
>
> Grep for VIRTUAL-RUNTIME to see how we handle this (its ugly I know).

Hmm interesting!

If I follow correctly that's mean I have to create:

VIRTUAL-RUNTIME_wireless-daemon and then people can override it.

If the (R)DEPENDS on a recipe change depending on the wireless daemon that
was chosen(i.e. connman), do you handle it with d.getVar and
d.setVar("DEPENDS... inside a
anonymous python function inside the recipe?

The packageconfig would like this ?

PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi,
${VIRTUAL-RUNTIME_wireless-daemon}, ${VIRTUAL-RUNTIME_wireless-daemon}"

Example:

if VIRTUAL-RUNTIME_wireless-daemon =3D=3D "iwd":
    DEPENDS +=3D "iwd"
    EXTRA_OECONF +=3D "--enable-iwd"
elif VIRTUAL-RUNTIME_wireless-daemon =3D=3D "wpa-supplicant":
    DEPENDS +=3D "wpa-supplicant"


Thanks,
Max.

>
> Cheers,
>
> Richard

--000000000000d3be9f059e76a8f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Feb 13, 2020 at 9:24 AM Richard Purdie &lt=
;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linux=
foundation.org</a>&gt; wrote:<br>&gt;<br>&gt; On Mon, 2020-02-10 at 16:42 -=
0500, Maxime Roussin-B=C3=A9langer wrote:<br>&gt; &gt; There is a second su=
pplicant raising, iwd. User should be<br>&gt; &gt; able to switch between w=
pa-supplicant and iwd. Let&#39;s provide<br>&gt; &gt; a virtual package.<br=
>&gt; &gt;<br>&gt; &gt; ConnMan, systemd-networkd and NetworkManager suppor=
ts iwd.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Maxime Roussin-B=C3=A9lang=
er &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com">maxime.roussinbe=
langer@gmail.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0meta/recipes-c=
onnectivity/wpa-supplicant/<a href=3D"http://wpa-supplicant_2.9.bb">wpa-sup=
plicant_2.9.bb</a> | 3 +++<br>&gt; &gt; =C2=A0meta/recipes-core/packagegrou=
ps/<a href=3D"http://packagegroup-base.bb">packagegroup-base.bb</a> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>&gt; &gt; =C2=A02 files changed, 4 in=
sertions(+), 1 deletion(-)<br>&gt;<br>&gt; I know its not easy to understan=
d but we don&#39;t support virtual/* names<br>&gt; in the runtime namespace=
, only the build time one (PROVIDES/DEPENDS).<br>&gt;<br>&gt; Grep for VIRT=
UAL-RUNTIME to see how we handle this (its ugly I know).<div><br></div><div=
>Hmm interesting!=C2=A0</div><div><br></div><div>If I follow correctly that=
&#39;s mean I have to create:</div><div><br></div><div>VIRTUAL-RUNTIME_wire=
less-daemon and then people can override it.<br></div><div><br></div><div>I=
f the (R)DEPENDS on a recipe change depending on the wireless daemon that</=
div><div>was chosen(i.e. connman), do you handle it with d.getVar and d.set=
Var(&quot;DEPENDS... inside a=C2=A0</div><div>anonymous python function ins=
ide the recipe?</div><div><br></div><div>The packageconfig would like this =
?</div><div><br></div><div>PACKAGECONFIG[wifi] =3D &quot;--enable-wifi, --d=
isable-wifi, ${VIRTUAL-RUNTIME_wireless-daemon}, ${VIRTUAL-RUNTIME_wireless=
-daemon}&quot;<br></div><div><br></div><div>Example:</div><div><br></div><d=
iv>if=C2=A0VIRTUAL-RUNTIME_wireless-daemon =3D=3D &quot;iwd&quot;:</div><di=
v>=C2=A0 =C2=A0 DEPENDS=C2=A0+=3D &quot;iwd&quot;</div><div>=C2=A0 =C2=A0=
=C2=A0EXTRA_OECONF=C2=A0+=3D &quot;--enable-iwd&quot;</div><div>elif=C2=A0V=
IRTUAL-RUNTIME_wireless-daemon =3D=3D &quot;wpa-supplicant&quot;:<br></div>=
<div>=C2=A0 =C2=A0 DEPENDS=C2=A0+=3D &quot;wpa-supplicant&quot;<br></div><d=
iv><br></div><div><br></div><div>Thanks,</div><div>Max.</div><div><br>&gt;<=
br>&gt; Cheers,<br>&gt;<br>&gt; Richard</div></div>

--000000000000d3be9f059e76a8f8--
