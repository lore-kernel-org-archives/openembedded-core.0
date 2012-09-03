Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8RBg-00026Q-QR
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 09:35:12 +0200
Received: by wibhq4 with SMTP id hq4so3119442wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qvOV3gPqLq9FNHGxhSJZsiCm04S/liA4pqdi/mNjYcc=;
	b=ZzQBLEHQcykQPVkIQrpigrm+Kvsdf0YX4M+d2Fwp1ZAhVYvKDRS8y5XQVsgD4cLR8V
	64QaTh9ou4gQK48lGyx8lH2O6D9as9cX0TY27XBGnvtryUt3Cflcq4DTtHwt2mwdlrKt
	0xRLFu8IrYxNrP7Vl2XouchjEv5ekUafLi86c+HmrSnorSE80iPD+zOfSyzkNdXuNMRd
	SLSK0KK09sczewaLCLLV2FwlQch3D1wuWtF3do4nPC9oNH+SmlRbFeCl+gO3q33BEB17
	gz7BjLPl62RoXeTCBGoLF2ml4o4wMxZqb20yNCHdVi0b6XMo73ThYnZhv5eHZgY/FeBI
	jgYw==
Received: by 10.216.85.149 with SMTP id u21mr8737544wee.147.1346656972728;
	Mon, 03 Sep 2012 00:22:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm26028225wix.5.2012.09.03.00.22.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 00:22:51 -0700 (PDT)
Date: Mon, 3 Sep 2012 09:23:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120903072317.GD3205@jama.jama.net>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
	<bc9cba103446ace4d9158470cdccd58801a66978.1346584261.git.Martin.Jansa@gmail.com>
	<3830362.NxTCTzAyLx@helios>
MIME-Version: 1.0
In-Reply-To: <3830362.NxTCTzAyLx@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] sstate-cache-management.sh: look in meta* above oe-core dir when looking for available tunes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 07:35:12 -0000
X-Groupsio-MsgNum: 28518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline

--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 02, 2012 at 01:07:53PM +0100, Paul Eggleton wrote:
> On Sunday 02 September 2012 13:13:20 Martin Jansa wrote:
> > * many layouts have other layers on the same level as oe-core checkout
>=20
> This is beginning to indicate that this script really needs to actually k=
now=20
> something about your configuration rather than trying to guess it.

You can pass more layers to script with:

  --extra-layer=3D<layer1>,<layer2>...<layern>
        Specify the layer which will be used for searching the archs,
        it will search the meta and meta-* layers in the top dir by
        default, and will search meta, meta-*, <layer1>, <layer2>,
        ...<layern> when specified. Use "," as the separator.

But nobody says what is "top dir", in my bblayers.conf it's the
directory with oe-core and meta-* checkouts and I think this is common
layout if you're not using some combo tool to merge all layers to
oe-core checkout.

So this change only makes default search path a bit more usefull and
then it filteres available arch anyway.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBEWuUACgkQN1Ujt2V2gByB1gCfawmNJO8E++9KFnzCjue7OU3T
sa8AnAhbQlNzGBReecGNxkq5L8cpgErh
=t1iS
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
