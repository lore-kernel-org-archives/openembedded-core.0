Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A91C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:50 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.5008.1633479169087050396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ecC4T7hm;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id d20so792965qvm.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1ZAvv8idwho5RdIOHzQFF3gekQ7Q4IIbuZvIZKvOSo=;
        b=ecC4T7hmz3Pzo12T1HyVyf0uYKOCqs8VpjuIVxdKIj0R9Rbm4R5kdLuLrxJDHI20Cn
         z5B5cKnwjcritaDcYEQk22fhOpppaxkUIvq6F3ZuO0gGSqc4bqTFrrTigcn1IKlLQ8QH
         kKmSBLaRE+T6PH4Z/6k+bq6jRhN/pMO4kEFXREG+M0FSw+bE+26on8otFw2TxsZUJslR
         gWPG+NkZPRyCxAhMqcdKt2hHc/A170ekMHG8TGYJc7qatzb701FQF5DMLFVDM1abC6OS
         IrqubuX4R9DzzyZEn5Uc5hxcY4Uj3P4zVldNPLWoNf87hbj34dlV5ZX1rDCEJPWYZM7+
         9q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1ZAvv8idwho5RdIOHzQFF3gekQ7Q4IIbuZvIZKvOSo=;
        b=UaWMeN59spIebsjSrc/EP1YGN2r/SC8Ef1bOERHbf3Y9EnW94VgTlp6a6bQN1awMen
         1MFcIOuVlV2x5Wsh+QXLgDaPRtpupftKoT2TmsBJlOQx0SVQ4hCy0IBhLjGHJjg+pzn2
         duHCfJQEIFOzdVYwQp6OAcYCh3H8cOXi6LihChqFSF644H5mw2GMXSH8T4HeL98e+jwS
         z/A6FqqaNPygRhPnmXvccbttjPJSLmPC/JqrARCzq2H4GqKrI1Bvzjnwaow5md4K+XB6
         fLa07unGFwYShOCL3Xn/PgziQYcswG0eZUCJmvMyJYt7YLFMOJWx7PHE1Ej7bKP6kpXs
         hHOQ==
X-Gm-Message-State: AOAM530B6M4qUj/MkFG+EU/J0mXfcDtbTZf7KcKrzzQ52+0hG7VtVHFj
	4JxN/vdzK8ddjXzM74FqmXI=
X-Google-Smtp-Source: 
 ABdhPJzwuB4ZzaN4Yr6ghSGFfNUm5WLgBwSaH2aFRaplk92rg9/zhq+HZutK5jh6wQpWqtzzL7yicA==
X-Received: by 2002:a0c:fc43:: with SMTP id w3mr30652502qvp.46.1633479168151;
        Tue, 05 Oct 2021 17:12:48 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto: consolidated pull request
Date: Tue,  5 Oct 2021 20:12:39 -0400
Message-Id: <cover.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156660

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable and bug fixes. I didn't detect any issues,
and everything is pretty routine (famous last words).

I assume the release builds are underway now, so these are for post
release, and any stable releases. But if you wanted to grab any of
them, they are all bug fix only.

Cheers,

Bruce

The following changes since commit 80f2b56ad8c270269d9f7f65cc114d8f13f9dfbb:

  reproducible_build: Work around caching issues (2021-10-04 15:03:54 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.14: scripts/gcc-plugins: consistently use HOSTCC
  linux-yocto/5.14: update to v5.14.8
  linux-yocto/5.14: bsp/qemuarm*-gfx: use virtio graphics
  linux-yocto/5.10: update to v5.10.69
  linux-yocto/5.10: update to v5.10.70
  linux-yocto/5.14: update to v5.14.9
  kernel-yocto: don't apply config metadata patches twice

 meta/classes/kernel-yocto.bbclass             |  5 +++-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 7 files changed, 43 insertions(+), 40 deletions(-)

-- 
2.19.1


