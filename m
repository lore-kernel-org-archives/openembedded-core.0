Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id C6F2C614F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:26:24 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so3082320ead.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6oYyy1B3Rrr+yxVwzYFLaHDuMXCsHyrSqrboJ7I5WDg=;
	b=Fskgpk5b8azBVrDtODZ8ZnfxCvfuAkJIULe04IHMs03f9V7t4lmL+vOFZ1ysqK5MqE
	B80YVJ9+ktbPxQV3RmXnbTy9i50qDvnc1qI0TDg8YBCF2RgBdjQpo4M8wBGq6Fd7VL1u
	UN+JLLeqe0tIhDITJJOsdtmOcuigtlZeP85GYZlh3sXCtGZamRkXcnQepwsggdiCsCyr
	ln6B+GKOzrYMfp9jxDkW8aDXuMvi8xqG9zNN/HHVqTLUXSR8559aC8CvpXGGqlpvpDVT
	snlQzgCWGLxQGO33T7grf4D//wRDBukHYUCWPps0TLjGu3nujBPzEHaFXC0jNensZm6Q
	v57g==
X-Received: by 10.14.122.132 with SMTP id t4mr30227347eeh.20.1378729585368;
	Mon, 09 Sep 2013 05:26:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm21642230eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 05:26:24 -0700 (PDT)
Date: Mon, 9 Sep 2013 14:27:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130909122749.GR11500@jama>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAJTo0LYqNZjnuKtp8yJbZ+G7jQhBO1fq04Le=JZd+zRFNWkwmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYqNZjnuKtp8yJbZ+G7jQhBO1fq04Le=JZd+zRFNWkwmg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Mon, 09 Sep 2013 12:26:25 -0000
X-Groupsio-MsgNum: 44697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Isdj7O9hWi8F9Bn"
Content-Disposition: inline

--/Isdj7O9hWi8F9Bn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2013 at 01:16:44PM +0100, Burton, Ross wrote:
> On 9 September 2013 13:12, Burton, Ross <ross.burton@intel.com> wrote:
> > I'd always understood the "opengl" DISTRO_FEATURE to mean "give me GL
> > support".  *What* that means depends on the target hardware, could be
> > entirely software rendering through Mesa or binary HW drivers.
>=20
> Forgot to say the rationale for the check is the same as the libX11
> DISTRO_FEATURES check: a distribution asking for no opengl shouldn't
> be building a GL stack, and aborting if that happens ensures that the
> appropriate checks are in place.

OK fair enough, thanks for explanation, it's time to add opengl in my
DISTRO_FEATURES if I haven't done it already :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Isdj7O9hWi8F9Bn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlItvsUACgkQN1Ujt2V2gBw8mgCgrXTsH/cmSd6odzTGH+6Z3nKg
g6IAnRwdEBbHsTwRhJBHpj4fBatGRoCF
=U6+k
-----END PGP SIGNATURE-----

--/Isdj7O9hWi8F9Bn--
