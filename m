Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 325C678A8A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 19:59:42 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id g6-v6so1149587plq.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=m+qAc5bSwn7uoAKL1QEenNpq+tLflfsLr1aTarSZxNE=;
	b=VYc6FHyio29dR9vKsO9+B8PMBKZoaiVdy0ZwDTkY3+aS0KifObwh2FO4cQZgEbeJ2c
	cdOnhFF2m+uhuIwMKJ3ROqWViAuw2KpLHD8KIS/FPA8tdZw20gsohnZ7xVZ/2CZ6B4nQ
	9SC9pHQFmWKlgo/bkIPlRGN5ZntXB9I10oBuhKvX4DVOoAoEtjEOozXZKQ+bdAFUWEZv
	YQ6f+cYl6X08cFeDfuGgf+qlmAqRt/uAyFFz8M5e9mFiowZEPkvpcMcOqlnS2ZHioLA/
	YARcB+MVAFOjyu4f0ixdzdfgcb4Fd4C34NZ5fS1rSi9vVcsxBtLAnqbjugmEDgYZVMFR
	3LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=m+qAc5bSwn7uoAKL1QEenNpq+tLflfsLr1aTarSZxNE=;
	b=G/XB/RoyE2uHrb9LnAu/nOe7jTF5RjVbWzg225WU83tJsHGlxrxp0eOKq8p1g3Ncp+
	xwzwDpFh5Vk9aNKpEQV/HcE4WI/Fw9Y1Yomo4xNop+CNv/1V9kMl4IzXnvbVTsDmXHmq
	jhBEgMiFXLMgQQ08exMSnnPKq422hItLO2OLDFkzlsay4tNoSETJq+Hus5MJ9nV0NA5V
	+L5hAhK59W4B2bzWJMEYTqyVmxptabu4qExaZFEEtc1JNbSIwsN/6H4KqgS/jIKQmo4o
	pC1IStqKVvoljALRJ7+z367fhSYVVrjJRvDQTiZmb/IXPRWKeXwrKxXZ/Ko1rAXuibY/
	ur0A==
X-Gm-Message-State: AOUpUlEQpqGdhO1lVNPjaHvrS+feijXZ4Gp4qIi87UNZO6msaVNYNH0j
	G+dyDw4ZHNH6KqZv/+cvTaG7Y6Cv
X-Google-Smtp-Source: AAOMgpcv+BBm71W/ZffxPuEYy+sNd0AkbKUzoKLSFcl9sEHWPeAq/o8rIPlHmanlP6p+FJta0S3lYA==
X-Received: by 2002:a17:902:9042:: with SMTP id
	w2-v6mr11520050plz.61.1533499182506; 
	Sun, 05 Aug 2018 12:59:42 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:d159:854b:6201:9d62])
	by smtp.gmail.com with ESMTPSA id
	r22-v6sm18622092pfl.112.2018.08.05.12.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 12:59:41 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180727083113.17370-1-raj.khem@gmail.com>
	<CA+chaQfyM=Ui_QX6M=Rnpdk_B9DOgcEfXCaDZPypyotTQ61b+A@mail.gmail.com>
	<CAMKF1srgn4yoy8cA1vv9ENerHk9gE9yrp2zbqJk=5cJuJMR82Q@mail.gmail.com>
	<CA+chaQcsquCB91R0vviaLVjTSf9YyhnBN-Sq_V9ddXfY1u1Hpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
	BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
	FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Message-ID: <649950f9-677c-f364-24b3-c7e8a3da0776@gmail.com>
Date: Sun, 5 Aug 2018 12:59:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcsquCB91R0vviaLVjTSf9YyhnBN-Sq_V9ddXfY1u1Hpw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-8: Upgrade to 8.2 release
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
X-List-Received-Date: Sun, 05 Aug 2018 19:59:42 -0000
X-Groupsio-MsgNum: 114335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="egSoOoZZEjxyGY3zQNwKCDKDtRdlvySLo"

--egSoOoZZEjxyGY3zQNwKCDKDtRdlvySLo
Content-Type: multipart/mixed; boundary="benVf7P9tDJ47lw2QAbqP2B2DZuX7N81p";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <649950f9-677c-f364-24b3-c7e8a3da0776@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-8: Upgrade to 8.2 release
References: <20180727083113.17370-1-raj.khem@gmail.com>
 <CA+chaQfyM=Ui_QX6M=Rnpdk_B9DOgcEfXCaDZPypyotTQ61b+A@mail.gmail.com>
 <CAMKF1srgn4yoy8cA1vv9ENerHk9gE9yrp2zbqJk=5cJuJMR82Q@mail.gmail.com>
 <CA+chaQcsquCB91R0vviaLVjTSf9YyhnBN-Sq_V9ddXfY1u1Hpw@mail.gmail.com>
In-Reply-To: <CA+chaQcsquCB91R0vviaLVjTSf9YyhnBN-Sq_V9ddXfY1u1Hpw@mail.gmail.com>

--benVf7P9tDJ47lw2QAbqP2B2DZuX7N81p
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/5/18 12:45 PM, Martin Jansa wrote:
> Turned out to be related to=C2=A0-fno-omit-frame-pointer from DEBUG_BUI=
LD
> together with security_flags.inc together with thumb, I've sent a work
> around which works for me:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-August/1=
53741.html
>=20

thumb1 is kind of less tested ISA, so this workaround is perfectly fine.
although it would be interesting to have the pre-processed file where it
hangs

> it's reproducible with gcc-8.1 as well, so it wasn't caused by gcc-8.2
> upgrade (I've enabled security_flags.inc in qemuarm builds around the
> same time).
>=20
> On Mon, Jul 30, 2018 at 8:35 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     Sure my builds with gold did not end up in the fails for qemuarm an=
d
>     thumb1 the setup is very similar but I might have been lucky let me=

>     know how it goes=C2=A0
>=20
>     On Mon, Jul 30, 2018 at 7:53 AM Martin Jansa <martin.jansa@gmail.co=
m
>     <mailto:martin.jansa@gmail.com>> wrote:
>=20
>         I'm not sure if it was caused by this change, but I've included=

>         it from patchwork on Friday and since then I've seen 3 builds
>         getting stuck in gcc for 50 hours.
>=20
>         In all 3 cases it was qemuarm (with thumb and gold enabled),
>         twice while building bash and once building libjpeg-turbo. I
>         will let you know after more builds to see how often it happens=

>         (I didn't do many builds over weekend, because well - they were=

>         stuck on early ones, because of this).
>=20
>         On Fri, Jul 27, 2018 at 10:31 AM Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>> wrote:
>=20
>             Signed-off-by: Khem Raj <raj.khem@gmail.com
>             <mailto:raj.khem@gmail.com>>
>             ---
>             =C2=A0...003-build-failures-with-with-cpu-xsc.patch | 61
>             -------------------
>             =C2=A0.../gcc/{gcc-8.1.inc =3D> gcc-8.2.inc}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 11 ++--
>             =C2=A0...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |=C2=A0=
 0
>             =C2=A0.../0003-gcc-poison-system-directories.patch=C2=A0 |=C2=
=A0 0
>             =C2=A0.../0004-gcc-poison-dir-extend.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0
>             =C2=A0...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |=C2=A0=
 0
>             =C2=A0.../0006-64-bit-multilib-hack.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0
>             =C2=A0.../0007-optional-libstdc.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0
>             =C2=A0...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |=C2=A0=
 0
>             =C2=A0.../0009-COLLECT_GCC_OPTIONS.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0
>             =C2=A0...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |=C2=A0=
 0
>             =C2=A0.../0011-fortran-cross-compile-hack.patch=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 0
>             =C2=A0.../0012-cpp-honor-sysroot.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0
>             =C2=A0.../0013-MIPS64-Default-to-N64-ABI.patch=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 0
>             =C2=A0...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |=C2=A0=
 0
>             =C2=A0...gcc-Fix-argument-list-too-long-error.patch |=C2=A0=
 0
>             =C2=A0.../0016-Disable-sdt.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0
>             =C2=A0.../{gcc-8.1 =3D> gcc-8.2}/0017-libtool.patch=C2=A0 =C2=
=A0|=C2=A0 0
>             =C2=A0...s-fix-v4bx-to-linker-to-support-EABI.patch |=C2=A0=
 0
>             =C2=A0...-config-files-from-B-instead-of-usin.patch |=C2=A0=
 0
>             =C2=A0...ir-from-.la-which-usually-points-to-.patch |=C2=A0=
 0
>             =C2=A0.../0021-export-CPP.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0
>             =C2=A0...ILIB_OSDIRNAMES-and-other-multilib-o.patch |=C2=A0=
 0
>             =C2=A0...e-target-gcc-headers-can-be-included.patch |=C2=A0=
 0
>             =C2=A0...ild-with-disable-dependency-tracking.patch |=C2=A0=
 0
>             =C2=A0...t-directory-during-relink-if-inst_pr.patch |=C2=A0=
 0
>             =C2=A0...IR-replacement-instead-of-hardcoding.patch |=C2=A0=
 0
>             =C2=A0...27-aarch64-Add-support-for-musl-ldso.patch |=C2=A0=
 0
>             =C2=A0...-fix-libcc1-s-install-path-and-rpath.patch |=C2=A0=
 0
>             =C2=A0...le-sysroot-support-for-nativesdk-gcc.patch |=C2=A0=
 0
>             =C2=A0...sroot-gcc-version-specific-dirs-with.patch |=C2=A0=
 0
>             =C2=A0...ous-_FOR_BUILD-and-related-variables.patch |=C2=A0=
 0
>             =C2=A0...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |=C2=A0=
 0
>             =C2=A0...d-to-link-commandline-for-musl-targe.patch |=C2=A0=
 0
>             =C2=A0...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |=C2=A0=
 0
>             =C2=A0...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |=C2=A0=
 0
>             =C2=A0...as-for-__cpu_indicator_init-instead-.patch |=C2=A0=
 0
>             =C2=A0.../0037-sync-gcc-stddef.h-with-musl.patch=C2=A0 =C2=A0=
 |=C2=A0 0
>             =C2=A0...-fault-in-precompiled-header-generat.patch |=C2=A0=
 0
>             =C2=A0.../0039-Fix-for-testsuite-failure.patch=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 0
>             =C2=A0...Re-introduce-spe-commandline-options.patch |=C2=A0=
 0
>             =C2=A0...adian_8.1.bb <http://adian_8.1.bb> =3D>
>             gcc-cross-canadian_8.2.bb
>             <http://gcc-cross-canadian_8.2.bb>} |=C2=A0 0
>             =C2=A0...nitial_8.1.bb <http://nitial_8.1.bb> =3D>
>             gcc-cross-initial_8.2.bb <http://gcc-cross-initial_8.2.bb>}=
 |=C2=A0 0
>             =C2=A0.../{gcc-cross_8.1.bb <http://gcc-cross_8.1.bb> =3D>
>             gcc-cross_8.2.bb <http://gcc-cross_8.2.bb>}=C2=A0 =C2=A0 |=C2=
=A0 0
>             =C2=A0...ial_8.1.bb <http://ial_8.1.bb> =3D>
>             gcc-crosssdk-initial_8.2.bb
>             <http://gcc-crosssdk-initial_8.2.bb>} |=C2=A0 0
>             =C2=A0...cc-crosssdk_8.1.bb <http://cc-crosssdk_8.1.bb> =3D=
>
>             gcc-crosssdk_8.2.bb <http://gcc-crosssdk_8.2.bb>} |=C2=A0 0=

>             =C2=A0...{gcc-runtime_8.1.bb <http://gcc-runtime_8.1.bb> =3D=
>
>             gcc-runtime_8.2.bb <http://gcc-runtime_8.2.bb>} |=C2=A0 0
>             =C2=A0...anitizers_8.1.bb <http://anitizers_8.1.bb> =3D>
>             gcc-sanitizers_8.2.bb <http://gcc-sanitizers_8.2.bb>} |=C2=A0=
 0
>             =C2=A0.../{gcc-source_8.1.bb <http://gcc-source_8.1.bb> =3D=
>
>             gcc-source_8.2.bb <http://gcc-source_8.2.bb>}=C2=A0 |=C2=A0=
 0
>             =C2=A0.../gcc/{gcc_8.1.bb <http://gcc_8.1.bb> =3D> gcc_8.2.=
bb
>             <http://gcc_8.2.bb>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 0
>             =C2=A0...c-initial_8.1.bb <http://c-initial_8.1.bb> =3D>
>             libgcc-initial_8.2.bb <http://libgcc-initial_8.2.bb>} |=C2=A0=
 0
>             =C2=A0.../gcc/{libgcc_8.1.bb <http://libgcc_8.1.bb> =3D>
>             libgcc_8.2.bb <http://libgcc_8.2.bb>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 0
>             =C2=A0...{libgfortran_8.1.bb <http://libgfortran_8.1.bb> =3D=
>
>             libgfortran_8.2.bb <http://libgfortran_8.2.bb>} |=C2=A0 0
>             =C2=A053 files changed, 5 insertions(+), 67 deletions(-)
>             =C2=A0delete mode 100644
>             meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-=
build-failures-with-with-cpu-xsc.patch
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1.inc =3D>
>             gcc-8.2.inc} (93%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0003-gcc-poison-system-directories.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0004-gcc-poison-dir-extend.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (10=
0%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0006-64-bit-multilib-hack.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0007-optional-libstdc.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (1=
00%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0009-COLLECT_GCC_OPTIONS.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe=
-in-B.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0011-fortran-cross-compile-hack.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0012-cpp-honor-sysroot.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0013-MIPS64-Default-to-N64-ABI.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMI=
C_LINKE.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0015-gcc-Fix-argument-list-too-long-error.patch (1=
00%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0016-Disable-sdt.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0017-libtool.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-=
EABI.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0019-Use-the-multilib-config-files-from-B-instead-=
of-usin.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0020-Avoid-using-libdir-from-.la-which-usually-poi=
nts-to-.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0021-export-CPP.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-mul=
tilib-o.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0023-Ensure-target-gcc-headers-can-be-included.pat=
ch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0024-gcc-4.8-won-t-build-with-disable-dependency-t=
racking.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0025-Don-t-search-host-directory-during-relink-if-=
inst_pr.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-har=
dcoding.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0027-aarch64-Add-support-for-musl-ldso.patch (100%=
)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0028-libcc1-fix-libcc1-s-install-path-and-rpath.pa=
tch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0029-handle-sysroot-support-for-nativesdk-gcc.patc=
h
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0030-Search-target-sysroot-gcc-version-specific-di=
rs-with.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0031-Fix-various-_FOR_BUILD-and-related-variables.=
patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)=

>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0033-Add-ssp_nonshared-to-link-commandline-for-mus=
l-targe.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFL=
AGS.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-i=
nstead-.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0037-sync-gcc-stddef.h-with-musl.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0038-fix-segmentation-fault-in-precompiled-header-=
generat.patch
>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0039-Fix-for-testsuite-failure.patch (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D>
>             gcc-8.2}/0040-Re-introduce-spe-commandline-options.patch (1=
00%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-cross-canadian_=
8.1.bb
>             <http://gcc-cross-canadian_8.1.bb> =3D>
>             gcc-cross-canadian_8.2.bb
>             <http://gcc-cross-canadian_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-cross-initial_8=
=2E1.bb
>             <http://gcc-cross-initial_8.1.bb> =3D>
>             gcc-cross-initial_8.2.bb <http://gcc-cross-initial_8.2.bb>}=

>             (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-cross_8.1.bb
>             <http://gcc-cross_8.1.bb> =3D> gcc-cross_8.2.bb
>             <http://gcc-cross_8.2.bb>} (100%)
>             =C2=A0rename
>             meta/recipes-devtools/gcc/{gcc-crosssdk-initial_8.1.bb
>             <http://gcc-crosssdk-initial_8.1.bb> =3D>
>             gcc-crosssdk-initial_8.2.bb
>             <http://gcc-crosssdk-initial_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-crosssdk_8.1.bb=

>             <http://gcc-crosssdk_8.1.bb> =3D> gcc-crosssdk_8.2.bb
>             <http://gcc-crosssdk_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-runtime_8.1.bb
>             <http://gcc-runtime_8.1.bb> =3D> gcc-runtime_8.2.bb
>             <http://gcc-runtime_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-sanitizers_8.1.=
bb
>             <http://gcc-sanitizers_8.1.bb> =3D> gcc-sanitizers_8.2.bb
>             <http://gcc-sanitizers_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc-source_8.1.bb
>             <http://gcc-source_8.1.bb> =3D> gcc-source_8.2.bb
>             <http://gcc-source_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{gcc_8.1.bb
>             <http://gcc_8.1.bb> =3D> gcc_8.2.bb <http://gcc_8.2.bb>} (1=
00%)
>             =C2=A0rename meta/recipes-devtools/gcc/{libgcc-initial_8.1.=
bb
>             <http://libgcc-initial_8.1.bb> =3D> libgcc-initial_8.2.bb
>             <http://libgcc-initial_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{libgcc_8.1.bb
>             <http://libgcc_8.1.bb> =3D> libgcc_8.2.bb
>             <http://libgcc_8.2.bb>} (100%)
>             =C2=A0rename meta/recipes-devtools/gcc/{libgfortran_8.1.bb
>             <http://libgfortran_8.1.bb> =3D> libgfortran_8.2.bb
>             <http://libgfortran_8.2.bb>} (100%)
>=20
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-8600=
3-build-failures-with-with-cpu-xsc.patch
>             b/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-8600=
3-build-failures-with-with-cpu-xsc.patch
>             deleted file mode 100644
>             index 68b8962d47..0000000000
>             ---
>             a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-8600=
3-build-failures-with-with-cpu-xsc.patch
>             +++ /dev/null
>             @@ -1,61 +0,0 @@
>             -From 11dc6b9576b78bb7a8d70491beab7ab4de24c9d0 Mon Sep 17
>             00:00:00 2001
>             -From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b05=
4a4>
>             -Date: Mon, 4 Jun 2018 08:46:04 +0000
>             -Subject: [PATCH] [arm] PR target/86003 build failures with=

>             --with-cpu=3Dxscale
>             -
>             -The XScale cpu configuration in GCC has always been somewh=
at
>             -non-conforming.=C2=A0 Although XScale isn't an architectur=
e
>             (it's simply an
>             -implementation of ARMv5te), we do by tradition emit a spec=
ific
>             -pre-define for it.=C2=A0 We achieve this effect by adding =
an
>             additional
>             -feature bit to the xscale CPU definition that isn't part o=
f
>             the base
>             -architecture.
>             -
>             -When I restructured the options last year I overlooked thi=
s
>             oddity and
>             -the result, of course, is that this configuration now fail=
s
>             to build
>             -as intended.
>             -
>             -What happens is that the driver (correctly) constructs an
>             architecture
>             -for the xscale cpu name (as armv5te) and passes it in
>             addition to the
>             -CPU name.=C2=A0 The backend code, on finding both a cpu an=
d an
>             architecture
>             -specifies attempts to correlate the two and finds a
>             difference due to
>             -the additional feature bit and reports an inconsistency
>             (fatally if
>             --werror is specified).
>             -
>             -I think the best fix to this is to treat the xscale featur=
e
>             bit using
>             -the same mechanism that we use for other 'quirks' in CPU
>             -implementations and simply filter it out before comparing =
the
>             -capabilities.=C2=A0 It has the additional benefit that it'=
s also the
>             -simplest fix.
>             -
>             -=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/86003
>             -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/arm-cpus.in <http:=
//arm-cpus.in>
>             (ALL_QUIRKS): Add xscale feature to the list
>             -=C2=A0 =C2=A0 =C2=A0 =C2=A0of bits to ignore when comparin=
g architectures.
>             -
>             -
>             -git-svn-id:
>             svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141
>             <http://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141>
>             138bc75d-0d04-0410-961f-82ee72b054a4
>             ----
>             -Signed-off-by: Khem Raj <raj.khem@gmail.com
>             <mailto:raj.khem@gmail.com>>
>             -Upstream-Status: Backport
>             -
>             - gcc/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 6 ++++++
>             - gcc/config/arm/arm-cpus.in <http://arm-cpus.in> | 4 +++-
>             - 2 files changed, 9 insertions(+), 1 deletion(-)
>             -
>             -diff --git a/gcc/config/arm/arm-cpus.in
>             <http://arm-cpus.in> b/gcc/config/arm/arm-cpus.in
>             <http://arm-cpus.in>
>             -index 96972a057e7..545321b0bbe 100644
>             ---- a/gcc/config/arm/arm-cpus.in <http://arm-cpus.in>
>             -+++ b/gcc/config/arm/arm-cpus.in <http://arm-cpus.in>
>             -@@ -268,7 +268,9 @@ define fgroup DOTPROD=C2=A0 =C2=A0 =C2=
=A0 NEON dotprod
>             -
>             - # List of all quirk bits to strip out when comparing CPU
>             features with
>             - # architectures.
>             --define fgroup ALL_QUIRKS=C2=A0 =C2=A0quirk_no_volatile_ce=

>             quirk_armv6kz quirk_cm3_ldrd
>             -+# xscale isn't really a 'quirk', but it isn't an
>             architecture either and we
>             -+# need to ignore it for matching purposes.
>             -+define fgroup ALL_QUIRKS=C2=A0 =C2=A0quirk_no_volatile_ce=

>             quirk_armv6kz quirk_cm3_ldrd xscale
>             -
>             - # Architecture entries
>             - # format:
>             ---
>             -2.17.1
>             -
>             diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc
>             b/meta/recipes-devtools/gcc/gcc-8.2.inc
>             similarity index 93%
>             rename from meta/recipes-devtools/gcc/gcc-8.1.inc
>             rename to meta/recipes-devtools/gcc/gcc-8.2.inc
>             index ebe3c24978..8503a66b07 100644
>             --- a/meta/recipes-devtools/gcc/gcc-8.1.inc
>             +++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
>             @@ -2,13 +2,13 @@ require gcc-common.inc
>=20
>             =C2=A0# Third digit in PV should be incremented after a min=
or release
>=20
>             -PV =3D "8.1.0"
>             +PV =3D "8.2.0"
>=20
>             =C2=A0# BINV should be incremented to a revision after a mi=
nor
>             gcc release
>=20
>             -BINV =3D "8.1.0"
>             +BINV =3D "8.2.0"
>=20
>             -FILESEXTRAPATHS =3D.
>             "${FILE_DIRNAME}/gcc-8.1:${FILE_DIRNAME}/gcc-8.1/backport:"=

>             +FILESEXTRAPATHS =3D.
>             "${FILE_DIRNAME}/gcc-8.2:${FILE_DIRNAME}/gcc-8.2/backport:"=

>=20
>             =C2=A0DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
>             =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native
>             zlib-native flex-native"
>             @@ -73,10 +73,9 @@ SRC_URI =3D "\
>             =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \
>             =C2=A0"
>             =C2=A0BACKPORTS =3D "\
>             -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>             =C2=A0file://0041-arm-PR-target-86003-build-failures-with-w=
ith-cpu-xsc.patch
>             \
>             =C2=A0"
>             -SRC_URI[md5sum] =3D "65f7c65818dc540b3437605026d329fc"
>             -SRC_URI[sha256sum] =3D
>             "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093a=
a2b153"
>             +SRC_URI[md5sum] =3D "4ab282f414676496483b3e1793d07862"
>             +SRC_URI[sha256sum] =3D
>             "196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab=
3e0080"
>=20
>             =C2=A0S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV=
}"
>             =C2=A0#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLA=
GS_FOR_TARGET.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLA=
GS_FOR_TARGET.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS=
_FOR_TARGET.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS=
_FOR_TARGET.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-=
directories.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-=
directories.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-di=
rectories.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-di=
rectories.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-ext=
end.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-ext=
end.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-exten=
d.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-exten=
d.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_=
CFLAGS_FOR_TARGET.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_=
CFLAGS_FOR_TARGET.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CF=
LAGS_FOR_TARGET.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CF=
LAGS_FOR_TARGET.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-ha=
ck.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-ha=
ck.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack=
=2Epatch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack=
=2Epatch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.p=
atch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.p=
atch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.pat=
ch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.pat=
ch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_R=
ELAX_PIC_CALLS-bit.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_R=
ELAX_PIC_CALLS-bit.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_REL=
AX_PIC_CALLS-bit.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_REL=
AX_PIC_CALLS-bit.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTION=
S.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTION=
S.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.=
patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.=
patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h=
-in-B-instead-of-S-and-t-oe-in-B.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h=
-in-B-instead-of-S-and-t-oe-in-B.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-i=
n-B-instead-of-S-and-t-oe-in-B.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-i=
n-B-instead-of-S-and-t-oe-in-B.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-comp=
ile-hack.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-comp=
ile-hack.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compil=
e-hack.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compil=
e-hack.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.=
patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.=
patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.pa=
tch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.pa=
tch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-=
N64-ABI.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-=
N64-ABI.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N6=
4-ABI.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N6=
4-ABI.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAM=
IC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAM=
IC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC=
_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC=
_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-l=
ist-too-long-error.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-l=
ist-too-long-error.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-lis=
t-too-long-error.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-lis=
t-too-long-error.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.=
patch
>             rename to meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.pa=
tch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix=
-v4bx-to-linker-to-support-EABI.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix=
-v4bx-to-linker-to-support-EABI.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v=
4bx-to-linker-to-support-EABI.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v=
4bx-to-linker-to-support-EABI.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-c=
onfig-files-from-B-instead-of-usin.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-c=
onfig-files-from-B-instead-of-usin.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-con=
fig-files-from-B-instead-of-usin.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-con=
fig-files-from-B-instead-of-usin.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir=
-from-.la-which-usually-points-to-.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir=
-from-.la-which-usually-points-to-.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-f=
rom-.la-which-usually-points-to-.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-f=
rom-.la-which-usually-points-to-.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTIL=
IB_OSDIRNAMES-and-other-multilib-o.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTIL=
IB_OSDIRNAMES-and-other-multilib-o.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB=
_OSDIRNAMES-and-other-multilib-o.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB=
_OSDIRNAMES-and-other-multilib-o.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-=
headers-can-be-included.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-=
headers-can-be-included.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-he=
aders-can-be-included.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-he=
aders-can-be-included.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-buil=
d-with-disable-dependency-tracking.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-buil=
d-with-disable-dependency-tracking.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-=
with-disable-dependency-tracking.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-=
with-disable-dependency-tracking.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-=
directory-during-relink-if-inst_pr.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-=
directory-during-relink-if-inst_pr.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-di=
rectory-during-relink-if-inst_pr.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-di=
rectory-during-relink-if-inst_pr.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR=
-replacement-instead-of-hardcoding.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR=
-replacement-instead-of-hardcoding.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-r=
eplacement-instead-of-hardcoding.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-r=
eplacement-instead-of-hardcoding.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-suppor=
t-for-musl-ldso.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-suppor=
t-for-musl-ldso.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-=
for-musl-ldso.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-=
for-musl-ldso.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-=
s-install-path-and-rpath.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-=
s-install-path-and-rpath.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-=
install-path-and-rpath.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-=
install-path-and-rpath.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-sup=
port-for-nativesdk-gcc.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-sup=
port-for-nativesdk-gcc.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-suppo=
rt-for-nativesdk-gcc.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-suppo=
rt-for-nativesdk-gcc.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysr=
oot-gcc-version-specific-dirs-with.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysr=
oot-gcc-version-specific-dirs-with.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroo=
t-gcc-version-specific-dirs-with.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroo=
t-gcc-version-specific-dirs-with.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_B=
UILD-and-related-variables.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_B=
UILD-and-related-variables.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUI=
LD-and-related-variables.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUI=
LD-and-related-variables.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DY=
NAMIC_LINKER.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DY=
NAMIC_LINKER.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-=
to-link-commandline-for-musl-targe.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-=
to-link-commandline-for-musl-targe.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to=
-link-commandline-for-musl-targe.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to=
-link-commandline-for-musl-targe.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to=
-use-ldbl-128-on-ppc.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to=
-use-ldbl-128-on-ppc.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-u=
se-ldbl-128-on-ppc.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-u=
se-ldbl-128-on-ppc.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-=
LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-=
LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LD=
FLAGS-not-just-SHLIB_LDFLAGS.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LD=
FLAGS-not-just-SHLIB_LDFLAGS.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias=
-for-__cpu_indicator_init-instead-.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias=
-for-__cpu_indicator_init-instead-.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-f=
or-__cpu_indicator_init-instead-.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-f=
or-__cpu_indicator_init-instead-.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-=
with-musl.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-=
with-musl.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-wi=
th-musl.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-wi=
th-musl.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-f=
ault-in-precompiled-header-generat.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-f=
ault-in-precompiled-header-generat.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fau=
lt-in-precompiled-header-generat.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fau=
lt-in-precompiled-header-generat.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-=
failure.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-=
failure.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-fa=
ilure.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-fa=
ilure.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-c=
ommandline-options.patch
>             b/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-c=
ommandline-options.patch
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-com=
mandline-options.patch
>             rename to
>             meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-com=
mandline-options.patch
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
>             <http://gcc-cross-canadian_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
>             <http://gcc-cross-canadian_8.2.bb>
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
>             <http://gcc-cross-canadian_8.1.bb>
>             rename to
>             meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
>             <http://gcc-cross-canadian_8.2.bb>
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
>             <http://gcc-cross-initial_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
>             <http://gcc-cross-initial_8.2.bb>
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
>             <http://gcc-cross-initial_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc-cross-initial_8.2.b=
b
>             <http://gcc-cross-initial_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/gcc-cross_8.1.bb
>             <http://gcc-cross_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-cross_8.2.bb
>             <http://gcc-cross_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc-cross_8.1.bb
>             <http://gcc-cross_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc-cross_8.2.bb
>             <http://gcc-cross_8.2.bb>
>             diff --git
>             a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
>             <http://gcc-crosssdk-initial_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
>             <http://gcc-crosssdk-initial_8.2.bb>
>             similarity index 100%
>             rename from
>             meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
>             <http://gcc-crosssdk-initial_8.1.bb>
>             rename to
>             meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
>             <http://gcc-crosssdk-initial_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
>             <http://gcc-crosssdk_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
>             <http://gcc-crosssdk_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
>             <http://gcc-crosssdk_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
>             <http://gcc-crosssdk_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
>             <http://gcc-runtime_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
>             <http://gcc-runtime_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
>             <http://gcc-runtime_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
>             <http://gcc-runtime_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.b=
b
>             <http://gcc-sanitizers_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>             <http://gcc-sanitizers_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb=

>             <http://gcc-sanitizers_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>             <http://gcc-sanitizers_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/gcc-source_8.1.bb
>             <http://gcc-source_8.1.bb>
>             b/meta/recipes-devtools/gcc/gcc-source_8.2.bb
>             <http://gcc-source_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc-source_8.1.bb
>             <http://gcc-source_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc-source_8.2.bb
>             <http://gcc-source_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/gcc_8.1.bb
>             <http://gcc_8.1.bb> b/meta/recipes-devtools/gcc/gcc_8.2.bb
>             <http://gcc_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/gcc_8.1.bb
>             <http://gcc_8.1.bb>
>             rename to meta/recipes-devtools/gcc/gcc_8.2.bb
>             <http://gcc_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.1.b=
b
>             <http://libgcc-initial_8.1.bb>
>             b/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
>             <http://libgcc-initial_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/libgcc-initial_8.1.bb=

>             <http://libgcc-initial_8.1.bb>
>             rename to meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
>             <http://libgcc-initial_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/libgcc_8.1.bb
>             <http://libgcc_8.1.bb>
>             b/meta/recipes-devtools/gcc/libgcc_8.2.bb <http://libgcc_8.=
2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/libgcc_8.1.bb
>             <http://libgcc_8.1.bb>
>             rename to meta/recipes-devtools/gcc/libgcc_8.2.bb
>             <http://libgcc_8.2.bb>
>             diff --git a/meta/recipes-devtools/gcc/libgfortran_8.1.bb
>             <http://libgfortran_8.1.bb>
>             b/meta/recipes-devtools/gcc/libgfortran_8.2.bb
>             <http://libgfortran_8.2.bb>
>             similarity index 100%
>             rename from meta/recipes-devtools/gcc/libgfortran_8.1.bb
>             <http://libgfortran_8.1.bb>
>             rename to meta/recipes-devtools/gcc/libgfortran_8.2.bb
>             <http://libgfortran_8.2.bb>
>             --=20
>             2.18.0
>=20
>             --=20
>             _______________________________________________
>             Openembedded-core mailing list
>             Openembedded-core@lists.openembedded.org
>             <mailto:Openembedded-core@lists.openembedded.org>
>             http://lists.openembedded.org/mailman/listinfo/openembedded=
-core
>=20


--benVf7P9tDJ47lw2QAbqP2B2DZuX7N81p--

--egSoOoZZEjxyGY3zQNwKCDKDtRdlvySLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW2dXKAAKCRC7BTNVkZ0z
FEd5AJ9JX5upzk/9UMuufJ5CeV4PthcbMQCgkF3H6JtB9Fsq0vAlLG7yBJxO1Co=
=t9NX
-----END PGP SIGNATURE-----

--egSoOoZZEjxyGY3zQNwKCDKDtRdlvySLo--
