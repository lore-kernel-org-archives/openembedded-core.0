Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C03076F8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 15:45:37 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so13972185pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=H71oBqJgMeRyJR3N6C7W5mdHU3Qohm7sZrA/02mw3ME=;
	b=rqbueHcMYMIozVdml2+S3v7zSig0hzu6D+FPxmdkLqeM8x9uR36389bpMTbYS2SPBx
	ixntR59rFYePohksagoZJvX3kM4CZl5G+gfg4KPBF9i2KegjKhCUYaai2ryHvHrXfv6U
	XfSna3hBoU64vg1Mwf+qrh7X2QCMQCiHeUxsLA7v848VZT52UAKhGlEoqdULyCRw6H95
	IEKSN880hHYnhVTyMV1Xvfplf0hYm6GqAOhH2YxO0fRSd2imj5dKydfJv7BK2BWK1UOX
	Rr1J4iLJtZABx0FQj1qwdmpQUl85LIsNJjsm4Vru9GpgWMJ/4bewpCIzCvF8/rroPK/D
	uYRQ==
X-Received: by 10.68.131.138 with SMTP id om10mr71935063pbb.3.1441813537763;
	Wed, 09 Sep 2015 08:45:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a80f:97a4:8ac:b5c7?
	([2601:646:8601:4580:a80f:97a4:8ac:b5c7])
	by smtp.gmail.com with ESMTPSA id z6sm7436863pbt.51.2015.09.09.08.45.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Sep 2015 08:45:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAC1BbcRjQbd_py7Tv+TPDG2fcsbh9zO6328HX50wXS9KrxHYng@mail.gmail.com>
Date: Wed, 9 Sep 2015 08:45:31 -0700
Message-Id: <3AF99B36-C7DE-4648-9562-D0AAFAB95609@gmail.com>
References: <cover.1441299182.git.raj.khem@gmail.com>
	<4f42995bde754f4fe83329c59f487810d2324854.1441299182.git.raj.khem@gmail.com>
	<CAC1BbcRjQbd_py7Tv+TPDG2fcsbh9zO6328HX50wXS9KrxHYng@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Use UTMPX instead of legacy UTMP
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
X-List-Received-Date: Wed, 09 Sep 2015 15:45:38 -0000
X-Groupsio-MsgNum: 70918
Content-Type: multipart/signed;
	boundary="Apple-Mail=_00AD3DB2-C5A1-44BF-801C-23063BF8726C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_00AD3DB2-C5A1-44BF-801C-23063BF8726C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 9, 2015, at 6:25 AM, Bernhard Reutner-Fischer =
<rep.dot.nop@gmail.com> wrote:
>=20
> On 3 September 2015 at 18:54, Khem Raj <raj.khem@gmail.com> wrote:
>> This makes busybox honor UTMPX feature if available in a libc
>>=20
>> [YOCTO #8243]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 =
+++++++++++++++++++++
>> meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
>> 2 files changed, 389 insertions(+)
>> create mode 100644 =
meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
>>=20
>> diff --git =
a/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch =
b/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
>> new file mode 100644
>> index 0000000..1d299ee
>> --- /dev/null
>> +++ =
b/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
>> @@ -0,0 +1,388 @@
>> +=46rom 86a7f18f211af1abda5c855d2674b0fcb53de524 Mon Sep 17 00:00:00 =
2001
>> +From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> +Date: Thu, 2 Apr 2015 23:03:46 +0200
>> +Subject: [PATCH] *: Switch to POSIX utmpx API
>> +
>> +UTMP is SVID legacy, UTMPX is mandated by POSIX.
>> +
>> +Glibc and uClibc have identical layout of UTMP and UTMPX, both of =
these
>> +libc treat _PATH_UTMPX as _PATH_UTMP so from a user-perspective =
nothing
>> +changes except the names of the API entrypoints.
>=20
>=20
> Ontop of this you might also need
> =
http://git.busybox.net/busybox/commit/?id=3D7d86384b246434e72533332f7f409a=
7aa9efeacb
> unless you can guarantee a uClibc rebuild with utmpx support enabled
> at the same time.

in OE we are using git version (0.9.34) so this won=E2=80=99t be needed.

>=20
> Thanks and cheers,


--Apple-Mail=_00AD3DB2-C5A1-44BF-801C-23063BF8726C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXwVCAACgkQuwUzVZGdMxT0oQCeLlRKLlB2yjh4UGRJcQ8FlQFM
Y8sAn3bz/Ta463a+sIt4JgBO5Y76CoMp
=ReC4
-----END PGP SIGNATURE-----

--Apple-Mail=_00AD3DB2-C5A1-44BF-801C-23063BF8726C--
