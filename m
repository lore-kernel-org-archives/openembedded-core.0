Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB90CCD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 18:10:38 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.18743.1712167836586023235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 11:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VScIVoUr;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6963c0c507eso1123086d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 11:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712167835; x=1712772635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V3gRG2XSY7dlaT8pQdnPQBS2Mff7eGwPA0MB7JCSE3I=;
        b=VScIVoUrqYhyYXtO42lfUjYlQwLr1hQ0L3jElXulSZjh/bVJ4zPwu0RAO3Fxb5k3eI
         XJUMDvH/BLMnD1yGMYQ8GBV57oszuNqR7PYuEP7JyeMJF3CKdTUmAap377aO++Qb/w+5
         d9JiMhIBKCC1yHMmtifA3/tZODy3ux9D+Qt8AG3ARM07feharNXNBwA4/DkE6dnw34Fj
         iy8/vAeoY48k6p+OLH6ZXT9DJWG2wr2NNiVsJvb2VLdagD7jsbGW+DZHCWp5Pv8RIWp/
         k72tsqzGrbySFRO24GJqpVWJmrT48oHfrmPlngevIS/96d0s/5g1ecBec5QBMLzZDjj3
         rg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167835; x=1712772635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3gRG2XSY7dlaT8pQdnPQBS2Mff7eGwPA0MB7JCSE3I=;
        b=FR28eSwJ8v08TG3y6yDtsW2nxDbqFtZt7xSrT85QDG51FvH9GnE2grCNikU+OXaztL
         3MzkuWikVnf7CQFrZ4uzojMGEXVCeGF/ISymWALiM6vBRyhYivUk9F/7cz5Ku7X88Bsf
         TGwsXk22m9ORI73+ARR3U17W3a0TIc8rJHhLtEPXMmkTPPw5f0z6i7sSGbMzgofG0vyH
         nGKl/CAwKFIKOGwBwwPvhRNOktA4Kjee+xzFPkdNALrjtyole10pFVJ5uyYRubktxSkr
         5173h9UqCFMhiw+7UeofpWoD652aRyALcfHfTMWccw1Zghx4uCO61JXOC8y/PHF41b9y
         tKOw==
X-Gm-Message-State: AOJu0YxkCwuv7bLR1jIdB6NoNcmq5xhkmWLvAEb7qOaPd6EZ2bOt3EO5
	CDhppQZhRQR7ju9zsv9zmjRb8Luvc+EeY32N7wYI4P/NdZ49aL5G
X-Google-Smtp-Source: AGHT+IFBpS4viY4CgpO/WwDrCeV+p5qVU2sxg9WQNdzjx6lES9RUGvEnXRek14KkJLV5iMNd6c5dlw==
X-Received: by 2002:a05:6214:c88:b0:691:4d1f:6a65 with SMTP id r8-20020a0562140c8800b006914d1f6a65mr666831qvr.27.1712167835437;
        Wed, 03 Apr 2024 11:10:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id gy10-20020a056214242a00b00698c11f70d0sm6095650qvb.61.2024.04.03.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:10:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto-dev: bump to v6.9
Date: Wed,  3 Apr 2024 14:10:31 -0400
Message-Id: <20240403181033.1575986-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197936

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.9-rc2 is available, so we bump linux-yocto-dev to track.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index bd3e5a9406..9bd219825e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.8/standard/base"
+KBRANCH = "v6.9/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.8"
+LINUX_VERSION ?= "6.9"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


