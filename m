Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id C05C16E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 23:02:06 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AYBQDXUPdV/5tjdVtdGQEBAYMHVGMGhUq4CIFxhgECgT85EwEBAQEBAQGBCoQkAQEEeAEQCxgJFg8JAwIBAgFFBgEMBgICiC4BA8s2AQEBAQEBBAEBAQEBARyGc4R9hQ0HhCwBBJVZgkaBXWqHcYIQApE8hzIjAz2EA2+KKgEBAQ
X-IPAS-Result: A2AYBQDXUPdV/5tjdVtdGQEBAYMHVGMGhUq4CIFxhgECgT85EwEBAQEBAQGBCoQkAQEEeAEQCxgJFg8JAwIBAgFFBgEMBgICiC4BA8s2AQEBAQEBBAEBAQEBARyGc4R9hQ0HhCwBBJVZgkaBXWqHcYIQApE8hzIjAz2EA2+KKgEBAQ
X-IronPort-AV: E=Sophos;i="5.17,531,1437429600"; 
	d="asc'?scan'208";a="21845608"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Sep 2015 01:02:04 +0200
Received: from 24.28.165.83.dynamic.mundo-r.com ([83.165.28.24]
	helo=[192.168.0.12]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZbclA-0000kj-Os; Tue, 15 Sep 2015 01:02:04 +0200
To: Khem Raj <raj.khem@gmail.com>, Phil Blundell <pb@pbcl.net>
references: <1441975783-21782-1-git-send-email-clopez@igalia.com>
	<1441983077.31676.17.camel@pbcl.net>
	<E1DF44AB-9219-4848-9031-60846FC2BF7B@gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
x-enigmail-draft-status: N1110
organization: Igalia S.L.
message-id: <55F751DA.1020903@igalia.com>
Date: Tue, 15 Sep 2015 01:01:46 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <E1DF44AB-9219-4848-9031-60846FC2BF7B@gmail.com>
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
X-List-Received-Date: Mon, 14 Sep 2015 23:02:08 -0000
X-Groupsio-MsgNum: 71085
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="VoAu2EiRWULhJqa27TiMwstcLci0sSNf2"

--VoAu2EiRWULhJqa27TiMwstcLci0sSNf2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 14/09/15 09:24, Khem Raj wrote:
>=20
>> On Sep 11, 2015, at 7:51 AM, Phil Blundell <pb@pbcl.net> wrote:
>>
>> On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez wrote:
>>>  * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
>>>    will fail to build with this error:
>>>
>>>    ld: error: matchbox-keyboard-image.o: requires unsupported dynamic=

>>>               reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
>>
>> This is only an issue for ARM (and only for Thumb2 at that).  I don't
>> think it's necessarily appropriate to force -fPIC on all targets.
>>
>> Also, before adding this sort of hack it would be worth verifying
>> whether this is in fact a toolchain bug and, if it is, fixing it there=
=2E
>>
>=20
> This may not be a toolchain bug if there is a MOVW_ABS relocation being=
 emitted
> into an object that is eventually linked into shared library. Using -fP=
IC seems to be right fix
> I know bfd linker silently ignored these relocations and generated bad =
=2Eso files but that was fixed
> several years ago. So I think what needs to be looked at is why does sa=
me .o links ok with bfd linker
> is it some linker trampoline code thats in question here which may be d=
ifferent between gold and ld
>=20
> Carlos
>=20
> Can you check the linker cmdline of failing link step and see if its ge=
nerating a shared object there ?
> if thats the case and I assume gcc is generating this relocation into b=
oth
>=20

It looks is generating an executable (matchbox-keyboard).

Full log: http://sprunge.us/VPIN


--VoAu2EiRWULhJqa27TiMwstcLci0sSNf2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJV91HhAAoJEJZQic5rlfiCy/IQAIF9u2ypeCe9rdrnUID2MQ7Q
jf9Ru5FHtyrN0cx74I4TXi3L8A6JDgBaBsR9N4KJ5tyjT3/QmTynJmtU/Ah4I1y6
ep8P/qJyiPZZPHdha6LcRd6NgMiT/2yNYv5LhfWviO1yx+uLrjjuodMZTQv5adjT
ZWb0+hLpd6AI0TJZ1KXeyDvjuWTVe1774WAYP5AbIRMiXTh4XOVexknQIpBhJhQz
n89+jk1QyI7MtwCWp/LpqQvOQ1AIULHiVjKk1MEg1MjRt2Ceu1PQQL8juiGhYoJw
UEJz5qZzqP0yPxnfc+VRIZcfVcrIM9VeFnrc/xyhMraIzhHMuj4N/sLMO2p4YBGP
QrDkqHPU8CqfnO6dJq8tH38IFgA2RWlq8gCTAI4tq5+jXyn8be9qUNwMBgcb2rvJ
AnfRZCYH22QPYwzJVFIXQ9Zv8yJOid4GI8oSvQ7zedogk27vSXAFCGPrttwCzR0c
gjy9UcZA2mfF9f+QxoPzwOIGw8KSmHQSutsBYg1gGmFS4dZzhAsOT/+vTCXIR5Zc
JEKROfStEmtCXHL0W4fmlAZOCxMTJvZkP2K7PGeh6w2T0j9lEEtT3Sa4lgO+G9Uf
r36R1aUB9Zv44TyMuG1nUm7FWPFZ0nyk+CtD4x9HLVR7nymqBIeYZm6WTax6ejLI
F0w9L+F9q4/h2J6wayhl
=WjZX
-----END PGP SIGNATURE-----

--VoAu2EiRWULhJqa27TiMwstcLci0sSNf2--
