Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 233A06B8D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 16:16:12 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so6881689eae.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2014 08:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eGSLTNpVaJzV5UihYAmitaBwRCN8mUMvjl91g5amZBE=;
	b=a3p7SVG2htb/leWizQ+NExxr9DMZ9wKZqjPAuH4zy/cfWprJxh5Uaa4mSi6fOJPg1t
	snvWpww4Ov4nfFaKm3QJNOH6GlIgVft+vOjoXPEGhCoOIP8bGS6vWxxQRKu1CyfjsNd7
	/aGQHjRlciNBCTQCZsPD6JgKMGn9I90NsExBjn5JTjRsnkEWkewSzyzwL8Q3UcOEfx3T
	uQmPx7tIiCUxT1NuenBqtLrVDKyDdrrJwKvST4bkucJkeMIHg9gWUNjL4JsjKtlVcV1O
	566X/mnBFOehZiyKVzchub0Asqpday8kC9m3Sz3UHU2n4B1t1Gs6uMjWShPYaUZNAivi
	NLxQ==
X-Received: by 10.15.49.193 with SMTP id j41mr74337416eew.10.1388765773729;
	Fri, 03 Jan 2014 08:16:13 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm146165512eef.9.2014.01.03.08.16.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 08:16:12 -0800 (PST)
Date: Fri, 3 Jan 2014 17:16:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
Message-ID: <20140103161617.GH3707@jama>
References: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
	<2704C375-0C8D-46B2-A11D-3FF220661AFB@dominion.thruhere.net>
	<6741EAAB26B57F4995668065CB62D86B33983EAC@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <6741EAAB26B57F4995668065CB62D86B33983EAC@IRSMSX102.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Fri, 03 Jan 2014 16:16:15 -0000
X-Groupsio-MsgNum: 48597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Content-Disposition: inline

--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 03:20:31PM +0000, Sywula, Krzysztof M wrote:
> Hi, why would it be '0.8.15'? Recipe points to 0.8.16-rc1 tarball and tha=
t's the only one that can be built.=20

because
0.8.15+0.8.16-rc1 < 0.8.16
but
0.8.16-rc1 > 0.8.16

> Thanks,
> Krzysztof Sywula
>=20
> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
> Sent: Tuesday, December 31, 2013 12:19 PM
> To: Sywula, Krzysztof M
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] Adding irssi 0.8.16-rc1 recipe
>=20
>=20
> Op 27 dec. 2013, om 18:30 heeft krzysztof.m.sywula@intel.com het volgende=
 geschreven:
>=20
> > From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> >=20
> > ---
> > meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 11 +++++++++++
>=20
> that should be 0.8.15+0.8.16-rc1 to conform to the versioning policy
> -------------------------------------------------------------
> Intel Ireland Limited (Branch)
> Collinstown Industrial Park, Leixlip, County Kildare, Ireland
> Registered Number: E902934
>=20
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLG4lEACgkQN1Ujt2V2gBw/6gCdHyZOBFB+ziI1bYoOwiGaw0D+
2r8AnjVWfTYQ1oAzFjZLWu+RCfv1bvtJ
=+DMC
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
