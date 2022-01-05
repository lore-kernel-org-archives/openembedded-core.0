Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8373C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=MC1FEDS3;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395949; x=1672931949;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bDriEtbhqwwTzE6vm3f0Rgy6iiVVED+uR0rXdSnMDws=;
  b=MC1FEDS3nicmqio1rjgse6xE3EAK1K5VqGqASV/5Aah5aUAGoTk3ervJ
   jeoTor9ZWL5l7AZeoocLHiAtFPefgcVCYBDBruKflQgXg/JOHgBn3WpbN
   nJEwJma+WMsMZTFAq88djgFFMCw3gPZW+hxxUZ+cWfH/X0MtWfYYe0JGo
   Sy+2JqALhL+8viBbmgz0cqCAW7ql1uVhQcLfLzdVHPq3xYiAgldWxd5vp
   BByADrvoCQGjAuS8tWGBt439YSoJZmU7m3n6XFtaFJ/+b/8oKWXiyqVPR
   A9kZdv9YqTFqTDjfn4yZBAXAZ8b+5CHnJ3ril3fFTpMD23/pbuaxVThHU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742766"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742766"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128593"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/24] linux-firmware: upgrade 20211027 -> 20211216
Date: Wed,  5 Jan 2022 23:18:26 +0800
Message-Id: 
 <0e2a8cf3c4c2036db70f2c028643667daa9a3d6f.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160191

From: wangmy <wangmy@fujitsu.com>

License-Update: version of license file updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07dc668ddc50de14821aff1b6850d8b4999702bd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 5170d6e0be3775376d08bd5129686ec53661786e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20211027.bb => linux-firmware_20211216.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 76aed9d443..92b6ff5157 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d627873bd934d7c52b2c8191304a8eb7 \
+                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bc2657dd8eb82386a9a7ec6df9ccf31c32c7e9073c05d37786c1edc273f9440a"
+SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
 
 inherit allarch
 
-- 
2.33.1


