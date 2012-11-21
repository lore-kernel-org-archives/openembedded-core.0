Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbI2K-00081g-8D
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 22:40:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2896746eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 13:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=71DLGJnyOw6wd3dZysj8Hf9Ol7rwqdWf/fEJ4Cs34AY=;
	b=gz3RV5VtqmqG3sn7jXGyNIjE5hbSZ70+9KyHGImBfe66tDMpcW7yaiBJzkwUqnfoeR
	kII7+i/atefd9NhLGH/xlZiXSwcGLbtgq6z39NPXl/P57DYTMrfDGYfJ4e3Kjl5e/yjB
	3+Ct1sVaKzrr0//Ywrl8kPvXIdlB61nd3yXLk6pK6og22FnSoDbf7UUZ6vy/gD5m+sh9
	s0ZFoTRIFg+c6NYcdbja+SdND3Tb4hYfVOryjEmG8XCvN7mhXd9kPP6JlcmizlBaIRaT
	x2dqemHnDp8JfEIKWD+04wBCtX8iJLeSrWVcGXc4wLinxjVRYgpI9KKYI3XKwv2p2Wpo
	j6dg==
Received: by 10.14.205.3 with SMTP id i3mr49669628eeo.18.1353533202695;
	Wed, 21 Nov 2012 13:26:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm2706326eeg.4.2012.11.21.13.26.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 13:26:42 -0800 (PST)
Date: Wed, 21 Nov 2012 22:26:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20121121212638.GR12637@jama.jama.net>
References: <1353465025-13655-1-git-send-email-fupan.li@windriver.com>
	<20121121074659.GF12637@jama.jama.net>
	<50AC89D9.2080601@windriver.com> <50AD44B0.5040307@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50AD44B0.5040307@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] move the benchmark package bonnie++ from meta-oe layer to oe-core and upgrade bonnie++ from 1.03c to 1.03e
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
X-List-Received-Date: Wed, 21 Nov 2012 21:40:48 -0000
X-Groupsio-MsgNum: 31630
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a+0P3INHs7aeI7wh"
Content-Disposition: inline

--a+0P3INHs7aeI7wh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 04:16:32PM -0500, Randy MacLeod wrote:
> On 12-11-21 02:59 AM, fupan.li wrote:
> > On 11/21/2012 03:46 PM, Martin Jansa wrote:
> >> On Wed, Nov 21, 2012 at 10:30:25AM +0800, fupan.li@windriver.com wrote:
> >>> From: fli <fupan.li@windriver.com>
> >> Why do you think that bonnie++ is "core" enough to be in oe-core?
> >>
> >> Cheers,
> > I think it's better to afford those benchmark packages such as lmbench,
> > iozone3, bonnie++ and so on
> > in the oe-core, so that the users can benchmark its built system easily!
> > Benchmark test for an embedded system is essential, especially for those
> > projects based on the OE.
>=20
> Right it shouldn't be in oe-core, sorry for suggeting that Fupan.
> What do you suggest Martin? I haven't been following how people
> choose to make a YP layer or add things to meta-oe in OpenEmbedded.
>=20
> Should we make meta-benchmark layer for the YP or
> should we try to re-use:
> =20
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-bench=
mark
> =09
> d---------	bonnie
> d---------	cpuburn
> d---------	dbench
> d---------	fio
> d---------	iozone3
> d---------	iperf
> d---------	lmbench
> d---------	memtester
> d---------	nbench-byte
> d---------	netperf
> d---------	tiobench

Yes, using meta-oe is easiest way.

And bonnie is already there, so why to move it.

Cheers,


--a+0P3INHs7aeI7wh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCtRw4ACgkQN1Ujt2V2gBxD+wCgjw40TksJkGqcw0SBw+6CQCdC
vbsAoI5PZ2adW9wqgxFMGT64twsL5wMN
=5Bp/
-----END PGP SIGNATURE-----

--a+0P3INHs7aeI7wh--
