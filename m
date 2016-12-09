Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C007460722
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 16:21:23 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 09 Dec 2016 08:21:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; 
	d="asc'?scan'208";a="38585760"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.142])
	([10.219.5.142])
	by orsmga004.jf.intel.com with ESMTP; 09 Dec 2016 08:21:24 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
	<5840A839.5070704@linux.intel.com>
	<CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
	<584991B7.9050603@linux.intel.com>
	<CAJ86T=We5bfDF6EpGs_sPph16O=Niz+ei5vADWbMTXzsTq-C8g@mail.gmail.com>
	<CAJTo0LYUhvxCxhLAcbwFcnxJSx856DnZBLPjqUHXoW2FAvkQVg@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <584ADA83.9070709@linux.intel.com>
Date: Fri, 9 Dec 2016 10:23:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYUhvxCxhLAcbwFcnxJSx856DnZBLPjqUHXoW2FAvkQVg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Fri, 09 Dec 2016 16:21:25 -0000
X-Groupsio-MsgNum: 90582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="lwvOd0ilMTjbqwbCNO7n0KRR1WpcFR9Hm"

--lwvOd0ilMTjbqwbCNO7n0KRR1WpcFR9Hm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 12/08/2016 02:35 PM, Burton, Ross wrote:
> On 8 December 2016 at 19:16, Andre McCurdy <armccurdy@gmail.com> wrote:=

>=20
>> Is it correct that native sstate from a host with gcc < 4.9 should be
>> reused by a host with gcc >=3D 4.9 ?
>>
>> Doesn't the change in NATIVELSBSTRING prevent that from happening?
>>
>=20
> Yes, we recently landed a change so that uninative is versioned by host=

> GCC.  Presumably that solves this problem in a different way?

If the sstate generated is different from a host distro with gcc>=3D4.9
and gcc<4.9 will be work.

Could you point me to the patch that makes this change?

	alimon

>=20
> Ross
>=20


--lwvOd0ilMTjbqwbCNO7n0KRR1WpcFR9Hm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYStqFAAoJEGJqcE9h3glgrR8P/3qow2IyDcwoQjqJsHhrS87P
dZr6SKwdFOWmaFDHXfbdsgl/4A4bImuOva7rb+63XvQJJx45Dr9sRkQ0LR0taqyf
aCLCkr/y/tyyFl+rL5pb53it9nVUt5DqVGamBGf47wG3dtt56+ngn0OpJAWalJyE
jIf28yJ+FczUoJHJNaJuEy+0UpxltaEd7EJeX/5Octwa1lk81XQ1Oq0D6mqe+6WZ
AEmv0YZ2lGOYNiGdBZyZe/tPVOQBcAK0uQ0YLqiEyzDm3sqrAGzBfrEJ6t4RHRjS
Olj2ytHVwFPmwuumqy7Bex/r2MT5q+AbbDn8ZzSRGtgS6TsuPU/KS4Co97QOdpt3
RMQwLQtezB2egb72d60XlU74vGYbSvzOTRO2ObkCQmRByl9VU4TjZkbqTq0cZSiR
4sBCLiMWFIuJpcHj0zthVlr04y+RQtFrY0w8kglvnOWakr8QeY5R7EdIILNA5NnY
5CMp4bt9XCEGhBAXNYyigZDUYWpQi/ij9ervz5M7bXYUn3TptupLsgc4jUS4ibdJ
QV3Fdcrup4YcDpIIw3p4osaLcVeZm2/TWfopFwmkh/o0Y+8owx9X1wd/j3O4Tv5X
P19G9SZVybhpHoR83UwJmvqD3DepcsPJB5SN/8+qRtefz+P2yy34ejNxSGMpQI/2
UrWU5e+pZpRZPDs8qvDU
=vTUP
-----END PGP SIGNATURE-----

--lwvOd0ilMTjbqwbCNO7n0KRR1WpcFR9Hm--
