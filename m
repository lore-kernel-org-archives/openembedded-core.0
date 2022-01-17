Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F0BC43217
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=k9Hup109;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385455; x=1673921455;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c22fAvSOu50Nq/nKGMwvc0bthrxMwyu0GsqvNdNqCfk=;
  b=k9Hup1097c1ZZhZ9vI37ZKYavCOOrwq0MMnh10/4MrJizobjPeFS/FeN
   BF5e/qWr0yKd6VGgwBlFDu1/ejn8GAkq2zs7T+3IrPOPYbkN9EA3m/IK8
   ufTV5YARs0L7CzicYXm7JYp7h/8IP9OKcEx3LE+42nB6AtQqYDSE10M0Y
   zYZmFpTbNBi3mcX9C2+MoEfDFhARlwgI+E/jp0FbiXj1GnVpxh+5lGU7H
   51jL6cEC+pcPL3RXWZng/MbKdqoXqD4v4ppbS1HAzwoQux4Agfmq0kIuP
   S0ZCFgHM/AkZzcwkakaZr7Pq5PDvyhtvYvrJ8jyDbjeZCPeA/HhHwYbv7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094259"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094259"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220734"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:52 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/12] linux-yocto/5.10/cfg: add kcov feature
 fragment
Date: Mon, 17 Jan 2022 10:10:29 +0800
Message-Id: 
 <08e7077614ef010b74577fc0e183ce6f553ea5ad.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160628

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

41721be8a03 cfg/debug: add kcov kernel configs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a11ed0910a9ed231bc3c4a9ee532358014ce535)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f2279326b7..dd8326e92c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "301346d30bcaccedc71da8d5f78bd262063d4ba7"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index ae6d884954..9d2bbc010c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "913d41ebe409dfd03c49fafd1923f8663df2a4ff"
 SRCREV_machine ?= "5575e67330fb6d979ed1cd2e9e64400b4c21b595"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 3df4e86bd1..50fa1fb281 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
 SRCREV_machine:qemux86-64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
 SRCREV_machine:qemumips64 ?= "29cb56446b0b66b7a15d2577773e69c4e813bfd7"
 SRCREV_machine ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.34.1


