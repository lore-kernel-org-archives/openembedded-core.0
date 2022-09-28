Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579F0C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 10:28:48 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.6299.1664360927855635613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 03:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=c8mNNvOy;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664360927; x=1695896927;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I+CXMbpl7I/eCP3QmVjmPVIESTacoH47uRgc/SHcJNw=;
  b=c8mNNvOyAblP9pydomjXfvNDCUWd+k/8WLq8ufLZlSz4zrGXW+4KVyPF
   5POrPIfVy6BnOXc9WCPi2MnHqCFUAevv8qP83EdIbQBcX5gFOk+V5kebz
   u4FqLcZo0vu7mDtuhZQUV/lWaQ7m1ND1S5DDXGSO2dxEFfWhclz4Cw4eN
   aKCjNu3OA4QPjpKA+7GTwhPAAFpb4eNlomTfa45al8TIoi7XEmbYvsvPA
   VWW1jyptAlWaukezX5XFO1F+boKZcXefdWLENUmRPoAjZFJvWMinM7I26
   Rl7qWOCOY3ac65UpmmET6mCKUeK9FjMMmFWHLrZU/FfSJMeXoIU4J7kno
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281935934"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200";
   d="scan'208";a="281935934"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 03:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="621874013"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200";
   d="scan'208";a="621874013"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2022 03:28:39 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch 1/2] webkitgtk: Upgrade to 2.36.6 minor
 update
Date: Wed, 28 Sep 2022 18:28:33 +0800
Message-Id: <20220928102834.3813992-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 10:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171144

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: bee36428a45c6c0c24d4c0fcf64bd890f3481c4a)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
index b3fe357010..37b977f9ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908"
+SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.37.3


