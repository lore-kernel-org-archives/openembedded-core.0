Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2BA6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 19:35:45 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id h186so10821570pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=AcxVt4ynA87kJKSrnol7JotuLNKxdp3unAIIhsMrQW0=;
	b=X7BmbaTdErv93u9BymYbZxVO1g2vcJ8Hb6kvCaLxytl7QK+yQUbtLqLusFg8RFfPcL
	UxnE8uDerxBMopNjjvBGpnGDdsPYYakHtXAiCeV69djJFJ67adndm4/88CM7NgsrjPnA
	+5M1Ub5FkZArM5P5R2BLVtFreeVOcUJ2e65LmCa8JRRIhMzaSu21JRsbANXUeI5dnZaS
	k+G4gMpLxbmFhEAxe906VXNBPn/oehRIskhxdrggUKbeM2I8ZUNZYAwYL03hR8Ujzsnb
	N8Q34mRs/tke31y1fGJDdQFTIJpf6Co4b5mWo1/6x+jwIfQ8o7+/xcNpInlPDOWVYYnQ
	cWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AcxVt4ynA87kJKSrnol7JotuLNKxdp3unAIIhsMrQW0=;
	b=lIUdeQL29s4rPOkbaRvmOwKRaWH0mthNjgXxLcuc+DTtk+C96SbbRiYgB2OOIxBe7w
	1Dc1wKpuGbJnM3uauutJYfMNvSz3z1kbAE+QJVXlLG5YgTkbzX/f1bZlauEP0Kw3/v/V
	Rt59kRj3zAgLPOb957ZeYR/rOCyloGislLHSj6zdwVsl2dKAuNdhb0JxcCFsHYuUrW/O
	EHn964iI8sxDVyhLfloU3MeJe45FlJcGNPPzRlIXjLEe+tA6f660u8nU0dr0sJ8ajGwi
	ReRYFxYf6LleM8zEoseG9R2llPV2nZ684zz87w1akIsb6YT/jlavZwSvvULV2rzcUhBn
	jyHQ==
X-Gm-Message-State: AE9vXwOrzYWCwGTNsbj/GDbZiD9+7QZZnRyy1wod+/7qqc7nyZ8byMlBKJUVYsykcH3mVw==
X-Received: by 10.98.13.84 with SMTP id v81mr9352939pfi.108.1472585746378;
	Tue, 30 Aug 2016 12:35:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:c41a:14c:2188:df04?
	([2601:646:8882:b8c:c41a:14c:2188:df04])
	by smtp.gmail.com with ESMTPSA id
	c66sm59095464pfd.24.2016.08.30.12.35.43
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Aug 2016 12:35:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
Date: Tue, 30 Aug 2016 12:36:33 -0700
Message-Id: <FB035085-D1DE-41C6-A40E-5F74745D908E@gmail.com>
References: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
To: Jack Mitchell <ml@embed.me.uk>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc 6.1+ and isystem
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
X-List-Received-Date: Tue, 30 Aug 2016 19:35:47 -0000
X-Groupsio-MsgNum: 86578
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6E724455-06CB-4101-AC85-DF06D83E1CA4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6E724455-06CB-4101-AC85-DF06D83E1CA4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 30, 2016, at 8:37 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>=20
> Some of the headers shipped with gcc 6.1 and above now use =
#include_next to try to and do clever things with munging system header =
files. Our injection of isystem into the build at =
'meta/conf/bitbake.conf' seems to be causing some programs to fail to =
compile. A full explanation can be found at [1], a bug report from GCC =
specifying that it should only be used in extreme cases at [2].

you can say with isystem gcc let its users play smart things with its =
internal header search path order.

>=20
> Since we seem to be adding -isystem unconditionally to BUILD_CFLAGS =
from bitbake, and that the default behavior has now changed should this =
be revisited? I'll admit that I am no where near experienced enough with =
GCC and friends internals to make a call on this one, I'm just looking =
for some input.
>=20

Yes, I am aware of this fact and there has been a change to remove =
-isystem from BUILDSDK_CPPFLAGS, the problem with
BUILD_CPPFLAGS is different since it was added intentionally to override =
the system headers is in direct conflict with
what -isystem use is recommended for. If we were just complementing the =
default system includedirs it would be different
however. Should be not use -isystem by default systemwide ? may be. but =
we need to understand the effects
where, we now more or less build host packages against our own staged =
headers and link/run them using the hosts
libraries and this combination has been working however ugly it may look =
like. It also means we are using same headers
across all host distros which is good but then we run the host apps =
against the host libraries, causing another combination
more than often host systems have injected bugs into tools ( e.g. cross =
compilers ) which have shown to exhibit on target
very hard to trace issues like such have happened.

Can we then just act as a fallback to provide missing headers, after =
system headers, it falls into same problems or ordering
and while the header might be found in build sysroot, another header =
that this header needs may be needed from system

may be some tests by removing this from build options could be tried =
out, native packages like qt5 and  python3
should be tested since those definitely play their own games with =
headers.


> Regards,
> Jack.
>=20
> [1] =
http://stackoverflow.com/questions/37218953/isystem-on-a-system-include-di=
rectory-causes-errors
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129


--Apple-Mail=_6E724455-06CB-4101-AC85-DF06D83E1CA4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfF4EYACgkQuwUzVZGdMxTiXwCeMKOIz4vueIv7IjBSTIC+jdjY
BjwAn2SZz4RXSV8kiss+rRvaDpf0/8/z
=zKZS
-----END PGP SIGNATURE-----

--Apple-Mail=_6E724455-06CB-4101-AC85-DF06D83E1CA4--
