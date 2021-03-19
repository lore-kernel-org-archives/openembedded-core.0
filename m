Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.1724.1616180320293509750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BcYgRzlL;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id a11so7581913qto.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4N9HRtQXmWnhW/j3hkND2n0P0hDXxMoDj7g4tauHLZo=;
        b=BcYgRzlLrXN7QkoAskiOt37k5q1tMDiACzvOzOCWISDk2gMprCPgQmghrYfz8wBuZq
         dfo3MTB2MkO/8T3arFNmlNhLuQodztzdyBvxPk2su5lkimXtrCUCqg0gA6I+ycKvrU2a
         rHyABOAcarfB+bTZgyNSnv/cxyaS+hjMwEMmWYnEb+uz4v4ff1nWyI5LLycWme+P6ly0
         guEJ2WbN7e9fxzx92yo6q/n6cmJ7kNq7+3V/9lIkj5Dy5tu9GmrSHQvumNAd9QZp/sLd
         uS5doFD34lLc6E5CWCPQ18H3xRG9pk/X59F8rQV2KHRF5GdAnw2dUXWhcK7yATkloD/n
         IFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4N9HRtQXmWnhW/j3hkND2n0P0hDXxMoDj7g4tauHLZo=;
        b=J6h2EzSt5jNm4eo98KuTkHKoJyPNEjJJDhGAzASzOybIoWwAWu9TFeji00fI3vFqoj
         uq3LlWaF038L/UaD7h8Ux80MjIV1isUjaUTtKQ2amgXSIQ8xuNazm2LAch4afr+0/d1Q
         njI6v38ipsoBmhikwyB4NtRcGbd6zSuVbCKnzF0Et5wGD0bfGkyeDiEToigJncG0wwmg
         zkXetSI5rVlyECboObo60S2xJhzyNhiPN1arQIn1DjQymEoZsmfh2Gy9z2LOsG9uNi5W
         +v81kBCBn8Xh3eSq92fuLi7JCqCzGSJ8flW/5Z30om/Tdz35ssWVjxjKD0CgG1VF+rrV
         AvDQ==
X-Gm-Message-State: AOAM530zpdx2xdeLny+6MFzmnv6oaPMvyM8e+G5VjdCwVU9+HrM+inZ4
	eseQexwkjrZtwmIxC++Cboc=
X-Google-Smtp-Source: ABdhPJx4TzSCUGRCAFMlV9my6w7DsUQUu1Tr6CC+AgPJeUjLNOZBglBZleRUOaSWFnY6kkUAmVHJpw==
X-Received: by 2002:ac8:4508:: with SMTP id q8mr78470qtn.48.1616180319349;
        Fri, 19 Mar 2021 11:58:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel: consolidated pull request
Date: Fri, 19 Mar 2021 14:58:29 -0400
Message-Id: <cover.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my latest batch of bugfix and prep for release changes.

We have one configuration fix, as well as a fix to the tools that was
hiding some warnings that we used to get.

  ** There's a chance that this kern-tools change will pop out some
     warnings. I can fix the warnings easily, but if it does, I'd suggest
     just dropping it from the queue, since nothing depends on it.
  **

We also have normal -stable bumps, that didn't cause any issues for me.

And finally, I'm preparing to bump the -dev kernel to v5.12 for the
release, and found a couple of issues with lttng (as usual) and kernel-devsrc.

I split the lttng one into two patches, so you could decide on the
backported patches separately from the devupstream bump.

The devsrc fix is safe for older kernels, and is a good thing to have
in the release to provide some future proofing.

Cheers,

Bruce

The following changes since commit 3cda6c0bd175282903079dea4affb3fcd290f137:

  sudo: upgrade 1.9.5p2 -> 1.9.6 (2021-03-16 17:52:21 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.10: fix SERIAL_OF_PLATFORM warning
  linux-yocto/5.4: update to v5.4.105
  linux-yocto/5.10: update to v5.10.23
  linux-yocto/5.10: cfg: features/numa: Remove NODES_SPAN_OTHER_NODES
    option
  kern-tools: add dropped options to audit output
  lttng-modules: update devupstream to 2.12.5+
  lttng-modules: backport patches to fix build against 5.12+ kernel
  kernel-devsrc: fix on-target scripts/prepare for v5.12+

 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  22 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 ...01-Fix-memory-leaks-on-event-destroy.patch |  58 +++++++
 ...preter-early-exits-on-uninitialized-.patch | 159 ++++++++++++++++++
 ...ecord-slab-name-for-kmem_cache_free-.patch |  91 ++++++++++
 ...be-null-ptr-deref-on-session-destroy.patch |  41 +++++
 .../lttng/lttng-modules_2.12.5.bb             |   9 +-
 13 files changed, 394 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch

-- 
2.19.1

