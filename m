Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B29DE71C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:56:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2017 06:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,349,1477983600"; 
	d="asc'?scan'208";a="52217506"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.143])
	([10.219.5.143])
	by orsmga005.jf.intel.com with ESMTP; 12 Jan 2017 06:56:15 -0800
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<1484212295.7594.18.camel@andred.net>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <587799B8.70602@linux.intel.com>
Date: Thu, 12 Jan 2017 08:59:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1484212295.7594.18.camel@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:56:37 -0000
X-Groupsio-MsgNum: 91643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="88rEUrSpG5iC8F8sCCP4SuR4dkSXEeNi0"

--88rEUrSpG5iC8F8sCCP4SuR4dkSXEeNi0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 01/12/2017 03:11 AM, Andr=C3=A9 Draszik wrote:
> On Thu, 2017-01-12 at 09:03 +0000, Andr=C3=A9 Draszik wrote:
>> Hi,
>>
>> On Wed, 2017-01-11 at 14:51 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>>> Testing:
>>>
>>> It was test running testimage over core-image-{minimal, sato} in
>>> qemu{x86,arm,ppc,mips} archs.
>>>
>>> Also the qemu unit test (ptest) was run in the target and all test
>>> pass except a previous failing one:
>>>
>>> ERROR:/usr/src/debug/qemu/2.7.0-r1/qemu-2.7.0/tests/test-qht-
>>> par.c:20:test_qht:
>>> assertion failed (rc =3D=3D 0): (32512 =3D=3D 0)
>>>
>>> Rebased patches:
>>>
>>> - exclude-some-arm-EABI-obsolete-syscalls.patc
>>>
>>> Removed patches (already in upstream):
>>>
>>> - 0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
>>> - 0002-fix-CVE-2016-7423.patch
>>> - 0003-fix-CVE-2016-7908.patch
>>> - 0004-fix-CVE-2016-7909.patch
>>>
>>> Changelog,
>>>
>>> http://wiki.qemu.org/ChangeLog/2.8
>>
>> The patch 0001-target-mips-add-24KEc-CPU-definition.patch should also =
be
>> removed, as it's been merged.
>=20
> It looks like Qemu-Arm-versatilepb-Add-memory-size-checking.patch can a=
lso
> be removed.

Hi,

I'll remove those patches and test again on qemuarm, i'll send a v2 soon,=


Cheers,
	alimon

>=20
> A.
>=20


--88rEUrSpG5iC8F8sCCP4SuR4dkSXEeNi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYd5m6AAoJEGJqcE9h3glgDnwP/j/JzA5dfow9VEr1OJI5vlQj
8iM//yPkM7BRK6uBdvpUe6qubSbXhE1SE48a6V4RbV8tfYndfuLmQJmVMphz608Y
Ej6gA59WMi6ReIDkxHpQHNjr+tbDfeHjwz2GCYZ+1LPCT2yIfUALo0PtckRM3zmG
HoaPaXNU3f3ySqPOGy8IV0OOQ5k2PDO3qQn/yznSdBbz9HzehuN5Wo9oPZxuwKB+
qEfrKmlQAer99jigQe6kctpZCG1mK8rZAN4qoif0i4Mil6zyVcBZ/sbIGc57OaBd
qZd9KepHLT50esl6kmgicW6hJ71FsnGQFqyL4mMOdeZhFFDa2ckw+dQCvoQy+D5f
q5bY30Tbr3NmcaFxj35TQrxrgh12LFPus+p/cGcka/2o+m+A9kts4i7kdT5byjhF
xFn1sn7l5BP0zo8SNEwGuf8NtVZtXe1GKJlOzwB83ShildJ5GDLXNF8b2r3DoMtx
cvBcj4HnRAdQ91rVq9B/UXBTC06xn0xRfu47+AsJ0YrNifGvkeW0jMPQo6kxmk6M
41LfHUUgCZghZNCCPqXfduZ8NTw35HO8z9k8RD4H0yic59ekiaNwiD5bnOtDQmAN
WcSEuuTNGpYH1eswJyZM7FCE/YHbEGXV2cP4Z4nFaxnuQuhnUEejQOk8UsoIOaNg
loshjhjn8+LtGS2lGtIi
=MWMw
-----END PGP SIGNATURE-----

--88rEUrSpG5iC8F8sCCP4SuR4dkSXEeNi0--
