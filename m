Return-Path: <raj.khem@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0420B60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 05:13:29 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id k129so229226227yke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 21:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TFvV5UMMCrsac7H1dHuhWHCduINfx39rParZOtM0+KA=;
	b=0UCuw20+lTLnGFTP+m33S7ubWjcGJZOAlqdrwrZ3eWkg3YiPI4d4HPLkqpWFMgYAji
	DYM0yy+GEUk+cE2bzsksdVMnAIDA+W43X4KDEixc4NolPImnEaM7QqESdPjULPSKZTLs
	L10ZrptkDihAkMcSxRwRhc7JwxtP+POp+a6B6bLAyE25T8w55IoBB8UNUxO1e6bm5zsU
	IfW8mkaHSzu1PvYMTJe3UG2IFCbob2Q8mQfJJkqfWb1fdPjhpBbdSyWDKirs1Y0EAggt
	g3aDIy32x6mBsdVhNzsvVG2+kmegEdBhVKvtYOpIUT/5qyvuMqbRP7VOEFXUD3CRiIaz
	gP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=TFvV5UMMCrsac7H1dHuhWHCduINfx39rParZOtM0+KA=;
	b=g131HuLXZfSy9Dk8qa2yRrnqHkzY4ev18MKUC3nbFB6S+2OTRDmMIolIDE3InRwKRu
	WTRwxI/ppypvWzq99t5iIkFdbVaiZLKbQc/SLs2jZJUFnLYoxIEeXewATXu4Cmn3GGAC
	VE9MbX6BJyjBHLzfQZL6JaVZeb682zO5OKAzmN4IaJ7hqKxsv4O4bihkaBFtxwQiYM0H
	mMmaYYX3zq0WZlcjrBk8zlP9bTvNfSpe40mmdDIu88eMGf0Ye15yRT8HUvBnNE4xFILj
	gLUcHA3IM9LMwy09ADS/5FnL5dChaboSGTNmCUH1kVELZxOPFRGNkOjNFgwII97ocZvt
	NzaA==
X-Gm-Message-State: AG10YOQbXBR2ZvXVSEwJURQq9npgxi+fiM6lXNLD+6V6PDjKbE9VnogKMGl2306zBXpFRA==
X-Received: by 10.13.212.81 with SMTP id w78mr547277ywd.213.1453871610189;
	Tue, 26 Jan 2016 21:13:30 -0800 (PST)
Received: from ?IPv6:2600:1002:b014:c92e:ed2f:4d62:56d8:d791?
	([2600:1002:b014:c92e:ed2f:4d62:56d8:d791])
	by smtp.gmail.com with ESMTPSA id
	w82sm3692650ywc.29.2016.01.26.21.13.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 21:13:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=UL4soJJUPHc4X7h2xkErU7DFJRzYaZuEc+QKekqEohiw@mail.gmail.com>
Date: Wed, 27 Jan 2016 00:13:21 -0500
Message-Id: <CEEF54AD-6405-44F3-9245-EC3C792A433B@gmail.com>
References: <1453785046-9017-1-git-send-email-armccurdy@gmail.com>
	<7CEFB79F-1AD8-4D5A-B2AD-6EE828F21256@gmail.com>
	<CAJ86T=UL4soJJUPHc4X7h2xkErU7DFJRzYaZuEc+QKekqEohiw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
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
X-List-Received-Date: Wed, 27 Jan 2016 05:13:32 -0000
X-Groupsio-MsgNum: 76945
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8D83A919-82BE-40C4-BB05-580F6095F6B3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8D83A919-82BE-40C4-BB05-580F6095F6B3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 26, 2016, at 12:18 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Tue, Jan 26, 2016 at 8:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Jan 26, 2016, at 12:10 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> Experimental hack, not expected to be merged.
>>>=20
>>> Without this, the =
http://www.cplusplus.com/reference/string/string/append/
>>> example fails to build with -std=3Dc++11 and it's not clear why =
(it's as if we
>>> build a version of libstdc++ which supports only the old ABI but =
with headers
>>> which try to use the new ABI when compiled with -std=3Dc++11 ?). As =
a workaround,
>>> force libstdc++ to provide, and default to using, the old ABI in all =
cases.
>>>=20
>>> See also:
>>>=20
>>> https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
>>> https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
>>> https://wiki.debian.org/GCC5
>>>=20
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/recipes-devtools/gcc/gcc-runtime.inc | 13 +++++++++++++
>>> 1 file changed, 13 insertions(+)
>>>=20
>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> index f20d298..3a476cd 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> @@ -10,6 +10,19 @@ EXTRA_OECONF_PATHS =3D "\
>>>=20
>>> EXTRA_OECONF_append_linuxstdbase =3D " --enable-clocale=3Dgnu"
>>>=20
>>> +# gcc-runtime.inc: force libstdc++ to always use gcc4 compatible =
ABI
>>> +# Experimental hack. Without this, the =
http://www.cplusplus.com/reference/string/string/append/
>>> +# example fails to build with -std=3Dc++11 and it's not clear why =
(it's as if we
>>> +# build a version of libstdc++ which supports only the old ABI but =
with headers
>>> +# which try to use the new ABI when compiled with -std=3Dc++11 ?). =
As a workaround,
>>> +# force libstdc++ to provide, and default to using, the old ABI in =
all cases.
>>> +# See also:
>>> +# https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
>>> +# =
https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
>>> +# https://wiki.debian.org/GCC5
>>> +#
>>> +EXTRA_OECONF_append =3D " --disable-libstdcxx-dual-abi =
--with-default-libstdcxx-abi=3Dgcc4-compatible=E2=80=9D
>>=20
>> This change while makes it work compatible to older libstdc++ ABI, we =
should make the defaults to be
>> forward looking.
>=20
> Yes, I agree. The problem is that currently our libstdc++ doesn't seem
> to support the new ABI.
>=20
>> I would rather keep --with-default-libstdcxx-abi=3Dc++11 since gcc6 =
will switch to newer
>> c++ std as default. If we revert like you suggest, we will be up for =
more work in gcc6 time.
>>=20
>> please define _GLIBCXX_USE_CXX11_ABI=3D0 for your app, where you see =
the problem.
>=20
> My test case is the example app from:
>=20
>  http://www.cplusplus.com/reference/string/string/append/
>=20
> It fails when I try to compile to use the new ABI (ie by using
> -stdc++11 or _GLIBCXX_USE_CXX11_ABI=3D1).

Lets not mix API ( std=3Dc++11 ) and libstdc++ c++11 ABI, both are =
different.

have you tried the converse where you suspect the test is not c++11 ABI =
compliant for STL
in particular

str.append<int>(5,0x2E);

>=20
> There is no legacy code involved.
>=20
>>=20
>>> RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp libatomic \
>>>    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], =
'libquadmath', '', d)} \
>>> "
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_8D83A919-82BE-40C4-BB05-580F6095F6B3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaoUfkACgkQuwUzVZGdMxTL6QCfeyO4Fnv4xRf8Z1q7jpHDCmiU
GGoAmgN+3Q8WraKmBceAu5GgLGc2gZ5D
=GMvz
-----END PGP SIGNATURE-----

--Apple-Mail=_8D83A919-82BE-40C4-BB05-580F6095F6B3--
