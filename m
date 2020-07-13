Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.20211.1594649838233851451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0/JTByIk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id t11so6050324pfq.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v9m+fBR0am6w+4K3TBFKCMI+/AGNGyZfBkSwkS9/3Lo=;
        b=0/JTByIk1ifj+g0WuOh2oDfDHMsVR7owtZgk0KXPZi9kTKn8bEfPlSL1mn6rNhqjC3
         YGN3G7h7co1Kc9vsaVGEQsUTYtN63vZk/CVulJe9s/YxCTgiJP5EDvRoJ0fk+WmrV07v
         xv7k2l/0Xzve/7u+Mx61F9ziL44UYGxrQlBxQmAXU8bhTJBrm1oDaC/csADxHtF+c99H
         tm1XH+xiY3KjAO4GYr469XMxcNoCeXt0kTq9mcDC4VdYITdyXUbYjIimiDc/VIbUBfBC
         oOeQhAshxBH/nSLlPHlNIL9slJwafy/Wc60NqsAOFIyFPslgYSEhGP8TovIvluTPaIIt
         XgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v9m+fBR0am6w+4K3TBFKCMI+/AGNGyZfBkSwkS9/3Lo=;
        b=kLIEacxBeqRAuKBpUl7aE1/+9FhmhDfKm0VpvXQPwe5c7MSBQ1HpXkMJT0RG9CzWBu
         er1Y2sHsYJGhTMl2DrpoW73zA0IxH97WZexkAUj9re2LWirn/JEjD2A6LLwjxKi2bSPB
         8Yu+awHN9nRaM0d+1xAxSCfp/OpvMMtVHh5cXUSns4hoUYWgBFPWNSbSMkihHPlGo2/e
         +WQTHNn2/hWiN/FEzcZ0yLI/ovf5d2Tz731Ov/f0UaFUvtqXAYhGKrYY4g+Bo/B/059R
         ziG1xUBuI1ioBv/SdNaMePXgM2eyBG1nytLKhiSSJ7b6UvjBGe5I9g3xhhf1cKTjt8+d
         EFYA==
X-Gm-Message-State: AOAM531wy1Oax3sRGMUy6rp3SlQMaRM35kh1XXAmRpkCg3ZiIliAgle/
	nx281lrITeW2eQB0dKhW5pzYeRGx6LqRew==
X-Google-Smtp-Source: ABdhPJyAm9CjjxmoynBLf/x61OOSY7P2OF24L1vu15L1WT9/SDN5B9P87mgfhBv5SPqTLSwJB3tZYA==
X-Received: by 2002:a62:7b0d:: with SMTP id w13mr127559pfc.82.1594649837095;
        Mon, 13 Jul 2020 07:17:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Patch review
Date: Mon, 13 Jul 2020 04:16:48 -1000
Message-Id: <cover.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these changes for dunfell and have comments back
by end of day Wednesday.

Passed a-full build on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1157

The following changes since commit cabaf5654db5db12b6576ef0ebae9bc7b422a8ca:

  iso-codes: switch upstream branch master -> main (2020-07-07 07:07:06 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  gobject-introspection: add a patch to fix a build race
  icu: make filtered data generation optional, serial and off by default

Andrey Zhizhikin (1):
  kernel/yocto: fix search for defconfig from src_uri

Bjarne Michelsen (1):
  devtool: default to empty string, if LIC_FILES_CHKSUM is not available

Bruce Ashfield (2):
  kernel/yocto: ensure that defconfigs are processed first
  linux-yocto/5.4: update to v5.4.50

Christian Eggers (1):
  libnl: Extend for native/nativesdk

Hannu Lounento (1):
  openssl: move ${libdir}/[...]/openssl.cnf to ${PN}-conf

Joshua Watt (2):
  classes/archiver: run do_unpack_and_patch after do_preconfigure
  classes/archive: do_configure should not depend on do_ar_patched

Konrad Weihmann (1):
  systemd: remove kernel-install from base pkg

Rasmus Villemoes (1):
  coreutils: don't split stdbuf to own package with single-binary

Timon Ulrich (2):
  kernel.bbclass: add lz4 dependency and fix the call to lz4
  kernel.bbclass: make dependency on lzop-native conditional

Vacek, Patrick (1):
  oeqa/core/loader: fix regex to include numbers

 meta/classes/archiver.bbclass                 |  4 +--
 meta/classes/kernel-yocto.bbclass             | 34 ++++++++++++-------
 meta/classes/kernel.bbclass                   |  6 ++--
 meta/lib/oeqa/core/loader.py                  |  2 +-
 .../openssl/openssl_1.1.1g.bb                 |  4 ++-
 meta/recipes-core/coreutils/coreutils_8.31.bb | 15 ++++++--
 meta/recipes-core/systemd/systemd_244.3.bb    |  1 -
 ...ency-for-g-ir-compiler-for-building-.patch | 33 ++++++++++++++++++
 .../gobject-introspection_1.62.0.bb           |  1 +
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++------
 meta/recipes-support/icu/icu.inc              |  4 ++-
 meta/recipes-support/icu/icu_66.1.bb          |  6 +++-
 meta/recipes-support/libnl/libnl_3.5.0.bb     |  2 ++
 scripts/lib/devtool/upgrade.py                |  4 +--
 16 files changed, 109 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch

-- 
2.17.1

