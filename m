Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web08.8888.1613487773541308228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 07:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm1 header.b=bIj37O/p;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.26, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 998105C0070;
	Tue, 16 Feb 2021 10:02:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Feb 2021 10:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=ytrr/KJXEZv6GuPXkFvBMH+zaS3
	MfJI8spEvX0WUR4Y=; b=bIj37O/pm1vuIfJht+cfNILv6/LGTqwVJE22QZ0vC0q
	K69GmJJThsTlKIYthGgXuqil4NjPOPZYYja0V6RBh9he8UYylE8jGt++RVKakNWN
	85Wms9fXpJAGBs/zDGlvxEZAqSken7DhYWj1/+Guy4TZCsd7mAqu+8bz7jz2h+DJ
	K067Aa4t1LoDlTr+norhR5IAgwytUzUlEspBMx5ch9WR7FKxCB/2BjZkY88WRdLT
	45bie6BuV74vYLt5bD0Ea83aTiPvOuYBZHkZo1r2nseCHo8cAc1JokvZsIqlTl2r
	CvYl6UeeXv60W2ENZ8anybsuNlFgF2SewPeAGYR4rmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ytrr/K
	JXEZv6GuPXkFvBMH+zaS3MfJI8spEvX0WUR4Y=; b=jN72tzvLcsH0nJqxR0mv7m
	sx7AGbzLH9l/mINv0vteuFOu9vYy5ch3SSaB8luxXmrx8Fxh6hzPvLuNrnxbCWL/
	aKU6BOwcsXXCG5DJtPhibJHP28Xan3PbX6lDRcfr5r6i5GRR4CBygnp6ZJuo+Vy0
	ld9b32TT8KN3B95KYCE1818NkqdBorkumDA/b0ZHNpxS27exZYwRaxjy14QYkItn
	rHbwBcPt/6DyM4KPURmZCR8H3DINEiWbThi/RoUdkz7iwi0Xejs6LePWthVBaA9g
	W7UjpiTWf0negCZbuy47vxR/rNcxEeh2bkyZB0Okh0NFNoM8UdEVFuHAoikcR3eQ
	==
X-ME-Sender: <xms:nN4rYBWMV_xO4wxwyXaJmnXJsAc61zXX_V7B9So_UwxlGHA_Y1RUWw>
    <xme:nN4rYMKQZ-B2T--Ydi4pbrimMBAcmC-0AIKHhZUBlC0Ub1179snKBbjJBkiXKlJWS
    x8fP6m4IO7uiTGMwoM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedtgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvtedvudevgfeftddvgffhkeegveet
    teeigeekveevtdeiveefvddtjeeiuddtudenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepjeeirddvhedtrdekgedrvdef
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    htrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:nN4rYJ_8HiC-6Siql843TYZulkdx170gGxHp35vBCbQSmJDJM-JO0A>
    <xmx:nN4rYHKf_fVqdGWEQ7R2AYg_N9I0Brs-hIwhT9IwLpZTRkbvqbydQw>
    <xmx:nN4rYGmd68FZAnmRRQpKpWx0fA2vgJb-JnkSM3QbYhzt_9HfX-YbhA>
    <xmx:nN4rYItn_3H7r-PFD1YzrJEP1saiwTiwdeyQllDtP5qMOYdFlmGcsg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net [76.250.84.236])
	by mail.messagingengine.com (Postfix) with ESMTPA id C4A591080063;
	Tue, 16 Feb 2021 10:02:51 -0500 (EST)
Date: Tue, 16 Feb 2021 09:02:49 -0600
From: "Patrick Williams" <patrick@stwcx.xyz>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] catch2: upgrade to 2.13.4
Message-ID: <YCvemU+yJrokjLks@heinlein>
References: <20210216134331.2473571-1-patrick@stwcx.xyz>
 <AM9PR09MB46427D7AB75584EE2F517F3BA8879@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB46427D7AB75584EE2F517F3BA8879@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Groupsio-MsgNum: 148179
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HwzEVryONZjGIzda"
Content-Disposition: inline

--HwzEVryONZjGIzda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 03:03:33PM +0100, Konrad Weihmann wrote:
> On 16.02.21 14:43, Patrick Williams wrote:
 =20
> > -SRC_URI =3D "git://github.com/catchorg/Catch2.git"
> > -SRCREV =3D "2c869e17e4803d30b3d5ca5b0d76387b9db97fa5"
> > +SRC_URI =3D "git://github.com/catchorg/Catch2.git;nobranch=3D1"
>=20
> Wrong mailing list I suppose - this should go to=20
> openembedded-devel@lists.openembedded.org=20

Oh, sorry.  I was following:
    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

> and on a second note I don't=20
> think using nobranch is a good idea - the branch used "v2.x" or is there=
=20
> any reason for this which isn't that obvious?

Let me try 'branch=3Dv2.x'.  `fetch` failed when I left it as default so I
didn't investigate a whole lot more and just used 'nobranch=3D1' because
that was the first thing that came to mind.  It does look like the
v2.13.4 tag is along the v2.x branch, so that'll probably work.

>=20
> > +SRCREV =3D "de6fe184a9ac1a06895cdd1c9b437f0a0bdf14ad"
> >  =20
--=20
Patrick Williams

--HwzEVryONZjGIzda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAr3pcACgkQqwNHzC0A
wRlC/Q//bocMqXIxA+zTrGUDKfmH6vor0fOfXKt8QlFVM12WwJiSf2aQZpVkmoLR
/t2gl389DuS9km9Mil8JWKQYXeHNydsMsaHwY5IgEB9IR7broXk48qL3i19+Rs7V
6GCWSKZLQ5HrwYj3kMiky14/CS0rOoisQZWcfkHF18qlJTzgDw9AbW16ZQ8GZNGp
oBNlpR8z7mUMTcJKkkqJqsUiL/0GCQJpZ+X8mn4QvalYFJRfO/t5XfBdhgFGsGHt
ekmVyE3iw546j0wEnT7O/7WNhA7I1otKqMC42xTKaVulJDZV9D+hIHu10QT8MSOF
RCdNm5Q2zNgwQvKNSKYjU5zM19KiLHZhx+BUjdljOAvxds7KR9E4fie1+291pGgP
kAJVv4alXkLYgXIl1gBzSIgpj4SXtRu+aDUPvihnvT6+VPh0wcmJOHsRAXNi/Xd7
CyG5aLyxdhCdMQF+YnWpIs3G69jnSipdNVvxaq/357n2IPCN5hh6KBLXQOXooF1+
LmpFTjHjMGj/kVegB2W2JggAvNzO3GBP8/jDg0R/fQ7aXpZvG5dzYMXxV4v2mJJR
fdL8vu6CsgNJ7Dbmy65U4C1MA+Avv/cdgvVZBLqMMLhN0m7PrIr6hEu4h1ph2Aml
ACgaaIzIMR/wYkJJY+qiUHdKDT6iLO5pdlyIEjhbZu9bNGQ6jA8=
=zlXS
-----END PGP SIGNATURE-----

--HwzEVryONZjGIzda--
