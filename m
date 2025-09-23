Return-Path: <andrew.shadura@collabora.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91540CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 13:43:13 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
 by mx.groups.io with SMTP id smtpd.web11.17224.1758634992459762937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 06:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@collabora.co.uk header.s=mail header.b=ZBSpzKcu;
 spf=pass (domain: collabora.co.uk, ip: 148.251.105.195, mailfrom: andrew.shadura@collabora.co.uk)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
	s=mail; t=1758634989;
	bh=wwP1YHnTlDJZKuCqYg6UP/s5M0HU2+Q0H82GsCyyuJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZBSpzKculC/g45XeFRA2DPOcKL+CH3NuG/vS8Sp1M+6inOjkq5ZV/zIXqgu8/+JKI
	 IkE4yaHwjFOlG8yz1q/KIrIoms8ccXFwLH3yzphDcyRUaQryDz+IJhFAyAII+FvxIK
	 TUd60A+1CdtY3Ob/w9oBBEFyTOuNV/GL57+0jHisYmr9ndl7/tcsNeUVJLK80KhUuF
	 bXrwVIgYPv8/WtRIHCAqx1NHNoklDJ0uav97Wik+GeF59kOINpBLYfHi0zYjuK2l+Y
	 64ucq0G46nZzaUsNgNtzoTdE0gQMiIwCMzxX8PY5EBMTBkzbC59oGNKajN4TLJ3rOW
	 Um1UgvTFcexkg==
Received: from [IPV6:2a01:c846:1a49:2b00:56c1:507e:525a:a648] (unknown [IPv6:2a01:c846:1a49:2b00:56c1:507e:525a:a648])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrewsh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACE5F17E0125;
	Tue, 23 Sep 2025 15:43:09 +0200 (CEST)
Message-ID: <86472a10-6e12-47ed-83e5-e0842ece9849@collabora.co.uk>
Date: Tue, 23 Sep 2025 15:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
 <CANNYZj_AfcRqE0sOpkfOizCVwPHq2OPbhTgVxTMomvDeHsr5ig@mail.gmail.com>
Content-Language: en-GB, sk-SK
From: Andrej Shadura <andrew.shadura@collabora.co.uk>
Autocrypt: addr=andrew.shadura@collabora.co.uk; keydata=
 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
 lu6jeag=
Organization: Collabora
In-Reply-To: <CANNYZj_AfcRqE0sOpkfOizCVwPHq2OPbhTgVxTMomvDeHsr5ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 13:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223879

Hello,

On 23/09/2025 10:58, Alexander Kanavin wrote:
> On Tue, 23 Sept 2025 at 09:23, Andrej Shadura via
> lists.openembedded.org
> <andrew.shadura=3Dcollabora.co.uk@lists.openembedded.org> wrote:
>> Unfortunately, I don=E2=80=99t know how to make pseudo compatible with=
 such a
>> setup. Any hints?
>=20
> You need to remove these:
> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_TIME_BITS=3D64
>=20
> pseudo is a special syscall wrapper, and handles both 32 and 64 bit
> versions directly.

Thanks, but this doesn=E2=80=99t seem to help:

> cc -fno-strict-aliasing -g -O2 -Werror=3Dimplicit-function-declaration =
-ffile-prefix-map=3D/tmp/pseudo=3D. -fstack-protector-strong -fstack-clas=
h-protection -Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SO=
URCE=3D2 -Wl,-z,relro -pipe -std=3Dgnu99 -Wall -W -Wextra -Wno-deprecated=
-declarations -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE  -DPSEUDO_PREF=
IX=3D'"/usr"' -DPSEUDO_SUFFIX=3D'""' -DPSEUDO_BINDIR=3D'"bin"' -DPSEUDO_L=
IBDIR=3D'"lib/arm-linux-gnueabihf/pseudo"' -DPSEUDO_LOCALSTATEDIR=3D'"var=
/pseudo"' -DPSEUDO_VERSION=3D'"1.9.2"' -DUSE_MEMORY_DB  -DPSEUDO_PASSWD_F=
ALLBACK=3D'""'   -DPSEUDO_XATTR_SUPPORT        -O2 -g  -D_GNU_SOURCE -c -=
o pseudo_wrappers.o pseudo_wrappers.c
> {standard input}: Assembler messages:
> {standard input}:27890: Error: symbol `open64' is already defined
> {standard input}:29137: Error: symbol `openat64' is already defined
> {standard input}:40611: Error: symbol `__openat64_2' is already defined
> {standard input}:52324: Error: symbol `creat64' is already defined
> {standard input}:62317: Error: symbol `__fcntl_time64' is already defin=
ed
> {standard input}:65383: Error: symbol `fopen64' is already defined
> {standard input}:67189: Error: symbol `freopen64' is already defined
> {standard input}:68434: Error: symbol `__fstat64_time64' is already def=
ined
> {standard input}:69773: Error: symbol `__fstatat64_time64' is already d=
efined
> {standard input}:72313: Error: symbol `__ftw64_time64' is already defin=
ed
> {standard input}:80574: Error: symbol `__glob64_time64' is already defi=
ned
> {standard input}:87427: Error: symbol `__lstat64_time64' is already def=
ined
> {standard input}:96082: Error: symbol `mkostemp64' is already defined
> {standard input}:97837: Error: symbol `mkstemp64' is already defined
> {standard input}:100838: Error: symbol `__nftw64_time64' is already def=
ined
> {standard input}:107235: Error: symbol `scandir64' is already defined
> {standard input}:126141: Error: symbol `__stat64_time64' is already def=
ined
> {standard input}:127725: Error: symbol `statvfs64' is already defined
> {standard input}:134601: Error: symbol `truncate64' is already defined
> make[1]: *** [Makefile:159: pseudo_wrappers.o] Error 1


--=20
Cheers,
   Andrej

