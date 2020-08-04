Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.2201.1596534695671633869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 02:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0c0EKtp;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id kq25so28764649ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 02:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
         :to;
        bh=XB2WE+BG0ctyRlkMZ6CO/ikOs82wx7fVDmxxjGyGaiY=;
        b=d0c0EKtp5hDu9yBR8ClnvvrjSMzQrtjEmuyacnosPEgT+XpPEXkyHwtQbSYgviVpFX
         /OSWpK6DoZi2f+ZHFf92qJmF09kODgJ7yIwwuIwe34S1zKU9+nW8Q9QwNR4b+PzvyhM3
         7Rp4AtZk3QeJDyNjMH1IEqxENGHR6EuAj42Wfo8CedDhueGltlOLpoJmGZfqMSsY9D/F
         cNsvnJdKiHp94LtW07wrUXjQo0OiGpK5LEC/ArgWUquDGmiSHhTsDh1YWlCGuyghqkyP
         9qkyu0l/U19kPB4OVIv+o86V8sZJV34fMKvh7DM4h2jo5xSfK+bnPWFxlz9UOFNAl5fg
         7Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :message-id:references:to;
        bh=XB2WE+BG0ctyRlkMZ6CO/ikOs82wx7fVDmxxjGyGaiY=;
        b=mQqgPEdS/ftNrbeIqvpuehkVczuc3g3q2OuInlcsDv4Pa7JzYuSObdQML+sY136ewo
         Ojw+7ELDpTD4tqzbHMt8+NN2qRzfUqfHGLiofosugB4hdn1vURyAeZWYgTPHZFTTtNrp
         3q99Q6KWLd2xBTQLR+FmgODR9s4ANfQ9QGHp6Wi719/3dVco/aBb21ZLSTPATF8FZ5AS
         rBLWSCa1nCTfIYCZyUVMdOyKafq3cCiTqasvic7m67KGzJsZDkFwsvapAMwNuOZPcRHO
         5BEVZ7qhFYLxGjbeMB2VH3iDWsyQJj/ed0XJ+u6ONqKGG9+QevsNy0QFEMBtlkHCAg2N
         KB/Q==
X-Gm-Message-State: AOAM533SzjeonN9jjNFhM80XVPY52VqUIt4AIbAZnClLG5hreWNSzvCx
	AE8a/Zm457DPHc2UXqPuWuw=
X-Google-Smtp-Source: ABdhPJxKA2hrLmJJdN0EhC2HE8axrpjt6bP1FHCwLRc34LE0gAaWpMSDJ7SjKrBZNj7djJ9eQs9opw==
X-Received: by 2002:a17:906:38da:: with SMTP id r26mr20258608ejd.120.1596534693916;
        Tue, 04 Aug 2020 02:51:33 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p5b25b9cc.dip0.t-ipconnect.de. [91.37.185.204])
        by smtp.gmail.com with ESMTPSA id x1sm17958835ejc.119.2020.08.04.02.51.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2020 02:51:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [OE-core][PATCH v2 2/2] buildtools-tarball: eliminate overwtiting OPENSSL_CONF
From: "Jens Rehsack" <rehsack@gmail.com>
In-Reply-To: <6e3bca823e2379bc8b1965a0de33e75cbeaf14da.camel@linuxfoundation.org>
Date: Tue, 4 Aug 2020 11:51:31 +0200
Cc: openembedded-core@lists.openembedded.org
Message-Id: <2981E222-3BBC-4C48-8060-8AA7F33CB659@gmail.com>
References: <20200724052606.6726-1-sno@netbsd.org>
 <20200724052606.6726-2-sno@netbsd.org>
 <6e3bca823e2379bc8b1965a0de33e75cbeaf14da.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Groupsio-MsgNum: 141182
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2B747003-53F1-40C8-886E-B7F3CBECA80C";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_2B747003-53F1-40C8-886E-B7F3CBECA80C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Am 28.07.2020 um 00:26 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Fri, 2020-07-24 at 07:26 +0200, Jens Rehsack wrote:
>> Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to =
clarify
>> whether nativesdk-openssl installs wrong content or =
buildtools-tarball:
>>    (nativesdk-openssl) =
tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
>>    (buildtools-tarball) =
buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/recipes-core/meta/buildtools-tarball.bb | 1 -
>> 1 file changed, 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb =
b/meta/recipes-core/meta/buildtools-tarball.bb
>> index d0f8dd7d7c..02e662b5cc 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -75,7 +75,6 @@ create_sdk_files_append () {
>>=20
>> 	echo 'export =
GIT_SSL_CAINFO=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.=
crt"' >>$script
>> 	echo 'export =
SSL_CERT_FILE=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.c=
rt"' >>$script
>> -	echo 'export =
OPENSSL_CONF=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' =
>>$script
>>=20
>> 	if [ "${SDKMACHINE}" =3D "i686" ]; then
>> 		echo 'export NO32LIBS=3D"0"' >>$script
>=20
> I did look at this further. I don't see anywhere in buildtools-tarball
> that the code you add in toolchain-scripts.bbclass is actually run, it
> doesn't make it into the buildtools tarball.
>=20
> Note the code does:
>=20
>     rm -f ${SDK_OUTPUT}/${SDKPATH}/environment-setup-*
>     [...]
>=20
>     # Generate new (mini) sdk-environment-setup file
>     script=3D${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}=

>     touch $script
>=20
> so your patch definitely breaks buildtools. I therefore don't plan to
> merge it.

While I wouldn't argue against not merging it, I disagree the reasoning:

There is an buildtools/environment-setup-x86_64-pokysdk-linux in my =
created SDK which contains:

$ cat buildtools/environment-setup-x86_64-pokysdk-linux
export =
PATH=3D/home/sno/sds-lp791a-sdk/buildtools/sysroots/x86_64-pokysdk-linux/u=
sr/bin:$PATH
=
#OECORE_NATIVE_SYSROOT=3D"/home/sno/sds-lp791a-sdk/buildtools/sysroots/x86=
_64-pokysdk-linux"
export =
GIT_SSL_CAINFO=3D"/home/sno/sds-lp791a-sdk/buildtools/sysroots/x86_64-poky=
sdk-linux/etc/ssl/certs/ca-certificates.crt"
export =
SSL_CERT_FILE=3D"/home/sno/sds-lp791a-sdk/buildtools/sysroots/x86_64-pokys=
dk-linux/etc/ssl/certs/ca-certificates.crt"
export =
OPENSSL_CONF=3D"/home/sno/sds-lp791a-sdk/buildtools/sysroots/x86_64-pokysd=
k-linux/etc/ssl/openssl.cnf"

So it's a bit weird - and deserves more investigation.

> You are right that we could add something here to source the
> environment.d files within OECORE_NATIVE_SYSROOT but you'd need to add
> that to the buildtools environment script itself.

Maybe we can find a way so collect snippets - but I wanted to show the =
conflict between
buildtools/environment-setup-x86_64-pokysdk-linux and =
buildtools/sysroots/x86_64-pokysdk-linux/environment-setup.d/openssl.sh.

$ cat =
buildtools/sysroots/x86_64-pokysdk-linux/environment-setup.d/openssl.sh
export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-1.1/openssl.cnf"=


This conflict should get resolved somehow.

> Cheers,
>=20
> Richard

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_2B747003-53F1-40C8-886E-B7F3CBECA80C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8pL6MACgkQRJmWrtzl
Cp3HVg/+LEmlGAjS+NeB65UzMoDT/Va2RR0J/zG2wqMys5+5rL7U9sWpogn2cN3v
xhN2fp5EQuNtS6JFCbpgtaM98Q6cTIURd4NCEEYwyfSEh2BF0oqN4DwNx3Rf/2Xa
hwq00BsTPbCudgcvFmFM6e0XfAfsP2owbIpGLvkZvJOX7YPiNGlnlFHe5wDfoZhO
nZ5bbjF3ZMCs+m/cwawtOz4hW8QjSL70WfyAdbH90cUN/fiTaKbR2XXycs/ouq/H
X1QjwVIs4g1U5ivCUaZldWv5CLrSNy3B82XSlGecGhvNS6+fHKbm2jOeUJGlO2Dz
6MjVpsWUD+b50TuyjikbnTxOuC+Z+R2NvRH7EZJzma/yOgjNCzBZMqfTN1BmZ3MB
UTgKleSQ/rTNR0wmvu9g5DVFP/l8piVBYvlJ86ywpBd0epC1RvDveExogGX+ghJ2
2OKppJEfy13pNUOzfEf2XzSp6u8r04UiPYm64lPefF2Tl/4nM7NRTrL1QtZZrvh3
JpFBaRbQs4i9r15KZqV8Pu25YIuI/4db3Nz0D5ylerBivGArAQ3JVsCxFSmBBs4R
9KjHoOpWloN12k4PegKcf7R5ziGFpXGL24gzgx2QI3if/wuMgqwl9yokewVV+eFJ
tbu8x7MkyAju/Thg7ZwUbO0848bE3/gvHi2/zd5w+K1qAO/yyfE=
=sitF
-----END PGP SIGNATURE-----

--Apple-Mail=_2B747003-53F1-40C8-886E-B7F3CBECA80C--
