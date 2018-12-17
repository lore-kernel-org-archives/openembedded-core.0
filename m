Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E04D745AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 09:56:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so10413258ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 01:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=48SgpSNlyAubw//cTIJtMrY8QFtqVw0l1BpIk2r8GNw=;
	b=oxxLwwcok31qKb4WS9Wp1C1NzyPctyItnMCXivxdQCut982sSYYjNXsB/R4hXWgYD6
	bwGhSN6P/VRXfIgznWrRHlO4OFEd/+YvJOvl2rcoyVteCpurAYlvnr21WbNrv7j474PD
	uCt6v4mw3cmdxZ/jlPrkpF2DP3uW5QhQaj9Ui9PEz6cIDttfX5bDM2XYFoVEPXDjBjc1
	n3UEa7o9MPyujS9F7H+T4WG1g0WSUFP0B9Z39L6YoJm0EKAyOEg1qsX5D/LiuD4+HKAD
	kAyQV0lfJGkSfhWbccPeHOCEgqrW3iFYNdGUWJXZNE+37U6JjbpA1MpRdygMLYD0LPUu
	cghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=48SgpSNlyAubw//cTIJtMrY8QFtqVw0l1BpIk2r8GNw=;
	b=LBvIxQfNeWIYyXEZbenZMOTHcTQZ51961IOAtxrHbDbBXy80lfhvjiQD29ZyuvBl9r
	IIkE5OxDDNThCO6QVyh0RSzoM2B6p1NkDPRgRMnyRvvM4gFhDEC9wTfGAyqZarZ5AdSW
	tFSKDH3U2LzSWMs1AMaECxAUlRMxFhdz5VZhEPzqD9yc3bEoE6P0ouR73KOA67ERSQ8v
	YhtMF6rOdxLgtkEc4wOEz0Z6qS5n3Ou0bS73guiQOA0TUSjmTCjsfeWMAK2GJLT2bdST
	moc2rlDu0he6Xyo+ilpq390IpEECRIVMt4wGPN2YqZXKD6VvWmKTaAW1NNZceNlJ6wPP
	OEeA==
X-Gm-Message-State: AA+aEWb3U/Lp2VXklswucpZsGs2DjTHjGisvBGQffNXVTFytTbjvARgu
	txiyUMFhQ9EgsvAOyjhA5+ZM6CCo
X-Google-Smtp-Source: AFSGD/WtJQ863LiVxW6jvX26OPNKizQIcg6uNRNztrZCCb9wbQ99W42Aj+4fiaWKBSYI486LBYkpgw==
X-Received: by 2002:a2e:5356:: with SMTP id
	t22-v6mr1459244ljd.26.1545040585667; 
	Mon, 17 Dec 2018 01:56:25 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	p21sm2581345lfj.10.2018.12.17.01.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 01:56:25 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1spRwzV+NRwbdFDHMgX4ffP3CZ_NKoOS8QF60KJkBKbJCw@mail.gmail.com>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f3e71912-ae24-abb8-3b48-0b9b487a372e@gmail.com>
Date: Mon, 17 Dec 2018 11:56:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:51.0) Gecko/20100101
	Firefox/51.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spRwzV+NRwbdFDHMgX4ffP3CZ_NKoOS8QF60KJkBKbJCw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/13] powerpc/powerpc64: Support build with musl as libc
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
X-List-Received-Date: Mon, 17 Dec 2018 09:56:25 -0000
X-Groupsio-MsgNum: 119280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="nz3RybzIWLoIIL3JR2MZK0mY5ZqHHHsjA"

--nz3RybzIWLoIIL3JR2MZK0mY5ZqHHHsjA
Content-Type: multipart/mixed; boundary="QXpxJo73WZWIT2cxREQaB99P2vhAm8B8N";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <f3e71912-ae24-abb8-3b48-0b9b487a372e@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 00/13] powerpc/powerpc64: Support build
 with musl as libc
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
 <CAMKF1spRwzV+NRwbdFDHMgX4ffP3CZ_NKoOS8QF60KJkBKbJCw@mail.gmail.com>
In-Reply-To: <CAMKF1spRwzV+NRwbdFDHMgX4ffP3CZ_NKoOS8QF60KJkBKbJCw@mail.gmail.com>

--QXpxJo73WZWIT2cxREQaB99P2vhAm8B8N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:
> Serhey
>=20
> Thanks for doing this work and really a clean pull request with good
> explanation that I have seen lately. Good work, For most parts
> everything is in order except few places where I have replied
> specifically to the patches

Khem, thank you for quick review! I will try to address your comments
with upstream even after this series already merged.

But at the moment I'm working on series intended to improve situation
with ppc64le support (inluding musl).

There is more places to address. For example build w/o altivec support.
Currently tune actually does nothing to avoid Altivec/VSX instructions
in binary. This is however only may be a problem for some embedded stuff
or very old POWER machines (i.e. before POWER6 I guess).

>=20
> On Fri, Dec 14, 2018 at 9:55 AM Serhey Popovych
> <serhe.popovych@gmail.com> wrote:
>>
>> Musl has support for ppc (32bit) and ppc64 (64bit). OE still missing
>> several tricks in configuration to make builds possible:
>>
>>   1) Most important part is that musl implements elfv2 ABI only for
>>      64bit PowerPC. That ABI is default for little-endian but supports=

>>      big-endian too. Historically elfv1 ABI is used for big-endian
>>      PowerPC.
>>
>>   2) Using uncommon elfv2 ABI for big-endian requires to disable all
>>      assembler optimizations in openssl: unfortunately I can't find mo=
re
>>      smart way at the moment.
>>
>>   3) LDSO path need to be adjusted to support /lib64 path which is
>>      default for powerpc64 (see bitbake.conf) instead of $baselibdir.
>>
>>   4) Default library search path is hardcoded to
>>      "/lib:/usr/local/lib:/usr/lib": pass -DSYSLIBDIR and -DLIBDIR and=

>>      use them to set path.
>>
>>   5) Need to add more tweaks to patch that adds --with-ldbl-128 knob
>>      to gcc configure: there is a set of functions that use TFtype in
>>      ppc64-fp.c in libgcc. This should be compatible with glibc.
>>
>>   6) Disable qemu-userspace for powerpc64 bit: there is no support.
>>      While there change qemuwrapper to exit explicitly to fix infinite=

>>      execution in do_rootfs() task when building on IBM POWER8 machine=
=2E
>>
>>   7) Misc fixes that map powerpc-linux-musl python3 triplet to
>>      powerpc-linux-gnu, remove conflicting sed in do_configure() vs
>>      patch settings in gcc and fix DEFAULTTUNE settings for various
>>      IBM POWER platforms.
>>
>> Build is done on IBM POWER8 machine running RHEL7:
>>
>> Images:
>> -------
>>     core-image-sato
>>     core-image-full-cmdline
>>
>> For powerpc64:
>> --------------
>>               glibc                musl
>>          systemd sysvinit    systemd sysvinit
>>   gcc-7.3   y       y           y       y
>>   gcc-8.2   y       y           y       y
>>
>> For powerpc:
>> ------------
>>               glibc                musl
>>          systemd sysvinit    systemd sysvinit
>>   gcc-7.3   n       x           x       x      (*)
>>   gcc-8.2   y       y           y       y
>>
>> Note that gcc-7.3 builds for 32bit powerpc fail due to:
>>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11754
>>
>> Kernel/images are boot tested using KVM-HV on IBM POWER8.
>>
>> Serhey Popovych (13):
>>   lib/oe/elf.py: Add powerpc64 architecture definition for musl
>>   tune-power[5-7].inc: Fix DEFAULTTUNE values
>>   tune-power[5-7].inc: Disable QEMU usermode usage
>>   qemuwrapper: Explicitly exit in case of no qemu supported for target=

>>   arch-powerpc64.inc: Use elfv2 ABI when building with musl
>>   musl: Create default library search path based on configuration
>>   musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
>>   openssl: Skip assembler optimized code for powerpc64 with musl
>>   python3: Fix do_configure check platform triplet error (2)
>>   gcc: Fix preprocessor redefines for header pathes
>>   gcc: More places to patch to disable ldbl 128 for musl on PPC
>>   gcc: Enable secureplt for powerpc64 target too
>>   gcc-7.3,gcc-8.2: Use variable SYSTEMLIBS_DIR instead of hardcoding i=
t
>>     for ppc64
>>
>>  .../machine/include/powerpc/arch-powerpc64.inc     |   3 +
>>  meta/conf/machine/include/tune-power5.inc          |   5 +-
>>  meta/conf/machine/include/tune-power6.inc          |   5 +-
>>  meta/conf/machine/include/tune-power7.inc          |   5 +-
>>  meta/lib/oe/elf.py                                 |   1 +
>>  .../openssl/openssl10_1.0.2q.bb                    |   1 +
>>  .../recipes-connectivity/openssl/openssl_1.1.1a.bb |   1 +
>>  ...slibdir-and-libdir-as-default-pathes-to-l.patch |  61 ++++
>>  meta/recipes-core/musl/musl_git.bb                 |   3 +-
>>  meta/recipes-devtools/gcc/gcc-7.3.inc              |   1 +
>>  ...Ensure-target-gcc-headers-can-be-included.patch |  36 --
>>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 391 ++++++++++++=
++++++++-
>>  ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 ++
>>  meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
>>  ...Ensure-target-gcc-headers-can-be-included.patch |  36 --
>>  ...34-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 342 ++++++++++++=
+++++-
>>  ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 ++
>>  meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
>>  .../tweak-MULTIARCH-for-powerpc-linux-musl.patch   |  40 +++
>>  meta/recipes-devtools/python/python3_3.5.6.bb      |   1 +
>>  .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   3 +-
>>  21 files changed, 920 insertions(+), 80 deletions(-)
>>  create mode 100644 meta/recipes-core/musl/musl/0002-ldso-Use-syslibdi=
r-and-libdir-as-default-pathes-to-l.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-pow=
erpc64-Add-support-for-musl-ldso.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-pow=
erpc64-Add-support-for-musl-ldso.patch
>>  create mode 100644 meta/recipes-devtools/python/python3/tweak-MULTIAR=
CH-for-powerpc-linux-musl.patch
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--QXpxJo73WZWIT2cxREQaB99P2vhAm8B8N--

--nz3RybzIWLoIIL3JR2MZK0mY5ZqHHHsjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcF3LIAAoJEBTawMmQ61bBNdoH/1oulwoFbu04gxRt+q5F7CIg
uKWZTuhPriOgCzRORJrQ1kkzSIXOkNopLiDnG+0MpGyXsmmJ/QKQ6svzKtdkV81U
/G/WoaYeXq1bU0z19DUZBGDc9ggqYDltZSRvg8RNndAD9WJJZIGp0Rngoe9SlO9e
0IGZzZky8/pwprlIrNN809zH3WhVOxmgKaNNVXxRcLRj6+qvWZagmGP6GgRG79NW
dF2dIVSn/muzsLzT8CWCIqCn34YJCZXvk4hAGSfXzvPH/ncQyuFrf5JF/tPEUUbR
+QFreIkin63y/5sBww4R4BpbWsltnbRyQzhdg2h7pbiXVuiB99VGRQqTKYh2Ex8=
=ZgUv
-----END PGP SIGNATURE-----

--nz3RybzIWLoIIL3JR2MZK0mY5ZqHHHsjA--
