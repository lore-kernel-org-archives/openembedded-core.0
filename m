Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1968ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:31:31 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.26524.1661956290846749157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=v7hCeDOC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 z3-20020a17090abd8300b001fd803e34f1so12629492pjr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=BeohpZ++w086fQywYWg/YB3DvzxlUFGi0odcYvQEDvA=;
        b=v7hCeDOCIM+C2t6Dfi16qV97XnQjxesbKwb681GTzaYB1zDyW8clczPvlzq3UYnPiI
         SFM2Y2+4MlAgPfoLsdiBDkbJVJmEZjj7HV7rNnC1BiLadvdUmmDQxcWjHVdoCCgHC43G
         kQvzwHMiZFZjQfVpFv37iwqAMbVxkGZ93FOMw5apTNsZtpyue+mNbt5laumk+lujNQpU
         CT8og5U4ETCyHl/pU9ZWYYC/2obyHZctMZRaRWK5KMWrPGFsuSrUzwTqDQ4BSYRGaOc3
         PrLDhAz41W64C+m4SbvwW6tecmj3S9P9S+yZX7M68p9RZC01b4G27BsRnDH1qxThBEz+
         RWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=BeohpZ++w086fQywYWg/YB3DvzxlUFGi0odcYvQEDvA=;
        b=4EPZObDbhELO/Egh0fFKULMeM7bLFjX9bQoqKuQSn6Oj28ji4sUGFZBwpbI5KHi8HW
         ekQJY9L8cRhtw3iNcCVfKDROVmmqHFzfKlUuLoXnm4z/kE//1RhkVNU1hnOsm42YGCV4
         N8WhsGtm4EapPlbfKPBAlWoUGeh65AfRqnOaJq18D+rahsuRuhInM12i1axv7XDw7Uzw
         WVhgDnxUtp21cUG6dDSu/WZf9n9/x/Cyo9fLnyd/i7vcEkcnxUhwdnZherXq+HoIe5fJ
         1XYIl5aoaxrc/G5mIEor01wKmoTSpEpDRK98N6janwuGhSYDRX6CJuoM0mPduEyCrsOv
         wj7g==
X-Gm-Message-State: ACgBeo1MravXe+hiWVWyyLdQRqcFlmySB/9AmwbEYGnGefJPHnQr4cfC
	mvI+SzCURhtMqiqaRHom+TPvBIlQnmO+/hEP
X-Google-Smtp-Source: 
 AA6agR6xn/h+nsIpQhLIziUzGivPfaVSw3SLunMFQQ+XsH7OIJpdk5VDF9FTWSCK3fpyMtHqVtIxJA==
X-Received: by 2002:a17:90b:1b48:b0:1f4:f4e5:c189 with SMTP id
 nv8-20020a17090b1b4800b001f4f4e5c189mr3463830pjb.226.1661956289585;
        Wed, 31 Aug 2022 07:31:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z62-20020a623341000000b0053670204aeasm11235077pfz.161.2022.08.31.07.31.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:31:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Pull request (cover letter only)
Date: Wed, 31 Aug 2022 04:31:13 -1000
Message-Id: <cover.1661956217.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170110

The following changes since commit 54ee67b1a805a07288925d56e9956aabc23b6ab2:

  vim: Upgrade 9.0.0115 -> 9.0.0242 (2022-08-28 07:52:25 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (10):
  tzdata: upgrade 2022a -> 2022b
  xz: update 5.2.5 -> 5.2.6
  gdk-pixbuf: upgrade 2.42.6 -> 2.42.8
  gdk-pixbuf: update 2.42.8 -> 2.42.9
  epiphany: upgrade 42.3 -> 42.4
  glib-networking: upgrade 2.72.1 -> 2.72.2
  libjpeg-turbo: upgrade 2.1.3 -> 2.1.4
  libwebp: upgrade 1.2.3 -> 1.2.4
  wireless-regdb: upgrade 2022.06.06 -> 2022.08.12
  wpebackend-fdo: upgrade 1.12.0 -> 1.12.1

Awais Belal (1):
  kernel-fitimage.bbclass: only package unique DTBs

Bertrand Marquis (1):
  sysvinit-inittab/start_getty: Fix respawn too fast

Hitendra Prajapati (1):
  Revert "gdk-pixbuf: CVE-2021-46829 a heap-based buffer overflow"

Jon Mason (1):
  oeqa/parselogs: add qemuarmv5 arm-charlcd masking

Pavel Zhukov (1):
  package_rpm: Do not replace square brackets in %files

Ross Burton (7):
  oeqa/qemurunner: add run_serial() comment
  oeqa/selftest: rename git.py to intercept.py
  oeqa/gotoolchain: put writable files in the Go module cache
  oeqa/gotoolchain: set CGO_ENABLED=1
  wic: add target tools to PATH when executing native commands
  wic/bootimg-efi: use cross objcopy when building unified kernel image
  wic: depend on cross-binutils

Shubham Kulkarni (1):
  sanity: add a comment to ensure CONNECTIVITY_CHECK_URIS is correct

 meta/classes/image_types_wic.bbclass          |  2 +
 meta/classes/kernel-fitimage.bbclass          |  8 ++
 meta/classes/package_rpm.bbclass              |  6 --
 meta/classes/sanity.bbclass                   |  1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      |  1 +
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |  8 +-
 .../selftest/cases/{git.py => intercept.py}   |  0
 .../oeqa/selftest/cases/oelib/buildhistory.py |  6 +-
 meta/lib/oeqa/utils/qemurunner.py             |  2 +
 ...ng_2.72.1.bb => glib-networking_2.72.2.bb} |  2 +-
 meta/recipes-core/meta/wic-tools.bb           |  3 +-
 .../sysvinit/sysvinit-inittab/start_getty     |  3 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 .../xz/xz/CVE-2022-1271.patch                 | 96 -------------------
 .../xz/{xz_5.2.5.bb => xz_5.2.6.bb}           |  7 +-
 .../{epiphany_42.3.bb => epiphany_42.4.bb}    |  2 +-
 .../0001-Add-use_prebuilt_tools-option.patch  | 18 ++--
 .../gdk-pixbuf/CVE-2021-46829.patch           | 61 ------------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch  | 20 ++--
 ...-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.9.bb} | 19 ++--
 ...-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb} |  2 +-
 ....06.06.bb => wireless-regdb_2022.08.12.bb} |  2 +-
 .../{libwebp_1.2.3.bb => libwebp_1.2.4.bb}    |  2 +-
 ...fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb} |  2 +-
 scripts/lib/wic/misc.py                       |  7 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py | 25 +++--
 26 files changed, 82 insertions(+), 229 deletions(-)
 rename meta/lib/oeqa/selftest/cases/{git.py => intercept.py} (100%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.1.bb => glib-networking_2.72.2.bb} (93%)
 delete mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch
 rename meta/recipes-extended/xz/{xz_5.2.5.bb => xz_5.2.6.bb} (88%)
 rename meta/recipes-gnome/epiphany/{epiphany_42.3.bb => epiphany_42.4.bb} (94%)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.9.bb} (87%)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb} (97%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} (94%)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.3.bb => libwebp_1.2.4.bb} (95%)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb} (90%)

-- 
2.25.1


