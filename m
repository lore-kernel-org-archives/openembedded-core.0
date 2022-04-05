Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3ADC47087
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BDctaxzH;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169724; x=1680705724;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W5y9Mqc3FglwN8xYFTD4f8Bk6EpX78hQjYAYw8ROzTw=;
  b=BDctaxzH4iM4ZrgMZfvaMimDdIhwR+hyLkimIXiik4yB0GlqZy02DZpf
   IA1mHcK7Vppzw3gaW/4fCMaHrmxbTL1LEusjWfQrdJOHL5/4JPZ1nN+oL
   TL4zZapFH+5bRbzVO0yRx/RuWKM+OZxNw3l3VCEKeRSuf02p0oDTW9gkg
   BWH5+5Q5vWvm67Dny8thkSHbnHekOHeShvdPkpaPi4zVzb+DqgS8w7y4k
   5vp4eq0Egx/qz+vj+jqagvF5VqIfDEJ6SCTd0jcNKwS3P1T0AsRhld+3f
   fARJA/Ii+noHD/LY7AjEqyA7GLD7AYe//WcCx+17a5dilWgBL9pOGtUhN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348723"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953591"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:02 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/22] linux-yocto-rt/5.10: update to -rt61
Date: Tue,  5 Apr 2022 22:41:30 +0800
Message-Id: 
 <540b6a21a882962612b06cf22844e087d65ad1d1.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164029

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.10:

    48b12b48c110 Linux 5.10.90-rt61
    2367f287812f aio: Fix incorrect usage of eventfd_signal_allowed()
    640f56f85c08 stop_machine: Remove this_cpu_ptr() from print_stop_info().
    38c47ed56da8 eventfd: Make signal recursion protection a task bit
    45f3f3c787e3 Linux 5.10.90-rt60
    257f82607c82 Linux 5.10.87-rt59
    7ff031bb6566 Linux 5.10.83-rt58
    03cfb1aadc5e Linux 5.10.80-rt57

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a201b82e999d2216fc58bd8db405bb06c9f22ff5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 88fb3b4113..17fc109728 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
-SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
+SRCREV_machine ?= "48b12b48c1103b811263aaed4d81bfb8b24fdfc4"
+SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f1c2bc33e4..9a4bf39b46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
-SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
+SRCREV_machine:qemuarm ?= "3c9683e7166044d91c0ef900491f2f881a8bd6b7"
+SRCREV_machine ?= "7f3e78220d6510de21d74e3f330f1f93cb635745"
+SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 87a7d5e3ae..3aa28b3009 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "74469c4b03f62e4b4da066e52785ed74b1d121ae"
-SRCREV_machine:qemuarm64 ?= "69f185342f516efa8a9233e31d2c3f8356b3a388"
-SRCREV_machine:qemumips ?= "d97607700b2fba19af10b2110b99c448ed9a88e9"
-SRCREV_machine:qemuppc ?= "090085d4bb6181c3b972d82c9f8f7ed88c90ad6b"
-SRCREV_machine:qemuriscv64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemuriscv32 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
-SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
+SRCREV_machine:qemuarm ?= "ed7ac660431f6eb29add763876d7a10b6a6e539e"
+SRCREV_machine:qemuarm64 ?= "9ca22664eb7cd86b7c91770bdaa1c5581a081938"
+SRCREV_machine:qemumips ?= "4d5c2b576ee19c6ede626f2ffdb6a96d06ddd065"
+SRCREV_machine:qemuppc ?= "54e5ceedcce6039a0479eaeea000e3c42cf4e4bc"
+SRCREV_machine:qemuriscv64 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemuriscv32 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemux86 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemux86-64 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemumips64 ?= "012ce81097a4d2d94a7d5cb596fb4ad7d8f438f1"
+SRCREV_machine ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.1


