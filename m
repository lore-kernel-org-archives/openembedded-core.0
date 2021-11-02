Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FD5C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.493.1635871641167980503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509741"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509741"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:40 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575189"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/24] meson: move lang args to the right section
Date: Wed,  3 Nov 2021 00:44:01 +0800
Message-Id: 
 <07e2ace3e9208b1a0806cd0ab768059671974a1c.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157799

From: Randy Li <ayaka@soulik.info>

After meson 0.56.0, <lang>_args and <lang>_link_args would be
regarded as meson built-in options.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50c8f654e9006a7c902dd76f75082d4f8d668d0c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
index 0e76cc78f8..5657397ddc 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
@@ -24,12 +24,14 @@ nm = @NM
 strip = @STRIP
 pkgconfig = 'pkg-config'
 
-[properties]
-needs_exe_wrapper = true
+[built-in options]
 c_args = @CFLAGS
 c_link_args = @LDFLAGS
 cpp_args = @CPPFLAGS
 cpp_link_args = @LDFLAGS
+
+[properties]
+needs_exe_wrapper = true
 sys_root = @OECORE_TARGET_SYSROOT
 
 [host_machine]
-- 
2.31.1


