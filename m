Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.1621.1618790795030226615
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ae+sIYA2;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id h13so15631847qka.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 17:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eyhe7ZhVQj/favSbuQdM157w/KiqZdwbpq307iwmV18=;
        b=ae+sIYA2u03ba0MtPdg5eFCneT0EeJz/8sXiGjy3ld6tEeoZ43LcEZRI89AkuhRP+Z
         cvbBNiSOfQqBcX8ysIJkaut6PAF8Bbex6chJUNNq0MZBeL1iuZvps//LbACguJH6hR0d
         7Mb+sUuSJ2JQ5kn8xJBTsEd+LXg6auAB4CiFaIHgCztFZ4TO3KhLlWAYKdPN6rg4t5+3
         b3R1Jw9eUXNqC7uWTZP7TBb7ONED2/Qoci3FyM6d3cxuhhh9oGHyGxyA2BDUkEsWjWUO
         75/Qkj8Qz/IC62BgG14bgXEIQgzewe2a4GcJW7J70CMCH+/zaEEyuglb8Il/zdbfNp89
         4Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eyhe7ZhVQj/favSbuQdM157w/KiqZdwbpq307iwmV18=;
        b=cpopU1wp5fZiyx10lSTZIEbXTHGhORhhIFJw4jpQgGAQB1GL/POVwVO2KNxRmqL1MA
         sUVBQ+2B9VUKRTwhA00x8DCJi0evpd2kY18Ppg//6rrkxgGxbSB+9lR/EzkHqecncSjN
         6dMtXcCVBv6G7f5KteghHlY6qyMTZOqG7hEiPPaNPvNXODBxixSyLTBEempzw2D2ltea
         C1PHp0MAAwyVVgZTz4Fxi6idqqZOCaje16iz/ZE3YNU8r39F9dVg06Z3gCQN4PYpjsup
         L+KFa9oKqluVt9be76D6xaGaOtB67naxKJHI5CcKMsP4MqUDtSB7x1tLvw9TiA0q08Rl
         QkCA==
X-Gm-Message-State: AOAM532meOQj5O5Rr5zqE3InIUUlmsCdop4ug2aGVACRB8b3RICW6eq7
	WuHvo/YZ0hefzyBw9smwRFg=
X-Google-Smtp-Source: ABdhPJw5Wd61QLz7kRDScGqKJBu/rS+sD7UJ7PlOawCREn8nP6er1Z+Wf0IjzFNR1WmpC7p3+QMhvA==
X-Received: by 2002:a37:9547:: with SMTP id x68mr9560626qkd.474.1618790794225;
        Sun, 18 Apr 2021 17:06:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n136sm8641759qka.133.2021.04.18.17.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:06:33 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel: consolidated pull request
Date: Sun, 18 Apr 2021 20:06:22 -0400
Message-Id: <cover.1618790681.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the -stable and bug fixes that I've been sitting on while hardknott went
through the final steps of release.

I've been building these locally without issue, so I don't expect much trouble.

I've also put the kern-tools change back into the queue that caused some warnings
when I submitted it before, but those warnings should now be dealth with. That
being said, I'll watch the AB and deal with anythingt that falls out.

Bruce

The following changes since commit d08d362cf98e9f3b6e99f4f9e33638e1fceffbaf:

  bitbake: tinfoil/data_smart: Allow variable history emit() to function remotely (2021-04-18 11:38:22 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  kern-tools: add dropped options to audit output
  linux-yocto/5.4: update to v5.4.109
  linux-yocto/5.10: update to v5.10.27
  linux-yocto/5.10: BSP configuration fixes
  linux-yocto/5.10: update to v5.10.29
  linux-yocto/5.4: update to v5.4.111
  linux-yocto/5.10: update to v5.10.30
  linux-yocto-rt/5.10: update to -rt34
  linux-yocto/5.4: update to v5.4.112

He Zhe (1):
  linux-yocto-dev: add features/scsi/scsi-debug.scc
    features/gpio/mockup.scc to KERNEL_FEATURES

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 ++
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 8 files changed, 40 insertions(+), 38 deletions(-)

-- 
2.19.1

