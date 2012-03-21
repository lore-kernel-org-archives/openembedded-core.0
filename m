Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAPwa-000664-QU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:07:32 +0100
Received: by wgbds1 with SMTP id ds1so1721809wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ieHtRVl5X6M0ca/jRa25+q4sMJqggD3RwJ8eX6sDwb4=;
	b=YcubOCybnNuHN3bc5ek8qEyMecWeK1R+ntjJoTixIaqkxuYl7fd5MDmOybpgBw90LJ
	m4OQA9EwySJ01flsRUVALIGB3dWTLrjrSgESOrTldyW3wnq/nPrEvJ5YDYyAzSHahT3d
	3744fjcsStCHn+Avy50BhLiS3hKGNzswn/jczOiBW7020BPQTS7uT4+5s2WNnh3TKQiU
	aJ35r6skFa7D7ShyQ0C/S4sgG7+UZZDzmtpCWoxLvyGCLY/nv3iUFZJ2hBMSG6hXbmTZ
	oRbIa9me5s4aCqjdoF+0QlwPzgao6MbU8FTMaaH1MVkZGW9+/AhVVZRSaXZd8U8f1cxs
	ZdmA==
Received: by 10.180.94.33 with SMTP id cz1mr11249606wib.13.1332352718749;
	Wed, 21 Mar 2012 10:58:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bx13sm6194463wib.10.2012.03.21.10.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 10:58:37 -0700 (PDT)
Date: Wed, 21 Mar 2012 18:58:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20120321175836.GB3659@jama.jama.net>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120321185216.440a6353@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 18:07:32 -0000
X-Groupsio-MsgNum: 19306
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline

--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 06:52:16PM +0100, Eric B=E9nard wrote:
> Le Wed, 21 Mar 2012 17:47:53 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> >   I tried removing the "--with-system-readline" from the EXTRA_OECONF. =
It did not change the behavior of the issue.
> > Also I noticed that that commit never worked in the tree. I have built =
it on fedora and suse systems.
>=20
> it works fine here (Fedora 16 x86_64 host system, oe-core + qemuarm
> target + meta-toolchain-qte), tested yersterday.

Here too with armv4t/armv7a + meta-toolchain-gmae.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9qFswACgkQN1Ujt2V2gBzo2QCgkG8scNE7tVKxeBSXR2CcmPTs
VVEAoI2otYobn5XtJ6iV5dLjhMhSQ9A+
=VmLn
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
