Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD09C433FE
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.6153.1639137032720087540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VK9OEnIC;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u1so14402725wru.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zAXLNrWmDvJH7Lv9vOax1GB1IhB5xIwBrvZTTXqT48Q=;
        b=VK9OEnICaiO9HRModRUanJckHhM/8U/JIboGc/9Fg9hPIS+Kq31KFMVlkQSRnTokx0
         MRpZGyO2C7EN2t3S9OeWWm+g7Koawt3WfGMQjZ94MQ8GKycrmYsgikYafL5LGzJ11iiP
         1jvKlCwM29bhOmz0X+gMhM6MkqceieBhdt4rgAQQN3ARW9O3dTEuMi8z+rlPXTm6vaRp
         6JRaW/HAFZLBsUHlwKM9gNjUXqrroGIzOlpqr2RzvegQw+dH7rzMVpz4wM2oek0K+/0B
         x4P1YZRPowBHixAFDamH92tHJ51sMe+TPAdQoA0aWkbBkc0S6dmPRxKlJDy4jMKurQqr
         5S7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zAXLNrWmDvJH7Lv9vOax1GB1IhB5xIwBrvZTTXqT48Q=;
        b=ftf/o86EXKqd1u8pwolgD5oA26z26klEr1YyR6dnhPSSdFj1fDWpnDtQkl5c6Msfdi
         BTKKKRDAqGcDLxMeDRWEqE0ZLmSTiKB5Km0liwaNZLVOY6ga7a6Vjd/h12Mz1qOFYNtp
         a6gL0kemlLQyjePToNGnkglN5K6LR2Oa2ZK0bCM+IEd/vkehZnhWJXJkoaT3oplX9L3J
         INKZF68PIQGvIsT2Iq/7RZCE9kpxbNSRiDV36ml2kFF7RmibfcjzuPjjnWqVrPjj2WTK
         2CWVnb2VhT8AlZ4MTrU4fO87ISTszcfZmwBh25nrCrjlJ2NUTtGrapO/7UQlXO39xt3P
         o0+Q==
X-Gm-Message-State: AOAM532PYqsTnDA6+8PC2BIzs9msBzCJ3SAw8u4vvRt/M+Yvc/ZxQLnx
	gLZcOr3GT8oUUsNei+GLhMsDvOpvxXNHGQ==
X-Google-Smtp-Source: 
 ABdhPJz1QEAUlwg29ieM45bcOnrIO9Nm8AOeojcrFdxzThiN/GoJTNrxRmokXqzQ+WrXZIZMUz3Iqw==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr13638647wrw.21.1639137030801;
        Fri, 10 Dec 2021 03:50:30 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:30 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/8] Pull request (cover letter only)
Date: Fri, 10 Dec 2021 12:50:19 +0100
Message-Id: <cover.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159498

This is a V2 of overlayfs-etc image feature implementation, that allows
to setup the whole /etc under overlayfs. Please review and merge if you
find it OK

The following changes since commit 1a6c2a7345199d77ad5aeac8ad337ed80a8aa39b:

  build-appliance-image: Update to master head revision (2021-12-09 13:56:07 +0000)

are available in the Git repository at:

  git://github.com/UVV-gh/openembedded-core feature/overlayfs-etc
  https://github.com/UVV-gh/openembedded-core/tree/feature/overlayfs-etc

Vyacheslav Yurkov (8):
  files: add preinit.sh.in
  overlayfs-etc: mount etc as overlayfs
  wic: image for overlayfs-etc tests
  image: add overlayfs-etc image feature
  oeqa/selftest: overlayfs helper function
  oeqa/selftest: unit tests for overlayfs-etc
  overlayfs: update notes on /etc
  overlayfs: move templates to files directory

 meta-selftest/wic/overlayfs_etc.wks.in       |   4 +
 meta/classes/image.bbclass                   |   3 +-
 meta/classes/overlayfs-etc.bbclass           |  76 +++++++
 meta/classes/overlayfs.bbclass               |  53 +----
 meta/files/overlayfs-all-overlays.service.in |  12 ++
 meta/files/overlayfs-create-dirs.service.in  |  14 ++
 meta/files/overlayfs-unit.mount.in           |  13 ++
 meta/files/preinit.sh.in                     |  29 +++
 meta/lib/oeqa/selftest/cases/overlayfs.py    | 216 +++++++++++++++++--
 9 files changed, 361 insertions(+), 59 deletions(-)
 create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in
 create mode 100644 meta/classes/overlayfs-etc.bbclass
 create mode 100644 meta/files/overlayfs-all-overlays.service.in
 create mode 100644 meta/files/overlayfs-create-dirs.service.in
 create mode 100644 meta/files/overlayfs-unit.mount.in
 create mode 100644 meta/files/preinit.sh.in

-- 
2.28.0


