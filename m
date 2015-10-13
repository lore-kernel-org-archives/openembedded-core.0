Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id A5C9165C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:52:01 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so26438955pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=L5i0FzTnsu8JZ2RlOOODnNtmy0TTmmyO7RVmbqNKqrE=;
	b=DFByAAHPAcBgF/oEl1ng3hlXbZZaBs3C9APMheAzbXyvJSvTRJ/h6HJpu1Zqhk0H8Z
	aMJadTIwm5wOLWXwS/77+v+y3qUYPhBVRTsBky30EK1Ybx8zhhKRIUx4tgDvx9yE50Gv
	Joq7dJmvWUhVYtvNrIej2y/SszWAJ5YTMrTxSABtTM0bDFfOTPZ1xPzTIeok95NzZtzj
	veZXyp1fmQqkynsj0ea9gQJ2npFyLQLo3HvwYTLc30p8npH5/dk9dezuIxUzYDp3XpS6
	lIuVwOmkAiAWnbS7auXkkF3tYLvpHoLqXfUd3VYyf3LRu5ZndaD8+D8f/noBzlos2YWO
	XjPw==
X-Received: by 10.67.3.167 with SMTP id bx7mr41859235pad.47.1444755122111;
	Tue, 13 Oct 2015 09:52:02 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f002:9d80:e725:c0fd?
	([2601:646:8601:4580:f002:9d80:e725:c0fd])
	by smtp.gmail.com with ESMTPSA id
	yz3sm4838020pbb.37.2015.10.13.09.52.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Oct 2015 09:52:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
Date: Tue, 13 Oct 2015 09:52:00 -0700
Message-Id: <2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3096.1)
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 13 Oct 2015 16:52:04 -0000
X-Groupsio-MsgNum: 72126
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6092A8D2-0E0C-4C75-82FF-66CA56CB0DB8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6092A8D2-0E0C-4C75-82FF-66CA56CB0DB8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 13, 2015, at 9:45 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> Hello,
>=20
> =46rom time to time I see following error:
>=20
> | /usr/bin/install -c -m 644
> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
> | /usr/bin/install -c -m 644
> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
> | msgfmt -o rw.mo rw.po
> | /bin/bash: msgfmt: command not found
> | Makefile:84: recipe for target 'rw.mo' failed
> | make[2]: *** [rw.mo] Error 127
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory
> =
'/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnuea=
bi/glibc/2.22-r0/git/po'
> | Makefile:234: recipe for target 'po/subdir_install' failed
>=20
> and it seems to happen when a rebuild of glibc is triggered due a
> change in the sstate hash. The host is a very minimal system so it
> explains why it does not provide the msgfmt in host and also might
> explain why it is not being catch in Yocto Project AB.


are we missing a dependency on gettext-native ? it could be that AB =
slaves have gettext installed on host
and you don=E2=80=99t.

--Apple-Mail=_6092A8D2-0E0C-4C75-82FF-66CA56CB0DB8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYdNrAACgkQuwUzVZGdMxRKJACeIvoGBURtBDjdxQmqLEZ0H+ss
aRoAnR8ChYlz+6laSipKFfJYFAcBuZmY
=05dl
-----END PGP SIGNATURE-----

--Apple-Mail=_6092A8D2-0E0C-4C75-82FF-66CA56CB0DB8--
