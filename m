Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F23C960767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:47:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; 
	d="asc'?scan'208";a="890826688"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.32]) ([10.219.5.32])
	by orsmga003.jf.intel.com with ESMTP; 17 Oct 2016 08:47:17 -0700
To: Pascal Bach <pascal.bach@siemens.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
References: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
	<CADkTA4PHxV6uoUXiGRm7PfPP_sqs8G_9Uxg6wqsB++xKSOp=uw@mail.gmail.com>
	<ece016ec-8f57-fe4f-c730-54fa99f02b1b@siemens.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5804F2C9.80809@linux.intel.com>
Date: Mon, 17 Oct 2016 10:48:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <ece016ec-8f57-fe4f-c730-54fa99f02b1b@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 15:47:37 -0000
X-Groupsio-MsgNum: 88277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="h0jrwu1FFKFBX9r8afGrmSPEgI7Hs2QiX"

--h0jrwu1FFKFBX9r8afGrmSPEgI7Hs2QiX
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 10/17/2016 10:20 AM, Pascal Bach wrote:
>=20
>>
>> Whatever we replace it with has to be part of linux-yocto and the meta=
 data that is
>> carried there, so it can be used for the sanity/smoke test machine for=
 arch arm.
>>
>> As such, it has to be feature compatible (network capabilities, disk b=
oot, etc) with
>> the existing arm versatile 926ejs platform
>>
>> There have been newer variants for ages, but since there's been no com=
pelling
>> reason to upgrade, I continue to carry the existing platform support a=
long to the
>> new kernels. (In fact, I've had a qemuarma9 around for nearly 3 years =
now, but
>> it lacked some disk controller support).
> My main motivation is to get valgrind running. This requires at least a=
rmv7 to be useful.
> Most physical boards are not powerful enough (memory and cpu) to do rea=
l work with valgrind.
> QEMU would be helpful for that.
>>
>> From the kernel point of view, updating the platform doesn't have any =
big benefits,
>> but for userspace it could shake out issues with toolchains and instru=
ctions, so
>> there is a gain to be had there.
> In order to find more bugs there would be multiple qemuarms (qemuarm =3D=
 armv5, qemuarmv7 =3D armv7, ...).
> Is this what you are suggesting?
>>
>> If someone is motivated, I'm happy to help work on an update to the co=
re qemuarm
>> platform .. it just has to meet the criteria above.

I like the idea to have a new version of qemuarm instead of armv5 but
that needs to be considerate in terms of,

Do we aim to support multiple versions of qemuarm?, i'm saying this
because of the comments by Bruce about all the testing and the effort
needed to support another qemuarm variant.

If we only want one version of qemuarm, what version you suggest? and why=
?.

Finally i like the idea to be able to use valgrind into emulation that
will speed up debugging times.

Cheers,
	alimon

>>
>=20
> Pascal
>=20


--h0jrwu1FFKFBX9r8afGrmSPEgI7Hs2QiX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYBPLPAAoJEGJqcE9h3glg5Y0P/RVdXiQy2JFwkRmPz275OZHR
ciIRGCl9dbFURTtWM7LI8pj4bTBDvGNvao2GOBQBHkLJUcAXGiEbNBCLwjQZcSLs
/QsS9rcWu2n90EApCjlDdJot4tTLgXZo5zQ6mP9SpF+HN1ADlwBQeoEbNQaisWdO
mpyg4LeKrtsOsvq/Oz8/VNR3HTOsFhVXQR04JfuGCdBI1pGy9+6EWrpNwRLV3opv
1A8vaHjeTsfA1pcFMmogAOkrnqYuy+wqMHpiVSqOHjxolds5VAzKLyWoWcV6CvhQ
lRK/xUt2MeymsSo6TpTEYRKAY6LX9yUiviN/duxoK1FaekVunOc4Bf2gYZyO/2nf
4FSBCG1XHzWUDHOuR9rrNLj1aalBuUGijwuaVf+2AOGvMvI1rq1Bq0u0e0L3TJNH
BYXqUjX4Hn1VWScyO42GzFyiks2ADx9oQXRYhb7cPS1VkihQJIHIs+0DfyAkjJR+
SspXdWEHa0uu/QJTz+kGcMHN0bCDvLm8s+imK/Ronmyne75dreB4rAebXTZCCE4Z
GmYl1qsXdZGTyOQiXILozykp9Go5HHZE66E5P1afODRAUD+VorM3TpoFkERAjUaq
CARkQDvXBk5iUxg46z+E/MShSobW1eQA8Dz+XIuuHJrH2jZ+urrt0Yqu/dbH0ITP
UX3/6eFu1NAnx03nWdcu
=Iiez
-----END PGP SIGNATURE-----

--h0jrwu1FFKFBX9r8afGrmSPEgI7Hs2QiX--
