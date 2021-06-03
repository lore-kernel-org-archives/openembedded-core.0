Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.8405.1622729674540057853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 07:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gUvb6fy4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so5547330pjp.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LW/ekkeRgPOQdlkX5FHJDsgJUOWsxWiX6gvcljg6woY=;
        b=gUvb6fy4UHnG2XvPtErYWUtdkbgu9zovqEd8Nxf/m/HsCnG4Pn9KJlynDTzbKOjsJO
         4QI+rZPwapAzww2CkPf3XeetcrekeGSob0p7CsYU81Q3EklXTLEYPZnJfNxj2HxnNs2E
         WeyapnTmCUfYOr8N5CljzoSivtI2U2LYPlPPWPztpuISM0eUHGpTHjKtwewgb0qzFH/R
         HFJ8cbtyyjClZHHWyV43YUXJ2jSsEfhjQNk69EoyEGfHVJOSF3bufpU9GYt/SLeASBcj
         Yk6FtkhSAp7gagwaWeMIYHXH/ws2U3WHTRfgjw49iTJkOph5u/bcAhGmpRqwPnRbugbm
         PYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LW/ekkeRgPOQdlkX5FHJDsgJUOWsxWiX6gvcljg6woY=;
        b=reSLyRgKw+eoGVmnEG1XWw2hULiisHyI/rI1J/Z7/U8dY8SAcwluP/mXX/huRjIczD
         5YWuvSPkyqPptRr3uQ4rrAxnTOFFshgfpbXeskZeRfWUn4D67eZ+YOKTqD/izgAZ0K8n
         94svM5WRG8/7GrKMYJBk9vNIjHkTs/ULwmkqkcfMsFBjpr/52NmFhF6m5j2mKRjZSjTc
         zmNC8vr8RKhCf1ciNE+hj1LYTweoj5eio0QxxvIkkTyQsIh0ucfS9wANAz0TJr72Qg4I
         S+yVQaCcg8b31B1Gzksx9YMc25s1dwSsvXo5uZU4c3W3xt4AeAsTRgjN/qyEcaW1IVV6
         lfLA==
X-Gm-Message-State: AOAM531fVWxBKppUMKOdW1G9BcqEYwwfZOMMcIYPyDPJkgZIUY5H9fhl
	lET/eocQHYBOnso7HdGXn2WXlz1ghM16aWLh9L4=
X-Google-Smtp-Source: ABdhPJyTzYlK2oTZzr01ScGuHzSq0/1VoPsazKHKjvTQFgVFdi7lOaXBrKXYgPkd8mcZvvmTAP3H+A==
X-Received: by 2002:a17:90a:a41:: with SMTP id o59mr11157162pjo.203.1622729673304;
        Thu, 03 Jun 2021 07:14:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e21sm2521365pjh.55.2021.06.03.07.14.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:14:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/26] Pull request (cover letter only)
Date: Thu,  3 Jun 2021 04:14:14 -1000
Message-Id: <cover.1622729466.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ecd636154e7cfc1349a7cfd8026a85eafa219535:

  build-appliance-image: Update to dunfell head revision (2021-05-24 15:19:42 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

