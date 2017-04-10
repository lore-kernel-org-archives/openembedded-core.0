Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 222E977BE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:51:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c198so7658834pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=GKSKCfI3GUEgktSs70+QI6Mg/JbMGMqkHVAQrc9sDBc=;
	b=YJqMYYU/LoyZ4BJ+r+5x00qVtvKyZb9i7+awQZSPozbwkH6s6DlXlLYt/fEHLFLvGP
	0dXBjsBBL/DtyEX4tf8g89QMJ3NPrk0AgFMGZV7NCjTVW7p8e3ne1xQ6BLx6WBF0jqd2
	0PtVkPjujH7NLh6jtJEbD71GBw3X28qaT9D2+zNSLIK8ROquNwFW7oydZ2pn+O2Oxgnh
	4D75rG7Ey9lts5mZYROTWsz+sQ09kdtc8YKGH0pqb+nyyxGrVAnr4mkHqd7rmqusVVX4
	IJCoAhzgujIE1hH1eEqyVcsAz5o/vtgtRTfiSlYEWAG57iNNhsPrIPEDtjH8K5Zq/cGR
	D2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=GKSKCfI3GUEgktSs70+QI6Mg/JbMGMqkHVAQrc9sDBc=;
	b=pK4YZz3kDfvf2Pisq4YHxecDQkxD96GsNrwz51dYTjkWMNzc7Tyh11yhJGSor9Fnqw
	Mf8YpvyQV3li4EmhHODOT2DFLwf/ZoWB6CAv9iBBbRcGajvShAvcE7/cD7QAni5oiqqi
	4d/koP7UBycT40dse6KicD7fbb5t1/b9W2QVW2c+0I3jvcRfU91xnojG6QYCe3mExvWn
	QOAJvqyMKJENkXmLrDGoPo9zwmIGLdKUqbIFUP74JCyc3qmFkBMniJSApkWOZ/rVJQxZ
	2nEXyWT7foi44KHyyc/gNcGaYqM1F6IGZHu4o267oiXjCQH0m4aGfdJNuKmI261w2xMo
	QaAQ==
X-Gm-Message-State: AFeK/H2KnsSSm3EgAhogy03GXABJKMhQyvhL94h1PZ4hBEXRGz9QAUf026L+PqSNWzCv/A==
X-Received: by 10.98.78.7 with SMTP id c7mr57135474pfb.138.1491853901815;
	Mon, 10 Apr 2017 12:51:41 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:a551:b153:de27:f516])
	by smtp.gmail.com with ESMTPSA id
	m194sm26231630pga.62.2017.04.10.12.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 12:51:40 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <20170410031440.32220-1-kai.kang@windriver.com>
	<1491809280.17200.128.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c0e094a3-8959-e9e6-4c9a-c47a97996646@gmail.com>
Date: Mon, 10 Apr 2017 12:51:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491809280.17200.128.camel@linuxfoundation.org>
Subject: Re: [PATCH] libsdl2: disable check gcc -Wdeclaration-after-statement for ppc
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
X-List-Received-Date: Mon, 10 Apr 2017 19:51:45 -0000
X-Groupsio-MsgNum: 96060
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="eNIlWSPPt34foOelmH7gbcgJSGcUIgq2V"

--eNIlWSPPt34foOelmH7gbcgJSGcUIgq2V
Content-Type: multipart/mixed; boundary="t69vTCqf7nDDhA6bhexETqfKSnO3fwAX0";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Message-ID: <c0e094a3-8959-e9e6-4c9a-c47a97996646@gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: disable check gcc
 -Wdeclaration-after-statement for ppc
References: <20170410031440.32220-1-kai.kang@windriver.com>
 <1491809280.17200.128.camel@linuxfoundation.org>
In-Reply-To: <1491809280.17200.128.camel@linuxfoundation.org>

--t69vTCqf7nDDhA6bhexETqfKSnO3fwAX0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/10/17 12:28 AM, Richard Purdie wrote:
> On Mon, 2017-04-10 at 11:14 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Disable check gcc option -Wdeclaration-after-statement for powerpc
>> and
>> powerpc64 which causes compile failures:
>>
>>>
>>>   CC     build/SDL_blit_N.lo
>>> .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-
>>> 2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
>>> .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-
>>> 2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids
>>> mixed declarations and code [-Werror=3Ddeclaration-after-statement]
>>>      const vector unsigned char plus =3D VECUINT8_LITERAL(0x00, 0x00,=

>>> 0x00, 0x00,
>>>      ^~~~~
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  ...able-check-gcc-Wdeclaration-after-statement.patch | 20
>> ++++++++++++++++++++
>>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb       |  2 ++
>>  2 files changed, 22 insertions(+)
>>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/disable-
>> check-gcc-Wdeclaration-after-statement.patch
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-
>> Wdeclaration-after-statement.patch b/meta/recipes-
>> graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-
>> statement.patch
>> new file mode 100644
>> index 0000000..ad48af7
>> --- /dev/null
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-
>> Wdeclaration-after-statement.patch
>> @@ -0,0 +1,20 @@
>> +Upstream-Status: Inappropriate [disable feature]
>=20
> Given upstream explicitly enable this warning and the issue looks to be=

> in their code, surely upstream would want to fix this.
>=20
> Also, would it not be easier to patch the code and fix this than
> disabling the warning?

yes, I think it should be fixed in code unless we know that this warning
is being wrongly generated for ppc64

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>> +Disable check gcc option -Wdeclaration-after-statement for powerpc
>> and
>> +powerpc64 which causes compile failures.
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> +diff --git a/configure.in b/configure.in
>> +index e2ddc9c..73b10f5 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -2950,7 +2950,7 @@ case "$host" in
>> +             *-*-minix*)         ARCH=3Dminix ;;
>> +         esac
>> +         CheckVisibilityHidden
>> +-        CheckDeclarationAfterStatement
>> ++#        CheckDeclarationAfterStatement
>> +         CheckDummyVideo
>> +         CheckDiskAudio
>> +         CheckDummyAudio
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>> index d747cf1..33963c1 100644
>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>> @@ -20,6 +20,8 @@ SRC_URI =3D " \
>>      file://0001-prepend-our-sysroot-path-so-that-make-finds-our-
>> wayl.patch \
>>      file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
>>  "
>> +SRC_URI_append_powerpc =3D " file://disable-check-gcc-Wdeclaration-
>> after-statement.patch"
>> +SRC_URI_append_powerpc64 =3D " file://disable-check-gcc-Wdeclaration-=

>> after-statement.patch"
>> =20
>>  S =3D "${WORKDIR}/SDL2-${PV}"
>> =20
>> --=20
>> 2.10.1
>>


--t69vTCqf7nDDhA6bhexETqfKSnO3fwAX0--

--eNIlWSPPt34foOelmH7gbcgJSGcUIgq2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljr4koACgkQuwUzVZGdMxSNaQCffG1SpYYuUe9YjgoB434VX00M
3J0An2G6nffEqn0G8ITTrBi6CQYOyWgi
=mQ2B
-----END PGP SIGNATURE-----

--eNIlWSPPt34foOelmH7gbcgJSGcUIgq2V--
