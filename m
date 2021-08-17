Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.40679.1629214055645385274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zibw3DPl;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d2so17429122qto.6
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZKTxnUBUqV/+74KFipetCZwCcT31Qqbo4htJIay4tY=;
        b=Zibw3DPlcGZDvavwE/wabEJ8lFPPZbnfMXCjLSmGzOvXIRXajztUEVrgljxDofai3p
         nPWGjCH1CDpt28gRG8lAUW0squFE7C7oS7BB6cKiHPEQI3xCDtsrGpf0gfE3hhQhPHZ4
         Gsa1tUE2KMISea8Nesldt4Rgvcb0oBmQUM1yZuLs6XVR2Ln+YrF+WXAsEsJdW8iJ0q0B
         eE05Osh8ff+oFvqtVQsHJ2EchU6eoX/XsMQDhXUmhTXTiT8IH8TUlDO5jadMgVZgb4m3
         aTnDP+oS8l4rMCP+cLE0z9eqhjdTrgyOtYxki0qzNzI7evdxtMgf4h6Qb0cvXTVOGaws
         Z5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZKTxnUBUqV/+74KFipetCZwCcT31Qqbo4htJIay4tY=;
        b=MyvffuaF21wpd81gXPaeEqfrVgtOCIdTrC0csfFFjGHCVmOeiWELkQxxlYAXytQ97E
         LrhrW32bTZmwAtnr5YnX7PX6Zaw50Kh/OkJ2vpytbFS1O7U+VpbUPzg0bfajc2HDmvob
         B/l9UE8ZbwzdHEUL1jRBSyBl5ynZCsixVG3Si0QK8dzBP4kRXmeB/BeEo5aMC4XDYFya
         Gy21O3jECwjI3sdrRzK5I+5V1j5qdRfhBfEuk1ICDI84hRefnPAZ5dnrwl3TOAJby5GN
         HMWnh/wq+YmvylDWmVS1u8/ejbrXmd/FcLjSt8rm0FFjssjAHSsTdw/+uHk0Xoi3hVU0
         fEfg==
X-Gm-Message-State: AOAM5316plyxZTv93/bf/7dZOvK/mNap0ceu0Z3oN2goV8qWFvNahyhj
	XyCkB8BKQwH8dbgBGttVvOQ=
X-Google-Smtp-Source: ABdhPJzo970wXVewOB9HnfxTv8TPzgII+37kl++wRflBDryGsdteq0bjWCrzhMHENBulXtpn6zKULg==
X-Received: by 2002:a05:622a:1494:: with SMTP id t20mr3669228qtx.383.1629214054601;
        Tue, 17 Aug 2021 08:27:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h6sm1175744qtb.44.2021.08.17.08.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 08:27:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto-dev: dev and supporting recipes updates
Date: Tue, 17 Aug 2021 11:27:28 -0400
Message-Id: <cover.1629213685.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Continuing on the kenrel update path, I've built, booted and run
core-image-kernel-dev on all the supported architectures for v5.14-rcX.

I've pushed the kernel changes, and here are the supporting updaes.
lttng-modules is of course involved, and on that front rather than
backporting patches ot the 2.12.x series, I've moved it to 2.13 (the
latest release), since that will give us better support and more
forward compatibility.

Cheers,

Bruce

The following changes since commit bc65a37ef50faba339fb54d6a89ef9da0298bbbe:

  package: Fix overrides converion issue with PKGSIZE (2021-08-17 09:53:04 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel-dev
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-dev

Bruce Ashfield (4):
  linux-yocto-dev: bump to v5.14+
  lttng-modules: update to 2.13.0
  kernel-devsrc: 5.14+ updates
  kernel-devsrc: fix 5.14+ objtool compilation

 meta/recipes-kernel/linux/kernel-devsrc.bb    | 10 +++---
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 32 ++++++-------------
 ...ules_2.12.6.bb => lttng-modules_2.13.0.bb} |  6 ++--
 4 files changed, 20 insertions(+), 30 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.13.0.bb} (88%)

-- 
2.19.1

