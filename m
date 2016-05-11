Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8917002B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 22:27:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e201so12200273wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 15:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MogDEWOdv7zxdmerbrODVHDK+ZKsDxxI/AW1W+DHBVQ=;
	b=XdnVXyXJhjqHAmbSvyCp5ucM5AfD6x7uCZzsiKTSZr6/NBnNErtZTOUBpc9aZaVlvY
	2iQghIJ3EipwvhvAHoHTWySkazwmKLXwpxlFOVM7iKBhF09FJBysEyZR3BUCZiyUU9p8
	noy3gh82BEE4vcyYMxWjRlipMWJF72KgsC3FZCIg/SFQYAXMQ+g3fvySbokDS3RKwGJO
	/9MJhiXC5j6UjIPdMew4PKMfrL8jOUuM8rCuOIQZl0jdi2PDY5f9P5B7dfJbRXHrFkVN
	B/l1TQt+Xm+xWQ04AKepmEercYNxQQxC3v5e22bP5k0elbWpLwEc1Jw8XuWrkU4zY5IO
	fMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MogDEWOdv7zxdmerbrODVHDK+ZKsDxxI/AW1W+DHBVQ=;
	b=N0OsDZPNEnByIlbx7eqTnCji/xvLWIMfhz5hX6R46zrS+V1k3PMZIlpE1NRFmmVvqD
	B4k07ITP61L2d8sY9iIcI6oIrmOfzZBIdQJ0iPVm3uk6loSRIULRh4KjLEPvalHLQAUy
	gIKlEaqPyZgdpbZw3b/rkVlAaZRicVPb9BkGBYPB+mCXARj4L2DsVuKyFAtoqCfkNgai
	T6j/igj3Wb6Ll4tfzv7kDrmrG1Tcv4YfwRIwmKxRwTqltJI4B4HWtBEJZN/cV5QhqWSX
	RoqFptmhOGAu6du1SUoCCFA4nI82559T2LDOmk1QEvughYQNkHFBZblW3hHSDLbBMJnZ
	KbDA==
X-Gm-Message-State: AOPr4FXHOJQ0PPu3kQrRSSYlnNiwLNPK04g3+vxwcnRyRiqWyQaikteHiU5WHdqz7XX0IQ==
X-Received: by 10.28.223.86 with SMTP id w83mr6855092wmg.95.1463005626716;
	Wed, 11 May 2016 15:27:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a75sm10606730wme.18.2016.05.11.15.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 May 2016 15:27:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 May 2016 00:27:35 +0200
To: Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <20160511222735.GC2798@jama>
References: <cover.1462972531.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1462972531.git.joshua.g.lock@intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH 0/1] Fido OpenSSL security upgrade
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
X-List-Received-Date: Wed, 11 May 2016 22:27:09 -0000
X-Groupsio-MsgNum: 81951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 02:18:03PM +0100, Joshua Lock wrote:
> Backport a patch from jethro for an OpenSSL upgrade to ensure recent CVE
> fixes are included.

Be aware that this upgrade changes the ABI of openssl because of the
changes in version-script.patch, so all the binaries built against
openssl from older fido revision may start failing to build/work. In our
builds we had 3 components (when testing upgrade to krogoth with this
version include) like this so it's not good to spread such breakage in
"release" branches.

As temporary work around I've partially reverted version-script.patch
changes to keep ABI as it was and only to add 2 new symbols required by
1.0.2h.
=20
> The following changes since commit fd27f8620ae4d95dfe07b27eee4256b0a12834=
8a:
>=20
>   gtk+_2.24.25: backport a fix for building with newer host perl (2016-05=
-06 15:51:15 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djoshuagl/fido-next
>=20
> Robert Yang (1):
>   openssl: 1.0.2d -> 1.0.2h (mainly for CVEs)
>=20
>  .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ---
>  ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 ----
>  .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 --
>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ---
>  .../openssl/openssl/CVE-2015-3197.patch            |  63 ---
>  .../openssl/openssl/CVE-2016-0701_1.patch          | 102 ----
>  .../openssl/openssl/CVE-2016-0701_2.patch          | 156 ------
>  .../openssl/openssl/CVE-2016-0800.patch            | 198 -------
>  .../openssl/openssl/CVE-2016-0800_2.patch          | 592 ---------------=
------
>  .../openssl/openssl/CVE-2016-0800_3.patch          | 503 ---------------=
--
>  .../openssl/crypto_use_bigint_in_x86-64_perl.patch |  14 +-
>  .../openssl/debian1.0.2/block_diginotar.patch      |  17 +-
>  .../{debian =3D> debian1.0.2}/version-script.patch   |  35 +-
>  ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  14 +-
>  .../{openssl_1.0.2d.bb =3D> openssl_1.0.2h.bb}       |  18 +-
>  15 files changed, 40 insertions(+), 1950 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-te=
st-for-CVE-2015-3194.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-31=
93-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-31=
94-1-Add-PSS-parameter-check.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-31=
95-Fix-leak-with-ASN.1-combine.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-31=
97.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-07=
01_1.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-07=
01_2.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-08=
00.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-08=
00_2.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-08=
00_3.patch
>  rename meta/recipes-connectivity/openssl/openssl/{debian =3D> debian1.0.=
2}/version-script.patch (99%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb =3D> openssl=
_1.0.2h.bb} (67%)
>=20
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlczsdAACgkQN1Ujt2V2gBy5fgCgkLO/mfxdtgz8YR7TgrstRUiq
DAgAn0uUBNaBbHniolICTzip6za5V6vi
=DbiR
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
