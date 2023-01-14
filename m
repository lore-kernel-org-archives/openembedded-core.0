Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC43C3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 16:31:43 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.119558.1673713900466501757
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 08:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gSPlM2b7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id g68so15798193pgc.11
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DR+Q/r/hi2gMA4Bm9oPYtzeSZm19ktBOqhbLcrIw/XA=;
        b=gSPlM2b7jAsFZZVwdXA1JTAP2LesMe9K85aYKQGO3mbLkFUlQVfbWOc7YP6Uym2coE
         W9Vl7glAP4fU6dc7Huz3eNPybHnMCHGFHZKGjXzs4Tn9yo4+bQ6+E8RXYiG6pKSKXGYt
         qkGIOPwTDRcWp5A4QznlmCvCOWk8mPFFIHnDjtTdnwc6AqCWVoNy4k/gVXNkdFu4wtNj
         FEI7MhRCu48o3HbbVg2BgwVdORjcg5FGd6A7GgGMpXDGsi6wXj24anu3IYZd8X2ebIX/
         imGplTzUAkMOxjVAPi1nMcqwNoI4Pt00EwKH69AkiyxoXMLRsMGZZHoC8IFTTNNo7/vh
         RQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DR+Q/r/hi2gMA4Bm9oPYtzeSZm19ktBOqhbLcrIw/XA=;
        b=JrVta4J8EM75lrm94MpvoV2gfwpkLUVfDfQ11AA1Gv4f5Rrw8MDlw+mU3DZThiviC5
         6zoF6EnauHraq0KAJR5vYoxJ1S47kWDox4tMw8GOnJchsOJMEOucE6H0jpKFELpFW4sH
         teqYQ8i1fhwZ6fvj+aC58xbyO3MUerqwwHbK8P2HqmkJIc4GcI1fvTicfi2PhmKJMQW7
         kU/RFDT0wdok7hzMapaOovcGXoNXRL0EjsTcsAEqG2ApxmRhCHAgxXKwey0XUSj8XliH
         DrP8xCVqZSbGH67hAUMMY0eSopFHWvlz/aIbHDuepqrX+/r5VIdGlN/ShJ2RmfOoerd1
         J+QA==
X-Gm-Message-State: AFqh2kqKp1Jq0Olqu8X9i+dSTlzN1T4v9k3xtMK/XEBh0nSTfj2Kl+p/
	lP/s4KdQIG4oQOD4tzwQDRYTAQD4ib1QbfI3oIo=
X-Google-Smtp-Source: AMrXdXvnEBVTCuxB5J7NJQQusXyuBPmKRkUZJGB8h+lkZK9BPxdXrJQmnFu9tUcTt0QHgaTuSwvpgg==
X-Received: by 2002:a62:38d8:0:b0:588:4739:9a23 with SMTP id f207-20020a6238d8000000b0058847399a23mr22103726pfa.15.1673713899213;
        Sat, 14 Jan 2023 08:31:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c17-20020aa79531000000b0058b927b9653sm6870040pfp.92.2023.01.14.08.31.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 08:31:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/11] Pull request (cover letter only)
Date: Sat, 14 Jan 2023 06:31:32 -1000
Message-Id: <cover.1673713825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 16:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175855

The following changes since commit 670f4f103b25897524d115c1f290ecae441fe4bd:

  build-appliance-image: Update to langdale head revision (2023-01-06 17:42:06 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alexander Kanavin (3):
  libarchive: upgrade 3.6.1 -> 3.6.2
  go: update 1.19.3 -> 1.19.4
  devtool: process local files only for the main branch

Changqing Li (1):
  base.bbclass: Fix way to check ccache path

Jose Quaresma (2):
  Revert "gstreamer1.0: disable flaky gstbin:test_watch_for_state_change
    test"
  gstreamer1.0: Fix race conditions in gstbin tests

Luis (1):
  rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively

Pavel Zhukov (1):
  oeqa/rpm.py: Increase timeout and add debug output

Wang Mingyu (1):
  bind: upgrade 9.18.9 -> 9.18.10

Xiangyu Chen (1):
  grub2: backport patch to fix CVE-2022-2601 CVE-2022-3775

wangmy (1):
  dbus: upgrade 1.14.0 -> 1.14.4

 .../devtool/devtool-test-local/file3          |   1 +
 .../devtool/devtool-test-local_6.03.bb        |   3 +
 .../devtool/devtool-test-localonly.bb         |   3 +
 .../devtool/devtool-test-localonly/file3      |   1 +
 meta/classes-global/base.bbclass              |   2 +-
 meta/classes/rm_work.bbclass                  |  15 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |  23 +-
 ...erflow-in-grub_font_get_glyph_intern.patch | 115 +++++++
 .../grub/files/CVE-2022-2601.patch            |  85 +++++
 .../grub/files/CVE-2022-3775.patch            |  95 ++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.9 => bind-9.18.10}/bind9  |   0
 .../{bind-9.18.9 => bind-9.18.10}/conf.patch  |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.9.bb => bind_9.18.10.bb}  |   2 +-
 .../dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb}   |   7 +-
 .../go/{go-1.19.3.inc => go-1.19.4.inc}       |   2 +-
 ...e_1.19.3.bb => go-binary-native_1.19.4.bb} |   4 +-
 ..._1.19.3.bb => go-cross-canadian_1.19.4.bb} |   0
 ...{go-cross_1.19.3.bb => go-cross_1.19.4.bb} |   0
 ...osssdk_1.19.3.bb => go-crosssdk_1.19.4.bb} |   0
 ...o-native_1.19.3.bb => go-native_1.19.4.bb} |   0
 ...runtime_1.19.3.bb => go-runtime_1.19.4.bb} |   0
 .../go/{go_1.19.3.bb => go_1.19.4.bb}         |   0
 ...t-include-sys-mount.h-when-linux-fs..patch |  47 ---
 .../libarchive/CVE-2022-36227.patch           |  42 ---
 ...ibarchive_3.6.1.bb => libarchive_3.6.2.bb} |   9 +-
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ++++++++++++++++++
 ...bin-test_watch_for_state_change-test.patch | 107 -------
 .../gstreamer/gstreamer1.0_1.20.5.bb          |   2 +-
 scripts/lib/devtool/standard.py               |  38 ++-
 37 files changed, 663 insertions(+), 243 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file3
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file3
 create mode 100644 meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.9.bb => bind_9.18.10.bb} (97%)
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (96%)
 rename meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.3.bb => go-cross-canadian_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.3.bb => go-cross_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.3.bb => go-crosssdk_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.3.bb => go-native_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.3.bb => go-runtime_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.3.bb => go_1.19.4.bb} (100%)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.6.1.bb => libarchive_3.6.2.bb} (89%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch

-- 
2.25.1


