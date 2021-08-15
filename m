Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.12134.1629040142120173009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tKL+keuc;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y9so12341968qtv.7
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90PUCNtaDI2LdiRnjgHGbE6X6IqbkAPdzsHKDqTAqPU=;
        b=tKL+keucryQiIYvdEkOEUNT7KtYKbStgUVN9yEsnffC6DRh3+shgFDKBXnvHZ7pG92
         IPU28oLHeIs6D+Pka24pih6K0x6kOvcKafqmAvHDRvkbdfcKUIMm6UhkUnJY90xEb4ot
         tGQYCYFyX/sxMwau0thkiSnXzreQeOoKMVJHltr1kuxJ3xqp7lgPhVU9abo4Ajadgl7K
         wzTAvVwSv5MRpCLle0PWefCnsgLTW5o15S2m80n+DhL+C5A4NXOgJEKnJ9+6LP0SuENL
         xf/6KRBLlnZ9tqL2iglExeKqInlaeXK4YN9RBT0FmS69o7sKbKzWv7huzha8bX2j2pxh
         4Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90PUCNtaDI2LdiRnjgHGbE6X6IqbkAPdzsHKDqTAqPU=;
        b=kJo+fYHKh/r63pNx3qbW43tqNOU8Ir0ov40J5JcjJOkYqKH9zFaF2UjdNymLPwJY4r
         VvAHUJ7bJUgsUG0OsuFE0CrRL3VRhtPXJGnExrlW7nyhtD000LYO4sn4QUytKq0GMj+f
         OdFOb838FFXUo8TIw2gXDkS+ju1/LWEGIA6PGi4LJM2XhG+Eqfwfd5yVEWENtCNQO3sq
         KLs2xKpZmgf2CXBnfeP0zuT/X5ZeQl0EXauahBfp8XJb75HoadOHSn7qq5wpMxXPCUhf
         sBA0McFCW/gdg/GMtHnXH5/ICxcv3I2iB6lFGXs+TxJ5km853iu8UbebnsJPIZX8xHI8
         y97A==
X-Gm-Message-State: AOAM53305vhfo4UBN3JmTBLp4ihiqeOE8ZCElWDLIqDaCSrOvLn45aEJ
	hZ+UgCPtyT4TYgpyw9D7/xc=
X-Google-Smtp-Source: ABdhPJwhnCvZXx3MTg4S8pA2l37njPIkTHkL3+GRYAdsTnLkoPGWPw522CQ3sdn14zhnAlRdBR5n+g==
X-Received: by 2002:ac8:47d4:: with SMTP id d20mr10194753qtr.58.1629040141231;
        Sun, 15 Aug 2021 08:09:01 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n124sm4690466qkf.119.2021.08.15.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:09:00 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel-yocto: -stable updates and 5.4 removal
Date: Sun, 15 Aug 2021 11:08:50 -0400
Message-Id: <cover.1629039837.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I'll follow up this series with another to poky that updates defaults
to 5.10/5.13 kernels.

I would have liked to send this a few weeks ago, but with vacation,
I wouldn't have been around to deal with issues. 5.13 has been in place
for a while now, so I don't expect anything major, but surely something
will pop up with boot messages, graphics, etc.

Obviously the version bumps can be merged without the 5.4 removal if
we do have problems with 5.10/5.13 as the defaults.

Cheers,

Bruce

The following changes since commit 0b8f844c8c00f5d9648d55e8bf57b2d0fde090a2:

  kickstart: document which options accept units (2021-08-14 12:04:24 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.13: update to v5.13.7
  linux-yocto/5.10: update to v5.10.55
  linux-yocto/5.4: update to v5.4.137
  linux-yocto/5.4: update to v5.4.139
  linux-yocto/5.10: update to v5.10.57
  linux-yocto/5.13: update to v5.13.9
  linux-yocto/5.4: remove recipes
  conf/machine: bump qemu preferred versions to 5.13

 meta/conf/machine/include/x86-base.inc        |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.13.bb              |  6 +-
 .../linux/linux-yocto-rt_5.4.bb               | 45 ---------------
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.4.bb             | 32 -----------
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 ++++-----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 55 -------------------
 11 files changed, 41 insertions(+), 173 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb

-- 
2.19.1

