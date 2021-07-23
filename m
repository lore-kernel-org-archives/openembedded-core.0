Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.9221.1627050639547597717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 07:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=git4P4Ud;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so9104256pja.5
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/+a7y4InjlqiCi0OjBmm+kPG1Sh3aV1CThJQz+u4+E=;
        b=git4P4Ud9m10gY4uaHvhtNjPoK+o8F9uGWYtEKSG49Y3rzl85Fz0r0EiIXPxS/I1H/
         uzt4rG1wCLPq4In8nJHKAThFVHPOCNQZiW2QKw0mzv+sd2dO7O/uNKvc1z814dfn/1mN
         DtC9IoK2CmRpVv+xMXE82GVBxEu6CiDy8bxrI6edqEblWDahBWeeT8uJJdGAIS/Wqe++
         R7POTR6uH54cADI+GnKgACjwdVaSRR71y0jQZza5e74jn4e7aRWAep/hnggoRShrMSMT
         PraIPkz6wUzmUPjQV5a8MP9EA1tH9BXcPBN68QvR6vdqd9ozGTStPVaRxbMGp6mkI48T
         k1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/+a7y4InjlqiCi0OjBmm+kPG1Sh3aV1CThJQz+u4+E=;
        b=BhYoSqAUP9hITCxCv974B/lwIRmHTBaJl5NGTHWYvhI8ld6V6PoHhc/i9k0o9xjcZl
         pnS2tV1MpPiha8GsBMdjfmJAh3gKF7C3eihmyvqE72H0vDYkzBcAJ3cu44JfmmsckXDj
         nxaU16jaYzLB3kUbz+fB+CtMPt9zAC7a3mg5nT29JWbMwczHdEhgLaEvpbRtySpLP+c1
         BhWiqn9xR527B+nu4587UjJcl45pQxy3S+ze7IDZGuwiPBCnTb7jXqzbiF4Z9AbOXQqg
         A9LI8sa4XfntN8RS3MkSg/lkPkb21GtRK3JGRfPPKfUhKRZ01qRd8+BQn8QTzxIKJ+xj
         WEpA==
X-Gm-Message-State: AOAM532eNjFezkvs6OJ3M7f1/dSeqdQCLtJ5FoOeufHUo/f932ymL3fS
	ggty2Fve3p2FD4XeX+7WjBTomMoy4ZTB6uX2
X-Google-Smtp-Source: ABdhPJzKYfjd08l13JMHyCWOcVu8J2d+kKQHp5ME1jmkqzBUbOM6SwBbmReRV7BsCKQdrnPjMOSe4Q==
X-Received: by 2002:a17:90a:6708:: with SMTP id n8mr4940433pjj.32.1627050638353;
        Fri, 23 Jul 2021 07:30:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 201sm13225144pgd.37.2021.07.23.07.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:30:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Pull request (cover letter only)
Date: Fri, 23 Jul 2021 04:30:23 -1000
Message-Id: <cover.1627050549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9b83aefa9c4a21d9dc1eea4a6b00af379466a288:

  busybox: add tmpdir option into mktemp applet (2021-07-14 12:27:38 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.131
  linux-yocto/5.4: update to v5.4.132
  kernel-devsrc: fix 32bit ARM devsrc builds

 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.25.1

