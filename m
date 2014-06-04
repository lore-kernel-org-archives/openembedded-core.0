Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id ECD986B70A;
	Wed,  4 Jun 2014 12:51:53 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id up15so6982622pbc.2
	for <multiple recipients>; Wed, 04 Jun 2014 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=odtQolbGAUMta27cvXgDoEZl547AtAlItFjx0Vt9tq4=;
	b=q9VQ+dTjCOFSA97ScYT0YKIvvqiUEPfD30iR9Dr7pa44YT+J8I65zq+OO4yKHOModb
	ENjd2fdUXrNPbv2uPG2Zvgk1Xyt6XfSCQatuxRfc0EK5Pb/3sZp8+bFGBxZl1dENzJie
	UtumvD0skyX/r2V1KnlyUKy0F7/SNZCtQlFr+0KS3ENIV1jAU50TPc+B2PdaYLpqmUnX
	XhGe7OpoXJ5YjhqGYe4Es36h9x5pbuiLzEVQ38Yy6RxK+8JpKLRFm4wKYOs0In/kBpPY
	JCZ6cuB6/Pse6SuTxCt47w3f+AonAeiWZ2rZxXY43zAy43pwILvry28r5dX85+bFV1d4
	HHvg==
X-Received: by 10.68.233.37 with SMTP id tt5mr63384717pbc.154.1401886314463;
	Wed, 04 Jun 2014 05:51:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ox3sm9722557pbb.88.2014.06.04.05.51.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 05:51:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Jun 2014 14:52:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140604125205.GS2426@jama>
References: <cover.1399993010.git.valentin.popa@intel.com>
	<CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Wed, 04 Jun 2014 12:51:57 -0000
X-Groupsio-MsgNum: 53824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3pZQ0wszfDg7ZRO+"
Content-Disposition: inline

--3pZQ0wszfDg7ZRO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 04:28:42PM +0100, Burton, Ross wrote:
> Hi all,

Sorry for hi-jacking the thread, but since today even the older 9.2.5 is
failing to find native python-libxml2

config.log:
configure:8059: checking for python2
configure:8075: found
/OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/py=
thon2
configure:8086: result: python2
configure:8103: checking python2 module: libxml2
configure:8112: result: no
configure:8118: error: failed to find required module libxml2

Any idea why it started to fail now?

> As this is a major release of Mesa I'm expecting breakage somewhere...
>  Can BSP maintainers please test these patches if their machines build
> Mesa?  I'm expecting machines that use mesa-gl to break if they don't
> just use the pure software drivers (so that's at least EMGD and if I
> recall correctly some ARM drivers).
>=20
> Ross
>=20
> On 13 May 2014 15:59, Valentin Popa <valentin.popa@intel.com> wrote:
> > mesa upgrade to 10.1.3
> >
> > The following changes since commit 40551859671a1c9da26cfdcda34da952c66a=
c8c2:
> >
> >   qemu/local.conf.sample: Add sdl PACKAGECONFIG (2014-05-13 08:02:04 +0=
100)
> >
> > are available in the git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib vpopa/mesa
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dvpopa/mesa
> >
> > Valentin Popa (3):
> >   dri3proto: add it to oe-core
> >   libxshmfence: add it to oe-core
> >   mesa: upgrade to 10.1.3
> >
> >  .../mesa/{mesa-gl_9.2.5.bb =3D> mesa-gl_10.1.3.bb}   |  0
> >  meta/recipes-graphics/mesa/mesa.inc                | 35 +++++++++++++-=
--------
> >  .../mesa/{mesa_9.2.5.bb =3D> mesa_10.1.3.bb}         |  4 +--
> >  meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
> >  meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 +++++++++++
> >  meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 +++++++++
> >  6 files changed, 56 insertions(+), 18 deletions(-)
> >  rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb =3D> mesa-gl_10.1.=
3.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb =3D> mesa_10.1.3.bb} =
(82%)
> >  create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
> >  create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3pZQ0wszfDg7ZRO+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOPFnUACgkQN1Ujt2V2gBzhaACgibSbcuhLQUWmAid8RgEidXa7
WgwAn3rYZh6HtmDwszGSxU31dhFMn1Oe
=GMDR
-----END PGP SIGNATURE-----

--3pZQ0wszfDg7ZRO+--
