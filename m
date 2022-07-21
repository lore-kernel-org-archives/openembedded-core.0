Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE149C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 17:18:26 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.9083.1658423902345397243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TRfShewQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 d7-20020a17090a564700b001f209736b89so5930157pji.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9iIwBMsikDeeCcsEOpVFfKhUxgK+ZViQc/VEtQfW1o=;
        b=TRfShewQDQw0x6xyuy4QRqtHjt2FVDToSDRtcHB4isG2RboR8C6aVVCAq390dukpI5
         1GTPVx8lAABntFIWlIcL1R6iHSINF9q8c3UVJcNSREb84jU3XmbsUpg5bdJBb1gaG2eN
         8MFxRFvoSiL02NP8asr/R6NrXcpet9aokRfm7+LFCaKxQxzkn/QRSnxp/l2pqUAzliug
         q9VeLM4wn5PTu5QzXtQ/XklNLNE3TqOarfIYBAsRWGF5mWynipgcFNAywjUS4KwzP+Ha
         xASqMx/kRs3mcm5SOG4mvYwzHTQpjPzqE/BQoQTFlX3LOEU/M7wzgAKa3Ef2wPXbgVvY
         12ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9iIwBMsikDeeCcsEOpVFfKhUxgK+ZViQc/VEtQfW1o=;
        b=EX2rylBz7uFsstdD4miZuJ/r615I3Hk+0aFE8Z6ff88ycOu9X4SOtYA6NwR6Gy+mbS
         5CdkbD0AGNfEF08+n9LEYetvG8hV49nKmksurp4k8ROB2dMwMQFO/i+th6dQfUF2lHlV
         N1JJzQMlDOJkSX9jICYfzwWAxrhyciNgHDpnmZ8GPs+yDxc648jVmrSTb+UyciCOQFCI
         ualN/cPpR6aAFhanqPJ2wDnSqqrvbnBxX900ifs/EvdEOvYevqB8cDLVw3WrtbfS9WGH
         YAvXgiHKvzaNjO0TKT885p5A9ikDgw+Z/tR+B9F2X8tb3FAGfQ6jHHISXPrEq/A2y8ms
         Hk/g==
X-Gm-Message-State: AJIora/zFr4nhmGoyRyNUEFdnUCOrl7cWzX0UiEdbedNrtPfAgbJHBP2
	rcbe0Uupo6SBgEuIm1uw5CFDpE8X3sUnTf6g
X-Google-Smtp-Source: 
 AGRyM1tkkunyAo42mAc4VcikK+6F4nqN3E3mXhRQh/aPhwnYuEFO0eBjqj8dMJmyHMHSexUukZkwKA==
X-Received: by 2002:a17:90b:388e:b0:1f0:3d7f:e620 with SMTP id
 mu14-20020a17090b388e00b001f03d7fe620mr12737554pjb.31.1658423900523;
        Thu, 21 Jul 2022 10:18:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a65684d000000b00419cde333eesm1733121pgt.64.2022.07.21.10.18.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:18:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/58] Pull request (cover letter only)
Date: Thu, 21 Jul 2022 07:18:08 -1000
Message-Id: <cover.1658423705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 17:18:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168390

This pull request also includes the patches from the pull request sent on
Tuesday:

https://lists.openembedded.org/g/openembedded-core/message/168292

The following changes since commit a4bfb5ceb5cf8c0c6d27225b27ef10c0b9dceccb:

  libsoup: upgrade 3.0.6 -> 3.0.7 (2022-07-13 11:54:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alejandro Hernandez Samaniego (2):
  package.bbclass: Fix base directory for debugsource files when using
    externalsrc
  package.bbclass: Fix kernel source handling when not using externalsrc

Alexander Kanavin (1):
  waffle: correctly request wayland-scanner executable

Bruce Ashfield (19):
  linux-yocto/5.10: update to v5.10.121
  linux-yocto/5.10: update to v5.10.123
  linux-yocto/5.10: update to v5.10.128
  linux-yocto/5.10: fix build_OID_registry/conmakehash buildpaths
    warning
  linux-yocto/5.10: fix buildpaths issue with gen-mach-types
  linux-yocto/5.10: update to v5.10.130
  linux-yocto/5.10: fix buildpaths issue with pnmtologo
  linux-yocto/5.15: update to v5.15.46
  linux-yocto/5.15: update to v5.15.48
  linux-yocto/5.15: drop obselete GPIO sysfs ABI
  linux-yocto/5.15: update to v5.15.52
  linux-yocto/5.15: fix qemuppc buildpaths warning
  linux-yocto/5.15: fix build_OID_registry buildpaths warning
  linux-yocto/5.15: fix buildpaths issue with gen-mach-types
  linux-yocto/5.15: update to v5.15.54
  linux-yocto/5.15: fix buildpaths issue with pnmtologo
  kernel-devsrc: fix reproducibility and buildpaths QA warning
  kernel-devsrc: ppc32: fix reproducibility
  perf: fix reproducibility in 5.19+

Chanho Park (2):
  cargo_common.bbclass: enable bitbake vendoring for externalsrc
  externalsrc.bbclass: support crate fetcher on externalsrc

Christoph Lauer (1):
  package.bbclass: Avoid stripping signed kernel modules in
    splitdebuginfo

Khem Raj (1):
  libmodule-build-perl: Use env utility to find perl interpreter

Markus Volk (1):
  python3: Backport patch to fix an issue in subinterpreters

Ming Liu (3):
  udev-extraconf: let automount base directory configurable
  udev-extraconf: fix some systemd automount issues
  udev-extraconf:mount.sh: fix path mismatching issues

Muhammad Hamza (5):
  udev-extraconf/mount.sh: add LABELs to mountpoints
  udev-extraconf/mount.sh: save mount name in our tmp filecache
  udev-extraconf/mount.sh: only mount devices on hotplug
  udev-extraconf: force systemd-udevd to use shared MountFlags
  udev-extraconf/mount.sh: ignore lvm in automount

Pascal Bach (1):
  bin_package: install into base_prefix

Paul Eggleton (4):
  devtool: ignore pn- overrides when determining SRC_URI overrides
  patch: handle if S points to a subdirectory of a git repo
  devtool: finish: handle patching when S points to subdir of a git repo
  oe-selftest: devtool: test modify git recipe building from a subdir

Pavel Zhukov (1):
  harfbuzz: Fix compilation with clang

Peter Marko (1):
  alsa-state: correct license

Richard Purdie (13):
  qemu: Fix slirp determinism issue
  qemu: Add PACKAGECONFIG for brlapi
  gperf: Add a patch to work around reproducibility issues
  gperf: Switch to upstream patch
  udev-extraconf/initrdscripts/parted: Rename mount.blacklist ->
    mount.ignorelist
  insane: Fix buildpaths test to work with special devices
  lua: Fix multilib buildpath reproducibility issues
  vala: Fix on target wrapper buildpaths issue
  gtk-doc: Remove hardcoded buildpath
  kernel-arch: Fix buildpaths leaking into external module compiles
  gcc-runtime: Fix build when using gold
  gcc-runtime: Fix missing MLPREFIX in debug mappings
  selftest/runtime_test/virgl: Disable for all almalinux

Robert Joslyn (1):
  curl: Fix multiple CVEs

Ross Burton (2):
  perl: don't install Makefile.old into perl-ptest
  pulseaudio: add m4-native to DEPENDS

 meta/classes/bin_package.bbclass              |   3 +-
 meta/classes/cargo_common.bbclass             |   2 +-
 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/insane.bbclass                   |   6 +-
 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/classes/package.bbclass                  |  36 ++-
 meta/lib/oe/patch.py                          |   8 +-
 meta/lib/oe/recipeutils.py                    |   9 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 114 +++++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb     |   7 +-
 .../alsa-state/alsa-state/alsa-state-init     |   3 +-
 .../files/init-install-efi-testfs.sh          |   2 +-
 .../initrdscripts/files/init-install-efi.sh   |   2 +-
 .../files/init-install-testfs.sh              |   2 +-
 .../initrdscripts/files/init-install.sh       |   2 +-
 .../{mount.blacklist => mount.ignorelist}     |   0
 .../recipes-core/udev/udev-extraconf/mount.sh |  90 ++++--
 meta/recipes-core/udev/udev-extraconf_1.1.bb  |  27 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   5 +-
 meta/recipes-devtools/lua/lua/lua.pc.in       |   5 +-
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   2 +-
 .../perl/libmodule-build-perl_0.4231.bb       |   1 +
 meta/recipes-devtools/perl/perl-ptest.inc     |   4 +-
 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch |  54 ++++
 .../recipes-devtools/python/python3_3.10.4.bb |   1 +
 .../qemu/qemu-system-native_6.2.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 meta/recipes-devtools/qemu/qemu_6.2.0.bb      |   4 +-
 meta/recipes-devtools/vala/vala.inc           |   6 +
 ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 181 +++++++++++
 meta/recipes-extended/gperf/gperf_3.1.bb      |   2 +
 meta/recipes-extended/parted/files/run-ptest  |   6 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |   2 +
 .../harfbuzz/0001-Fix-conditional.patch       |  25 ++
 .../harfbuzz/harfbuzz_4.0.1.bb                |   5 +-
 ...build-request-native-wayland-scanner.patch |  27 ++
 meta/recipes-graphics/waffle/waffle_1.7.0.bb  |   1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   8 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-kernel/perf/perf.bb              |   6 +
 .../pulseaudio/pulseaudio.inc                 |   2 +-
 .../curl/curl/CVE-2022-32205.patch            | 174 +++++++++++
 .../curl/curl/CVE-2022-32206.patch            |  51 ++++
 .../curl/curl/CVE-2022-32207.patch            | 283 ++++++++++++++++++
 .../curl/curl/CVE-2022-32208.patch            |  67 +++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   4 +
 scripts/lib/devtool/standard.py               |  29 +-
 53 files changed, 1220 insertions(+), 134 deletions(-)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.ignorelist} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
 create mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32205.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch

-- 
2.25.1


