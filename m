Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.4411.1594267990485038114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 21:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cGqe8Qcw;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id z17so695970edr.9
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
         :to;
        bh=/v9XmdDfVuQ1XO9rmpUOaBRcMiJeZ/FvdcrGYDUrwDQ=;
        b=cGqe8QcwAfHVZJR8hHaSfBktcdgIME/nhrr3rXEkZLMh2B8uXA4I4qgzdEy74+fKPc
         fbXpdUbEbILDudo+pPcYxO6vsaRCQ1P0HMXHYyeiAG/n+hI/2HWE0RtF/3cVHIubJMin
         noRCBVfyGCGYGE+oA71+ll9ywqAPcnhzy6EFFUMs2sj1K9/KJBXTK5WgEJLvnMx5Qbb4
         UYkdBv4kE49/fCMFjY0J38+5KNjtgpL9XNfl6nTPVzAea42chd7Bl7l+l4QklI+WKa5x
         5xtCRq4xMvexOX7HJ2J0rzB1T5Xzctdo3DEiPvy6N8XSGFUo6Rl/913wrXNpyV0xvTsl
         2HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :message-id:references:to;
        bh=/v9XmdDfVuQ1XO9rmpUOaBRcMiJeZ/FvdcrGYDUrwDQ=;
        b=rjut3IyPf5im7ajjbMDRSeo90tKDYSLqgX8ps0KhI3/ahpNQ9BTcE/yiV8TKkdHCk1
         Ip9owI1Hxj10VnwkxjOuf1X4p9+t3q0g0d1g3YbwVKEbhjfkyXGMnpiIZzulYWJIRl9q
         UrmwxMF1Or4W9QGT7HtogM2tT9tIVLV2JALdnWYZGt37oSOY6XhH23gsbC2i46oDYUaN
         IVV9tRxC84JHLborLobS1EZ2nZDDwvdhyeQfNhuMlyr+Oai7DdlOdwP5S5XcTx7eDs8N
         8Hm82S0FViTA/1SGN7TQdycrV5bcxOFnM+VJ/uAH0D9WJMztWuC/bQCeSFN/hNrgzHm5
         R71w==
X-Gm-Message-State: AOAM531P5lru0xjyd5/Q3+FKbKYXwyL2LPSIbx28Xp2/yHh8j0/vtAnp
	HWDE/JDuSVpb68sHED1iA0U=
X-Google-Smtp-Source: ABdhPJwtrdNEh33OnGVf8NuYjqJ8sJso191TpjR8zx+Tl9jG8Lhiudnq5n0z/huxL7qB4SZZupXyNg==
X-Received: by 2002:aa7:c54f:: with SMTP id s15mr72646033edr.175.1594267988693;
        Wed, 08 Jul 2020 21:13:08 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from ernie.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id g21sm1060450edr.45.2020.07.08.21.13.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 21:13:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core][PATCH] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
From: "Jens Rehsack" <rehsack@gmail.com>
In-Reply-To: <CAP9ODKosgPup-Y3Ee-of+N9d9t+3GPHfZ4ZkfpE8PhJoxAkjTg@mail.gmail.com>
Date: Thu, 9 Jul 2020 06:13:05 +0200
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Message-Id: <B0E130E3-E9C3-4D39-BFB1-9CE1D59345BE@gmail.com>
References: <20200708195756.760-1-sno@netbsd.org>
 <CAP9ODKosgPup-Y3Ee-of+N9d9t+3GPHfZ4ZkfpE8PhJoxAkjTg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 140459
Content-Type: multipart/signed;
	boundary="Apple-Mail=_69A053CE-B645-4C34-B2FD-049456BD32D7";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_69A053CE-B645-4C34-B2FD-049456BD32D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 08.07.2020 um 23:20 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> Em qua., 8 de jul. de 2020 =C3=A0s 16:58, Jens Rehsack =
<rehsack@gmail.com> escreveu:
>>=20
>> Instead of recognizing only environment-setup scripts in
>> ${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk =
also into
>> ${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl =
installs
>> setup files.
>>=20
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
>=20
> I did not understand the openssl related change. Is it possible to
> rework the commit log so it is more detailed?


For sure, but maybe I'm completely wrong. Let me try explaining it =
first...

If - and only if - one creates an SDK which included openssl (and not =
libressl, mbedssl, ...),
nativesdk-openssl packages an =
${SDKPATHNATIVE}/environment-setup.d/openssl.sh

OTOH - meta/recipes-core/meta/buildtools-tarball.bb creates a script =
which is sourced
at the very end of SDK environment setup and writes what's included in
{SDKPATHNATIVE}/environment-setup.d/openssl.sh on it's own - with maybe =
slightly
different location - what guides me to add:
... to clarify whether nativesdk-openssl installs wrong content or =
buildtools-tarball:
   (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
   (buildtools-tarball) =
buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf

Maybe they way how nativesdk-cmake is doing it is the right way. Then, =
maybe
nativesdk-openssl should be reworked. This is for clarification.

Does it explain something better?

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_69A053CE-B645-4C34-B2FD-049456BD32D7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8GmVEACgkQRJmWrtzl
Cp0cVBAAmnrtzKJm080IBFSthm7i4/NxDHGIgjysAO96ztBa++Vb/IVaF+zdFUM9
iDJpRxJ5uRgnHBHlRVON2adf1QE0gmrq+mHuCZPEdOYKg1UCVUiraOSmW6rejSbE
1bgHrEqAL3ENtUvNOtHN7RaJ2hF8xfdlzWn/3vj9DxiX6uQEOtoUuOH6Rv4g/7IX
yWO2Wm9xfNYlVgqhbDcfblnIg7y/5lzd46MR5Us1zf5V9nVlaQ72knayRzO9OMGh
jGiEVv9VydBERFvcGjPJKM0Qju54E82w/5EuCbuWVne033n+O3oCnLNZ0W88eMt5
Any8/Fnt+zHOO1A2Fr7m9b30eow0xM/aH5NbStxeIC6TT1Jrxa7bQe6/ycIIwMvj
Hkm5ndEoAfeViUUM/IqfmKSg1UmMi0ocT7uBR445hQXj1lDkLiKhwQ9INjisneBA
xdl46EweR5h0EFxolmsh7cel9RnYSZKrP7snzppqY3qUqLOB0GltXffSFdF1iVEj
YOwSVcLVw9lnmUTzmr6pKz1zLeyQgSZdWJsdj02uhPXgIwzOHAF8x92GNXHLF/j4
Lahev7pZmVSsXCaG2a0LIdJzs02TKb3ha5IDJT5Er1eaHpIM3azVHbgzkEp7StLJ
jJHhAP+9D4yvQecAkU47uCc3h9ecX2jvGZTY+cyJ1Oz+lbBPDJA=
=eRrP
-----END PGP SIGNATURE-----

--Apple-Mail=_69A053CE-B645-4C34-B2FD-049456BD32D7--
