Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.6384.1607039203287108755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 15:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vEB6lWXM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id m5so2082337pjv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=hIJUDXGjSJsSL5NGFajnkZyEkrUL/ouC8iBMB0CJlTE=;
        b=vEB6lWXMrE5z+vOpeUmVyLF/HHvg6eAdND6Sw0SKn8tL9fs5r2t8++6gThgs87cEk1
         W47bJNoo5dCXQgyoxWMCLqjksGjLVLx+JwgrtOqUJhV+xqrj3ftg9J0337U00/l7Odpn
         7f/au2cs/5XIw6bq9drMaOp0EhSAQJv7feZGYoK/0vtAfvq24zuL2OHfFaQnC7y+9abf
         q/VEv7rM/Liscz23MlSU6IUnnnvABhEVNEyO9EmBXoQ/QTqNiPKwuRcnBiUqQPwZir92
         +3xdvfpU1zqwXxFT5DfIFwHf+SgZbIPZaEcMt/0D+MqchyV/++yxJNr5yGUrwwbACT1F
         5xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=hIJUDXGjSJsSL5NGFajnkZyEkrUL/ouC8iBMB0CJlTE=;
        b=LBQP2zdyjf+mMB76ZQ7CSI8LMfsKwQwD08+Oxuu3IWVStkOuLTEKOZ0c7hx9loemzy
         KUnhTbW360G9MWTvMYw2TZf8sUbQQT9igbi9gzTP/pdf5Hpr6k/s+K2iyMvOchkI6cTD
         7bg9KAltFNu+A9BXUI/6hBGOGy2r/K0Bio+WxDSeQRvl8oEkrObTde6lSj+DFWiM15gh
         iy79N6GLPUWNW4TuQHluoO3BUDvWv6JBTuHbpN+3WwkIwtATjT3tcN6rdN16l9DlKpqp
         0SjIvCxSm6qwgyxagIaW7JoRFLFsjWxDJEr/hqAyqclWOfM++/CBZQwckdXyg+x0IxiE
         OsKA==
X-Gm-Message-State: AOAM531GaM6QOUAkXzIR0Av96kuPw2Bq+L1WpfjO+cPd2R+Cb2CPa4kW
	MUV2ZhYsp7dajrv25IZHxxM5bW+o1BM69OA3
X-Google-Smtp-Source: ABdhPJwHOGfTC/5AADQ/2zdayOQryfGb6kWSju0s4HNuO0CtC+Ke30w1/+P0x6RNT+ie1dAeEA4bCA==
X-Received: by 2002:a17:90a:aa8d:: with SMTP id l13mr1380223pjq.223.1607039202084;
        Thu, 03 Dec 2020 15:46:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm2924993pfl.163.2020.12.03.15.46.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:46:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Thu,  3 Dec 2020 13:46:29 -1000
Message-Id: <cover.1607039080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit b885888df67eb5cdb3b82f4f0a07369a449e223b:

  build-appliance-image: Update to dunfell head revision (2020-11-25 23:25:31 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

