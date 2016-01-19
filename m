Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9E265CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 23:23:09 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cy9so459242496pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=8dPcBQQ23xb1n4RzA+x1ZzgZtH3aii6DGAOL9f9m3vQ=;
	b=FTYhzC13s8Ws+tcZgVQvwfdiwGodKCitBn3IsoNoz5xGpicpLsCPoMUaqiKklG2J6c
	JyxqkoIis6hp9XoQxu81FepMg69MFIU7MGqDAHR7YiM5+UlCXKsE0/eW92LTteSrA7Xb
	mGWwe+PkBTQhhfSVWF0pjNtZWPFgxR2X/mVosb0tCRasUOjMFylcp7IDs9qov3goMxwJ
	OpYpxkDGyCCBfqG9qj/vbafI0X5lGSjf3Iv9lfL8awhgwZ6AqT8qI/JMoKAD27ykz8El
	SF9wHog/b+We3V8IE7MIjKyX+pcb6n6kwXarIeM7L3H+ea+19nrUpsD1zfzWcx07DnPU
	nRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=8dPcBQQ23xb1n4RzA+x1ZzgZtH3aii6DGAOL9f9m3vQ=;
	b=amNEmvTS9QyjH/IbfEKy1nPTKFUomZVek4iqg9hEFk2JhtYa6LxluJYTp6hyjG5NdY
	rlWp0nykRnnakfX03cVBDMmoO5DqW81kvA0/dfsBMz+dirlp73Z99ohfnIFCfLBBvmEk
	PjMohdXV8lohoGWhcVY5ED1LcbEjBkk0Xce1liEoWVL5hYztU7AG18OLS0uI1HVO9hRB
	Vb+KyOWur9Q8RHTFrFFAc5jIxBGprHOJFmTgWidNjyhz080TYZzucNlhXlLsECMQ4Det
	PzG2x7wOTB7QQCCbE10hfT7HjjJJflPBLlinmoeKyBpyNw6ySmfDMLqkOqbfZ7lvrM+e
	mj/Q==
X-Gm-Message-State: ALoCoQk8xuGKGuXTi8jDgQrz0czecwvFk2QND71eUWWMm+aDBTxL1DQa6NXJLk7ZmzzyS8DxDHvP/PnbIApxz7QhocfRgDhl4Q==
X-Received: by 10.66.102.9 with SMTP id fk9mr47668429pab.77.1453245790527;
	Tue, 19 Jan 2016 15:23:10 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	16sm43892369pfh.48.2016.01.19.15.23.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 15:23:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=WSMw4f0tC0=MVqHE+gPJ_5N4MpLNGW8m7Gy2xgsQcmZw@mail.gmail.com>
Date: Tue, 19 Jan 2016 15:23:08 -0800
Message-Id: <B84185CF-3666-49D6-A3FB-3FBCBBFE6B17@gmail.com>
References: <569DE54C.7090506@windriver.com>
	<4D27B3F8-BDBC-43AF-A54C-E4B556388202@gmail.com>
	<CAJ86T=WSMw4f0tC0=MVqHE+gPJ_5N4MpLNGW8m7Gy2xgsQcmZw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [BUG REPORT] failed to build valgrind on qemuarm
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
X-List-Received-Date: Tue, 19 Jan 2016 23:23:11 -0000
X-Groupsio-MsgNum: 76465
Content-Type: multipart/signed;
	boundary="Apple-Mail=_97019DFA-28EF-4EA0-A6C6-A86889CD43F9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_97019DFA-28EF-4EA0-A6C6-A86889CD43F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 19, 2016, at 1:38 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Tue, Jan 19, 2016 at 1:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Jan 18, 2016, at 11:27 PM, Rongqing Li =
<rongqing.li@windriver.com> wrote:
>>>=20
>>> 2: on qemuarma9
>>>=20
>>> | arm-wrs-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dsoftfp  =
-marm -mthumb-interwork =
--sysroot=3D/work/wr/buildarea/arm/bitbake_build/tmp/sysroots/qemuarma9 =
-DHAVE_CONFIG_H -I. =
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnuea=
bi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests -I../.. =
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnuea=
bi/valgrind/3.11.0-r0/valgrind-3.11.0 =
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnuea=
bi/valgrind/3.11.0-r0/valgrind-3.11.0/include =
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnuea=
bi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind -I../../include =
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnuea=
bi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub -I../../VEX/pub =
-DVGA_arm=3D1 -DVGO_linux=3D1 -DVGP_arm_linux=3D1 =
-DVGPV_arm_linux_vanilla=3D1   -Winline -Wall -Wshadow -Wno-long-long -g =
-fno-stack-protector    -O2 -pipe -g  -fno-omit-frame-pointer =
-fvisibility=3Ddefault -O0 -c -o sh-mem-random.o =
/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi=
/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/sh-mem-random.c
>>> | {standard input}: Assembler messages:
>>> | {standard input}:1107: Error: selected processor does not support =
ARM mode `vld1.64 {d7},[r3]'
>>> | {standard input}:1107: Error: selected processor does not support =
ARM mode `vst1.64 {d7},[r2]'
>>> | Makefile:2467: recipe for target 'sh-mem-random.o=E2=80=99 failed
>>=20
>>=20
>> So you disable neon but do not choose a particular implementation =
which allows so. e.g. you should have -mtune=3Dcortex-a9 which allows =
neon to be optional
>> but thats probably just the semantic thing. Below code should check =
for __ARM_NEON__ internal define being set as well before resorting to =
use neon instructions.
>=20
> It's a test app which is failing, so I think we have 3 solutions:
>=20
> 1) Disable tests which don't build for all supported targets (the
> traditional OE approach). See:
>=20
>  =
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/v=
algrind/valgrind/remove-arm-variant-specific.patch
>=20
> 2) Tweak CFLAGS so that the test always compiles but fails at run-time
> on non-neon targets.
>=20
> 3) Tweak test code so that it avoids NEON instructions on non-neon
> targets (risk then is that the run-time test will appear to pass on
> non-neon targets when it should actually fail).
>=20
>=20
> Any preference?

option 3


--Apple-Mail=_97019DFA-28EF-4EA0-A6C6-A86889CD43F9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaexVwACgkQuwUzVZGdMxQZCQCfW/3F/1olBTGTbciOYw9Tj2KB
TGcAn26E278z6QO4Pc0pTA2cGq441gv0
=U7hL
-----END PGP SIGNATURE-----

--Apple-Mail=_97019DFA-28EF-4EA0-A6C6-A86889CD43F9--
