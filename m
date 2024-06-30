Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB896C30653
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:28 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.4366.1719778104652680870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Gt7TUAJN;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-37613975e20so9842885ab.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778104; x=1720382904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHyUTiFNdIHLywVItIJmLcNHvRmSbypO/qW9YtQ8t/c=;
        b=Gt7TUAJNdYILpo4nU454xDpd94Zx1xSwJ0aEFplHX9EwYZT1C5KJfnxlm7NVJqwCIE
         aPCFFMQyn8JSqmPzPzmFaV5TMDkHs/YQ8ls/ygxdRiAYNt8MGa+UhI0A67H+d1uj5qlc
         ffoI97mFPUUN4ZCjDyi10lK+HY44m+IxPJGEcPx2U03onoZPC0SFckJP9vUb8pINNolV
         vfNYhpWu7OVuVqxMnqrlbZoP9R1K6MAxFh2O/rLA5x3e4q1MbS3TzaqiH2kgWdLXLTgv
         wtc4vnhp9zAbSlG5AnemWn+rPoidzvxsRdtkuMFvJKzvrEvMh6Ok2Mlq43zlneYkCY8r
         WIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778104; x=1720382904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHyUTiFNdIHLywVItIJmLcNHvRmSbypO/qW9YtQ8t/c=;
        b=MkOkrWgREkOK1tl2UPCza1Hm9eMMVrwu6S77pZlz7wtS2ezHwZ+irHKBYDaw6GdyWn
         d+nQMQj5c2FfpadldigdkKN4nrHacJCJyTut4stk8tLzhFrtOQlyLXv7IF11Gs33eFej
         b/k6dkurl3NJ4qEBzF7HeaSMZVN1/ZlOR/WxekvVqHnItvf4WmhpaUEspu/zWYK1ke8m
         bVss6OGrG0YRXikPbamLCXVncuMLFY5EbfR2AzwzXNB4r+f/8lUU5W1wQNMDaINlEzbf
         AOjP2b3vgsB8LEvXE5oe3dxbidsZVApECYQM7atYFkkRZ67VmRkE59EmWMvWisZrhLYR
         YDWw==
X-Gm-Message-State: AOJu0Yz7UOyg62wOFBHFyhbK0Wm2od3bIF4J0y+D9S7mwvz+/jZKFh7H
	RHHSLJihXXdmLhhtlLsS51Ts1DbicfBWqVbv4/cB70JghRuHHwNuZUr4fik6iNLD/DKdYWkeww+
	EiBg=
X-Google-Smtp-Source: AGHT+IEqKKKL+vdSjzRBcA9pLIrn6sLcnKPQELAANZom9cKPDZAfjM6kgF8C0wbJv5PvsdKlQgxCkA==
X-Received: by 2002:a05:6e02:1fec:b0:376:1c71:1e27 with SMTP id e9e14a558f8ab-37cd3873a56mr53021835ab.32.1719778103828;
        Sun, 30 Jun 2024 13:08:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/35] linux-yocto/6.6: cfg: drop obselete options
Date: Sun, 30 Jun 2024 13:07:28 -0700
Message-Id: <86467eb4cb39be7f031bca5d5e502f6c6fbcb297.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201253

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Paul Gortmaker
    Email: paulg@kernel.org
    Subject: cgl: drop SELINUX_DISABLE option
    Date: Tue, 16 Apr 2024 12:28:43 -0400

    It was removed from mainline in v6.4 in commit f22f9aaf6c3d ("selinux:
    remove the runtime disable functionality").

    Signed-off-by: Paul Gortmaker <paulg@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Paul Gortmaker
    Email: paulg@kernel.org
    Subject: full_nohz: remove RCU_FAST_NO_HZ gone from upstream
    Date: Tue, 16 Apr 2024 14:56:42 -0400

    In commit e2c73a6860bd ("rcu: Remove the RCU_FAST_NO_HZ Kconfig option")
    the so named option was removed from the v5.17 kernel.

    We should get it out of our active branches to prevent a warning.

    Signed-off-by: Paul Gortmaker <paulg@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8980da85dc1a55be4fcf2cb92859cc6066433531)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 91dbbf55ca..0972d4edde 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "5272561b019836f2ee2f175b23029649431d6fca"
-SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
+SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index fba19c97df..3b3e277c38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
+SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f887e293b7..a02452feda 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
 SRCREV_machine:qemux86-64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
 SRCREV_machine:qemumips64 ?= "d3abfe3c736d5869cb26f24c653b7e6eeafac715"
 SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
+SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


