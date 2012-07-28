Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv3e6-0007s9-Hw
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 11:49:14 +0200
Received: by wibhm11 with SMTP id hm11so311681wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EMnjLkayISgbnmENLcA+KVl8zNIIoColHrQ44YdqRRQ=;
	b=rdjwAaGge73ukxZYzA1aCj5X8sqPMLKCjYFz9OV+0EgDgdbOVZ9axOl9HYmJIbLuRu
	TdReG2pdjlxu451caWsTf+0NKcZk0GnY7BPV3DrFlTz2bgG+g6EDXjGdOJoTZ3tQUSn6
	OZ2OIfQEAKoxRvvzZTnfy/0rmf022NDtYe1qoK+uFSzhElg1M3l5I9TZvSutg/Bj0GqF
	zsvLYug3+tnEYuBmK3jAmbRii7cSrxPpLOossXpk/TtI4I+9szgc1yX5losUwHQV/RnE
	kq8kmbEgZrJ1xMSpRzHBAn5QF8wqlHUaOGSA/qhpJJTaoK+sIKRYh2WFuYbp4s0Oo2rr
	wfLw==
Received: by 10.180.100.131 with SMTP id ey3mr12482721wib.15.1343468261643;
	Sat, 28 Jul 2012 02:37:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm3167345wiy.3.2012.07.28.02.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 02:37:40 -0700 (PDT)
Date: Sat, 28 Jul 2012 11:37:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120728093746.GE3742@jama.jama.net>
References: <1343307951.29991.27.camel@ted>
	<5013AACF.2010807@communistcode.co.uk>
	<20120728091614.GD3742@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120728091614.GD3742@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] lib/oe/lsb: Add basic LSB functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 09:49:14 -0000
X-Groupsio-MsgNum: 26431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline

--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 11:16:14AM +0200, Martin Jansa wrote:
> > by installing lsb_release. Archlinux 64.
> >=20
> > Should it check to see if it installed first and error otherwise? It=20
> > looks like it tries to do it here:
> >=20
> > +    try:
> > +        output, err =3D bb.process.run(['lsb_release', '-a'], stderr=
=3DPIPE)
> > +    except bb.process.CmdError as exc:
> > +        return
> >=20
> >=20
> > but it must be missing something.
>=20
> Same here, interesting is that it failed only during 2nd build, 1st
> with this commit applied finished fine.

Ah no, it was there also first time I've overlooked it as it's not
fatal.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlATsuoACgkQN1Ujt2V2gByQFwCfdNV/wLFYbdhpCFbcsQcGBZD0
sSUAnjj6Llzhynrfv7RtlP20dQsmnyvy
=CHDz
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
