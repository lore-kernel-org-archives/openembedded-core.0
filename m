Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.31862.1613399869292529583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LfRZjlB3;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id t196so1573764oot.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCCSVoGJCf2+8pMrVdVrdOOrvAhU5B6DZr7GzOTDwZk=;
        b=LfRZjlB3GohgYMngAM2vkTJrYsZVmVCzF1NqvJN6ay+JEcaSxTAKr8TCQUdxPZWbdV
         68P2zAhRblxdXIdXMNWJs5p0knqFvnwirikLGaeUe8OpPDR4YNHf0k/tpD9Mk2kHiTn7
         jrEJpjx1G6baB8fP2fNh3DJnPhA3LM/U8QVwY5HksOW6JD6S/Qyy+DGI4N3PUsW0oceA
         jpnmv0aaqGFu5IPaJaAn7oH5RTYzaxywu+VwNt6MY3hMC4CkzIgvTILbanYYVi+m8Nku
         U6ZnCeVeW6F2kcCtMR4kJE2k6wS+Y+IJ2SZNPnzWjY/VeuQLAdD3onEvO1YIhKOty3L0
         tAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCCSVoGJCf2+8pMrVdVrdOOrvAhU5B6DZr7GzOTDwZk=;
        b=JxP18OsiM7ifqfUfwXxZGabqUdnCFOUaoTlQXz1zTPHlYWQa4wwhYVnZk4NxOGRcSJ
         O1v1y3R5YzsYtPPj7D4RaIYHUppk65/1i/vGjYurKiY7YyJ/hqeRjGCAL49jy1WYLFCE
         wp5GNJhpDjVNgMVcv1G08gp6vICDDblJQHlJTLsJBL4Jl+aoL00v8dzqV6UsaBhGNTDG
         AR1ubzN0u6liF/vSMugBzxBRSKd5+COH5r3Ss7zf27mE1UsOAjpm3UHKhsLfvZcKfsBR
         QrUVszwSe4uPsD/gHq7L86/1k98i+bSOdYfdVrylB0PhNDUDT9i6qjEBLOSJYjxI8WpC
         cRMg==
X-Gm-Message-State: AOAM532zYG7VnxRctY504NIoEZdCNOIwyh4rZLYoOfVmlNkPUB19gyqx
	dBbFkMdCNQSrxWR0si1Cx2nTgE0R61UkkXq8
X-Google-Smtp-Source: ABdhPJxnarP2ePQa6jqeBjdBm3iHArHzLQlaYVUeoiJhJMaRtecuklJClsZj3mppKQkP60dviqiCHQ==
X-Received: by 2002:a4a:d50d:: with SMTP id m13mr11037422oos.2.1613399868116;
        Mon, 15 Feb 2021 06:37:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:37:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Patch review
Date: Mon, 15 Feb 2021 04:37:11 -1000
Message-Id: <cover.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1852

The following changes since commit 9efabaff73090b08233b4fcef22142b9ac0c11aa:

  wic/selftest: test_permissions also test bitbake image (2021-02-09 06:12:09 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (6):
  p11-kit: upgrade 0.23.20 -> 0.23.21
  python3: split python target configuration into own class
  python3-pycairo: use python3targetconfig
  distutils3-base.bbclass: use python3targetconfig
  meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
  gpgme: use python3targetconfig

Dorinda (1):
  oe-pkgdata-util: Check if environment script is initialized

Jon Mason (1):
  gcc-9.3.inc: Fix potential runtime crash

Khem Raj (1):
  python3targetconfig.bbclass: Make py3 dep and tasks only for target
    recipes

Lee Chee Yang (1):
  p11-kit: upgrade 0.23.21 -> 0.23.22

Martin Jansa (1):
  image_types.bbclass: tar: use posix format instead of gnu

Michael Halstead (1):
  uninative: Upgrade to 2.10

Richard Purdie (3):
  image_types: Ensure tar archives are reproducible
  opkg: Fix build reproducibility issue
  opkg: Fix patch glitches

saloni (2):
  libgcrypt: Whitelisted CVEs
  libcroco: Added CVE

 meta/classes/distutils3-base.bbclass          |   2 +-
 meta/classes/image_types.bbclass              |   2 +-
 meta/classes/python3native.bbclass            |   2 -
 meta/classes/python3targetconfig.bbclass      |  17 ++
 meta/classes/scons.bbclass                    |   3 -
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oe/prservice.py                      |   4 -
 meta/recipes-core/glib-2.0/glib.inc           |   4 -
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 +++++++++++
 .../opkg/opkg/sourcedateepoch.patch           |  24 +++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   1 +
 .../python/python3-pycairo_1.19.0.bb          |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |   5 -
 meta/recipes-support/gpgme/gpgme_1.13.1.bb    |   2 +-
 .../libcroco/files/CVE-2020-12825.patch       | 192 ++++++++++++++++++
 .../libcroco/libcroco_0.6.13.bb               |   3 +
 .../libgcrypt/libgcrypt_1.8.5.bb              |   3 +
 ...{p11-kit_0.23.20.bb => p11-kit_0.23.22.bb} |   7 +-
 scripts/oe-pkgdata-util                       |   3 +
 20 files changed, 375 insertions(+), 29 deletions(-)
 create mode 100644 meta/classes/python3targetconfig.bbclass
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
 create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.22.bb} (75%)

-- 
2.25.1

