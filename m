Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB9EC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 10:28:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.6299.1664360927855635613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 03:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Tr4h0PEF;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664360928; x=1695896928;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Bgz8sY0eksDYHM+LzIKgolTMUATs1wbYrYRry+xDnGY=;
  b=Tr4h0PEFglKoLupWcUD/M8bf6ACcCgb60/9xf5jZYQBAbSnPqOiN4/vc
   Oi6/ggNhhp1MmzlVVsfCQcLomoDCDFTh1VF4wB0kVB/lxLModIRbQyU8Q
   9bGCrh4144xxE5Sabx/b5vK7CWitUEGDzUzGR4a9T4WE46kANWootO53W
   uhXuaS8AUE0MjnMsCgL1/qo/Jh8NSkwN7O1FzkQSd3kMwJs2sxH++2uU4
   DOXLBMAbu+TKpEaQCQoQMmWbCm5vWTzSm05c6jHDalpiNKIiIzp5g6rRL
   Il+TbQCyYkJkxeQ37E2kmCQaOGI3bKNBPH56j/vE4knQDJgGtyPFBl1rl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281935939"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200";
   d="scan'208";a="281935939"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 03:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="621874015"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200";
   d="scan'208";a="621874015"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2022 03:28:40 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch 2/2] webkitgtk: Update to 2.36.7
Date: Wed, 28 Sep 2022 18:28:34 +0800
Message-Id: <20220928102834.3813992-2-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928102834.3813992-1-jay.shen.teoh@intel.com>
References: <20220928102834.3813992-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 10:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171145

From: Khem Raj <raj.khem@gmail.com>

including fixes for CVE-2022-32893
(From OE-Core rev: edbfd06927ef4a9bb1ea1ff80fbc901ede89ce42)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
index 37b977f9ba..026e24ae39 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
@@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
-
-SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
+SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.37.3


