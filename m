Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3965773FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 16:03:53 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so17928955pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YKa7A8+ZfA9gjcE2sk6yp/RUtABtAyZ+41BPuvK9+mQ=;
	b=NRt5tC00j++/aYeLNPOuW7pmP8BO11iuDvVQBVwcplIdTtOHJsB+Ro9EnCEwLRmt8v
	SO4AVXZVVrBHOmaOf4nkkXPUaHMBbX+Qh7Uu+Fbn0N697G9ZvV+onrS0qDPiCoVxQ60G
	hPTTgb5AsdmIMal25f+4vfu5WXA0RCP2ZgweLYBWNo5G4o19MIHggC8t/qG4AoeBPgyK
	08dAuJ7F5f1YRyShkIgYQmm9LMnPTs+/lxcvZhJVckvmv4wUXJ4ewfaLEWLUSgN1Rtp0
	NMjLutiXpHwRPnrRD4ADYaNegWYNJsO0kXDPpnt5oGNLpIQiwJDEfjetDyTGvq1Ce0mA
	exmg==
X-Received: by 10.70.131.33 with SMTP id oj1mr29103732pdb.3.1431446634529;
	Tue, 12 May 2015 09:03:54 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	ap9sm16740221pad.42.2015.05.12.09.03.52
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:03:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431415680.30971.114.camel@linuxfoundation.org>
Date: Tue, 12 May 2015 09:03:41 -0700
Message-Id: <538BB22D-9434-4BF4-B1F7-37C6B2919949@gmail.com>
References: <1431363297.30971.76.camel@linuxfoundation.org>
	<5551395B.60503@gmail.com>
	<CAMKF1srBkzXSiVyo27LbF0TYb6AjxB_Z++no3QyJ9VJwJHFFWw@mail.gmail.com>
	<1431415680.30971.114.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc5: Add PR65779 patch to fix powerpc compile issues
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
X-List-Received-Date: Tue, 12 May 2015 16:03:55 -0000
X-Groupsio-MsgNum: 65457
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F014F3DD-31EB-460F-8CC6-72F27A1C3A49";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F014F3DD-31EB-460F-8CC6-72F27A1C3A49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 12, 2015, at 12:28 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2015-05-11 at 17:24 -0700, Khem Raj wrote:
>> On Mon, May 11, 2015 at 4:20 PM, akuster808 <akuster808@gmail.com> =
wrote:
>>>=20
>>>=20
>>> On 05/11/2015 09:54 AM, Richard Purdie wrote:
>>>>=20
>>>> This fixes compile issues on powerpc with gcc 5 which show up with
>>>> errors like:
>>>>=20
>>>> | make[2]: Entering directory
>>>> =
'/media/build1/poky/build/tmp/work/ppc7400-poky-linux/xprop/1_1.2.2-r0/bui=
ld'
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=3D7400
>>>> --sysroot=3D/media/build1/poky/build/tmp/sysroots/qemuppc -Wall
>>>> -Wpointer-arith -Wmissing-declarations -Wformat=3D2 =
-Wstrict-prototypes
>>>> -Wmissing-prototypes -Wnested-externs -Wbad-function-cast
>>>> -Wold-style-definition -Wdeclaration-after-statement -Wunused
>>>> -Wuninitialized -Wshadow -Wmissing-noreturn =
-Wmissing-format-attribute
>>>> -Wredundant-decls -Wlogical-op -Werror=3Dimplicit -Werror=3Dnonnull
>>>> -Werror=3Dinit-self -Werror=3Dmain -Werror=3Dmissing-braces =
-Werror=3Dsequence-point
>>>> -Werror=3Dreturn-type -Werror=3Dtrigraphs -Werror=3Darray-bounds
>>>> -Werror=3Dwrite-strings -Werror=3Daddress =
-Werror=3Dint-to-pointer-cast
>>>> -Werror=3Dpointer-to-int-cast -fno-strict-aliasing  -O2 -pipe -g
>>>> -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu =
-Wl,--as-needed
>>>> -o xprop dsimple.o clientwin.o xprop.o -lX11
>>>> | =
/media/build1/poky/build/tmp/sysroots/qemuppc/usr/lib/../lib/libX11.so:
>>>> undefined reference to `.LCL2'
>>>> | collect2: error: ld returned 1 exit status
>>>>=20
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>=20
>>>=20
>>> Acked-by: Armin Kuster <Akuster808@gmail.com>
>>>=20
>>>=20
>>> this fixes all but one package(lzop) failure on qemuppc base yocto =
world
>>> build.
>>>=20
>>=20
>> I am fine witj this patch for now, since we are mostly build testing,
>> we have to keep in mind
>> its a codegen bug and can bite us at runtime. I am just hoping for an
>> update to this patch and that will eliminate
>> that doubt.
>=20
> Agreed, an update upstream would obviously help. FWIW the automated
> runtime tests did look reasonable on the autobuilder apart from:
>=20
> core-image-sato-sdk has a problem with the C++ toolchain not finding
> limits (all arches).
>=20

hmm thats interesting. Can you point to an error for more details ?

> qemuarm is not booting (minimal, sato or sato-sdk).

yes I have had problems with linux-yocto on emulator too.

>=20
> However these issues were present before the patch so I don't think =
its
> related.

right

>=20
> Since the failures list is better with the patch I'll merge it until
> something better comes along.

thats OK


--Apple-Mail=_F014F3DD-31EB-460F-8CC6-72F27A1C3A49
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSJGcACgkQuwUzVZGdMxSV1QCbBLDQM2fWRgiNHqrk/kb3wwDp
yZMAoJDC4mATPWg9XP0Wwna/M/brwinY
=yheS
-----END PGP SIGNATURE-----

--Apple-Mail=_F014F3DD-31EB-460F-8CC6-72F27A1C3A49--
