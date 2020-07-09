Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.6396.1594300574259196436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 06:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uYc5aC0o;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id b15so1761014edy.7
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
         :to;
        bh=+TZ7BLNbe03jyq7goBgKpkp/rH72QnGmMIdiMccQsE4=;
        b=uYc5aC0oS3CTi2nnGPrJ4odRRNw0cVdTgCRtvprLqw6uklTqTERpdKZZcXD00zXsTQ
         2DlhfT7cPQwjSt7riNEwrxJA2JJ3wk0FUqINxfmEmj/ogguRViC3dBOEOPzXuY3wEKI9
         yz9N5GUz5waWJ6clOUZ5lDfRkKVHDgdK7tqgapaFNDJ7nWb6rWxh/8lt9MahRUJjHI85
         VQ6qgkdoOcRirJtNHqueazVbNLFKnWNIbiAsr38H9+NLvYVKqNNNzu5ukT72/8JVdLOo
         sKyeOESS+jTSiWcxMaQ5AA6VgxG0pPurvsDPymEQL73VyoYFZxGQ4oUvNsCKHpsUI28/
         P1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :message-id:references:to;
        bh=+TZ7BLNbe03jyq7goBgKpkp/rH72QnGmMIdiMccQsE4=;
        b=V0gb8kNQRnRY68dnPwT4do88J2asb0vLv+J04cUp8izNugIfVjlBK/IL98UxIc3Q/b
         z6guvj8rXnaGFRAEYdSC9RW/8PZeDH9GWiWUw6FZyh6emMzuK+3igeP2fZcrXqWW2uwD
         6aDNGHyulycSrpxmdbf9nbK3UxfCC1FUNBH0Y9sFchwGX7FiVQnzwrmQ62gWicEt6VGJ
         9+DrVBUPU1nWnvIbl+/rCq6E2S6YnK+jEdWsFVzVABJLu1A1Ghk7fLI23RSOlxF5ZIZC
         iAlJcUidkyhjxNfeOTYxUD2x5EQewALWxZ7StZxp/OppIC1FvOH73jZvdF9on1wEA+A5
         vPgA==
X-Gm-Message-State: AOAM531smxREJgEZxMiIyAxELUDQvtGzjr0ABoGatMkmVSb9YU53nvdU
	7cemEQt12WeBXKzQL8i/IG0=
X-Google-Smtp-Source: ABdhPJx+PltPlM7vSxYfn17QRVcGpRiXZ9uhegdBiwN9z3Vjb9sN6DymIagEBA/LxfdcEcGkrD/C3A==
X-Received: by 2002:aa7:d5cd:: with SMTP id d13mr47843775eds.370.1594300572686;
        Thu, 09 Jul 2020 06:16:12 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id b11sm2010860edw.76.2020.07.09.06.16.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 06:16:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core][PATCH] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
From: "Jens Rehsack" <rehsack@gmail.com>
In-Reply-To: <CAP9ODKo9u6qQydVg_qhiSpZP_YwsHBO0EipQh8f2cemtY+PPng@mail.gmail.com>
Date: Thu, 9 Jul 2020 15:16:09 +0200
Cc: "Purdie, Richard" <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Message-Id: <BF038116-F9AB-401B-ADDA-0ACF1039CB8E@gmail.com>
References: <20200708195756.760-1-sno@netbsd.org>
 <CAP9ODKosgPup-Y3Ee-of+N9d9t+3GPHfZ4ZkfpE8PhJoxAkjTg@mail.gmail.com>
 <B0E130E3-E9C3-4D39-BFB1-9CE1D59345BE@gmail.com>
 <CAP9ODKo9u6qQydVg_qhiSpZP_YwsHBO0EipQh8f2cemtY+PPng@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 140480
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C3CAF7B2-5474-4A89-B27E-1D79866AEA75";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_C3CAF7B2-5474-4A89-B27E-1D79866AEA75
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 09.07.2020 um 13:52 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> Hello Jens,
>=20
> I've added Richard on Cc.

/o\

> Em qui., 9 de jul. de 2020 =C3=A0s 01:13, Jens Rehsack =
<rehsack@gmail.com> escreveu:
>>> Am 08.07.2020 um 23:20 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>>>=20
>>> Em qua., 8 de jul. de 2020 =C3=A0s 16:58, Jens Rehsack =
<rehsack@gmail.com> escreveu:
>>>>=20
>>>> Instead of recognizing only environment-setup scripts in
>>>> ${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk =
also into
>>>> ${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl =
installs
>>>> setup files.
>>>>=20
>>>> Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to =
clarify
>>>> whether nativesdk-openssl installs wrong content or =
buildtools-tarball:
>>>>   (nativesdk-openssl) =
tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
>>>>   (buildtools-tarball) =
buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf
>>>>=20
>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>=20
>>> I did not understand the openssl related change. Is it possible to
>>> rework the commit log so it is more detailed?
>>=20
>> For sure, but maybe I'm completely wrong. Let me try explaining it =
first...
>>=20
>> If - and only if - one creates an SDK which included openssl (and not =
libressl, mbedssl, ...),
>> nativesdk-openssl packages an =
${SDKPATHNATIVE}/environment-setup.d/openssl.sh
>>=20
>> OTOH - meta/recipes-core/meta/buildtools-tarball.bb creates a script =
which is sourced
>> at the very end of SDK environment setup and writes what's included =
in
>> {SDKPATHNATIVE}/environment-setup.d/openssl.sh on it's own - with =
maybe slightly
>> different location - what guides me to add:
>> ... to clarify whether nativesdk-openssl installs wrong content or =
buildtools-tarball:
>>   (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
>>   (buildtools-tarball) =
buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf
>>=20
>> Maybe they way how nativesdk-cmake is doing it is the right way. =
Then, maybe
>> nativesdk-openssl should be reworked. This is for clarification.
>>=20
>> Does it explain something better?
>=20
> Yes and generating it directly might indeed be not the best option.
> Ideally, it'd generate a new source script which would run later and
> do any need adjustment. Do you agree?

I have at least no idea. I just wondered and thought asking this way
is an option.

> Either way, this commit seems to be mixing two changes and I'd prefer
> if you split it. This allow for nicer review as well as better commit
> messages of individual changes.

Of course I can (and will) split both changes and discuss them =
separately.
But I rated it highly possible that I get the feedback: both are wrong.
It's intended and should be X and Y and please send an update for =
nativesdk-openssl :)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_C3CAF7B2-5474-4A89-B27E-1D79866AEA75
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8HGJkACgkQRJmWrtzl
Cp38yA//ciKOlSc7ZZBtzbhEcmmwqbxh68ZxqDUoNzOrT2bdezWjFBYkcRXd0srz
UHYzPZkn/e/xvnHd9It0lWZ3EGFiX4bBNzQZRZHDS9n5IU6zAnsSvwvkMboEgK7u
BJFqlKdPJ7/oMGJbE5CbW+q9w9EMBeMBNWQtNJxJUrLlxwyul/UX5DMXNVlyr/xq
7bgC4RawLC8B4c4dcS6/gYBRtAt07VFILLwqIu6U+g/8FdUnLWUliYA+nCqkoIhq
0up7lCAeXNNjQ1E107J13LVdSqxA1wIElJOQvhijFSydM7XewpdfXcsv7+OnDQKj
h/E8aFoHWvy5kR4phoJgYlK8HNrCwYNavrvWB7vb27wIKWm+5FuTJSFy/hE/T2kY
U716dTLfHpdJ3UuIMoGVFh7/BFegB24zPO6UOjwVr+ZufOqZCCabxc6KDU7Yt9lC
6VRQKsAPp5CE4OxQuAl0uEKC5DRWIV67SlHksqK9kDrxbwLkHklgA7giX/ISWG69
oI6q7IbHrnDFOocHpqzsbFf+jETRb/QGarIldBJ6gUy+/P0N43EiuFypD9xDRa/f
T70Yl1kOeixAlaq/o8kjpmi/hmvb2ltxwGU1py9gY99s3MR72yRsxCTqtXvyynFp
P8EX0xuJ6eynOg69b35pm5htvl8aBBlhXuF5CtYneyTFMn023nE=
=TKCk
-----END PGP SIGNATURE-----

--Apple-Mail=_C3CAF7B2-5474-4A89-B27E-1D79866AEA75--
