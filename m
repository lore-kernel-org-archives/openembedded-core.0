Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 358BC60234
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 19:46:11 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A3KZNZR0boSH/0fjysmDT+DRfVm0co7zxezQtwd8Z?=
	=?us-ascii?q?seMeLvad9pjvdHbS+e9qxAeQG96KsLQZ0aGL4+jJYi8p2d65qncMcZhBBVcuqP?=
	=?us-ascii?q?49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6?=
	=?us-ascii?q?JvjvGo7Vks+7y/2+94fdbghMijexe7N/IAu5oQjRtcQdnJdvJLs2xhbVuHVDZv?=
	=?us-ascii?q?5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3so5MLwrhnM?=
	=?us-ascii?q?URGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RTKv5LpwRRT2lC?=
	=?us-ascii?q?kIKSI28GDPisxxkq1bpg6hpwdiyILQeY2ZKeZycr/Ycd4cWGFPXNteVzZZD42h?=
	=?us-ascii?q?cYUPAeoPPeFboYfzqVQBohmxChW3CePg1jNFnHj40bE03ukhFwzNwQwuH8gJsH?=
	=?us-ascii?q?TRtNj4Kr0dUfqxzKnP1jXIcu9b2TPm54fWaBAhvfaMVq92f8rW0UkgCQLEhUiK?=
	=?us-ascii?q?p4P7JTOayOUMuHWc4uV8UeKvjHYnpB9wozW0x8cshZPGhoYUyl/e7yl23IE1Jd?=
	=?us-ascii?q?ihRUN9fNWqHpxQtySAOIt3RMMvW2FpuCEmxb0avp67ZDIKyJMlxxHBd/OHb5KE?=
	=?us-ascii?q?4hX5VOaeOTt4i3NleK6/hxav6kes0PHzVs6x0FtMsyFLkcHMu2gJ2hDO8MSLV+?=
	=?us-ascii?q?Zx80W71TuL0w3f8PxILEA0mKbDL5Mt36Q8mocOvUnBBCP6hUr7gLWLekgi5+Om?=
	=?us-ascii?q?8f7oYq/8qZ+ZL4J0jwb+PbkwlcGnGuQ4NxQOX3Cc+eShyL3v5U35T6tOjv0xiq?=
	=?us-ascii?q?TZvorVJcIap664BQ9azJwv6xewDzi81NQYnGMIIEhZdxKAiojlI1DOIPbmAvej?=
	=?us-ascii?q?m1mhlCpny+rbMrH8AJjBNHzOnbP7cbpg60NRyBI/zdVF6JJVDrEBLujzWkj0tN?=
	=?us-ascii?q?HAEhA5Nwu0w/75B9R8zY4eWG2PDbWdMKPTq1CE/P4gI+6JZIMNojbyN+Al5+Ly?=
	=?us-ascii?q?jX8+gVIderGp0oURaH+mG/RpOFuWbmfxjdgfDGgGpxYxTOvwiFKcSjNTY3eyX7?=
	=?us-ascii?q?kg5jEgEo6mCp/DSZ6rgLOf2Se0BYNZaX1bBV+SDHjkbYKEW+0DaCiKOM9ujiQE?=
	=?us-ascii?q?VaS9S48mzRyurhX1y7h9IurX+i0Xq5fj2cN65+3Wjx4y9Dh0A96B3GGKSmEn1l?=
	=?us-ascii?q?8PEhw20aU3m0V/ggOZ2Ko+gPxVEPRc4vpIVkExMpuKnMJgDNWncQvbetCSAH+i?=
	=?us-ascii?q?SNi8HTZ5atUpzs1GW0tnFsfq2hvH2DKnEZcUmLWPBZVy+aXZiSuib/1hwmrLgf?=
	=?us-ascii?q?Fyx2ItRdFCYCj/3vZy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DnAgAYZkhY/5tjdVteGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBFAEBAQEBAQEBAQEBBwEBAQEBgw4BAQEBAR9agQeNSJcQknCCD4I?=
	=?us-ascii?q?HKYUvSgKBez8UAQEBAQEBAQEBAQFhKIIzGgGCGwEFeRALGCMLVwYNCAKIbwEJq?=
	=?us-ascii?q?mCLNQEBAQEBAQEDAQEBAQEBEw6CMYQNgX0IglaKKQWaZ4NggXxyik2Bc1CELYl?=
	=?us-ascii?q?QkhMfNzBIEw6EEIFGihEBAQE?=
X-IPAS-Result: =?us-ascii?q?A2DnAgAYZkhY/5tjdVteGQEBAQEBAQEBAQEBBwEBAQEBFAE?=
	=?us-ascii?q?BAQEBAQEBAQEBBwEBAQEBgw4BAQEBAR9agQeNSJcQknCCD4IHKYUvSgKBez8UA?=
	=?us-ascii?q?QEBAQEBAQEBAQFhKIIzGgGCGwEFeRALGCMLVwYNCAKIbwEJqmCLNQEBAQEBAQE?=
	=?us-ascii?q?DAQEBAQEBEw6CMYQNgX0IglaKKQWaZ4NggXxyik2Bc1CELYlQkhMfNzBIEw6EE?=
	=?us-ascii?q?IFGihEBAQE?=
X-IronPort-AV: E=Sophos;i="5.33,315,1477954800"; 
	d="asc'?scan'208";a="218505211"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 07 Dec 2016 20:46:11 +0100
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cEiAN-0005Ow-J9; Wed, 07 Dec 2016 20:46:11 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <1478627553-13710-1-git-send-email-clopez@igalia.com>
	<D1A701D4-6205-498C-9A83-C65F7542F91E@gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
X-Enigmail-Draft-Status: N1110
Organization: Igalia S.L.
Message-ID: <33b8cb66-7285-cfbb-6424-f86b319bf24b@igalia.com>
Date: Wed, 7 Dec 2016 20:46:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <D1A701D4-6205-498C-9A83-C65F7542F91E@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
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
X-List-Received-Date: Wed, 07 Dec 2016 19:46:13 -0000
X-Groupsio-MsgNum: 90410
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="mXGx0IwCAUgg4ftirFGRdoskoWhwQ65bQ"

--mXGx0IwCAUgg4ftirFGRdoskoWhwQ65bQ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 05/12/16 23:56, Khem Raj wrote:
> Carlos
>=20
> webkitgtk fails now e.g. see
>=20
> http://errors.yoctoproject.org/Errors/Details/111221/ <http://errors.yo=
ctoproject.org/Errors/Details/111221/>
>=20
> fatal error: 'stdlib.h' file not found
> #include_next <stdlib.h>
>=20
> This is when building with clang, I think its too early to drop this pa=
tch.=20

Hi,

I thought this was an issue only with GCC ...

Some questions:
 * Which version of clang is used ?
 * The clang toolchain used is the one from the
https://github.com/kraj/meta-clang layer ?


I don't have a fix for it at this moment, and investigating it would
require time. So I think is fine to reintroduce the patch
0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch (If possible,
please change the commit message on the patch to tell that this an issue
now only when building with clang).


Thanks


--mXGx0IwCAUgg4ftirFGRdoskoWhwQ65bQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJYSGb6AAoJEJZQic5rlfiCCsYQALPXqZcF1l/p3WaT6ytpqzVu
PntA7mBK8cwBaAyLio0Vj4N4kASVlDNVlaWQPSV/h+jA5C7kwHwQpjgP4RHTjG8x
fFCveqnQyYEs+X8Q5iKQCUg1f6Zcgc+/hFQsFNoJyNw43uogeiWvzNWKWEXlELP6
2vUtgkv1MSflVSQ+dPGDTIAWuc+6CAYuz/Uq0adGRG/0qYrUD/EyhX8POHcmMa13
thyLWFANqAUE0p1LRz5UhRR7hJHjVwy/lUZkW92xVyD9dYHuKGMkxmPllLM3nvXV
mxeij9UrUi9UrdEhcBfhtQnt+mVFVj11+Bpw9M38HpHZDeexR8T+vjItWJrdv/V2
nwlh2ne7VEbRq/bgAVcVrCy4XQXUd9jou3iONS97HyxN5MeR8Q4mJGElwguUBxiU
o6iXpsSv0s0rNLeXgAoDSsq5YYpITuXw4cDyIlg1l17jSeJuNjESW5eXB0t5KVda
iCIaye7uSRKrkJwVg1jCb9+CWH7iCAEVR9nH1t8igkw1Hm/FGbiDT+3f6BkYfC+P
tD5ZoWi7mBBDD7MrXoBamBDjXOsh1/Idl4kRk85yf4g99d7FAKB1xgWanvptjLBX
spzg7o2kvJmJ7urguTD1RtH/GFNCEcWYL08gnzegebDQi8iAl12B8uVgVdp++BSs
863ECjD3w7CX6ee1mMpo
=r5WU
-----END PGP SIGNATURE-----

--mXGx0IwCAUgg4ftirFGRdoskoWhwQ65bQ--
