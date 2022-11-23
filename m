Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29010C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 14:18:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.21227.1669213094526950555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 06:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cVGxcrix;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id g10so16744986plo.11
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlmJR81U0IiOGC6oCLFpnXm78Vn6hoCJ00xdzVhTtAo=;
        b=cVGxcrixF/eF4fGLL941MJXAp76RqGBrxibjX8u56nkbf5J/QoYEY9Ate3IzM/gT9m
         ajGm+zgZr10WqFi6ax0Zf5nJPxq8wN96fo5YKkDnU3BHAlklvTeD2r91kCl27iDQu/dW
         sz/Bn+3ilQAp0c02QtB1litHeqAWCVi2gQrrwJc5hrd8Fu1lfr+q8bE0egW1NqDc6n5C
         hsltKevDzDpSAdqWGYmGZHG1vzE2L0nZU3y6/dzwvZ1nWCFqtsxY6QvbscHVxmpylHfK
         QjrXj0CDdfR1L/slrxjI39/2mKG0EMMgSy9Iycgk7MnJx7kLSMyUz1axuwujsqoteVpt
         l64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlmJR81U0IiOGC6oCLFpnXm78Vn6hoCJ00xdzVhTtAo=;
        b=wYMc7au983F2Gqte6sceI3Hy/AD0sl6iL3k0/5QSA5P4iU7aWcAzp4Vmz+tkogTOub
         st0CRVtw42qF7BLXxCB56XexKLvwrbsqVysYmzM589Uqjr/d8iSJfTONIOlgQyhgTi2j
         t+7tWAtLNBySPOrlzrFKzBF+CJz23vYZB6rpPmffGkNQMjN5DKi+nUuLizCtNIyvCQHI
         gNT8bUVFdMadaMiwsN49mRysL9tkUUZo1BSThatrPBwZaFXPtbsqMmliA0fne1oI5lPd
         ncxDM0Tj63onAmIxAxoOCHLaRalxc9YKYV4reA7gU7DDOwkcbtNdXeLvXnTJbXLnmVvo
         l2Sw==
X-Gm-Message-State: ANoB5plHgnWJIpciknG//XQvUSa45+81nfdO7wtWxEehCYl944miM4j+
	Mdq+GTQjJAiMXWGfx8Ldt1VAZqUJykdCjSFDKN8=
X-Google-Smtp-Source: AA0mqf4BanTQaKk67rqIDVTf/eMivVJa9DF/jn670GvIrV4GGLL7kSA3IRRBbKWCL1IthtbgGjkHLw==
X-Received: by 2002:a17:903:44f:b0:187:3a43:3a9d with SMTP id iw15-20020a170903044f00b001873a433a9dmr21692346plb.152.1669213093275;
        Wed, 23 Nov 2022 06:18:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm12751427pfr.111.2022.11.23.06.18.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:18:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/35] Pull request (cover letter only)
Date: Wed, 23 Nov 2022 04:18:06 -1000
Message-Id: <cover.1669212990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173714

The following changes since commit 3243b069db7629d15e4b8c25b4133f824d18520c:

  qemu: add io_uring PACKAGECONFIG (2022-11-10 07:13:46 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Kiernan (1):
  cargo_common.bbclass: Fix typos

Alexander Kanavin (6):
  lttng-tools: submit determinism.patch upstream
  groff: submit patches upstream
  tcl: correct patch status
  kea: submit patch upstream
  ovmf: correct patches status
  libffi: submit patch upstream

Diego Sueiro (1):
  kernel.bbclass: Include randstruct seed assets in
    STAGING_KERNEL_BUILDDIR

Hitendra Prajapati (1):
  systemd: CVE-2022-3821 Fix buffer overrun

Jose Quaresma (1):
  archiver: avoid using machine variable as it breaks multiconfig

Kai Kang (1):
  libuv: fixup SRC_URI

Leon Anavi (1):
  get_module_deps3.py: Check attribute '__file__'

Marek Vasut (1):
  bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware

Nathan Rossi (4):
  oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
  oeqa/selftest/minidebuginfo: Create selftest for minidebuginfo
  glibc-locale: Do not INHIBIT_DEFAULT_DEPS
  package: Fix handling of minidebuginfo with newer binutils

Niko Mauno (1):
  systemd: Consider PACKAGECONFIG in RRECOMMENDS

Richard Purdie (6):
  lttng-modules: upgrade 2.13.5 -> 2.13.7
  bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
  gcc-shared-source: Fix source date epoch handling
  gcc-source: Fix gengtypes race
  gcc-source: Drop gengtype manipulation
  gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change

Ross Burton (1):
  expat: upgrade to 2.5.0

Sergei Zhmylev (1):
  wic: make ext2/3/4 images reproducible

Steve Sakoman (1):
  Revert "expat: backport the fix for CVE-2022-43680"

Wang Mingyu (3):
  bind: upgrade 9.18.7 -> 9.18.8
  socat: upgrade 1.7.4.3 -> 1.7.4.4
  libxcrypt: upgrade 4.4.28 -> 4.4.30

Xiangyu Chen (5):
  dbus: fix CVE-2022-42010 Check brackets in signature nest correctly
  dbus: fix CVE-2022-42011 dbus-daemon can be crashed by messages with
    array length inconsistent with element type
  dbus: fix CVE-2022-42012 dbus-marshal-byteswap: Byte-swap Unix fd
    indexes if needed
  lttng-tools: Upgrade 2.13.4 -> 2.13.8
  sudo: upgrade 1.9.10 -> sudo 1.9.12p1

 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/cargo_common.bbclass             |   4 +-
 meta/classes/kernel.bbclass                   |  16 +++
 meta/classes/package.bbclass                  |  21 +++-
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |   2 +
 meta/lib/oeqa/selftest/cases/minidebuginfo.py |  49 ++++++++
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.7 => bind-9.18.8}/bind9   |   0
 .../{bind-9.18.7 => bind-9.18.8}/conf.patch   |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.7.bb => bind_9.18.8.bb}   |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 +
 .../kea/files/fix-multilib-conflict.patch     |   2 +-
 .../libuv/libuv_1.44.2.bb                     |   2 +-
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch |  35 ------
 .../{socat_1.7.4.3.bb => socat_1.7.4.4.bb}    |   6 +-
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch |  76 +++++++++++
 ...idate-Check-brackets-in-signature-ne.patch | 119 ++++++++++++++++++
 ...idate-Validate-length-of-arrays-of-f.patch |  61 +++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |   3 +
 .../expat/expat/CVE-2022-43680.patch          |  33 -----
 .../expat/{expat_2.4.9.bb => expat_2.5.0.bb}  |   3 +-
 meta/recipes-core/glibc/glibc-locale.inc      |  11 +-
 ...t_4.4.28.bb => libxcrypt-compat_4.4.30.bb} |   0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   2 +-
 ...ibxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} |   0
 ...ovmf-update-path-to-native-BaseTools.patch |   2 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |   7 +-
 .../systemd/systemd/CVE-2022-3821.patch       |  45 +++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   5 +-
 .../gcc/gcc-shared-source.inc                 |  10 ++
 meta/recipes-devtools/gcc/gcc-source.inc      |   9 +-
 .../python/python3/get_module_deps3.py        |   2 +-
 .../tcl/fix_non_native_build_issue.patch      |   2 +-
 ...001-Make-manpages-mulitlib-identical.patch |   2 +-
 ...001-replace-perl-w-with-use-warnings.patch |   2 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} |   2 +-
 ...djust-range-v5.10.137-in-block-probe.patch |  92 --------------
 ...4-fix-kernel-crash-caused-by-do_get_.patch |  94 --------------
 ...ules_2.13.5.bb => lttng-modules_2.13.7.bb} |   4 +-
 .../lttng/lttng-tools/determinism.patch       |   2 +-
 ...-tools_2.13.4.bb => lttng-tools_2.13.8.bb} |  11 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch |   2 +-
 scripts/lib/wic/partition.py                  |  29 ++++-
 51 files changed, 474 insertions(+), 303 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/minidebuginfo.py
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.7.bb => bind_9.18.8.bb} (97%)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.3.bb => socat_1.7.4.4.bb} (89%)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch
 rename meta/recipes-core/expat/{expat_2.4.9.bb => expat_2.5.0.bb} (88%)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} (96%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb} (86%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)

-- 
2.25.1


