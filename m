Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EAD2E737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 13:01:18 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so55239967wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OLgKf04iKLNzaRe0W+QH9u4y/GsKcNfBThMISKiWjyM=;
	b=fSyzQ9GUXwNJ4JFkge4lkgh1Wvr2RfLLS+OKeoSAMxtS6M1+xWheDk7uKj0dKbubJB
	gEy9FBl5gC5JAw5Di8H4wofrBY4iprgNV3hdhhH+AYaCxghk8HNhkcYnLdOi/Ai81QrR
	3cUkhvcTatalrX6zDiySAEah9pXUP+Rbw+iZN0Mb93yGbqxIADzvWY0j6T04hK76PUsf
	B+jJDYVL0LTScrPJtYRCIJtIp4HqiDs4kL/p+yOlwkyFUdF+01NKr7/uOa4fhdvhAiP2
	6cTA6hriiCBNlUpNESviusZggsPsiVbhwehiCCp8CE+/Wbed7zmtYpnUUGHPVh4LKSOv
	kcJw==
X-Received: by 10.194.6.70 with SMTP id y6mr38886044wjy.97.1428411679322;
	Tue, 07 Apr 2015 06:01:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	q10sm10860607wjr.41.2015.04.07.06.01.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 06:01:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Apr 2015 15:02:01 +0200
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Message-ID: <20150407130201.GB22953@jama>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496CEA@irsmsx105.ger.corp.intel.com>
	<1428406875.12283.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496D80@irsmsx105.ger.corp.intel.com>
	<1428410191.12283.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<20150407124458.GA22953@jama>
	<1428410766.12283.34.camel@tkkaskin-mobl3.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1428410766.12283.34.camel@tkkaskin-mobl3.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 07 Apr 2015 13:01:19 -0000
X-Groupsio-MsgNum: 64080
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2015 at 03:46:06PM +0300, Tanu Kaskinen wrote:
> On Tue, 2015-04-07 at 14:44 +0200, Martin Jansa wrote:
> > On Tue, Apr 07, 2015 at 03:36:31PM +0300, Tanu Kaskinen wrote:
> > > This would be more appropriate for recipes that only support bluez4:
> > >=20
> > > #  inherit bluetooth
> > > #  PACKAGECONFIG ??=3D "${@bb.utils.contains('BLUEZ', 'bluez4', 'blue=
z4, '', d}"
> > > #  PACKAGECONFIG[bluez4] =3D "--enable-bluez4,--disable-bluez4,bluez4"
> >=20
> > The last example isn't correct, because you still need to respect
> > 'bluetooth' in 'DISTRO_FEATURES' before enabling whatever is in BLUEZ
> > variable.
>=20
> BLUEZ is empty if 'bluetooth' is not in DISTRO_FEATURES, so my example
> should work fine.

The default value is, but that doesn't ensure that user has different
value set in local.conf and suddenly his bluetooth-less distro
configuration is trying to enable bluez* support in some component.

So for consistency sake you should respect bluetooth in DISTRO_FEATURES
(like in the previous example).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUj1UkACgkQN1Ujt2V2gBz2jACgoWI2WEH/DWCioO/SKOx1tBZb
SpoAnRVkAPR/4EcvIkXO0hiO7ImPCAx1
=JUs3
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
