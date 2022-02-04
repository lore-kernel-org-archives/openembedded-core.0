Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B33C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Kt9N4dvk;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983991; x=1675519991;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=07P2QSXuVccqJDuv1/6ZvoJU5My8Gpe9r6f3p7FQDew=;
  b=Kt9N4dvk8oWwOQAj6qbrI6WtCRZWQOISvZ1Q/UEko5F3sOVSRiwUnBiP
   TEBCancNmq7Qz71joi/ce4ZCMKE1knR3styRln9BWd0xJP4BRWJ4i89C8
   lz0VwDvt8zoz+PC7q+tIl2WHlIV9qWzgAhnzIWkugnF6f0ceXp9behktO
   WxcUMqWM0x3SzC0TtxfMVETSfo8BdZbXux6hPu19kTqOExtpyvixYN/kV
   K4QhERcof0nE/d36xJ4QRM2Xe8eHg9QVYdqGU58vjyQ1fpCc2JUVANvmo
   RKWkNS193BAcQFn0C7V1vJHAUZSP2QkWlOu+pYI9hmImwpcXBL7UHPdwJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321648"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321648"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750101"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/17] libusb1: correct SRC_URI
Date: Fri,  4 Feb 2022 22:12:39 +0800
Message-Id: 
 <0fccab0724769a862e31e635ffa1db3ba2f37312.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161360

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4c37ca1f1e97d53045521e9894dc9ed5b1c22a1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libusb/libusb1_1.0.24.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.24.bb b/meta/recipes-support/libusb/libusb1_1.0.24.bb
index 95a20958a1..e70021f4f7 100644
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


