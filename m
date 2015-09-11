Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id BE44E73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 16:46:47 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AHBQBcBPNV/5tjdVtdGQEBAYMHhGeCIL0QglYCgVY7EQEBAQEBAQGBCoQkAQEEI1UBEAsOCgkWCwICCQMCAQIBRQYNCAKILgG4M5QcAQEBAQEFAQEBAR6Gc4R9hQ0HgmmBQwEEkjODI4JDgV2IWpp5NyyEAzyKUgEBAQ
X-IPAS-Result: A2AHBQBcBPNV/5tjdVtdGQEBAYMHhGeCIL0QglYCgVY7EQEBAQEBAQGBCoQkAQEEI1UBEAsOCgkWCwICCQMCAQIBRQYNCAKILgG4M5QcAQEBAQEFAQEBAR6Gc4R9hQ0HgmmBQwEEkjODI4JDgV2IWpp5NyyEAzyKUgEBAQ
X-IronPort-AV: E=Sophos;i="5.17,511,1437429600"; 
	d="asc'?scan'208";a="20692656"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 11 Sep 2015 18:46:47 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1ZaRTL-0000KJ-15; Fri, 11 Sep 2015 18:46:47 +0200
Received: from fanzine.local.igalia.com ([192.168.10.13] helo=[10.76.0.14])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZaRTK-0001gt-RB; Fri, 11 Sep 2015 18:46:46 +0200
To: Phil Blundell <pb@pbcl.net>
references: <1441975783-21782-1-git-send-email-clopez@igalia.com>
	<1441983077.31676.17.camel@pbcl.net>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
x-enigmail-draft-status: N1110
organization: Igalia S.L.
message-id: <55F30575.5060900@igalia.com>
Date: Fri, 11 Sep 2015 18:46:45 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <1441983077.31676.17.camel@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Fri, 11 Sep 2015 16:46:50 -0000
X-Groupsio-MsgNum: 71015
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="3tpGvkFRfjOWm3A1jcjKBKk29BXWk00ho"

--3tpGvkFRfjOWm3A1jcjKBKk29BXWk00ho
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/09/15 16:51, Phil Blundell wrote:
> On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez wrote:
>>   * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
>>     will fail to build with this error:
>>
>>     ld: error: matchbox-keyboard-image.o: requires unsupported dynamic=

>>                reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
>=20
> This is only an issue for ARM (and only for Thumb2 at that).  I don't
> think it's necessarily appropriate to force -fPIC on all targets.
>=20
> Also, before adding this sort of hack it would be worth verifying
> whether this is in fact a toolchain bug and, if it is, fixing it there.=

>=20
> p.
>=20
>=20
>=20

If you (or somebody else) want to investigate whether this is a bug on
the toolchain or not, I can give you more data:

* I forced GCC 4.9 (GCC 5.X was failing to build the kernel, and I don't
bothered with it).

$ grep GCCVERSION conf/local.conf
GCCVERSION =3D "4.9%"

* The target machine is a Freescale imx6qsabresd board, so I also used
the meta-freescale layer (master)

If you need more details, let me know.

I'm not bothering more with this, as the above patch is good enough for
me. Feel free to take it or not, or to contribute a better one if you wis=
h.

Regards.


--3tpGvkFRfjOWm3A1jcjKBKk29BXWk00ho
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJV8wV2AAoJEJZQic5rlfiCN9kP/1rElGaQEx5tkWY1jw+eKp93
YcdEE6th51+qWML3KOEk5xI/S0EGMNkcQDb/xrHXGgehG4uY61+P58nhdsNptki6
gYEQLNFxssPkDJRQtSAgt22PoVcGxlPh+55sKLDk+6jTaOXFPe7yUufA8Yg4K10c
nnI3xxG9UgNrMU5SailTHoRwd0u7GpDU9RH+dx2qeKELFKHlg2828y0kH8IXyGGS
47PWag19rTxQoH6wFHk8gu+XIgggvNRafBYHHAd+puZz60BqLAKNmwI1GBaOT2j1
7xTiFGM1EZ91P7VJ2zZHr8PVMb7/fKKcasXQrIs/1lVilbbeJsfAqyNPmzgNeV9o
/gNCOhx6SKXs5pJX8Qhnw5386bzTSj+anWrsuLNKBoOP74DZ0XcXAJS+EGJnVPLS
47DcXrpZkiCJouz6kilf3WDYXOnzq1yvHo8MNPaWcQbS1KmmrE8Bi8R7O64Pr1zR
2nQj5ec6G9YJSY8Pm0TWfOKErddFi6ztxnVxHAyAY7fqmgtj28YeMioicpJKGijm
tPy9w0Pq0jNnUtwgeqLKBYk9tU/6D0nM/hrYjsu7JGNdLEvcr/I5YpCCTHaqALWu
H4uKCJedsoGn2MnUTgWCSghOjPPtFhtOFcP83bLV9qBike/CwaXzT4z3o1fezBJs
aKBthdy3pwTKoakZpShs
=U2fO
-----END PGP SIGNATURE-----

--3tpGvkFRfjOWm3A1jcjKBKk29BXWk00ho--
