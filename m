Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tbqd8-0007O1-RC
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 11:37:07 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3435269eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 02:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+wM7vls5pgMe10fbt7Euq2BNSwZruEBHWTzMVURMVXo=;
	b=oq65xRGcjbf+AwM2+l5sthyLk1TaepR4/M5NB2LmgMCfZmwmZxvBzwYGJ/IB6sE4Jz
	HjM/GZ4hg8kn4roVETSlxi4DRsGxuO053Nfc95WvEA0g9OQWSvimkynEILz83dCI5hd5
	4MMc4l8/vR9t7JkApfhHIwdso8zdH9yCiLaxRQD2S9hBB1wsIxw/S5WNzZTyg2KBvYsG
	LbXueFqHodJPp4uEein/tVPmJr6PruqaNlA5yw5x1eDQpl27C9x5RsU3meeiB9UPHZmr
	ztJpdFdJM01NjpLVtlQmer1mT5U/IyzEqgx9GSHFiypXrqFzzcny9g36fQLeGn/xNmHW
	tIAA==
Received: by 10.14.223.200 with SMTP id v48mr12051711eep.24.1353666179332;
	Fri, 23 Nov 2012 02:22:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u45sm6595329eep.0.2012.11.23.02.22.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 02:22:58 -0800 (PST)
Date: Fri, 23 Nov 2012 11:22:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121123102258.GJ12637@jama.jama.net>
References: <1353661767-13873-1-git-send-email-Martin.Jansa@gmail.com>
	<1353664350.13864.701.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1353664350.13864.701.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for armv4 and strongarm1100
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
X-List-Received-Date: Fri, 23 Nov 2012 10:37:07 -0000
X-Groupsio-MsgNum: 31704
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i57Ucs80xkCVE1Ce"
Content-Disposition: inline

--i57Ucs80xkCVE1Ce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 09:52:28AM +0000, Phil Blundell wrote:
> On Fri, 2012-11-23 at 10:09 +0100, Martin Jansa wrote:
> > -TARGET_LD_KERNEL_ARCH +=3D "${@bb.utils.contains("TUNE_FEATURES", "arm=
v4", "--fix-v4bx", "", d)}"
> > +TARGET_LD_KERNEL_ARCH +=3D "${@bb.utils.contains("DEFAULTTUNE", "armv4=
", "--fix-v4bx", "", d)}"
>=20
> Testing DEFAULTTUNE doesn't really seem like the right thing.  Not that
> I am any expert in the twisty maze of tune variables, but I would have
> thought this should be:
>=20
> TARGET_LD_KERNEL_ARCH +=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb"=
, "", "--fix-v4bx", d)}"

Depends if we want to apply it on e.g. armv5te device without thumb in
TUNE_FEATURES.

> Or maybe it could just be fixed in the kernel, since its own build
> system already knows whether Thumb is available or not.

True, but then we need to fix every kernel recipe and because it took me
quite long time to find commit which caused it, I fear that it will
reappear in future when some layer adds kernel recipe without such fix.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i57Ucs80xkCVE1Ce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCvToIACgkQN1Ujt2V2gByKzwCfQBFQPp3+Mfk5+l1XFzYDGfU6
dEUAn1w5xCyuaU1QtqSCNRlv3ADdgAmD
=RPYu
-----END PGP SIGNATURE-----

--i57Ucs80xkCVE1Ce--
