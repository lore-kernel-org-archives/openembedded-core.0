Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5036B7B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:21:28 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so275349eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m9TIQ66vWuWw5LeHxZCMgAbGyZvYA46WS+8NaN2dDxs=;
	b=LiRxm1slPL8zrqWON9WaKfiqhsppgsUk/mASMmKJ1u0knCtx2Fu6Xab51uhsKhocYa
	mTrOwJOcmOt/n4EqHKGmqpb1+qAIjyuQ6aCIDj6tpI9Xhzo2IgaNipHOspdbqoCMftjs
	pi+07nSWj2G2TTUVTCrr3qWq3CvthPmDQtKyejuNnuheaqKujmceQfbuESMT8sJCEAMv
	7+p1/egXURxUmJQlG2PglX6IyFAEpoEYyt4J7KHYdxZ5Ttnq//CRJjHAmy0QKq7IakiB
	gePJ4sHQGXfr/9A5BFtv1eZJslI74GsRmHF544F4oDBb1VA1QdL2T/7Sorwvx0KWqYZw
	Y7xA==
X-Received: by 10.15.94.201 with SMTP id bb49mr22058558eeb.23.1376562088244;
	Thu, 15 Aug 2013 03:21:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm83209831eex.2.2013.08.15.03.21.27 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 03:21:27 -0700 (PDT)
Date: Thu, 15 Aug 2013 12:22:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130815102219.GA17945@jama>
References: <520C9F8A.7080703@windriver.com>
	<1376559796.17787.14.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1376559796.17787.14.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 15 Aug 2013 10:21:29 -0000
X-Groupsio-MsgNum: 43422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UNifc18z8z6e1QHx"
Content-Disposition: inline

--UNifc18z8z6e1QHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2013 at 10:43:16AM +0100, Phil Blundell wrote:
> On Thu, 2013-08-15 at 17:29 +0800, wenzong fan wrote:
> > Or could we run this check as part of a QA build step?
>=20
> I think that could be done, in principle.  Now that "ld
> --no-copy-dt-needed-entries" is the default, there's no reason that the
> shlibs code in package.bbclass couldn't be taught to verify that all the
> shared library providers it identifies come from recipes that are listed
> in DEPENDS. =20
>=20
> The only difficulty is that you'd need to accept DEPENDS-of-DEPENDS
> (e.g. a recipe which DEPENDS on gtk+ but also links with libatk or
> something) and I don't think there's currently any straightforward way
> for package.bbclass to generate the recursive dependency chain for an
> arbitrary recipe.  An easy if inelegant workaround would be for it to
> just stash the value of ${DEPENDS} along with the other shlibs data that
> it writes out for each provider.

Something like that is outlined in WIP patch for
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4628

but I got stuck on generating this recursive dependency chain

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UNifc18z8z6e1QHx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIMq9sACgkQN1Ujt2V2gBy9ZACeNgWfOsJ/Lq5hpftuPr6qF6SZ
DSIAniUH3bwHuigKYzxL9qDrkR2kTr4u
=qzAZ
-----END PGP SIGNATURE-----

--UNifc18z8z6e1QHx--
