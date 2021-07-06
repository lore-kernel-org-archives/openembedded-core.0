Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.13086.1625608126603332286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 14:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=l/VKadnc;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.19, mailfrom: paul@pbarker.dev)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id E44E832009A2;
	Tue,  6 Jul 2021 17:48:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 06 Jul 2021 17:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type; s=fm1; bh=uKDZABKmATLcJgrRY3u+AZ/qoK
	fK55swUi3d89I17AI=; b=l/VKadnc1yj9G9/LXG4RcbPavEtNiiXbgm7fdQR3Cx
	AgjPpnq8es2//S2Z93mIU1/w1m89vrwU0/65xR2TKftIZzWeMSXy+u5yN8zUq1t8
	utxna1eh6OL5UmNDHUyMQNCPdSUvQCWsl3Zj1kla+qCPOO5buFMZYtSha88IzjrP
	vO5JcHPUo+Rl7whTpGhZvIKLyvu4P8bBMyFqvawr5DANCT56cdQZuFLKsCtHpBql
	OILoPM67Z8IQi2TDS8Uu3mLpx+TIUypbDyDAEiyKJOKNGH6bcWUhZ1eDyNqUJsHV
	JolXoVIeJzXM+l5dqQdZGz7B4dpLk0fFTI+k+fS3CrFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uKDZAB
	KmATLcJgrRY3u+AZ/qoKfK55swUi3d89I17AI=; b=EeCiek2NCQHJOLrdWv5PT3
	VaiBx21cd+WySL7fPRI/wFKPE6zo1BjDht2+rkP2V6USJRwGfCiRkIfLCDyPwfj8
	6MfuqVleXhdvmM9OvYc1nIDmKH2tQ2alkimvkOSXxDAfk+5lO7wKrSsBQbYyy83W
	b8WrtMDuUsElZ7XePQZ5/n6PsJBZs6OtkH23bVmsaDd4Z0skpoQhic/CsTWpsTOo
	jJt5OEp1jg8XZPVtG99SnAz6wEhX2B0AInZ+DWYa8jFdcKAzLGNdyrkYucCUDYVv
	xHhLoND6iUJhXxwhizD4IHno9pGb9A0Em5k9JVjG/OJQGVYOd9D44uMCxPY70EiQ
	==
X-ME-Sender: <xms:vc_kYJJo5IS8BeWUigKAdw9aabJhtdQtkvV9izotU1rezh9q6fNP3w>
    <xme:vc_kYFLOwRWcoGVVg8G8c-dQ_1mt7SJDGYetQZGLyMYaQ9CVOR-dg0b9lIRZci8Eh
    nfjF_PPiGMEGjnvu6c>
X-ME-Received: <xmr:vc_kYBvd2qnPowVbp5nIsCrfLmdH63g-dfRhMRzSJFEO9FH8MIMSdbapOAR53CpWMY_KFip81Mt_S20PASS1eZXJq54BlsqdOVRG1mq8chOzYaIxGRxd3y6BH1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddtgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfgjfhfogggtsehgtderreertddvnecuhfhrohhmpefrrghulhcu
    uegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrh
    hnpeehteejiefhheelfefhjeehfeettddtheeuffeifeejfeegvddvueeuffeiteeuvden
    ucffohhmrghinhepphgsrghrkhgvrhdruggvvhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:vc_kYKbSnXjM9Pbg5wefwOUobL71fFg3c3jNrecf8xiTIrAIfG-Iog>
    <xmx:vc_kYAaZv4cXbNAgNVN33ilVqezK5MErkqyEjuMRvx4AvojKDB6woA>
    <xmx:vc_kYOAnfrYyxUFjRv2WzyMEq3mXHY5H9lBX65QteJ_ASBUH5kZtuw>
    <xmx:vc_kYLxMgjn2StpQ6h7C79_FLH571U-0fL6fsyE1HbX9zY3N_-Kahg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 17:48:44 -0400 (EDT)
Date: Tue, 6 Jul 2021 22:48:30 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-yocto/5.13: add devupstream support
Message-ID: <20210706224830.7bd3f5e7.paul@pbarker.dev>
In-Reply-To: <20210706175821.41519-1-bruce.ashfield@gmail.com>
References: <20210706175821.41519-1-bruce.ashfield@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Groupsio-MsgNum: 153628
Content-Type: multipart/signed; boundary="Sig_/vIuPkFcOZ7g0qk8NdnAEBRz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vIuPkFcOZ7g0qk8NdnAEBRz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  6 Jul 2021 13:58:21 -0400
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> We are always getting questions about building -stable, or mainline
> master. Rather than introducing a separate set of recipes, we can
> facilitate this sort of testing by using the existing devupstream
> bbclass support.
>=20
> To build an unpatched or otherwise modifed -stable of 5.13, simply
> set the linux-yocto preferred version to:
>=20
>   upstream+5.13%
>=20
> And your wish will be granted, as the build will use v5.13/base
> which matches the main linux-yocto version, simply with no extra
> changes applied.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

This looks like a good thing to have in oe-core, in the basic case of
just wanting the latest mainline as-is you'd not need to add extra
layers any longer. meta-linux-mainline would still fill a niche as it
provides recipes for older stable kernels and supports using mainline &
newer stable kernels on dunfell & hardknott.

I guess the meta repository (yocto-kernel-cache) would still be cloned
and the upstream kernel could still be modified by patches or config
fragments enabled by KERNEL_FEATURES. That may be worth noting in the
documentation if I'm right. For my use-case where I want to use the
exact upstream defconfig I would probably need to override this, e.g.
`KERNEL_FEATURES_forcevariable =3D ""`, to make use of this.

I also guess this would also allow you to follow newer kernel releases
as they're added to linux-yocto recipes by setting the preferred version
to 'upstream%' (or maybe 'upstream+%' to be more restrictive). That
would then avoid the build breaking when the 5.13 recipe disappears and
is replaced by 5.14 or something else later.

Thanks,

--=20
Paul Barker
https://pbarker.dev/

--Sig_/vIuPkFcOZ7g0qk8NdnAEBRz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYOTPrgAKCRCrY1Tsnbr0
bkufAQCmcLvKxtcn4hWu1mpSOhDrtesK7bQGhlKqLfPonOcTogD/ZLoB7UVS79LT
4sVktxYwN0LCNyD3++mOGhTzzqaXogE=
=9bzm
-----END PGP SIGNATURE-----

--Sig_/vIuPkFcOZ7g0qk8NdnAEBRz--
