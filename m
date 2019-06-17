Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id CDE947D711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 11:21:37 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w7so6728548oic.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HKVyXctIUR/cDakF7dsf6mGEuu5l5fgt1DgQNl+/slk=;
	b=j6Hl5kqDFH5zHUiP3F/85d2iMsDlNTHu0sKFkNqgSe6ryFwvahncarH+6+Nnbgtfk0
	y8BgOhlwuHvSENNfQak1VcEQuEn/L3NWuKW5QBRhubLIzjMQquChS+SF1FiXYSix/EH9
	vNmlJ74qi4bC7TQSeiC1IijjYmOYE3x8l59pb+QyQ8Iw7SFmN1xFL5UjPERRq0MJ5wjx
	0hMzYzgY5yZjnDheBiELvXumyKdF6OUcJjjrAZ50hVJWO4p5hyATdlkOLz9FQmBE2OUW
	gQGgxzcMeikMycGWCqUL/+zCA1yp6bOg+MAydsc5zapO/5udyeFL9h0o5OGaIMJVGpYT
	z/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HKVyXctIUR/cDakF7dsf6mGEuu5l5fgt1DgQNl+/slk=;
	b=AWT+XmCN5EVRyspbvetCAp8XkHI+6AtJqphSvYKEqNJRAYsCurA9lRpncXGyegUGYU
	mUb1KbawreJxvQ87pzj7fENwHddU/pTtTuoqTi806LfCJeqrRYjzH5BUYaw6GrAjJKmT
	eq9eaMjtPRnTsZjm8DjLPD6iNEesc5SWH2Z0AiwS5uZe288vJpFwvA5+jEg/7g2nwHuI
	Xua9+8m1MzlZ5lOFmkmKhkCIPpCeJoGpvHsqlN/dsF9RuL+3h1210fJj0a/KNTwB3YKK
	oIZ9bjdmBAGnoHcGKG/5Rf36tJyLcM0cUKq1bXVSioSV8bDVXCWow2e0SwgIfH8d8Med
	Qvvg==
X-Gm-Message-State: APjAAAUvDVk/nRqAqFBN0p7Wy2QMWQ7wAAfzj4PpZ1b/Rj2wUZApzbGJ
	75wqbDL8HBgwPfgvb687s6UPYg6yl9Zelj5qXCE=
X-Google-Smtp-Source: APXvYqxN+SGa1EhUJXcyruKm2ng2mabVPc9zdd3Vm1Lg3iK4MLqEreJvO1dER8aXj/edNwdldSheNEewbqG9qwN8LH4=
X-Received: by 2002:aca:ba02:: with SMTP id k2mr3144775oif.70.1560770498839;
	Mon, 17 Jun 2019 04:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
	<99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
	<c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
	<CANNYZj-9xUFE0x9D_BpLiqkNitLmXnrv9n8boodZpE5bX-psgw@mail.gmail.com>
	<CAJTo0LZbf2Y6_nN0E8tsVLHKxZAtE6zyqP25nyKk=v6+bQjkHg@mail.gmail.com>
	<CANNYZj9LOQZkawsAPi=Sgsd2_0qTeR=NOn4RxqArA+CmkLSTQQ@mail.gmail.com>
	<20190617093526.vjnrh42nxr37by6m@pengutronix.de>
In-Reply-To: <20190617093526.vjnrh42nxr37by6m@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2019 13:21:27 +0200
Message-ID: <CANNYZj98NWCHAoE4zT++j8AUPW4qRnS4w-4fBd7Wr4AF0YkJ6A@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Mon, 17 Jun 2019 11:21:38 -0000
Content-Type: multipart/alternative; boundary="00000000000028ca10058b8333e4"

--00000000000028ca10058b8333e4
Content-Type: text/plain; charset="UTF-8"

Yes please, I think that is the best way out for qemu.

Alex

On Mon, 17 Jun 2019 at 11:35, Marco Felsch <m.felsch@pengutronix.de> wrote:

> On 19-06-14 15:37, Alexander Kanavin wrote:
> > On Fri, 14 Jun 2019 at 15:36, Burton, Ross <ross.burton@intel.com>
> wrote:
> >
> > > > Dropping the swrast dependency will not help though, as it is
> provided
> > > by the mesa-megadriver package, which will continue to include swrast
> as
> > > long as it is enabled in the mesa recipe. mesa-megadriver is also
> pulled in
> > > through other dependencies.
> > >
> > > Won't that stop the build failure on the autobuilder though?
> > >
> >
> > Yes, I think it would.
>
> So should I change that dependency to virgl since it is a qemu target?
> Sorry but I can not see an agreement how we can change this in a 'good'
> way for all parties.
>
> My point of view is that it should not be enabled per default. Of course
> I should fix the qemu config but I don't wanna fix each meta-layer.
> Becuase I think that is the work of meta-layer maintainer.
>
> Regards,
>   Marco
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>

--00000000000028ca10058b8333e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes please, I think that is the best way out for qemu=
.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 17 Jun 2019 at 11:35, Marc=
o Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de">m.felsch@pengutroni=
x.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 19-06-14 15:37, Alexander Kanavin wrote:<br>
&gt; On Fri, 14 Jun 2019 at 15:36, Burton, Ross &lt;<a href=3D"mailto:ross.=
burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; &gt; Dropping the swrast dependency will not help though, as it i=
s provided<br>
&gt; &gt; by the mesa-megadriver package, which will continue to include sw=
rast as<br>
&gt; &gt; long as it is enabled in the mesa recipe. mesa-megadriver is also=
 pulled in<br>
&gt; &gt; through other dependencies.<br>
&gt; &gt;<br>
&gt; &gt; Won&#39;t that stop the build failure on the autobuilder though?<=
br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, I think it would.<br>
<br>
So should I change that dependency to virgl since it is a qemu target?<br>
Sorry but I can not see an agreement how we can change this in a &#39;good&=
#39;<br>
way for all parties.<br>
<br>
My point of view is that it should not be enabled per default. Of course<br=
>
I should fix the qemu config but I don&#39;t wanna fix each meta-layer.<br>
Becuase I think that is the work of meta-layer maintainer.<br>
<br>
Regards,<br>
=C2=A0 Marco<br>
<br>
-- <br>
Pengutronix e.K.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
Industrial Linux Solutions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| <a href=3D"http://www.pengutronix.de/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.pengutronix.de/</a>=C2=A0 |<br>
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=C2=A0=
 =C2=A0 |<br>
Amtsgericht Hildesheim, HRA 2686=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
Fax:=C2=A0 =C2=A0+49-5121-206917-5555 |<br>
</blockquote></div>

--00000000000028ca10058b8333e4--
