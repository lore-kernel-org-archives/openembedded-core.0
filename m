Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.16958.1605656882538063542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IZzAapwx;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id t143so146819oif.10
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RiJNqo44rAef9su/YtvYbZQaXWmOnRTiKnXk0W9mRJE=;
        b=IZzAapwxY4O/xgsqnKkBmB/8ErcNKqGgkjLqqGXccKVS27GFxaNMhZm97cuOmQMRiv
         UEfHRAfA9HAnnQSt+RKNjELQjMsOOl2ZDi4g1PcXwvxV3S23uY6B8Idzi6QS6Ky1M6Ra
         bSW8O1SUAFYucvaGBpLf9ocKYwqRupM20xDmWdsrk46Kg2j22121JwJgOwhFbLngIrXe
         PbJ1SGQp31lRKiZw7nF6v7qO5bz/4PrgtnvUbVz0ailSFjswsr1NwuuXnmbV86vAXUic
         d+saxF6FwSKiXaNCn5ohT8C5ZoN0ipU/7xHfePIeW2OXwGNYnB4Ei3Om3ztjkiJn8qQN
         ADEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RiJNqo44rAef9su/YtvYbZQaXWmOnRTiKnXk0W9mRJE=;
        b=SSzMyiaQH9S+mDjCW/tnXlaMxLWSHb6/hJoMm8a7JIGbkO0NpyzmNxIU6ZOuyP4ZYO
         /ID8HXV2eNrVWGTy9NJZ9DuoPF49WHuiaHx54lUgFkL/rH1yPef4om216+t5C23n8MpT
         x1HEWNjhLSPRSooR4D7Crqohab+ckr6gNcFjFdYdZi2sDZscUICuNjVhOGnN+Hjlt9OX
         ZboqDDK2FYJWPU8gLFriZF9zsF65j/iZpgS6qHNUdTAMnM9p6pcGBSLEowJlbinhXC0W
         LYUuxYuuQsLQ8QA2ehURatOFdYAjGrmCPMzkqGHAHPV14bkPykNrXqqTFi04Dg7o474T
         FdBA==
X-Gm-Message-State: AOAM531Xfllr8I75pb7f/lRh3kwu7mmlm6PhDN6q51f5CUVxjuIqIDxw
	PoWIGU41VWqS4h1yHBG6zs6tHp9uWpFlRxnV
X-Google-Smtp-Source: ABdhPJwPsNzhMOvyWBXhhuYppfSHzSlcuLxanGwBNToiBAS2O1TCqiFgm4R3tyw2a44P49XUzg6/GQ==
X-Received: by 2002:aca:ad07:: with SMTP id w7mr1003526oie.122.1605656881486;
        Tue, 17 Nov 2020 15:48:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.47.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Tue, 17 Nov 2020 13:47:30 -1000
Message-Id: <cover.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PLease review this next set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1603

The following changes since commit b4a92a20a683a74423fd5a833d5c016f63dba2b4:

  freetype: fix CVE-2020-15999, backport from 2.10.4 (2020-11-13 05:57:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  ptest-runner: fix upstream version check
  glib-2.0: correct build with latest meson

Anibal Limon (1):
  ptest-runner: Bump to 2.4.0

Joshua Watt (3):
  classes/reproducible: Move to library code
  lib/oe/reproducible: Fix error when no git HEAD
  lib/oe/reproducible.py: Fix git HEAD check

Khem Raj (1):
  ptest-runner: Backport patch to fix inappropriate ioctl error

Mark Jonas (1):
  libbsd: Remove BSD-4-Clause from main package

Mingli Yu (1):
  python3: add ldconfig rdepends for python3-ctypes

 meta/classes/reproducible_build.bbclass       |  90 +--------------
 meta/lib/oe/reproducible.py                   | 104 ++++++++++++++++++
 .../glib-2.0/meson.cross.d/common-linux       |   2 +-
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 meta/recipes-support/libbsd/libbsd_0.10.0.bb  |   3 +-
 ...-runner_2.3.2.bb => ptest-runner_2.4.0.bb} |   5 +-
 6 files changed, 114 insertions(+), 91 deletions(-)
 create mode 100644 meta/lib/oe/reproducible.py
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.3.2.bb => ptest-runner_2.4.0.bb} (87%)

-- 
2.17.1

