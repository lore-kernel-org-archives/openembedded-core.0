Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 22D3E6BF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:07:28 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so3195080eaj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fvQ9yftp/nzBNCr3vpGPjSoRCtbCdFOz1Rl/d37GfXM=;
	b=nMMYTD2JYAWIsRn8vwY6cUm/ieOBWrgnQfiFqJ1fpevFzgzUkVJmXxyQKD2E12wiY8
	lt77ENONyoHV4fk/uhlBFR7e/kEEWswPxf3fOrpn3BiwsjtXZ+RDz/xHJUGFDB21cIlb
	/RK2o9mKD7qSMRtxLbQuEvulm9wuhUqsciDDJprKxjItSeSA+kmAGj5J6yyKCiUI8K46
	vTB4uT0huLVIWu27TsMfjCOZW2KI9v973CUyHotcabjlyhXm5Hk+vBfiGiSEhR/jqA2b
	DFumyR0XzCWtIDE6SY1pqcaFIoSOXLJR5MnuTJeuQ1CqrbmWp1XmpQQEeue5NJlKma9u
	vF9w==
X-Received: by 10.15.75.73 with SMTP id k49mr47535017eey.36.1378231649444;
	Tue, 03 Sep 2013 11:07:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm33485664eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 11:07:29 -0700 (PDT)
Date: Tue, 3 Sep 2013 20:08:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130903180847.GC11500@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<ec8f1bdec56b09ad884f0c19fb5e4eea256e846e.1377792006.git.Martin.Jansa@gmail.com>
	<CAJTo0LYV_0=7A93hdVnKK=hOm8BQJ_oNh7K0thEQZusPaDw1XQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYV_0=7A93hdVnKK=hOm8BQJ_oNh7K0thEQZusPaDw1XQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 08/20] telepathy-mission-control: Add PACKAGECONFIG for upower and connectivity
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
X-List-Received-Date: Tue, 03 Sep 2013 18:07:29 -0000
X-Groupsio-MsgNum: 44436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline

--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2013 at 06:10:33PM +0100, Burton, Ross wrote:
> On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> > +PACKAGECONFIG[connman] =3D "--with-connectivity=3Dconnman,,connman"
> > +PACKAGECONFIG[nm] =3D "--with-connectivity=3Dnm,,networkmanager"
>=20
> Were those meant to be runtime dependencies?  At least for connman a
> build dependency doesn't make any sense (no headers).

It is using pkg-config in build time to enable support for it:
http://cgit.collabora.com/git/user/cassidy/telepathy-mission-control/tree/c=
onfigure.ac?h=3Doffline-38366#n330

and it has to conditionally link with them (otherwise test-dependencies
script wouldn't detect it).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImJa8ACgkQN1Ujt2V2gBxjvACfbNwMyJ4XJ5TtZUwqfzoB6Q5X
r/MAnAm5fOp5CVuFWxNaaGKgte7qKkYt
=vWEB
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
