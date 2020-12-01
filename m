Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.492.1606848732839509805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kw0CfyeN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d77so1257682pfd.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=MInWQY7iXfzJT5r7jYz8XJ6SQG4QJn9zI9i6qfACzs0=;
        b=kw0CfyeN8T/8Xw94vdGfLTpiDfvqchYSBBoVy/NdeOoS3O6XZoxHzAtWnaaqRo09bA
         illEzXol9oHFTpu23e9bUhEwERHJLvMf+LIFr2K/hSgQSnJLxLCKyBJnQhnmojiKze9c
         wvxTl+FBY28pSmPfYOONhkUSy74lgOxn+wDQ4SS3A7dlLigxI96NvxR/lgZTk85plx6o
         xt2Js/35sibEVvvbfgz1ngXxoSXUetjZ57fFZ1vT+EFloy3Fv3Mhgkq58cfHJ98P/k2d
         zi4WHTfi1o2kvI9bNNLxsc3An7PzC20NFsh7UHPev/ZrMUGBXz9U819+ZnZu8cuEFYKW
         hjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=MInWQY7iXfzJT5r7jYz8XJ6SQG4QJn9zI9i6qfACzs0=;
        b=lAnOk/b/qmdNpodyPUpNpRIEyH8jqihWKJFS+3BzHAYkwPgUQdt5JiykYP7nSAqy+F
         fqh1hHIDKEEIy6CCcfQ/kkA2cUg1P7mHsmwrhMV/XTbXAtth39Ocu4hAvxGGPvhOW4WP
         sdlLCg/It+qwkks03SztHKMPch166Qjznbn7asO4UNDJ5IG7HcUfrhD6VptLxsDByhi8
         9x119s+dKc4UrLUjmxrGYWANPc95owpHdqMN0I/osQtNhORw69hMTPmJLrDCvLASeieB
         5LCF8Y1g3899e5JJBypLd7kMPvUGSC58qYxXDAY8ugxHjQ3NMoLdYugdYzumJUFuRF5c
         rW+g==
X-Gm-Message-State: AOAM533/nM9FLWASsF1j1ymQ90VckXMhE1RImyf2QEc6C5hL5yLi2rj3
	FL72oDf76c3uV+h8Mgip940M2MvmSveXxTM8
X-Google-Smtp-Source: ABdhPJwFQp9s7bA8q3CACMWJimWl1Hy6mtrSuYO1wjHGxgE2uaueg/qp1mY5mxz+UCjMcEg4mL0xgg==
X-Received: by 2002:a05:6a00:1593:b029:198:195:4d93 with SMTP id u19-20020a056a001593b029019801954d93mr3836919pfk.32.1606848731795;
        Tue, 01 Dec 2020 10:52:11 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Patch review
Date: Tue,  1 Dec 2020 08:51:43 -1000
Message-Id: <cover.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1638

The following changes since commit b885888df67eb5cdb3b82f4f0a07369a449e223b:

  build-appliance-image: Update to dunfell head revision (2020-11-25 23:25:31 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anuj Mittal (1):
  distutils-common-base: fix LINKSHARED expansion

Bruce Ashfield (2):
  kernel: provide module.lds for out of tree builds in v5.10+
  kernel: relocate copy of module.lds to module compilation task

Fedor Ross (2):
  sysvinit: remove bashism to be compatible with dash
  eudev: remove bashism to be compatible with dash

Loic Domaigne (1):
  roofs_*.bbclass: fix missing vardeps for do_rootfs

Max Krummenacher (1):
  linux-firmware: rdepend on license for all nvidia packages

Richard Purdie (2):
  fs-perms: Ensure /usr/src/debug/ file modes are correct
  e2fsprogs: Fix a ptest permissions determinism issue

Ross Burton (4):
  cve-check: show real PN/PV
  python3: add CVE-2007-4559 to whitelist
  gstreamer1.0-rtsp-server: set CVE_PRODUCT
  gstreamer1.0-plugins-base: set CVE_PRODUCT

Steve Sakoman (1):
  sqlite3: add CVE-2015-3717 to whitelist

Vyacheslav Yurkov (1):
  license_image.bbclass: use canonical name for license files

Wonmin Jung (1):
  kernel: Set proper LD in KERNEL_KCONFIG_COMMAND

 meta/classes/cve-check.bbclass                           | 9 ++++++---
 meta/classes/distutils-common-base.bbclass               | 2 +-
 meta/classes/kernel.bbclass                              | 6 +++++-
 meta/classes/license_image.bbclass                       | 3 ++-
 meta/classes/package.bbclass                             | 2 +-
 meta/classes/rootfs_deb.bbclass                          | 2 +-
 meta/classes/rootfs_ipk.bbclass                          | 2 +-
 meta/classes/rootfs_rpm.bbclass                          | 2 +-
 meta/conf/abi_version.conf                               | 2 +-
 meta/files/fs-perms-persistent-log.txt                   | 2 +-
 meta/files/fs-perms.txt                                  | 2 +-
 meta/recipes-core/sysvinit/sysvinit/rc                   | 2 +-
 meta/recipes-core/udev/eudev/init                        | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb      | 2 ++
 meta/recipes-devtools/python/python3_3.8.2.bb            | 2 ++
 .../linux-firmware/linux-firmware_20201022.bb            | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb               | 6 ++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.16.3.bb        | 2 ++
 .../gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb         | 2 ++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb            | 2 ++
 20 files changed, 40 insertions(+), 15 deletions(-)

-- 
2.17.1

