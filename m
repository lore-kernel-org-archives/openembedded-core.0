Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id C38B977016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:10:37 +0000 (UTC)
Received: by padcn9 with SMTP id cn9so11770590pad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 22:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=nX3HCuCM4BnVVtjpFP2T1p8WfGq/i3RewA8j91HqCnU=;
	b=lBrbHhh9WFehtipKrB8YpLezz1uuD25k/ajwQPdWmfgK2lnwWlky66jyzfwU0FVULw
	VQdVH08+CX++Az5T6c1KakZ5/VhTVXG3PGdot6KS2OBpzbDLn5U8u57ieH/5h7UhRNoD
	ArpWqeIIsM9JNVbBotmxE0mPxfOBuluxwA+xH5A91nBJSYXrvZnvSqm+DH4vh6wIrqfx
	nJxevTpKQhtPgPXEqiVl0DfXB9NEmNEiytnYHQzZ5Lat/DZ2ZqUKFNy96I1tH18HhYWS
	f5I6rrn1QZXslPpUnjVMNufd0cDIp55P4QmPHepieePOCgMHxCW9/2thiBtbj0/dluCD
	U0VA==
X-Received: by 10.66.101.106 with SMTP id ff10mr1617740pab.100.1444799437670; 
	Tue, 13 Oct 2015 22:10:37 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	cw5sm6918193pbb.49.2015.10.13.22.10.36
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Oct 2015 22:10:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444798997.3844.47.camel@linuxfoundation.org>
Date: Tue, 13 Oct 2015 22:10:34 -0700
Message-Id: <B678E6C6-E7F6-4256-84D9-C53DE739D630@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
	<1444798997.3844.47.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3096.1)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc build error when it is rebuild due hash mismatch
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
X-List-Received-Date: Wed, 14 Oct 2015 05:10:38 -0000
X-Groupsio-MsgNum: 72159
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CA946D0D-9DB2-4CFE-95DA-551D4AE8D423";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CA946D0D-9DB2-4CFE-95DA-551D4AE8D423
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 13, 2015, at 10:03 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Tue, 2015-10-13 at 09:52 -0700, Khem Raj wrote:
>>> On Oct 13, 2015, at 9:45 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>>>=20
>>> Hello,
>>>=20
>>> =46rom time to time I see following error:
>>>=20
>>> | /usr/bin/install -c -m 644
>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
>>> | /usr/bin/install -c -m 644
>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
>>> | msgfmt -o rw.mo rw.po
>>> | /bin/bash: msgfmt: command not found
>>> | Makefile:84: recipe for target 'rw.mo' failed
>>> | make[2]: *** [rw.mo] Error 127
>>> | make[2]: *** Waiting for unfinished jobs....
>>> | make[2]: Leaving directory
>>> =
'/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnuea=
bi/glibc/2.22-r0/git/po'
>>> | Makefile:234: recipe for target 'po/subdir_install' failed
>>>=20
>>> and it seems to happen when a rebuild of glibc is triggered due a
>>> change in the sstate hash. The host is a very minimal system so it
>>> explains why it does not provide the msgfmt in host and also might
>>> explain why it is not being catch in Yocto Project AB.
>>=20
>>=20
>> are we missing a dependency on gettext-native ? it could be that AB =
slaves have gettext installed on host
>> and you don=E2=80=99t.
>=20
> Agreed, this does look like a missing gettext-native dependency
> somewhere in the system. Unfortunately gettext(native) is a pretty =
heavy
> dependency too :(

We have two options
1. Ask for it on host ( can cause discrepancies)
2. Workout glibc to not rebuild message catalogs at any cost.

--Apple-Mail=_CA946D0D-9DB2-4CFE-95DA-551D4AE8D423
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYd48oACgkQuwUzVZGdMxTu/wCghoFQYQQy1pUKe8rM/jfu3Gip
fjsAn1SXe33MjZatW8G4jeQ9Q6ksoq2b
=lOyB
-----END PGP SIGNATURE-----

--Apple-Mail=_CA946D0D-9DB2-4CFE-95DA-551D4AE8D423--
