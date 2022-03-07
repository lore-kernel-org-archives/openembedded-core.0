Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12299C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:08 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gYSM9rG0;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662447; x=1678198447;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Nsndx3VfDqdoW6pcZAv0VGVk0f2/V4zRmc3If/5DPvM=;
  b=gYSM9rG0WQnPTnQZSVC9RBP/NM31hfuLLGf1iAxqxpBZC4HbcCWL5K5B
   t9Wn0LrPMJD5T5/ZJ4Jp67pzZOAvkqv31mgotlEpaRW9tBYA0DLRhGDB0
   RxOUXe1tfsnCKErMt2Hg6vM/R+lJeAz7Ef9YEd1yy0uERkIoXni5gZ7R8
   BEPO7Ee/zSzbMSu3E6+m8lKtb63DaPQzP3grC2X+jHt3GDm78NpgASTxj
   MOc6GcVLed27QgK/hM0y+CneY/b3O3xtVBaJoprbOICvw9hdVkDpbe9pY
   YU2dbK4P2abgOJcjwUvmos0/SSDaXJpqYzwEyEaVRum0h34ZWgzIR+4mC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112581"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112581"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:38 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070923"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 20/25] asciidoc: update git repository
Date: Mon,  7 Mar 2022 22:09:56 +0800
Message-Id: 
 <16215377a33f7ebcce3c48bc31c83f8c512d9f49.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162841

From: Ross Burton <ross@burtonini.com>

The asciidoc-py3 repository has been renamed to asciidoc-py.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f78dd3f4c5f0cd738783e75f3796e1da2a2a2ba1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb b/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
index dd9f8e32c4..6d52b5ba04 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=9.x"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=9.x"
 SRCREV = "9705d428439530104ce55d0ba12e8ef9d1b57ad1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-- 
2.35.1


