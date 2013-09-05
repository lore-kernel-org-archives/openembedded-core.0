Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id C0A3A6C6C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:00:52 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so523042eek.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TsVz/a8iHz5cMWjDysju/Dpmay72mFk6cz6pdePcug8=;
	b=CbJMueLd80a6rIJ4jwigNFVpqG2H5Ua7burkrTuUQWtIfsUBsEhFuZTimMrhWtrm5Q
	B/QKcg7EUe2MacSSJ91QMVqXpJVu3KudwYLpNMhWq+41sk4SzCpWwY904U/DR2PmUD7f
	elfqn7ajPRA7UvhSLRA+556OgFtzF3l1PiggfzGlfAk5GOmby2sSWRm0w+3CYJYc4EbK
	FHH8oWkYX87bn/dQaMtilyz1G71j2s3x0S5RDLd+E/yc9jVErZ4z8aqkD9W10vTZQ1VD
	ZfG5TWAd5gM2DhQFndOl1uwlr5+ecs25+aQbdp13T+4Rf+bLeltuH+IVoCGnPxLyafzn
	Pbsw==
X-Received: by 10.14.216.132 with SMTP id g4mr4014916eep.62.1378393254338;
	Thu, 05 Sep 2013 08:00:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm49356610eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 08:00:53 -0700 (PDT)
Date: Thu, 5 Sep 2013 17:02:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130905150213.GL11500@jama>
References: <1378389321-28598-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1378389321-28598-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] insane: configure option checking
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
X-List-Received-Date: Thu, 05 Sep 2013 15:00:53 -0000
X-Groupsio-MsgNum: 44593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4oF+6Ged69J0+4/e"
Content-Disposition: inline

--4oF+6Ged69J0+4/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 02:55:20PM +0100, Ross Burton wrote:
> Hi,
>=20
> First: very much a RFC, this isn't ready for merging.  I thought I'd send=
 it
> before it got lost in a nest of branches.
>=20
> This is a small sanity test I've been poking at in between builds to dete=
ct when
> configure warns that it has been passed configure options it doesn't reco=
ngise.
> It's got a whitelist for options such as --disable-silent-rules that are =
passed
> blindly to large numbers of recipes, and I think we'll need the possibili=
ty of a
> per-recipe whitelist in case they are required[1].
>=20
> Comments/improvements welcome!

I like this idea a lot :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4oF+6Ged69J0+4/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIonPUACgkQN1Ujt2V2gBzgzACgtxVDhSGr362IkEAF+0saxK1H
l3kAoIXZpC1dP774iszIzwHMfsjR0bMv
=TZzO
-----END PGP SIGNATURE-----

--4oF+6Ged69J0+4/e--
