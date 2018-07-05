Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9366D789FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 16:37:30 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id y8-v6so5906216pfm.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=upqCEcJfn3OGupxkmoRl+tQvrJaiB9jFTiaqR0jYosI=;
	b=PnOwCcmuJoyLS+2LwCnI6iKRHW66IGfUyvQYnh2iznGzmwpFM9syuxWMu/alw9xbHE
	vutGWswa+jUgKpmO5LrHVLBcHxkSxivRdGLmvoAZvTf4WtRh+PKbnh/OKfJZ6BjgNMVZ
	3gpCHdv6FgDPstdMT2NfLGN2Y9Zdk7+xeogHpWCGAZ2MGSShkQ+6NklCL8AAqsuNg6Nh
	fG59Z3M5M91NWrN3d0zq7NhOh5kUhxf30U+hDy24X4XySIp+XwvttyWTe6rrckRbxw5B
	Sx8Zw+cRH/fFuVE5y0AihccO0c21oxuoUHVxyTU8ZbgyuutNQL4/5Zu8TtI+By6rBScM
	10Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=upqCEcJfn3OGupxkmoRl+tQvrJaiB9jFTiaqR0jYosI=;
	b=sYb7+x5IbBs3RXsiRkKb2yPlbz8WGd7mdIS45icw9xE4fyU94Gm5aBReP7QQg5zQto
	iDKmsfuGvfS71JO3dX2xGmnIJsbgPLDyWHoftlHBYNHTxnDtFv2RCTBrJZr9ggq7QoUF
	8wVqcvSDif74gqLPmIax6jZg0G1VJ6uAUnZuiVNPsA5WwLI4lH5jDEccgVCTwQnRhbOk
	JEfCjkuoxynAHmy+GKeWcB+A9BP1PfjXAkbkA6/k7SG3YaRsLaRZz0i1Rs/3+hoSVGMp
	O8TSmLtcS4Hufbz1bnmiaYTkxQVoHn5FoCtOZySZQXH22EJcbYOz831UK9wwoWQ1VFRD
	8JNQ==
X-Gm-Message-State: APt69E3jZdu6qxumolnsNSPxkBcmBObdczyZr+TTmQrjVb6Z3RYpbos7
	Gg1kKbrgZQY1GSxrvWmuxRMPGjK6
X-Google-Smtp-Source: AAOMgpd+K76m3/vv3B1fO9ed7ytVV/mjqWCUyUZCg06YSGLJuQ1ERNKr3S762/KJ5oJljN2CkghU8A==
X-Received: by 2002:a63:4703:: with SMTP id u3-v6mr69421pga.405.1530808650001; 
	Thu, 05 Jul 2018 09:37:30 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	k9-v6sm12624931pfc.179.2018.07.05.09.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 09:37:29 -0700 (PDT)
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1530775716.git.Qi.Chen@windriver.com>
	<64ff479e5f6380bdf8d9521f2ea727b4e89f2b36.1530775716.git.Qi.Chen@windriver.com>
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
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
	Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
	4evWolFf5cMmp87DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
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
Message-ID: <50455583-91e1-8ecf-b737-27b773a7fd82@gmail.com>
Date: Thu, 5 Jul 2018 09:37:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <64ff479e5f6380bdf8d9521f2ea727b4e89f2b36.1530775716.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 05 Jul 2018 16:37:30 -0000
X-Groupsio-MsgNum: 113203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WyrXjHqqMRIwVKbN8STW8lYkZvvdfmtBs"

--WyrXjHqqMRIwVKbN8STW8lYkZvvdfmtBs
Content-Type: multipart/mixed; boundary="eTNJPlPVxeqPJVU188n9sXYK72N3KKdVc";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Message-ID: <50455583-91e1-8ecf-b737-27b773a7fd82@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
References: <cover.1530775716.git.Qi.Chen@windriver.com>
 <64ff479e5f6380bdf8d9521f2ea727b4e89f2b36.1530775716.git.Qi.Chen@windriver.com>
In-Reply-To: <64ff479e5f6380bdf8d9521f2ea727b4e89f2b36.1530775716.git.Qi.Chen@windriver.com>

--eTNJPlPVxeqPJVU188n9sXYK72N3KKdVc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/5/18 12:31 AM, Chen Qi wrote:
> Upgrade systemd to 239.
>=20
> 1. Patch Changes
> * Rebased Patches
>   0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>   0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>   0006-Make-root-s-home-directory-configurable.patch
>   0027-remove-nobody-user-group-checking.patch
>   0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>   0013-add-fallback-parse_printf_format-implementation.patch
>   0014-src-basic-missing.h-check-for-missing-strndupa.patch
>   0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>   0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>   0017-Include-netinet-if_ether.h.patch
>   0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>   0022-don-t-use-glibc-specific-qsort_r.patch
>   0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>   0026-Use-uintmax_t-for-handling-rlim_t.patch
>   0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>   0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>   0001-core-device.c-Change-the-default-device-timeout-to-2.patch
>   0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>=20
> * Dropped Patches and Reasons
>   0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>     This patch is dropped because there's no build and runtime
>     error without it. In the patch's commit message, it says for
>     some unknown reason, systemd 234 needs it. But after doing
>     build and runtime test, I can see that systemd 239 doesn't
>     need it.

IIRC it happend with gold linker see
https://github.com/systemd/systemd/issues/234

If we need to drop it then please validate it ld-is-gold distro feature
the relevant linker bug seems to be fixed but we need to ensure

>=20
>   0007-Revert-rules-remove-firmware-loading-rules.patch
>   0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     These two patches are dropped because they are for kernel < 3.7.
>     But the current minimal requirement of kernel to build systemd
>     is as below.
>     REQUIREMENTS:
>         Linux kernel >=3D 3.13
>         Linux kernel >=3D 4.2 for unified cgroup hierarchy support
>     So these two patches no long make any sense.
>=20

I think there were/are OE users who still use kernel < 3.7, if no one
chimes in, I am ok to drop them.

>   0009-remove-duplicate-include-uchar.h.patch
>   0010-check-for-uchar.h-in-meson.build.patch
>     These two patches are dropped because musl has implemented
>     uchar.h. See commit below from musl repo.
>     """
>     ab9672ae73248f51e30f4553c4b8878525e46383
>     implement uchar.h (C11 UTF-16/32 conversion) interfaces
>     """
>=20

This is fine.

>   0018-check-for-missing-canonicalize_file_name.patch
>     The above patch is dropped because current systemd does not need
>     canonicalize_file_name.

OK

>=20
>   0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>     The above patch is dropped because utmp makes no sense in musl.
>     Check code below from musl.
>     include/utmp.h:#define _PATH_UTMP "/dev/null/utmp"
>     And utmp PACKAGECONFIG has been explicitly disabled for musl.
>     So we don't need this patch.
>=20

while utmp is disabled for musl, I think the above patch is in direction
to enable it fully for musl. I would suggest that we first try to enable
utmp for musl along with this patch, I remember there were some kinks
and if the build still fails probably its fine to drop it.

>   0032-memfd.patch
>   0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>   libmount.patch
>   0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>     The above patches are dropped because they are backported patches.
>     And current systemd has contained these patches.
>=20

OK

>   0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>     The above patch is dropped because it has been merged and is now
>     in new version.

OK

>=20
> * Newly Added Patch
>   0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>     This patch is added to fix build for musl.

OK

>=20
>   0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>     This patch is added to fix the following error which caused system
>     unable to boot up.
>       systemd-udevd.service: Failed to adjust OOM setting: Invalid argu=
ment
>       dbus.service: Failed to adjust OOM setting: Invalid argument
>=20

I wonder if a patch should be cooked in line of this one
https://github.com/floppym/systemd/commit/19ef148a26ef11afad1baad1211c825=
bc4d31ba7

> 2. PACKAGECONFIG and Dependency Changes
> * Add a new PACKAGECONFIG item 'gshadow'. Enable it by default for glib=
c
>   but disable it by default for musl. This is because musl does not pro=
vide
>   gshadow.h.

OK

>=20
> * Add a new PACKAGECONFIG item 'portabled'. Default to disable it becau=
se
>   it's still experimental, according to the announcement letter.
>   """
>   Currently, the support is still experimental, but this is expected to=

>   change soon. Reflecting this experimental state, the "portablectl" bi=
nary
>   is not installed into /usr/bin yet.
>   """
>=20
> * Change 'kmod' from a hard dependency to a PACKAGECONFIG item. Default=

>   to enable it.
>=20
> * Change 'acl' from a hard dependency to a PACKAGECONFIG item. Default
>   to enable it.
>=20
> * Remove 'readline' from DEPENDS. systemd does not need it.
>=20
> * Remove 'libcgroup' from DEPENDS. The dependency on libcgroup has been=

>   removed from systemd a long time ago. We now remove this unnecessary
>   dependency from DEPENDS.
>=20
> 3. update-alternatives changes
>   The utilities like shutdown, poweroff, etc. are now created as symlin=
ks
>   at do_install. So there's no need to use update-alternatives mechanis=
m
>   anymore to create the symlinks now. In addtion, I don't think we now
>   support multiple init systems at one running system, so there's reall=
y
>   no need to use update-alternatives mechanism here.
>=20
>   Also update the FILES_${PN} to include these files to avoid QA issue.=

>=20
> 4. SRC_URI Change
>   I've put all musl specific patches to SRC_URI_MUSL and they will only=

>   be applied when TCLIBC is musl. The reason I do this is that systemd
>   upstream has been rejected non-glibc fixes for a long time and it wil=
l
>   continue to reject non-glibc fixes. A typical reply is like "please
>   work with the other libcs to provide glibc compatibility." Please see=

>   an example in this link below.
>   https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg4=
0130.html
>=20

Specifiying them under a separate variable is good however applying them
conditionally is going to cause maintenance issues. It also makes it
hard to keep the argument going with systemd devs since we do no longer
test them with glibc. So lets drop the conditional applying of these
patches.

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd.inc              |   2 +-
>  ...rt_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  34 --
>  ...ck-protector-flags-to-workaround-musl-bui.patch |  28 +-
>  ...nv-when-secure-versions-are-not-available.patch |  10 +-
>  ...-install-dependency-links-at-install-tim.patch} |  22 +-
>  ....c-Change-the-default-device-timeout-to-2.patch |  19 +-
>  ...=3D> 0002-don-t-use-glibc-specific-qsort_r.patch} | 108 +++++-
>  ...per-instead-of-looking-for-relative-opti.patch} |  16 +-
>  ...n_t-is-glibc-specific-use-raw-signature-.patch} |  25 +-
>  ...003-implment-systemd-sysv-install-for-OE.patch} |  10 +-
>  ...lback-parse_printf_format-implementation.patch} |  49 +--
>  ...patch =3D> 0004-rules-whitelist-hd-devices.patch} |   8 +-
>  ...-Make-root-s-home-directory-configurable.patch} |  34 +-
>  ...clude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch |  29 ++
>  ...> 0006-remove-nobody-user-group-checking.patch} |  40 +--
>  ...sic-missing.h-check-for-missing-strndupa.patch} |  66 ++--
>  ...patch =3D> 0007-Include-netinet-if_ether.h.patch} |  51 +--
>  ...evert-rules-remove-firmware-loading-rules.patch |  28 --
>  ...es-watch-metadata-changes-in-ide-devices.patch} |   6 +-
>  ...e-nss-tests-if-nss-systemd-is-not-enable.patch} |  16 +-
>  ...-remove-userspace-firmware-loading-suppor.patch | 377 -------------=
--------
>  ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  86 +++--
>  ...=3D> 0009-add-missing-FTW_-macros-for-musl.patch} |  12 +-
>  ...es-Build-conditionally-when-ENABLE_MYHOS.patch} |  10 +-
>  .../0009-remove-duplicate-include-uchar.h.patch    |  41 ---
>  .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ---
>  ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  17 +-
>  ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  23 +-
>  ...of-__register_atfork-for-non-glibc-build.patch} |  18 +-
>  ...> 0013-Use-uintmax_t-for-handling-rlim_t.patch} |  33 +-
>  ...ULONG_LONG_MAX-definition-in-case-of-mus.patch} |  12 +-
>  ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  12 +-
>  ...c-Disable-tests-for-missing-typedefs-in-.patch} |  14 +-
>  ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  20 +-
>  ...-compatible-basename-for-non-glibc-syste.patch} |  11 +-
>  ...-check-for-missing-canonicalize_file_name.patch |  47 ---
>  ...ble-buffering-when-writing-to-oom_score_a.patch |  39 +++
>  ...PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch |  43 ---
>  meta/recipes-core/systemd/systemd/0032-memfd.patch | 272 -------------=
--
>  ...cros-rename-noreturn-into-_noreturn_-8456.patch | 203 -----------
>  ...truncation-compile-failure-by-typecasting.patch | 173 ----------
>  ...ix-build-with-gcc8-Werror-format-truncati.patch |  53 ---
>  meta/recipes-core/systemd/systemd/libmount.patch   |  75 ----
>  .../systemd/{systemd_237.bb =3D> systemd_239.bb}     | 124 +++----
>  44 files changed, 559 insertions(+), 1802 deletions(-)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-Hide-__start=
_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>  rename meta/recipes-core/systemd/systemd/{0002-binfmt-Don-t-install-de=
pendency-links-at-install-tim.patch =3D> 0001-binfmt-Don-t-install-depend=
ency-links-at-install-tim.patch} (83%)
>  rename meta/recipes-core/systemd/systemd/{0022-don-t-use-glibc-specifi=
c-qsort_r.patch =3D> 0002-don-t-use-glibc-specific-qsort_r.patch} (52%)
>  rename meta/recipes-core/systemd/systemd/{0003-use-lnr-wrapper-instead=
-of-looking-for-relative-opti.patch =3D> 0002-use-lnr-wrapper-instead-of-=
looking-for-relative-opti.patch} (83%)
>  rename meta/recipes-core/systemd/systemd/{0024-comparison_fn_t-is-glib=
c-specific-use-raw-signature-.patch =3D> 0003-comparison_fn_t-is-glibc-sp=
ecific-use-raw-signature-.patch} (47%)
>  rename meta/recipes-core/systemd/systemd/{0004-implment-systemd-sysv-i=
nstall-for-OE.patch =3D> 0003-implment-systemd-sysv-install-for-OE.patch}=
 (86%)
>  rename meta/recipes-core/systemd/systemd/{0013-add-fallback-parse_prin=
tf_format-implementation.patch =3D> 0004-add-fallback-parse_printf_format=
-implementation.patch} (93%)
>  rename meta/recipes-core/systemd/systemd/{0005-rules-whitelist-hd-devi=
ces.patch =3D> 0004-rules-whitelist-hd-devices.patch} (89%)
>  rename meta/recipes-core/systemd/systemd/{0006-Make-root-s-home-direct=
ory-configurable.patch =3D> 0005-Make-root-s-home-directory-configurable.=
patch} (70%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0005-include-gsha=
dow-only-if-ENABLE_GSHADOW-is-1.patch
>  rename meta/recipes-core/systemd/systemd/{0027-remove-nobody-user-grou=
p-checking.patch =3D> 0006-remove-nobody-user-group-checking.patch} (40%)=

>  rename meta/recipes-core/systemd/systemd/{0014-src-basic-missing.h-che=
ck-for-missing-strndupa.patch =3D> 0006-src-basic-missing.h-check-for-mis=
sing-strndupa.patch} (73%)
>  rename meta/recipes-core/systemd/systemd/{0017-Include-netinet-if_ethe=
r.h.patch =3D> 0007-Include-netinet-if_ether.h.patch} (68%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0007-Revert-rules=
-remove-firmware-loading-rules.patch
>  rename meta/recipes-core/systemd/systemd/{0012-rules-watch-metadata-ch=
anges-in-ide-devices.patch =3D> 0007-rules-watch-metadata-changes-in-ide-=
devices.patch} (92%)
>  rename meta/recipes-core/systemd/systemd/{0019-Do-not-enable-nss-tests=
-if-nss-systemd-is-not-enable.patch =3D> 0008-Do-not-enable-nss-tests-if-=
nss-systemd-is-not-enable.patch} (60%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0008-Revert-udev-=
remove-userspace-firmware-loading-suppor.patch
>  rename meta/recipes-core/systemd/systemd/{0015-don-t-fail-if-GLOB_BRAC=
E-and-GLOB_ALTDIRFUNC-is-not-.patch =3D> 0008-don-t-fail-if-GLOB_BRACE-an=
d-GLOB_ALTDIRFUNC-is-not-.patch} (67%)
>  rename meta/recipes-core/systemd/systemd/{0028-add-missing-FTW_-macros=
-for-musl.patch =3D> 0009-add-missing-FTW_-macros-for-musl.patch} (79%)
>  rename meta/recipes-core/systemd/systemd/{0029-nss-mymachines-Build-co=
nditionally-when-ENABLE_MYHOS.patch =3D> 0009-nss-mymachines-Build-condit=
ionally-when-ENABLE_MYHOS.patch} (84%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0009-remove-dupli=
cate-include-uchar.h.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uc=
har.h-in-meson.build.patch
>  rename meta/recipes-core/systemd/systemd/{0011-socket-util-don-t-fail-=
if-libc-doesn-t-support-IDN.patch =3D> 0010-socket-util-don-t-fail-if-lib=
c-doesn-t-support-IDN.patch} (68%)
>  rename meta/recipes-core/systemd/systemd/{0016-src-basic-missing.h-che=
ck-for-missing-__compar_fn_t-.patch =3D> 0011-src-basic-missing.h-check-f=
or-missing-__compar_fn_t-.patch} (63%)
>  rename meta/recipes-core/systemd/systemd/{0030-fix-missing-of-__regist=
er_atfork-for-non-glibc-build.patch =3D> 0012-fix-missing-of-__register_a=
tfork-for-non-glibc-build.patch} (75%)
>  rename meta/recipes-core/systemd/systemd/{0026-Use-uintmax_t-for-handl=
ing-rlim_t.patch =3D> 0013-Use-uintmax_t-for-handling-rlim_t.patch} (77%)=

>  rename meta/recipes-core/systemd/systemd/{0031-fix-missing-ULONG_LONG_=
MAX-definition-in-case-of-mus.patch =3D> 0014-fix-missing-ULONG_LONG_MAX-=
definition-in-case-of-mus.patch} (66%)
>  rename meta/recipes-core/systemd/systemd/{0020-test-hexdecoct.c-Includ=
e-missing.h-for-strndupa.patch =3D> 0015-test-hexdecoct.c-Include-missing=
=2Eh-for-strndupa.patch} (70%)
>  rename meta/recipes-core/systemd/systemd/{0021-test-sizeof.c-Disable-t=
ests-for-missing-typedefs-in-.patch =3D> 0016-test-sizeof.c-Disable-tests=
-for-missing-typedefs-in-.patch} (73%)
>  rename meta/recipes-core/systemd/systemd/{0023-don-t-pass-AT_SYMLINK_N=
OFOLLOW-flag-to-faccessat.patch =3D> 0017-don-t-pass-AT_SYMLINK_NOFOLLOW-=
flag-to-faccessat.patch} (89%)
>  rename meta/recipes-core/systemd/systemd/{0035-Define-glibc-compatible=
-basename-for-non-glibc-syste.patch =3D> 0018-Define-glibc-compatible-bas=
ename-for-non-glibc-syste.patch} (78%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-mi=
ssing-canonicalize_file_name.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-disab=
le-buffering-when-writing-to-oom_score_a.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0025-Define-_PATH=
_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0032-memfd.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0033-basic-macros=
-rename-noreturn-into-_noreturn_-8456.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0034-Fix-format-t=
runcation-compile-failure-by-typecasting.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-fi=
x-build-with-gcc8-Werror-format-truncati.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/libmount.patch
>  rename meta/recipes-core/systemd/{systemd_237.bb =3D> systemd_239.bb} =
(86%)
>=20
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/=
systemd/systemd.inc
> index 5fa48e7a..736e0a0 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7aba=
abaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
> =20
> -SRCREV =3D "46659f7deb962f55c728e70597e37c2a3ab6326d"
> +SRCREV =3D "de7436b02badc82200dc127ff190b8155769b8e7"
> =20
>  SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dgit"
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ER=
ROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/system=
d/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> deleted file mode 100644
> index 2cffc42..0000000
> --- a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP=
-and-__stop_BUS_ERROR_MAP.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001=

> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 2 Mar 2018 18:00:17 -0800
> -Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
> -
> -for currently unknown reasons they get exported to the shared libries
> -even without being listed in the sym file
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -
> -Upstream-Status: Pending [ Conditional on master needing this, 234 doe=
s need it ]
> -
> - src/libsystemd/sd-bus/bus-error.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus=
/bus-error.c
> -index 378f7a377..49d797abd 100644
> ---- a/src/libsystemd/sd-bus/bus-error.c
> -+++ b/src/libsystemd/sd-bus/bus-error.c
> -@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bu=
s_standard_errors[] =3D {
> - };
> -=20
> - /* GCC maps this magically to the beginning and end of the BUS_ERROR_=
MAP section */
> --extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
> --extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
> -+extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
> -+extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
> -=20
> - /* Additional maps registered with sd_bus_error_add_map() are in this=

> -  * NULL terminated array */
> ---=20
> -2.16.2
> -
> diff --git a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-prote=
ctor-flags-to-workaround-musl-bui.patch b/meta/recipes-core/systemd/syste=
md/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
> index e913e3f..d745800 100644
> --- a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-fl=
ags-to-workaround-musl-bui.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-fl=
ags-to-workaround-musl-bui.patch
> @@ -1,6 +1,6 @@
> -From e361f6b4aefae57efff7e457df8db4d1067bec23 Mon Sep 17 00:00:00 2001=

> +From 9e3816bcaa36e1a11647ca0cf4f8044449c77fe0 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 21:50:23 -0800
> +Date: Mon, 2 Jul 2018 15:28:22 +0800
>  Subject: [PATCH] Remove fstack-protector flags to workaround musl buil=
d
> =20
>  Remove fstack-protector and fstack-protector-strong flags to fix
> @@ -8,7 +8,7 @@ the following build failure for qemux86 and qemuppc wit=
h musl.
> =20
>    undefined reference to `__stack_chk_fail_local'
> =20
> -Upstream-Status: Inappropriate [OE Specific]
> +Upstream-Status: Inappropriate [musl Specific]
> =20
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
> @@ -16,18 +16,18 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 2 deletions(-)
> =20
>  diff --git a/meson.build b/meson.build
> -index 7610ab12b..591b9cbab 100644
> +index f432ea072..a734a295c 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -329,8 +329,6 @@ foreach arg : ['-Wextra',
> -                '-fdiagnostics-show-option',
> -                '-fno-strict-aliasing',
> -                '-fvisibility=3Dhidden',
> --               '-fstack-protector',
> --               '-fstack-protector-strong',
> -                '--param=3Dssp-buffer-size=3D4',
> -               ]
> -         if cc.has_argument(arg)
> +@@ -333,8 +333,6 @@ possible_cc_flags =3D [
> +         '-fdiagnostics-show-option',
> +         '-fno-strict-aliasing',
> +         '-fvisibility=3Dhidden',
> +-        '-fstack-protector',
> +-        '-fstack-protector-strong',
> +         '--param=3Dssp-buffer-size=3D4',
> + ]
> +=20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-sec=
ure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/=
0001-Use-getenv-when-secure-versions-are-not-available.patch
> index f4c15e1..03f6ead 100644
> --- a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-ver=
sions-are-not-available.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-ver=
sions-are-not-available.patch
> @@ -1,7 +1,7 @@
> -From b1192a6e171413291d9d64fafc04773c6bbc9cab Mon Sep 17 00:00:00 2001=

> +From 6dd136512896979feb6883a16226d640a7e5ca74 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Fri, 23 Feb 2018 10:04:48 +0800
> -Subject: [PATCH 01/31] Use getenv when secure versions are not availab=
le
> +Subject: [PATCH 01/19] Use getenv when secure versions are not availab=
le
> =20
>  musl doesnt implement secure version, so we default
>  to it if configure does not detect a secure implementation
> @@ -16,10 +16,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 1280e6c41..39c1fb700 100644
> +index 71a07d057..0e33abb9f 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -605,7 +605,7 @@ struct btrfs_ioctl_quota_ctl_args {
> +@@ -592,7 +592,7 @@ struct btrfs_ioctl_quota_ctl_args {
>   #  if HAVE___SECURE_GETENV
>   #    define secure_getenv __secure_getenv
>   #  else
> @@ -29,5 +29,5 @@ index 1280e6c41..39c1fb700 100644
>   #endif
>  =20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-instal=
l-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/syste=
md/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> similarity index 83%
> rename from meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install=
-dependency-links-at-install-tim.patch
> rename to meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-d=
ependency-links-at-install-tim.patch
> index c3f4b39..e24e7f8 100644
> --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depen=
dency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depen=
dency-links-at-install-tim.patch
> @@ -1,7 +1,7 @@
> -From c93eb6cdec03f5e243e59e95dc49273fcb90e7c1 Mon Sep 17 00:00:00 2001=

> +From 87dd61be2e28e78ce4f9f173794812e6c2d904d1 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Fri, 23 Feb 2018 10:23:40 +0800
> -Subject: [PATCH 02/31] binfmt: Don't install dependency links at insta=
ll time
> +Date: Wed, 27 Jun 2018 16:01:22 +0800
> +Subject: [PATCH 1/9] binfmt: Don't install dependency links at install=
 time=20
>   for the binfmt services
> =20
>  use [Install] blocks so that they get created when the service is enab=
led
> @@ -23,10 +23,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   3 files changed, 9 insertions(+), 4 deletions(-)
> =20
>  diff --git a/units/meson.build b/units/meson.build
> -index 814ee7885..49ace0d0f 100644
> +index e4ac6ced6..698734e44 100644
>  --- a/units/meson.build
>  +++ b/units/meson.build
> -@@ -60,8 +60,7 @@ units =3D [
> +@@ -46,8 +46,7 @@ units =3D [
>           ['poweroff.target',                     '',
>            'runlevel0.target'],
>           ['printer.target',                      ''],
> @@ -36,7 +36,7 @@ index 814ee7885..49ace0d0f 100644
>           ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
>           ['reboot.target',                       '',
>            'runlevel6.target ctrl-alt-del.target'],
> -@@ -144,8 +143,7 @@ in_units =3D [
> +@@ -130,8 +129,7 @@ in_units =3D [
>           ['systemd-ask-password-console.service', ''],
>           ['systemd-ask-password-wall.service',    ''],
>           ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],=

> @@ -58,18 +58,18 @@ index 30a6bc991..4231f3b70 100644
>  +[Install]
>  +WantedBy=3Dsysinit.target
>  diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.se=
rvice.in
> -index df9396d89..0687f4648 100644
> +index e940c7c9a..6be7f5cc9 100644
>  --- a/units/systemd-binfmt.service.in
>  +++ b/units/systemd-binfmt.service.in
> -@@ -13,6 +13,7 @@ Documentation=3Dman:systemd-binfmt.service(8) man:bi=
nfmt.d(5)
> - Documentation=3Dhttps://www.kernel.org/doc/Documentation/binfmt_misc.=
txt
> +@@ -14,6 +14,7 @@ Documentation=3Dhttps://www.kernel.org/doc/html/late=
st/admin-guide/binfmt-misc.htm
> + Documentation=3Dhttps://www.freedesktop.org/wiki/Software/systemd/API=
FileSystems
>   DefaultDependencies=3Dno
>   Conflicts=3Dshutdown.target
>  +Wants=3Dproc-sys-fs-binfmt_misc.automount
>   After=3Dproc-sys-fs-binfmt_misc.automount
>   Before=3Dsysinit.target shutdown.target
>   ConditionPathIsReadWrite=3D/proc/sys/
> -@@ -27,3 +28,6 @@ Type=3Doneshot
> +@@ -28,3 +29,6 @@ Type=3Doneshot
>   RemainAfterExit=3Dyes
>   ExecStart=3D@rootlibexecdir@/systemd-binfmt
>   TimeoutSec=3D90s
> @@ -77,5 +77,5 @@ index df9396d89..0687f4648 100644
>  +[Install]
>  +WantedBy=3Dsysinit.target
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Chang=
e-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/syste=
md/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> index 98c8362..fd7bf3f 100644
> --- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
> @@ -1,7 +1,9 @@
> -From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001=

> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 14 Dec 2015 04:09:19 +0000
> +From 2925c0c3b6ce4056622b86c1c61ee14add430790 Mon Sep 17 00:00:00 2001=

> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 28 Jun 2018 10:56:29 +0800
>  Subject: [PATCH] core/device.c: Change the default device timeout to 2=
40 sec.
> + MIME-Version: 1.0 Content-Type: text/plain; charset=3DUTF-8
> + Content-Transfer-Encoding: 8bit
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -10,16 +12,16 @@ Upstream-Status: Inappropriate [Specific case QEMU/=
AB]
> =20
>  Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   src/core/device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/src/core/device.c b/src/core/device.c
> -index a43664d3b..4b16a8aec 100644
> +index a2d00a0fb..f26e55ebb 100644
>  --- a/src/core/device.c
>  +++ b/src/core/device.c
> -@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
> +@@ -95,7 +95,7 @@ static void device_init(Unit *u) {
>            * indefinitely for plugged in devices, something which canno=
t
>            * happen for the other units since their operations time out=

>            * anyway. */
> @@ -27,4 +29,7 @@ index a43664d3b..4b16a8aec 100644
>  +        u->job_running_timeout =3D (240 * USEC_PER_SEC);
>  =20
>           u->ignore_on_isolate =3D true;
> - }
> +=20
> +--=20
> +2.11.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-spe=
cific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-gl=
ibc-specific-qsort_r.patch
> similarity index 52%
> rename from meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-spec=
ific-qsort_r.patch
> rename to meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specif=
ic-qsort_r.patch
> index a5f7442..f07211b 100644
> --- a/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-q=
sort_r.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-q=
sort_r.patch
> @@ -1,21 +1,99 @@
> -From d343757d629402c70ca8e5eaa551deaf175c96f3 Mon Sep 17 00:00:00 2001=

> +From d43faf6d253db789225b7c454c8f255fbc68857e Mon Sep 17 00:00:00 2001=

>  From: Emil Renner Berthing <systemd@esmil.dk>
>  Date: Thu, 18 Sep 2014 15:24:56 +0200
> -Subject: [PATCH 22/31] don't use glibc-specific qsort_r
> +Subject: [PATCH 02/19] don't use glibc-specific qsort_r
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - src/hwdb/hwdb.c         | 18 +++++++++++-------
> - src/udev/udevadm-hwdb.c | 16 ++++++++++------
> - 2 files changed, 21 insertions(+), 13 deletions(-)
> + src/basic/format-table.c | 27 ++++++++++++++++-----------
> + src/basic/util.h         |  7 -------
> + src/hwdb/hwdb.c          | 18 +++++++++++-------
> + src/udev/udevadm-hwdb.c  | 16 ++++++++++------
> + 4 files changed, 37 insertions(+), 31 deletions(-)
> =20
> +diff --git a/src/basic/format-table.c b/src/basic/format-table.c
> +index 94e796d1c..f7b4eade9 100644
> +--- a/src/basic/format-table.c
> ++++ b/src/basic/format-table.c
> +@@ -745,29 +745,29 @@ static int cell_data_compare(TableData *a, size_=
t index_a, TableData *b, size_t
> +         return 0;
> + }
> +=20
> +-static int table_data_compare(const void *x, const void *y, void *use=
rdata) {
> ++static Table *user_table;
> ++static int table_data_compare(const void *x, const void *y) {
> +         const size_t *a =3D x, *b =3D y;
> +-        Table *t =3D userdata;
> +         size_t i;
> +         int r;
> +=20
> +-        assert(t);
> +-        assert(t->sort_map);
> ++        assert(user_table);
> ++        assert(user_table->sort_map);
> +=20
> +         /* Make sure the header stays at the beginning */
> +-        if (*a < t->n_columns && *b < t->n_columns)
> ++        if (*a < user_table->n_columns && *b < user_table->n_columns)=

> +                 return 0;
> +-        if (*a < t->n_columns)
> ++        if (*a < user_table->n_columns)
> +                 return -1;
> +-        if (*b < t->n_columns)
> ++        if (*b < user_table->n_columns)
> +                 return 1;
> +=20
> +         /* Order other lines by the sorting map */
> +-        for (i =3D 0; i < t->n_sort_map; i++) {
> ++        for (i =3D 0; i < user_table->n_sort_map; i++) {
> +                 TableData *d, *dd;
> +=20
> +-                d =3D t->data[*a + t->sort_map[i]];
> +-                dd =3D t->data[*b + t->sort_map[i]];
> ++                d =3D user_table->data[*a + user_table->sort_map[i]];=

> ++                dd =3D user_table->data[*b + user_table->sort_map[i]]=
;
> +=20
> +                 r =3D cell_data_compare(d, *a, dd, *b);
> +                 if (r !=3D 0)
> +@@ -960,7 +960,12 @@ int table_print(Table *t, FILE *f) {
> +                 for (i =3D 0; i < n_rows; i++)
> +                         sorted[i] =3D i * t->n_columns;
> +=20
> +-                qsort_r_safe(sorted, n_rows, sizeof(size_t), table_da=
ta_compare, t);
> ++                if (n_rows <=3D 1)
> ++                        return;
> ++                assert(sorted);
> ++                user_table =3D t;
> ++                qsort(sorted, n_rows, sizeof(size_t), table_data_comp=
are);
> ++                user_table =3D NULL;
> +         }
> +=20
> +         if (t->display_map)
> +diff --git a/src/basic/util.h b/src/basic/util.h
> +index 9699d228f..40eaf518c 100644
> +--- a/src/basic/util.h
> ++++ b/src/basic/util.h
> +@@ -105,13 +105,6 @@ static inline void qsort_safe(void *base, size_t =
nmemb, size_t size, comparison_
> +                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) =
_func_); \
> +         })
> +=20
> +-static inline void qsort_r_safe(void *base, size_t nmemb, size_t size=
, int (*compar)(const void*, const void*, void*), void *userdata) {
> +-        if (nmemb <=3D 1)
> +-                return;
> +-
> +-        assert(base);
> +-        qsort_r(base, nmemb, size, compar, userdata);
> +-}
> +=20
> + /**
> +  * Normal memcpy requires src to be nonnull. We do nothing if n is 0.=

>  diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
> -index 4540260f9..81aca7a9b 100644
> +index 317cad8a6..701d59a1e 100644
>  --- a/src/hwdb/hwdb.c
>  +++ b/src/hwdb/hwdb.c
> -@@ -152,13 +152,12 @@ static void trie_free(struct trie *trie) {
> +@@ -135,13 +135,12 @@ static void trie_free(struct trie *trie) {
>  =20
>   DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
>  =20
> @@ -33,7 +111,7 @@ index 4540260f9..81aca7a9b 100644
>   }
>  =20
>   static int trie_node_add_value(struct trie *trie, struct trie_node *n=
ode,
> -@@ -183,7 +182,10 @@ static int trie_node_add_value(struct trie *trie,=
 struct trie_node *node,
> +@@ -166,7 +165,10 @@ static int trie_node_add_value(struct trie *trie,=
 struct trie_node *node,
>                           .value_off =3D v,
>                   };
>  =20
> @@ -45,7 +123,7 @@ index 4540260f9..81aca7a9b 100644
>                   if (val) {
>                           /* At this point we have 2 identical properti=
es on the same match-string.
>                            * Since we process files in order, we just r=
eplace the previous value.
> -@@ -208,7 +210,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> +@@ -191,7 +193,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
>           node->values[node->values_count].file_priority =3D file_prior=
ity;
>           node->values[node->values_count].line_number =3D line_number;=

>           node->values_count++;
> @@ -57,10 +135,10 @@ index 4540260f9..81aca7a9b 100644
>   }
>  =20
>  diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
> -index ab5dc7ab6..c777e30ab 100644
> +index 02408a428..491d367d1 100644
>  --- a/src/udev/udevadm-hwdb.c
>  +++ b/src/udev/udevadm-hwdb.c
> -@@ -130,13 +130,13 @@ static void trie_node_cleanup(struct trie_node *=
node) {
> +@@ -114,13 +114,13 @@ static void trie_node_cleanup(struct trie_node *=
node) {
>           free(node);
>   }
>  =20
> @@ -78,7 +156,7 @@ index ab5dc7ab6..c777e30ab 100644
>   }
>  =20
>   static int trie_node_add_value(struct trie *trie, struct trie_node *n=
ode,
> -@@ -157,7 +157,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> +@@ -141,7 +141,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
>                           .value_off =3D v,
>                   };
>  =20
> @@ -89,7 +167,7 @@ index ab5dc7ab6..c777e30ab 100644
>                   if (val) {
>                           /* replace existing earlier key with new valu=
e */
>                           val->value_off =3D v;
> -@@ -174,7 +176,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> +@@ -158,7 +160,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
>           node->values[node->values_count].key_off =3D k;
>           node->values[node->values_count].value_off =3D v;
>           node->values_count++;
> @@ -101,5 +179,5 @@ index ab5dc7ab6..c777e30ab 100644
>   }
>  =20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-ins=
tead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/syste=
md/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> similarity index 83%
> rename from meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-inst=
ead-of-looking-for-relative-opti.patch
> rename to meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instea=
d-of-looking-for-relative-opti.patch
> index 28f1b21..1d7f523 100644
> --- a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of=
-looking-for-relative-opti.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of=
-looking-for-relative-opti.patch
> @@ -1,8 +1,8 @@
> -From 8b9d194e956848e0d1fb35ef2fba714b2691ebe6 Mon Sep 17 00:00:00 2001=

> +From 6e62be87a2722fbe531310a1b052c1301bdf06fb Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 20:47:49 -0800
> -Subject: [PATCH 03/31] use lnr wrapper instead of looking for --relati=
ve
> - option for ln
> +Date: Wed, 27 Jun 2018 16:09:24 +0800
> +Subject: [PATCH 2/9] use lnr wrapper instead of looking for --relative=
 option
> + for ln
> =20
>  Remove file manually to avoid the 'File Exists' error when creating
>  symlink. This is because the original 'ln' command uses '-f' option.
> @@ -18,15 +18,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   3 files changed, 8 insertions(+), 6 deletions(-)
> =20
>  diff --git a/meson.build b/meson.build
> -index 36a62d280..7347ea880 100644
> +index 04331dd41..6d5edcb4e 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -570,10 +570,6 @@ endforeach
> +@@ -558,10 +558,6 @@ endforeach
>  =20
>   conf.set_quoted('TELINIT', get_option('telinit-path'))
>  =20
>  -if run_command('ln', '--relative', '--help').returncode() !=3D 0
> --        error('ln does not support --relative')
> +-        error('ln does not support --relative (added in coreutils 8.1=
6)')
>  -endif
>  -
>   ############################################################
> @@ -60,5 +60,5 @@ index 70f7172ae..a42666aac 100755
>  +        lnr "$unitpath" "$dir"
>  +fi
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-=
glibc-specific-use-raw-signature-.patch b/meta/recipes-core/systemd/syste=
md/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
> similarity index 47%
> rename from meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-g=
libc-specific-use-raw-signature-.patch
> rename to meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-gli=
bc-specific-use-raw-signature-.patch
> index fe7e623..115fb33 100644
> --- a/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-s=
pecific-use-raw-signature-.patch
> +++ b/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-s=
pecific-use-raw-signature-.patch
> @@ -1,23 +1,32 @@
> -From 76c71aa889155f29be1d5d2b74a2c4faa5909c8c Mon Sep 17 00:00:00 2001=

> +From e965e748c7030df0709e63128db2f023540a06ba Mon Sep 17 00:00:00 2001=

>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 12 Sep 2015 18:53:31 +0000
> -Subject: [PATCH 24/31] comparison_fn_t is glibc specific, use raw sign=
ature in
> +Subject: [PATCH 03/19] comparison_fn_t is glibc specific, use raw sign=
ature in
>   function pointer
> =20
>  make it work with musl where comparison_fn_t is not provided
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - src/basic/util.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + src/basic/util.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/src/basic/util.h b/src/basic/util.h
> -index 9d1b10756..12db53a93 100644
> +index 40eaf518c..c58392397 100644
>  --- a/src/basic/util.h
>  +++ b/src/basic/util.h
> -@@ -95,7 +95,7 @@ void *xbsearch_r(const void *key, const void *base, =
size_t nmemb, size_t size,
> +@@ -77,7 +77,7 @@ void *xbsearch_r(const void *key, const void *base, =
size_t nmemb, size_t size,
> +  * that only if nmemb > 0.
> +  */
> + static inline void* bsearch_safe(const void *key, const void *base,
> +-                                 size_t nmemb, size_t size, compariso=
n_fn_t compar) {
> ++                                 size_t nmemb, size_t size, int (*com=
par)(const void *, const void *)) {
> +         if (nmemb <=3D 0)
> +                 return NULL;
> +=20
> +@@ -89,7 +89,7 @@ static inline void* bsearch_safe(const void *key, co=
nst void *base,
>    * Normal qsort requires base to be nonnull. Here were require
>    * that only if nmemb > 0.
>    */
> @@ -27,5 +36,5 @@ index 9d1b10756..12db53a93 100644
>                   return;
>  =20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0004-implment-systemd-sy=
sv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0003-implment=
-systemd-sysv-install-for-OE.patch
> similarity index 86%
> rename from meta/recipes-core/systemd/systemd/0004-implment-systemd-sys=
v-install-for-OE.patch
> rename to meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-=
install-for-OE.patch
> index 83fdb53..6c595ae 100644
> --- a/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-inst=
all-for-OE.patch
> +++ b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-inst=
all-for-OE.patch
> @@ -1,7 +1,7 @@
> -From 70d456fb21de2a80697fa364f08475339d6396c1 Mon Sep 17 00:00:00 2001=

> +From 0fcb6e646401205e17cc6c129441a49023c62cef Mon Sep 17 00:00:00 2001=

>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 5 Sep 2015 06:31:47 +0000
> -Subject: [PATCH 04/31] implment systemd-sysv-install for OE
> +Subject: [PATCH 3/9] implment systemd-sysv-install for OE
> =20
>  Use update-rc.d for enabling/disabling and status command
>  to check the status of the sysv service
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 3 insertions(+), 3 deletions(-)
> =20
>  diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemc=
tl/systemd-sysv-install.SKELETON
> -index a53a3e622..5d877b06e 100755
> +index 8c16cf999..9f078a121 100755
>  --- a/src/systemctl/systemd-sysv-install.SKELETON
>  +++ b/src/systemctl/systemd-sysv-install.SKELETON
> -@@ -30,17 +30,17 @@ case "$1" in
> +@@ -32,17 +32,17 @@ case "$1" in
>       enable)
>           # call the command to enable SysV init script $NAME here
>           # (consider optional $ROOT)
> @@ -39,5 +39,5 @@ index a53a3e622..5d877b06e 100755
>       *)
>           usage ;;
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_=
printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/00=
04-add-fallback-parse_printf_format-implementation.patch
> similarity index 93%
> rename from meta/recipes-core/systemd/systemd/0013-add-fallback-parse_p=
rintf_format-implementation.patch
> rename to meta/recipes-core/systemd/systemd/0004-add-fallback-parse_pri=
ntf_format-implementation.patch
> index 9c9278d..7652a2d 100644
> --- a/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_=
format-implementation.patch
> +++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_=
format-implementation.patch
> @@ -1,29 +1,29 @@
> -From 580d23cf0b32e36a8fb96710336ffef432b3c7ce Mon Sep 17 00:00:00 2001=

> +From 582af7ec13131dfcc620ed81de7b211914c4cb03 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 21:10:58 -0800
> -Subject: [PATCH] add fallback parse_printf_format implementation
> +Date: Fri, 29 Jun 2018 13:43:49 +0800
> +Subject: [PATCH 04/19] add fallback parse_printf_format implementation=

> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   meson.build                     |   1 +
> - src/basic/meson.build           |   4 +
> + src/basic/meson.build           |   5 +
>   src/basic/parse-printf-format.c | 273 +++++++++++++++++++++++++++++++=
+++++++++
>   src/basic/parse-printf-format.h |  57 +++++++++
>   src/basic/stdio-util.h          |   2 +-
>   src/journal/journal-send.c      |   2 +-
> - 6 files changed, 337 insertions(+), 2 deletions(-)
> + 6 files changed, 338 insertions(+), 2 deletions(-)
>   create mode 100644 src/basic/parse-printf-format.c
>   create mode 100644 src/basic/parse-printf-format.h
> =20
>  diff --git a/meson.build b/meson.build
> -index 94a16712b..4eabaafe8 100644
> +index e045b9224..8c16bc979 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -620,6 +620,7 @@ foreach header : ['crypt.h',
> +@@ -598,6 +598,7 @@ foreach header : ['crypt.h',
>                     'linux/btrfs.h',
>                     'linux/memfd.h',
>                     'linux/vm_sockets.h',
> @@ -32,20 +32,21 @@ index 94a16712b..4eabaafe8 100644
>                     'valgrind/memcheck.h',
>                     'valgrind/valgrind.h',
>  diff --git a/src/basic/meson.build b/src/basic/meson.build
> -index 44cd31ecb..435c6ee02 100644
> +index 31625b178..0c27528e7 100644
>  --- a/src/basic/meson.build
>  +++ b/src/basic/meson.build
> -@@ -310,6 +310,10 @@ endforeach
> +@@ -302,6 +302,11 @@ foreach item : [['af',     af_list_txt,     'af',=
         ''],
> + endforeach
>  =20
>   basic_sources +=3D [missing_h] + generated_gperf_headers
> -=20
> ++
>  +if conf.get('HAVE_PRINTF_H') !=3D 1
>  +        basic_sources +=3D [files('parse-printf-format.c')]
>  +endif
>  +
> - libbasic =3D static_library(
> -         'basic',
> -         basic_sources,
> + basic_gcrypt_sources =3D files(
> +         'gcrypt-util.c',
> +         'gcrypt-util.h')
>  diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-=
format.c
>  new file mode 100644
>  index 000000000..49437e544
> @@ -389,12 +390,12 @@ index 000000000..47be7522d
>  +
>  +#endif /* HAVE_PRINTF_H */
>  diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
> -index dbfafba26..8038380d6 100644
> +index 73c03274c..30192cd71 100644
>  --- a/src/basic/stdio-util.h
>  +++ b/src/basic/stdio-util.h
> -@@ -20,12 +20,12 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> +@@ -1,12 +1,12 @@
> + /* SPDX-License-Identifier: LGPL-2.1+ */
> + #pragma once
>  =20
>  -#include <printf.h>
>   #include <stdarg.h>
> @@ -404,13 +405,13 @@ index dbfafba26..8038380d6 100644
>   #include "macro.h"
>  +#include "parse-printf-format.h"
>  =20
> - #define xsprintf(buf, fmt, ...) \
> -         assert_message_se((size_t) snprintf(buf, ELEMENTSOF(buf), fmt=
, __VA_ARGS__) < ELEMENTSOF(buf), "xsprintf: " #buf "[] must be big enoug=
h")
> + #define snprintf_ok(buf, len, fmt, ...) \
> +         ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
>  diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
> -index 73329ba02..70bb9e0e8 100644
> +index a0621524a..65bcbcd2e 100644
>  --- a/src/journal/journal-send.c
>  +++ b/src/journal/journal-send.c
> -@@ -20,7 +20,6 @@
> +@@ -2,7 +2,6 @@
>  =20
>   #include <errno.h>
>   #include <fcntl.h>
> @@ -418,7 +419,7 @@ index 73329ba02..70bb9e0e8 100644
>   #include <stddef.h>
>   #include <sys/socket.h>
>   #include <sys/un.h>
> -@@ -39,6 +38,7 @@
> +@@ -21,6 +20,7 @@
>   #include "stdio-util.h"
>   #include "string-util.h"
>   #include "util.h"
> @@ -427,5 +428,5 @@ index 73329ba02..70bb9e0e8 100644
>   #define SNDBUF_SIZE (8*1024*1024)
>  =20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-=
devices.patch b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd=
-devices.patch
> similarity index 89%
> rename from meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-d=
evices.patch
> rename to meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-dev=
ices.patch
> index e4421c8..7e37cbc 100644
> --- a/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices=
=2Epatch
> +++ b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices=
=2Epatch
> @@ -1,7 +1,7 @@
> -From 7b5b34993002b4418ba8a3c2ae661a7337fd8ed0 Mon Sep 17 00:00:00 2001=

> +From 5d8128f3832fd11fd046d1d1ad86c4ee7bc1dff0 Mon Sep 17 00:00:00 2001=

>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 9 Nov 2016 19:41:13 -0800
> -Subject: [PATCH 05/31] rules: whitelist hd* devices
> +Subject: [PATCH 4/9] rules: whitelist hd* devices
> =20
>  qemu by default emulates IDE and the linux-yocto kernel(s) use
>  CONFIG_IDE instead of the more modern libsata, so disks appear as
> @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-s=
torage.rules
> -index 0de8cf3a1..d3f58f153 100644
> +index 8ddb7577c..811e948ad 100644
>  --- a/rules/60-persistent-storage.rules
>  +++ b/rules/60-persistent-storage.rules
>  @@ -7,7 +7,7 @@ ACTION=3D=3D"remove", GOTO=3D"persistent_storage_end"
> @@ -29,5 +29,5 @@ index 0de8cf3a1..d3f58f153 100644
>   # ignore partitions that span the entire disk
>   TEST=3D=3D"whole_disk", GOTO=3D"persistent_storage_end"
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-di=
rectory-configurable.patch b/meta/recipes-core/systemd/systemd/0005-Make-=
root-s-home-directory-configurable.patch
> similarity index 70%
> rename from meta/recipes-core/systemd/systemd/0006-Make-root-s-home-dir=
ectory-configurable.patch
> rename to meta/recipes-core/systemd/systemd/0005-Make-root-s-home-direc=
tory-configurable.patch
> index 5ba9661..c137087 100644
> --- a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory=
-configurable.patch
> +++ b/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory=
-configurable.patch
> @@ -1,7 +1,7 @@
> -From 9d63227420f0c4f093c1c2066eafe2b6152070cf Mon Sep 17 00:00:00 2001=

> +From 8b82663aeeedf9ca58e3b97116b4c4da5229e0f5 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Fri, 23 Feb 2018 13:47:37 +0800
> -Subject: [PATCH 06/31] Make root's home directory configurable
> +Date: Wed, 27 Jun 2018 16:46:45 +0800
> +Subject: [PATCH 5/9] Make root's home directory configurable
> =20
>  OpenEmbedded has a configurable home directory for root. Allow
>  systemd to be built using its idea of what root's home directory
> @@ -16,15 +16,15 @@ Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>=

>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
> - meson.build       | 8 ++++++++
> + meson.build       | 7 +++++++
>   meson_options.txt | 2 ++
> - 2 files changed, 10 insertions(+)
> + 2 files changed, 9 insertions(+)
> =20
>  diff --git a/meson.build b/meson.build
> -index 7347ea880..918101d6b 100644
> +index 6d5edcb4e..323146fe1 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -94,6 +94,11 @@ if rootlibdir =3D=3D ''
> +@@ -89,6 +89,11 @@ if rootlibdir =3D=3D ''
>           rootlibdir =3D join_paths(rootprefixdir, libdir.split('/')[-1=
])
>   endif
>  =20
> @@ -36,7 +36,7 @@ index 7347ea880..918101d6b 100644
>   # Dirs of external packages
>   pkgconfigdatadir =3D join_paths(datadir, 'pkgconfig')
>   pkgconfiglibdir =3D join_paths(libdir, 'pkgconfig')
> -@@ -205,6 +210,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                 =
            udevlibexecdir)
> +@@ -210,6 +215,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                 =
            udevlibexecdir)
>   conf.set_quoted('POLKIT_AGENT_BINARY_PATH',                   join_pa=
ths(bindir, 'pkttyagent'))
>   conf.set_quoted('LIBDIR',                                     libdir)=

>   conf.set_quoted('ROOTLIBDIR',                                 rootlib=
dir)
> @@ -44,7 +44,7 @@ index 7347ea880..918101d6b 100644
>   conf.set_quoted('ROOTLIBEXECDIR',                             rootlib=
execdir)
>   conf.set_quoted('BOOTLIBDIR',                                 bootlib=
dir)
>   conf.set_quoted('SYSTEMD_PULL_PATH',                          join_pa=
ths(rootlibexecdir, 'systemd-pull'))
> -@@ -221,6 +227,7 @@ substs.set('prefix',                              =
            prefixdir)
> +@@ -228,6 +234,7 @@ substs.set('prefix',                              =
            prefixdir)
>   substs.set('exec_prefix',                                     prefixd=
ir)
>   substs.set('libdir',                                          libdir)=

>   substs.set('rootlibdir',                                      rootlib=
dir)
> @@ -52,19 +52,11 @@ index 7347ea880..918101d6b 100644
>   substs.set('includedir',                                      include=
dir)
>   substs.set('pkgsysconfdir',                                   pkgsysc=
onfdir)
>   substs.set('bindir',                                          bindir)=

> -@@ -2705,6 +2712,7 @@ status =3D [
> -         'include directory:                 @0@'.format(includedir),
> -         'lib directory:                     @0@'.format(libdir),
> -         'rootlib directory:                 @0@'.format(rootlibdir),
> -+        'roothome directory:                @0@'.format(roothomedir),=

> -         'SysV init scripts:                 @0@'.format(sysvinit_path=
),
> -         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path=
),
> -         'PAM modules directory:             @0@'.format(pamlibdir),
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 39822d6cd..0b24f0e0f 100644
> +index 16c1f2b2f..aa9a33368 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -22,6 +22,8 @@ option('rootlibdir', type : 'string',
> +@@ -9,6 +9,8 @@ option('rootlibdir', type : 'string',
>          description : '''[/usr]/lib/x86_64-linux-gnu or such''')
>   option('rootprefix', type : 'string',
>          description : '''override the root prefix''')
> @@ -72,7 +64,7 @@ index 39822d6cd..0b24f0e0f 100644
>  +       description : '''override the root home directory''')
>   option('link-udev-shared', type : 'boolean',
>          description : 'link systemd-udev and its helpers to libsystemd=
-shared.so')
> -=20
> + option('link-systemctl-shared', type: 'boolean',
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0005-include-gshadow-onl=
y-if-ENABLE_GSHADOW-is-1.patch b/meta/recipes-core/systemd/systemd/0005-i=
nclude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
> new file mode 100644
> index 0000000..6d5faf5
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-EN=
ABLE_GSHADOW-is-1.patch
> @@ -0,0 +1,29 @@
> +From a2c4d46944892174930135672508389a04e191f0 Mon Sep 17 00:00:00 2001=

> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Fri, 29 Jun 2018 13:53:29 +0800
> +Subject: [PATCH 05/19] include gshadow only if ENABLE_GSHADOW is 1
> +
> +Upstream-Status: Inappropriate [musl]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/basic/user-util.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/basic/user-util.h b/src/basic/user-util.h
> +index b74f16885..f9c1e29c4 100644
> +--- a/src/basic/user-util.h
> ++++ b/src/basic/user-util.h
> +@@ -2,7 +2,9 @@
> + #pragma once
> +=20
> + #include <grp.h>
> ++#if ENABLE_GSHADOW
> + #include <gshadow.h>
> ++#endif
> + #include <pwd.h>
> + #include <shadow.h>
> + #include <stdbool.h>
> +--=20
> +2.11.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-=
group-checking.patch b/meta/recipes-core/systemd/systemd/0006-remove-nobo=
dy-user-group-checking.patch
> similarity index 40%
> rename from meta/recipes-core/systemd/systemd/0027-remove-nobody-user-g=
roup-checking.patch
> rename to meta/recipes-core/systemd/systemd/0006-remove-nobody-user-gro=
up-checking.patch
> index 42f59b0..eb6eb8b 100644
> --- a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-c=
hecking.patch
> +++ b/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-c=
hecking.patch
> @@ -1,7 +1,7 @@
> -From 5354eb767d1eba2ec41eb273f6b657f4a630ca8a Mon Sep 17 00:00:00 2001=

> +From 5199ae5dec9b8a9c9e20477d5090f1732735fbe2 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 9 Jan 2018 14:45:46 +0800
> -Subject: [PATCH 27/31] remove nobody user/group checking
> +Date: Thu, 28 Jun 2018 09:38:12 +0800
> +Subject: [PATCH 6/9] remove nobody user/group checking
> =20
>  Upstream-Status: Inappropriate [OE Specific]
> =20
> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 37 deletions(-)
> =20
>  diff --git a/meson.build b/meson.build
> -index f6515e97c..1b947adac 100644
> +index 323146fe1..3bb087fef 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -700,43 +700,6 @@ substs.set('containeruidbasemax', container_uid_b=
ase_max)
> +@@ -681,43 +681,6 @@ substs.set('containeruidbasemax', container_uid_b=
ase_max)
>   nobody_user =3D get_option('nobody-user')
>   nobody_group =3D get_option('nobody-group')
>  =20
> @@ -22,18 +22,18 @@ index f6515e97c..1b947adac 100644
>  -if getent_result.returncode() =3D=3D 0
>  -        name =3D getent_result.stdout().split(':')[0]
>  -        if name !=3D nobody_user
> --                message('WARNING:\n' +
> --                        '        The local user with the UID 65534 do=
es not match the configured user name "@0@" of the nobody user (its name =
is @1@).\n'.format(nobody_user, name) +
> --                        '        Your build will result in an user ta=
ble setup that is incompatible with the local system.')
> +-                warning('\n' +
> +-                        'The local user with the UID 65534 does not m=
atch the configured user name "@0@" of the nobody user (its name is @1@).=
\n'.format(nobody_user, name) +
> +-                        'Your build will result in an user table setu=
p that is incompatible with the local system.')
>  -        endif
>  -endif
>  -id_result =3D run_command('id', '-u', nobody_user)
>  -if id_result.returncode() =3D=3D 0
>  -        id =3D id_result.stdout().to_int()
>  -        if id !=3D 65534
> --                message('WARNING:\n' +
> --                        '        The local user with the configured u=
ser name "@0@" of the nobody user does not have UID 65534 (it has @1@).\n=
'.format(nobody_user, id) +
> --                        '        Your build will result in an user ta=
ble setup that is incompatible with the local system.')
> +-                warning('\n' +
> +-                        'The local user with the configured user name=
 "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.format=
(nobody_user, id) +
> +-                        'Your build will result in an user table setu=
p that is incompatible with the local system.')
>  -        endif
>  -endif
>  -
> @@ -41,23 +41,23 @@ index f6515e97c..1b947adac 100644
>  -if getent_result.returncode() =3D=3D 0
>  -        name =3D getent_result.stdout().split(':')[0]
>  -        if name !=3D nobody_group
> --                message('WARNING:\n' +
> --                        '        The local group with the GID 65534 d=
oes not match the configured group name "@0@" of the nobody group (its na=
me is @1@).\n'.format(nobody_group, name) +
> --                        '        Your build will result in an group t=
able setup that is incompatible with the local system.')
> +-                warning('\n' +
> +-                        'The local group with the GID 65534 does not =
match the configured group name "@0@" of the nobody group (its name is @1=
@).\n'.format(nobody_group, name) +
> +-                        'Your build will result in an group table set=
up that is incompatible with the local system.')
>  -        endif
>  -endif
>  -id_result =3D run_command('id', '-g', nobody_group)
>  -if id_result.returncode() =3D=3D 0
>  -        id =3D id_result.stdout().to_int()
>  -        if id !=3D 65534
> --                message('WARNING:\n' +
> --                        '        The local group with the configured =
group name "@0@" of the nobody group does not have UID 65534 (it has @1@)=
=2E\n'.format(nobody_group, id) +
> --                        '        Your build will result in an group t=
able setup that is incompatible with the local system.')
> +-                warning('\n' +
> +-                        'The local group with the configured group na=
me "@0@" of the nobody group does not have UID 65534 (it has @1@).\n'.for=
mat(nobody_group, id) +
> +-                        'Your build will result in an group table set=
up that is incompatible with the local system.')
>  -        endif
>  -endif
>   if nobody_user !=3D nobody_group and not (nobody_user =3D=3D 'nobody'=
 and nobody_group =3D=3D 'nogroup')
> -         message('WARNING:\n' +
> -                 '        The configured user name "@0@" and group nam=
e "@0@" of the nobody user/group are not equivalent.\n'.format(nobody_use=
r, nobody_group) +
> +         warning('\n' +
> +                 'The configured user name "@0@" and group name "@0@" =
of the nobody user/group are not equivalent.\n'.format(nobody_user, nobod=
y_group) +
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h=
-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/000=
6-src-basic-missing.h-check-for-missing-strndupa.patch
> similarity index 73%
> rename from meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-=
check-for-missing-strndupa.patch
> rename to meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-ch=
eck-for-missing-strndupa.patch
> index 9f62cbb..107a794 100644
> --- a/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-=
for-missing-strndupa.patch
> +++ b/meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-=
for-missing-strndupa.patch
> @@ -1,11 +1,11 @@
> -From 33be9052315cc4ec8e929fa238e1f0cc0161ad07 Mon Sep 17 00:00:00 2001=

> +From 03fd19fc87573276e0d359260c8fe591f5f0216a Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 21:15:28 -0800
> -Subject: [PATCH] src/basic/missing.h: check for missing strndupa
> +Date: Fri, 29 Jun 2018 16:34:50 +0800
> +Subject: [PATCH 06/19] src/basic/missing.h: check for missing strndupa=

> =20
>  include missing.h  for definition of strndupa
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> @@ -13,29 +13,29 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   meson.build             |  1 +
>   src/basic/missing.h     | 11 +++++++++++
>   src/basic/mkdir.c       |  1 +
> + src/basic/pager.c       |  1 +
>   src/basic/parse-util.c  |  1 +
>   src/basic/procfs-util.c |  1 +
> - src/shared/pager.c      |  1 +
>   src/shared/uid-range.c  |  1 +
>   7 files changed, 17 insertions(+)
> =20
>  diff --git a/meson.build b/meson.build
> -index 4eabaafe8..12811b3f3 100644
> +index 8c16bc979..a734a295c 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -525,6 +525,7 @@ foreach ident : [
> -         ['bpf',               '''#include <sys/syscall.h>
> +@@ -503,6 +503,7 @@ foreach ident : [
>                                    #include <unistd.h>'''],
>           ['explicit_bzero' ,   '''#include <string.h>'''],
> +         ['reallocarray',      '''#include <malloc.h>'''],
>  +        ['strndupa' ,         '''#include <string.h>'''],
>   ]
>  =20
>           have =3D cc.has_function(ident[0], prefix : ident[1], args : =
'-D_GNU_SOURCE')
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 84d6d9167..07a8c8364 100644
> +index 0e33abb9f..02397f1b6 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -1187,6 +1187,17 @@ struct input_mask {
> +@@ -1184,6 +1184,17 @@ struct input_mask {
>   typedef int32_t key_serial_t;
>   #endif
>  =20
> @@ -54,22 +54,34 @@ index 84d6d9167..07a8c8364 100644
>   #define KEYCTL_JOIN_SESSION_KEYRING 1
>   #endif
>  diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> -index de4746c86..d51518a5a 100644
> +index 6ab1b4422..77c3e0863 100644
>  --- a/src/basic/mkdir.c
>  +++ b/src/basic/mkdir.c
> -@@ -30,6 +30,7 @@
> - #include "path-util.h"
> +@@ -13,6 +13,7 @@
>   #include "stat-util.h"
> + #include "stdio-util.h"
>   #include "user-util.h"
>  +#include "missing.h"
>  =20
> - int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid=
_t gid, bool follow_symlink, mkdir_func_t _mkdir) {
> + int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid=
_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
>           struct stat st;
> +diff --git a/src/basic/pager.c b/src/basic/pager.c
> +index f24126111..8223bff02 100644
> +--- a/src/basic/pager.c
> ++++ b/src/basic/pager.c
> +@@ -21,6 +21,7 @@
> + #include "string-util.h"
> + #include "strv.h"
> + #include "terminal-util.h"
> ++#include "missing.h"
> +=20
> + static pid_t pager_pid =3D 0;
> +=20
>  diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> -index 2c22753de..97533721d 100644
> +index 6becf8587..52576f536 100644
>  --- a/src/basic/parse-util.c
>  +++ b/src/basic/parse-util.c
> -@@ -33,6 +33,7 @@
> +@@ -17,6 +17,7 @@
>   #include "parse-util.h"
>   #include "process-util.h"
>   #include "string-util.h"
> @@ -78,10 +90,10 @@ index 2c22753de..97533721d 100644
>   int parse_boolean(const char *v) {
>           assert(v);
>  diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> -index 9bb42cc7b..23bbd9e67 100644
> +index a159e344b..ebc427d6b 100644
>  --- a/src/basic/procfs-util.c
>  +++ b/src/basic/procfs-util.c
> -@@ -9,6 +9,7 @@
> +@@ -11,6 +11,7 @@
>   #include "procfs-util.h"
>   #include "stdio-util.h"
>   #include "string-util.h"
> @@ -89,23 +101,11 @@ index 9bb42cc7b..23bbd9e67 100644
>  =20
>   int procfs_tasks_get_limit(uint64_t *ret) {
>           _cleanup_free_ char *value =3D NULL;
> -diff --git a/src/shared/pager.c b/src/shared/pager.c
> -index 75db3c985..84f06bf7d 100644
> ---- a/src/shared/pager.c
> -+++ b/src/shared/pager.c
> -@@ -39,6 +39,7 @@
> - #include "string-util.h"
> - #include "strv.h"
> - #include "terminal-util.h"
> -+#include "missing.h"
> -=20
> - static pid_t pager_pid =3D 0;
> -=20
>  diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
> -index c38b7cc98..8ec6bf08d 100644
> +index 434ce6ff4..37093ab7b 100644
>  --- a/src/shared/uid-range.c
>  +++ b/src/shared/uid-range.c
> -@@ -25,6 +25,7 @@
> +@@ -8,6 +8,7 @@
>   #include "macro.h"
>   #include "uid-range.h"
>   #include "user-util.h"
> @@ -114,5 +114,5 @@ index c38b7cc98..8ec6bf08d 100644
>   static bool uid_range_intersect(UidRange *range, uid_t start, uid_t n=
r) {
>           assert(range);
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_=
ether.h.patch b/meta/recipes-core/systemd/systemd/0007-Include-netinet-if=
_ether.h.patch
> similarity index 68%
> rename from meta/recipes-core/systemd/systemd/0017-Include-netinet-if_e=
ther.h.patch
> rename to meta/recipes-core/systemd/systemd/0007-Include-netinet-if_eth=
er.h.patch
> index a09cfdd..2df8cf9 100644
> --- a/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h=
=2Epatch
> +++ b/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h=
=2Epatch
> @@ -1,14 +1,14 @@
> -From f2b0173cd9807864db1ef3b102abaa76ef37e506 Mon Sep 17 00:00:00 2001=

> +From aab90d0dfa934d33879eaec1a878e93b201d33f1 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 21:19:12 -0800
> -Subject: [PATCH 17/31] Include netinet/if_ether.h
> +Date: Fri, 29 Jun 2018 16:44:43 +0800
> +Subject: [PATCH 07/19] Include netinet/if_ether.h
> =20
>  Fixes
>  /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: =
error: redefinition of 'struct ethhdr'
>   struct ethhdr {
>          ^~~~~~
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> @@ -17,14 +17,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   src/network/netdev/tuntap.c               | 1 +
>   src/network/networkd-brvlan.c             | 1 +
>   src/udev/net/ethtool-util.c               | 1 +
> + src/udev/net/ethtool-util.h               | 1 +
>   src/udev/udev-builtin-net_setup_link.c    | 1 +
> - 5 files changed, 5 insertions(+)
> + 6 files changed, 6 insertions(+)
> =20
>  diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystem=
d/sd-netlink/netlink-types.c
> -index 0ee7d6f0d..ef75893a6 100644
> +index c93fe9cb4..2013d06e1 100644
>  --- a/src/libsystemd/sd-netlink/netlink-types.c
>  +++ b/src/libsystemd/sd-netlink/netlink-types.c
> -@@ -21,6 +21,7 @@
> +@@ -3,6 +3,7 @@
>   #include <netinet/in.h>
>   #include <stdint.h>
>   #include <sys/socket.h>
> @@ -33,10 +34,10 @@ index 0ee7d6f0d..ef75893a6 100644
>   #include <linux/rtnetlink.h>
>   #include <linux/genetlink.h>
>  diff --git a/src/network/netdev/tuntap.c b/src/network/netdev/tuntap.c=

> -index 4fc9b610a..628c61c57 100644
> +index 21fb7ab06..0afe5170c 100644
>  --- a/src/network/netdev/tuntap.c
>  +++ b/src/network/netdev/tuntap.c
> -@@ -20,6 +20,7 @@
> +@@ -2,6 +2,7 @@
>  =20
>   #include <errno.h>
>   #include <fcntl.h>
> @@ -45,10 +46,10 @@ index 4fc9b610a..628c61c57 100644
>   #include <net/if.h>
>   #include <netinet/if_ether.h>
>  diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvl=
an.c
> -index 99dd41629..90407c9d8 100644
> +index 8e8a618e2..52d523a67 100644
>  --- a/src/network/networkd-brvlan.c
>  +++ b/src/network/networkd-brvlan.c
> -@@ -19,6 +19,7 @@
> +@@ -4,6 +4,7 @@
>   ***/
>  =20
>   #include <netinet/in.h>
> @@ -57,29 +58,39 @@ index 99dd41629..90407c9d8 100644
>   #include <stdbool.h>
>  =20
>  diff --git a/src/udev/net/ethtool-util.c b/src/udev/net/ethtool-util.c=

> -index 9bdaef8d9..948f89cf8 100644
> +index 4bb4216ac..5f7383483 100644
>  --- a/src/udev/net/ethtool-util.c
>  +++ b/src/udev/net/ethtool-util.c
> -@@ -18,6 +18,7 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> +@@ -1,5 +1,6 @@
> + /* SPDX-License-Identifier: LGPL-2.1+ */
>  =20
>  +#include <netinet/if_ether.h>
>   #include <net/if.h>
>   #include <sys/ioctl.h>
>   #include <linux/ethtool.h>
> +diff --git a/src/udev/net/ethtool-util.h b/src/udev/net/ethtool-util.h=

> +index 064bf4d2b..ee0d4fb2a 100644
> +--- a/src/udev/net/ethtool-util.h
> ++++ b/src/udev/net/ethtool-util.h
> +@@ -3,6 +3,7 @@
> +=20
> +=20
> + #include <macro.h>
> ++#include <netinet/if_ether.h>
> + #include <linux/ethtool.h>
> +=20
> + #include "missing.h"
>  diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-bu=
iltin-net_setup_link.c
> -index 40158e0af..b24b3fce8 100644
> +index 8bed6399a..a3a96959b 100644
>  --- a/src/udev/udev-builtin-net_setup_link.c
>  +++ b/src/udev/udev-builtin-net_setup_link.c
> -@@ -18,6 +18,7 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> +@@ -1,5 +1,6 @@
> + /* SPDX-License-Identifier: LGPL-2.1+ */
>  =20
>  +#include <netinet/if_ether.h>
>   #include "alloc-util.h"
>   #include "link-config.h"
>   #include "log.h"
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove=
-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0007-Re=
vert-rules-remove-firmware-loading-rules.patch
> deleted file mode 100644
> index bb12d30..0000000
> --- a/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmwa=
re-loading-rules.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 35d6d384e83ac38077603611bb791969ef95fe68 Mon Sep 17 00:00:00 2001=

> -From: Jonathan Liu <net147@gmail.com>
> -Date: Thu, 19 Mar 2015 15:01:29 +1100
> -Subject: [PATCH 07/31] Revert "rules: remove firmware loading rules"
> -
> -This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
> -Userspace firmware loading support is needed for Linux < 3.7.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - rules/50-firmware.rules | 3 +++
> - 1 file changed, 3 insertions(+)
> - create mode 100644 rules/50-firmware.rules
> -
> -diff --git a/rules/50-firmware.rules b/rules/50-firmware.rules
> -new file mode 100644
> -index 000000000..f0ae68451
> ---- /dev/null
> -+++ b/rules/50-firmware.rules
> -@@ -0,0 +1,3 @@
> -+# do not edit this file, it will be overwritten on update
> -+
> -+SUBSYSTEM=3D=3D"firmware", ACTION=3D=3D"add", RUN{builtin}=3D"firmwar=
e"
> ---=20
> -2.13.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0012-rules-watch-metadat=
a-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0007-r=
ules-watch-metadata-changes-in-ide-devices.patch
> similarity index 92%
> rename from meta/recipes-core/systemd/systemd/0012-rules-watch-metadata=
-changes-in-ide-devices.patch
> rename to meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-c=
hanges-in-ide-devices.patch
> index 7207863..a5f65e6 100644
> --- a/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-chang=
es-in-ide-devices.patch
> +++ b/meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-chang=
es-in-ide-devices.patch
> @@ -1,7 +1,7 @@
> -From 406a4c8692316e8c7e14c78f9a802689be304a95 Mon Sep 17 00:00:00 2001=

> +From 9302b72e5e69512aaa7106197b00c55baeb35b3c Mon Sep 17 00:00:00 2001=

>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Fri, 17 Nov 2017 09:46:00 +0800
> -Subject: [PATCH 12/31] rules: watch metadata changes in ide devices
> +Subject: [PATCH 7/9] rules: watch metadata changes in ide devices
> =20
>  Formatting IDE storage does not trigger "change" uevents. As a result
>  clients using udev API don't get any updates afterwards and get outdat=
ed
> @@ -39,5 +39,5 @@ index 343fc06f8..b5237dac4 100644
>  -ACTION!=3D"remove", SUBSYSTEM=3D=3D"block", KERNEL=3D=3D"loop*|nvme*|=
sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+=3D"watch"
>  +ACTION!=3D"remove", SUBSYSTEM=3D=3D"block", KERNEL=3D=3D"loop*|nvme*|=
sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+=3D"watch"
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-t=
ests-if-nss-systemd-is-not-enable.patch b/meta/recipes-core/systemd/syste=
md/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
> similarity index 60%
> rename from meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-te=
sts-if-nss-systemd-is-not-enable.patch
> rename to meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-test=
s-if-nss-systemd-is-not-enable.patch
> index 16b21a0..abecdc7 100644
> --- a/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if=
-nss-systemd-is-not-enable.patch
> +++ b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if=
-nss-systemd-is-not-enable.patch
> @@ -1,7 +1,7 @@
> -From f5f313915d78bc43eb96e2aafb8ce3cda304c277 Mon Sep 17 00:00:00 2001=

> +From b6ba596fd1313a162cdc2eb88161dcf24d19ede7 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Mon, 26 Feb 2018 17:27:56 +0800
> -Subject: [PATCH 19/31] Do not enable nss tests if nss-systemd is not e=
nabled
> +Date: Thu, 28 Jun 2018 10:10:02 +0800
> +Subject: [PATCH 8/9] Do not enable nss tests if nss-systemd is not ena=
bled
> =20
>  Upstream-Status: Pending
> =20
> @@ -12,18 +12,18 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/src/test/meson.build b/src/test/meson.build
> -index 1db8aa107..df3a1f5c5 100644
> +index 7da7e3a22..7b7c257ff 100644
>  --- a/src/test/meson.build
>  +++ b/src/test/meson.build
> -@@ -646,7 +646,7 @@ tests +=3D [
> +@@ -645,7 +645,7 @@ tests +=3D [
>           [['src/test/test-nss.c'],
>            [],
>            [libdl],
>  -         '', 'manual'],
>  +         'ENABLE_NSS_SYSTEMD', 'manual'],
> - ]
>  =20
> - ############################################################
> +         [['src/test/test-umount.c',
> +           'src/core/mount-setup.c',
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-=
userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/syste=
md/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
> deleted file mode 100644
> index 15d7e02..0000000
> --- a/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspa=
ce-firmware-loading-suppor.patch
> +++ /dev/null
> @@ -1,377 +0,0 @@
> -From 5cce7626f33e92f624ac06b613125813fb47d445 Mon Sep 17 00:00:00 2001=

> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 21:05:39 -0800
> -Subject: [PATCH 08/31] Revert "udev: remove userspace firmware loading=

> - support"
> -
> -This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
> -Userspace firmware loading support is needed for Linux < 3.7.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - README                           |   4 +-
> - TODO                             |   1 +
> - meson.build                      |   9 +++
> - meson_options.txt                |   2 +
> - rules/meson.build                |   4 +
> - src/udev/meson.build             |   4 +
> - src/udev/udev-builtin-firmware.c | 154 ++++++++++++++++++++++++++++++=
+++++++++
> - src/udev/udev-builtin.c          |   3 +
> - src/udev/udev.h                  |   6 ++
> - src/udev/udevd.c                 |  12 +++
> - 10 files changed, 197 insertions(+), 2 deletions(-)
> - create mode 100644 src/udev/udev-builtin-firmware.c
> -
> -diff --git a/README b/README
> -index 8807e5cfe..bfd7a35de 100644
> ---- a/README
> -+++ b/README
> -@@ -58,8 +58,8 @@ REQUIREMENTS:
> -         Legacy hotplug slows down the system and confuses udev:
> -           CONFIG_UEVENT_HELPER_PATH=3D""
> -=20
> --        Userspace firmware loading is not supported and should
> --        be disabled in the kernel:
> -+        Userspace firmware loading is deprecated, will go away, and
> -+        sometimes causes problems:
> -           CONFIG_FW_LOADER_USER_HELPER=3Dn
> -=20
> -         Some udev rules and virtualization detection relies on it:
> -diff --git a/TODO b/TODO
> -index a77028c7b..39e72d7ec 100644
> ---- a/TODO
> -+++ b/TODO
> -@@ -783,6 +783,7 @@ Features:
> - * initialize the hostname from the fs label of /, if /etc/hostname do=
es not exist?
> -=20
> - * udev:
> -+  - remove src/udev/udev-builtin-firmware.c (CONFIG_FW_LOADER_USER_HE=
LPER=3Dn)
> -   - move to LGPL
> -   - kill scsi_id
> -   - add trigger --subsystem-match=3Dusb/usb_device device
> -diff --git a/meson.build b/meson.build
> -index 918101d6b..9c25022a4 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -72,6 +72,12 @@ conf.set10('HAVE_SYSV_COMPAT', have,
> -            description : 'SysV init scripts and rcN.d links are suppo=
rted')
> - m4_defines +=3D have ? ['-DHAVE_SYSV_COMPAT'] : []
> -=20
> -+firmware_path =3D get_option('firmware-path')
> -+have =3D firmware_path !=3D ''
> -+conf.set10('HAVE_FIRMWARE', have,
> -+           description : 'Userspace firmware loading is supported')
> -+m4_defines +=3D have ? ['-DHAVE_FIRMWARE'] : []
> -+
> - # join_paths ignore the preceding arguments if an absolute component =
is
> - # encountered, so this should canonicalize various paths when they ar=
e
> - # absolute or relative.
> -@@ -178,6 +184,7 @@ conf.set_quoted('SYSTEM_CONFIG_UNIT_PATH',        =
            join_paths(pkgsysc
> - conf.set_quoted('SYSTEM_DATA_UNIT_PATH',                      systemu=
nitdir)
> - conf.set_quoted('SYSTEM_SYSVINIT_PATH',                       sysvini=
t_path)
> - conf.set_quoted('SYSTEM_SYSVRCND_PATH',                       sysvrcn=
d_path)
> -+conf.set_quoted('FIRMWARE_PATH',                              firmwar=
e_path)
> - conf.set_quoted('RC_LOCAL_SCRIPT_PATH_START',                 get_opt=
ion('rc-local'))
> - conf.set_quoted('RC_LOCAL_SCRIPT_PATH_STOP',                  get_opt=
ion('halt-local'))
> - conf.set_quoted('USER_CONFIG_UNIT_PATH',                      join_pa=
ths(pkgsysconfdir, 'user'))
> -@@ -258,6 +265,7 @@ substs.set('SYSTEMCTL',                           =
            join_paths(rootbin
> - substs.set('RANDOM_SEED',                                     join_pa=
ths(randomseeddir, 'random-seed'))
> - substs.set('SYSTEM_SYSVINIT_PATH',                            sysvini=
t_path)
> - substs.set('SYSTEM_SYSVRCND_PATH',                            sysvrcn=
d_path)
> -+substs.set('FIRMWARE_PATH',                                   firmwar=
e_path)
> - substs.set('RC_LOCAL_SCRIPT_PATH_START',                      get_opt=
ion('rc-local'))
> - substs.set('RC_LOCAL_SCRIPT_PATH_STOP',                       get_opt=
ion('halt-local'))
> -=20
> -@@ -2715,6 +2723,7 @@ status =3D [
> -         'roothome directory:                @0@'.format(roothomedir),=

> -         'SysV init scripts:                 @0@'.format(sysvinit_path=
),
> -         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path=
),
> -+        'firmware path:                     @0@'.format(firmware_path=
),
> -         'PAM modules directory:             @0@'.format(pamlibdir),
> -         'PAM configuration directory:       @0@'.format(pamconfdir),
> -         'RPM macros directory:              @0@'.format(rpmmacrosdir)=
,
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 0b24f0e0f..92d25fa35 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -108,6 +108,8 @@ option('tmpfiles', type : 'boolean',
> -        description : 'support for tmpfiles.d')
> - option('importd', type : 'combo', choices : ['auto', 'true', 'false']=
,
> -        description : 'install the systemd-importd daemon')
> -+option('firmware-path', type : 'string', value : '',
> -+       description : 'Firmware search path')
> - option('hwdb', type : 'boolean',
> -        description : 'support for the hardware database')
> - option('rfkill', type : 'boolean',
> -diff --git a/rules/meson.build b/rules/meson.build
> -index e253b9f59..5eee5fbca 100644
> ---- a/rules/meson.build
> -+++ b/rules/meson.build
> -@@ -41,6 +41,10 @@ rules =3D files('''
> - install_data(rules,
> -              install_dir : udevrulesdir)
> -=20
> -+if conf.get('HAVE_FIRMWARE') =3D=3D 1
> -+        install_data('50-firmware.rules', install_dir : udevrulesdir)=

> -+endif
> -+
> - all_rules =3D rules
> -=20
> - rules_in =3D '''
> -diff --git a/src/udev/meson.build b/src/udev/meson.build
> -index de2fd2d9c..b6b0ca006 100644
> ---- a/src/udev/meson.build
> -+++ b/src/udev/meson.build
> -@@ -67,6 +67,10 @@ if conf.get('HAVE_ACL') =3D=3D 1
> -                                  sd_login_c]
> - endif
> -=20
> -+if conf.get('HAVE_FIRMWARE') =3D=3D 1
> -+        libudev_core_sources +=3D ['udev-builtin-firmware.c']
> -+endif
> -+
> - ############################################################
> -=20
> - generate_keyboard_keys_list =3D find_program('generate-keyboard-keys-=
list.sh')
> -diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-=
firmware.c
> -new file mode 100644
> -index 000000000..bd8c2fb96
> ---- /dev/null
> -+++ b/src/udev/udev-builtin-firmware.c
> -@@ -0,0 +1,154 @@
> -+/*
> -+ * firmware - Kernel firmware loader
> -+ *
> -+ * Copyright (C) 2009 Piter Punk <piterpunk@slackware.com>
> -+ * Copyright (C) 2009-2011 Kay Sievers <kay@vrfy.org>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of the=

> -+ * License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful, bu=
t
> -+ * WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ * General Public License for more details:*
> -+ */
> -+
> -+#include <unistd.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <stdio.h>
> -+#include <getopt.h>
> -+#include <errno.h>
> -+#include <stdbool.h>
> -+#include <sys/utsname.h>
> -+#include <sys/stat.h>
> -+
> -+#include "udev.h"
> -+
> -+static bool set_loading(struct udev *udev, char *loadpath, const char=
 *state) {
> -+        FILE *ldfile;
> -+
> -+        ldfile =3D fopen(loadpath, "we");
> -+        if (ldfile =3D=3D NULL) {
> -+                log_error("error: can not open '%s'", loadpath);
> -+                return false;
> -+        };
> -+        fprintf(ldfile, "%s\n", state);
> -+        fclose(ldfile);
> -+        return true;
> -+}
> -+
> -+static bool copy_firmware(struct udev *udev, const char *source, cons=
t char *target, size_t size) {
> -+        char *buf;
> -+        FILE *fsource =3D NULL, *ftarget =3D NULL;
> -+        bool ret =3D false;
> -+
> -+        buf =3D malloc(size);
> -+        if (buf =3D=3D NULL) {
> -+                log_error("No memory available to load firmware file"=
);
> -+                return false;
> -+        }
> -+
> -+        log_debug("writing '%s' (%zi) to '%s'", source, size, target)=
;
> -+
> -+        fsource =3D fopen(source, "re");
> -+        if (fsource =3D=3D NULL)
> -+                goto exit;
> -+        ftarget =3D fopen(target, "we");
> -+        if (ftarget =3D=3D NULL)
> -+                goto exit;
> -+        if (fread(buf, size, 1, fsource) !=3D 1)
> -+                goto exit;
> -+        if (fwrite(buf, size, 1, ftarget) =3D=3D 1)
> -+                ret =3D true;
> -+exit:
> -+        if (ftarget !=3D NULL)
> -+                fclose(ftarget);
> -+        if (fsource !=3D NULL)
> -+                fclose(fsource);
> -+        free(buf);
> -+        return ret;
> -+}
> -+
> -+static int builtin_firmware(struct udev_device *dev, int argc, char *=
argv[], bool test) {
> -+        struct udev *udev =3D udev_device_get_udev(dev);
> -+        static const char *searchpath[] =3D { FIRMWARE_PATH };
> -+        char loadpath[UTIL_PATH_SIZE];
> -+        char datapath[UTIL_PATH_SIZE];
> -+        char fwpath[UTIL_PATH_SIZE];
> -+        const char *firmware;
> -+        FILE *fwfile =3D NULL;
> -+        struct utsname kernel;
> -+        struct stat statbuf;
> -+        unsigned int i;
> -+        int rc =3D EXIT_SUCCESS;
> -+
> -+        firmware =3D udev_device_get_property_value(dev, "FIRMWARE");=

> -+        if (firmware =3D=3D NULL) {
> -+                log_error("firmware parameter missing");
> -+                rc =3D EXIT_FAILURE;
> -+                goto exit;
> -+        }
> -+
> -+        /* lookup firmware file */
> -+        uname(&kernel);
> -+        for (i =3D 0; i < ELEMENTSOF(searchpath); i++) {
> -+                strscpyl(fwpath, sizeof(fwpath), searchpath[i], kerne=
l.release, "/", firmware, NULL);
> -+                fwfile =3D fopen(fwpath, "re");
> -+                if (fwfile !=3D NULL)
> -+                        break;
> -+
> -+                strscpyl(fwpath, sizeof(fwpath), searchpath[i], firmw=
are, NULL);
> -+                fwfile =3D fopen(fwpath, "re");
> -+                if (fwfile !=3D NULL)
> -+                        break;
> -+        }
> -+
> -+        strscpyl(loadpath, sizeof(loadpath), udev_device_get_syspath(=
dev), "/loading", NULL);
> -+
> -+        if (fwfile =3D=3D NULL) {
> -+                log_debug("did not find firmware file '%s'", firmware=
);
> -+                rc =3D EXIT_FAILURE;
> -+                /*
> -+                 * Do not cancel the request in the initrd, the real =
root might have
> -+                 * the firmware file and the 'coldplug' run in the re=
al root will find
> -+                 * this pending request and fulfill or cancel it.
> -+                 * */
> -+                if (!in_initrd())
> -+                        set_loading(udev, loadpath, "-1");
> -+                goto exit;
> -+        }
> -+
> -+        if (stat(fwpath, &statbuf) < 0 || statbuf.st_size =3D=3D 0) {=

> -+                if (!in_initrd())
> -+                        set_loading(udev, loadpath, "-1");
> -+                rc =3D EXIT_FAILURE;
> -+                goto exit;
> -+        }
> -+
> -+        if (!set_loading(udev, loadpath, "1"))
> -+                goto exit;
> -+
> -+        strscpyl(datapath, sizeof(datapath), udev_device_get_syspath(=
dev), "/data", NULL);
> -+        if (!copy_firmware(udev, fwpath, datapath, statbuf.st_size)) =
{
> -+                log_error("error sending firmware '%s' to device", fi=
rmware);
> -+                set_loading(udev, loadpath, "-1");
> -+                rc =3D EXIT_FAILURE;
> -+                goto exit;
> -+        };
> -+
> -+        set_loading(udev, loadpath, "0");
> -+exit:
> -+        if (fwfile)
> -+                fclose(fwfile);
> -+        return rc;
> -+}
> -+
> -+const struct udev_builtin udev_builtin_firmware =3D {
> -+        .name =3D "firmware",
> -+        .cmd =3D builtin_firmware,
> -+        .help =3D "kernel firmware loader",
> -+        .run_once =3D true,
> -+};
> -diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
> -index db2b6874f..ccd88638c 100644
> ---- a/src/udev/udev-builtin.c
> -+++ b/src/udev/udev-builtin.c
> -@@ -32,6 +32,9 @@ static const struct udev_builtin *builtins[] =3D {
> -         [UDEV_BUILTIN_BLKID] =3D &udev_builtin_blkid,
> - #endif
> -         [UDEV_BUILTIN_BTRFS] =3D &udev_builtin_btrfs,
> -+#if HAVE_FIRMWARE
> -+        [UDEV_BUILTIN_FIRMWARE] =3D &udev_builtin_firmware,
> -+#endif
> -         [UDEV_BUILTIN_HWDB] =3D &udev_builtin_hwdb,
> -         [UDEV_BUILTIN_INPUT_ID] =3D &udev_builtin_input_id,
> -         [UDEV_BUILTIN_KEYBOARD] =3D &udev_builtin_keyboard,
> -diff --git a/src/udev/udev.h b/src/udev/udev.h
> -index ea11c2d29..c47dd3d88 100644
> ---- a/src/udev/udev.h
> -+++ b/src/udev/udev.h
> -@@ -151,6 +151,9 @@ enum udev_builtin_cmd {
> -         UDEV_BUILTIN_BLKID,
> - #endif
> -         UDEV_BUILTIN_BTRFS,
> -+#if HAVE_FIRMWARE
> -+        UDEV_BUILTIN_FIRMWARE,
> -+#endif
> -         UDEV_BUILTIN_HWDB,
> -         UDEV_BUILTIN_INPUT_ID,
> -         UDEV_BUILTIN_KEYBOARD,
> -@@ -179,6 +182,9 @@ struct udev_builtin {
> - extern const struct udev_builtin udev_builtin_blkid;
> - #endif
> - extern const struct udev_builtin udev_builtin_btrfs;
> -+#if HAVE_FIRMWARE
> -+extern const struct udev_builtin udev_builtin_firmware;
> -+#endif
> - extern const struct udev_builtin udev_builtin_hwdb;
> - extern const struct udev_builtin udev_builtin_input_id;
> - extern const struct udev_builtin udev_builtin_keyboard;
> -diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> -index 5c757d513..2f3313007 100644
> ---- a/src/udev/udevd.c
> -+++ b/src/udev/udevd.c
> -@@ -127,6 +127,9 @@ struct event {
> -         bool is_block;
> -         sd_event_source *timeout_warning;
> -         sd_event_source *timeout;
> -+#if HAVE_FIRMWARE
> -+        bool nodelay;
> -+#endif
> - };
> -=20
> - static void event_queue_cleanup(Manager *manager, enum event_state ty=
pe);
> -@@ -609,6 +612,10 @@ static int event_queue_insert(Manager *manager, s=
truct udev_device *dev) {
> -         event->devnum =3D udev_device_get_devnum(dev);
> -         event->is_block =3D streq("block", udev_device_get_subsystem(=
dev));
> -         event->ifindex =3D udev_device_get_ifindex(dev);
> -+#if HAVE_FIRMWARE
> -+        if (streq(udev_device_get_subsystem(dev), "firmware"))
> -+                event->nodelay =3D true;
> -+#endif
> -=20
> -         log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnu=
m(dev),
> -              udev_device_get_action(dev), udev_device_get_subsystem(d=
ev));
> -@@ -692,6 +699,11 @@ static bool is_devpath_busy(Manager *manager, str=
uct event *event) {
> -                         return true;
> -                 }
> -=20
> -+#if HAVE_FIRMWARE
> -+                /* allow to bypass the dependency tracking */
> -+                if (event->nodelay)
> -+                        continue;
> -+#endif
> -                 /* parent device event found */
> -                 if (event->devpath[common] =3D=3D '/') {
> -                         event->delaying_seqnum =3D loop_event->seqnum=
;
> ---=20
> -2.13.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_=
BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/syste=
md/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> similarity index 67%
> rename from meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_B=
RACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> rename to meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRA=
CE-and-GLOB_ALTDIRFUNC-is-not-.patch
> index 4509476..bee5fb6 100644
> --- a/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-a=
nd-GLOB_ALTDIRFUNC-is-not-.patch
> +++ b/meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-a=
nd-GLOB_ALTDIRFUNC-is-not-.patch
> @@ -1,7 +1,7 @@
> -From b45cf4923c7e1f1165925e9b4d7db2108faf2eae Mon Sep 17 00:00:00 2001=

> -From: Emil Renner Berthing <systemd@esmil.dk>
> -Date: Mon, 23 Oct 2017 10:50:14 -0700
> -Subject: [PATCH 15/31] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is=
 not
> +From 848e711d719a6d987bc7d14183e1c7b1f1c91c56 Mon Sep 17 00:00:00 2001=

> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Fri, 29 Jun 2018 17:10:29 +0800
> +Subject: [PATCH 08/19] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is=
 not
>   defined
> =20
>  If the standard library doesn't provide brace
> @@ -11,20 +11,21 @@ Dont use GNU GLOB extentions on non-glibc systems
> =20
>  Conditionalize use of GLOB_ALTDIRFUNC
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
> - src/basic/glob-util.c     | 20 +++++++++++++++++---
> - src/test/test-glob-util.c | 17 +++++++++++++++--
> - src/tmpfiles/tmpfiles.c   |  8 ++++++++
> - 3 files changed, 40 insertions(+), 5 deletions(-)
> + src/basic/glob-util.c     | 13 +++++++++++--
> + src/test/test-glob-util.c | 15 +++++++++++++++
> + src/tmpfiles/tmpfiles.c   | 10 ++++++++++
> + 3 files changed, 36 insertions(+), 2 deletions(-)
> =20
>  diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
> -index 6e80a1e23..312bb3fd1 100644
> +index 9fac676f2..8adb9559e 100644
>  --- a/src/basic/glob-util.c
>  +++ b/src/basic/glob-util.c
> -@@ -28,13 +28,18 @@
> +@@ -10,6 +10,11 @@
>   #include "macro.h"
>   #include "path-util.h"
>   #include "strv.h"
> @@ -34,17 +35,17 @@ index 6e80a1e23..312bb3fd1 100644
>  +#define GLOB_BRACE 0
>  +#endif
>  =20
> + static void closedir_wrapper(void* v) {
> +         (void) closedir(v);
> +@@ -18,6 +23,7 @@ static void closedir_wrapper(void* v) {
>   int safe_glob(const char *path, int flags, glob_t *pglob) {
>           int k;
>  =20
>  +#ifdef GLOB_ALTDIRFUNC
>           /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it t=
o be set. */
>           assert(!(flags & GLOB_ALTDIRFUNC));
> --
> -         if (!pglob->gl_closedir)
> -                 pglob->gl_closedir =3D (void (*)(void *)) closedir;
> -         if (!pglob->gl_readdir)
> -@@ -45,10 +50,13 @@ int safe_glob(const char *path, int flags, glob_t =
*pglob) {
> +=20
> +@@ -31,10 +37,13 @@ int safe_glob(const char *path, int flags, glob_t =
*pglob) {
>                   pglob->gl_lstat =3D lstat;
>           if (!pglob->gl_stat)
>                   pglob->gl_stat =3D stat;
> @@ -60,24 +61,11 @@ index 6e80a1e23..312bb3fd1 100644
>           if (k =3D=3D GLOB_NOMATCH)
>                   return -ENOENT;
>           if (k =3D=3D GLOB_NOSPACE)
> -@@ -61,6 +69,12 @@ int safe_glob(const char *path, int flags, glob_t *=
pglob) {
> -         return 0;
> - }
> -=20
> -+/* Don't fail if the standard library
> -+ * doesn't provide brace expansion */
> -+#ifndef GLOB_BRACE
> -+#define GLOB_BRACE 0
> -+#endif
> -+
> - int glob_exists(const char *path) {
> -         _cleanup_globfree_ glob_t g =3D {};
> -         int k;
>  diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
> -index bd2f8fcfd..a10c77427 100644
> +index d78d6223c..f5943b26d 100644
>  --- a/src/test/test-glob-util.c
>  +++ b/src/test/test-glob-util.c
> -@@ -30,6 +30,11 @@
> +@@ -12,6 +12,11 @@
>   #include "glob-util.h"
>   #include "macro.h"
>   #include "rm-rf.h"
> @@ -89,23 +77,21 @@ index bd2f8fcfd..a10c77427 100644
>  =20
>   static void test_glob_exists(void) {
>           char name[] =3D "/tmp/test-glob_exists.XXXXXX";
> -@@ -52,25 +57,33 @@ static void test_glob_exists(void) {
> - static void test_glob_no_dot(void) {
> -         char template[] =3D "/tmp/test-glob-util.XXXXXXX";
> +@@ -40,11 +45,13 @@ static void test_glob_no_dot(void) {
>           const char *fn;
> --
> +=20
>           _cleanup_globfree_ glob_t g =3D {
>  +#ifdef GLOB_ALTDIRFUNC
> -                 .gl_closedir =3D (void (*)(void *)) closedir,
> +                 .gl_closedir =3D closedir_wrapper,
>                   .gl_readdir =3D (struct dirent *(*)(void *)) readdir_=
no_dot,
>                   .gl_opendir =3D (void *(*)(const char *)) opendir,
>                   .gl_lstat =3D lstat,
>                   .gl_stat =3D stat,
>  +#endif
>           };
> --
> -         int r;
>  =20
> +         int r;
> +@@ -52,11 +59,19 @@ static void test_glob_no_dot(void) {
>           assert_se(mkdtemp(template));
>  =20
>           fn =3D strjoina(template, "/*");
> @@ -126,25 +112,35 @@ index bd2f8fcfd..a10c77427 100644
>  =20
>           (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
>  diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
> -index 38cbb739c..88cc543f0 100644
> +index 927de35f3..5f0283da5 100644
>  --- a/src/tmpfiles/tmpfiles.c
>  +++ b/src/tmpfiles/tmpfiles.c
> -@@ -76,6 +76,12 @@
> - #include "umask-util.h"
> +@@ -60,6 +60,12 @@
>   #include "user-util.h"
>   #include "util.h"
> +=20
>  +/* Don't fail if the standard library
>  + * doesn't provide brace expansion */
>  +#ifndef GLOB_BRACE
>  +#define GLOB_BRACE 0
>  +#endif
>  +
> -=20
>   /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates=

>    * them in the file system. This is intended to be used to create
> -@@ -1288,7 +1294,9 @@ static int item_do_children(Item *i, const char =
*path, action_t action) {
> +  * properly owned directories beneath /tmp, /var/tmp, /run, which are=

> +@@ -1345,7 +1351,9 @@ finish:
> +=20
> + static int glob_item(Item *i, action_t action) {
> +         _cleanup_globfree_ glob_t g =3D {
> ++#ifdef GLOB_ALTDIRFUNC
> +                 .gl_opendir =3D (void *(*)(const char *)) opendir_nom=
od,
> ++#endif
> +         };
> +         int r =3D 0, k;
> +         char **fn;
> +@@ -1365,7 +1373,9 @@ static int glob_item(Item *i, action_t action) {=

>  =20
> - static int glob_item(Item *i, action_t action, bool recursive) {
> + static int glob_item_recursively(Item *i, fdaction_t action) {
>           _cleanup_globfree_ glob_t g =3D {
>  +#ifdef GLOB_ALTDIRFUNC
>                   .gl_opendir =3D (void *(*)(const char *)) opendir_nom=
od,
> @@ -153,5 +149,5 @@ index 38cbb739c..88cc543f0 100644
>           int r =3D 0, k;
>           char **fn;
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-ma=
cros-for-musl.patch b/meta/recipes-core/systemd/systemd/0009-add-missing-=
FTW_-macros-for-musl.patch
> similarity index 79%
> rename from meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-mac=
ros-for-musl.patch
> rename to meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macro=
s-for-musl.patch
> index 9ec3137..95287cce 100644
> --- a/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-fo=
r-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-fo=
r-musl.patch
> @@ -1,13 +1,13 @@
> -From 03cdd33be62db4c72a7fcf21b61d0d056c23c6a9 Mon Sep 17 00:00:00 2001=

> +From acc2c08082795802011e3c5f8626d63210021489 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Wed, 28 Feb 2018 21:36:32 -0800
> -Subject: [PATCH 28/31] add missing FTW_ macros for musl
> +Subject: [PATCH 09/19] add missing FTW_ macros for musl
> =20
>  This is to avoid build failures like below for musl.
> =20
>    locale-util.c:296:24: error: 'FTW_STOP' undeclared
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
> @@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 20 insertions(+)
> =20
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 1aee3346a..5b9fde692 100644
> +index 02397f1b6..6dc750eba 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -207,6 +207,26 @@ struct sockaddr_vm {
> +@@ -189,6 +189,26 @@ struct sockaddr_vm {
>   #define BTRFS_QGROUP_LEVEL_SHIFT 48
>   #endif
>  =20
> @@ -46,5 +46,5 @@ index 1aee3346a..5b9fde692 100644
>   #define BTRFS_IOC_QGROUP_ASSIGN _IOW(BTRFS_IOCTL_MAGIC, 41, \
>                                  struct btrfs_ioctl_qgroup_assign_args)=

>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Buil=
d-conditionally-when-ENABLE_MYHOS.patch b/meta/recipes-core/systemd/syste=
md/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
> similarity index 84%
> rename from meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build=
-conditionally-when-ENABLE_MYHOS.patch
> rename to meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-c=
onditionally-when-ENABLE_MYHOS.patch
> index 517249f..a635fa9 100644
> --- a/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-condi=
tionally-when-ENABLE_MYHOS.patch
> +++ b/meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-condi=
tionally-when-ENABLE_MYHOS.patch
> @@ -1,7 +1,7 @@
> -From 5845c82d1016a3e3f2696180d5ac91b46950540a Mon Sep 17 00:00:00 2001=

> +From f9625b5f3fd5dac3f3591dbeeb24dc9d6fda790d Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Tue, 27 Feb 2018 12:56:21 +0800
> -Subject: [PATCH 29/31] nss-mymachines: Build conditionally when
> +Subject: [PATCH 9/9] nss-mymachines: Build conditionally when
>   ENABLE_MYHOSTNAME is set
> =20
>  Fixes build failures when building with --disable-myhostname
> @@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 7 insertions(+), 4 deletions(-)
> =20
>  diff --git a/meson.build b/meson.build
> -index 1b947adac..1ed4dde72 100644
> +index 3bb087fef..73bd70b0b 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -1351,12 +1351,15 @@ test_dlopen =3D executable(
> +@@ -1371,12 +1371,15 @@ test_dlopen =3D executable(
>           link_with : [libbasic],
>           dependencies : [libdl])
>  =20
> @@ -39,5 +39,5 @@ index 1b947adac..1ed4dde72 100644
>                   module =3D tuple[0]
>  =20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0009-remove-duplicate-in=
clude-uchar.h.patch b/meta/recipes-core/systemd/systemd/0009-remove-dupli=
cate-include-uchar.h.patch
> deleted file mode 100644
> index 1b14369..0000000
> --- a/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-u=
char.h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From ffdf9cb6ba0d932b81933d824f23a878c313a8d4 Mon Sep 17 00:00:00 2001=

> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 22 Feb 2016 05:59:01 +0000
> -Subject: [PATCH 09/31] remove duplicate include uchar.h
> -
> -missing.h already includes it
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> ----
> - src/basic/escape.h | 1 -
> - src/basic/utf8.h   | 1 -
> - 2 files changed, 2 deletions(-)
> -
> -diff --git a/src/basic/escape.h b/src/basic/escape.h
> -index de89f43a8..9921ccbbd 100644
> ---- a/src/basic/escape.h
> -+++ b/src/basic/escape.h
> -@@ -24,7 +24,6 @@
> - #include <stddef.h>
> - #include <stdint.h>
> - #include <sys/types.h>
> --#include <uchar.h>
> -=20
> - #include "string-util.h"
> - #include "missing.h"
> -diff --git a/src/basic/utf8.h b/src/basic/utf8.h
> -index b0a7485ae..fa06d2906 100644
> ---- a/src/basic/utf8.h
> -+++ b/src/basic/utf8.h
> -@@ -23,7 +23,6 @@
> - #include <stdbool.h>
> - #include <stddef.h>
> - #include <stdint.h>
> --#include <uchar.h>
> -=20
> - #include "macro.h"
> - #include "missing.h"
> ---=20
> -2.13.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-i=
n-meson.build.patch b/meta/recipes-core/systemd/systemd/0010-check-for-uc=
har.h-in-meson.build.patch
> deleted file mode 100644
> index 9a44b54..0000000
> --- a/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson=
=2Ebuild.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From ea4caaa1c6a6dc682bb04548ab05c5c73d0b45d6 Mon Sep 17 00:00:00 2001=

> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Mon, 26 Feb 2018 15:34:52 +0800
> -Subject: [PATCH 10/31] check for uchar.h in meson.build
> -
> -Use #if HAVE_UCHAR_H to include uchar.h conditionally.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - meson.build         | 1 +
> - src/basic/missing.h | 2 ++
> - 2 files changed, 3 insertions(+)
> -
> -diff --git a/meson.build b/meson.build
> -index 9c25022a4..94a16712b 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -623,6 +623,7 @@ foreach header : ['crypt.h',
> -                   'sys/auxv.h',
> -                   'valgrind/memcheck.h',
> -                   'valgrind/valgrind.h',
> -+                  'uchar.h',
> -                  ]
> -=20
> -         conf.set10('HAVE_' + header.underscorify().to_upper(),
> -diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 39c1fb700..84d6d9167 100644
> ---- a/src/basic/missing.h
> -+++ b/src/basic/missing.h
> -@@ -38,7 +38,9 @@
> - #include <sys/resource.h>
> - #include <sys/socket.h>
> - #include <sys/syscall.h>
> -+#if HAVE_UCHAR_H
> - #include <uchar.h>
> -+#endif
> - #include <unistd.h>
> -=20
> - #if HAVE_AUDIT
> ---=20
> -2.13.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-f=
ail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd=
/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> similarity index 68%
> rename from meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fa=
il-if-libc-doesn-t-support-IDN.patch
> rename to meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail=
-if-libc-doesn-t-support-IDN.patch
> index b0923d1..1654798 100644
> --- a/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-=
libc-doesn-t-support-IDN.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-=
libc-doesn-t-support-IDN.patch
> @@ -1,23 +1,22 @@
> -From 60dd411e9756fc2b14c0e061ad803782b4aee874 Mon Sep 17 00:00:00 2001=

> +From a0bd587300744dbb8e9cfbb043233670ce781c98 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Mon, 26 Feb 2018 15:46:05 +0800
> -Subject: [PATCH 11/31] socket-util: don't fail if libc doesn't support=
 IDN
> +Date: Mon, 2 Jul 2018 13:22:41 +0800
> +Subject: [PATCH 10/19] socket-util: don't fail if libc doesn't support=
 IDN
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   src/basic/socket-util.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> =20
>  diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
> -index 2c70cade1..67aedadd4 100644
> +index a913102e1..0d0154805 100644
>  --- a/src/basic/socket-util.c
>  +++ b/src/basic/socket-util.c
> -@@ -50,6 +50,16 @@
> +@@ -32,6 +32,16 @@
>   #include "utf8.h"
>   #include "util.h"
>  =20
> @@ -32,8 +31,8 @@ index 2c70cade1..67aedadd4 100644
>  +#endif
>  +
>   #if ENABLE_IDN
> - #  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_RULES)
> + #  define IDN_FLAGS NI_IDN
>   #else
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h=
-check-for-missing-__compar_fn_t-.patch b/meta/recipes-core/systemd/syste=
md/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
> similarity index 63%
> rename from meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-=
check-for-missing-__compar_fn_t-.patch
> rename to meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-ch=
eck-for-missing-__compar_fn_t-.patch
> index 53037ea..1a22ffd 100644
> --- a/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-=
for-missing-__compar_fn_t-.patch
> +++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-=
for-missing-__compar_fn_t-.patch
> @@ -1,24 +1,25 @@
> -From efc57856f961c1f3bf016c511c53d990db8abdff Mon Sep 17 00:00:00 2001=

> -From: Emil Renner Berthing <systemd@esmil.dk>
> -Date: Mon, 23 Oct 2017 11:31:03 -0700
> -Subject: [PATCH 16/31] src/basic/missing.h: check for missing __compar=
_fn_t
> +From 045f205fd21e5e380edf813de04fcfbf5a487219 Mon Sep 17 00:00:00 2001=

> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 2 Jul 2018 13:28:25 +0800
> +Subject: [PATCH 11/19] src/basic/missing.h: check for missing __compar=
_fn_t
>   typedef
> =20
>  include missing.h for missing __compar_fn_t
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   src/basic/missing.h | 5 +++++
>   src/basic/strbuf.c  | 1 +
>   2 files changed, 6 insertions(+)
> =20
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 07a8c8364..1aee3346a 100644
> +index 6dc750eba..cd1cc109f 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -1162,6 +1162,11 @@ struct input_mask {
> +@@ -1179,6 +1179,11 @@ struct input_mask {
>   #define RENAME_NOREPLACE (1 << 0)
>   #endif
>  =20
> @@ -31,17 +32,17 @@ index 07a8c8364..1aee3346a 100644
>   #define KCMP_FILE 0
>   #endif
>  diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c
> -index 8befffa66..bcb860f95 100644
> +index e2ed776a0..4d3ebec4c 100644
>  --- a/src/basic/strbuf.c
>  +++ b/src/basic/strbuf.c
> -@@ -24,6 +24,7 @@
> -=20
> +@@ -7,6 +7,7 @@
>   #include "alloc-util.h"
>   #include "strbuf.h"
> + #include "util.h"
>  +#include "missing.h"
>  =20
>   /*
>    * Strbuf stores given strings in a single continuous allocated memor=
y
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__re=
gister_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/syste=
md/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> similarity index 75%
> rename from meta/recipes-core/systemd/systemd/0030-fix-missing-of-__reg=
ister_atfork-for-non-glibc-build.patch
> rename to meta/recipes-core/systemd/systemd/0012-fix-missing-of-__regis=
ter_atfork-for-non-glibc-build.patch
> index 7f0b4bf..d41bc4a 100644
> --- a/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_=
atfork-for-non-glibc-build.patch
> +++ b/meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_=
atfork-for-non-glibc-build.patch
> @@ -1,9 +1,9 @@
> -From b7eacdf0388f930fc5271bdecfa46612c71dd65c Mon Sep 17 00:00:00 2001=

> +From 1fadf805cb391e3bcbd9a0286a9e4b7adb9e7427 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 27 Feb 2018 13:27:47 +0800
> -Subject: [PATCH 30/31] fix missing of __register_atfork for non-glibc =
builds
> +Date: Mon, 2 Jul 2018 13:34:09 +0800
> +Subject: [PATCH 12/19] fix missing of __register_atfork for non-glibc =
builds
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 7 insertions(+)
> =20
>  diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> -index dc7c9ef9e..85ce8a0cc 100644
> +index 0a4f917cb..3543bc045 100644
>  --- a/src/basic/process-util.c
>  +++ b/src/basic/process-util.c
> -@@ -39,6 +39,9 @@
> +@@ -22,6 +22,9 @@
>   #if HAVE_VALGRIND_VALGRIND_H
>   #include <valgrind/valgrind.h>
>   #endif
> @@ -24,7 +24,7 @@ index dc7c9ef9e..85ce8a0cc 100644
>  =20
>   #include "alloc-util.h"
>   #include "architecture.h"
> -@@ -1112,11 +1115,15 @@ void reset_cached_pid(void) {
> +@@ -1150,11 +1153,15 @@ void reset_cached_pid(void) {
>           cached_pid =3D CACHED_PID_UNSET;
>   }
>  =20
> @@ -39,7 +39,7 @@ index dc7c9ef9e..85ce8a0cc 100644
>  +#endif
>  =20
>   pid_t getpid_cached(void) {
> -         pid_t current_value;
> +         static bool installed =3D false;
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-h=
andling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0013-Use-uintmax=
_t-for-handling-rlim_t.patch
> similarity index 77%
> rename from meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-ha=
ndling-rlim_t.patch
> rename to meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-hand=
ling-rlim_t.patch
> index 46d75ad..69b3c15 100644
> --- a/meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling=
-rlim_t.patch
> +++ b/meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling=
-rlim_t.patch
> @@ -1,7 +1,7 @@
> -From 88c48ea84db6fda19dfaeb64545fccf8fa0525ec Mon Sep 17 00:00:00 2001=

> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 27 Oct 2017 13:00:41 -0700
> -Subject: [PATCH 26/31] Use uintmax_t for handling rlim_t
> +From a0ac0cfd90af6431c64d1b276f422a2092d569b3 Mon Sep 17 00:00:00 2001=

> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 2 Jul 2018 13:44:21 +0800
> +Subject: [PATCH 13/19] Use uintmax_t for handling rlim_t
> =20
>  PRIu{32,64} is not right format to represent rlim_t type
>  therefore use %ju and typecast the rlim_t variables to
> @@ -15,9 +15,10 @@ execute.c:3446:36: error: format '%lu' expects argum=
ent of type 'long unsigned i
>  |                                  prefix, rlimit_to_string(i), c->rli=
mit[i]->rlim_max);
>  |                                                               ~~~~~~=
~~~~~~~~~~~~~~~~
> =20
> -Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/71=
99]
> +Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]=

> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   src/basic/format-util.h | 8 --------
>   src/basic/rlimit-util.c | 8 ++++----
> @@ -25,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   3 files changed, 8 insertions(+), 16 deletions(-)
> =20
>  diff --git a/src/basic/format-util.h b/src/basic/format-util.h
> -index d9a78f781..9a1bc21d7 100644
> +index 160550cd6..61245d1e3 100644
>  --- a/src/basic/format-util.h
>  +++ b/src/basic/format-util.h
> -@@ -61,14 +61,6 @@
> +@@ -43,14 +43,6 @@
>   #  define PRI_TIMEX "li"
>   #endif
>  =20
> @@ -44,10 +45,10 @@ index d9a78f781..9a1bc21d7 100644
>   #  define DEV_FMT "%" PRIu64
>   #elif SIZEOF_DEV_T =3D=3D 4
>  diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
> -index 00648211d..df3d9ecc1 100644
> +index be1ba615e..e328ce499 100644
>  --- a/src/basic/rlimit-util.c
>  +++ b/src/basic/rlimit-util.c
> -@@ -286,13 +286,13 @@ int rlimit_format(const struct rlimit *rl, char =
**ret) {
> +@@ -299,13 +299,13 @@ int rlimit_format(const struct rlimit *rl, char =
**ret) {
>           if (rl->rlim_cur >=3D RLIM_INFINITY && rl->rlim_max >=3D RLIM=
_INFINITY)
>                   s =3D strdup("infinity");
>           else if (rl->rlim_cur >=3D RLIM_INFINITY)
> @@ -66,24 +67,24 @@ index 00648211d..df3d9ecc1 100644
>           if (!s)
>                   return -ENOMEM;
>  diff --git a/src/core/execute.c b/src/core/execute.c
> -index 0df3971df..aabdddb68 100644
> +index 8ac69d1a0..efedf3842 100644
>  --- a/src/core/execute.c
>  +++ b/src/core/execute.c
> -@@ -3991,10 +3991,10 @@ void exec_context_dump(ExecContext *c, FILE* f=
, const char *prefix) {
> +@@ -3976,10 +3976,10 @@ void exec_context_dump(const ExecContext *c, F=
ILE* f, const char *prefix) {
>  =20
>           for (i =3D 0; i < RLIM_NLIMITS; i++)
>                   if (c->rlimit[i]) {
> --                        fprintf(f, "%s%s: " RLIM_FMT "\n",
> +-                        fprintf(f, "Limit%s%s: " RLIM_FMT "\n",
>  -                                prefix, rlimit_to_string(i), c->rlimi=
t[i]->rlim_max);
> --                        fprintf(f, "%s%sSoft: " RLIM_FMT "\n",
> +-                        fprintf(f, "Limit%s%sSoft: " RLIM_FMT "\n",
>  -                                prefix, rlimit_to_string(i), c->rlimi=
t[i]->rlim_cur);
> -+                        fprintf(f, "%s%s: %ju\n",
> ++                        fprintf(f, "Limit%s%s: %ju\n",
>  +                                prefix, rlimit_to_string(i), (uintmax=
_t)c->rlimit[i]->rlim_max);
> -+                        fprintf(f, "%s%sSoft: %ju\n",
> ++                        fprintf(f, "Limit%s%sSoft: %ju\n",
>  +                                prefix, rlimit_to_string(i), (uintmax=
_t)c->rlimit[i]->rlim_cur);
>                   }
>  =20
>           if (c->ioprio_set) {
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_L=
ONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/syste=
md/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
> similarity index 66%
> rename from meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LO=
NG_MAX-definition-in-case-of-mus.patch
> rename to meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG=
_MAX-definition-in-case-of-mus.patch
> index 319c4b6..258a631 100644
> --- a/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX=
-definition-in-case-of-mus.patch
> +++ b/meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX=
-definition-in-case-of-mus.patch
> @@ -1,9 +1,9 @@
> -From adcd7e426fcd80e754274a730221d1a1f49dbc21 Mon Sep 17 00:00:00 2001=

> +From cb59b3af54fb3bbd4d8264fef919810af8d08d16 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Tue, 27 Feb 2018 14:01:30 +0800
> -Subject: [PATCH 31/31] fix missing ULONG_LONG_MAX definition in case o=
f musl
> +Subject: [PATCH 14/19] fix missing ULONG_LONG_MAX definition in case o=
f musl
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl]
> =20
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 4 insertions(+)
> =20
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 5b9fde692..a922f1346 100644
> +index cd1cc109f..144058a1a 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -72,6 +72,10 @@ struct sockaddr_vm {
> +@@ -54,6 +54,10 @@ struct sockaddr_vm {
>   };
>   #endif /* !HAVE_LINUX_VM_SOCKETS_H */
>  =20
> @@ -26,5 +26,5 @@ index 5b9fde692..a922f1346 100644
>   #define RLIMIT_RTTIME 15
>   #endif
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-In=
clude-missing.h-for-strndupa.patch b/meta/recipes-core/systemd/systemd/00=
15-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
> similarity index 70%
> rename from meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Inc=
lude-missing.h-for-strndupa.patch
> rename to meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Inclu=
de-missing.h-for-strndupa.patch
> index ad49cfe..c7ca9cd 100644
> --- a/meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-m=
issing.h-for-strndupa.patch
> +++ b/meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-m=
issing.h-for-strndupa.patch
> @@ -1,9 +1,9 @@
> -From d63d2fedcd80e58ee53655aeaf2836d4b0a14652 Mon Sep 17 00:00:00 2001=

> +From b11109ecc41110c518a98b6ac39611ff86477021 Mon Sep 17 00:00:00 2001=

>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 23 Oct 2017 12:33:22 -0700
> -Subject: [PATCH 20/31] test-hexdecoct.c: Include missing.h for strndup=
a
> +Subject: [PATCH 15/19] test-hexdecoct.c: Include missing.h for strndup=
a
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> @@ -12,10 +12,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 1 insertion(+)
> =20
>  diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
> -index 3e25a0bac..ab3e508f1 100644
> +index da9f3008b..7ff2dfe0c 100644
>  --- a/src/test/test-hexdecoct.c
>  +++ b/src/test/test-hexdecoct.c
> -@@ -24,6 +24,7 @@
> +@@ -6,6 +6,7 @@
>   #include "hexdecoct.h"
>   #include "macro.h"
>   #include "string-util.h"
> @@ -24,5 +24,5 @@ index 3e25a0bac..ab3e508f1 100644
>   static void test_hexchar(void) {
>           assert_se(hexchar(0xa) =3D=3D 'a');
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disab=
le-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/syste=
md/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> similarity index 73%
> rename from meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disabl=
e-tests-for-missing-typedefs-in-.patch
> rename to meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-=
tests-for-missing-typedefs-in-.patch
> index 9c8aeca..c06a370 100644
> --- a/meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-test=
s-for-missing-typedefs-in-.patch
> +++ b/meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-test=
s-for-missing-typedefs-in-.patch
> @@ -1,10 +1,10 @@
> -From dfea4b98844795a0cd14fdaf40c67df389dbd27e Mon Sep 17 00:00:00 2001=

> +From c4bbf3efefffe0a4efadbf4e3f0adb54d76fe0e7 Mon Sep 17 00:00:00 2001=

>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Wed, 28 Feb 2018 21:25:22 -0800
> -Subject: [PATCH 21/31] test-sizeof.c: Disable tests for missing typede=
fs in
> +Subject: [PATCH 16/19] test-sizeof.c: Disable tests for missing typede=
fs in
>   musl
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> @@ -13,10 +13,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 4 insertions(+)
> =20
>  diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> -index aed6db842..0de6fa63c 100644
> +index 7a1e496ed..386b314d5 100644
>  --- a/src/test/test-sizeof.c
>  +++ b/src/test/test-sizeof.c
> -@@ -50,8 +50,10 @@ int main(void) {
> +@@ -40,8 +40,10 @@ int main(void) {
>           info(unsigned);
>           info(long unsigned);
>           info(long long unsigned);
> @@ -27,7 +27,7 @@ index aed6db842..0de6fa63c 100644
>  =20
>           info(float);
>           info(double);
> -@@ -61,7 +63,9 @@ int main(void) {
> +@@ -59,7 +61,9 @@ int main(void) {
>           info(ssize_t);
>           info(time_t);
>           info(usec_t);
> @@ -38,5 +38,5 @@ index aed6db842..0de6fa63c 100644
>           info(uid_t);
>           info(gid_t);
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLI=
NK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0=
017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> similarity index 89%
> rename from meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLIN=
K_NOFOLLOW-flag-to-faccessat.patch
> rename to meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_=
NOFOLLOW-flag-to-faccessat.patch
> index 09c2b5c..8e47c6f5 100644
> --- a/meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFO=
LLOW-flag-to-faccessat.patch
> +++ b/meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFO=
LLOW-flag-to-faccessat.patch
> @@ -1,7 +1,7 @@
> -From 7b802ada1207ed00ed3867b9804dd0f316641b9b Mon Sep 17 00:00:00 2001=

> +From 91bb4f5c9c11464468e8d3fa4746d98d59997264 Mon Sep 17 00:00:00 2001=

>  From: Andre McCurdy <armccurdy@gmail.com>
>  Date: Tue, 10 Oct 2017 14:33:30 -0700
> -Subject: [PATCH 23/31] don't pass AT_SYMLINK_NOFOLLOW flag to faccessa=
t()
> +Subject: [PATCH 17/19] don't pass AT_SYMLINK_NOFOLLOW flag to faccessa=
t()
> =20
>  Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
>  thing to do and it's not portable (not supported by musl). See:
> @@ -22,7 +22,7 @@ The laccess() macros was added to systemd some time a=
go and it's not
>  clear if or why it needs to return success for broken symlinks. Maybe
>  just historical and not actually necessary or desired behaviour?
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>  ---
> @@ -31,10 +31,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>   2 files changed, 24 insertions(+), 4 deletions(-)
> =20
>  diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
> -index 4dba1ea56..9c4b02ecc 100644
> +index 28566773c..14b864cc5 100644
>  --- a/src/basic/fs-util.h
>  +++ b/src/basic/fs-util.h
> -@@ -50,7 +50,27 @@ int fchmod_umask(int fd, mode_t mode);
> +@@ -32,7 +32,27 @@ int fchmod_opath(int fd, mode_t m);
>  =20
>   int fd_warn_permissions(const char *path, int fd);
>  =20
> @@ -64,10 +64,10 @@ index 4dba1ea56..9c4b02ecc 100644
>   int touch_file(const char *path, bool parents, usec_t stamp, uid_t ui=
d, gid_t gid, mode_t mode);
>   int touch(const char *path);
>  diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem=
=2Ec
> -index 3c25aa534..574ca71c7 100644
> +index 89d7a7d59..34b4ad53a 100644
>  --- a/src/shared/base-filesystem.c
>  +++ b/src/shared/base-filesystem.c
> -@@ -71,7 +71,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
> +@@ -53,7 +53,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
>                   return log_error_errno(errno, "Failed to open root fi=
le system: %m");
>  =20
>           for (i =3D 0; i < ELEMENTSOF(table); i ++) {
> @@ -76,7 +76,7 @@ index 3c25aa534..574ca71c7 100644
>                           continue;
>  =20
>                   if (table[i].target) {
> -@@ -79,7 +79,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
> +@@ -61,7 +61,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
>  =20
>                           /* check if one of the targets exists */
>                           NULSTR_FOREACH(s, table[i].target) {
> @@ -85,7 +85,7 @@ index 3c25aa534..574ca71c7 100644
>                                           continue;
>  =20
>                                   /* check if a specific file exists at=
 the target path */
> -@@ -90,7 +90,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
> +@@ -72,7 +72,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
>                                           if (!p)
>                                                   return log_oom();
>  =20
> @@ -95,5 +95,5 @@ index 3c25aa534..574ca71c7 100644
>                                   }
>  =20
>  --=20
> -2.13.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0035-Define-glibc-compat=
ible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/syste=
md/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> similarity index 78%
> rename from meta/recipes-core/systemd/systemd/0035-Define-glibc-compati=
ble-basename-for-non-glibc-syste.patch
> rename to meta/recipes-core/systemd/systemd/0018-Define-glibc-compatibl=
e-basename-for-non-glibc-syste.patch
> index 736d525..1bd0d60 100644
> --- a/meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-ba=
sename-for-non-glibc-syste.patch
> +++ b/meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-ba=
sename-for-non-glibc-syste.patch
> @@ -1,7 +1,8 @@
> -From 5f1f064c81ea30acf93cfa0fb466b38f094f488c Mon Sep 17 00:00:00 2001=

> +From 97fed07132533a1b2bce9c60e305a5d09aee2e9b Mon Sep 17 00:00:00 2001=

>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 27 May 2018 08:36:44 -0700
> -Subject: [PATCH] Define glibc compatible basename() for non-glibc syst=
ems
> +Subject: [PATCH 18/19] Define glibc compatible basename() for non-glib=
c
> + systems
> =20
>  Fixes builds with musl, even though systemd is adamant about
>  using non-posix basename implementation, we have a way out
> @@ -14,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
> =20
>  diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
> -index 2d7806491b..9a3bdb1d76 100644
> +index 7f41465cc..cee8a5d43 100644
>  --- a/src/machine/machine-dbus.c
>  +++ b/src/machine/machine-dbus.c
> -@@ -29,6 +29,10 @@
> +@@ -11,6 +11,10 @@
>   #include <libgen.h>
>   #undef basename
>  =20
> @@ -29,5 +30,5 @@ index 2d7806491b..9a3bdb1d76 100644
>   #include "bus-common-errors.h"
>   #include "bus-internal.h"
>  --=20
> -2.17.0
> +2.11.0
> =20
> diff --git a/meta/recipes-core/systemd/systemd/0018-check-for-missing-c=
anonicalize_file_name.patch b/meta/recipes-core/systemd/systemd/0018-chec=
k-for-missing-canonicalize_file_name.patch
> deleted file mode 100644
> index ab7edf5..0000000
> --- a/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonica=
lize_file_name.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 690eeef9590c7ef1d9d2c31d8c1d5d8071da8c4c Mon Sep 17 00:00:00 2001=

> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Mon, 26 Feb 2018 17:21:11 +0800
> -Subject: [PATCH 18/31] check for missing canonicalize_file_name
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - meson.build                 | 2 ++
> - src/basic/missing_syscall.h | 6 ++++++
> - 2 files changed, 8 insertions(+)
> -
> -diff --git a/meson.build b/meson.build
> -index 12811b3f3..f6515e97c 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -520,6 +520,8 @@ foreach ident : [
> -         ['kcmp',              '''#include <linux/kcmp.h>'''],
> -         ['keyctl',            '''#include <sys/types.h>
> -                                  #include <keyutils.h>'''],
> -+        ['canonicalize_file_name', '''#define _GNU_SOURCE
> -+                                      #include <stdlib.h>'''],
> -         ['copy_file_range',   '''#include <sys/syscall.h>
> -                                  #include <unistd.h>'''],
> -         ['bpf',               '''#include <sys/syscall.h>
> -diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h=

> -index c938d0d97..308b9472b 100644
> ---- a/src/basic/missing_syscall.h
> -+++ b/src/basic/missing_syscall.h
> -@@ -31,6 +31,12 @@ static inline int pivot_root(const char *new_root, =
const char *put_old) {
> - }
> - #endif
> -=20
> -+#if !HAVE_CANONICALIZE_FILE_NAME
> -+static inline char *canonicalize_file_name(const char *path) {
> -+        return realpath(path, NULL);
> -+}
> -+#endif
> -+
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -=20
> - #if !HAVE_MEMFD_CREATE
> ---=20
> -2.13.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buff=
ering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/syste=
md/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> new file mode 100644
> index 0000000..942f4c0
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-w=
hen-writing-to-oom_score_a.patch
> @@ -0,0 +1,39 @@
> +From 8440348bcac34249cdf6ac2dcae9ac66d3c727db Mon Sep 17 00:00:00 2001=

> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 4 Jul 2018 15:00:44 +0800
> +Subject: [PATCH 19/19] Do not disable buffering when writing to oom_sc=
ore_adj
> +
> +On musl, disabling buffering when writing to oom_score_adj will
> +cause the following error.
> +
> +  Failed to adjust OOM setting: Invalid argument
> +
> +This error appears for systemd-udevd.service and dbus.service.
> +This is because kernel receives '-' instead of the whole '-900'
> +if buffering is disabled.
> +
> +This is libc implementation specific, as glibc does not have this issu=
e.
> +
> +Upstream-Status: Inappropriate [musl specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/basic/process-util.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> +index 3543bc045..d0572e034 100644
> +--- a/src/basic/process-util.c
> ++++ b/src/basic/process-util.c
> +@@ -1473,7 +1473,7 @@ int set_oom_score_adjust(int value) {
> +         sprintf(t, "%i", value);
> +=20
> +         return write_string_file("/proc/self/oom_score_adj", t,
> +-                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|=
WRITE_STRING_FILE_DISABLE_BUFFER);
> ++                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE)=
;
> + }
> +=20
> + static const char *const ioprio_class_table[] =3D {
> +--=20
> +2.11.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-=
and-_PATH_UTMPX-if-not-defined.patch b/meta/recipes-core/systemd/systemd/=
0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
> deleted file mode 100644
> index 9376a8f..0000000
> --- a/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PA=
TH_UTMPX-if-not-defined.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From a0b1496322f4d7ce83f4fbfd2a90b91d0721f643 Mon Sep 17 00:00:00 2001=

> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 24 Oct 2017 23:08:24 -0700
> -Subject: [PATCH 25/31] Define _PATH_WTMPX and _PATH_UTMPX if not defin=
ed
> -
> -Musl needs these defines
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/shared/utmp-wtmp.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/src/shared/utmp-wtmp.c b/src/shared/utmp-wtmp.c
> -index cab1cd6a2..f5eedac18 100644
> ---- a/src/shared/utmp-wtmp.c
> -+++ b/src/shared/utmp-wtmp.c
> -@@ -28,6 +28,7 @@
> - #include <sys/time.h>
> - #include <sys/utsname.h>
> - #include <unistd.h>
> -+#include <utmp.h>
> - #include <utmpx.h>
> -=20
> - #include "alloc-util.h"
> -@@ -42,6 +43,13 @@
> - #include "util.h"
> - #include "utmp-wtmp.h"
> -=20
> -+#if defined _PATH_UTMP && !defined _PATH_UTMPX
> -+# define _PATH_UTMPX _PATH_UTMP
> -+#endif
> -+#if defined _PATH_WTMP && !defined _PATH_WTMPX
> -+# define _PATH_WTMPX _PATH_WTMP
> -+#endif
> -+
> - int utmp_get_runlevel(int *runlevel, int *previous) {
> -         struct utmpx *found, lookup =3D { .ut_type =3D RUN_LVL };
> -         int r;
> ---=20
> -2.13.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0032-memfd.patch b/meta/=
recipes-core/systemd/systemd/0032-memfd.patch
> deleted file mode 100644
> index f7cfd60..0000000
> --- a/meta/recipes-core/systemd/systemd/0032-memfd.patch
> +++ /dev/null
> @@ -1,272 +0,0 @@
> -missing_syscall: when adding syscall replacements, use different names=
 (
> -
> -#8229)
> -
> -In meson.build we check that functions are available using:
> -    meson.get_compiler('c').has_function('foo')
> -which checks the following:
> -- if __stub_foo or __stub___foo are defined, return false
> -- if foo is declared (a pointer to the function can be taken), return =
true
> -- otherwise check for __builtin_memfd_create
> -
> -_stub is documented by glibc as
> -   It defines a symbol '__stub_FUNCTION' for each function
> -   in the C library which is a stub, meaning it will fail
> -   every time called, usually setting errno to ENOSYS.
> -
> -So if __stub is defined, we know we don't want to use the glibc versio=
n, but
> -this doesn't tell us if the name itself is defined or not. If it _is_ =
defined,
> -and we define our replacement as an inline static function, we get an =
error:
> -
> -In file included from ../src/basic/missing.h:1358:0,
> -                 from ../src/basic/util.h:47,
> -                 from ../src/basic/calendarspec.h:29,
> -                 from ../src/basic/calendarspec.c:34:
> -../src/basic/missing_syscall.h:65:19: error: static declaration of 'me=
mfd_create' follows non-static declaration
> - static inline int memfd_create(const char *name, unsigned int flags) =
{
> -                   ^~~~~~~~~~~~
> -.../usr/include/bits/mman-shared.h:46:5: note: previous declaration of=
 'memfd_create' was here
> - int memfd_create (const char *__name, unsigned int __flags) __THROW;
> -     ^~~~~~~~~~~~
> -
> -To avoid this problem, call our inline functions different than glibc,=

> -and use a #define to map the official name to our replacement.
> -
> -Fixes #8099.
> -
> -v2:
> -- use "missing_" as the prefix instead of "_"
> -
> -v3:
> -- rebase and update for statx()
> -
> -  Unfortunately "statx" is also present in "struct statx", so the defi=
ne
> -  causes issues. Work around this by using a typedef.
> -
> -I checked that systemd compiles with current glibc
> -(glibc-devel-2.26-24.fc27.x86_64) if HAVE_MEMFD_CREATE, HAVE_GETTID,
> -HAVE_PIVOT_ROOT, HAVE_SETNS, HAVE_RENAMEAT2, HAVE_KCMP, HAVE_KEYCTL,
> -HAVE_COPY_FILE_RANGE, HAVE_BPF, HAVE_STATX are forced to 0.
> -
> -Setting HAVE_NAME_TO_HANDLE_AT to 0 causes an issue, but it's not beca=
use of
> -the define, but because of struct file_handle.
> -
> -
> -backport https://github.com/systemd/systemd/commit/5187dd2c403caf92d09=
f3491e41f1ceb3f10491f
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [https://github.com/systemd/systemd/issues/8=
099]
> -Index: git/src/basic/missing_syscall.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/basic/missing_syscall.h
> -+++ git/src/basic/missing_syscall.h
> -@@ -26,9 +26,11 @@
> - #include <sys/types.h>
> -=20
> - #if !HAVE_PIVOT_ROOT
> --static inline int pivot_root(const char *new_root, const char *put_ol=
d) {
> -+static inline int missing_pivot_root(const char *new_root, const char=
 *put_old) {
> -         return syscall(SYS_pivot_root, new_root, put_old);
> - }
> -+
> -+#  define pivot_root missing_pivot_root
> - #endif
> -=20
> - #if !HAVE_CANONICALIZE_FILE_NAME
> -@@ -68,7 +70,7 @@ static inline char *canonicalize_file_na
> - #    endif
> - #  endif
> -=20
> --static inline int memfd_create(const char *name, unsigned int flags) =
{
> -+static inline int missing_memfd_create(const char *name, unsigned int=
 flags) {
> - #  ifdef __NR_memfd_create
> -         return syscall(__NR_memfd_create, name, flags);
> - #  else
> -@@ -76,6 +78,8 @@ static inline int memfd_create(const cha
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define memfd_create missing_memfd_create
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -@@ -115,7 +119,7 @@ static inline int memfd_create(const cha
> - #    endif
> - #  endif
> -=20
> --static inline int getrandom(void *buffer, size_t count, unsigned flag=
s) {
> -+static inline int missing_getrandom(void *buffer, size_t count, unsig=
ned flags) {
> - #  ifdef __NR_getrandom
> -         return syscall(__NR_getrandom, buffer, count, flags);
> - #  else
> -@@ -123,14 +127,18 @@ static inline int getrandom(void *buffer
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define getrandom missing_getrandom
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -=20
> - #if !HAVE_GETTID
> --static inline pid_t gettid(void) {
> -+static inline pid_t missing_gettid(void) {
> -         return (pid_t) syscall(SYS_gettid);
> - }
> -+
> -+#  define gettid missing_gettid
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -@@ -158,7 +166,7 @@ struct file_handle {
> -         unsigned char f_handle[0];
> - };
> -=20
> --static inline int name_to_handle_at(int fd, const char *name, struct =
file_handle *handle, int *mnt_id, int flags) {
> -+static inline int missing_name_to_handle_at(int fd, const char *name,=
 struct file_handle *handle, int *mnt_id, int flags) {
> - #  ifdef __NR_name_to_handle_at
> -         return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_=
id, flags);
> - #  else
> -@@ -166,6 +174,8 @@ static inline int name_to_handle_at(int
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define name_to_handle_at missing_name_to_handle_at
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -@@ -183,7 +193,7 @@ static inline int name_to_handle_at(int
> - #    endif
> - #  endif
> -=20
> --static inline int setns(int fd, int nstype) {
> -+static inline int missing_setns(int fd, int nstype) {
> - #  ifdef __NR_setns
> -         return syscall(__NR_setns, fd, nstype);
> - #  else
> -@@ -191,6 +201,8 @@ static inline int setns(int fd, int nsty
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define setns missing_setns
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -@@ -236,7 +248,7 @@ static inline pid_t raw_getpid(void) {
> - #    endif
> - #  endif
> -=20
> --static inline int renameat2(int oldfd, const char *oldname, int newfd=
, const char *newname, unsigned flags) {
> -+static inline int missing_renameat2(int oldfd, const char *oldname, i=
nt newfd, const char *newname, unsigned flags) {
> - #  ifdef __NR_renameat2
> -         return syscall(__NR_renameat2, oldfd, oldname, newfd, newname=
, flags);
> - #  else
> -@@ -244,12 +256,14 @@ static inline int renameat2(int oldfd, c
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define renameat2 missing_renameat2
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -=20
> - #if !HAVE_KCMP
> --static inline int kcmp(pid_t pid1, pid_t pid2, int type, unsigned lon=
g idx1, unsigned long idx2) {
> -+static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsi=
gned long idx1, unsigned long idx2) {
> - #  ifdef __NR_kcmp
> -         return syscall(__NR_kcmp, pid1, pid2, type, idx1, idx2);
> - #  else
> -@@ -257,36 +271,44 @@ static inline int kcmp(pid_t pid1, pid_t
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define kcmp missing_kcmp
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -=20
> - #if !HAVE_KEYCTL
> --static inline long keyctl(int cmd, unsigned long arg2, unsigned long =
arg3, unsigned long arg4,unsigned long arg5) {
> -+static inline long missing_keyctl(int cmd, unsigned long arg2, unsign=
ed long arg3, unsigned long arg4,unsigned long arg5) {
> - #  ifdef __NR_keyctl
> -         return syscall(__NR_keyctl, cmd, arg2, arg3, arg4, arg5);
> - #  else
> -         errno =3D ENOSYS;
> -         return -1;
> - #  endif
> -+
> -+#  define keyctl missing_keyctl
> - }
> -=20
> --static inline key_serial_t add_key(const char *type, const char *desc=
ription, const void *payload, size_t plen, key_serial_t ringid) {
> -+static inline key_serial_t missing_add_key(const char *type, const ch=
ar *description, const void *payload, size_t plen, key_serial_t ringid) {=

> - #  ifdef __NR_add_key
> -         return syscall(__NR_add_key, type, description, payload, plen=
, ringid);
> - #  else
> -         errno =3D ENOSYS;
> -         return -1;
> - #  endif
> -+
> -+#  define add_key missing_add_key
> - }
> -=20
> --static inline key_serial_t request_key(const char *type, const char *=
description, const char * callout_info, key_serial_t destringid) {
> -+static inline key_serial_t missing_request_key(const char *type, cons=
t char *description, const char * callout_info, key_serial_t destringid) =
{
> - #  ifdef __NR_request_key
> -         return syscall(__NR_request_key, type, description, callout_i=
nfo, destringid);
> - #  else
> -         errno =3D ENOSYS;
> -         return -1;
> - #  endif
> -+
> -+#  define request_key missing_request_key
> - }
> - #endif
> -=20
> -@@ -313,10 +335,10 @@ static inline key_serial_t request_key(c
> - #    endif
> - #  endif
> -=20
> --static inline ssize_t copy_file_range(int fd_in, loff_t *off_in,
> --                                      int fd_out, loff_t *off_out,
> --                                      size_t len,
> --                                      unsigned int flags) {
> -+static inline ssize_t missing_copy_file_range(int fd_in, loff_t *off_=
in,
> -+                                              int fd_out, loff_t *off=
_out,
> -+                                              size_t len,
> -+                                              unsigned int flags) {
> - #  ifdef __NR_copy_file_range
> -         return syscall(__NR_copy_file_range, fd_in, off_in, fd_out, o=
ff_out, len, flags);
> - #  else
> -@@ -324,6 +346,8 @@ static inline ssize_t copy_file_range(in
> -         return -1;
> - #  endif
> - }
> -+
> -+#  define copy_file_range missing_copy_file_range
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> -@@ -351,7 +375,7 @@ static inline ssize_t copy_file_range(in
> -=20
> - union bpf_attr;
> -=20
> --static inline int bpf(int cmd, union bpf_attr *attr, size_t size) {
> -+static inline int missing_bpf(int cmd, union bpf_attr *attr, size_t s=
ize) {
> - #ifdef __NR_bpf
> -         return (int) syscall(__NR_bpf, cmd, attr, size);
> - #else
> -@@ -360,6 +384,7 @@ static inline int bpf(int cmd, union bpf
> - #endif
> - }
> -=20
> -+#  define bpf missing_bpf
> - #endif
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
*/
> diff --git a/meta/recipes-core/systemd/systemd/0033-basic-macros-rename=
-noreturn-into-_noreturn_-8456.patch b/meta/recipes-core/systemd/systemd/=
0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
> deleted file mode 100644
> index 59647b2..0000000
> --- a/meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noretu=
rn-into-_noreturn_-8456.patch
> +++ /dev/null
> @@ -1,203 +0,0 @@
> -From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 2001=

> -From: Franck Bui <fbui@suse.com>
> -Date: Thu, 15 Mar 2018 06:23:46 +0100
> -Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456)=

> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -"noreturn" is reserved and can be used in other header files we includ=
e:
> -
> -  [   16s] In file included from /usr/include/gcrypt.h:30:0,
> -  [   16s]                  from ../src/journal/journal-file.h:26,
> -  [   16s]                  from ../src/journal/journal-vacuum.c:31:
> -  [   16s] /usr/include/gpg-error.h:1544:46: error: expected =E2=80=98=
,=E2=80=99 or =E2=80=98;=E2=80=99 before =E2=80=98)=E2=80=99 token
> -  [   16s]  void gpgrt_log_bug (const char *fmt, ...)    GPGRT_ATTR_NR=
_PRINTF(1,2);
> -
> -Here we include grcrypt.h (which in turns include gpg-error.h) *after*=
 we
> -"noreturn" was defined in macro.h.
> ----
> - src/basic/log.c                         |  4 ++--
> - src/basic/log.h                         |  4 ++--
> - src/basic/macro.h                       | 19 +++++++++----------
> - src/basic/process-util.c                |  2 +-
> - src/basic/process-util.h                |  2 +-
> - src/core/main.c                         |  4 ++--
> - src/journal/test-journal-interleaving.c |  2 +-
> - src/shared/pager.c                      |  2 +-
> - src/udev/collect/collect.c              |  2 +-
> - 9 files changed, 20 insertions(+), 21 deletions(-)
> -
> -Upstream-Status: Backport [https://github.com/systemd/systemd/pull/845=
6]
> -
> -diff --git a/src/basic/log.c b/src/basic/log.c
> -index 7a7f2cbec..16a2431c5 100644
> ---- a/src/basic/log.c
> -+++ b/src/basic/log.c
> -@@ -814,7 +814,7 @@ static void log_assert(
> -         log_dispatch_internal(level, 0, file, line, func, NULL, NULL,=
 NULL, NULL, buffer);
> - }
> -=20
> --noreturn void log_assert_failed_realm(
> -+_noreturn_ void log_assert_failed_realm(
> -                 LogRealm realm,
> -                 const char *text,
> -                 const char *file,
> -@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
> -         abort();
> - }
> -=20
> --noreturn void log_assert_failed_unreachable_realm(
> -+_noreturn_ void log_assert_failed_unreachable_realm(
> -                 LogRealm realm,
> -                 const char *text,
> -                 const char *file,
> -diff --git a/src/basic/log.h b/src/basic/log.h
> -index efcf0f1bf..314be128a 100644
> ---- a/src/basic/log.h
> -+++ b/src/basic/log.h
> -@@ -186,7 +186,7 @@ int log_dump_internal(
> -                 char *buffer);
> -=20
> - /* Logging for various assertions */
> --noreturn void log_assert_failed_realm(
> -+_noreturn_ void log_assert_failed_realm(
> -                 LogRealm realm,
> -                 const char *text,
> -                 const char *file,
> -@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
> - #define log_assert_failed(text, ...) \
> -         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
> -=20
> --noreturn void log_assert_failed_unreachable_realm(
> -+_noreturn_ void log_assert_failed_unreachable_realm(
> -                 LogRealm realm,
> -                 const char *text,
> -                 const char *file,
> -diff --git a/src/basic/macro.h b/src/basic/macro.h
> -index 95be63a20..8911edfc4 100644
> ---- a/src/basic/macro.h
> -+++ b/src/basic/macro.h
> -@@ -53,6 +53,15 @@
> - #else
> - #define _fallthrough_
> - #endif
> -+/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> -+ * compiler versions */
> -+#ifndef _noreturn_
> -+#if __STDC_VERSION__ >=3D 201112L
> -+#define _noreturn_ _Noreturn
> -+#else
> -+#define _noreturn_ __attribute__((noreturn))
> -+#endif
> -+#endif
> -=20
> - /* Temporarily disable some warnings */
> - #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                  =
   \
> -@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsigned=
 long u) {
> - #endif
> - #endif
> -=20
> --/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> -- * compiler versions */
> --#ifndef noreturn
> --#if __STDC_VERSION__ >=3D 201112L
> --#define noreturn _Noreturn
> --#else
> --#define noreturn __attribute__((noreturn))
> --#endif
> --#endif
> --
> - #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
> -         static inline void func##p(type *p) {                   \
> -                 if (*p)                                         \
> -diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> -index aa9846db5..e6120af5b 100644
> ---- a/src/basic/process-util.c
> -+++ b/src/basic/process-util.c
> -@@ -987,7 +987,7 @@ bool is_main_thread(void) {
> -         return cached > 0;
> - }
> -=20
> --noreturn void freeze(void) {
> -+_noreturn_ void freeze(void) {
> -=20
> -         log_close();
> -=20
> -diff --git a/src/basic/process-util.h b/src/basic/process-util.h
> -index 93029e36e..5170adec7 100644
> ---- a/src/basic/process-util.h
> -+++ b/src/basic/process-util.h
> -@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
> -=20
> - bool is_main_thread(void);
> -=20
> --noreturn void freeze(void);
> -+_noreturn_ void freeze(void);
> -=20
> - bool oom_score_adjust_is_valid(int oa);
> -=20
> -diff --git a/src/core/main.c b/src/core/main.c
> -index 076846a41..4b2d14923 100644
> ---- a/src/core/main.c
> -+++ b/src/core/main.c
> -@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max =3D UINT64_M=
AX;
> - static sd_id128_t arg_machine_id =3D {};
> - static EmergencyAction arg_cad_burst_action =3D EMERGENCY_ACTION_REBO=
OT_FORCE;
> -=20
> --noreturn static void freeze_or_reboot(void) {
> -+_noreturn_ static void freeze_or_reboot(void) {
> -=20
> -         if (arg_crash_reboot) {
> -                 log_notice("Rebooting in 10s...");
> -@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
> -         freeze();
> - }
> -=20
> --noreturn static void crash(int sig) {
> -+_noreturn_ static void crash(int sig) {
> -         struct sigaction sa;
> -         pid_t pid;
> -=20
> -diff --git a/src/journal/test-journal-interleaving.c b/src/journal/tes=
t-journal-interleaving.c
> -index 5a88b2774..d87bdbdd3 100644
> ---- a/src/journal/test-journal-interleaving.c
> -+++ b/src/journal/test-journal-interleaving.c
> -@@ -37,7 +37,7 @@
> -=20
> - static bool arg_keep =3D false;
> -=20
> --noreturn static void log_assert_errno(const char *text, int error, co=
nst char *file, int line, const char *func) {
> -+_noreturn_ static void log_assert_errno(const char *text, int error, =
const char *file, int line, const char *func) {
> -         log_internal(LOG_CRIT, error, file, line, func,
> -                      "'%s' failed at %s:%u (%s): %m", text, file, lin=
e, func);
> -         abort();
> -diff --git a/src/shared/pager.c b/src/shared/pager.c
> -index 75db3c985..681af9c40 100644
> ---- a/src/shared/pager.c
> -+++ b/src/shared/pager.c
> -@@ -47,7 +47,7 @@ static int stored_stderr =3D -1;
> - static bool stdout_redirected =3D false;
> - static bool stderr_redirected =3D false;
> -=20
> --noreturn static void pager_fallback(void) {
> -+_noreturn_ static void pager_fallback(void) {
> -         int r;
> -=20
> -         r =3D copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -1, =
0);
> -diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c
> -index 2821640e9..c8fa47b3d 100644
> ---- a/src/udev/collect/collect.c
> -+++ b/src/udev/collect/collect.c
> -@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct udev=
_list_node *node)
> -         return container_of(node, struct _mate, node);
> - }
> -=20
> --noreturn static void sig_alrm(int signo)
> -+_noreturn_ static void sig_alrm(int signo)
> - {
> -         exit(4);
> - }
> ---=20
> -2.17.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncati=
on-compile-failure-by-typecasting.patch b/meta/recipes-core/systemd/syste=
md/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> deleted file mode 100644
> index e56061f..0000000
> --- a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-comp=
ile-failure-by-typecasting.patch
> +++ /dev/null
> @@ -1,173 +0,0 @@
> -From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00 2001=

> -From: Patrick Uiterwijk <patrick@puiterwijk.org>
> -Date: Thu, 22 Feb 2018 19:41:30 +0100
> -Subject: [PATCH] Fix format-truncation compile failure by typecasting =
USB IDs
> - (#8250)
> -
> -This patch adds safe_atoux16 for parsing an unsigned hexadecimal 16bit=
 int, and
> -uses that for parsing USB device and vendor IDs.
> -
> -This fixes a compile error with gcc-8 because while we know that USB I=
Ds are 2 bytes,
> -the compiler does not know that.
> -
> -../src/udev/udev-builtin-hwdb.c:80:38: error: '%04X' directive output =
may be
> -truncated writing between 4 and 8 bytes into a region of size between =
2 and 6
> -[-Werror=3Dformat-truncation=3D]
> -
> -Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5=
547c12503a683290eaed47954ffcfb2d1bc03cd]
> -
> -Signed-off-by: Adam Williamson <awilliam@redhat.com>
> -Signed-off-by: Patrick Uiterwijk <puiterwijk@redhat.com>
> ----
> - src/basic/parse-util.c       | 24 ++++++++++++++++++++++
> - src/basic/parse-util.h       |  2 ++
> - src/test/test-parse-util.c   | 39 +++++++++++++++++++++++++++++++++++=
+
> - src/udev/udev-builtin-hwdb.c | 13 ++++++------
> - 4 files changed, 71 insertions(+), 7 deletions(-)
> -
> -diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> -index 97533721d..ff3fc298a 100644
> ---- a/src/basic/parse-util.c
> -+++ b/src/basic/parse-util.c
> -@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret) {
> -         return 0;
> - }
> -=20
> -+int safe_atoux16(const char *s, uint16_t *ret) {
> -+        char *x =3D NULL;
> -+        unsigned long l;
> -+
> -+        assert(s);
> -+        assert(ret);
> -+
> -+        s +=3D strspn(s, WHITESPACE);
> -+
> -+        errno =3D 0;
> -+        l =3D strtoul(s, &x, 16);
> -+        if (errno > 0)
> -+                return -errno;
> -+        if (!x || x =3D=3D s || *x !=3D 0)
> -+                return -EINVAL;
> -+        if (s[0] =3D=3D '-')
> -+                return -ERANGE;
> -+        if ((unsigned long) (uint16_t) l !=3D l)
> -+                return -ERANGE;
> -+
> -+        *ret =3D (uint16_t) l;
> -+        return 0;
> -+}
> -+
> - int safe_atod(const char *s, double *ret_d) {
> -         _cleanup_(freelocalep) locale_t loc =3D (locale_t) 0;
> -         char *x =3D NULL;
> -diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h
> -index 1eda1d7f9..727422056 100644
> ---- a/src/basic/parse-util.h
> -+++ b/src/basic/parse-util.h
> -@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);
> - int safe_atou16(const char *s, uint16_t *ret);
> - int safe_atoi16(const char *s, int16_t *ret);
> -=20
> -+int safe_atoux16(const char *s, uint16_t *ret);
> -+
> - static inline int safe_atou32(const char *s, uint32_t *ret_u) {
> -         assert_cc(sizeof(uint32_t) =3D=3D sizeof(unsigned));
> -         return safe_atou(s, (unsigned*) ret_u);
> -diff --git a/src/test/test-parse-util.c b/src/test/test-parse-util.c
> -index 937500213..a99cea5a1 100644
> ---- a/src/test/test-parse-util.c
> -+++ b/src/test/test-parse-util.c
> -@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {
> -         assert_se(r =3D=3D -EINVAL);
> - }
> -=20
> -+static void test_safe_atoux16(void) {
> -+        int r;
> -+        uint16_t l;
> -+
> -+        r =3D safe_atoux16("1234", &l);
> -+        assert_se(r =3D=3D 0);
> -+        assert_se(l =3D=3D 0x1234);
> -+
> -+        r =3D safe_atoux16("abcd", &l);
> -+        assert_se(r =3D=3D 0);
> -+        assert_se(l =3D=3D 0xabcd);
> -+
> -+        r =3D safe_atoux16("  1234", &l);
> -+        assert_se(r =3D=3D 0);
> -+        assert_se(l =3D=3D 0x1234);
> -+
> -+        r =3D safe_atoux16("12345", &l);
> -+        assert_se(r =3D=3D -ERANGE);
> -+
> -+        r =3D safe_atoux16("-1", &l);
> -+        assert_se(r =3D=3D -ERANGE);
> -+
> -+        r =3D safe_atoux16("  -1", &l);
> -+        assert_se(r =3D=3D -ERANGE);
> -+
> -+        r =3D safe_atoux16("junk", &l);
> -+        assert_se(r =3D=3D -EINVAL);
> -+
> -+        r =3D safe_atoux16("123x", &l);
> -+        assert_se(r =3D=3D -EINVAL);
> -+
> -+        r =3D safe_atoux16("12.3", &l);
> -+        assert_se(r =3D=3D -EINVAL);
> -+
> -+        r =3D safe_atoux16("", &l);
> -+        assert_se(r =3D=3D -EINVAL);
> -+}
> -+
> - static void test_safe_atou64(void) {
> -         int r;
> -         uint64_t l;
> -@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {
> -         test_safe_atolli();
> -         test_safe_atou16();
> -         test_safe_atoi16();
> -+        test_safe_atoux16();
> -         test_safe_atou64();
> -         test_safe_atoi64();
> -         test_safe_atod();
> -diff --git a/src/udev/udev-builtin-hwdb.c b/src/udev/udev-builtin-hwdb=
=2Ec
> -index ca7f7c230..dbfe02429 100644
> ---- a/src/udev/udev-builtin-hwdb.c
> -+++ b/src/udev/udev-builtin-hwdb.c
> -@@ -27,6 +27,7 @@
> -=20
> - #include "alloc-util.h"
> - #include "hwdb-util.h"
> -+#include "parse-util.h"
> - #include "string-util.h"
> - #include "udev-util.h"
> - #include "udev.h"
> -@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device *dev=
,
> -=20
> - static const char *modalias_usb(struct udev_device *dev, char *s, siz=
e_t size) {
> -         const char *v, *p;
> --        int vn, pn;
> -+        uint16_t vn, pn;
> -=20
> -         v =3D udev_device_get_sysattr_value(dev, "idVendor");
> -         if (!v)
> -@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_device=
 *dev, char *s, size_t size) {
> -         p =3D udev_device_get_sysattr_value(dev, "idProduct");
> -         if (!p)
> -                 return NULL;
> --        vn =3D strtol(v, NULL, 16);
> --        if (vn <=3D 0)
> --                return NULL;
> --        pn =3D strtol(p, NULL, 16);
> --        if (pn <=3D 0)
> --                return NULL;
> -+        if (safe_atoux16(v, &vn) < 0)
> -+		return NULL;
> -+        if (safe_atoux16(p, &pn) < 0)
> -+		return NULL;
> -         snprintf(s, size, "usb:v%04Xp%04X*", vn, pn);
> -         return s;
> - }
> ---=20
> -2.17.0
> -
> diff --git a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build=
-with-gcc8-Werror-format-truncati.patch b/meta/recipes-core/systemd/syste=
md/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> deleted file mode 100644
> index fcc7c50..0000000
> --- a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-g=
cc8-Werror-format-truncati.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 2001=

> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Fri, 1 Jun 2018 15:22:28 +0000
> -Subject: [PATCH] time-util: fix build with gcc8 -Werror=3Dformat-trunc=
ation=3D
> -
> -* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is =
added by -O2 and higher isn't used)
> -
> -../git/src/basic/time-util.c: In function 'format_timespan':
> -../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output =
between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX' [-Wer=
ror=3Dformat-truncation=3D]
> -                                              "%s"USEC_FMT".%0*"PRI_US=
EC"%s",
> -                                              ^~~~
> -../git/src/basic/time-util.c:508:60: note: format string is defined he=
re
> -                                              "%s"USEC_FMT".%0*"PRI_US=
EC"%s",
> -../git/src/basic/time-util.c:508:46: note: directive argument in the r=
ange [0, 18446744073709551614]
> -                                              "%s"USEC_FMT".%0*"PRI_US=
EC"%s",
> -                                              ^~~~
> -../git/src/basic/time-util.c:507:37: note: 'snprintf' output 4 or more=
 bytes (assuming 2147483651) into a destination of size 4294967295
> -                                 k =3D snprintf(p, l,
> -                                     ^~~~~~~~~~~~~~
> -                                              "%s"USEC_FMT".%0*"PRI_US=
EC"%s",
> -                                              ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> -                                              p > buf ? " " : "",
> -                                              ~~~~~~~~~~~~~~~~~~~
> -                                              a,
> -                                              ~~
> -                                              j,
> -                                              ~~
> -                                              b,
> -                                              ~~
> -                                              table[i].suffix);
> -                                              ~~~~~~~~~~~~~~~~
> -cc1: some warnings being treated as errors
> -
> -Upstream-Status: Submitted https://github.com/systemd/systemd/pull/915=
6
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/basic/time-util.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> -index 0601d4fa9..db5a9cd78 100644
> ---- a/src/basic/time-util.c
> -+++ b/src/basic/time-util.c
> -@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t =
t, usec_t accuracy) {
> -                 /* Let's see if we should shows this in dot notation =
*/
> -                 if (t < USEC_PER_MINUTE && b > 0) {
> -                         usec_t cc;
> --                        int j;
> -+                        signed char j;
> -=20
> -                         j =3D 0;
> -                         for (cc =3D table[i].usec; cc > 1; cc /=3D 10=
)
> diff --git a/meta/recipes-core/systemd/systemd/libmount.patch b/meta/re=
cipes-core/systemd/systemd/libmount.patch
> deleted file mode 100644
> index b59d5b7..0000000
> --- a/meta/recipes-core/systemd/systemd/libmount.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 227b8a762fea1458547be2cdf0e6e4aac0079730 Mon Sep 17 00:00:00 2001=

> -From: Michael Olbrich <m.olbrich@pengutronix.de>
> -Date: Mon, 26 Mar 2018 17:34:53 +0200
> -Subject: [PATCH] core: don't include libmount.h in a header file (#858=
0)
> -
> -linux/fs.h sys/mount.h, libmount.h and missing.h all include MS_*
> -definitions.
> -
> -To avoid problems, only one of linux/fs.h, sys/mount.h and libmount.h
> -should be included. And missing.h must be included last.
> -
> -Without this, building systemd may fail with:
> -
> -In file included from [...]/libmount/libmount.h:31:0,
> -                 from ../systemd-238/src/core/manager.h:23,
> -                 from ../systemd-238/src/core/emergency-action.h:37,
> -                 from ../systemd-238/src/core/unit.h:34,
> -                 from ../systemd-238/src/core/dbus-timer.h:25,
> -                 from ../systemd-238/src/core/timer.c:26:
> -[...]/sys/mount.h:57:2: error: expected identifier before numeric cons=
tant
> ----
> - src/core/dbus-execute.c | 1 +
> - src/core/manager.h      | 3 ++-
> - src/core/mount.c        | 2 ++
> - 3 files changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
> -index 7344623ebf6..c342093bca4 100644
> ---- a/src/core/dbus-execute.c
> -+++ b/src/core/dbus-execute.c
> -@@ -18,6 +18,7 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> -=20
> -+#include <sys/mount.h>
> - #include <sys/prctl.h>
> - #include <stdio_ext.h>
> -=20
> -diff --git a/src/core/manager.h b/src/core/manager.h
> -index 28c5da225b1..e09e0cdf5e9 100644
> ---- a/src/core/manager.h
> -+++ b/src/core/manager.h
> -@@ -20,7 +20,6 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> -=20
> --#include <libmount.h>
> - #include <stdbool.h>
> - #include <stdio.h>
> -=20
> -@@ -34,6 +33,8 @@
> - #include "list.h"
> - #include "ratelimit.h"
> -=20
> -+struct libmnt_monitor;
> -+
> - /* Enforce upper limit how many names we allow */
> - #define MANAGER_MAX_NAMES 131072 /* 128K */
> -=20
> -diff --git a/src/core/mount.c b/src/core/mount.c
> -index 0e755da5c02..0154ebda5d6 100644
> ---- a/src/core/mount.c
> -+++ b/src/core/mount.c
> -@@ -23,6 +23,8 @@
> - #include <stdio.h>
> - #include <sys/epoll.h>
> -=20
> -+#include <libmount.h>
> -+
> - #include "sd-messages.h"
> -=20
> - #include "alloc-util.h"
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-co=
re/systemd/systemd_239.bb
> similarity index 86%
> rename from meta/recipes-core/systemd/systemd_237.bb
> rename to meta/recipes-core/systemd/systemd_239.bb
> index 3efca33..4cfb3be 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -4,7 +4,7 @@ PROVIDES =3D "udev"
> =20
>  PE =3D "1"
> =20
> -DEPENDS =3D "kmod intltool-native gperf-native acl readline libcap lib=
cgroup util-linux"
> +DEPENDS =3D "intltool-native gperf-native libcap util-linux"
> =20
>  SECTION =3D "base/shell"
> =20
> @@ -17,47 +17,41 @@ REQUIRED_DISTRO_FEATURES =3D "systemd"
>  SRC_URI +=3D "file://touchscreen.rules \
>             file://00-create-volatile.conf \
>             file://init \
> -           file://0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR=
_MAP.patch \
> -           file://0001-Use-getenv-when-secure-versions-are-not-availab=
le.patch \
> -           file://0002-binfmt-Don-t-install-dependency-links-at-instal=
l-tim.patch \
> -           file://0003-use-lnr-wrapper-instead-of-looking-for-relative=
-opti.patch \
> -           file://0004-implment-systemd-sysv-install-for-OE.patch \
> -           file://0005-rules-whitelist-hd-devices.patch \
> -           file://0006-Make-root-s-home-directory-configurable.patch \=

> -           file://0007-Revert-rules-remove-firmware-loading-rules.patc=
h \
> -           file://0008-Revert-udev-remove-userspace-firmware-loading-s=
uppor.patch \
> -           file://0009-remove-duplicate-include-uchar.h.patch \
> -           file://0010-check-for-uchar.h-in-meson.build.patch \
> -           file://0011-socket-util-don-t-fail-if-libc-doesn-t-support-=
IDN.patch \
> -           file://0012-rules-watch-metadata-changes-in-ide-devices.pat=
ch \
> -           file://0013-add-fallback-parse_printf_format-implementation=
=2Epatch \
> -           file://0014-src-basic-missing.h-check-for-missing-strndupa.=
patch \
> -           file://0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is=
-not-.patch \
> -           file://0016-src-basic-missing.h-check-for-missing-__compar_=
fn_t-.patch \
> -           file://0017-Include-netinet-if_ether.h.patch \
> -           file://0018-check-for-missing-canonicalize_file_name.patch =
\
> -           file://0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-e=
nable.patch \
> -           file://0020-test-hexdecoct.c-Include-missing.h-for-strndupa=
=2Epatch \
> -           file://0021-test-sizeof.c-Disable-tests-for-missing-typedef=
s-in-.patch \
> -           file://0022-don-t-use-glibc-specific-qsort_r.patch \
> -           file://0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessa=
t.patch \
> -           file://0024-comparison_fn_t-is-glibc-specific-use-raw-signa=
ture-.patch \
> -           file://0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defin=
ed.patch \
> -           file://0026-Use-uintmax_t-for-handling-rlim_t.patch \
> -           file://0027-remove-nobody-user-group-checking.patch \
> -           file://0028-add-missing-FTW_-macros-for-musl.patch \
> -           file://0029-nss-mymachines-Build-conditionally-when-ENABLE_=
MYHOS.patch \
> -           file://0030-fix-missing-of-__register_atfork-for-non-glibc-=
build.patch \
> -           file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-o=
f-mus.patch \
> -           file://0032-memfd.patch \
> -           file://0033-basic-macros-rename-noreturn-into-_noreturn_-84=
56.patch \
> -           file://libmount.patch \
> -           file://0034-Fix-format-truncation-compile-failure-by-typeca=
sting.patch \
> -           file://0035-Define-glibc-compatible-basename-for-non-glibc-=
syste.patch \
> -           file://0036-time-util-fix-build-with-gcc8-Werror-format-tru=
ncati.patch \
> +           file://0001-binfmt-Don-t-install-dependency-links-at-instal=
l-tim.patch \
> +           file://0002-use-lnr-wrapper-instead-of-looking-for-relative=
-opti.patch \
> +           file://0003-implment-systemd-sysv-install-for-OE.patch \
> +           file://0004-rules-whitelist-hd-devices.patch \
> +           file://0005-Make-root-s-home-directory-configurable.patch \=

> +           file://0006-remove-nobody-user-group-checking.patch \
> +           file://0007-rules-watch-metadata-changes-in-ide-devices.pat=
ch \
> +           file://0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-e=
nable.patch \
> +           file://0009-nss-mymachines-Build-conditionally-when-ENABLE_=
MYHOS.patch \
>             "
>  SRC_URI_append_qemuall =3D " file://0001-core-device.c-Change-the-defa=
ult-device-timeout-to-2.patch"
> =20
> +# patches made for musl are only applied on TCLIBC is musl
> +SRC_URI +=3D "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') =3D=3D=
 'musl' else ''}"
> +SRC_URI_MUSL =3D "file://0001-Use-getenv-when-secure-versions-are-not-=
available.patch \
> +               file://0002-don-t-use-glibc-specific-qsort_r.patch \
> +               file://0003-comparison_fn_t-is-glibc-specific-use-raw-s=
ignature-.patch \
> +               file://0004-add-fallback-parse_printf_format-implementa=
tion.patch \
> +               file://0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1=
=2Epatch \
> +               file://0006-src-basic-missing.h-check-for-missing-strnd=
upa.patch \
> +               file://0007-Include-netinet-if_ether.h.patch \
> +               file://0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUN=
C-is-not-.patch \
> +               file://0009-add-missing-FTW_-macros-for-musl.patch \
> +               file://0010-socket-util-don-t-fail-if-libc-doesn-t-supp=
ort-IDN.patch \
> +               file://0011-src-basic-missing.h-check-for-missing-__com=
par_fn_t-.patch \
> +               file://0012-fix-missing-of-__register_atfork-for-non-gl=
ibc-build.patch \
> +               file://0013-Use-uintmax_t-for-handling-rlim_t.patch \
> +               file://0014-fix-missing-ULONG_LONG_MAX-definition-in-ca=
se-of-mus.patch \
> +               file://0015-test-hexdecoct.c-Include-missing.h-for-strn=
dupa.patch \
> +               file://0016-test-sizeof.c-Disable-tests-for-missing-typ=
edefs-in-.patch \
> +               file://0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facc=
essat.patch \
> +               file://0018-Define-glibc-compatible-basename-for-non-gl=
ibc-syste.patch \
> +               file://0019-Do-not-disable-buffering-when-writing-to-oo=
m_score_a.patch \
> +               "
> +
>  # Workaround undefined reference to `__stack_chk_fail_local' on qemux8=
6 and qemuppc for musl
>  SRC_URI_append_libc-musl_qemux86 =3D " file://0001-Remove-fstack-prote=
ctor-flags-to-workaround-musl-bui.patch"
>  SRC_URI_append_libc-musl_qemuppc =3D " file://0001-Remove-fstack-prote=
ctor-flags-to-workaround-musl-bui.patch"
> @@ -72,12 +66,15 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux us=
rmerge', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} =
\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)=
} \
> +    acl \
>      backlight \
>      binfmt \
>      firstboot \
> +    gshadow \
>      hibernate \
>      hostnamed \
>      ima \
> +    kmod \
>      localed \
>      logind \
>      machined \
> @@ -98,6 +95,7 @@ PACKAGECONFIG ??=3D " \
>  "
> =20
>  PACKAGECONFIG_remove_libc-musl =3D " \
> +    gshadow \
>      localed \
>      myhostname \
>      nss \
> @@ -113,6 +111,7 @@ PACKAGECONFIG_remove_libc-musl =3D " \
>  # systemd-serialgetty.bb - not enabled by default.
>  PACKAGECONFIG[serial-getty-generator] =3D ""
> =20
> +PACKAGECONFIG[acl] =3D "-Dacl=3Dtrue,-Dacl=3Dfalse,acl"
>  PACKAGECONFIG[audit] =3D "-Daudit=3Dtrue,-Daudit=3Dfalse,audit"
>  PACKAGECONFIG[backlight] =3D "-Dbacklight=3Dtrue,-Dbacklight=3Dfalse"
>  PACKAGECONFIG[binfmt] =3D "-Dbinfmt=3Dtrue,-Dbinfmt=3Dfalse"
> @@ -125,6 +124,7 @@ PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Del=
futils=3Dfalse,elfutils"
>  PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
>  # Sign the journal for anti-tampering
>  PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue,-Dgcrypt=3Dfalse,libgcrypt"=

> +PACKAGECONFIG[gshadow] =3D "-Dgshadow=3Dtrue,-Dgshadow=3Dfalse"
>  PACKAGECONFIG[hibernate] =3D "-Dhibernate=3Dtrue,-Dhibernate=3Dfalse"
>  PACKAGECONFIG[hostnamed] =3D "-Dhostnamed=3Dtrue,-Dhostnamed=3Dfalse"
>  PACKAGECONFIG[ima] =3D "-Dima=3Dtrue,-Dima=3Dfalse"
> @@ -133,6 +133,7 @@ PACKAGECONFIG[importd] =3D "-Dimportd=3Dtrue,-Dimpo=
rtd=3Dfalse"
>  # Update NAT firewall rules
>  PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Dtrue,-Dlibiptc=3Dfalse,iptables"
>  PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Dtrue,-Dlibcurl=3Dfalse,=
curl"
> +PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,kmod"
>  PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse"
>  PACKAGECONFIG[libidn] =3D "-Dlibidn=3Dtrue,-Dlibidn=3Dfalse,libidn"
>  PACKAGECONFIG[localed] =3D "-Dlocaled=3Dtrue,-Dlocaled=3Dfalse"
> @@ -146,6 +147,7 @@ PACKAGECONFIG[networkd] =3D "-Dnetworkd=3Dtrue,-Dne=
tworkd=3Dfalse"
>  PACKAGECONFIG[nss] =3D "-Dnss-systemd=3Dtrue,-Dnss-systemd=3Dfalse"
>  PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGIN=
S}"
>  PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
> +PACKAGECONFIG[portabled] =3D "-Dportabled=3Dtrue,-Dportabled=3Dfalse"
>  PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Dtrue,-Dqrencode=3Dfalse,qren=
code"
>  PACKAGECONFIG[quotacheck] =3D "-Dquotacheck=3Dtrue,-Dquotacheck=3Dfals=
e"
>  PACKAGECONFIG[randomseed] =3D "-Drandomseed=3Dtrue,-Drandomseed=3Dfals=
e"
> @@ -181,7 +183,7 @@ EXTRA_OEMESON +=3D "-Dlink-udev-shared=3Dfalse"
> =20
>  EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dnobody-group=3Dnobody \
> -                  -Droothomedir=3D${ROOTHOME} \
> +                  -Droothomedir=3D${ROOT_HOME} \
>                    -Drootlibdir=3D${rootlibdir} \
>                    -Drootprefix=3D${rootprefix} \
>                    -Dsysvrcnd-path=3D${sysconfdir} \
> @@ -314,7 +316,7 @@ USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PAC=
KAGECONFIG', 'networkd', '--sys
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'cored=
ump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"=

>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resol=
ved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polki=
t', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polk=
it-1 polkitd;', '', d)}"
> -GROUPADD_PARAM_${PN} =3D "-r systemd-journal"
> +GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
>  USERADD_PARAM_${PN}-extra-utils +=3D "--system -d / -M --shell /bin/no=
login systemd-bus-proxy;"
> =20
>  FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
> @@ -432,6 +434,14 @@ CONFFILES_${PN} =3D "${sysconfdir}/machine-id \
>                  ${sysconfdir}/systemd/user.conf"
> =20
>  FILES_${PN} =3D " ${base_bindir}/* \
> +                ${base_sbindir}/shutdown \
> +                ${base_sbindir}/halt \
> +                ${base_sbindir}/poweroff \
> +                ${base_sbindir}/runlevel \
> +                ${base_sbindir}/telinit \
> +                ${base_sbindir}/resolvconf \
> +                ${base_sbindir}/reboot \
> +                ${base_sbindir}/init \
>                  ${datadir}/dbus-1/services \
>                  ${datadir}/dbus-1/system-services \
>                  ${datadir}/polkit-1 \
> @@ -456,6 +466,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                  ${bindir}/coredumpctl \
>                  ${bindir}/localectl \
>                  ${bindir}/hostnamectl \
> +                ${bindir}/resolvectl \
>                  ${bindir}/timedatectl \
>                  ${bindir}/bootctl \
>                  ${bindir}/kernel-install \
> @@ -478,6 +489,8 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.co=
nf \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.hostname1.c=
onf \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.login1.conf=
 \
> +                ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.c=
onf \
> +                ${datadir}/dbus-1/system.d/org.freedesktop.portable1.c=
onf \
>                 "
> =20
>  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/i=
nterfaces/ ${sysconfdir}/rpm/macros.systemd"
> @@ -536,34 +549,7 @@ python __anonymous() {
>          d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>  }
> =20
> -# TODO:
> -# u-a for runlevel and telinit
> -
> -ALTERNATIVE_${PN} =3D "init halt reboot shutdown poweroff runlevel res=
olv-conf"
> -
> -ALTERNATIVE_TARGET[init] =3D "${rootlibexecdir}/systemd/systemd"
> -ALTERNATIVE_LINK_NAME[init] =3D "${base_sbindir}/init"
> -ALTERNATIVE_PRIORITY[init] ?=3D "300"
> -
> -ALTERNATIVE_TARGET[halt] =3D "${base_bindir}/systemctl"
> -ALTERNATIVE_LINK_NAME[halt] =3D "${base_sbindir}/halt"
> -ALTERNATIVE_PRIORITY[halt] ?=3D "300"
> -
> -ALTERNATIVE_TARGET[reboot] =3D "${base_bindir}/systemctl"
> -ALTERNATIVE_LINK_NAME[reboot] =3D "${base_sbindir}/reboot"
> -ALTERNATIVE_PRIORITY[reboot] ?=3D "300"
> -
> -ALTERNATIVE_TARGET[shutdown] =3D "${base_bindir}/systemctl"
> -ALTERNATIVE_LINK_NAME[shutdown] =3D "${base_sbindir}/shutdown"
> -ALTERNATIVE_PRIORITY[shutdown] ?=3D "300"
> -
> -ALTERNATIVE_TARGET[poweroff] =3D "${base_bindir}/systemctl"
> -ALTERNATIVE_LINK_NAME[poweroff] =3D "${base_sbindir}/poweroff"
> -ALTERNATIVE_PRIORITY[poweroff] ?=3D "300"
> -
> -ALTERNATIVE_TARGET[runlevel] =3D "${base_bindir}/systemctl"
> -ALTERNATIVE_LINK_NAME[runlevel] =3D "${base_sbindir}/runlevel"
> -ALTERNATIVE_PRIORITY[runlevel] ?=3D "300"
> +ALTERNATIVE_${PN} =3D "resolv-conf"
> =20
>  ALTERNATIVE_TARGET[resolv-conf] =3D "${sysconfdir}/resolv-conf.systemd=
"
>  ALTERNATIVE_LINK_NAME[resolv-conf] =3D "${sysconfdir}/resolv.conf"
>=20



--eTNJPlPVxeqPJVU188n9sXYK72N3KKdVc--

--WyrXjHqqMRIwVKbN8STW8lYkZvvdfmtBs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWz5JQgAKCRC7BTNVkZ0z
FBqGAJ4nydxLdG5F/erTOXYYlukdEvbL0QCdH1dK7oqpP30Yy6lBJxMJdPOJZco=
=8L7n
-----END PGP SIGNATURE-----

--WyrXjHqqMRIwVKbN8STW8lYkZvvdfmtBs--
