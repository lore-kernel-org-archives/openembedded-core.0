Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.599.1795034964427307104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=PydZgtG+;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364648ae07so15986741cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034963; x=1795639763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNhyt7Ypc9N2UPH7RCgAFk4aQi9m+Y4s/ysaDDorStc=;
        b=PydZgtG+Y/LSsoPQxP3eOMCta1ckwaTL8AAhBewmDVu7vX7Bxe6P+OTX8TQYs2GqA6
         7FkegAgU/OAeGLYAsAsXHaCyrWfMMd9EkTPT71IEt4Tl8Il05fEOd1k7lfIIs5zUExbs
         6dl10LdF8TuyYEQR8U+U3IddC343wsarIuFD01kBzlYT4I9d9qfsBLwHhnsiLPUvPFMr
         O5qGJHaEgRuYsGqxTWqqAbT29uV7xuKt74QyKFo1qGA8XI1qYdmJRWx9nvCsnMejAbGT
         yYPT4u5+70TOgT41C9nO6TKr0S61HXPJ9UBeDhiE+sYaw36tzQJ+VARErjAaE5n0/cOz
         lLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034963; x=1795639763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNhyt7Ypc9N2UPH7RCgAFk4aQi9m+Y4s/ysaDDorStc=;
        b=mgEbaRWbxE+phn8ZvNewGO+KIjcznRerKU01vtTJwc+gsXMBzvCyVVvuEkpVdy6sKD
         QEGQ+4VdmuQYa/kRqBcA/RHbnaKOMilHGIg4kShVK8d9/0OlLB32XgnutKxc5RNiBx2c
         +qmY0ijcHf2tRJn9d0VlzxYmTAstrNwbu2T0rAWJaHg5Bmafen7b1QtojgW6j7tstFMI
         3LDRSbD/6EGb2nEz6DJuV1ofjTxMHPHzPeQhezM97Fn998qb/4GtxtTZerzRiGCTIBA6
         FvC/qmHZQajHscfEYRCXt7P0dVcGekadm0orUH9kyB/aZIBkenWp7MSDac3I8jieX0yN
         p2Wg==
X-Gm-Message-State: APuU4Z8byrY4XuW/X1GsZC25eMJTGHiAz4MLpHr/wha4XJTn15gzemWc
	ufEAEv86Lvwoi5COcDmZ/ftxL2jlI9iv6pn72ndS5sfDGw7AJ1irNvszAcIiyx2MOpxlnCvwo7y
	l3znL
X-Gm-Gg: AYBFou2HSTpPOJaKNOmi7vKi4urjqV11zyGCXiny9h3UUd4Fc+FTJKhlEiogLmnAkv1
	BWTcgrpy4BA3Op25cBBeybM22umoYfyR0DZDV/LCYL2YFqHj0EijG5sWKD6V+gSXpG5d8BPQ5/f
	ZkNsKLQmH3IOnsv+K1dpxtWRO+rWZcL5XRKmESaZXNvc3Q/g7sIQjEAI40JPkdOGdX84ccUCJ2s
	p42P7F6x4MRxsHH/xIPMl+d5sIRfeqc9Kvtv0IuSqlMwubOrre51bnK97a+KkBQHOOE2bqwAnoJ
	uy87mMxhjgiembGHk8+/rb7mF7w+4h3ejHVAdh/DIFaRznpcrZMELiEZ3jbwjdKtmz3sQexDthu
	3IfPeZal6nN6jy4/fQdKrqB/VvOyeuSHLiTC2wywbm9pFX0jnEVMJaENPiu3257vHWH0c0MVAcN
	SPzQWlsmrHoeyUKXcxuT8fMr0A12BUilmsjbV7QtguI5SvYLiSuufAgh+YcXz0UJTxn0qx7NAAl
	LAdbCiDMpxDUqC5L32O2AXP7lHepeuc9MnHCiwXk0z+XzWsAxoUofffyPgG+/87/VLBy1506C+s
	xmMojVcTyQPg2WpfTwagYYJTjxCga5jLdpncMVjf+kbz+UdT7/jiMXc8khjQYU3BS3hiE4XXpsN
	VhVG+EQ==
X-Received: by 2002:a05:622a:2589:b0:535:2283:20a3 with SMTP id d75a77b69052e-55d5a547566mr54887061cf.33.1795034962778;
        Wed, 18 Nov 2026 12:49:22 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:22 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 00/12] riscv: add new ISA extensions, profiles, and selftests
Date: Wed, 18 Nov 2026 15:48:41 -0500
Message-ID: <20261118204853.2155173-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250583
Content-Type: text/plain; charset="utf-8"

Note: This series is based on an earlier set of RFCs, of which v2 can be found
at [1]. The changes here are also found in my contrib branch at [2]. I've been
reviewing this myself and throwing an LLM at it for feedback, and I believe it's
mature enough now compared to the initial versions that others ought to take
another look, so please let me know what you think.

# Overview

Support for the RISC-V architecture and a basic set of extensions has been
available in oe-core for a long time now, and as of late 2025, QEMU defaults to
the RVA23S64 profile when booting qemuriscv64 images. However, at the userspace
level, we currently support only the standard "riscv64gc" profile (behind a
generic "riscv64" identifier), which is common across the wider open-source
ecosystem, but lacks many of the features which are starting to become necessary
for more advanced experimentation and testing on RISC-V platforms. This series
aims to remedy that by introducing several changes across a handful of files. 

Compared to the previous RFCs, the following changes were submitted and accepted
separately:
  1. tune-riscv: be explicit about riscv32gc, riscv64gc defaults
  2. tune-riscv.inc: add 'riscv64gcv' tune

The patches here do the following, while trying to follow similar design
decisions made for x86-64 and ARM in oe-core:

1. Adopt a new 'RISCVPKGARCH' variable (like 'ARMPKGARCH') which should be set
for any new custom tune files, especially those that happen to have very
complicated/non-standard extension sets
2. Add 'rva20u64', 'rva22u64', and 'rva23u64' tunes along with all extensions
they mandate to arch-riscv.inc
3. Extend lib/oe/tune.py with a RISCV_PROFILES list, which is used to test and
shorten extension strings for build paths
4. Add two new sets of selftests:
  a. lib/oeqa/selftest/cases/oelib/tune.py, for testing the code in
  lib/oe/tune.py
  b. lib/oeqa/selftest/cases/riscvtunes.py, for testing the various RISC-V
  tunings themselves. This includes an "unusual tunes" test where libgcc-initial
  is built for a handful of nonstandard extension combinations, so it's a bit
  heavier.
5. Allow 'superset' package archs to install packages built for subset tunings
6. Extend rust-target-config.bbclass so that it handles all of the extensions
(avoiding a scenario where a build would target e.g. rva23u64 but Rust-based
packages would still build against riscv64gc), and add a selftest for that
7. Report an error and provide a suggestion to the user when a tuning exceeds
the allowable length of a package arch (i.e. set RISCVPKGARCH with a proper tune
name, instead of letting the whole extension string hit the path)

The last entry is possibly the most significant one compared to earlier
revisions of this work - it's now a much simpler and more 'strict' solution to
the extension string length problem discussed in the RFC. Specifically, earlier
attempts were made to try and support a very flexible "set any extension string
you want" approach for users to experiment with, using a bitmask and/or hashing
function to shorten the string for build/sstate paths. However, this required a
lot of extra code to be maintained (including extra selftests) with essentially
the only gain being to allow tunes to be set on-the-fly in local.conf, and it
also meant that build paths became more obscure in order to keep their naming
short. For example, a tuning for the SpacemiT X60 tune would have 'readable' and
'hashed' names like:

|readable: rva22u64_v_zbc_zfh_zicond_zifencei_zihpm_zvfh_zvkt
|hashed: rva22u64_0x089e3d7dd8

After discussion in a recent technical call, this seems best suited to inclusion
in the meta-riscv layer (if we feel it's needed at all). For now, This series
(and a corresponding meta-riscv PR to add BSP-specific tunings) should be
sufficient with its 'strict' tunes. The new profiles with explicit tunes get
build paths in the TMPDIR like:

|rva20u64_zifencei
|rva22u64_zifencei
|rva23u64_zifencei

## Implementation, and Relation to meta-riscv

With this series in, oe-core will support all **mandated** extensions for all
ratified profiles up to and including RVA23, according to the spec in [3], but
not optional/development/expansion options. Some of these will be incorporated
in the aforementioned companion PR [4], which will add 'spacemit-x60' and
'spacemit-x100' tunes along with corresponding selftests. Those extensions may
be worth moving to oe-core as well eventually (especially if many future boards
and/or profiles mandate them), but for now I think the mandated extension sets
are enough to manage. 

The selftests have been designed largely with Claude Code Opus 5.5, with the
goal of helping us track any changes that may occur over time with toolchains or
variable/logic changes in oe-core. That being said, I doubt the profiles
themselves will change, so setting things like RISCV_PROFILES in tune.py should
be stable. With riscvtunes.py, the objective is to ensure that the tune files
themselves follow a consistent standard, which means that changes will need to
be made there in the future if we alter the way different architectures' tunings
are defined. Also worth noting that, compared to the RFC versions, the selftest
suites have been expanded significantly - the initial versions were very 'thin'
and often only covered a few cases at most, so I've made a point to increase the
variety of asserts running in each test to handle more edge cases.

For now, the default tuning for qemuriscv64 remains 'riscv64gc', so there are
still no explicit consumers of the new profiles in oe-core. They can be enabled
easily by setting DEFAULTTUNE in local.conf when building for qemuriscv64, e.g.
`DEFAULTTUNE = 'rva23u64'`. They **are** consumed by two new BSP-specific
tunings added in [4]. qemuriscv32 and the 'riscv32gc' tuning have been mostly
untouched by this series, other than to provide some selftests.

## Testing

### Selftests

oe-selftest -r oelib.tune:

|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_abbreviation: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_duplicates: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_explicit: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_multi_letter_prefixes: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_not_riscv: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_profile: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_profile_sizes: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_rva22u64_additions: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_rva23u64_additions: PASSED (0.00s)
|2026-11-18 15:25:02,172 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_separators: PASSED (0.00s)
|2026-11-18 15:25:02,173 - oe-selftest - INFO - SUMMARY:
|2026-11-18 15:25:02,173 - oe-selftest - INFO - oe-selftest () - Ran 10 tests in 5.167s
|2026-11-18 15:25:02,173 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=10, skipped=0, failures=0, errors=0)

oe-selftest -r riscvtunes:

|2026-11-18 15:30:51,286 - oe-selftest - INFO - RESULTS:
|2026-11-18 15:30:51,287 - oe-selftest - INFO - RESULTS - riscvtunes.RiscvTunesTests.test_riscv_default_tunes: PASSED (12.07s)
|2026-11-18 15:30:51,287 - oe-selftest - INFO - RESULTS - riscvtunes.RiscvTunesTests.test_riscv_pkgarch_fallback: PASSED (2.01s)
|2026-11-18 15:30:51,287 - oe-selftest - INFO - RESULTS - riscvtunes.RiscvTunesTests.test_riscv_profile_ccargs: PASSED (3.16s)
|2026-11-18 15:30:51,287 - oe-selftest - INFO - RESULTS - riscvtunes.RiscvTunesTests.test_riscv_rust_target_features: PASSED (32.90s)
|2026-11-18 15:30:51,287 - oe-selftest - INFO - RESULTS - riscvtunes.RiscvTunesTests.test_riscv_unusual_tunes: PASSED (84.92s)
|2026-11-18 15:30:51,287 - oe-selftest - INFO - SUMMARY:
|2026-11-18 15:30:51,287 - oe-selftest - INFO - oe-selftest () - Ran 5 tests in 147.710s
|2026-11-18 15:30:51,287 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=5, skipped=0, failures=0, errors=0)

### QEMU Tests

To showcase what the tuning differences look like in practice, below are some
examples of how things look when core-image-ptest-coreutils (which I've used as
a benchmark in the RFC) is built, booted (including a ptest run) for qemuriscv64
with each profile set for DEFAULTTUNE in turn. This was all performed on my
local 12-core workstation and with QEMU's TCG emulation mode. The buildinfo data
was set using: 

|IMAGE_CLASSES += "image-buildinfo"
|IMAGE_BUILDINFO_VARS = "DISTRO DISTRO_VERSION MACHINE TUNE_FEATURES"

Also note that the 'rva23u64' coreutils ptest took significantly longer than the
others. I suspect that some packages which make use of the new extensions will
show similar differences. An example is ffmpeg, which needs 'zba' and 'zbb'
(among others) - an upstream discussion [5] suggests that building it without
those (which we'd do with the riscv64gc tune) could have performance
implications.

riscv64gc:

|root@qemuriscv64:~# cat /etc/buildinfo
|-----------------------
|Build Configuration:  |
|-----------------------
|DISTRO = nodistro
|DISTRO_VERSION = nodistro.0
|MACHINE = qemuriscv64
|TUNE_FEATURES = rv 64 i m a f d c zicsr zifencei
|-----------------------
|Layer Revisions:      |
|-----------------------
|meta              = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|meta-selftest     = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|root@qemuriscv64:~#

|============================================================================
|Testsuite summary for GNU coreutils 9.12
|============================================================================
|# TOTAL: 759
|# PASS:  591
|# SKIP:  168
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 758
|END: /usr/lib/coreutils/ptest
|2026-11-18T19:20
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

rva20u64:

|root@qemuriscv64:~# cat /etc/buildinfo
|-----------------------
|Build Configuration:  |
|-----------------------
|DISTRO = nodistro
|DISTRO_VERSION = nodistro.0
|MACHINE = qemuriscv64
|TUNE_FEATURES = rv 64 i m a f d c ziccamoa ziccif zicclsm ziccrse zicntr zicsr zmmul za128rs zaamo zalrsc zca zcd zifencei
|-----------------------
|Layer Revisions:      |
|-----------------------
|meta              = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|meta-selftest     = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|root@qemuriscv64:~#

|============================================================================
|Testsuite summary for GNU coreutils 9.12
|============================================================================
|# TOTAL: 759
|# PASS:  591
|# SKIP:  168
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 760
|END: /usr/lib/coreutils/ptest
|2026-11-18T19:36
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

rva22u64:

|root@qemuriscv64:~# cat /etc/buildinfo
|-----------------------
|Build Configuration:  |
|-----------------------
|DISTRO = nodistro
|DISTRO_VERSION = nodistro.0
|MACHINE = qemuriscv64
|TUNE_FEATURES = rv 64 i m a f d c b zic64b zicbom zicbop zicboz ziccamoa ziccif zicclsm ziccrse zicntr zicsr zihintpause zihpm zmmul za64rs zaamo zalrsc zfhmin zca zcd zba zbb zbs zkt zifencei
|-----------------------
|Layer Revisions:      |
|-----------------------
|meta              = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|meta-selftest     = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|root@qemuriscv64:~#

|============================================================================
|Testsuite summary for GNU coreutils 9.12
|============================================================================
|# TOTAL: 759
|# PASS:  591
|# SKIP:  168
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 730
|END: /usr/lib/coreutils/ptest
|2026-11-18T19:52
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

rva23u64:

|root@qemuriscv64:~# cat /etc/buildinfo
|-----------------------
|Build Configuration:  |
|-----------------------
|DISTRO = nodistro
|DISTRO_VERSION = nodistro.0
|MACHINE = qemuriscv64
|TUNE_FEATURES = rv 64 i m a f d c b v zic64b zicbom zicbop zicboz ziccamoa ziccif zicclsm ziccrse zicntr zicond zicsr zihintntl zihintpause zihpm zimop zmmul za64rs zaamo zalrsc zawrs zfa zfhmin zca zcb zcd zcmop zba zbb zbs zkt zvbb zve32f zve32x zve64d zve64f zve64x zvfhmin zvkb zvkt zvl128b zvl32b zvl64b supm zifencei
|-----------------------
|Layer Revisions:      |
|-----------------------
|meta              = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|meta-selftest     = tgamblin/riscv-tuning-strict:ead59b58fdda4df71f394e80c2fe451f5732b133
|root@qemuriscv64:~#

|============================================================================
|Testsuite summary for GNU coreutils 9.12
|============================================================================
|# TOTAL: 759
|# PASS:  591
|# SKIP:  168
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 1102
|END: /usr/lib/coreutils/ptest
|2026-11-18T20:14
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#


[1]: https://lore.kernel.org/openembedded-core/20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com/
[2]: https://git.openembedded.org/openembedded-core-contrib/log/?h=tgamblin/riscv-tuning-strict
[3]: https://docs.riscv.org/reference/rva23/v1.0/rva23-profiles.html
[4]: https://github.com/riscv/meta-riscv/pull/739
[5]: https://www.mail-archive.com/ffmpeg-trac@avcodec.org/msg69408.html

Trevor Gamblin (12):
  arch-riscv.inc, tune-riscv.inc: add RISCVPKGARCH
  arch-riscv.inc: add zmmul, zaamo, zalrsc, zca, zcd
  lib/oe/tune.py: support RISC-V profiles in riscv_isa_to_tune()
  lib/oeqa/selftest/cases/oelib/tune.py: add selftests for
    lib/oe/tune.py
  arch-riscv.inc, tune-riscv.inc: add rva20u64 tune
  arch-riscv.inc, tune-riscv.inc: add rva22u64 tune
  arch-riscv.inc, tune-riscv.inc: add rva23u64 tune
  tune-riscv.inc: set PACKAGE_EXTRA_ARCHS for supersets
  meta/conf/machine/include/riscv/arch-riscv.inc: error on very long
    package archs
  lib/oeqa/selftest/cases/riscvtunes.py: add RISC-V tune selftests
  rust-target-config.bbclass: pass on all RISC-V extensions to LLVM
  lib/oeqa/selftest/cases/riscvtunes.py: test Rust target features

 .../classes-recipe/rust-target-config.bbclass |  34 +---
 meta/conf/machine/include/riscv/README        |  14 +-
 .../conf/machine/include/riscv/arch-riscv.inc | 189 +++++++++++++++++-
 .../conf/machine/include/riscv/tune-riscv.inc |  40 +++-
 meta/lib/oe/tune.py                           |  26 ++-
 meta/lib/oeqa/selftest/cases/oelib/tune.py    |  81 ++++++++
 meta/lib/oeqa/selftest/cases/riscvtunes.py    | 174 ++++++++++++++++
 7 files changed, 519 insertions(+), 39 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/tune.py
 create mode 100644 meta/lib/oeqa/selftest/cases/riscvtunes.py

-- 
2.56.0

