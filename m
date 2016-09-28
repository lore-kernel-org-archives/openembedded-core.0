Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0BF760123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 17:18:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2016 10:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,410,1470726000"; 
	d="asc'?scan'208";a="14292263"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by orsmga005.jf.intel.com with ESMTP; 28 Sep 2016 10:18:18 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1475078770-26139-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57EBFB88.8080208@linux.intel.com>
Date: Wed, 28 Sep 2016 12:19:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com>
Cc: 00moses.alexander00@gmail.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 17:18:30 -0000
X-Groupsio-MsgNum: 87634
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="nu77NkrboaKmaB4kRf2MQD9eXLaWdqcCj"

--nu77NkrboaKmaB4kRf2MQD9eXLaWdqcCj
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 09/28/2016 11:24 AM, Burton, Ross wrote:
> On 28 September 2016 at 17:06, An=C3=ADbal Lim=C3=B3n <anibal.limon@lin=
ux.intel.com>
> wrote:
>=20
>> @@ -18,16 +18,15 @@ RCONFLICTS_${PN} =3D "db3"
>>  PR =3D "r1"
>>
>=20
> Remove this PR please.
>=20
>=20
>>  # Note, when upgraded to 6.1.x, a patch in RPM will need to be remove=
d to
>> activate db 6.1 support.
>> -
>> -SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz \=

>> +SRC_URI =3D "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
>>
>=20
> What is distfiles.gentoo.org's policy when db-6.0.36 is released?  Coul=
d
> the tarball be deleted the day after we release?  In general we've been=

> either using snapshot.debian.org or pointing directly at the
> yoctoproject.org source mirror for tarballs we can't rely upon over tim=
e.

The gentoo distfiles source mirror has older versions of Berkeley DB
hosted so i don't think they will remove the tarballs.

Also if the get fails using gentoo source mirror the next step will be
use yp source mirror that is default enabled.

Cheers,
	alimon


>=20
> Ross
>=20


--nu77NkrboaKmaB4kRf2MQD9eXLaWdqcCj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX6/uOAAoJEGJqcE9h3glgf+kP/2yBqzMoVlRULtgy93fEZf+E
ffN/HQh5TofJBr2sNxxq1pIJT7bSJGqBd2WqTS9V052lASEO6eKBHRR7dF00dZKw
C7C5G49tDMP66DrxrNAyluR1IZFCoxIhBjxa0YYqNN9GU/RTN8G3ucZoa5a4cbDo
J9EwfXbWk5rWCLpS0HTRUBHQdjTqysJHsQhPftsWOJgCr/2qH7J+gTGvrtQBVqod
2wYQt5Ij1BFzA6gjKEAQ5tQVCZ2hau7ZG95/0nz7FsGsr4nDKwYKAlaYURhaX3eE
+dDy1xgTxg5F3pSypaFa8J/1Mw+XTz8TnZ88NSnW+6fQ9URdoa8vO+h5yBlyhrfx
91tB+YPFBUOBJeca3aTjXyIDS3W2Gudmx8/gSmNIA9z+zn+Hj+hssHNCMgg4Gulc
9nFChjUljMQUJnrRgn9fDNgs2fyWwfr0e9PFuYx4GIE3KyFK233PqE+ry1h6wKJh
fQwy9PxI8MAKdz0BdnJKOapPPVBi8k849fUbWxmKJmzuCtqdnfMBZlnaYcHP9BB+
Zj58Gkh4Zz5FVog1jIJJLO9UunEy+HWDPpKIQ2svmt9LhGHwjo1VP0jAHAjKiGDW
vsZ9IjeDaMic18HFhggmbgJZ6TjUzmRS/Gul4baaINL7GT82NFbNUAzOHQi5NNby
yW1vzcpSapFau7WxnA8I
=HAln
-----END PGP SIGNATURE-----

--nu77NkrboaKmaB4kRf2MQD9eXLaWdqcCj--
