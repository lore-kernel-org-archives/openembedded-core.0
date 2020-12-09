Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.4925.1607555540826075014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 15:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oAXZr42G;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id 11so2214230pfu.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 15:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=NOrsQr1AJE+Qhf55NfZgdS6R0iJYz6xu6i3h3onTPMc=;
        b=oAXZr42GaPPXgEVXJRAozy/KDn5UmbZN1fTVyWNhqFSV8dgCICBbtk6UoAYkcyWgrn
         IP5ECPz8THr04eF2w4SnQaLCvuwR0yIj/oj3MQrojt63e5JFjCVDeTMT7+Q900OscdiM
         yh4yMarL1j3UvV6nvzHapNEsKvqG0jqgMcgmJBxT8oK0GRb+FBLuq4Dj2YxnGkVfsOrx
         K1cI7QglTT40OtCpuA3SiZao42zHTVBCK+OLQluCB2qfoIkMEV6jqySjVzlJYA1gNpEq
         1fpDLriqpUihlrdUW7x9zyH+WBcPgFG1uuPxnwX0ZBp9KDviQ32bcIQMiry6NO9OmqiK
         AlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=NOrsQr1AJE+Qhf55NfZgdS6R0iJYz6xu6i3h3onTPMc=;
        b=AIlYb2og6PCNOgIRIQmorRFnQTK4vXGMPtKBcMSr+QdXnsquYAq2hQlx7hsyg8Dw3j
         CcoKgL/1rwBqDMDaMNxSXavEXRXwqvR06HBu75hsdPgjIkAmjpaOQnxeyaCrO500Vwq6
         gKu62WIVHA+hp3TLFNNYrEih2w701J3GnGl5GQ6nJSL7tjsH75uQhxD84bKyQqAy9kUr
         ZTLPlD6R74APIOLW8ZLgajRwWxrDidfUts1lJ1OYJG0Rbt4tq+/SSmFAMI6gP4BT7Jn4
         JjyfxqllmrUKt2egdfru/gDEzbsrMxS3IAaL+hdw77cs1aTtwz/Tlf3raaGZsM0Ms97a
         MEbA==
X-Gm-Message-State: AOAM530SBKd8c9tw6+5p/ClLdfdfmNRdumvr0ZUebTZ09SHYexuwiwmn
	MHcK/CxPm3DrzT3IlFcmCwJpsDXmhRN3GNDI
X-Google-Smtp-Source: ABdhPJxnDVdnbuby1o6DtxfTwtqdp4RPd8ek9/wRPg5qlhHEFjZb4nLkBSF1G40sOMLS0yYw8Q7EVg==
X-Received: by 2002:a63:3647:: with SMTP id d68mr646126pga.172.1607555539607;
        Wed, 09 Dec 2020 15:12:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l66sm3474629pgl.24.2020.12.09.15.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:12:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Wed,  9 Dec 2020 13:12:08 -1000
Message-Id: <cover.1607555391.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 071806feb195961e59069f778c9ae8f27a739d9a:

  e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30 12:05:57 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

