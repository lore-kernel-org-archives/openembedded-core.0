Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B60C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 14:34:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.65016.1672756444127541266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 06:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=JscAORu/;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672756444; x=1704292444;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K//f+dbRj/ywk/v/tcxsZcilB42+VH38bYGFW7W506I=;
  b=JscAORu/jzt9DhIGjDDekQsFEhnu0guZ2zr/Qi/M+ziZ5bNNvmd/ouRj
   ewccafzrjoTysgW4Mte78eNACLs08swD/MxoDuftomWUQAN/6xOxLFrgD
   dhqaCs1ZyaGngF7uMiFkxSuSXQzvYIzzCH2xFP/MQioW48CtytMB57a4q
   KjZtJF97IhKYUCeFnHbJYEdnyx7e+jR69vWY4ipyzCGUEvraiqO5Q4tfA
   ZsHkXJcfYzy05fGxp27vrv53LXcilLGVoMSo+N4hmm2o66VhxXQbLqA0T
   LyLq5Td5wtBT2uLrt9qKOpr+8NFEufMl2KXiRsaBBtcPrRg3+TcTAWLnC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="407926649"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="407926649"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 06:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762328462"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="762328462"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2023 06:34:02 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][langdale] dbus: upgrade 1.14.0 -> 1.14.4
Date: Tue,  3 Jan 2023 22:33:56 +0800
Message-Id: <20230103143356.635387-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 14:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175356

From: wangmy <wangmy@fujitsu.com>

License-Update: D-Bus changed to dbus.

(From OE-Core rev: 8c2ab4c014807e2d8ad0fded4188578aa05e8c55)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (96%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
similarity index 96%
rename from meta/recipes-core/dbus/dbus_1.14.0.bb
rename to meta/recipes-core/dbus/dbus_1.14.4.bb
index 863e35faf7..5f91ec2dc1 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -6,8 +6,9 @@ SECTION = "base"
 inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+                    "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
@@ -15,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
 "
 
-SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
+SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.37.3


