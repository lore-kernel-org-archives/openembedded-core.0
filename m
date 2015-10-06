Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 18A5465D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 16:18:38 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CCEADN8xNW/5tjdVteGQECAQGDCYFChUu0N4REGYEthhoCgTg8EAEBAQEBAQGBCoQlAQEEI1URCxgJFgsCAgkDAgECAUUGDQYCAoguAatflC0BCwEfhnOEfoUUgmmBRQEElgSCTYFhiGmbbjgrgkSBQDwziD8BAQE
X-IPAS-Result: A2CCEADN8xNW/5tjdVteGQECAQGDCYFChUu0N4REGYEthhoCgTg8EAEBAQEBAQGBCoQlAQEEI1URCxgJFgsCAgkDAgECAUUGDQYCAoguAatflC0BCwEfhnOEfoUUgmmBRQEElgSCTYFhiGmbbjgrgkSBQDwziD8BAQE
X-IronPort-AV: E=Sophos;i="5.17,644,1437429600"; 
	d="asc'?scan'208";a="31245649"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 06 Oct 2015 18:18:37 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1ZjUwn-0005Bc-N8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 18:18:37 +0200
Received: from ip149.dynamic.igalia.com ([192.168.10.149])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZjUwn-0004F1-HZ for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 18:18:37 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
references: <1444143620-7764-1-git-send-email-clopez@igalia.com>
	<CAJTo0LZ9gmfcoOCBLWoBejQ_q6+66UXgPcHv3c=AUE8qOGPWyw@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
organization: Igalia S.L.
message-id: <5613F457.9080804@igalia.com>
Date: Tue, 6 Oct 2015 18:18:31 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <CAJTo0LZ9gmfcoOCBLWoBejQ_q6+66UXgPcHv3c=AUE8qOGPWyw@mail.gmail.com>
Subject: Re: [PATCH] machine/qemu: Fix OpenGL/GLX support with xserver-xorg.
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
X-List-Received-Date: Tue, 06 Oct 2015 16:18:41 -0000
X-Groupsio-MsgNum: 71958
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="doCMGWsXTp2dsk9sk3mAQ1wpwPlG0cFuT"

--doCMGWsXTp2dsk9sk3mAQ1wpwPlG0cFuT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/10/15 18:12, Burton, Ross wrote:
> On 6 October 2015 at 16:00, Carlos Alberto Lopez Perez <clopez@igalia.c=
om>
> wrote:
>=20
>>       root@qemux86:~# glxinfo | grep " render"
>>       direct rendering: Yes
>>       OpenGL renderer string: Software Rasterizer
>>
>=20
> "Works" being a relative term for the old non-LLVM software renderer ;)=

>=20
> Ross
>=20

Indeed, that is something that I also would like to fix.

In any case, now I'm able to execute GL apps within qemu using the
runqemu script, so is quite an improvement from the previous status-quo.


--doCMGWsXTp2dsk9sk3mAQ1wpwPlG0cFuT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJWE/RXAAoJEJZQic5rlfiCARYQAMFWkFec2q/82qtGdWnaKqcV
BFk9OB+R15+9rpe8v3K6MXZAKYUZ6JLseWJnPfsu6oIRXdrLNu4+XHvF/aftTe8c
VvTW2VoOXeiPVtVFdhClR9BLSeSBAK/nKYEQBzAqEJLlfepCqjK6yOKgK1S250zr
wXdA9gZjCyCN8Z1IVoB/bNn03CmhTXM6tBFtPWcH8/1HtRDOZcApD1QCuls+g4U1
nzQfO7pSPEdBxif6T3abv0PwjEDISdQVjW+WHcnOL9fcjXB2vgx75IQchjhX9OBr
vWVn7Q3+rvq/1vVSm1Jemw36I+OrPYqcRfjj0bTcYmdgeBVwQFSzhLP7m+0m2jcF
Yv3WJh2U0LCZuJge/hnZRunbucCvLNotw8GVr0ME3GC42Y5TCCDQZLjmzKY0Gbfk
YHq9f4/OVBSgQ7ObgCJrtB/XxXaK8QmIMagOBux3UA0l0fwtMYTetSgTnZM7vLuc
JeJdN42E9cFUuZOIZ9Q1iKRJTJx6cEZiXUjPDRf6glOZ46J4QqYokQk6+GjrAoc2
OtymUYhco1fSvTcAey5BEqs5nJ1dvxqWYmuIy04QYa1Algaf0KawYdHxrKqmZdnf
6ZFm9u6ompq028fDv/4Dg0LtJWuZWSA1ayVUDcHE2Zeym5Se4KutIY9f82Mw1aLC
45y3DYeukkYC11BPSkmX
=egwg
-----END PGP SIGNATURE-----

--doCMGWsXTp2dsk9sk3mAQ1wpwPlG0cFuT--
