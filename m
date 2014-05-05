Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 75847607BF;
	Mon,  5 May 2014 01:03:53 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id l4so1072259lbv.6
	for <multiple recipients>; Sun, 04 May 2014 18:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1vUEDABOOAHvc1jVxi7cF1MwJ+2Yxelvh3RTB5CPRH8=;
	b=Jqlu4QZxukHLpW+BhaENLUgerYVIzA2XUO6WQtP4Zo+Ul8hp4Z6PfqqBBMICk0PEG3
	bOTMLvbiPprvqcgq2R9yrxieDGUPn2ZRbztRkNk5sZIwEsIzX1L/nBSGkCBSEUJIAjLn
	B+bZ728o2t2vT6eDuHmHDL1/clL3k7uyXFttE9Q01CrxajkMxy5YtCPB5nz3DHLyUa9/
	rTNuEMXqvxRcyvAOXFJ5d+yzeE6UPx3xww+qWJbj22CXihzpb7NFWtcWJ/KTXGsULlEU
	kAdFnKe42QigB4HtqzFnhuR671vBI2cBHLUeMWx+98AjT8i7QhFxzbrmFd4+oQoFZoCr
	jbIg==
X-Received: by 10.152.203.129 with SMTP id kq1mr9863503lac.6.1399251833385;
	Sun, 04 May 2014 18:03:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o1sm7722934lbw.16.2014.05.04.18.03.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 18:03:52 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 May 2014 03:04:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140505010411.GJ2486@jama>
References: <20140504111629.5E32A504E8@opal.openembedded.org>
	<20140504145024.GD2486@jama>
	<CAMKF1sqAEB77eo6dQzkZgqqk1CQkWoa_YFP4y_ZNwteJoRz7KA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqAEB77eo6dQzkZgqqk1CQkWoa_YFP4y_ZNwteJoRz7KA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
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
X-List-Received-Date: Mon, 05 May 2014 01:03:54 -0000
X-Groupsio-MsgNum: 52801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zrG9CCljkUFHxaeO"
Content-Disposition: inline

--zrG9CCljkUFHxaeO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 04, 2014 at 04:53:14PM -0700, Khem Raj wrote:
> On Sun, May 4, 2014 at 7:50 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >> Update the structure to work with immutable bio_vecs
> >
> > Is this really 4.9 specific? It's failing with the same error message in
> > every qemuarm world build (even with daisy).
>=20
> its not specific to gcc 4.9, however thats where I discovered it. The
> fix although is generic and should work
> in any compiler.

I'm already testing it with daisy build to fix one world build issue, if
that works, can we drop 4.9 from commit message?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zrG9CCljkUFHxaeO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNm44sACgkQN1Ujt2V2gBw4tQCggUxCCA7u0vSZ4SrgfurOCqdx
yk8AnRLlx35GBGNZ7CuLK9VTU9IsZ17Y
=wVpJ
-----END PGP SIGNATURE-----

--zrG9CCljkUFHxaeO--
