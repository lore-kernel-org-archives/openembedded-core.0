Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C7ADF73D15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 12:44:15 +0000 (UTC)
Received: by wgsk9 with SMTP id k9so32137322wgs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 05:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yE7e4TWuES2GULFF2imTkh4PRkOZOnu2EIqHYTsYP9c=;
	b=ZGNNWIcgzAFOgSDR82u4oDSPOtfWJ4lrwT2TzLtn4UUb0lYpi0cEOMPpY80EzntDdO
	rCwV9sEKnX/lLfRr/2GbtoqrzA/Cg0+n/PoQ4HH3iuNPCjJlyid1r2yG9KU9oQSpcmPe
	OdY80YdW26dd8ws82vlysir6kcBse6VyKQcEYM0ecZgsltDkixHfqmQUndu+88g9v4Tk
	8UhyyHaTkpWYYQj8e4auTXU7UPh262QMaxGg305y1+TvEjBkDddGG3KIyXvx8bxSqZhg
	yJ9AnaYE4TqpO2I5nsZ2zqyScve6+ZJ4hZCusEb2hOx4mGCOE3oPzdAnNpgwtPZ5KS6+
	ni6A==
X-Received: by 10.194.87.100 with SMTP id w4mr38250167wjz.65.1428410656295;
	Tue, 07 Apr 2015 05:44:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	gt4sm10857685wib.21.2015.04.07.05.44.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 05:44:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Apr 2015 14:44:58 +0200
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Message-ID: <20150407124458.GA22953@jama>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496CEA@irsmsx105.ger.corp.intel.com>
	<1428406875.12283.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496D80@irsmsx105.ger.corp.intel.com>
	<1428410191.12283.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1428410191.12283.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 12:44:16 -0000
X-Groupsio-MsgNum: 64075
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2015 at 03:36:31PM +0300, Tanu Kaskinen wrote:
> (A friendly request: could you use interleaved posting style as
> described in the mailing list guidelines here:
> https://wiki.yoctoproject.org/wiki/Community_Guidelines )
>=20
> On Tue, 2015-04-07 at 11:51 +0000, Iorga, Cristian wrote:
> > The only way this could be fixed is to remove the aforementioned guidel=
ines..
> > Like I said, there are plenty of examples in the code.
> > Those packageconfigs where elaborated based on:
> > 1. if a package has support for both BlueZ versions;
> > 2. If not, usually only BlueZ 4 is supported;
> >=20
> > Care to elaborate how I can fix them otherwise? I am open to suggestion=
s.
>=20
> Sure, I can give concrete suggestions. This one I already gave in my
> first mail:
>=20
> # Use this with:
> #  inherit bluetooth
> #  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetoot=
h', '${BLUEZ}', '', d)}"
> #  PACKAGECONFIG[bluez4] =3D "--enable-bluez4,--disable-bluez4,bluez4"
> #  PACKAGECONFIG[bluez5] =3D "--enable-bluez5,--disable-bluez5,bluez5"
>=20
> When someone applies that example to a recipe that only supports one
> bluetooth implementation, then the example of course needs some
> adaptation, but that's ok. I think the example gives a clear enough idea
> how the BLUEZ variable is supposed to be used.
>=20
> Note that if you anyway want to also give an example of how to deal with
> recipes that only support one bluetooth implmementation, I think this
> line should be changed:
>=20
>   PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth=
', '${BLUEZ}', '', d)}"
>=20
> The reason is that if the recipe only supports bluez4, for example, then
> PACKAGECONFIG should never include bluez5, but that line will put bluez5
> to PACKAGECONFIG if the distro's chosen bluetooth implementation is
> bluez5. I suppose that doesn't actually break anything, but I don't
> think it's a good idea to recommend adding garbage to PACKAGECONFIG.
>=20
> This would be more appropriate for recipes that only support bluez4:
>=20
> #  inherit bluetooth
> #  PACKAGECONFIG ??=3D "${@bb.utils.contains('BLUEZ', 'bluez4', 'bluez4, =
'', d}"
> #  PACKAGECONFIG[bluez4] =3D "--enable-bluez4,--disable-bluez4,bluez4"

The last example isn't correct, because you still need to respect
'bluetooth' in 'DISTRO_FEATURES' before enabling whatever is in BLUEZ
variable.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUj0UoACgkQN1Ujt2V2gBx1uQCgh9oXP2/LN72xwCwNAtkMmQ9r
0g0AoKrmYVj47SSBU/qRoOu7b7yLS5aB
=5msn
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
