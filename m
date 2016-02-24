Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B39817728C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:50:45 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b205so35299416wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1z5s8dOj4y9JJCZY2FeZ3EDs5ydmZAGoNwYZyR96Clg=;
	b=cYf2JNoM0MFAKk4EyRuJfeaYCfRjOZJM+KedbhquuPdIi9mKkgZ1zndh64VuKjNsoV
	IoBpO24wj6YcFC0Tin3FihQSgyGz3SCsxDO/vcp6U25J628SrQULL3pSGrvdoPahgaEt
	hgKMX5QbDyt7xaBx9nMPkJS3z/ve4GGZuV1p9AoXP6jTT9eTkJ53hwF3PSJk7aYkO06o
	d8nBL9zpl+MgvjjzrbVIpVH0rg8gGGtD6Hgac8mybYOO8P530Kmeit8GSoeueK70h3YK
	HleTWDdGJYnffD/aEYocxICqpEb+CYGy6luezd3UayUhcqG3F7c0WyN9LuYJxHhe6MjT
	XU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1z5s8dOj4y9JJCZY2FeZ3EDs5ydmZAGoNwYZyR96Clg=;
	b=UNCRZF4kmTn6HsmwNaUfFY6xDyFwuUndhZkE6OiMCnooTcwxxcSg4/EyfhlyiR5s7b
	r3mAKCGnT5wI1QGcwXGFuZ7JQ8c6GTDLZDs0hjEBWEhFqH4xSW8vjSCPsdjB6CYAPtP7
	TBQzBec/LlRp5EXqf14/ZWYgXEBddJklg3t1eXQPIwMC9fwDuSX+KdNngEMQp0W7Tu60
	DZxf4H0U0FNDb1kMO5Ib35zqOVD8IAbMR81uazUWKwkZmb7z3xkDxwprLSuXUzM5jTEL
	Z6QuXZSUKaB56O7MviyMYwHulXQ2vBRSWY+fxjriJtUKls4lriydu2+nj5fl0Q/Gngsr
	WgAQ==
X-Gm-Message-State: AG10YOTYY94xth9swTCSQAcGBdDbR0sPqLVTjRFTo3BL83IoPu5e1w30x4jcPNeL8Tj7IQ==
X-Received: by 10.28.100.134 with SMTP id y128mr25544074wmb.87.1456321845658; 
	Wed, 24 Feb 2016 05:50:45 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jo6sm3114855wjb.48.2016.02.24.05.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:50:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:51:51 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160224135151.GB2560@jama>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
	<CA+chaQe460XR_hNRMS3MyUh5KGMWjykiQKnVOh58FAg2zk0WVQ@mail.gmail.com>
	<56CDA358.8070108@linux.intel.com> <20160224131654.GF7560@jama>
	<56CDAFF0.7090109@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56CDAFF0.7090109@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Wed, 24 Feb 2016 13:50:45 -0000
X-Groupsio-MsgNum: 78596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 03:28:16PM +0200, Alexander Kanavin wrote:
> On 02/24/2016 03:16 PM, Martin Jansa wrote:
>=20
> > The distro needs to set ARM_INSTRUCTION_SET to "thumb" in order to enab=
le
> > actually using this TUNE_FEATURE.
> >
> > With recent improvements in tune files you should clearly see that
> > default qemuarm builds are using TUNE_PKGARCH without "t" in it which
> > means that "thumb" isn't enabled.
>=20
> Should we actually test this on autobuilders then? The change passed=20
> them fine, even though it shouldn't have.

Yes, that's what I was suggesting in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNtXYACgkQN1Ujt2V2gByaEwCcCL0y7vLVdYcyThhyj76jSmf8
DkIAn1sgVWLVxDEUrDFwiFGEwcUkvCVU
=pxMk
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
