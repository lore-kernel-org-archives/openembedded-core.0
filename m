Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rb7jW-0006pm-IG
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 10:36:10 +0100
Received: by wgbds11 with SMTP id ds11so3063563wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 01:29:12 -0800 (PST)
Received: by 10.216.132.105 with SMTP id n83mr397528wei.16.1323941352880;
	Thu, 15 Dec 2011 01:29:12 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fy13sm8293730wbb.18.2011.12.15.01.29.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 01:29:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 15 Dec 2011 10:29:17 +0100
In-Reply-To: <CAMKF1spHhLbMLtY9VhgrgQ4QwO06HEcnGSZrWj3mXLuif5gmFg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
	<20111208154840.GD3761@jama.jama.net>
	<CAMKF1spHhLbMLtY9VhgrgQ4QwO06HEcnGSZrWj3mXLuif5gmFg@mail.gmail.com>
Message-Id: <A2CA7F01-3A24-487E-AD78-C59389F667EB@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Thu, 15 Dec 2011 09:36:10 -0000
X-Groupsio-MsgNum: 14236
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CDCD7B6C-FBEA-441D-A9B6-3A90235E971E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CDCD7B6C-FBEA-441D-A9B6-3A90235E971E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 13 dec. 2011, om 21:01 heeft Khem Raj het volgende geschreven:

> On Thu, Dec 8, 2011 at 7:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>=20
>> =
meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv6 =
=3D " -D__SOFTFP__"
>> =
meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv7a =
=3D " -D__SOFTFP__"
>=20
> hmmm will this work if we have armv7-a + hard float ABI ?

Or a better question: is it still needed or is ffi still broken?


>=20
>> =
meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:EXTRA_OECONF_ar=
mv7a =3D " --enable-neon "
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_CDCD7B6C-FBEA-441D-A9B6-3A90235E971E
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7pve4ACgkQMkyGM64RGpEbtwCeL1nGXKY1MsYXzo5e0AXHR6CQ
ls4AnRnleu+raPJF9DqpigoJk2RasJuq
=ncnR
-----END PGP SIGNATURE-----

--Apple-Mail=_CDCD7B6C-FBEA-441D-A9B6-3A90235E971E--
