Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 53838731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 10:59:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Jun 2016 03:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,480,1459839600"; d="scan'208";a="988686360"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2016 03:59:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 13:59:22 +0300
Message-Id: <1466074764-14109-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/5] security_flags.inc: add -fPIC to SECURITY_NO_PIE_CFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 10:59:45 -0000

The packages that break due to -fpie can be still built with -fPIC.

[YOCTO #9486]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a7be185..26804bd 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -13,7 +13,7 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
 
 SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_NO_PIE_CFLAGS ?= "-fPIC -fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
 SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
-- 
2.8.1


