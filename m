Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbB7l-0007uS-UF
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 14:13:27 +0100
Received: by eekb15 with SMTP id b15so1760589eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MZmG8/roA8FfPj89R/1bDqGh1mwUQIVHcxTORQY1C0U=;
	b=IqO0DyA/j7g4RChoGaei2C8Ju/5YblHyP0sQwafg1vp2uQ1bg8bW8oBkPBBIIcQHTQ
	gUwOlnAKdQhdjtFxlLW8ci4Ymc5seY1HNpulqUv6ys+G0cjj1UI4MqXu0zUgko6FL6bp
	2GG1KymFoCe2+myTf2X3TP50pUSgJfIUXWE8k=
Received: by 10.213.34.193 with SMTP id m1mr462466ebd.67.1323954388056;
	Thu, 15 Dec 2011 05:06:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm23965903eet.11.2011.12.15.05.06.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 05:06:27 -0800 (PST)
Date: Thu, 15 Dec 2011 14:06:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111215130615.GB4419@jama.jama.net>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
	<20111208154840.GD3761@jama.jama.net>
	<CAMKF1spHhLbMLtY9VhgrgQ4QwO06HEcnGSZrWj3mXLuif5gmFg@mail.gmail.com>
	<A2CA7F01-3A24-487E-AD78-C59389F667EB@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <A2CA7F01-3A24-487E-AD78-C59389F667EB@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
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
X-List-Received-Date: Thu, 15 Dec 2011 13:13:27 -0000
X-Groupsio-MsgNum: 14247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline

--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 10:29:17AM +0100, Koen Kooi wrote:
>=20
> Op 13 dec. 2011, om 21:01 heeft Khem Raj het volgende geschreven:
>=20
> > On Thu, Dec 8, 2011 at 7:48 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >>=20
> >> meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_arm=
v6 =3D " -D__SOFTFP__"
> >> meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_arm=
v7a =3D " -D__SOFTFP__"
> >=20
> > hmmm will this work if we have armv7-a + hard float ABI ?
>=20
> Or a better question: is it still needed or is ffi still broken?

What exactly was the issue? I didn't have this override since starting
shr-core and I haven't noticed any issues with python/libffi on
nokia900.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7p8McACgkQN1Ujt2V2gBxZtgCfYBKyTZHwfRDtBCJgmq2Tcr7N
gRUAn3ysKCH6ysBe8jHFZ5MF0l9TqYoH
=dwr+
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
