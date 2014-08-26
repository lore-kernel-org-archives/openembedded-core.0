Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id AE886710CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 21:43:56 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so15887034lab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 14:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zo71sBXWt4OUJWDyj86BZsNcidb8c6dLeCr8RtWkJ2Y=;
	b=AR3930cdDAPxj08mo3HMyy/5cdQZQt5kMUpZ+E4Rjigzbb72Gp3EzxQF1zwnE4r0Za
	0lSDifINDSpCAJP5lW9CQhJ5e/vbo0kyj4+X7PxjInLD/YbsgveNl/Ur1Yvrv4b3rieO
	8mi3jrb+ez/F20cpG/azy16wvWtXTIU5OODuRLNF13RFP0zunnvhgZQNajv8andpWzyu
	bsZ1Bl4K6WMzaEYsO0993FJgb7hhi7m3u3p5R7fxkdf2WHelxO2M4awW/SOdvdk8r/iF
	q7GDr7ra1iiZSoy8lYdFez6ADsTLAcaR3yNC/rMLi6oAFxRUc1KBMR+JyjZDVzX63BM1
	6gig==
X-Received: by 10.112.161.72 with SMTP id xq8mr28408530lbb.18.1409089436734;
	Tue, 26 Aug 2014 14:43:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ls6sm2848881lac.2.2014.08.26.14.43.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Aug 2014 14:43:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Aug 2014 23:44:03 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20140826214403.GA20524@jama>
References: <53FCE823.9050800@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <53FCE823.9050800@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: own-mirrors broken
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
X-List-Received-Date: Tue, 26 Aug 2014 21:44:03 -0000
X-Groupsio-MsgNum: 56992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ijywFOGgtBfiIjQx"
Content-Disposition: inline

--ijywFOGgtBfiIjQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2014 at 02:03:47PM -0600, Gary Thomas wrote:
> This commit breaks "own-mirrors"
>=20
> commit 0ae7b58060f1ee7914dd45d462e48d4b8a3751ad  (Poky/Yocto)
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Aug 22 01:31:27 2014 -0700
>=20
>      sanity.bbclass: check the format of MIRRORS
>=20
> Since this change, use of "own-mirrors" produces this error:

It was already reported before:
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/09623=
0.html

Luckily kergoth already sent fixes for it.

> WARNING: Invalid PREMIRRORS: cvs://.*/.*     file:///local/poky-cutting-e=
dge/sources/
> svn://.*/.*     file:///local/poky-cutting-edge/sources/
> git://.*/.*     file:///local/poky-cutting-edge/sources/
> gitsm://.*/.*   file:///local/poky-cutting-edge/sources/
> hg://.*/.*      file:///local/poky-cutting-edge/sources/
> bzr://.*/.*     file:///local/poky-cutting-edge/sources/
> svk://.*/.*     file:///local/poky-cutting-edge/sources/
> p4://.*/.*      file:///local/poky-cutting-edge/sources/
> osc://.*/.*     file:///local/poky-cutting-edge/sources/
> https?$://.*/.* file:///local/poky-cutting-edge/sources/
> ftp://.*/.*     file:///local/poky-cutting-edge/sources/, should be 2 mem=
bers, but found 22.
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ijywFOGgtBfiIjQx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP8/6MACgkQN1Ujt2V2gByjigCgkGZz2U0tDd3Rdip0OGeMYLM3
xykAn3tMIdSN8nmqXZulXhdvrSklOBng
=NFcA
-----END PGP SIGNATURE-----

--ijywFOGgtBfiIjQx--
