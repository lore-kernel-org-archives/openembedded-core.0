Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFE3C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.7233.1648734479272585759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RNDuzWqn;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734483; x=1680270483;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nTAqg5ChYQ/XBTu5Ck5wDfer/Ibk/Tko4MLbuj07rAY=;
  b=RNDuzWqnvJ6q+FCfqxGxzd0pA+UTaKCjPok6ov23HeGjSNAcZ4KxlBQw
   pY5GlZ5pH50nTkuMNDgx1Ce0Eo8Mjiv4/XnkbNIjcfOW3EFWIPPWK5Dlf
   eAnIWFx+kptbw/nVU0Co87uZrdj1yufWz4hVB2dXe0VGgxwQ944PiX/AF
   cXXcRaGEvVSSGQutuEu3ebfbrAR929JVZaCkT59bhIU11wQH5/JMdp11C
   iDtUsMPEjaHzOmFUvLTvoI5wEZn/6x8VU1jIuMFqruf//vm4RJ/0l0W/q
   Mbf71+6V2Xxu8U1FsKwuuYMT1WX+fI/sK/BB/eh5poFIw06bBY3ZRzt2V
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551887"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:48:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542394"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:48:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/20] lttng-modules: upgrade 2.12.7 -> 2.12.8
Date: Thu, 31 Mar 2022 21:47:25 +0800
Message-Id: 
 <4011526ad7b2c8711038c1729c7fd046cf852ffb.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163834

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../lttng/{lttng-modules_2.12.7.bb => lttng-modules_2.12.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.7.bb => lttng-modules_2.12.8.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.8.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.8.bb
index 5eb3902bb3..eff97f27af 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.8.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            "
 
-SRC_URI[sha256sum] = "32ab2d17d513cd2f458f8844c66a0d013283301fc7329b55d6503153cf8cb253"
+SRC_URI[sha256sum] = "1302005a982fd4a15cc4843866971008546939f65660023d7762aa046d4b9213"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.35.1


