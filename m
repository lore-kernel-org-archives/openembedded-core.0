Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 08824770A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:35:17 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gh9so500947pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 20:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=r6Y+xpZ8xiLnWLgepDl7ACmfh7vNWZLVeLj5U97wC7s=;
	b=FdcHejI0MHD+ANHqMMEFKqKSxSdT72b46+mxb1igq9FnpMBFeFsWnU5OtdPbkGQrWU
	lcnMNeHuF+fJwUSOtlgPFZMNXGg2Fk+zgOE+nk3C6lQlexVHrtGKFmx+hwN8tPUHHl8k
	4cI9RfWgVvGwZNxy8BQNtp7tyWeaUGUZg8iyZhSm+8NMG26lMJ0YQYHoCZeH13eyTVc1
	CllTzQqdULWAf1mXufK6J6cxoRzV1X/Lxk7MU4DPt8aZFs38uzdtj0sJ/DQz4+ChX7Lj
	tqkU/d4wQlDtDg4VbkR4oQpislnTTzmv8uXQRy4h4IscL9x1JjWvr7cWu0fuV0JGS1ef
	KWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=r6Y+xpZ8xiLnWLgepDl7ACmfh7vNWZLVeLj5U97wC7s=;
	b=WNHv0UKKuL3vteI/NrK18d57K7GhKDq+TKrBATv2C3qZVWHgo5I9t6G0qUJO6Wbs+N
	KgadbIK20NpBHpfgOV28pB4XCibdtVqCyZM9/7XRl+j4b0Ig2Usw+aBnnEOJI24E1c20
	8wAl97g512fiR8HWYPj/n0dnrS7uju8z3tKOYQ5PqWXQ0SpBqUofgdT6dlF6MwXlS8Jg
	1gqG0zbQC00XiRcesNHdDUvRfYCStZrJBv3mfpA4T7INGUolqepaOHlt6ERJ4HKRDHJx
	e6B2E9nb5dgOsEBh9au22+Ildd1Oj2gKIIV2mi+f3q9fnSzwyN5Rj0MBLLo1jk7Kthd6
	E4zA==
X-Gm-Message-State: AOPr4FVPhgqQcQJW/3euTD3qQYo8RcPqBwwjeAkrWL2tJ4wKhovwZy/riry5wlUL/Zfhmg==
X-Received: by 10.66.237.35 with SMTP id uz3mr50678909pac.145.1463456117984;
	Mon, 16 May 2016 20:35:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5587:b1ab:c014:b8fd?
	([2601:646:8800:5a9a:5587:b1ab:c014:b8fd])
	by smtp.gmail.com with ESMTPSA id t14sm588089pfj.12.2016.05.16.20.35.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 20:35:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
Date: Mon, 16 May 2016 20:35:16 -0700
Message-Id: <FA10CE49-93CB-4CB9-9F20-F8F5396020DC@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
	<73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Tue, 17 May 2016 03:35:18 -0000
X-Groupsio-MsgNum: 82205
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7A4D2D35-D2C0-4052-814F-837033D8961B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7A4D2D35-D2C0-4052-814F-837033D8961B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 16, 2016, at 8:34 PM, akuster808 <akuster808@gmail.com> wrote:
>=20
> On 5/16/16 8:09 PM, Khem Raj wrote:
>>=20
>>> On May 16, 2016, at 7:26 PM, akuster808 <akuster808@gmail.com> =
wrote:
>>>=20
>>>=20
>>>=20
>>> On 05/16/2016 09:44 AM, Khem Raj wrote:
>>>>=20
>>>>> On May 16, 2016, at 9:17 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>>>>>=20
>>>>> From: Armin Kuster <akuster@mvista.com>
>>>>>=20
>>>>> numpy/core/include/numpy/npy_common.h:149:10: error:
>>>>> |          #error Unsupported size for type off_t
>>>>>=20
>>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>>> ---
>>>>> meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | =
1 +
>>>>> 1 file changed, 1 insertion(+)
>>>>>=20
>>>>> diff --git =
a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h =
b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>>> index 191e5a1..109deb0 100644
>>>>> --- =
a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>>> +++ =
b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>>> @@ -11,6 +11,7 @@
>>>>> #define NPY_SIZEOF_PY_INTPTR_T 8
>>>>> #define NPY_SIZEOF_PY_LONG_LONG 8
>>>>> #define NPY_SIZEOF_LONGLONG 8
>>>>> +#define NPY_SIZEOF_OFF_T 8
>>>>=20
>>>> Why does the test to select size of off_t fails ?
>>> core/include/numpy/npy_common.h
>>>=20
>>> #if NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_SHORT
>>>       #define NPY_OFF_T_PYFMT "h"
>>>   #elif NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_INT
>>>       #define NPY_OFF_T_PYFMT "i"
>>>   #elif NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_LONG
>>>       #define NPY_OFF_T_PYFMT "l"
>>>   #elif NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_LONGLONG
>>>       #define NPY_OFF_T_PYFMT "L"
>>>   #else
>>>       #error Unsupported size for type off_t
>>>   #endif
>>>=20
>>> its gotta match one of them. X86-64 has NPY_SIZEOF_OFF_T  value set.
>>=20
>> yes thats the use of it. i was asking for place where it is set, most =
probably during configure
>>=20
>=20
> There is no configure for this python package. It uses hardcoded =
values
> in config.h or _numpyconfig.h per arch. X86-64 has the =
NPY_SIZEOF_OFF_T
> defined in _numpyconfig.h. To keep it consistent, I put the Aarch64
> changes in the same place.

is this config.h or _numpyconfig.h generated too ?
see if thats the case

>=20
> - armin
>=20
>>>=20
>>>=20
>>>> we might need similar fix for mips64 too.
>>> yep, I just built mips64 and ppc64 and they both fail like aach64.
>>>=20
>>> will send v2 to fix those as well.
>>=20
>> OK
>>=20
>>>=20
>>> -armin
>>>=20
>>>>=20
>>>>> #define NPY_NO_SMP 0
>>>>> #define NPY_HAVE_DECL_ISNAN
>>>>> #define NPY_HAVE_DECL_ISINF
>>>>> --
>>>>> 2.3.5
>>>>>=20
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7A4D2D35-D2C0-4052-814F-837033D8961B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6kXQACgkQuwUzVZGdMxT3oACdHKjKVw+qpvKJS49aO8O2c7Yj
pTYAni//2D/jv6YGMp1LQ9LtlWjkbWjk
=67yV
-----END PGP SIGNATURE-----

--Apple-Mail=_7A4D2D35-D2C0-4052-814F-837033D8961B--
