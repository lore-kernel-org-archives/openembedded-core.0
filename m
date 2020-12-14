Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.36005.1607958567941560870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qhgSDg8u;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b64so11798392qkc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hFg9V5B6YaMh9bxvQ6ehscjPcmrGXeZGhbjqg9B/C8Q=;
        b=qhgSDg8uoQFJVwXM6fyCmNjBlNGIwZFOh6crE2hmD/o2JKLDOZAvCftQBpLKK4oLUu
         mQxDlowQjmbU2JCtb9YCa1NKoLkta+NzOXTfWeOW+dK47FPGBHBx6FPLvD0vqAV/686Q
         5qc2N0dqLeFZsKuI6jpiciTds8DVTWnjtQrwyvXTcaiXPFmeLt0fSdPqmhCVS8VCA0D8
         Mkmm4gk5FuSeD/DAWLguE+BXPitt+9O0yKnmqAHuus6QqEgnwOBo/gofzooDziEfYrQ+
         /NFb5xqjK6OR2llECFjOPtSgp6rDuKkUkA92Z/Fx3/kxF+GmizyLX6LYbRGaTok5iVJc
         SuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hFg9V5B6YaMh9bxvQ6ehscjPcmrGXeZGhbjqg9B/C8Q=;
        b=iZPwJt88JLScMe0FDIRqfPVKPDfMr8HTr3S2ETnBc0ANGVv6Jt/d4TryRG5N6/Dsos
         fhp83+9W9BlzSWI/kcwsnfq1JSOXLwSk6Nfq+6zyzbE82/3YaFC3fGpAVaWHcbfmRkA/
         7lPTgMwggKsnrCLbf4W+1SyPSxTTrcSHtBgR1DUxN6lssz3qooyug2PFNWmedw2zjE2T
         YrIqXFxvRzwICpXJs697iPpX5g2s/+K7Irrk/5JQ6YLBBR+9OCzkQGzGilZqtD3cyDld
         RZLso8u43kd65Gi7BomwC7IVbXWvnOQ8GTiDnxMe9hvYXzd/8OcIDBiTxDPTwQnXjqBS
         M4lw==
X-Gm-Message-State: AOAM530/TqQu7a4jDYBS6EMnQpHEYhp7XqRn6Ym6qeyB72sk/1cCQqO6
	gOhE+qKeOQhu09GuESrwJzw=
X-Google-Smtp-Source: ABdhPJyEjvoLN5TMdK39Mw7plf0/B/iL8STrzDMAfTa6bKyhWjpqa8B0E7D1yhzmExf2xFsXOp3h+Q==
X-Received: by 2002:ae9:eb8b:: with SMTP id b133mr32437338qkg.399.1607958566966;
        Mon, 14 Dec 2020 07:09:26 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a194sm13565070qkc.70.2020.12.14.07.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:09:26 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull requesrt
Date: Mon, 14 Dec 2020 10:09:16 -0500
Message-Id: <cover.1607958349.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

5.10 dropped this morning, so I'm switching over to the libc-headers
and reference kernel upgrade (5.4 and 5.10 will be in master, with
5.8 being dropped).

But since that will take a bit to sort out, I wanted to send my queue
of patches for other fixes/versions.

I didn't pick up any issues with local testing, so hopefully this won't
cause any problems.

I have the lttng-modules patch from a previous send repeated here, since
it may be easier to take it as part of the bulk update. I checked
just a few minutes ago, and there isn't a new tagged version of the
modules yet, so we still need the backported patches for 5.10+ builds.

Cheers,

Bruce


The following changes since commit 796be0593a607938aef3941372a9238b7e895446:

  bitbake: msg: use safe YAML loader (2020-12-10 13:39:15 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto-rt/5.4: update to -rt44
  linux-yocto/5.4: update to v5.4.80
  kern-tools: non-gcc config support and option re-classification
  linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
  linux-yocto/5.4: update to v5.4.82
  linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
  lttng-modules: fix build against v5.10+
  linux-yocto/5.4: update to v5.4.83

 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-rt_5.8.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 .../linux/linux-yocto-tiny_5.8.bb             |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   2 +-
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 ++++++++
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ++++++++++++++++
 ...ext4-fast-commit-recovery-path-v5.10.patch |  99 +++++++++
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 ++++++++
 ...int-Optimize-using-static_call-v5.10.patch | 196 ++++++++++++++++++
 ...defined-symbols-caused-by-incorrect-.patch |  55 +++++
 .../lttng/lttng-modules_2.12.3.bb             |  10 +-
 14 files changed, 729 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-ext4-fast-commit-recovery-path-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch

-- 
2.19.1

