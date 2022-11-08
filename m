Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000AAC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 02:43:16 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.3687.1667875394747613267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 18:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nfBcXX4F;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id gw22so12505771pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 18:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijfT8XP7DarI/85JB0ePCcBYa1tNSavRiENYiiiCfF0=;
        b=nfBcXX4FRQVjeG7yRtskDn5L9V1DQ9jv9O67NWy+NuHc095KcqcpYVdl7r46NeVADv
         d2ywHEAalC9K+RU3/cUOxdEC1eWxz+Thax0nnv7KtDIlMxJfqurf7YnHOHdjM56GKOM0
         9+nai6KrDoKsbPUYxuhvaQxjoYIzkZjpdgvRHbx0Tq5O++YhE1dRbrtDwWIPFIi04fil
         wrhTfoTqWRgwxGPxYm9tkCSjtDDLtjQgoD2I3oy4fzYiAMeBxMTms17X+d8mMMRFKbMr
         j22MSKrB2BcvffJCPgmKMsy2x8g8PA2emDyBtcsgF2t1/7CfsTjpKy4DyJolA9sei7Si
         SQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijfT8XP7DarI/85JB0ePCcBYa1tNSavRiENYiiiCfF0=;
        b=4V0l+lvGzGdSQLVVIHkWPLII4813EXkpXnWH7hLy2Lfqfn7mZTYnt9lJBnokK1glHn
         dKjBGP5kEPHBQb59p/0cA/qDmJVFHGE0hYAC8z5mEsNDGw3ERzEXfBfFYAbNNbduF8RY
         UYHh2lWr97wq/kAe3eC7qsTIUt17Uo+ZDtse2Eohd3ZYiX3yBTRSebShdrfridHh5Ynu
         GZc0RDv8pdB+po8Y6a3a5AE/tbKC8DBZZssnMxMbL7hV0wb7Hm0DTX00TQTnFoDRYmKq
         a6ff9y21J+pTbDPqD/UamkZUibjaR5HBwTeJQxdK8YVCXUY+txpCgIK8+zf4y86MuPrG
         357Q==
X-Gm-Message-State: ACrzQf26A1pUINjQYfSTvXMB5lTgTHFwPony5k+qNDf+WKg/K2F/0+55
	iud3vVR3GgSAfnpoi8rC1frmN3/Al2CW1HBx
X-Google-Smtp-Source: AMsMyM6ePfrcZpjHKEUrRJsu2lDQMGrk7N6QbjlrcmOpvn53+QOUxlySgYaJQ0dKxHeyZaWRjBKjeg==
X-Received: by 2002:a17:90a:164f:b0:213:bda6:2873 with SMTP id x15-20020a17090a164f00b00213bda62873mr49701567pje.215.1667875393513;
        Mon, 07 Nov 2022 18:43:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b0018157b415dbsm5672546plg.63.2022.11.07.18.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:43:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/21] Pull request (cover letter only)
Date: Mon,  7 Nov 2022 16:43:08 -1000
Message-Id: <cover.1667875142.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 02:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172944

The following changes since commit 555fd2848b970fd38c20651b5e98cabb7f31287c:

  vim: upgrade 9.0.0614 -> 9.0.0820 (2022-11-04 13:13:27 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Kiernan (1):
  u-boot: Remove duplicate inherit of cml1

Bartosz Golaszewski (1):
  bluez5: add dbus to RDEPENDS

Bernhard Rosenkränzer (1):
  cmake-native: Fix host tool contamination (Bug: 14951)

Frank de Brabander (1):
  cve-update-db-native: add timeout to urlopen() calls

Jan-Simon Moeller (1):
  buildtools-tarball: export certificates to python and curl

Jeremy Puhlman (1):
  qemu-native: Add PACKAGECONFIG option for jack

Joshua Watt (2):
  runqemu: Do not perturb script environment
  runqemu: Fix gl-es argument from causing other arguments to be ignored

Keiya Nobuta (1):
  gnutls: Unified package names to lower-case

Khem Raj (1):
  perf: Depend on native setuptools3

Liam Beguin (1):
  meson: make wrapper options sub-command specific

Mark Hatle (1):
  insane.bbclass: Allow hashlib version that only accepts on parameter

Ross Burton (5):
  scripts/oe-check-sstate: cleanup
  scripts/oe-check-sstate: force build to run for all targets,
    specifically populate_sysroot
  opkg-utils: use a git clone, not a dynamic snapshot
  oe/packagemanager/rpm: don't leak file objects
  glib-2.0: fix rare GFileInfo test case failure

Thomas Perrot (1):
  psplash: add psplash-default in rdepends

Vyacheslav Yurkov (1):
  overlayfs: Allow not used mount points

Xiangyu Chen (1):
  ltp: backport clock_gettime04 fix from upstream

wangmy (1):
  ifupdown: upgrade 0.8.37 -> 0.8.39

 meta/classes/insane.bbclass                   |  5 +-
 meta/classes/overlayfs.bbclass                |  6 +-
 meta/lib/oe/overlayfs.py                      |  6 +-
 meta/lib/oe/package_manager/rpm/__init__.py   | 33 ++++---
 meta/recipes-bsp/u-boot/u-boot.inc            |  2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...-info-don-t-assume-million-in-one-ev.patch | 51 +++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 ...{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} |  2 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |  2 +
 .../recipes-core/meta/cve-update-db-native.bb |  9 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 .../cmake/cmake-native_3.22.3.bb              |  1 +
 .../meson/meson/meson-wrapper                 | 21 ++++-
 .../opkg-utils/opkg-utils_0.5.0.bb            |  6 +-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...set-threshold-based-on-the-clock-res.patch | 89 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |  1 +
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |  2 +-
 scripts/oe-check-sstate                       |  8 +-
 scripts/runqemu                               | 28 +++---
 22 files changed, 231 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} (97%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch

-- 
2.25.1


