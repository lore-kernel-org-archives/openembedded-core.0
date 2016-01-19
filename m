Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id E98E66FFAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 06:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:Reply-To:To:From;
	bh=AgHh8Xc3lTbom9M0hk/2K9OCYtOXQk/B07tUKm9L3+o=; 
	b=V6X+zRLttKQMHkHOrkTCUFZ8lNa7/SYwaP3OFOLJ5m8GTf1KhhnBohfKsiMb5L3zS5KAx5Ho0glZYkeP6rXWej7zo9ZTgKh5iaERi5lofTSJnh/tX9Dd+eCQXCyFZ3u4b2guekesldIhsC3mhG4xnLCS22MlKNT1w5kqlNyoRb8i9UrI0sn/2wYu0IFXhRgfC7wddHmA/LV2HCUk6cCNJXtbhbDWmyYAKfs0P1sNJXmbjBI4/iKpFqF56kLXjyvRM/LOPb2INnRaggSEpvrMJgYug4oXolol5aWbyxasvPxp8AjKcviuPHhhoG39BT6xQJ/86IIE9ytwNfWvzbC8WA==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1aLPbH-0001NY-Jn; Tue, 19 Jan 2016 09:17:08 +0300
From: Roman Khimov <roman@khimov.ru>
To: Khem Raj <raj.khem@gmail.com>
Reply-To: roman@khimov.ru
Date: Tue, 19 Jan 2016 09:17:01 +0300
Message-ID: <1616789.GRtlt9rzHW@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <F049320E-FDD3-4EBE-B25E-CA431E699223@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
	<1564093.TSl0G7yhEJ@masala.hex>
	<F049320E-FDD3-4EBE-B25E-CA431E699223@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/73] mtools: Fix build with uclibc
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
X-List-Received-Date: Tue, 19 Jan 2016 06:17:11 -0000
X-Groupsio-MsgNum: 76376
Content-Type: multipart/signed; boundary="nextPart5173019.LsrblCmeVo";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart5173019.LsrblCmeVo
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 18 =D1=8F=D0=BD=
=D0=B2=D0=B0=D1=80=D1=8F 2016 13:51:36 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> > And from what I remember, I had some issue building native package =
with
> > 'DEPENDS +=3D'. Although that's an old branch and probably things a=
re
> > different now.
>=20
> I guess what you might have seen is that there is no provider for
> libiconv-native which is already fixed by
> https://github.com/kraj/openembedded-core/commit/a5e6f5939c0ee4280eab=
d7cfc01
> 131052040bc81
>=20
> if it was something else. Please report with more details.

True, it was something like that. If that's already fixed, then everyth=
ing is=20
perfect. Will this kind of patches go to jethro?

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart5173019.LsrblCmeVo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlad1OIACgkQXJ70z+XgVcOV3ACfe4oqv5ZKrJPvz+VJIKG8Hiy8
HkAAnRveVyayuXbo0ZEQTp8l0GTnskHm
=wcGh
-----END PGP SIGNATURE-----

--nextPart5173019.LsrblCmeVo--
