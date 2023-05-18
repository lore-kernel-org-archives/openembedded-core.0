Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E30CC7EE2A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 02:31:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5731.1684377084465781346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 19:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=OT/1OVkF;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684377088; x=1715913088;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YP1+yy1rCT9tznRpnSffFElY6MedSHtifk2nRKqLrOY=;
  b=OT/1OVkFGE/cgaaUj1JDTCAivzJqeBBpr75UY7/kSIElyBcWkkcI55XC
   0BeVQbCVtZEvRuViXzB2Ads6Ue1jaAyVx4olJWyxsntG2rWL6bWrp1Vgt
   agNi5ha24EwY7INQ96DUkNCFV5CO8b/HhG0uDtz94zIKNljJsvli3xSiV
   4FWab7C2moS3+QjJY05aKWL+RKZyspeLTxZQmr1FXQbtQ3HsqWP5NKlN6
   KmIWGKBjOXxdgxn1FXkCeXVSzUftaXmOZmz8dsAwTvpBAMFUS2bicPAR9
   n/G12lYcfW0rEi/RSMEhyLzdaczvT76Qo/ua6VXjxwdenn16mds3zqtJb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336506816"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="336506816"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732693030"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="732693030"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.171.143])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] libsoup: upgrade 3.4.0 -> 3.4.2
Date: Thu, 18 May 2023 10:31:17 +0800
Message-Id: <20230518023118.16406-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518023118.16406-1-anuj.mittal@intel.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181510

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsoup/{libsoup_3.4.0.bb => libsoup_3.4.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.4.0.bb => libsoup_3.4.2.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.0.bb b/meta/recipes-support/libsoup/libsoup_3.4.2.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.4.0.bb
rename to meta/recipes-support/libsoup/libsoup_3.4.2.bb
index d35e4f25c1..37e54abe73 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "23efff6ac70f2c1e873507dac52649eec032c1597a4ae951762ce3123789acc9"
+SRC_URI[sha256sum] = "78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.40.1


