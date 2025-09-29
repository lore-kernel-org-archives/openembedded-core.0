Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21626CCA468
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:02:13 +0000 (UTC)
Subject: Re: [PATCH v1 1/1] fitimage: Add support for custom compatible string via optional parameter
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.105)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 09:02:09 -0700
References: <CANNYZj9njks8b4yG6O_a24KxCjCEWTYFsfyZCUkcvSchd-6C2Q@mail.gmail.com>
In-Reply-To: <CANNYZj9njks8b4yG6O_a24KxCjCEWTYFsfyZCUkcvSchd-6C2Q@mail.gmail.com>
Message-ID: <6753.1759161729562174284@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224152

On Mon, Sep 29, 2025 at 08:26 PM, Alexander Kanavin wrote:

>
> COMPATIBLE is really not an appropriate name. It should be much more
> specific, e.g. DTB_CUSTOM_COMPATIBLE, or something even more detailed.
>=20
Hi Alex, Sure. I will update COMPATIBLE to DTB_CUSTOM_COMPATIBLE
> >=20
> > - dtbo_loadaddress=3DNone, add_compatible=3DFalse):
> > + dtbo_loadaddress=3DNone, add_compatible=3DFalse, custom_compatible=3D=
False):
>=20
> custom_compatible is not a boolean parameter, it's a string. If it
> isn't supplied, set the default to None.
>=20
Sure
> >=20
> > if add_compatible:
> > - compatible =3D get_compatible_from_dtb(dtb_path)
> > + if custom_compatible:
> > + # Accept either a string (space-separated) or an iterable of strings
> > + if isinstance(custom_compatible, (list, tuple)):
> > + compatible =3D list(custom_compatible)
> > + else:
> > + compatible =3D str(custom_compatible).split()
>=20
> I don't understand. d.getVar() returns a string. At which point
> custom_compatible turns into a list or a tuple?
>=20
I will update this logic as well.
> That's why I had asked you to also make tests for this feature.
>
I will add tests as well.
Thanks=20
Alex

