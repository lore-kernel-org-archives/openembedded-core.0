Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.58644.1622557110551123943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UHHyaVy+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so2027179pja.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UHK93WG2zOxUU5eQngfsA1btIe2KUFEHiblPMDo2zMU=;
        b=UHHyaVy+udSHPSS8fH8pTAfqxdiiTT8PEA10O3VtSsX9CGLGjm3ic0Z5k5S32Yk6Tn
         i6umP9Yy/uuZGbsMHiPTu01kyWNOQqQvyoX5YbS0pcgUKmw9UWsOmW7HbUnvvonsFfe3
         wDdSusoqPh5DBBBGoFHb5ufnApzACXDR4P35NvAs/+3Zb9DHxrwBgj7XvRtHR04DgLUi
         qQegSUXe97i8XMCKpOSozdL2ufuHbL/0uKkJfJJzjzhkPsU+NryVj6CA9sftYDp1EyX1
         d+4ctnlTx6v3LZZxrSY5umuU+cRb2PMJA6eLWCmUMbCwUR/VvWFgW/eLbZW2gxx7Q2Lk
         Mykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UHK93WG2zOxUU5eQngfsA1btIe2KUFEHiblPMDo2zMU=;
        b=Li4fXGF7CmumNlDcLYT23UZh95iLtG8bocmYzJUvsz5MfuSBLvzGYtjh9uyk0hnT/k
         mu6nelLVjbM+ovxsgWiGa3SRZvpOR1NxJSuDSrMnpd/M8ONfpA2sA5MYXrNfuAZUkpwO
         YcNbQ8LIhFv0zSoNe8YhR4OJVxcUG6EHJlfHuFb38yYGFUG3Ajq9z7fYSjLtj2OHjw3h
         V4pcvJMn9F6SqR+ZU/pcQpDpBRyH9TTKNBPBBDgtaVA/9UXDnrSaObZC6QhIbzXwWdlf
         Pm2NC4Q6v1q8d/yxqErXGffEKdIYoVLQv0dekVi+dMBipyelO2zIDxz8o/wlPU9zaD+b
         BFXg==
X-Gm-Message-State: AOAM532qW/2Y//4JDErNN+UosZ1Vvv4SUCQ0ssjNojoZOWPWn+ty106d
	aNUh8Vt8qGHWyCDqnXIJuUReZXGXfOo9Dv1qxvI=
X-Google-Smtp-Source: ABdhPJwA6jTmSjYnOEChvQTOj/LXY9/123ez0UijJlymNxI/QVCrlNyfVtHAuLdX0kNZ7RjxejznRg==
X-Received: by 2002:a17:902:ab89:b029:ee:dc90:7008 with SMTP id f9-20020a170902ab89b02900eedc907008mr26698792plr.30.1622557109218;
        Tue, 01 Jun 2021 07:18:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/26] Patch review
Date: Tue,  1 Jun 2021 04:17:48 -1000
Message-Id: <cover.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2205

The following changes since commit ecd636154e7cfc1349a7cfd8026a85eafa219535:

  build-appliance-image: Update to dunfell head revision (2021-05-24 15:19:42 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (4):
  kernel-yocto: provide debug / summary information for metadata
  linux-yocto/5.4: update to v5.4.117
  linux-yocto/5.4: update to v5.4.118
  linux-yocto/5.4: update to v5.4.119

Changqing Li (2):
  unfs3: correct configure option
  pkgconfig: update SRC_URI

Daniel McGregor (2):
  sstate: Ignore sstate signing key
  lib/oe/gpg_sign.py: Fix gpg verification

Guillaume Champagne (1):
  image-live.bbclass: order do_bootimg after do_rootfs

Ming Liu (2):
  kernel-fitimage.bbclass: fix a wrong conditional check
  initramfs-framework:rootfs: fix wrong indentions

Richard Purdie (7):
  cve-extra-exclusions.inc: add exclusion list for intractable CVE's
  cve-extra-exclusions: Fix typos
  cve-extra-exclusions.inc: Clean up merged CPE updates
  glibc: Add 8GB VM usage cap for usermode test suite
  grub: Exclude CVE-2019-14865 from cve-check
  oeqa/runtime/rpm: Drop log message counting test component
  linux-firmware: upgrade 20210315 -> 20210511

Ross Burton (2):
  cups: whitelist CVE-2021-25317
  package_rpm: pass XZ_THREADS to rpm

Sana Kazi (1):
  openssh: Add fixes for CVEs reported for openssh

Steve Sakoman (1):
  expat: set CVE_PRODUCT

Tony Tascioglu (2):
  libxml2: Reformat runtest.patch
  libxml2: Add bash dependency for ptests.

Volker Vogelhuber (1):
  busybox: make busybox's syslog.cfg depend on
    VIRTUAL-RUNTIME_base-utils-syslog

akash hadke (1):
  tiff: Add fix for CVE-2020-35521 and CVE-2020-35522

 meta/classes/image-live.bbclass               |   2 +-
 meta/classes/kernel-fitimage.bbclass          |   2 +-
 meta/classes/kernel-yocto.bbclass             |  17 ++
 meta/classes/package_rpm.bbclass              |   4 +-
 meta/classes/sstate.bbclass                   |   2 +
 .../distro/include/cve-extra-exclusions.inc   |  73 +++++++++
 meta/lib/oe/gpg_sign.py                       |   2 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |   9 --
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 .../openssh/openssh/CVE-2020-14145.patch      |  97 ++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  13 +-
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   2 +-
 meta/recipes-core/expat/expat_2.2.9.bb        |   2 +
 .../glibc/glibc/check-test-wrapper            |   9 ++
 .../initrdscripts/initramfs-framework/rootfs  |   2 +-
 .../recipes-core/libxml/libxml2/runtest.patch |  45 +++---
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +-
 .../pkgconfig/pkgconfig_git.bb                |   2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb      |   2 +-
 meta/recipes-extended/cups/cups.inc           |   4 +
 ...20210315.bb => linux-firmware_20210511.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 ...or_CVE-2020-35521_and_CVE-2020-35522.patch | 148 ++++++++++++++++++
 ...or_CVE-2020-35521_and_CVE-2020-35522.patch |  27 ++++
 .../CVE-2020-35521_and_CVE-2020-35522.patch   | 119 ++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   3 +
 28 files changed, 571 insertions(+), 60 deletions(-)
 create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210315.bb => linux-firmware_20210511.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch

-- 
2.25.1

