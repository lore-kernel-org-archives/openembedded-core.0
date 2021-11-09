Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97EAC433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915906"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:26 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956870"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/26] meson: set objcopy in the cross and native
 toolchain files
Date: Tue,  9 Nov 2021 22:37:47 +0800
Message-Id: 
 <028d40076b704669cf7bf423385a4f11e0dd6f03.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158033

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a589998e717ae3865f0db5abe6005ab4eee86d9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index da58cb4bec..4ba70de3dc 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -48,6 +48,7 @@ ar = ${@meson_array('AR', d)}
 nm = ${@meson_array('NM', d)}
 strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
+objcopy = ${@meson_array('OBJCOPY', d)}
 pkgconfig = 'pkg-config'
 llvm-config = 'llvm-config${LLVMVERSION}'
 cups-config = 'cups-config'
@@ -85,6 +86,7 @@ ar = ${@meson_array('BUILD_AR', d)}
 nm = ${@meson_array('BUILD_NM', d)}
 strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
+objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
 pkgconfig = 'pkg-config-native'
 
 [built-in options]
-- 
2.31.1


