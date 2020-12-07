Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.6619.1607350367292078744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 06:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iNVxIPsH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id e2so631537pgi.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=vBCgSdEtYtHej++EDwq0swtST7TXkIhxgrJZizaiUEs=;
        b=iNVxIPsHKJwZ29pXv4Hme9z+0llOlPg6yrb0JMlcfQeHwmCbhMUMFF9mTJV3wJYJT5
         PpGE1/G3TJ+WjU2pVNzRL/0kdH5T2hX78ckD1fsWjGZr49mtl4cYy9ho12VJSPuz383V
         UYZNxd1eXFSbe46qOPQ5JtxxKDb4XcTf5o+VVX1Tp2VOHWeic8przuhJ8qTCiEnmbcE0
         o2Hp1dxQ4sHuR6dtNfmfduIYJ1YgEHYce2MfzsA1ycKtPBFwNmrLhlhrbe8xTD/2TYuu
         Biw+WFZ48O3r95vUD9S1r64N5jqzhuPTQYa4PjJPRtCakvfdykrH/ySQpHI1WWzTyjD/
         ullA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=vBCgSdEtYtHej++EDwq0swtST7TXkIhxgrJZizaiUEs=;
        b=r/dtzZJIkuuoGqPCTeHuWA+Yu1WaCER9Mf0PpEBEsBcPofvgqyG4cPI7i14U8prULW
         g0DO880UCx0oegTO0UdLXTtdqXjNH/G0nJ7T3LhYnee88BDVrcafqKIcet/gZAOqMQSD
         uEByZiIxhgfsaEN98HODivXkoat5H0b9gLIsQVTGSLTbLkvh6W0R4UOIXKY74EVAHTGc
         DuKm1CeDEtjbkieKFYYcMEFXe7mvCyn3f4Do1w5I5QB5V0YW+W7Txd+GSDFzHOZtVZHs
         /x7upBxJfpK7exFORykSJulOOD+j4kMnEGLS2j2jL1IZ0YVQJ7mfyGPKK1608tc/9f97
         m2Kw==
X-Gm-Message-State: AOAM530tTcdk05+LFV3Y26xMBhs+5hgKe5/mRS4QQYj9FSco0TLrOAnq
	Ap2lMdvWupxmrRJk3eJRWYXvUIPNlGarxUHS
X-Google-Smtp-Source: ABdhPJxY5KC2VOJND8jED3ET/YaBkOeRTxEJT35W9dVoaCFhnvYFoZGyyyyJHygUx0bzTjenhowzpg==
X-Received: by 2002:a17:902:22e:b029:d9:e591:7bd1 with SMTP id 43-20020a170902022eb02900d9e5917bd1mr16502425plc.50.1607350365947;
        Mon, 07 Dec 2020 06:12:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u3sm14848093pfu.47.2020.12.07.06.12.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:12:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Mon,  7 Dec 2020 04:12:17 -1000
Message-Id: <cover.1607350153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
Wednesday end of day.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1648

The following changes since commit 071806feb195961e59069f778c9ae8f27a739d9a:

  e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30 12:05:57 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (8):
  linux-yocto/5.4: update to v5.4.71
  linux-yocto/5.4: update to v5.4.72
  linux-yocto/5.4: update to v5.4.73
  linux-yocto/5.4: config cleanup / warnings
  linux-yocto/5.4: update to v5.4.75
  linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
    arches with 64bit time_t
  linux-yocto/5.4: update to v5.4.78
  lttng-modules: add post 2.11.6 patches

Lee Chee Yang (1):
  go: update to 1.14.12

 meta/recipes-devtools/go/go-1.14.inc          |   5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch |  98 ++++++
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...ncpy-equals-destination-size-warning.patch |  42 +++
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 +++++
 ...oints-output-proper-root-owner-for-t.patch | 316 ++++++++++++++++++
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ++++++++++
 ...ext4-fast-commit-recovery-path-v5.10.patch |  91 +++++
 ...intr-vectoring-info-and-error-code-t.patch | 124 +++++++
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 +++++
 ...Return-unique-RET_PF_-values-if-the-.patch |  71 ++++
 ...int-Optimize-using-static_call-v5.10.patch | 155 +++++++++
 ...-fix-include-order-for-older-kernels.patch |  31 ++
 .../0011-Add-release-maintainer-script.patch  |  59 ++++
 .../0012-Improve-the-release-script.patch     | 173 ++++++++++
 ...fix-ext4-fast-commit-recovery-path-v.patch |  32 ++
 ...-fix-include-order-for-older-kernels.patch |  32 ++
 ...fix-tracepoint-Optimize-using-static.patch |  46 +++
 ...ion-range-for-trace_find_free_extent.patch |  30 ++
 .../lttng/lttng-modules_2.11.6.bb             |  16 +
 22 files changed, 1686 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch

-- 
2.17.1

