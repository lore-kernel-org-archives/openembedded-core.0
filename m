Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73F4475461
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 14:22:36 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id o202-v6so16425565vko.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PREm+QnXDcgItQvG9ncY+RYYf8g3X0S8LBWKkOcnKeA=;
	b=C1c9uNbo7OZ8lfGb/JNiBSfuMMdpvFJLBXNJTYQ+eqKtHtAJ3g06zgk6jaqBzBXx0D
	kC/xgU0vfe5rRlYeHv3r8HAsf+zQbDcHZ0bvmu4mvMyEWZGsbbm5RoroZxB8tR4s5IYI
	fj2UTtwBkyqWUyCTVIwqePmlr4vGFJE9p0LKPh80qTZN5/3GPMqOp2sW5DMp3+W9qugT
	FqSmKQ8HhsES1c39o6Lbbt1B1GgkVR5VxzP+9uS5RU3MuIazsSMDaUMmIzNBzDsCmwBE
	jgYLMpuuWeWRQSQDdPBYG05JL57emyH3EnvVwStpY1Wcjrqk4WpLH9xBgs0HgZswuMhh
	o9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PREm+QnXDcgItQvG9ncY+RYYf8g3X0S8LBWKkOcnKeA=;
	b=mqd2zWU7ErU2MyxVD2H8Ppi6M/8gyN75busSG3AuPWYNodg0HeK4wih3toT0jzTuji
	lr6yRcpHhqpWA8CyM8GaKO3aXqlblgyqoLk5jzS1Y9d6rCQEEfzjfloQ7ukk/J1PN8Fv
	J1cdxcdQFHfWXlCcWvDW38/PWMdjlgQWqUOZDMTduCsG/uas8qZkH/lztOFAkOcdIGby
	LhqwbfKVWcB7FuKuMpATxDdoZvCeaiOktMPJbhHu4+69L/dhw7Gc5ZBPXzwfnuMA2vzT
	v+kL+5UNWArba7CTgj82V3qShmVhrhd6fM3LqrduTTDJT2vftjICEeXhdaXtSIbS0KDy
	ZP4Q==
X-Gm-Message-State: AOUpUlEGvPuh+G5MWpe8NHFg+OyUCUWlDLGKohxUmhHZuN6TsuyTGSs8
	6USOOdL+b2QImVWQUigIm94nxCsD6jDRnT6Ci0A=
X-Google-Smtp-Source: AAOMgpeTatZHla8IhGqZ8Nta9VZLypp+Dt2sRf4Uq36bIq7DQ45JE3wiOnM1V44EVCtWK+VgyIrDoorrUbNekcVdGao=
X-Received: by 2002:a1f:7c4:: with SMTP id 187-v6mr1343695vkh.60.1531405356494;
	Thu, 12 Jul 2018 07:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1531389673.git.Qi.Chen@windriver.com>
	<bc25908059f4ae24437052aa39823a3ce7b8a5d9.1531389673.git.Qi.Chen@windriver.com>
	<a06249b1-8553-1d98-9396-5e57b4c0be60@windriver.com>
In-Reply-To: <a06249b1-8553-1d98-9396-5e57b4c0be60@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2018 08:22:09 -0600
Message-ID: <CAMKF1soYtSEPFc8wdHXT6Ji7PA2poJA55O1x9MmiiFxOu9OSbg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 12 Jul 2018 14:22:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks this looks good to me now.
On Thu, Jul 12, 2018 at 4:07 AM ChenQi <Qi.Chen@windriver.com> wrote:
>
> Remote branch was just updated to remove the following comment.
>
> +# patches made for musl are only applied on TCLIBC is musl
> +SRC_URI +=3D "${SRC_URI_MUSL}"
>
>
> Regards,
> Chen Qi
>
>
> On 07/12/2018 06:03 PM, Chen Qi wrote:
> > Upgrade systemd to 239.
> >
> > 1. Patch Changes
> > * Rebased Patches
> >    0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> >    0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> >    0006-Make-root-s-home-directory-configurable.patch
> >    0027-remove-nobody-user-group-checking.patch
> >    0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> >    0013-add-fallback-parse_printf_format-implementation.patch
> >    0014-src-basic-missing.h-check-for-missing-strndupa.patch
> >    0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> >    0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
> >    0017-Include-netinet-if_ether.h.patch
> >    0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
> >    0022-don-t-use-glibc-specific-qsort_r.patch
> >    0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
> >    0026-Use-uintmax_t-for-handling-rlim_t.patch
> >    0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> >    0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
> >    0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> >    0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
> >
> > * Dropped Patches and Reasons
> >    0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> >      This patch is dropped because the problem has been fixed by
> >      binutils upstream. And this workaround could be dropped.
> >      https://sourceware.org/bugzilla/show_bug.cgi?id=3D18548
> >
> >    0007-Revert-rules-remove-firmware-loading-rules.patch
> >    0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
> >      These two patches are dropped because they are for kernel < 3.7.
> >      But the current minimal requirement of kernel to build systemd
> >      is as below.
> >      REQUIREMENTS:
> >          Linux kernel >=3D 3.13
> >          Linux kernel >=3D 4.2 for unified cgroup hierarchy support
> >      So these two patches no long make any sense.
> >      Also remove non-exist firmware-path option
> >
> >    0009-remove-duplicate-include-uchar.h.patch
> >    0010-check-for-uchar.h-in-meson.build.patch
> >      These two patches are dropped because musl has implemented
> >      uchar.h. See commit below from musl repo.
> >      """
> >      ab9672ae73248f51e30f4553c4b8878525e46383
> >      implement uchar.h (C11 UTF-16/32 conversion) interfaces
> >      """
> >
> >    0018-check-for-missing-canonicalize_file_name.patch
> >      The above patch is dropped because current systemd does not need
> >      canonicalize_file_name.
> >
> >    0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
> >      The above patch is dropped because utmp makes no sense in musl.
> >      Check code below from musl.
> >      include/utmp.h:#define _PATH_UTMP "/dev/null/utmp"
> >      And utmp PACKAGECONFIG has been explicitly disabled for musl.
> >      So we don't need this patch.
> >
> >    0032-memfd.patch
> >    0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
> >    libmount.patch
> >    0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> >      The above patches are dropped because they are backported patches.
> >      And current systemd has contained these patches.
> >
> >    0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> >      The above patch is dropped because it has been merged and is now
> >      in new version.
> >
> > * Newly Added Patch
> >    0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
> >      This patch is added to fix build for musl.
> >
> >    0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> >      This patch is added to fix the following error which caused system
> >      unable to boot up.
> >        systemd-udevd.service: Failed to adjust OOM setting: Invalid arg=
ument
> >        dbus.service: Failed to adjust OOM setting: Invalid argument
> >
> >    0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> >      This patch is added to fix segment fault error on musl systems.
> >
> > 2. PACKAGECONFIG and Dependency Changes
> > * Add a new PACKAGECONFIG item 'gshadow'. Enable it by default for glib=
c
> >    but disable it by default for musl. This is because musl does not pr=
ovide
> >    gshadow.h.
> >
> > * Add a new PACKAGECONFIG item 'portabled'. Default to disable it becau=
se
> >    it's still experimental, according to the announcement letter.
> >    """
> >    Currently, the support is still experimental, but this is expected t=
o
> >    change soon. Reflecting this experimental state, the "portablectl" b=
inary
> >    is not installed into /usr/bin yet.
> >    """
> >
> > * Change 'kmod' from a hard dependency to a PACKAGECONFIG item. Default
> >    to enable it.
> >
> > * Change 'acl' from a hard dependency to a PACKAGECONFIG item. Default
> >    to enable it.
> >
> > * Remove 'readline' from DEPENDS. systemd does not need it.
> >
> > * Remove 'libcgroup' from DEPENDS. The dependency on libcgroup has been
> >    removed from systemd a long time ago. We now remove this unnecessary
> >    dependency from DEPENDS.
> >
> > 3. update-alternatives changes
> >    The utilities like shutdown, poweroff, etc. are now created as symli=
nks
> >    at do_install. So there's no need to use update-alternatives mechani=
sm
> >    anymore to create the symlinks now. In addtion, I don't think we now
> >    support multiple init systems at one running system, so there's real=
ly
> >    no need to use update-alternatives mechanism here.
> >
> >    Also update the FILES_${PN} to include these files to avoid QA issue=
.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >   meta/recipes-core/systemd/systemd.inc              |   2 +-
> >   ...rt_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  34 --
> >   ...ck-protector-flags-to-workaround-musl-bui.patch |  28 +-
> >   ...nv-when-secure-versions-are-not-available.patch |  10 +-
> >   ...-install-dependency-links-at-install-tim.patch} |  22 +-
> >   ....c-Change-the-default-device-timeout-to-2.patch |  19 +-
> >   ...=3D> 0002-don-t-use-glibc-specific-qsort_r.patch} | 108 +++++-
> >   ...per-instead-of-looking-for-relative-opti.patch} |  16 +-
> >   ...n_t-is-glibc-specific-use-raw-signature-.patch} |  25 +-
> >   ...003-implment-systemd-sysv-install-for-OE.patch} |  10 +-
> >   ...lback-parse_printf_format-implementation.patch} |  49 +--
> >   ...patch =3D> 0004-rules-whitelist-hd-devices.patch} |   8 +-
> >   ...-Make-root-s-home-directory-configurable.patch} |  34 +-
> >   ...clude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch |  29 ++
> >   ...> 0006-remove-nobody-user-group-checking.patch} |  40 +--
> >   ...sic-missing.h-check-for-missing-strndupa.patch} |  66 ++--
> >   ...patch =3D> 0007-Include-netinet-if_ether.h.patch} |  51 +--
> >   ...evert-rules-remove-firmware-loading-rules.patch |  28 --
> >   ...es-watch-metadata-changes-in-ide-devices.patch} |   6 +-
> >   ...e-nss-tests-if-nss-systemd-is-not-enable.patch} |  16 +-
> >   ...-remove-userspace-firmware-loading-suppor.patch | 377 ------------=
---------
> >   ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  86 +++--
> >   ...=3D> 0009-add-missing-FTW_-macros-for-musl.patch} |  12 +-
> >   ...es-Build-conditionally-when-ENABLE_MYHOS.patch} |  10 +-
> >   .../0009-remove-duplicate-include-uchar.h.patch    |  41 ---
> >   .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ---
> >   ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  17 +-
> >   ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  23 +-
> >   ...of-__register_atfork-for-non-glibc-build.patch} |  18 +-
> >   ...> 0013-Use-uintmax_t-for-handling-rlim_t.patch} |  33 +-
> >   ...ULONG_LONG_MAX-definition-in-case-of-mus.patch} |  12 +-
> >   ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  12 +-
> >   ...c-Disable-tests-for-missing-typedefs-in-.patch} |  14 +-
> >   ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  20 +-
> >   ...-compatible-basename-for-non-glibc-syste.patch} |  11 +-
> >   ...-check-for-missing-canonicalize_file_name.patch |  47 ---
> >   ...ble-buffering-when-writing-to-oom_score_a.patch |  39 +++
> >   ...-XSI-compliant-strerror_r-from-GNU-specif.patch |  62 ++++
> >   ...PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch |  43 ---
> >   meta/recipes-core/systemd/systemd/0032-memfd.patch | 272 ------------=
---
> >   ...cros-rename-noreturn-into-_noreturn_-8456.patch | 203 -----------
> >   ...truncation-compile-failure-by-typecasting.patch | 173 ----------
> >   ...ix-build-with-gcc8-Werror-format-truncati.patch |  53 ---
> >   meta/recipes-core/systemd/systemd/libmount.patch   |  75 ----
> >   .../systemd/{systemd_237.bb =3D> systemd_239.bb}     | 124 +++----
> >   45 files changed, 621 insertions(+), 1802 deletions(-)
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0001-Hide-__star=
t_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> >   rename meta/recipes-core/systemd/systemd/{0002-binfmt-Don-t-install-d=
ependency-links-at-install-tim.patch =3D> 0001-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch} (83%)
> >   rename meta/recipes-core/systemd/systemd/{0022-don-t-use-glibc-specif=
ic-qsort_r.patch =3D> 0002-don-t-use-glibc-specific-qsort_r.patch} (52%)
> >   rename meta/recipes-core/systemd/systemd/{0003-use-lnr-wrapper-instea=
d-of-looking-for-relative-opti.patch =3D> 0002-use-lnr-wrapper-instead-of-l=
ooking-for-relative-opti.patch} (83%)
> >   rename meta/recipes-core/systemd/systemd/{0024-comparison_fn_t-is-gli=
bc-specific-use-raw-signature-.patch =3D> 0003-comparison_fn_t-is-glibc-spe=
cific-use-raw-signature-.patch} (47%)
> >   rename meta/recipes-core/systemd/systemd/{0004-implment-systemd-sysv-=
install-for-OE.patch =3D> 0003-implment-systemd-sysv-install-for-OE.patch} =
(86%)
> >   rename meta/recipes-core/systemd/systemd/{0013-add-fallback-parse_pri=
ntf_format-implementation.patch =3D> 0004-add-fallback-parse_printf_format-=
implementation.patch} (93%)
> >   rename meta/recipes-core/systemd/systemd/{0005-rules-whitelist-hd-dev=
ices.patch =3D> 0004-rules-whitelist-hd-devices.patch} (89%)
> >   rename meta/recipes-core/systemd/systemd/{0006-Make-root-s-home-direc=
tory-configurable.patch =3D> 0005-Make-root-s-home-directory-configurable.p=
atch} (70%)
> >   create mode 100644 meta/recipes-core/systemd/systemd/0005-include-gsh=
adow-only-if-ENABLE_GSHADOW-is-1.patch
> >   rename meta/recipes-core/systemd/systemd/{0027-remove-nobody-user-gro=
up-checking.patch =3D> 0006-remove-nobody-user-group-checking.patch} (40%)
> >   rename meta/recipes-core/systemd/systemd/{0014-src-basic-missing.h-ch=
eck-for-missing-strndupa.patch =3D> 0006-src-basic-missing.h-check-for-miss=
ing-strndupa.patch} (73%)
> >   rename meta/recipes-core/systemd/systemd/{0017-Include-netinet-if_eth=
er.h.patch =3D> 0007-Include-netinet-if_ether.h.patch} (68%)
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0007-Revert-rule=
s-remove-firmware-loading-rules.patch
> >   rename meta/recipes-core/systemd/systemd/{0012-rules-watch-metadata-c=
hanges-in-ide-devices.patch =3D> 0007-rules-watch-metadata-changes-in-ide-d=
evices.patch} (92%)
> >   rename meta/recipes-core/systemd/systemd/{0019-Do-not-enable-nss-test=
s-if-nss-systemd-is-not-enable.patch =3D> 0008-Do-not-enable-nss-tests-if-n=
ss-systemd-is-not-enable.patch} (60%)
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0008-Revert-udev=
-remove-userspace-firmware-loading-suppor.patch
> >   rename meta/recipes-core/systemd/systemd/{0015-don-t-fail-if-GLOB_BRA=
CE-and-GLOB_ALTDIRFUNC-is-not-.patch =3D> 0008-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch} (67%)
> >   rename meta/recipes-core/systemd/systemd/{0028-add-missing-FTW_-macro=
s-for-musl.patch =3D> 0009-add-missing-FTW_-macros-for-musl.patch} (79%)
> >   rename meta/recipes-core/systemd/systemd/{0029-nss-mymachines-Build-c=
onditionally-when-ENABLE_MYHOS.patch =3D> 0009-nss-mymachines-Build-conditi=
onally-when-ENABLE_MYHOS.patch} (84%)
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0009-remove-dupl=
icate-include-uchar.h.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-u=
char.h-in-meson.build.patch
> >   rename meta/recipes-core/systemd/systemd/{0011-socket-util-don-t-fail=
-if-libc-doesn-t-support-IDN.patch =3D> 0010-socket-util-don-t-fail-if-libc=
-doesn-t-support-IDN.patch} (68%)
> >   rename meta/recipes-core/systemd/systemd/{0016-src-basic-missing.h-ch=
eck-for-missing-__compar_fn_t-.patch =3D> 0011-src-basic-missing.h-check-fo=
r-missing-__compar_fn_t-.patch} (63%)
> >   rename meta/recipes-core/systemd/systemd/{0030-fix-missing-of-__regis=
ter_atfork-for-non-glibc-build.patch =3D> 0012-fix-missing-of-__register_at=
fork-for-non-glibc-build.patch} (75%)
> >   rename meta/recipes-core/systemd/systemd/{0026-Use-uintmax_t-for-hand=
ling-rlim_t.patch =3D> 0013-Use-uintmax_t-for-handling-rlim_t.patch} (77%)
> >   rename meta/recipes-core/systemd/systemd/{0031-fix-missing-ULONG_LONG=
_MAX-definition-in-case-of-mus.patch =3D> 0014-fix-missing-ULONG_LONG_MAX-d=
efinition-in-case-of-mus.patch} (66%)
> >   rename meta/recipes-core/systemd/systemd/{0020-test-hexdecoct.c-Inclu=
de-missing.h-for-strndupa.patch =3D> 0015-test-hexdecoct.c-Include-missing.=
h-for-strndupa.patch} (70%)
> >   rename meta/recipes-core/systemd/systemd/{0021-test-sizeof.c-Disable-=
tests-for-missing-typedefs-in-.patch =3D> 0016-test-sizeof.c-Disable-tests-=
for-missing-typedefs-in-.patch} (73%)
> >   rename meta/recipes-core/systemd/systemd/{0023-don-t-pass-AT_SYMLINK_=
NOFOLLOW-flag-to-faccessat.patch =3D> 0017-don-t-pass-AT_SYMLINK_NOFOLLOW-f=
lag-to-faccessat.patch} (89%)
> >   rename meta/recipes-core/systemd/systemd/{0035-Define-glibc-compatibl=
e-basename-for-non-glibc-syste.patch =3D> 0018-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch} (78%)
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-m=
issing-canonicalize_file_name.patch
> >   create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-disa=
ble-buffering-when-writing-to-oom_score_a.patch
> >   create mode 100644 meta/recipes-core/systemd/systemd/0020-distinguish=
-XSI-compliant-strerror_r-from-GNU-specif.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0025-Define-_PAT=
H_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0032-memfd.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0033-basic-macro=
s-rename-noreturn-into-_noreturn_-8456.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0034-Fix-format-=
truncation-compile-failure-by-typecasting.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-f=
ix-build-with-gcc8-Werror-format-truncati.patch
> >   delete mode 100644 meta/recipes-core/systemd/systemd/libmount.patch
> >   rename meta/recipes-core/systemd/{systemd_237.bb =3D> systemd_239.bb}=
 (86%)
> >
> > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/=
systemd/systemd.inc
> > index 5fa48e7a..736e0a0 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
> >   LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7ab=
aabaa882bbe \
> >                       file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107=
9008b364516c"
> >
> > -SRCREV =3D "46659f7deb962f55c728e70597e37c2a3ab6326d"
> > +SRCREV =3D "de7436b02badc82200dc127ff190b8155769b8e7"
> >
> >   SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dgit"
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ER=
ROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/=
0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> > deleted file mode 100644
> > index 2cffc42..0000000
> > --- a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP=
-and-__stop_BUS_ERROR_MAP.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 2 Mar 2018 18:00:17 -0800
> > -Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
> > -
> > -for currently unknown reasons they get exported to the shared libries
> > -even without being listed in the sym file
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > -
> > -Upstream-Status: Pending [ Conditional on master needing this, 234 doe=
s need it ]
> > -
> > - src/libsystemd/sd-bus/bus-error.c | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus=
/bus-error.c
> > -index 378f7a377..49d797abd 100644
> > ---- a/src/libsystemd/sd-bus/bus-error.c
> > -+++ b/src/libsystemd/sd-bus/bus-error.c
> > -@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bu=
s_standard_errors[] =3D {
> > - };
> > -
> > - /* GCC maps this magically to the beginning and end of the BUS_ERROR_=
MAP section */
> > --extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
> > --extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
> > -+extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
> > -+extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
> > -
> > - /* Additional maps registered with sd_bus_error_add_map() are in this
> > -  * NULL terminated array */
> > ---
> > -2.16.2
> > -
> > diff --git a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-prote=
ctor-flags-to-workaround-musl-bui.patch b/meta/recipes-core/systemd/systemd=
/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
> > index e913e3f..d745800 100644
> > --- a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-fl=
ags-to-workaround-musl-bui.patch
> > +++ b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-fl=
ags-to-workaround-musl-bui.patch
> > @@ -1,6 +1,6 @@
> > -From e361f6b4aefae57efff7e457df8db4d1067bec23 Mon Sep 17 00:00:00 2001
> > +From 9e3816bcaa36e1a11647ca0cf4f8044449c77fe0 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 28 Feb 2018 21:50:23 -0800
> > +Date: Mon, 2 Jul 2018 15:28:22 +0800
> >   Subject: [PATCH] Remove fstack-protector flags to workaround musl bui=
ld
> >
> >   Remove fstack-protector and fstack-protector-strong flags to fix
> > @@ -8,7 +8,7 @@ the following build failure for qemux86 and qemuppc wit=
h musl.
> >
> >     undefined reference to `__stack_chk_fail_local'
> >
> > -Upstream-Status: Inappropriate [OE Specific]
> > +Upstream-Status: Inappropriate [musl Specific]
> >
> >   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >   ---
> > @@ -16,18 +16,18 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >    1 file changed, 2 deletions(-)
> >
> >   diff --git a/meson.build b/meson.build
> > -index 7610ab12b..591b9cbab 100644
> > +index f432ea072..a734a295c 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> > -@@ -329,8 +329,6 @@ foreach arg : ['-Wextra',
> > -                '-fdiagnostics-show-option',
> > -                '-fno-strict-aliasing',
> > -                '-fvisibility=3Dhidden',
> > --               '-fstack-protector',
> > --               '-fstack-protector-strong',
> > -                '--param=3Dssp-buffer-size=3D4',
> > -               ]
> > -         if cc.has_argument(arg)
> > +@@ -333,8 +333,6 @@ possible_cc_flags =3D [
> > +         '-fdiagnostics-show-option',
> > +         '-fno-strict-aliasing',
> > +         '-fvisibility=3Dhidden',
> > +-        '-fstack-protector',
> > +-        '-fstack-protector-strong',
> > +         '--param=3Dssp-buffer-size=3D4',
> > + ]
> > +
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-sec=
ure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/00=
01-Use-getenv-when-secure-versions-are-not-available.patch
> > index f4c15e1..03f6ead 100644
> > --- a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-ver=
sions-are-not-available.patch
> > +++ b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-ver=
sions-are-not-available.patch
> > @@ -1,7 +1,7 @@
> > -From b1192a6e171413291d9d64fafc04773c6bbc9cab Mon Sep 17 00:00:00 2001
> > +From 6dd136512896979feb6883a16226d640a7e5ca74 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> >   Date: Fri, 23 Feb 2018 10:04:48 +0800
> > -Subject: [PATCH 01/31] Use getenv when secure versions are not availab=
le
> > +Subject: [PATCH 01/19] Use getenv when secure versions are not availab=
le
> >
> >   musl doesnt implement secure version, so we default
> >   to it if configure does not detect a secure implementation
> > @@ -16,10 +16,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >   diff --git a/src/basic/missing.h b/src/basic/missing.h
> > -index 1280e6c41..39c1fb700 100644
> > +index 71a07d057..0e33abb9f 100644
> >   --- a/src/basic/missing.h
> >   +++ b/src/basic/missing.h
> > -@@ -605,7 +605,7 @@ struct btrfs_ioctl_quota_ctl_args {
> > +@@ -592,7 +592,7 @@ struct btrfs_ioctl_quota_ctl_args {
> >    #  if HAVE___SECURE_GETENV
> >    #    define secure_getenv __secure_getenv
> >    #  else
> > @@ -29,5 +29,5 @@ index 1280e6c41..39c1fb700 100644
> >    #endif
> >
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-instal=
l-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd=
/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > similarity index 83%
> > rename from meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install=
-dependency-links-at-install-tim.patch
> > rename to meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-d=
ependency-links-at-install-tim.patch
> > index c3f4b39..e24e7f8 100644
> > --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depen=
dency-links-at-install-tim.patch
> > +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depen=
dency-links-at-install-tim.patch
> > @@ -1,7 +1,7 @@
> > -From c93eb6cdec03f5e243e59e95dc49273fcb90e7c1 Mon Sep 17 00:00:00 2001
> > +From 87dd61be2e28e78ce4f9f173794812e6c2d904d1 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Fri, 23 Feb 2018 10:23:40 +0800
> > -Subject: [PATCH 02/31] binfmt: Don't install dependency links at insta=
ll time
> > +Date: Wed, 27 Jun 2018 16:01:22 +0800
> > +Subject: [PATCH 1/9] binfmt: Don't install dependency links at install=
 time
> >    for the binfmt services
> >
> >   use [Install] blocks so that they get created when the service is ena=
bled
> > @@ -23,10 +23,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >    3 files changed, 9 insertions(+), 4 deletions(-)
> >
> >   diff --git a/units/meson.build b/units/meson.build
> > -index 814ee7885..49ace0d0f 100644
> > +index e4ac6ced6..698734e44 100644
> >   --- a/units/meson.build
> >   +++ b/units/meson.build
> > -@@ -60,8 +60,7 @@ units =3D [
> > +@@ -46,8 +46,7 @@ units =3D [
> >            ['poweroff.target',                     '',
> >             'runlevel0.target'],
> >            ['printer.target',                      ''],
> > @@ -36,7 +36,7 @@ index 814ee7885..49ace0d0f 100644
> >            ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
> >            ['reboot.target',                       '',
> >             'runlevel6.target ctrl-alt-del.target'],
> > -@@ -144,8 +143,7 @@ in_units =3D [
> > +@@ -130,8 +129,7 @@ in_units =3D [
> >            ['systemd-ask-password-console.service', ''],
> >            ['systemd-ask-password-wall.service',    ''],
> >            ['systemd-backlight@.service',           'ENABLE_BACKLIGHT']=
,
> > @@ -58,18 +58,18 @@ index 30a6bc991..4231f3b70 100644
> >   +[Install]
> >   +WantedBy=3Dsysinit.target
> >   diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.s=
ervice.in
> > -index df9396d89..0687f4648 100644
> > +index e940c7c9a..6be7f5cc9 100644
> >   --- a/units/systemd-binfmt.service.in
> >   +++ b/units/systemd-binfmt.service.in
> > -@@ -13,6 +13,7 @@ Documentation=3Dman:systemd-binfmt.service(8) man:bi=
nfmt.d(5)
> > - Documentation=3Dhttps://www.kernel.org/doc/Documentation/binfmt_misc.=
txt
> > +@@ -14,6 +14,7 @@ Documentation=3Dhttps://www.kernel.org/doc/html/late=
st/admin-guide/binfmt-misc.htm
> > + Documentation=3Dhttps://www.freedesktop.org/wiki/Software/systemd/API=
FileSystems
> >    DefaultDependencies=3Dno
> >    Conflicts=3Dshutdown.target
> >   +Wants=3Dproc-sys-fs-binfmt_misc.automount
> >    After=3Dproc-sys-fs-binfmt_misc.automount
> >    Before=3Dsysinit.target shutdown.target
> >    ConditionPathIsReadWrite=3D/proc/sys/
> > -@@ -27,3 +28,6 @@ Type=3Doneshot
> > +@@ -28,3 +29,6 @@ Type=3Doneshot
> >    RemainAfterExit=3Dyes
> >    ExecStart=3D@rootlibexecdir@/systemd-binfmt
> >    TimeoutSec=3D90s
> > @@ -77,5 +77,5 @@ index df9396d89..0687f4648 100644
> >   +[Install]
> >   +WantedBy=3Dsysinit.target
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Chang=
e-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd=
/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> > index 98c8362..fd7bf3f 100644
> > --- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
> > +++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
> > @@ -1,7 +1,9 @@
> > -From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Mon, 14 Dec 2015 04:09:19 +0000
> > +From 2925c0c3b6ce4056622b86c1c61ee14add430790 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Thu, 28 Jun 2018 10:56:29 +0800
> >   Subject: [PATCH] core/device.c: Change the default device timeout to =
240 sec.
> > + MIME-Version: 1.0 Content-Type: text/plain; charset=3DUTF-8
> > + Content-Transfer-Encoding: 8bit
> >   MIME-Version: 1.0
> >   Content-Type: text/plain; charset=3DUTF-8
> >   Content-Transfer-Encoding: 8bit
> > @@ -10,16 +12,16 @@ Upstream-Status: Inappropriate [Specific case QEMU/=
AB]
> >
> >   Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >   ---
> >    src/core/device.c | 2 +-
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >   diff --git a/src/core/device.c b/src/core/device.c
> > -index a43664d3b..4b16a8aec 100644
> > +index a2d00a0fb..f26e55ebb 100644
> >   --- a/src/core/device.c
> >   +++ b/src/core/device.c
> > -@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
> > +@@ -95,7 +95,7 @@ static void device_init(Unit *u) {
> >             * indefinitely for plugged in devices, something which cann=
ot
> >             * happen for the other units since their operations time ou=
t
> >             * anyway. */
> > @@ -27,4 +29,7 @@ index a43664d3b..4b16a8aec 100644
> >   +        u->job_running_timeout =3D (240 * USEC_PER_SEC);
> >
> >            u->ignore_on_isolate =3D true;
> > - }
> > +
> > +--
> > +2.11.0
> > +
> > diff --git a/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-spe=
cific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glib=
c-specific-qsort_r.patch
> > similarity index 52%
> > rename from meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-spec=
ific-qsort_r.patch
> > rename to meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specif=
ic-qsort_r.patch
> > index a5f7442..f07211b 100644
> > --- a/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-q=
sort_r.patch
> > +++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-q=
sort_r.patch
> > @@ -1,21 +1,99 @@
> > -From d343757d629402c70ca8e5eaa551deaf175c96f3 Mon Sep 17 00:00:00 2001
> > +From d43faf6d253db789225b7c454c8f255fbc68857e Mon Sep 17 00:00:00 2001
> >   From: Emil Renner Berthing <systemd@esmil.dk>
> >   Date: Thu, 18 Sep 2014 15:24:56 +0200
> > -Subject: [PATCH 22/31] don't use glibc-specific qsort_r
> > +Subject: [PATCH 02/19] don't use glibc-specific qsort_r
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Inappropriate [musl specific]
> >
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   ---
> > - src/hwdb/hwdb.c         | 18 +++++++++++-------
> > - src/udev/udevadm-hwdb.c | 16 ++++++++++------
> > - 2 files changed, 21 insertions(+), 13 deletions(-)
> > + src/basic/format-table.c | 27 ++++++++++++++++-----------
> > + src/basic/util.h         |  7 -------
> > + src/hwdb/hwdb.c          | 18 +++++++++++-------
> > + src/udev/udevadm-hwdb.c  | 16 ++++++++++------
> > + 4 files changed, 37 insertions(+), 31 deletions(-)
> >
> > +diff --git a/src/basic/format-table.c b/src/basic/format-table.c
> > +index 94e796d1c..f7b4eade9 100644
> > +--- a/src/basic/format-table.c
> > ++++ b/src/basic/format-table.c
> > +@@ -745,29 +745,29 @@ static int cell_data_compare(TableData *a, size_=
t index_a, TableData *b, size_t
> > +         return 0;
> > + }
> > +
> > +-static int table_data_compare(const void *x, const void *y, void *use=
rdata) {
> > ++static Table *user_table;
> > ++static int table_data_compare(const void *x, const void *y) {
> > +         const size_t *a =3D x, *b =3D y;
> > +-        Table *t =3D userdata;
> > +         size_t i;
> > +         int r;
> > +
> > +-        assert(t);
> > +-        assert(t->sort_map);
> > ++        assert(user_table);
> > ++        assert(user_table->sort_map);
> > +
> > +         /* Make sure the header stays at the beginning */
> > +-        if (*a < t->n_columns && *b < t->n_columns)
> > ++        if (*a < user_table->n_columns && *b < user_table->n_columns)
> > +                 return 0;
> > +-        if (*a < t->n_columns)
> > ++        if (*a < user_table->n_columns)
> > +                 return -1;
> > +-        if (*b < t->n_columns)
> > ++        if (*b < user_table->n_columns)
> > +                 return 1;
> > +
> > +         /* Order other lines by the sorting map */
> > +-        for (i =3D 0; i < t->n_sort_map; i++) {
> > ++        for (i =3D 0; i < user_table->n_sort_map; i++) {
> > +                 TableData *d, *dd;
> > +
> > +-                d =3D t->data[*a + t->sort_map[i]];
> > +-                dd =3D t->data[*b + t->sort_map[i]];
> > ++                d =3D user_table->data[*a + user_table->sort_map[i]];
> > ++                dd =3D user_table->data[*b + user_table->sort_map[i]]=
;
> > +
> > +                 r =3D cell_data_compare(d, *a, dd, *b);
> > +                 if (r !=3D 0)
> > +@@ -960,7 +960,12 @@ int table_print(Table *t, FILE *f) {
> > +                 for (i =3D 0; i < n_rows; i++)
> > +                         sorted[i] =3D i * t->n_columns;
> > +
> > +-                qsort_r_safe(sorted, n_rows, sizeof(size_t), table_da=
ta_compare, t);
> > ++                if (n_rows <=3D 1)
> > ++                        return;
> > ++                assert(sorted);
> > ++                user_table =3D t;
> > ++                qsort(sorted, n_rows, sizeof(size_t), table_data_comp=
are);
> > ++                user_table =3D NULL;
> > +         }
> > +
> > +         if (t->display_map)
> > +diff --git a/src/basic/util.h b/src/basic/util.h
> > +index 9699d228f..40eaf518c 100644
> > +--- a/src/basic/util.h
> > ++++ b/src/basic/util.h
> > +@@ -105,13 +105,6 @@ static inline void qsort_safe(void *base, size_t =
nmemb, size_t size, comparison_
> > +                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) =
_func_); \
> > +         })
> > +
> > +-static inline void qsort_r_safe(void *base, size_t nmemb, size_t size=
, int (*compar)(const void*, const void*, void*), void *userdata) {
> > +-        if (nmemb <=3D 1)
> > +-                return;
> > +-
> > +-        assert(base);
> > +-        qsort_r(base, nmemb, size, compar, userdata);
> > +-}
> > +
> > + /**
> > +  * Normal memcpy requires src to be nonnull. We do nothing if n is 0.
> >   diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
> > -index 4540260f9..81aca7a9b 100644
> > +index 317cad8a6..701d59a1e 100644
> >   --- a/src/hwdb/hwdb.c
> >   +++ b/src/hwdb/hwdb.c
> > -@@ -152,13 +152,12 @@ static void trie_free(struct trie *trie) {
> > +@@ -135,13 +135,12 @@ static void trie_free(struct trie *trie) {
> >
> >    DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
> >
> > @@ -33,7 +111,7 @@ index 4540260f9..81aca7a9b 100644
> >    }
> >
> >    static int trie_node_add_value(struct trie *trie, struct trie_node *=
node,
> > -@@ -183,7 +182,10 @@ static int trie_node_add_value(struct trie *trie,=
 struct trie_node *node,
> > +@@ -166,7 +165,10 @@ static int trie_node_add_value(struct trie *trie,=
 struct trie_node *node,
> >                            .value_off =3D v,
> >                    };
> >
> > @@ -45,7 +123,7 @@ index 4540260f9..81aca7a9b 100644
> >                    if (val) {
> >                            /* At this point we have 2 identical propert=
ies on the same match-string.
> >                             * Since we process files in order, we just =
replace the previous value.
> > -@@ -208,7 +210,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> > +@@ -191,7 +193,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> >            node->values[node->values_count].file_priority =3D file_prio=
rity;
> >            node->values[node->values_count].line_number =3D line_number=
;
> >            node->values_count++;
> > @@ -57,10 +135,10 @@ index 4540260f9..81aca7a9b 100644
> >    }
> >
> >   diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
> > -index ab5dc7ab6..c777e30ab 100644
> > +index 02408a428..491d367d1 100644
> >   --- a/src/udev/udevadm-hwdb.c
> >   +++ b/src/udev/udevadm-hwdb.c
> > -@@ -130,13 +130,13 @@ static void trie_node_cleanup(struct trie_node *=
node) {
> > +@@ -114,13 +114,13 @@ static void trie_node_cleanup(struct trie_node *=
node) {
> >            free(node);
> >    }
> >
> > @@ -78,7 +156,7 @@ index ab5dc7ab6..c777e30ab 100644
> >    }
> >
> >    static int trie_node_add_value(struct trie *trie, struct trie_node *=
node,
> > -@@ -157,7 +157,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> > +@@ -141,7 +141,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> >                            .value_off =3D v,
> >                    };
> >
> > @@ -89,7 +167,7 @@ index ab5dc7ab6..c777e30ab 100644
> >                    if (val) {
> >                            /* replace existing earlier key with new val=
ue */
> >                            val->value_off =3D v;
> > -@@ -174,7 +176,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> > +@@ -158,7 +160,9 @@ static int trie_node_add_value(struct trie *trie, =
struct trie_node *node,
> >            node->values[node->values_count].key_off =3D k;
> >            node->values[node->values_count].value_off =3D v;
> >            node->values_count++;
> > @@ -101,5 +179,5 @@ index ab5dc7ab6..c777e30ab 100644
> >    }
> >
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-ins=
tead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd=
/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> > similarity index 83%
> > rename from meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-inst=
ead-of-looking-for-relative-opti.patch
> > rename to meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instea=
d-of-looking-for-relative-opti.patch
> > index 28f1b21..1d7f523 100644
> > --- a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of=
-looking-for-relative-opti.patch
> > +++ b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of=
-looking-for-relative-opti.patch
> > @@ -1,8 +1,8 @@
> > -From 8b9d194e956848e0d1fb35ef2fba714b2691ebe6 Mon Sep 17 00:00:00 2001
> > +From 6e62be87a2722fbe531310a1b052c1301bdf06fb Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 28 Feb 2018 20:47:49 -0800
> > -Subject: [PATCH 03/31] use lnr wrapper instead of looking for --relati=
ve
> > - option for ln
> > +Date: Wed, 27 Jun 2018 16:09:24 +0800
> > +Subject: [PATCH 2/9] use lnr wrapper instead of looking for --relative=
 option
> > + for ln
> >
> >   Remove file manually to avoid the 'File Exists' error when creating
> >   symlink. This is because the original 'ln' command uses '-f' option.
> > @@ -18,15 +18,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >    3 files changed, 8 insertions(+), 6 deletions(-)
> >
> >   diff --git a/meson.build b/meson.build
> > -index 36a62d280..7347ea880 100644
> > +index 04331dd41..6d5edcb4e 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> > -@@ -570,10 +570,6 @@ endforeach
> > +@@ -558,10 +558,6 @@ endforeach
> >
> >    conf.set_quoted('TELINIT', get_option('telinit-path'))
> >
> >   -if run_command('ln', '--relative', '--help').returncode() !=3D 0
> > --        error('ln does not support --relative')
> > +-        error('ln does not support --relative (added in coreutils 8.1=
6)')
> >   -endif
> >   -
> >    ############################################################
> > @@ -60,5 +60,5 @@ index 70f7172ae..a42666aac 100755
> >   +        lnr "$unitpath" "$dir"
> >   +fi
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-=
glibc-specific-use-raw-signature-.patch b/meta/recipes-core/systemd/systemd=
/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
> > similarity index 47%
> > rename from meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-g=
libc-specific-use-raw-signature-.patch
> > rename to meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-gli=
bc-specific-use-raw-signature-.patch
> > index fe7e623..115fb33 100644
> > --- a/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-s=
pecific-use-raw-signature-.patch
> > +++ b/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-s=
pecific-use-raw-signature-.patch
> > @@ -1,23 +1,32 @@
> > -From 76c71aa889155f29be1d5d2b74a2c4faa5909c8c Mon Sep 17 00:00:00 2001
> > +From e965e748c7030df0709e63128db2f023540a06ba Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sat, 12 Sep 2015 18:53:31 +0000
> > -Subject: [PATCH 24/31] comparison_fn_t is glibc specific, use raw sign=
ature in
> > +Subject: [PATCH 03/19] comparison_fn_t is glibc specific, use raw sign=
ature in
> >    function pointer
> >
> >   make it work with musl where comparison_fn_t is not provided
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Inappropriate [musl specific]
> >
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   ---
> > - src/basic/util.h | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > + src/basic/util.h | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >   diff --git a/src/basic/util.h b/src/basic/util.h
> > -index 9d1b10756..12db53a93 100644
> > +index 40eaf518c..c58392397 100644
> >   --- a/src/basic/util.h
> >   +++ b/src/basic/util.h
> > -@@ -95,7 +95,7 @@ void *xbsearch_r(const void *key, const void *base, =
size_t nmemb, size_t size,
> > +@@ -77,7 +77,7 @@ void *xbsearch_r(const void *key, const void *base, =
size_t nmemb, size_t size,
> > +  * that only if nmemb > 0.
> > +  */
> > + static inline void* bsearch_safe(const void *key, const void *base,
> > +-                                 size_t nmemb, size_t size, compariso=
n_fn_t compar) {
> > ++                                 size_t nmemb, size_t size, int (*com=
par)(const void *, const void *)) {
> > +         if (nmemb <=3D 0)
> > +                 return NULL;
> > +
> > +@@ -89,7 +89,7 @@ static inline void* bsearch_safe(const void *key, co=
nst void *base,
> >     * Normal qsort requires base to be nonnull. Here were require
> >     * that only if nmemb > 0.
> >     */
> > @@ -27,5 +36,5 @@ index 9d1b10756..12db53a93 100644
> >                    return;
> >
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0004-implment-systemd-sy=
sv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0003-implment-s=
ystemd-sysv-install-for-OE.patch
> > similarity index 86%
> > rename from meta/recipes-core/systemd/systemd/0004-implment-systemd-sys=
v-install-for-OE.patch
> > rename to meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-=
install-for-OE.patch
> > index 83fdb53..6c595ae 100644
> > --- a/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-inst=
all-for-OE.patch
> > +++ b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-inst=
all-for-OE.patch
> > @@ -1,7 +1,7 @@
> > -From 70d456fb21de2a80697fa364f08475339d6396c1 Mon Sep 17 00:00:00 2001
> > +From 0fcb6e646401205e17cc6c129441a49023c62cef Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sat, 5 Sep 2015 06:31:47 +0000
> > -Subject: [PATCH 04/31] implment systemd-sysv-install for OE
> > +Subject: [PATCH 3/9] implment systemd-sysv-install for OE
> >
> >   Use update-rc.d for enabling/disabling and status command
> >   to check the status of the sysv service
> > @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >   diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/system=
ctl/systemd-sysv-install.SKELETON
> > -index a53a3e622..5d877b06e 100755
> > +index 8c16cf999..9f078a121 100755
> >   --- a/src/systemctl/systemd-sysv-install.SKELETON
> >   +++ b/src/systemctl/systemd-sysv-install.SKELETON
> > -@@ -30,17 +30,17 @@ case "$1" in
> > +@@ -32,17 +32,17 @@ case "$1" in
> >        enable)
> >            # call the command to enable SysV init script $NAME here
> >            # (consider optional $ROOT)
> > @@ -39,5 +39,5 @@ index a53a3e622..5d877b06e 100755
> >        *)
> >            usage ;;
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_=
printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004=
-add-fallback-parse_printf_format-implementation.patch
> > similarity index 93%
> > rename from meta/recipes-core/systemd/systemd/0013-add-fallback-parse_p=
rintf_format-implementation.patch
> > rename to meta/recipes-core/systemd/systemd/0004-add-fallback-parse_pri=
ntf_format-implementation.patch
> > index 9c9278d..7652a2d 100644
> > --- a/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_=
format-implementation.patch
> > +++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_=
format-implementation.patch
> > @@ -1,29 +1,29 @@
> > -From 580d23cf0b32e36a8fb96710336ffef432b3c7ce Mon Sep 17 00:00:00 2001
> > +From 582af7ec13131dfcc620ed81de7b211914c4cb03 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 28 Feb 2018 21:10:58 -0800
> > -Subject: [PATCH] add fallback parse_printf_format implementation
> > +Date: Fri, 29 Jun 2018 13:43:49 +0800
> > +Subject: [PATCH 04/19] add fallback parse_printf_format implementation
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Inappropriate [musl specific]
> >
> >   Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >   ---
> >    meson.build                     |   1 +
> > - src/basic/meson.build           |   4 +
> > + src/basic/meson.build           |   5 +
> >    src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++=
++++++++++
> >    src/basic/parse-printf-format.h |  57 +++++++++
> >    src/basic/stdio-util.h          |   2 +-
> >    src/journal/journal-send.c      |   2 +-
> > - 6 files changed, 337 insertions(+), 2 deletions(-)
> > + 6 files changed, 338 insertions(+), 2 deletions(-)
> >    create mode 100644 src/basic/parse-printf-format.c
> >    create mode 100644 src/basic/parse-printf-format.h
> >
> >   diff --git a/meson.build b/meson.build
> > -index 94a16712b..4eabaafe8 100644
> > +index e045b9224..8c16bc979 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> > -@@ -620,6 +620,7 @@ foreach header : ['crypt.h',
> > +@@ -598,6 +598,7 @@ foreach header : ['crypt.h',
> >                      'linux/btrfs.h',
> >                      'linux/memfd.h',
> >                      'linux/vm_sockets.h',
> > @@ -32,20 +32,21 @@ index 94a16712b..4eabaafe8 100644
> >                      'valgrind/memcheck.h',
> >                      'valgrind/valgrind.h',
> >   diff --git a/src/basic/meson.build b/src/basic/meson.build
> > -index 44cd31ecb..435c6ee02 100644
> > +index 31625b178..0c27528e7 100644
> >   --- a/src/basic/meson.build
> >   +++ b/src/basic/meson.build
> > -@@ -310,6 +310,10 @@ endforeach
> > +@@ -302,6 +302,11 @@ foreach item : [['af',     af_list_txt,     'af',=
         ''],
> > + endforeach
> >
> >    basic_sources +=3D [missing_h] + generated_gperf_headers
> > -
> > ++
> >   +if conf.get('HAVE_PRINTF_H') !=3D 1
> >   +        basic_sources +=3D [files('parse-printf-format.c')]
> >   +endif
> >   +
> > - libbasic =3D static_library(
> > -         'basic',
> > -         basic_sources,
> > + basic_gcrypt_sources =3D files(
> > +         'gcrypt-util.c',
> > +         'gcrypt-util.h')
> >   diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf=
-format.c
> >   new file mode 100644
> >   index 000000000..49437e544
> > @@ -389,12 +390,12 @@ index 000000000..47be7522d
> >   +
> >   +#endif /* HAVE_PRINTF_H */
> >   diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
> > -index dbfafba26..8038380d6 100644
> > +index 73c03274c..30192cd71 100644
> >   --- a/src/basic/stdio-util.h
> >   +++ b/src/basic/stdio-util.h
> > -@@ -20,12 +20,12 @@
> > -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> > - ***/
> > +@@ -1,12 +1,12 @@
> > + /* SPDX-License-Identifier: LGPL-2.1+ */
> > + #pragma once
> >
> >   -#include <printf.h>
> >    #include <stdarg.h>
> > @@ -404,13 +405,13 @@ index dbfafba26..8038380d6 100644
> >    #include "macro.h"
> >   +#include "parse-printf-format.h"
> >
> > - #define xsprintf(buf, fmt, ...) \
> > -         assert_message_se((size_t) snprintf(buf, ELEMENTSOF(buf), fmt=
, __VA_ARGS__) < ELEMENTSOF(buf), "xsprintf: " #buf "[] must be big enough"=
)
> > + #define snprintf_ok(buf, len, fmt, ...) \
> > +         ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
> >   diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
> > -index 73329ba02..70bb9e0e8 100644
> > +index a0621524a..65bcbcd2e 100644
> >   --- a/src/journal/journal-send.c
> >   +++ b/src/journal/journal-send.c
> > -@@ -20,7 +20,6 @@
> > +@@ -2,7 +2,6 @@
> >
> >    #include <errno.h>
> >    #include <fcntl.h>
> > @@ -418,7 +419,7 @@ index 73329ba02..70bb9e0e8 100644
> >    #include <stddef.h>
> >    #include <sys/socket.h>
> >    #include <sys/un.h>
> > -@@ -39,6 +38,7 @@
> > +@@ -21,6 +20,7 @@
> >    #include "stdio-util.h"
> >    #include "string-util.h"
> >    #include "util.h"
> > @@ -427,5 +428,5 @@ index 73329ba02..70bb9e0e8 100644
> >    #define SNDBUF_SIZE (8*1024*1024)
> >
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-=
devices.patch b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-d=
evices.patch
> > similarity index 89%
> > rename from meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-d=
evices.patch
> > rename to meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-dev=
ices.patch
> > index e4421c8..7e37cbc 100644
> > --- a/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices=
.patch
> > +++ b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices=
.patch
> > @@ -1,7 +1,7 @@
> > -From 7b5b34993002b4418ba8a3c2ae661a7337fd8ed0 Mon Sep 17 00:00:00 2001
> > +From 5d8128f3832fd11fd046d1d1ad86c4ee7bc1dff0 Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Wed, 9 Nov 2016 19:41:13 -0800
> > -Subject: [PATCH 05/31] rules: whitelist hd* devices
> > +Subject: [PATCH 4/9] rules: whitelist hd* devices
> >
> >   qemu by default emulates IDE and the linux-yocto kernel(s) use
> >   CONFIG_IDE instead of the more modern libsata, so disks appear as
> > @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >   diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-=
storage.rules
> > -index 0de8cf3a1..d3f58f153 100644
> > +index 8ddb7577c..811e948ad 100644
> >   --- a/rules/60-persistent-storage.rules
> >   +++ b/rules/60-persistent-storage.rules
> >   @@ -7,7 +7,7 @@ ACTION=3D=3D"remove", GOTO=3D"persistent_storage_end"
> > @@ -29,5 +29,5 @@ index 0de8cf3a1..d3f58f153 100644
> >    # ignore partitions that span the entire disk
> >    TEST=3D=3D"whole_disk", GOTO=3D"persistent_storage_end"
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-di=
rectory-configurable.patch b/meta/recipes-core/systemd/systemd/0005-Make-ro=
ot-s-home-directory-configurable.patch
> > similarity index 70%
> > rename from meta/recipes-core/systemd/systemd/0006-Make-root-s-home-dir=
ectory-configurable.patch
> > rename to meta/recipes-core/systemd/systemd/0005-Make-root-s-home-direc=
tory-configurable.patch
> > index 5ba9661..c137087 100644
> > --- a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory=
-configurable.patch
> > +++ b/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory=
-configurable.patch
> > @@ -1,7 +1,7 @@
> > -From 9d63227420f0c4f093c1c2066eafe2b6152070cf Mon Sep 17 00:00:00 2001
> > +From 8b82663aeeedf9ca58e3b97116b4c4da5229e0f5 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Fri, 23 Feb 2018 13:47:37 +0800
> > -Subject: [PATCH 06/31] Make root's home directory configurable
> > +Date: Wed, 27 Jun 2018 16:46:45 +0800
> > +Subject: [PATCH 5/9] Make root's home directory configurable
> >
> >   OpenEmbedded has a configurable home directory for root. Allow
> >   systemd to be built using its idea of what root's home directory
> > @@ -16,15 +16,15 @@ Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >   ---
> > - meson.build       | 8 ++++++++
> > + meson.build       | 7 +++++++
> >    meson_options.txt | 2 ++
> > - 2 files changed, 10 insertions(+)
> > + 2 files changed, 9 insertions(+)
> >
> >   diff --git a/meson.build b/meson.build
> > -index 7347ea880..918101d6b 100644
> > +index 6d5edcb4e..323146fe1 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> > -@@ -94,6 +94,11 @@ if rootlibdir =3D=3D ''
> > +@@ -89,6 +89,11 @@ if rootlibdir =3D=3D ''
> >            rootlibdir =3D join_paths(rootprefixdir, libdir.split('/')[-=
1])
> >    endif
> >
> > @@ -36,7 +36,7 @@ index 7347ea880..918101d6b 100644
> >    # Dirs of external packages
> >    pkgconfigdatadir =3D join_paths(datadir, 'pkgconfig')
> >    pkgconfiglibdir =3D join_paths(libdir, 'pkgconfig')
> > -@@ -205,6 +210,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                 =
            udevlibexecdir)
> > +@@ -210,6 +215,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                 =
            udevlibexecdir)
> >    conf.set_quoted('POLKIT_AGENT_BINARY_PATH',                   join_p=
aths(bindir, 'pkttyagent'))
> >    conf.set_quoted('LIBDIR',                                     libdir=
)
> >    conf.set_quoted('ROOTLIBDIR',                                 rootli=
bdir)
> > @@ -44,7 +44,7 @@ index 7347ea880..918101d6b 100644
> >    conf.set_quoted('ROOTLIBEXECDIR',                             rootli=
bexecdir)
> >    conf.set_quoted('BOOTLIBDIR',                                 bootli=
bdir)
> >    conf.set_quoted('SYSTEMD_PULL_PATH',                          join_p=
aths(rootlibexecdir, 'systemd-pull'))
> > -@@ -221,6 +227,7 @@ substs.set('prefix',                              =
            prefixdir)
> > +@@ -228,6 +234,7 @@ substs.set('prefix',                              =
            prefixdir)
> >    substs.set('exec_prefix',                                     prefix=
dir)
> >    substs.set('libdir',                                          libdir=
)
> >    substs.set('rootlibdir',                                      rootli=
bdir)
> > @@ -52,19 +52,11 @@ index 7347ea880..918101d6b 100644
> >    substs.set('includedir',                                      includ=
edir)
> >    substs.set('pkgsysconfdir',                                   pkgsys=
confdir)
> >    substs.set('bindir',                                          bindir=
)
> > -@@ -2705,6 +2712,7 @@ status =3D [
> > -         'include directory:                 @0@'.format(includedir),
> > -         'lib directory:                     @0@'.format(libdir),
> > -         'rootlib directory:                 @0@'.format(rootlibdir),
> > -+        'roothome directory:                @0@'.format(roothomedir),
> > -         'SysV init scripts:                 @0@'.format(sysvinit_path=
),
> > -         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path=
),
> > -         'PAM modules directory:             @0@'.format(pamlibdir),
> >   diff --git a/meson_options.txt b/meson_options.txt
> > -index 39822d6cd..0b24f0e0f 100644
> > +index 16c1f2b2f..aa9a33368 100644
> >   --- a/meson_options.txt
> >   +++ b/meson_options.txt
> > -@@ -22,6 +22,8 @@ option('rootlibdir', type : 'string',
> > +@@ -9,6 +9,8 @@ option('rootlibdir', type : 'string',
> >           description : '''[/usr]/lib/x86_64-linux-gnu or such''')
> >    option('rootprefix', type : 'string',
> >           description : '''override the root prefix''')
> > @@ -72,7 +64,7 @@ index 39822d6cd..0b24f0e0f 100644
> >   +       description : '''override the root home directory''')
> >    option('link-udev-shared', type : 'boolean',
> >           description : 'link systemd-udev and its helpers to libsystem=
d-shared.so')
> > -
> > + option('link-systemctl-shared', type: 'boolean',
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0005-include-gshadow-onl=
y-if-ENABLE_GSHADOW-is-1.patch b/meta/recipes-core/systemd/systemd/0005-inc=
lude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
> > new file mode 100644
> > index 0000000..6d5faf5
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-EN=
ABLE_GSHADOW-is-1.patch
> > @@ -0,0 +1,29 @@
> > +From a2c4d46944892174930135672508389a04e191f0 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Fri, 29 Jun 2018 13:53:29 +0800
> > +Subject: [PATCH 05/19] include gshadow only if ENABLE_GSHADOW is 1
> > +
> > +Upstream-Status: Inappropriate [musl]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + src/basic/user-util.h | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/basic/user-util.h b/src/basic/user-util.h
> > +index b74f16885..f9c1e29c4 100644
> > +--- a/src/basic/user-util.h
> > ++++ b/src/basic/user-util.h
> > +@@ -2,7 +2,9 @@
> > + #pragma once
> > +
> > + #include <grp.h>
> > ++#if ENABLE_GSHADOW
> > + #include <gshadow.h>
> > ++#endif
> > + #include <pwd.h>
> > + #include <shadow.h>
> > + #include <stdbool.h>
> > +--
> > +2.11.0
> > +
> > diff --git a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-=
group-checking.patch b/meta/recipes-core/systemd/systemd/0006-remove-nobody=
-user-group-checking.patch
> > similarity index 40%
> > rename from meta/recipes-core/systemd/systemd/0027-remove-nobody-user-g=
roup-checking.patch
> > rename to meta/recipes-core/systemd/systemd/0006-remove-nobody-user-gro=
up-checking.patch
> > index 42f59b0..eb6eb8b 100644
> > --- a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-c=
hecking.patch
> > +++ b/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-c=
hecking.patch
> > @@ -1,7 +1,7 @@
> > -From 5354eb767d1eba2ec41eb273f6b657f4a630ca8a Mon Sep 17 00:00:00 2001
> > +From 5199ae5dec9b8a9c9e20477d5090f1732735fbe2 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Tue, 9 Jan 2018 14:45:46 +0800
> > -Subject: [PATCH 27/31] remove nobody user/group checking
> > +Date: Thu, 28 Jun 2018 09:38:12 +0800
> > +Subject: [PATCH 6/9] remove nobody user/group checking
> >
> >   Upstream-Status: Inappropriate [OE Specific]
> >
> > @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >    1 file changed, 37 deletions(-)
> >
> >   diff --git a/meson.build b/meson.build
> > -index f6515e97c..1b947adac 100644
> > +index 323146fe1..3bb087fef 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> > -@@ -700,43 +700,6 @@ substs.set('containeruidbasemax', container_uid_b=
ase_max)
> > +@@ -681,43 +681,6 @@ substs.set('containeruidbasemax', container_uid_b=
ase_max)
> >    nobody_user =3D get_option('nobody-user')
> >    nobody_group =3D get_option('nobody-group')
> >
> > @@ -22,18 +22,18 @@ index f6515e97c..1b947adac 100644
> >   -if getent_result.returncode() =3D=3D 0
> >   -        name =3D getent_result.stdout().split(':')[0]
> >   -        if name !=3D nobody_user
> > --                message('WARNING:\n' +
> > --                        '        The local user with the UID 65534 do=
es not match the configured user name "@0@" of the nobody user (its name is=
 @1@).\n'.format(nobody_user, name) +
> > --                        '        Your build will result in an user ta=
ble setup that is incompatible with the local system.')
> > +-                warning('\n' +
> > +-                        'The local user with the UID 65534 does not m=
atch the configured user name "@0@" of the nobody user (its name is @1@).\n=
'.format(nobody_user, name) +
> > +-                        'Your build will result in an user table setu=
p that is incompatible with the local system.')
> >   -        endif
> >   -endif
> >   -id_result =3D run_command('id', '-u', nobody_user)
> >   -if id_result.returncode() =3D=3D 0
> >   -        id =3D id_result.stdout().to_int()
> >   -        if id !=3D 65534
> > --                message('WARNING:\n' +
> > --                        '        The local user with the configured u=
ser name "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.=
format(nobody_user, id) +
> > --                        '        Your build will result in an user ta=
ble setup that is incompatible with the local system.')
> > +-                warning('\n' +
> > +-                        'The local user with the configured user name=
 "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.format(n=
obody_user, id) +
> > +-                        'Your build will result in an user table setu=
p that is incompatible with the local system.')
> >   -        endif
> >   -endif
> >   -
> > @@ -41,23 +41,23 @@ index f6515e97c..1b947adac 100644
> >   -if getent_result.returncode() =3D=3D 0
> >   -        name =3D getent_result.stdout().split(':')[0]
> >   -        if name !=3D nobody_group
> > --                message('WARNING:\n' +
> > --                        '        The local group with the GID 65534 d=
oes not match the configured group name "@0@" of the nobody group (its name=
 is @1@).\n'.format(nobody_group, name) +
> > --                        '        Your build will result in an group t=
able setup that is incompatible with the local system.')
> > +-                warning('\n' +
> > +-                        'The local group with the GID 65534 does not =
match the configured group name "@0@" of the nobody group (its name is @1@)=
.\n'.format(nobody_group, name) +
> > +-                        'Your build will result in an group table set=
up that is incompatible with the local system.')
> >   -        endif
> >   -endif
> >   -id_result =3D run_command('id', '-g', nobody_group)
> >   -if id_result.returncode() =3D=3D 0
> >   -        id =3D id_result.stdout().to_int()
> >   -        if id !=3D 65534
> > --                message('WARNING:\n' +
> > --                        '        The local group with the configured =
group name "@0@" of the nobody group does not have UID 65534 (it has @1@).\=
n'.format(nobody_group, id) +
> > --                        '        Your build will result in an group t=
able setup that is incompatible with the local system.')
> > +-                warning('\n' +
> > +-                        'The local group with the configured group na=
me "@0@" of the nobody group does not have UID 65534 (it has @1@).\n'.forma=
t(nobody_group, id) +
> > +-                        'Your build will result in an group table set=
up that is incompatible with the local system.')
> >   -        endif
> >   -endif
> >    if nobody_user !=3D nobody_group and not (nobody_user =3D=3D 'nobody=
' and nobody_group =3D=3D 'nogroup')
> > -         message('WARNING:\n' +
> > -                 '        The configured user name "@0@" and group nam=
e "@0@" of the nobody user/group are not equivalent.\n'.format(nobody_user,=
 nobody_group) +
> > +         warning('\n' +
> > +                 'The configured user name "@0@" and group name "@0@" =
of the nobody user/group are not equivalent.\n'.format(nobody_user, nobody_=
group) +
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h=
-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0006-=
src-basic-missing.h-check-for-missing-strndupa.patch
> > similarity index 73%
> > rename from meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-=
check-for-missing-strndupa.patch
> > rename to meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-ch=
eck-for-missing-strndupa.patch
> > index 9f62cbb..107a794 100644
> > --- a/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-=
for-missing-strndupa.patch
> > +++ b/meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-=
for-missing-strndupa.patch
> > @@ -1,11 +1,11 @@
> > -From 33be9052315cc4ec8e929fa238e1f0cc0161ad07 Mon Sep 17 00:00:00 2001
> > +From 03fd19fc87573276e0d359260c8fe591f5f0216a Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 28 Feb 2018 21:15:28 -0800
> > -Subject: [PATCH] src/basic/missing.h: check for missing strndupa
> > +Date: Fri, 29 Jun 2018 16:34:50 +0800
> > +Subject: [PATCH 06/19] src/basic/missing.h: check for missing strndupa
> >
> >   include missing.h  for definition of strndupa
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Inappropriate [musl specific]
> >
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > @@ -13,29 +13,29 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >    meson.build             |  1 +
> >    src/basic/missing.h     | 11 +++++++++++
> >    src/basic/mkdir.c       |  1 +
> > + src/basic/pager.c       |  1 +
> >    src/basic/parse-util.c  |  1 +
> >    src/basic/procfs-util.c |  1 +
> > - src/shared/pager.c      |  1 +
> >    src/shared/uid-range.c  |  1 +
> >    7 files changed, 17 insertions(+)
> >
> >   diff --git a/meson.build b/meson.build
> > -index 4eabaafe8..12811b3f3 100644
> > +index 8c16bc979..a734a295c 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> > -@@ -525,6 +525,7 @@ foreach ident : [
> > -         ['bpf',               '''#include <sys/syscall.h>
> > +@@ -503,6 +503,7 @@ foreach ident : [
> >                                     #include <unistd.h>'''],
> >            ['explicit_bzero' ,   '''#include <string.h>'''],
> > +         ['reallocarray',      '''#include <malloc.h>'''],
> >   +        ['strndupa' ,         '''#include <string.h>'''],
> >    ]
> >
> >            have =3D cc.has_function(ident[0], prefix : ident[1], args :=
 '-D_GNU_SOURCE')
> >   diff --git a/src/basic/missing.h b/src/basic/missing.h
> > -index 84d6d9167..07a8c8364 100644
> > +index 0e33abb9f..02397f1b6 100644
> >   --- a/src/basic/missing.h
> >   +++ b/src/basic/missing.h
> > -@@ -1187,6 +1187,17 @@ struct input_mask {
> > +@@ -1184,6 +1184,17 @@ struct input_mask {
> >    typedef int32_t key_serial_t;
> >    #endif
> >
> > @@ -54,22 +54,34 @@ index 84d6d9167..07a8c8364 100644
> >    #define KEYCTL_JOIN_SESSION_KEYRING 1
> >    #endif
> >   diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> > -index de4746c86..d51518a5a 100644
> > +index 6ab1b4422..77c3e0863 100644
> >   --- a/src/basic/mkdir.c
> >   +++ b/src/basic/mkdir.c
> > -@@ -30,6 +30,7 @@
> > - #include "path-util.h"
> > +@@ -13,6 +13,7 @@
> >    #include "stat-util.h"
> > + #include "stdio-util.h"
> >    #include "user-util.h"
> >   +#include "missing.h"
> >
> > - int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid=
_t gid, bool follow_symlink, mkdir_func_t _mkdir) {
> > + int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid=
_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
> >            struct stat st;
> > +diff --git a/src/basic/pager.c b/src/basic/pager.c
> > +index f24126111..8223bff02 100644
> > +--- a/src/basic/pager.c
> > ++++ b/src/basic/pager.c
> > +@@ -21,6 +21,7 @@
> > + #include "string-util.h"
> > + #include "strv.h"
> > + #include "terminal-util.h"
> > ++#include "missing.h"
> > +
> > + static pid_t pager_pid =3D 0;
> > +
> >   diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> > -index 2c22753de..97533721d 100644
> > +index 6becf8587..52576f536 100644
> >   --- a/src/basic/parse-util.c
> >   +++ b/src/basic/parse-util.c
> > -@@ -33,6 +33,7 @@
> > +@@ -17,6 +17,7 @@
> >    #include "parse-util.h"
> >    #include "process-util.h"
> >    #include "string-util.h"
> > @@ -78,10 +90,10 @@ index 2c22753de..97533721d 100644
> >    int parse_boolean(const char *v) {
> >            assert(v);
> >   diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> > -index 9bb42cc7b..23bbd9e67 100644
> > +index a159e344b..ebc427d6b 100644
> >   --- a/src/basic/procfs-util.c
> >   +++ b/src/basic/procfs-util.c
> > -@@ -9,6 +9,7 @@
> > +@@ -11,6 +11,7 @@
> >    #include "procfs-util.h"
> >    #include "stdio-util.h"
> >    #include "string-util.h"
> > @@ -89,23 +101,11 @@ index 9bb42cc7b..23bbd9e67 100644
> >
> >    int procfs_tasks_get_limit(uint64_t *ret) {
> >            _cleanup_free_ char *value =3D NULL;
> > -diff --git a/src/shared/pager.c b/src/shared/pager.c
> > -index 75db3c985..84f06bf7d 100644
> > ---- a/src/shared/pager.c
> > -+++ b/src/shared/pager.c
> > -@@ -39,6 +39,7 @@
> > - #include "string-util.h"
> > - #include "strv.h"
> > - #include "terminal-util.h"
> > -+#include "missing.h"
> > -
> > - static pid_t pager_pid =3D 0;
> > -
> >   diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
> > -index c38b7cc98..8ec6bf08d 100644
> > +index 434ce6ff4..37093ab7b 100644
> >   --- a/src/shared/uid-range.c
> >   +++ b/src/shared/uid-range.c
> > -@@ -25,6 +25,7 @@
> > +@@ -8,6 +8,7 @@
> >    #include "macro.h"
> >    #include "uid-range.h"
> >    #include "user-util.h"
> > @@ -114,5 +114,5 @@ index c38b7cc98..8ec6bf08d 100644
> >    static bool uid_range_intersect(UidRange *range, uid_t start, uid_t =
nr) {
> >            assert(range);
> >   --
> > -2.13.0
> > +2.11.0
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_=
ether.h.patch b/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_e=
ther.h.patch
> > similarity index 68%
> > rename from meta/recipes-core/systemd/systemd/0017-Include-netinet-if_e=
ther.h.patch
> > rename to meta/recipes-core/systemd/systemd/0007-Include-netinet-if_eth=
er.h.patch
> > index a09cfdd..2df8cf9 100644
> > --- a/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h=
.patch
> > +++ b/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h=
.patch
> > @@ -1,14 +1,14 @@
> > -From f2b0173cd9807864db1ef3b102abaa76ef37e506 Mon Sep 17 00:00:00 2001
> > +From aab90d0dfa934d33879eaec1a878e93b201d33f1 Mon Sep 17 00:00:00 2001
> >   From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 28 Feb 2018 21:19:12 -0800
> > -Subject: [PATCH 17/31] Include netinet/if_ether.h
> > +Date: Fri, 29 Jun 2018 16:44:43 +0800
> > +Subject: [PATCH 07/19] Include netinet/if_ether.h
> >
> >   Fixes
> >   /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8:=
 error: redefinition of 'struct ethhdr'
> >

