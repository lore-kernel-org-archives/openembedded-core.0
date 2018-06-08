Return-Path: <sascha-ml-linux-yocto-oe-core@silbe.org>
Received: from bbox.sascha.silbe.org (bbox.sascha.silbe.org [46.38.230.149])
	by mail.openembedded.org (Postfix) with ESMTP id 936ED65CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 19:27:24 +0000 (UTC)
Received: from twin.sascha.silbe.org (twin.sascha.silbe.org [192.168.1.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "twin.sascha.silbe.org",
	Issuer "stunnel Pseudo-CA" (verified OK))
	by bbox.sascha.silbe.org (Postfix) with ESMTPS id 662FDBEF6C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 21:27:24 +0200 (CEST)
Received: (nullmailer pid 17462 invoked by uid 8193);
	Fri, 08 Jun 2018 19:27:24 -0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <CANNYZj9uwH9erkgu8Of5xq6PTLfTqdTdnUJtqMbyqgJa1ONKzA@mail.gmail.com>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
	<CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
	<toeh8mdywfy.fsf@twin.sascha.silbe.org>
	<CANNYZj9uwH9erkgu8Of5xq6PTLfTqdTdnUJtqMbyqgJa1ONKzA@mail.gmail.com>
Date: Fri, 08 Jun 2018 21:27:05 +0200
Message-ID: <toeefhhyt86.fsf@twin.sascha.silbe.org>
MIME-Version: 1.0
From: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Fri, 08 Jun 2018 19:27:25 -0000
X-Groupsio-MsgNum: 112351
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> 2018-06-08 21:17 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
>>     python3 -c 'from gi.repository import GLib'
>
> May I ask, what is the use case for running this in the native
> context? Note that we explicitly disable generating introspection data
> on the native side (though the g-i class), and so you'll get the
> typelibs for the base glib that is bundled with g-i tarball, but not
> anything else.

We have some Python modules that we are extracting some information from
and generating documentation for at build time; both times the modules
get imported. We don't need GLib to actually work; it only needs to be
importable. Fortunately no other typelib is used by the code.

Sascha
=2D-=20
Softwareentwicklung Sascha Silbe, Niederhofenstra=C3=9Fe 5/1, 71229 Leonberg
https://se-silbe.de/
USt-IdNr.: DE281696641

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJbGtiKAAoJEMGPauiBMO2X5XMP/3HUqkVVE9eoRO0EG5zP/aoo
vW1Lual15WnC5rq2iHhyayL5jARCaJeYg+qo5UYRSUmmRBzyA2KIMAO8jTgDj1Vr
2YJfx2cwD8IT1UhAa6i0GXuI/adBbGbTE+bVtjb23on+5gsdyCRAjwGbtrIpMHj1
Oe2dlYOYpBbzgSv/PAp47Lu3rL696Ymu8eaqxkuS8uEIzwNlmg029bFJIkWJ12kg
MqWt0j0VsmEx4Czsg+5I2UcRaMCnGeQY3YZ5MpgOzZRaAGA74A9KZrwlCmMNTapS
XlJObgguJuIlWzCT/L7VFUh9sbCJfhRofmdKZCBIAA015SdSdjpf/os23IiDzLEZ
J3kqDUws/dxuPf4zSeqMsVzyw2pHI/ynsC34jX4s8doPXZNanChtRsvakgTXi664
J94sM91CeYY/06PL3WbY/bK8NorFhzKpsdEZwHVQa40mop8u4KIWs/nRnJMdQo0H
RELDObT8b8uYAOpARm0jVMHzirgVj1Pwt3m10XsRXanDhGb//s08Giswed0UIayT
eOvxYbo5GqFLNOJWkW91r/pgcDW1gdyOoW84YYUpx4afhLncpuZ7W38Dbz4FNvgG
YHzQfl4mToBD6qvWWWCW2nw47Ppjy7uECXsfbfuSG2nKvbSzD93ci4sjbJlbMKXt
YPP+fa1BfgNAXoNKa4NZ
=7ms9
-----END PGP SIGNATURE-----

--=-=-=--
