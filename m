Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFE7719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 15:01:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so21988923wma.3;
	Tue, 06 Dec 2016 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=NPoKESvrdX2RO5TKXsPfBiAbnWEIoVilCFej6XhHRRY=;
	b=QAwjDFk6lKRY423ZKPlbTHLYQ+APCpgnLZoNNtCtd9icsbS+MgLLdAFAHgJSQ7Wf5i
	7zlW9Lb8I0gwqr7Hx4symlYd9I8SPZ18U1BgmOtdxx/wTtTuPG0s0jiYn9rpYvTrorgW
	vUk+vfNCW85DJwApGWCvDvgMvu+9Xpl9HGtSGhwfkL8XeQUounyAGlYhw88RssABs/zK
	GyEzSsqxe7bBi4A6f2ZKOYRLLLFUUwoYXrSsX31GhDDsMlrhkaIoETyRPLI9baHOYzmc
	6yNOXkjGot6KcQ0eoH4VGYTB52fYGmSqq5IodXky6Rvysyy0THDexnEjtrcf8S9us5Jl
	xRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NPoKESvrdX2RO5TKXsPfBiAbnWEIoVilCFej6XhHRRY=;
	b=PfEV48+TByrqzJ8XNwb3GzIZf1aJwl6fwTdEoigjUjTxdgnnH72uYOFQv7PtHcISbn
	enng4kjqq807uocMV5lMqI8SLcC8rvDFmTHfQeKEvV3xM02YCAVpxiW1CVkDcTUPaU4O
	dPbaAxMCbphYbBJ67QtljwMYExe8LerxjT7v7+ZBq5taH9l54OXEIppLaAMRGCAsOpIt
	3wzLCfX5CfQD+BFy0zZewEkBVuawRiKdrMRBKqrYnR8FBkdJExp9v4aYezoGbLlDtNSQ
	Wa9YCNvBfBASOiujPIHRs1PEHtiMPVZg7NO3X7NymzrZ0GEovSeA1wJ7PsPse1/CBilG
	LIHw==
X-Gm-Message-State: AKaTC00OzU2WVXAWWy8dcNnEkbWIyNSrfh464CNv6215GayQKiEI9R4dTcCGmpiEKo7o5A==
X-Received: by 10.28.138.135 with SMTP id m129mr3027202wmd.36.1481036513156;
	Tue, 06 Dec 2016 07:01:53 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	138sm4411243wms.20.2016.12.06.07.01.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Dec 2016 07:01:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Dec 2016 16:01:55 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161206150155.GC3255@jama>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbaSgpFSthT55QFroQ8Uc51x4KpOUK8GZK-8=NCf8oE8Q@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: penembedded-commits@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 67/76: gnutls: update to 3.5.6
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
X-List-Received-Date: Tue, 06 Dec 2016 15:01:53 -0000
X-Groupsio-MsgNum: 90290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 02:47:42PM +0000, Burton, Ross wrote:
> On 6 December 2016 at 14:44, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Probably caused by nettle upgrade which no longer enables gmp with older
> > gmp 4.2.1 used in non-GPLv3 builds.
> >
>=20
> I was going to say I don't see this.  Clearly we need to extend the
> non-GPL3 testing.
>=20
> As you can reproduce this, is there a simple fix?

Restoring nettle-3.2 (which got replaced with 3.3 in this commit:
commit fc37c0787008437d94bccfaa91d0b84180a393c9
Author: Fabio Berton <fabio.berton@ossystems.com.br>
Date:   Mon Nov 21 18:17:24 2016 -0200

    nettle: Update to version 3.3

    Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
)

allows to use gmp-4.2.1 and nettle-3.2 is good enough for
gnutls.do_configure.

Now I need to check if LGPLv3 libnettle or libhogweed end in the image
or not.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEbS4gAKCRA3VSO3ZXaA
HGiMAJ9pOuvtb1QQ4ijhKwITgTc6/JO6cgCfSa35GzaudyaimAgFuZIkSoYWqFM=
=QE9r
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
