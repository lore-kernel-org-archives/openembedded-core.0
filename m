Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF1CC433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Ury6uvTN;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878172; x=1685414172;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IkD96l/HppOVA3wEBLLsN/dml4via8CUX6y1zY95+PQ=;
  b=Ury6uvTNxcw9k+KReev7ICldiYoR7jxVETT+4N6TLNDmng+i2WhN+I6L
   jFceVB0X6ADON6IMdoBFNSHs/fAL05GSdeW4OXcFKkL4tqvDIwdMmE67x
   bJ4fYCk9biKnP1gOf19504qpzY9F4NF09IgVJeJUktxUHlqWVICsvZXKT
   3K8KkX79mNZoyAkzgQXd7l5yHTOuMQCSXVg0GTSPqmDzW8qkAEufaggTL
   KZH8eahtZ7x/eMy9mYz+liilmRS8QVUPotQ2vmOuRs/y5g4VkiQBYXC66
   IUVbKSmFNncElKQ0PWqWnINPUvl1cnZgtP4Eym8nnxETm96taFYV55TWW
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876416"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313506"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/12] linux-yocto/5.10: features/security: Move
 x86_64 configs to separate file
Date: Mon, 30 May 2022 10:35:53 +0800
Message-Id: 
 <01505cad0a0fd4ac64b3b98b1b2c867b0044e69f.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166247

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    2278ed571c1 features/security: Move x86_64 configs to separate file

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 294b49c51fbd775c712939c79ecfee219db2a405)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9b125a92ef..3ff54b9ebb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "40a6731993d406d6c9fed43cb20c6a4f178ff2cc"
-SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
+SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 98ac869e79..bbaa0ebc00 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "9524d0ca0feeeb4cb698e3c984f4391ccb4b8e19"
 SRCREV_machine ?= "bccf3a5f14511fb8ce6a9dd990216508d2c2ec6e"
-SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
+SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 74fd0ad21c..0cf14b748f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "d2f7a595bf0b752275d503046494b668549cb151"
 SRCREV_machine:qemux86-64 ?= "d2f7a595bf0b752275d503046494b668549cb151"
 SRCREV_machine:qemumips64 ?= "279f142932679a8ba212ebae4b9db851636a1fab"
 SRCREV_machine ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
+SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.3


