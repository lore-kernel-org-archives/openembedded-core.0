Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id D97F275C51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:09:58 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so433447pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 20:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=lkuZ4CLpgQcdnpVUT76f5em8M8MPnbxhr+u7QXNUSqg=;
	b=oqkAY1Z0m/TLi8/hGwp99N8YMUhOp4rWdT/u3j7q4FJwkJb71olr7OqVaquR+Ta4cm
	aslEDNIwtZqWgH2MfmxnbwlP+/XULVb2VmaPamJNKmDZAuVzTJL+rgeJca4GkWuJZ72A
	OM6LqjXKRpZV25lDXlZhwgtwitun3LuiG7aw8ckLoErxBP+C5n8iTQ0uOu+K0MfzranO
	QQXV7I4XLH5dlA4MRAE1mRXQ1CM8qpKJd1R3fTd3CohvEhKuMnJqO3UvQHPZTWCnNmjv
	Kjf/PJIjYAJWXkS3gB0KCiF7liKEh4+Uv8/x6W3BDqf7HXE8eutXhWopkvNVoujMdPZ+
	PoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lkuZ4CLpgQcdnpVUT76f5em8M8MPnbxhr+u7QXNUSqg=;
	b=AqOdVQ8/QB8Bov9HPNm1z17WCbxEHrIITRJxaS0EUjGxfA0at1ONEqqzmUc1r1EH/3
	l1F4+7wRGNMUANn+MekQFZPdIOZRduXZ/8Qno4isFsx4YFBpx3Uo4ZTjNVKz8DOqaBDP
	9d0qiFUoxTLRLmiGl4FX3zLQz0OR+7Q8es+zjjBi9OEXvCBR74yMmGkNXfk+Ti40VLMc
	8gzJXt7ZmqaHuQ8G1e25fL29a/b6jPMi20pPU8AyOTT+9DBNKGsZyRtDM3yxlV0FKOEu
	TD+Yig2f3lV1hUnqiA+bkQcxBdz9E5Wkf+KNTidWetXGZWfQ/3lokLBL1suMWAkfeajr
	ZNIQ==
X-Gm-Message-State: AOPr4FVIN5ifNRznujESR5jZw3yeStC0rDOhvjM/6z73OKTsLzc96ff/qZN6+P+YzeLFtA==
X-Received: by 10.66.183.168 with SMTP id en8mr42360013pac.64.1463454599324;
	Mon, 16 May 2016 20:09:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5587:b1ab:c014:b8fd?
	([2601:646:8800:5a9a:5587:b1ab:c014:b8fd])
	by smtp.gmail.com with ESMTPSA id
	s124sm476151pfb.63.2016.05.16.20.09.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 20:09:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <573A8171.50002@gmail.com>
Date: Mon, 16 May 2016 20:09:53 -0700
Message-Id: <9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 17 May 2016 03:10:01 -0000
X-Groupsio-MsgNum: 82200
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4FB1B6CD-C3C8-4F38-A4DD-5C6B937439FD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4FB1B6CD-C3C8-4F38-A4DD-5C6B937439FD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On May 16, 2016, at 7:26 PM, akuster808 <akuster808@gmail.com> wrote:
>=20
>=20
>=20
> On 05/16/2016 09:44 AM, Khem Raj wrote:
>>=20
>>> On May 16, 2016, at 9:17 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>>>=20
>>> From: Armin Kuster <akuster@mvista.com>
>>>=20
>>> numpy/core/include/numpy/npy_common.h:149:10: error:
>>> |          #error Unsupported size for type off_t
>>>=20
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>> meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | 1 =
+
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git =
a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h =
b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>> index 191e5a1..109deb0 100644
>>> --- =
a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>> +++ =
b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>> @@ -11,6 +11,7 @@
>>> #define NPY_SIZEOF_PY_INTPTR_T 8
>>> #define NPY_SIZEOF_PY_LONG_LONG 8
>>> #define NPY_SIZEOF_LONGLONG 8
>>> +#define NPY_SIZEOF_OFF_T 8
>>=20
>> Why does the test to select size of off_t fails ?
> core/include/numpy/npy_common.h
>=20
>  #if NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_SHORT
>        #define NPY_OFF_T_PYFMT "h"
>    #elif NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_INT
>        #define NPY_OFF_T_PYFMT "i"
>    #elif NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_LONG
>        #define NPY_OFF_T_PYFMT "l"
>    #elif NPY_SIZEOF_OFF_T =3D=3D NPY_SIZEOF_LONGLONG
>        #define NPY_OFF_T_PYFMT "L"
>    #else
>        #error Unsupported size for type off_t
>    #endif
>=20
> its gotta match one of them. X86-64 has NPY_SIZEOF_OFF_T  value set.

yes thats the use of it. i was asking for place where it is set, most =
probably during configure

>=20
>=20
>> we might need similar fix for mips64 too.
> yep, I just built mips64 and ppc64 and they both fail like aach64.
>=20
> will send v2 to fix those as well.

OK

>=20
> -armin
>=20
>>=20
>>> #define NPY_NO_SMP 0
>>> #define NPY_HAVE_DECL_ISNAN
>>> #define NPY_HAVE_DECL_ISINF
>>> --
>>> 2.3.5
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_4FB1B6CD-C3C8-4F38-A4DD-5C6B937439FD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6i4UACgkQuwUzVZGdMxRvRACdG/XqMQsYM6lXblJAiunjKHBq
yu4AnRHCHWOY85WB3gJ0fm4EpeI+YkRp
=Ts+Q
-----END PGP SIGNATURE-----

--Apple-Mail=_4FB1B6CD-C3C8-4F38-A4DD-5C6B937439FD--
