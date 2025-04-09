Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459D9C36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:54:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.79.1744167238218079680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bYAAYPmb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744167238; x=1775703238;
  h=from:to:cc:subject:date:message-id;
  bh=EM3djEbZ2/gDnuqFSJwF7x4/jXqN1U0iUGbIaKATJ/U=;
  b=bYAAYPmb9s4Rd4/x63zvGWOdtAZ/81Bva0fYT4URVYUdPdqfw11vxyAD
   zbncmvXvqrJOKcwaUp/2KSSOgttOvZy5fZebMFTM1K/mT4Wx0hmOtOezm
   oFH4yUj3XFD0HFlEWOFBUmopvOydq3mMq2DlWGQWlLFmXSsUngdvuF7a7
   vw5f6kWaybyEzAGTNqQbW81MxocaCbICorwtGn2mkB9TRExRojnUVf6Md
   vt7lMC0L3iE4UKU+dgZGQeIcVCbykziVIN27Xc+OgBh+lVW4ngi4Iw6ZC
   LpOS025MUPv/1otDC5UHmPHzyS3c4gHfGXmPw33o14rUglrC+jcEE+khC
   g==;
X-CSE-ConnectionGUID: mscexgvSQr62Nq7Xll6Vww==
X-CSE-MsgGUID: lP6y+YgZQPWJq9pK6KWmxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="175319652"
X-IronPort-AV: E=Sophos;i="6.15,199,1739804400"; 
   d="scan'208";a="175319652"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:53:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55529C2262
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:53:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CC7DD73DA
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:53:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71C1F1A0078;
	Wed,  9 Apr 2025 10:53:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] systemd: upgrade 257.4 -> 257.5
Date: Wed,  9 Apr 2025 10:53:46 +0800
Message-Id: <1744167226-4628-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...temd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} | 0
 .../systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb}  | 0
 ...mctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 ++--
 .../systemd/{systemd_257.4.bb => systemd_257.5.bb}            | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.4.bb => systemd_257.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.4.bb b/meta/recipes-core/systemd/systemd-boot-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.4.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 55389f1050..243053a8c7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,9 +15,9 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5ce1c02abc0cc386332384497b5939108314d80d"
+SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
 SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.4.bb
rename to meta/recipes-core/systemd/systemd_257.5.bb
-- 
2.43.0


