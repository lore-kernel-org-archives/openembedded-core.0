Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id BE3916A9FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:04:33 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so3139583eek.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vRsU7aKQ6HVF7BOc+87dAT//s/3fdK9JMNFWUQPvsPg=;
	b=E/yrROtkagj89xni78trQ/Qio4fx/83YFSrSEbGZ3Zr0axHuzLpnNrgnvSTyFqqk/p
	vwo2UmXcNUrsOymbTP84YxbsVd2gymBCWcqAE+SWCyUVIsKFi6xxN7XIq761JojZRnYB
	yO+99eFfNyy+Q5Ub2wdU2wn52+d4sWupAwUZQBbiOlsUuWsemBQRYWIj1Cfm3Y6Lf3mM
	hEVM+LrNpOoOhPjujWupj6Z3DlhjXOgg/UcQ3hWrj/rUcD3ccm1tJqXBnURKNhCcigu+
	5eX4Nbu2jw+ZRpH5yX/6wFSOZHrb5POR5xLGM3guU6r98kCeueFqoUjwD9PiA7HRThcS
	iz2g==
X-Received: by 10.15.76.73 with SMTP id m49mr274358eey.91.1378231474049;
	Tue, 03 Sep 2013 11:04:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm33476015eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 11:04:33 -0700 (PDT)
Date: Tue, 3 Sep 2013 20:05:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130903180551.GB11500@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<75b5f2fe123fe20e0222bf25e4b0c5a1f836b602.1377792006.git.Martin.Jansa@gmail.com>
	<CAJTo0LbQ7zJjdJ+RbSg_wdWTnRZ-NqW_1rNfQwBniKG9sTRikA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbQ7zJjdJ+RbSg_wdWTnRZ-NqW_1rNfQwBniKG9sTRikA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 05/20] xdypinfo: Add dependency on libxcomposite
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
X-List-Received-Date: Tue, 03 Sep 2013 18:04:34 -0000
X-Groupsio-MsgNum: 44435
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2013 at 06:11:24PM +0100, Burton, Ross wrote:
> Typo (transposition in recipe name) in short log.

Thanks, fixed in jansa/deps branch.

>=20
> Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImJP8ACgkQN1Ujt2V2gByg3gCcCXo0wYvN4gIIRcwWelp0DyFo
9BAAnih+nMfRE5r7hkMv54urvfY4tdCc
=6BFp
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
