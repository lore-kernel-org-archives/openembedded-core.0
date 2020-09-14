Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.555.1600122865251979271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VXMu3ifL;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id t20so1608816qtr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qwh6EddIf0nrc1ZAxGAgL+BgrQmpIziS4/RCkgXvx24=;
        b=VXMu3ifLdjTip00v2+VbjYU1yQo+x8yYMYuC8hdnFQnK/yFqvR61b/ot2LuaCi51WA
         FQc6sanwO+jG2DzW/e/BrZT2OnGZA0c1dXeA7uGDrWLGTSElg8Qu/YAixXy0v6G8d7aj
         mgrfBdHHvSyuV0Lr/zjtmS2kY702YESg6xTp0gvWw970MHxvLr/B+5wzv/RvgYV8oxXK
         /vhVvGoUqwsguMtbMxhVAizYVIY7Z31i2Xs5HCco1nKVc8OeGYmbRaQLIYXPHh7UlGU0
         Pur3aEkAMPWMOSLMbq4QSFNB8QLRoYxawdhCO4ln3FEULSjnbLycOSmoZwwSPflkDxqV
         Aqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qwh6EddIf0nrc1ZAxGAgL+BgrQmpIziS4/RCkgXvx24=;
        b=BzVoBaplrmb3aOw6mcGbYbYCN01ih2a2kXMeQZUVC1r5YA8MGP2wYI2jWgoWScNSDs
         sKIrlodovPhhnifz0fIjpzM0RYCMDPAnoRA9TNfnlpiZme7dzmDLW8t2UCJijsNisPSW
         uQbvh0MZ6yLGxALYoThnXJiSUYk+vOeIF6XaVLngnjUcLtwmkit0nl1lKD6XIdbqVyLj
         O8VReSrREhy8zxy9hlHzQHqqZy8Cvh4lGbs8RKOUjMbZY8b2uVPLRxg8OdnrHLEG3riZ
         bNTENf5XBjBAwNO7xeY5htTMfi+XD/Wwq6CSY87xTjWHdlJa9VUG5AYr+PcWS2HB4RY0
         iSWQ==
X-Gm-Message-State: AOAM530nIWDbXvwm9GASXQPfh6O1HaznRMYS+QAk9/nK3ADwXEwpVBWJ
	3pL437es0Z4GzYnL5UHy8SQ=
X-Google-Smtp-Source: ABdhPJxLnSxl64ez6LvAyo1tEXinlj10Gegpln2ozHgu2D6g5XAmMse1up6ntC76a54KN9RHdsPZrA==
X-Received: by 2002:ac8:6b81:: with SMTP id z1mr15431110qts.382.1600122864175;
        Mon, 14 Sep 2020 15:34:24 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v131sm16355770qka.97.2020.09.14.15.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:34:23 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
Date: Mon, 14 Sep 2020 18:34:15 -0400
Message-Id: <cover.1600122415.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of -stable updates for the active kernels in
master.

My first runs ran into the lttng-modules issues, and I've included a
10 patch backport of changes from lttng 2.12.x to address the various
build issues I found against 5.4 and 5.8.

There's a different lttng patch on the list, but it didn't address all
of my build failures, so I generated this full backport change.

Cheers,

Bruce

The following changes since commit 070d9b8f5e753e8928d2d7048e0c7bd9adbb3c29:

  linux-yocto/config: netfilter: Enable nat for ipv4 and ipv6 (2020-09-14 12:13:47 -0400)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/5.8: update to v5.8.8
  linux-yocto/5.4: update to v5.4.64
  linux-yocto/config: configuration warning cleanup
  linux-yocto/5.8: update to v5.8.9
  linux-yocto/5.4: update to v5.4.65

Jens Rehsack (1):
  lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+
    builds

 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-rt_5.8.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 .../linux/linux-yocto-tiny_5.8.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  22 +-
 ...ndency-issue-when-building-in-tree-w.patch |  54 ++
 ...ce.h-into-the-mmu-sub-directory-v5.9.patch |  41 +
 ...Make-kvm_mmu_page-definition-and-acc.patch |  39 +
 ...he-length-of-per-inode-prealloc-list.patch |  84 ++
 ...e-via-a-block-bitmap-read-is-prefetc.patch |  63 ++
 ...al-of-smp_-read_barrier_depends-v5.9.patch | 391 ++++++++
 ...teback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch |  59 ++
 ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 +++
 ...es-for-ext4_discard_preallocations-a.patch |  52 +
 .../0010-Fix-system-call-filter-table.patch   | 918 ++++++++++++++++++
 .../lttng/lttng-modules_2.12.2.bb             |  12 +-
 17 files changed, 1865 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Kconfig-fix-dependency-issue-when-building-in-tree-w.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-Move-mmutrace.h-into-the-mmu-sub-directory-v5.9.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-definition-and-acc.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-ext4-limit-the-length-of-per-inode-prealloc-list.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-indicate-via-a-block-bitmap-read-is-prefetc.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-removal-of-smp_-read_barrier_depends-v5.9.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-Fix-system-call-filter-table.patch

-- 
2.19.1

