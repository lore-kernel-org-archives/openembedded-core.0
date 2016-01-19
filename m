Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABBB731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:00:29 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e65so181908659pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=XNG5Ajsyyssj/lDL9LdIqhk9dUEDQI6FgZGmbX0CiB8=;
	b=KAo6sRB/KFN7pRkRCWqerf0LRxbSOphHCT5lliEWuLOUdG3WZIR10wQ4yjV+Z64J6/
	Q/L02Z+m9h2JFJUTOEDhiUQb1QDMCdjYjgn7hFN3x5tArtq+GQLqZ+TwPyIri8/PQtpH
	yEJ2DJp89Cclia0ZC56GY9Rk2rcZX+Iek/mSlkQMYmt47cimLVrmvEXlaJmDJA2tNJcZ
	fhD0Cp4ClVLnsbCtqAFOeW2kDMgUdIffJavWsdGVM7CA95c5pQYRGc4ZX6tJTV1+98Pm
	Lc/0ybxlHpkOmXz5m9aX7T+Mau5zAWYm561Q4+YHV1JPqUbOiTlcczB6gnQKvjR4kt5g
	/K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=XNG5Ajsyyssj/lDL9LdIqhk9dUEDQI6FgZGmbX0CiB8=;
	b=MdtC6fLLMLvwIY/ZKrKzhjmBEORQ7DJ5MLTE9UD+Gw6/v1vcULRssnTcJx1x+UzNgx
	YUQzEAPilnpI3PG7VddqjeUG1gBGBBE5vxUhAMX6eokQa6bvqbZ6O9PxZ+Td1KKBBRsy
	MaCGOwbLGql/H3Vj/aR9XLHV++29l9XAXAFtQMU6pkXfgPFnav0bp0FaroQDe95rSRL4
	qBgGadDwIDdAGqkDIOIlPt/lWqWb0Qm0q0IGzj3sh1lCO8mbXbLwP15rA3YjqoBGGN4X
	69fR58UJ4Yge7Fykm0tDicAWIJGw4zIL54nsbYv657HSrSjXMcLrisURSupHbRKpKta5
	OqFg==
X-Gm-Message-State: ALoCoQlGfLsLhG2mCtAPRaD6LJA4oTNf0YXbItEZdiJYx3vwuM8H3yvNo1uE+EHUF3HJ1c9dU7T58MX/WMQ+gm2Pub7/IwX2iw==
X-Received: by 10.98.70.17 with SMTP id t17mr46862009pfa.107.1453237230439;
	Tue, 19 Jan 2016 13:00:30 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	70sm39283561pfc.69.2016.01.19.13.00.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 13:00:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <569DE54C.7090506@windriver.com>
Date: Tue, 19 Jan 2016 13:00:23 -0800
Message-Id: <4D27B3F8-BDBC-43AF-A54C-E4B556388202@gmail.com>
References: <569DE54C.7090506@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 19 Jan 2016 21:00:30 -0000
X-Groupsio-MsgNum: 76445
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7717802F-E115-477F-AF14-A1971BBBC9AE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7717802F-E115-477F-AF14-A1971BBBC9AE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 18, 2016, at 11:27 PM, Rongqing Li <rongqing.li@windriver.com> =
wrote:
>=20
> 1. on qemuarm:
>=20
> | arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm =
--sysroot=3D/buildarea1/lirq/Yocto/poky/arm/tmp/sysroots/qemuarm =
-DHAVE_CONFIG_H -I. -I../../valgrind-3.11.0/memcheck -I.. =
-I../../valgrind-3.11.0 -I../../valgrind-3.11.0/include =
-I../../valgrind-3.11.0/VEX/pub -I../VEX/pub -DVGA_arm=3D1 -DVGO_linux=3D1=
 -DVGP_arm_linux=3D1 -DVGPV_arm_linux_vanilla=3D1  -O2 -g -std=3Dgnu99 =
-Wall -Wmissing-prototypes -Wshadow -Wpointer-arith -Wstrict-prototypes =
-Wmissing-declarations -Wcast-qual -Wwrite-strings -Wempty-body -Wformat =
-Wformat-security -Wignored-qualifiers -Wmissing-parameter-type =
-Wold-style-declaration -fno-stack-protector -fno-strict-aliasing =
-fno-builtin  -marm -mcpu=3Dcortex-a8 -O -g -fno-omit-frame-pointer =
-fno-strict-aliasing -fpic -fno-builtin -fno-ipa-icf -O2 -O2 -pipe -g =
-feliminate-unused-debug-types -c -o =
vgpreload_memcheck_arm_linux_so-mc_replace_strmem.o `test -f =
'mc_replace_strmem.c' || echo =
'../../valgrind-3.11.0/memcheck/'`mc_replace_strmem.c
> | for f in ; do \
> |   if [ ! -e $f.dSYM  -o  $f -nt $f.dSYM ] ; then \
> |       echo "dsymutil $f"; \
> |       dsymutil $f; \
> |   fi; \
> | done
> | ../../valgrind-3.11.0/memcheck/mc_malloc_wrappers.c:1:0: warning: =
switch -mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |
> |  ^
> | mkdir -p ../.in_place; \
> | for f in ; do \
> |   rm -f ../.in_place/$f.dSYM; \
> |   ln -f -s ../memcheck/$f.dSYM ../.in_place; \
> | done
> | ../../valgrind-3.11.0/memcheck/mc_leakcheck.c:1:0: warning: switch =
-mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |
> |  ^
> | ../../valgrind-3.11.0/memcheck/mc_replace_strmem.c:1:0: warning: =
switch -mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |
> |  ^
> | ../../valgrind-3.11.0/memcheck/mc_errors.c:1:0: warning: switch =
-mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |
> |  ^
> | ../../valgrind-3.11.0/memcheck/mc_translate.c:1:0: warning: switch =
-mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |
> |  ^
> | ../../valgrind-3.11.0/memcheck/mc_machine.c:1:0: warning: switch =
-mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |
> |  ^
> | ../../valgrind-3.11.0/memcheck/mc_main.c:1:0: warning: switch =
-mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch
> |  /* -*- mode: C; c-basic-offset: 3; -*- */
> |  ^
> | {standard input}: Assembler messages:
> | {standard input}:25: Error: selected processor does not support ARM =
mode `movw r3,#:lower16:primary_map'
> | {standard input}:28: Error: selected processor does not support ARM =
mode `movt r3,#:upper16:primary_map'
> | {standard input}:30: Error: selected processor does not support ARM =
mode `uxth r1,r0'
> | {standard input}:31: Error: selected processor does not support ARM =
mode `movw r3,#0xAAAA'
> | {standard input}:40: Error: selected processor does not support ARM =
mode `movw r3,#0x5555'
> | {standard input}:61: Error: selected processor does not support ARM =
mode `movw r3,#:lower16:primary_map'
> | {standard input}:64: Error: selected processor does not support ARM =
mode `movt r3,#:upper16:primary_map'
> | {standard input}:66: Error: selected processor does not support ARM =
mode `uxth r1,r0'
> | {standard input}:94: Error: selected processor does not support ARM =
mode `movw r3,#:lower16:primary_map'
> | {standard input}:95: Error: selected processor does not support ARM =
mode `uxth r1,r0'
> | {standard input}:96: Error: selected processor does not support ARM =
mode `movt r3,#:upper16:primary_map'
> | {standard input}:135: Error: selected processor does not support ARM =
mode `movw r3,#:lower16:primary_map'
> | {standard input}:136: Error: selected processor does not support ARM =
mode `uxth r1,r0'
> | {standard input}:137: Error: selected processor does not support ARM =
mode `movt r3,#:upper16:primary_map'
>=20
>=20
>=20
> 2: on qemuarma9
>=20
>=20
> | arm-wrs-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dsoftfp  =
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
> | {standard input}: Assembler messages:
> | {standard input}:1107: Error: selected processor does not support =
ARM mode `vld1.64 {d7},[r3]'
> | {standard input}:1107: Error: selected processor does not support =
ARM mode `vst1.64 {d7},[r2]'
> | Makefile:2467: recipe for target 'sh-mem-random.o=E2=80=99 failed


So you disable neon but do not choose a particular implementation which =
allows so. e.g. you should have -mtune=3Dcortex-a9 which allows neon to =
be optional
but thats probably just the semantic thing. Below code should check for =
__ARM_NEON__ internal define being set as well before resorting to use =
neon instructions.

>=20
>=20
> and the codes are below:
>=20
> 194 #elif defined(__linux__) && defined(__arm__) && =
!defined(__aarch64__)
> 195             /* On arm32, many compilers generate a 64-bit float =
move
> 196                using two 32 bit integer registers, which =
completely
> 197                defeats this test.  Hence force a 64-bit NEON load =
and
> 198                store.  I guess this will break the build on =
non-NEON
> 199                capable targets. */
> 200             __asm__ __volatile__ (
> 201                "vld1.64 {d7},[%0] ; vst1.64 {d7},[%1] "
> 202                : : "r"(arr+src), "r"(arr+dst) : "d7","memory"
> 203             );
> 204 #else
>=20
>=20
> -Roy
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7717802F-E115-477F-AF14-A1971BBBC9AE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeo+sACgkQuwUzVZGdMxRq3ACeOsFz+aZ58csQHxZdMpqHUNk9
z54AoIONPSd8b4NfbmE30gOlsPadjWk+
=YioP
-----END PGP SIGNATURE-----

--Apple-Mail=_7717802F-E115-477F-AF14-A1971BBBC9AE--
