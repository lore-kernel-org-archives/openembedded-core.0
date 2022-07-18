Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9991DC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.21961.1658104300769744028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lMRON+Y/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id o15so10330989pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dK6j9nwoSxT3uIHtKz3L78BWvUv4fVPpGCUFxUcADow=;
        b=lMRON+Y/nvHrDr+UXPSoeHSWzwjJmJMJd8QAvXxBEUN4fhXiQg9roUXz18zwK2d07f
         LGTNTDCc0Wd61y5GI4HI1pWuZGx8vZpyviFrq9OdxzWcGC+8DWW83hhWiYwBWxqdAf8S
         SNfdtLKPbRuM4ZS955gFWtsW5ndYSBAubyVnU0JaTB3MQGO6RXNUcEF58/Efgwz6EPO/
         ItMqVBiQvebSpYhveNXpqXKZ4oi7Wh3pPx2+rLR8/k5rbuto4bpY+T9SLg5lhqraAaX2
         GJYQ1xP2cmY+BB5/9zlLm5qO41ockEZrFgitlpxUC3SUtepPFbqyWcDFnx6Z1xAcGXGK
         xrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dK6j9nwoSxT3uIHtKz3L78BWvUv4fVPpGCUFxUcADow=;
        b=zKpnxDhu1yMYJ2jHzrDXT9HLLrKI4F+oOwOJsmezPyvunE9U022++xGDH/NNzkvvmT
         xtrTfFrV9E010I5NV0gQt+x5tkJ0CWXRWJzKYVLjOCC3twyWCz8pgTXH1OnRwBgi7bBa
         Z7CWbvRDIV9rVq9t4qYmnclpxuZd/p8ocQetXtqarLuI4rhiWySldIV32Ev5e8/yzRr+
         imUrxC01NL27Z4SO3VBlRkRuC0+GBksghtUQ4nOfhn04vkNcUA2M0LFzqXD0+B+zJTx5
         dpKidbf5rYe8+3SBGHaKptUM9c5ZMKdGSzg1e793KbhgP6jG+mcwUoIdUVfHPk6gdyPI
         SjHg==
X-Gm-Message-State: AJIora+Acy0EMwDUCUuBUJMUrJdz+dvrHm2DIxgHXyEVQjtYEqSulaA3
	6xk30wXnMoVmVrkNLUpHlrFg9vItrU3LiOpQ
X-Google-Smtp-Source: 
 AGRyM1tHHdHV50t3qpgAJjmcXVzAgaOF+2+t+bp/WlcUQ2C0Vppkl2bZ0V95MSKQPYVwSW+VYfyxDg==
X-Received: by 2002:a17:902:f68f:b0:16c:2ab9:9bdb with SMTP id
 l15-20020a170902f68f00b0016c2ab99bdbmr25462561plg.23.1658104299769;
        Sun, 17 Jul 2022 17:31:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/23] linux-yocto/5.15: drop obselete GPIO sysfs
 ABI
Date: Sun, 17 Jul 2022 14:30:13 -1000
Message-Id: 
 <4b896df4311b2255253280f51240dd08f2b1dc60.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168177

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    6778005b9fa treewide: Drop the obsolete GPIO sysfs ABI

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c499f598fd3651c356cc218d7b1a9858467fc7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index c81c47e290..eee69be7a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9474b2c18a66a8172c2a13c9e83f02bd72e3df1d"
-SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
+SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b82aa62da9..5a1bc5b6cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "59aca7a6181799d691277b32cc202cf5ac997683"
-SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
+SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 91106223df..4a40cde7d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
 SRCREV_machine:qemux86-64 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
 SRCREV_machine:qemumips64 ?= "6b35c884701422bd1ce0821ce316993483283d6a"
 SRCREV_machine ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
+SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


