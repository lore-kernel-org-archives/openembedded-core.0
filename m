Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4824D77215
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 06:31:15 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id cy9so52821636pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=z9NX0KqSuJsJztDWdLCVkDyvpFPu1IO8lloMqZYWSO8=;
	b=bOO0ZDbfznFMSrsm9ZtsopOby0ahOlkOd93sF3Qca5R+6yxOZa6Ra7FgS31olmyqlE
	Td7DtOBX630G8soU61Vt7LTxW5cpEqD4MQMTOpsE4XQQEFGUqpfKIqBc4sjMNphff+6T
	7JjT9jj6BtNQ/Zmp2DHbaJX3BZLPts3/DYHhR1CxTt+QPaOX8qpkkZ1VMenUeYQ+nJMj
	zvfm5W9KRcidD6ZprQ8ALY6uQ6aHqkQUS3+ma3dIFm9B7qGIS+j4VnroBjVhMeSkj71o
	asXXJLiLMXBybpRQ262T3KdGYr1c3nowKsFZsCW9s53MaSkVmV+D9TL8b8MvWDYtPeLi
	xNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=z9NX0KqSuJsJztDWdLCVkDyvpFPu1IO8lloMqZYWSO8=;
	b=S5kbS9vKkklI0+zkZBy7akFXZ57rrXPkPhKkVJUPFqqYS6/9mvZniOZC4vOb+je8q6
	WPTyZJuvO5sgBcvWTNPUGsZW63P8V0lsmptV7dbHxCpG0etXTLVqAjRRpVoz3RYkgo1x
	o0qkjc8KTgryffslbBAkRvWV9ovdkBhvPfON9q8GucBfJYxhnN8PBrC6VeHa+J99K7wR
	DJSQ3Z+Dm4GQ3f6So9owLw7cnphX1NTXcgbhJ6DmTlDGeke70QkM/kTKP2xEin3QNoYq
	LIHRBpn9rRubmcKTRZ8mCyjb5PWMKbjVB20shi2wVAS2idQaSBZMUms0e8U6rCwfrFLM
	cNpg==
X-Gm-Message-State: AG10YOTyjI5IzkeJC6+2xFmK5NMVvraL1ZtHZuWij8gavKrYniNkPp6NZ/2+w0+F2dF08A==
X-Received: by 10.66.102.97 with SMTP id fn1mr20028175pab.131.1454135476957;
	Fri, 29 Jan 2016 22:31:16 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	m70sm27627223pfi.90.2016.01.29.22.31.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 22:31:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1454135035.git.raj.khem@gmail.com>
Date: Fri, 29 Jan 2016 22:31:11 -0800
Message-Id: <7AEC4E63-7141-4250-81CE-69695BFBBC93@gmail.com>
References: <cover.1454135035.git.raj.khem@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH 0/2] binutils 2.26 upgrade
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
X-List-Received-Date: Sat, 30 Jan 2016 06:31:16 -0000
X-Groupsio-MsgNum: 77119
Content-Type: multipart/signed;
	boundary="Apple-Mail=_321514F8-A814-4458-99BD-195F31693979";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_321514F8-A814-4458-99BD-195F31693979
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 29, 2016, at 10:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Upgrade binutils to 2.26
> Fix gcc for ppc to not enforce spe by default to assembler
> use -mno-spe for 74xx
>=20
> Khem Raj (2):
>  gcc,qemuppc: Explicitly disable forcing SPE flags
>  binutils: Upgrade to 2.26

also available at

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/binuti=
ls-2.26

>=20
> meta/conf/distro/include/tcmode-default.inc        |    2 +-
> meta/conf/machine/include/tune-ppc7400.inc         |    2 +-
> meta/conf/machine/qemuppc.conf                     |    2 +
> .../{binutils-2.25.1.inc =3D> binutils-2.26.inc}     |   10 +-
> ...n_2.25.1.bb =3D> binutils-cross-canadian_2.26.bb} |    0
> ...tils-cross_2.25.1.bb =3D> binutils-cross_2.26.bb} |    0
> ...rosssdk_2.25.1.bb =3D> binutils-crosssdk_2.26.bb} |    0
> .../binutils/0001-Generate-relocatable-SDKs.patch  |   12 +-
> ...ure-widen-the-regexp-for-SH-architectures.patch |   14 +-
> .../0003-Point-scripts-location-to-libdir.patch    |   14 +-
> ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   12 +-
> .../0005-Explicitly-link-with-libm-on-uclibc.patch |   10 +-
> .../binutils/binutils/0006-Use-libtool-2.4.patch   | 2916 =
++++++++++++++++----
> ...7-Add-the-armv5e-architecture-to-binutils.patch |   10 +-
> ...he-distro-compiler-point-to-the-wrong-ins.patch |   10 +-
> ...s-of-system-directories-when-cross-linki.patch} |   93 +-
> ...-rpath-in-libtool-when-sysroot-is-enabled.patch |    6 +-
> ...Change-default-emulation-for-mips64-linux.patch |   14 +-
> .../0012-Add-XLP-instructions-support.patch        |  146 +-
> ...rnal-error-in-do_print_to_mapfile-seen-wi.patch |   35 -
> ...4-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch |   25 -
> ...-list-so-that-symbols-not-in-the-list-are.patch |  131 -
> ...h-adds-IFUNC-support-for-arm-gold-backend.patch | 1004 -------
> .../binutils/add-thunderx-support-for-gas.patch    |   33 -
> .../binutils/binutils/binutils-octeon3.patch       |  272 --
> .../{binutils_2.25.1.bb =3D> binutils_2.26.bb}       |    0
> ...AltiVec-generation-on-powepc-linux-target.patch |   24 +-
> 27 files changed, 2606 insertions(+), 2191 deletions(-)
> rename meta/recipes-devtools/binutils/{binutils-2.25.1.inc =3D> =
binutils-2.26.inc} (76%)
> rename =
meta/recipes-devtools/binutils/{binutils-cross-canadian_2.25.1.bb =3D> =
binutils-cross-canadian_2.26.bb} (100%)
> rename meta/recipes-devtools/binutils/{binutils-cross_2.25.1.bb =3D> =
binutils-cross_2.26.bb} (100%)
> rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.25.1.bb =3D> =
binutils-crosssdk_2.26.bb} (100%)
> rename =
meta/recipes-devtools/binutils/binutils/{0009-Upstream-Status-Inappropriat=
e-distribution-codesourc.patch =3D> =
0009-warn-for-uses-of-system-directories-when-cross-linki.patch} (82%)
> delete mode 100644 =
meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_p=
rint_to_mapfile-seen-wi.patch
> delete mode 100644 =
meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R=
_ARM_REL32.patch
> delete mode 100644 =
meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symb=
ols-not-in-the-list-are.patch
> delete mode 100644 =
meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support=
-for-arm-gold-backend.patch
> delete mode 100644 =
meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch=

> delete mode 100644 =
meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
> rename meta/recipes-devtools/binutils/{binutils_2.25.1.bb =3D> =
binutils_2.26.bb} (100%)
>=20
> --
> 2.7.0
>=20


--Apple-Mail=_321514F8-A814-4458-99BD-195F31693979
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlasWLMACgkQuwUzVZGdMxQv5ACeLW/pOUVtbdivn/mkxsCdSjR7
OlEAnilX4UPMaQn/ulX7yYLtvsybWMO5
=Q7sv
-----END PGP SIGNATURE-----

--Apple-Mail=_321514F8-A814-4458-99BD-195F31693979--
