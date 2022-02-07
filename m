Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC034C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:25 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YGFtFNrw;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224844; x=1675760844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rYT8ZkAQwcvWBoE4zg922zvtOzPNWjKPcEpSOmGkxss=;
  b=YGFtFNrwVYoAhM8A4EAh7ecVk8MDUByuqcVYNvm6HZ15Ne7CEMvKk1EU
   yzr+Y7csWpP+jsEcwCqfw4JM4OXhf8TJAOy5g25wV3E3fYQwB/LcO6uNw
   9J5GMk8L+RR+Mqi4LxCXgXQ3iYeMJBL+bGTNq37hpB27UXV+yfO2zgimv
   rOgjQyIE4+dL7PMqKwoJDs8B3SH+TCigilKnMv5h7yR9K9H9CoCFkFCvn
   y2j8Wt6RnMsTsI79QizM+z0k2w8bduw8GgNYfk8N0lq5LRxzJ8SCLmVPd
   bAPnLePpcZybngZ4LxdvMAwkFh1pTka/k64RyZCfb9POvY8qMA5c1YN2z
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420845"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420845"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140469"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/12] libusb1: correct SRC_URI
Date: Mon,  7 Feb 2022 17:07:00 +0800
Message-Id: 
 <da945043aef07a77be8d6663d419b5c690997688.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161452

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4c37ca1f1e97d53045521e9894dc9ed5b1c22a1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 0fccab0724769a862e31e635ffa1db3ba2f37312)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libusb/libusb1_1.0.24.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.24.bb b/meta/recipes-support/libusb/libusb1_1.0.24.bb
index 92e66b1b16..76a707b70f 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.24.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.24.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Userspace library to access USB (version 1.0)"
 DESCRIPTION = "A cross-platform library to access USB devices from Linux, \
 macOS, Windows, OpenBSD/NetBSD, Haiku and Solaris userspace."
-HOMEPAGE = "http://libusb.sf.net"
+HOMEPAGE = "https://libusb.info"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
 
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
           "
 
+UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb/releases"
+
 SRC_URI[sha256sum] = "7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a"
 
 S = "${WORKDIR}/libusb-${PV}"
-- 
2.34.1


