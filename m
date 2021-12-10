Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D31DC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:01:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6889.1639141311533591271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GTKujAKJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u1so14723539wru.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXy0USqsMxOzX1DgPfReJUVbqKAKxLRDrWs7GvOiclc=;
        b=GTKujAKJ3tapruYO7mm7nIUeU7rzzwclbG0eYJX+QXL7wu0vHRTHH9VVtp66z/JHDV
         7CDmw/TIEYFVNVtu9iqxqZ1LWoSmpSm9Q4lWulHqKhPJI54qA/K9knvMnPxLYcyEIFjA
         XmID3gh8tIOOx8VJF1bgPT2H8GsELc86OmlJ4jVUrHUWqeQUbIzYMbFWCjiqPH7aC9kl
         t5bexY7rL4EB7vnXTaTnMaFaP5qE0eHJJfBGLaGNwfrI7QxA2IMOWhy5fNAKVUccYRuM
         rdcCy4HQstMc45WSU++qxwXumwsdXs2rR+dW8FIWIyYu8+6p8bHiQilWWbQgvYVBCdAQ
         Zalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXy0USqsMxOzX1DgPfReJUVbqKAKxLRDrWs7GvOiclc=;
        b=L/Pq+gfGBusrgyQdkc6LMlQUZZfBaiHYC8Z8GpElj3CVwyEJd0rkGALB40F7r7E0v/
         M35MPTSveGPjnWbXgyV8550yP9S57v5QIIFqipigFigSKuSi7/kyq4DCzsyiEYgUr8DG
         B7oR/P+U7C0SZ0zuNoVV6akg+IC9dPcqSKpX8d5FfKIb/KbY1pajlb02Kv9yWJCXcLea
         DuGnEw/Iq1YyAdfSEdxqhgkKIuq4Jss5KBMhKvCXX1KJ96xf8OQpiYrsU+RNJkff7AG8
         uSzjV8funCrmENpeMDLX6G74uNF5vdRiJEzFCyY3IPxffoCIH2P4l2yvFkLAYINxp4Oy
         ATuw==
X-Gm-Message-State: AOAM530fuQ51YGTfEgOHX+mxxvEsS4IYqYq8C1+OmMNGkprfyO6ranse
	ykeN5sHRBL6D7suwqEOYns8eECjuEjBpTw==
X-Google-Smtp-Source: 
 ABdhPJzYt45qFBAW0nZI/LO57TijKtjNaDjPsvuYy++wqV+QQEPNduttvlx17Np26etOkOOTrmuepw==
X-Received: by 2002:a5d:48cf:: with SMTP id
 p15mr13775473wrs.277.1639141309315;
        Fri, 10 Dec 2021 05:01:49 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:48 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/8] Pull request (cover letter only)
Date: Fri, 10 Dec 2021 14:01:37 +0100
Message-Id: <cover.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159509

This is a V3 of overlayfs-etc image feature implementation, that allows
to setup the whole /etc under overlayfs. Please review and merge if you
find it OK

The following changes since commit 1a6c2a7345199d77ad5aeac8ad337ed80a8aa39b:

  build-appliance-image: Update to master head revision (2021-12-09 13:56:07 +0000)

are available in the Git repository at:

  git://github.com/UVV-gh/openembedded-core feature/overlayfs-etc
  https://github.com/UVV-gh/openembedded-core/tree/feature/overlayfs-etc

Vyacheslav Yurkov (8):
  files: add overlayfs-etc-preinit.sh.in
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
 meta/files/overlayfs-etc-preinit.sh.in       |  29 +++
 meta/files/overlayfs-unit.mount.in           |  13 ++
 meta/lib/oeqa/selftest/cases/overlayfs.py    | 216 +++++++++++++++++--
 9 files changed, 361 insertions(+), 59 deletions(-)
 create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in
 create mode 100644 meta/classes/overlayfs-etc.bbclass
 create mode 100644 meta/files/overlayfs-all-overlays.service.in
 create mode 100644 meta/files/overlayfs-create-dirs.service.in
 create mode 100644 meta/files/overlayfs-etc-preinit.sh.in
 create mode 100644 meta/files/overlayfs-unit.mount.in

-- 
2.28.0


