Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0A28E60229
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 11:11:12 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r124so8218218pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6GkjtfPi65uIvuoZRyGtEnG8n6QTX9hHFQeHQyd0fC4=;
	b=OCX6zQMb6py96KQUjYoOjdg+ZJCAQO06bkdBbmOd8sAN3Ih2QPGfPLWAeo3AIeqTMI
	F3VQ5r0yKIoa1kS78+847CRrBwPR5uh1wOBAF48QnTfbDaw6sB5AHNhaAylVEU2reFk7
	DGumdJXV+qbVQGsZKu65sCLuvRWRn/xI4a6CTgzjSWxLqb2puMA64ZlGsp6ThqvO8aO4
	2xlkpXA7ON/QPYPr4hUFk+UL2OqmYEoF2a3M9/zNW0Z9yIJm23qofZEBXsOgU3NT4i4T
	S3jfc1r4qhlYGHBUlZe5xZJAQKJ84WtdaSCEfgy2Pz3m7IPeZoOvsGDQyE9pR5WUT5G4
	DSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6GkjtfPi65uIvuoZRyGtEnG8n6QTX9hHFQeHQyd0fC4=;
	b=iO2PtCyGxvpkD16sZtwqXKxKlMBPNUrLWh+709nIp2n4jRzMM09Mu+ArKzCYvFG0Gk
	7LsTa38GQsoSVaJWuuKRPlNpSGf1npiAgSL2YUzVieTY3KZg+g3ceTM5/LabaNA/ayk8
	DoQCfruPRoKUCJh+b2z+UIpyhICHLRYgjE/1Ax8wCw0JtdkRup1/f6exlU0GEGkhE6Kc
	356S4LcwHFhE83nKKqkJH4A6ux5GgQ/Za3QEUI7ZzvfwBeR8E3xxFun+BvjDCkl2KhAy
	sdfLHNcaIVTeNeLL9+Urp4Xi4vtL77HeOZHlgXvfjekeqOytIBxZtJeydipA180c99Tw
	JmkA==
X-Gm-Message-State: APjAAAVHoIOaEC7qasnCeUiJmohR2xi6++56YiYPS9Yge7Uue1o7+hz9
	WyZeZqzfB+sNv31RXHjBEDGtTQRo
X-Google-Smtp-Source: APXvYqyr8gRGuqORsw1nS5c1ZYlaaEBV8U2ASoaSRVRouijWODme6ZXJQ2LBNoMs6pkVA6CITZPZOQ==
X-Received: by 2002:a17:902:be0e:: with SMTP id
	r14mr9284288pls.129.1552734673624; 
	Sat, 16 Mar 2019 04:11:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d808:e267:248a:2bbb?
	([2601:202:4180:c33:d808:e267:248a:2bbb])
	by smtp.gmail.com with ESMTPSA id s4sm7737154pfe.16.2019.03.16.04.11.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 04:11:13 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
	<CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
Date: Sat, 16 Mar 2019 04:11:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
Subject: Re: [oe-commits] [openembedded-core] branch thud updated (ad0a553 -> 748f946)
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
X-List-Received-Date: Sat, 16 Mar 2019 11:11:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/15/19 10:24 AM, Andreas M=C3=BCller wrote:
> Replied to wrong mailing
>
> On Wed, Feb 6, 2019 at 5:38 PM <git@git.openembedded.org> wrote:
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a change to branch thud
>> in repository openembedded-core.
>>
>>     from ad0a553  build-appliance-image: Update to thud head revision
>>      add 0bbe3d5  kernel: use olddefconfig as the primary target for K=
ERNEL_CONFIG_COMMAND
>>      add 933712e  linux-yocto/4.18: update to v4.18.22
>>      add 193eb75  icecc: readlink -f on the recipe-sysroot gcc/g++
>>      add 57673fe  icecc: Trivial simplification
>>      add d4ec470  icecc: Syntax error meant that we weren't waiting fo=
r tarball generation
>>      add 46db052  icecc: Don't generate recipe-sysroot symlinks at rec=
ipe-parsing time
>>      add 9d3587d  icecc: patchelf is needed by icecc-create-env
>>      add d8bf7e5  eudev: upgrade 3.2.5 -> 3.2.7
>>      add a316146  gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
>>      add 88581ac  libatomic-ops: upgrade 7.6.6 -> 7.6.8
>>      add 7c6e9f5  libpng: upgrade 1.6.35 -> 1.6.36
>>      add be1429b  common-licenses: update Libpng license text
>>      add 93c76fe  i2c-tools: upgrade 4.0 -> 4.1
>>      add b09f261  oeqa/utils/qemurunner: Print output when failed to l=
ogin
>>      add 47731b4  grub2: Fix passing null to printf formats
>>      add e3ef28a  gnupg: Upgrade to 2.2.12 release
>>      add a44c7ba  tzdata/tzcode-native: update to 2018i
>>      add 4a7945c  lighttpd: update to 1.4.51
>>      add 4f14eac  boost: update to 1.69.0
> In my infinite naivety I just updated thud.
>
> * Many updates here - wasn't there some policy just to update in case
> of 'emergency'?
Nope the process does not say that. I will update recipes when they
bugfix updates.=C2=A0 I have been doing that for years. In fact, you shou=
ld
be seeing something on the arch list to make the process standard.
> * How can you update boost on a stable branch - a first class citizen
> for build trouble?
Don't recall the thought process on a given backport especial when its 3
months back. Can't tell why I decided to update boost.

- armin

> Wonder which further fallout I'll get...
>
> Andreas
>>      add 70e942e  oeqa/utils/qemurunner: set timeout to 60s for run_se=
rial
>>      add 1f3577f  libsndfile1: Security fix CVE-2017-17456/17457 CVE-2=
018-19661/19662
>>      add 86a4eca  binutils: Fix build with clang
>>      add 2c12e1d  oeqa: Fix for QEMU_USE_KVM
>>      add 30b68e8  nativesdk-*-provides-dummy: Fixes to allow correct o=
peration with opkg
>>      add f57d83c  sstate: add support for caching shared workdir tasks=

>>      add 284252d  package.bbclass: fix python unclosed file ResourceWa=
rning
>>      add f51e59b  scripts/oe-git-archive: fix non-existent key referen=
cing error
>>      add 2bb4774  toolchain-scripts: run post-relocate scripts for eve=
ry environment
>>      add 9841962  patch: reproducibility: Fix host umask leakage
>>      add 694d62e  kernel: don't assign the build user/host
>>      add 778f33d  classes: Correctly markup regex strings
>>      add bfd7257  testimage: Remove duplicate dependencies
>>      add 16c9002  testimage: Simplfy DEFAULT_TEST_SUITES logic
>>      add 7dce356  testimage: Further cleanup DEFAULT_TEST_SUITES
>>      add 1da4c2e  testimage: Enable autorunning of the package manager=
 testsuites
>>      add ab49891  testimage: Add support for slirp
>>      add 0469c75  testimage: Add possibility to pass parmeters to qemu=

>>      add 51423c3  testimage.bbclass: remove boot parameter systemd.log=
_target
>>      add 5fedb01  meta/classes/testimage.bbclass: Only validate IMAGE_=
FSTYPES when is QEMU
>>      add 310a2b1  oeqa: make it work for multiple users
>>      add d082852  classes/testsdk: Split implementation into classes
>>      add 4b5a4b7  runqemu: clean up subprocess usage
>>      add 79471a2  runqemu-gen-tapdevs: Allow run --help without sudo
>>      add a916a92  wic: sdimage-bootpart: Use mmcblk0 drive instead of =
bogus mmcblk
>>      add 27b9008  binutils: Upgrade to latest on 2.31 release branch
>>      add f829801  binutils: bfd doesn't handle ELF compressed data ali=
gnment
>>      add 601f870  oeqa/runtime/cases: Improve test dependency informat=
ion
>>      add e65d168  oeqa/runtime/cases: Improve dependencies of kernel/g=
cc/build tests
>>      add c3d51e9  oeqa/qemu & runtime: qemu do not need ip input from =
external
>>      add 63f0ce0  oeqa/manual/bsp-qemu.json: Update for QEMU_USE_KVM
>>      add ffea871  oeqa/selftest/runqemu: Enable kvm when QEMU_USE_KVM =
is set
>>      add 34efb67  oeqa/utils/buildproject: Only clean files if we've d=
one something
>>      add e35ced7  kernel.bbclass: Fix incorrect deploying of fitimage.=
initramfs
>>      add 7800f42  linux-yocto/4.18: update to v4.18.25
>>      add aee9c2c  systemd-systemctl-native: handle Install wildcards
>>      add f2c5e46  systemd: backport fix to stop enabling ECN
>>      add 9a78a88  systemd: fix compile error for x32
>>      add 82cb42d  systemd: Fix memory use after free errors
>>      add 925113c  systemd: backport a patch to fix meson 0.49.0 issue
>>      add 1bd93c6  systemd: Add PACKAGECONFIG for gnutls
>>      add 2da88ec  meta: remove True option to getVar calls (again)
>>      add 419aaf6  systemd: Correct and clean up user/group definitions=

>>      add 86de2bf  systemd: Correct a conditional add to SYSTEMD_PACKAG=
ES
>>      add 403e74b  systemd: Security fix CVE-2018-16864
>>      add d5d2b82  systemd: Security fix CVE-2018-16865
>>      add 5e4d9fd  systemd: Security fix CVE-2018-16866
>>      add 6a5cce8  eSDK.py: avoid error in tearDownClass due to race co=
ndistion
>>      add 748f946  eSDK.py: unset BBPATH and BUILDDIR to avoid eSDK fai=
lure
>>
>> No new revisions were added by this update.
>>
>> Summary of changes:
>>  meta/classes/clutter.bbclass                       |   4 +-
>>  meta/classes/cmake.bbclass                         |   2 +-
>>  meta/classes/icecc.bbclass                         |  72 ++---
>>  meta/classes/insane.bbclass                        |  16 +-
>>  meta/classes/kernel.bbclass                        |   9 +-
>>  meta/classes/license_image.bbclass                 |  14 +-
>>  meta/classes/package.bbclass                       |   3 +-
>>  meta/classes/patch.bbclass                         |   1 +
>>  meta/classes/perl-version.bbclass                  |   2 +-
>>  meta/classes/sstate.bbclass                        |   6 +
>>  meta/classes/systemd.bbclass                       |   2 +-
>>  meta/classes/testimage.bbclass                     |  74 ++---
>>  meta/classes/testsdk.bbclass                       | 217 +-----------=
--
>>  meta/classes/toolchain-scripts.bbclass             |  46 +--
>>  meta/classes/update-alternatives.bbclass           |   2 +-
>>  meta/classes/useradd-staticids.bbclass             |   4 +-
>>  meta/files/common-licenses/Libpng                  | 200 +++++++-----=
-
>>  meta/lib/oe/types.py                               |  24 ++
>>  meta/lib/oeqa/core/target/qemu.py                  |   5 +-
>>  meta/lib/oeqa/manual/bsp-qemu.json                 |   4 +-
>>  meta/lib/oeqa/runtime/cases/buildcpio.py           |   9 +-
>>  meta/lib/oeqa/runtime/cases/buildgalculator.py     |   9 +-
>>  meta/lib/oeqa/runtime/cases/buildlzip.py           |  12 +-
>>  meta/lib/oeqa/runtime/cases/date.py                |   2 +
>>  meta/lib/oeqa/runtime/cases/df.py                  |   2 +
>>  meta/lib/oeqa/runtime/cases/gcc.py                 |  19 +-
>>  meta/lib/oeqa/runtime/cases/kernelmodule.py        |   8 +-
>>  meta/lib/oeqa/runtime/cases/opkg.py                |   4 +-
>>  meta/lib/oeqa/runtime/cases/ptest.py               |   2 +
>>  meta/lib/oeqa/runtime/cases/python.py              |   8 +-
>>  meta/lib/oeqa/runtime/cases/rpm.py                 |  31 +-
>>  meta/lib/oeqa/runtime/cases/scp.py                 |   2 +
>>  meta/lib/oeqa/runtime/cases/ssh.py                 |   2 +
>>  meta/lib/oeqa/runtime/cases/stap.py                |   6 +-
>>  meta/lib/oeqa/runtime/cases/xorg.py                |   2 +
>>  meta/lib/oeqa/runtime/context.py                   |   7 +-
>>  meta/lib/oeqa/sdk/testsdk.py                       | 142 +++++++++
>>  meta/lib/oeqa/sdkext/testsdk.py                    | 104 +++++++
>>  meta/lib/oeqa/selftest/cases/eSDK.py               |   8 +-
>>  meta/lib/oeqa/selftest/cases/runqemu.py            |   5 +
>>  meta/lib/oeqa/targetcontrol.py                     |  12 +-
>>  meta/lib/oeqa/utils/buildproject.py                |   5 +
>>  meta/lib/oeqa/utils/dump.py                        |   2 +-
>>  meta/lib/oeqa/utils/qemurunner.py                  |   3 +-
>>  meta/lib/oeqa/utils/qemutinyrunner.py              |   2 +-
>>  .../0001-grub-setup-Debug-message-cleanup.patch    |  34 +++
>>  meta/recipes-bsp/grub/grub2.inc                    |   1 +
>>  meta/recipes-core/meta/dummy-sdk-package.inc       |   4 +-
>>  .../meta/nativesdk-buildtools-perl-dummy.bb        |  22 +-
>>  .../meta/nativesdk-sdk-provides-dummy.bb           |   1 -
>>  .../recipes-core/meta/target-sdk-provides-dummy.bb |  27 ++
>>  meta/recipes-core/systemd/systemd-boot_239.bb      |   3 +-
>>  .../systemd/systemd-systemctl/systemctl            |  15 +-
>>  ...tl.d-request-ECN-on-both-in-and-outgoing-.patch |  36 +++
>>  .../0001-meson-rename-Ddebug-to-Ddebug-extra.patch |  45 +++
>>  ...l-Don-t-pass-null-directive-argument-to-s.patch |  31 ++
>>  ...ync-changes-type-of-drift_freq-to-int64_t.patch |  49 +++
>>  ...Fix-use-after-free-case-in-load_from_path.patch |  43 +++
>>  ...-not-store-the-iovec-entry-for-process-co.patch | 204 ++++++++++++=
+
>>  ...ld-set-a-limit-on-the-number-of-fields-1k.patch |  56 ++++
>>  ...ote-set-a-limit-on-the-number-of-fields-i.patch |  84 ++++++
>>  .../0027-journal-fix-syslog_parse_identifier.patch |  77 +++++
>>  ...not-remove-multiple-spaces-after-identifi.patch |  84 ++++++
>>  meta/recipes-core/systemd/systemd_239.bb           |  35 ++-
>>  .../udev/{eudev_3.2.5.bb =3D> eudev_3.2.7.bb}        |   4 +-
>>  meta/recipes-devtools/binutils/binutils-2.31.inc   |  11 +-
>>  ...check-for-input-file-matching-output-file.patch |  59 ----
>>  ...location-where-GOT-information-is-collect.patch | 201 ------------=
-
>>  ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  38 ---
>>  ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  46 ---
>>  ...tion-was-still-being-generated-when-symbo.patch |  40 ---
>>  ...compressed-header-alignment-correctly-by-.patch | 332 ++++++++++++=
+++++++++
>>  ...ignment-of-uncompressed-section-from-ch_a.patch | 200 ++++++++++++=
+
>>  .../binutils/binutils/CVE-2018-17358.patch         |  37 +--
>>  .../binutils/binutils/CVE-2018-17360.patch         |  24 +-
>>  .../binutils/binutils/CVE-2018-18309.patch         |  87 +-----
>>  .../binutils/binutils/CVE-2018-18605.patch         |  20 +-
>>  .../binutils/binutils/CVE-2018-18606.patch         |  22 +-
>>  .../binutils/binutils/CVE-2018-18607.patch         |  25 +-
>>  .../binutils/binutils/clang-bfd-fix.patch          |  30 ++
>>  ...s-eeprog-Module.mk-Add-missing-dependency.patch |  32 --
>>  ...01-lib-Module.mk-Add-missing-dependencies.patch |  37 ---
>>  ...-tools-Module.mk-Add-missing-dependencies.patch |  66 ----
>>  .../i2c-tools/files/remove-i2c-dev.patch           |  98 ------
>>  .../{i2c-tools_4.0.bb =3D> i2c-tools_4.1.bb}         |   8 +-
>>  .../python/python-native_2.7.15.bb                 |   2 +-
>>  .../python/python3-native_3.5.6.bb                 |   2 +-
>>  meta/recipes-devtools/rpm/rpm_4.14.2.bb            |   6 +-
>>  .../{lighttpd_1.4.50.bb =3D> lighttpd_1.4.51.bb}     |   4 +-
>>  ...code-native_2018g.bb =3D> tzcode-native_2018i.bb} |   8 +-
>>  .../tzdata/{tzdata_2018g.bb =3D> tzdata_2018i.bb}    |   4 +-
>>  ...28.0.bb =3D> gsettings-desktop-schemas_3.28.1.bb} |   4 +-
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |   6 +-
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |   8 +-
>>  meta/recipes-kernel/linux/linux-yocto_4.18.bb      |  20 +-
>>  .../libpng/{libpng_1.6.35.bb =3D> libpng_1.6.36.bb}  |   8 +-
>>  ...-a-ulaw-fix-multiple-buffer-overflows-432.patch | 101 +++++++
>>  .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
>>  ...bjam-native_1.68.0.bb =3D> bjam-native_1.69.0.bb} |   0
>>  .../boost/{boost-1.68.0.inc =3D> boost-1.69.0.inc}   |   4 +-
>>  meta/recipes-support/boost/boost.inc               |   1 -
>>  ...-arch-instruction-set-flags-we-do-that-o.patch} |  23 +-
>>  ...ucibility-add-file-directive-to-assembler.patch | 243 ------------=
---
>>  .../boost/{boost_1.68.0.bb =3D> boost_1.69.0.bb}     |   6 +-
>>  ...c-use-a-custom-value-for-the-location-of-.patch |   6 +-
>>  meta/recipes-support/gnupg/gnupg/relocate.patch    |   2 +-
>>  .../gnupg/{gnupg_2.2.11.bb =3D> gnupg_2.2.12.bb}     |   4 +-
>>  ...batomic-ops_7.6.6.bb =3D> libatomic-ops_7.6.8.bb} |  10 +-
>>  scripts/lib/wic/canned-wks/sdimage-bootpart.wks    |   4 +-
>>  scripts/oe-git-archive                             |  19 +-
>>  scripts/runqemu                                    |  63 ++--
>>  scripts/runqemu-gen-tapdevs                        |  27 +-
>>  112 files changed, 2263 insertions(+), 1706 deletions(-)
>>  create mode 100644 meta/lib/oeqa/sdk/testsdk.py
>>  create mode 100644 meta/lib/oeqa/sdkext/testsdk.py
>>  create mode 100644 meta/recipes-bsp/grub/files/0001-grub-setup-Debug-=
message-cleanup.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-sysc=
tl.d-request-ECN-on-both-in-and-outgoing-.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-renam=
e-Ddebug-to-Ddebug-extra.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-sysctl-Don-=
t-pass-null-directive-argument-to-s.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-timesync-ch=
anges-type-of-drift_freq-to-int64_t.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0002-core-Fix-us=
e-after-free-case-in-load_from_path.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do=
-not-store-the-iovec-entry-for-process-co.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-se=
t-a-limit-on-the-number-of-fields-1k.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-rem=
ote-set-a-limit-on-the-number-of-fields-i.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix=
-syslog_parse_identifier.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0028-journal-do-=
not-remove-multiple-spaces-after-identifi.patch
>>  rename meta/recipes-core/udev/{eudev_3.2.5.bb =3D> eudev_3.2.7.bb} (9=
5%)
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-impro=
ve-check-for-input-file-matching-output-file.patch
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refac=
tored-location-where-GOT-information-is-collect.patch
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0019-Impro=
ved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-=
sure-global-symbol-is-not-an-indirect-or-warnin.patch
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-i=
nformation-was-still-being-generated-when-symbo.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/0022-Handl=
e-ELF-compressed-header-alignment-correctly-by-.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/0023-gold-=
Get-alignment-of-uncompressed-section-from-ch_a.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/clang-bfd-=
fix.patch
>>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-i2c-too=
ls-eeprog-Module.mk-Add-missing-dependency.patch
>>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-lib-Mod=
ule.mk-Add-missing-dependencies.patch
>>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-tools-M=
odule.mk-Add-missing-dependencies.patch
>>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/remove-i2c-d=
ev.patch
>>  rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.0.bb =3D> i2c-too=
ls_4.1.bb} (77%)
>>  rename meta/recipes-extended/lighttpd/{lighttpd_1.4.50.bb =3D> lightt=
pd_1.4.51.bb} (96%)
>>  rename meta/recipes-extended/tzcode/{tzcode-native_2018g.bb =3D> tzco=
de-native_2018i.bb} (70%)
>>  rename meta/recipes-extended/tzdata/{tzdata_2018g.bb =3D> tzdata_2018=
i.bb} (98%)
>>  rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-deskto=
p-schemas_3.28.0.bb =3D> gsettings-desktop-schemas_3.28.1.bb} (70%)
>>  rename meta/recipes-multimedia/libpng/{libpng_1.6.35.bb =3D> libpng_1=
=2E6.36.bb} (74%)
>>  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/000=
1-a-ulaw-fix-multiple-buffer-overflows-432.patch
>>  rename meta/recipes-support/boost/{bjam-native_1.68.0.bb =3D> bjam-na=
tive_1.69.0.bb} (100%)
>>  rename meta/recipes-support/boost/{boost-1.68.0.inc =3D> boost-1.69.0=
=2Einc} (85%)
>>  rename meta/recipes-support/boost/boost/{0003-Don-t-set-up-arch-instr=
uction-set-flags-we-do-that-o.patch =3D> 0001-Don-t-set-up-arch-instructi=
on-set-flags-we-do-that-o.patch} (93%)
>>  delete mode 100644 meta/recipes-support/boost/boost/reproducibility-a=
dd-file-directive-to-assembler.patch
>>  rename meta/recipes-support/boost/{boost_1.68.0.bb =3D> boost_1.69.0.=
bb} (56%)
>>  rename meta/recipes-support/gnupg/{gnupg_2.2.11.bb =3D> gnupg_2.2.12.=
bb} (92%)
>>  rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.6.bb =3D=
> libatomic-ops_7.6.8.bb} (61%)
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits



