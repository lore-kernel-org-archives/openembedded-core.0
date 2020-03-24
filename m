Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.576.1585091106857552689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CWuAxA8/;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id d12so561816qtj.4
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 16:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFGVlCk+46lVsvx7IV4qKaMTQ33+j4sjdurp1BDYTsE=;
        b=CWuAxA8/zHHqmwkt6NbbvDE1JJKjMi0KA+KGpjWyRRueAQmmiGjRKc9ZZmpKAfCWZA
         0tIvytCMysyheMtxdLNERGepfHJLDHSHoOmMHu7nxZAIvZ+00QNjyrbwbO6Q9TGc60d8
         bLeCc2t7t30Ck9o1yAkhjy2ATk6Z5D6LtT464BjaWfxjsUy0aS+aavh6tmX6hu1Oq+KG
         fyGokoAGMDe+9MgTAa+hYpk2C+RpV2h0zkmYiftECzGsx+0Ld+99xS6Fd6//xIPhARRa
         Jc0yN7naIjAlBkmicWeF0a6jAE5tC6Z5JT0v+mgFrRIEj1cynMOfYd/F/yMcixD4eB4a
         tTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFGVlCk+46lVsvx7IV4qKaMTQ33+j4sjdurp1BDYTsE=;
        b=Mwneil/bZp9stXMqv7Hsb8C0Q7gbf2G346/wmE1YR6tpLpS6fkHo/H/U4gxyqd7N7R
         z7Ffn3B8yVStxuMpU1wkCQHzM7SK747cyYtHGXN1erbyvNY9Lie2kka8v1Px3IPxE0Jm
         g5SpAu0BWLCRKMd5rOJ35Hl2SsyJYoLwEDtWvzJbyGJyVhgAxr3/J4G6b5BZmL8K3ZbT
         24RPpn3hHvKkSn9IYaic5iJUBGw34KO3yIxnFuhyxOcVuNKBOS8Fdgv5blu45eUI9yoH
         b7Ka8Im/RpFrJHCj6mDA3+60pXzeGQALeS+1Ecfzx5gwGvRSdflG+XEw0pFWblFqdgAm
         qrFg==
X-Gm-Message-State: ANhLgQ2SYpaMk4wR5jcWIl5ghRwh8e2iySkPtz/4WQFHFL7tKqvZC7l0
	yh3266BpC1Hhxctvyn4w6pM=
X-Google-Smtp-Source: ADFU+vsu+fE/Wca4kvdxZfaS2nEM6CXqSM24h0lvzDXHlKboJEhu4cBn5lOAjSQeHvPvK6HEXgK2Xw==
X-Received: by 2002:ac8:108b:: with SMTP id a11mr282090qtj.176.1585091105787;
        Tue, 24 Mar 2020 16:05:05 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l22sm15153655qkj.120.2020.03.24.16.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 16:05:05 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Tue, 24 Mar 2020 19:04:58 -0400
Message-Id: <cover.1585090957.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the queued bug fixes for linux-yocto. It has khem's identified fixes
for the kernel selftest issues with the latest -stable udpates, as well as
some BSP fixes and config changes.

I ran this through the AB and everything came back green.

I've done this in multiple commits, so we'll have granularity to look
into individual fixes if we have trouble.

Cheers,

Bruce

The following changes since commit d5db9d12642e03a1d5cca5f1520dad5fcc9524c3:

  archiver.py: fix typo of "ARCHIVER_MIRROR_EXCLUDE" in comment (2020-03-24 16:39:40 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/5.4: Revert "platform/x86: wmi: Destroy on cleanup rather
    than unregister"
  linux-yocto/5.4: fix kernel selftests
  linux-yocto/5.4: KVM: LAPIC: Mark hrtimer for period or oneshot mode
    to expire in hard interrupt context
  linux-yocto/5.4: ARM: 8918/2: only build return_address() if needed
  linux-yocto/5.4: configuration tweaks

 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.19.1

