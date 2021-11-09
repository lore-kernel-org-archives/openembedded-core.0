Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07E8C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:39:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.12796.1636468740845062503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915969"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915969"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956940"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 18/26] nativesdk-packagegroup-sdk-host.bb: Update
 host tools for wayland
Date: Tue,  9 Nov 2021 22:37:53 +0800
Message-Id: 
 <adee9d40023b6197f121ec0cf1115ce229c2a26f.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:39:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158039

From: Tom Hochstein <tom.hochstein@nxp.com>

The wayland-scanner host tool required to build weston is moved to the
wayland-tools package, so update the SDK host tools list accordingly.

Also, the weston build requires wayland-scanner.pc to find wayland-scanner,
so add wayland-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31ed91bdbb0ec05730fb98d7cc523bb46aca50e3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 39e5002bb7..9166a0851f 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,7 +25,7 @@ RDEPENDS:${PN} = "\
     nativesdk-makedevs \
     nativesdk-cmake \
     nativesdk-meson \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-tools nativesdk-wayland-dev', '', d)} \
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
-- 
2.31.1


