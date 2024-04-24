Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08C7C10F15
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11719.1713948178072134036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GHJ2MT88;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948179; x=1745484179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q8f9cndhfZsWSPYqV+jy0bNZn8crpJ7wU8lsLI15Jp8=;
  b=GHJ2MT88YnYEooJb2IAQxRECSCya2aNVhq4UV3DEMI+qOIzjkj5V6rDw
   Dz0jkx1N3DmEyUIacKPWstYu6rxEAifmUj/GZp8tdrf8GVLqjX5na/9vf
   tspLeZbapfm1rDtz7/2OLnqCXXyZ7j6+h0kTLEOXYCm89PaPcy8N3KY7F
   i2+PKNhWLDMhkcU7stLrVG1KUA2S4Q9Mov+x9zhAXXb8yXmD92xrkyH/i
   neYfi46ffAaOqa0dpuXdPHroZhR39ynfkoS27SUiJ4LhiMkFGbUnptkSF
   IcZlqdZJhz7Mb8SQgdwPkGT26Zut3GWk71TGasM54MzVINWq10G7syz5k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="158512426"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="158512426"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F571C2AA1
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9119C3247A
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E7151EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9B451A000A;
	Wed, 24 Apr 2024 16:42:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/38] gcr: upgrade 4.2.1 -> 4.3.0
Date: Wed, 24 Apr 2024 16:41:59 +0800
Message-Id: <1713948152-13501-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--2.386400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyAI7Mvq/sL59v9
	Yxcv46SLRrhA8w8T1ITy/xvBdh9ijcTsCo8ymnD4leLXPzO3VNHvG0/D/wjsdNVtkV1dqmwpsGY
	C/7erBrYILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgEyQ5fRSh265a7m7mXDnNLXZ6K
	rkcB2Nwd175zSDPs2MeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDg7EB
	RAnzu8vD8179eMS2+R9LatG4JGKsNXL1ZLk7JYrvqFRKikuC+lEVZA4/TEBWd2ndpPurD3NusW9
	Z/BP2wlFludre39ZkYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198650

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- certificate: Add API to retrieve version
- Bump required GnuTLS version to 3.8.5
- Avoid potential integer overflow spotted by UBSan
- Support GnuTLS as an alternative crypto backend
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gcr/{gcr_4.2.1.bb => gcr_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.2.1.bb => gcr_4.3.0.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.2.1.bb b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.2.1.bb
rename to meta/recipes-gnome/gcr/gcr_4.3.0.bb
index 26dc1d1bc6..50c8cfe8d6 100644
--- a/meta/recipes-gnome/gcr/gcr_4.2.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "ed783b5c80373cd058c02ea9e3e2a64e558599ca190a5abd598122e479967de5"
+SRC_URI[archive.sha256sum] = "c3ee8728e4364b0397f435fa20f92f901ab139d2b264f4e059d67b3c0f43cd36"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.34.1


