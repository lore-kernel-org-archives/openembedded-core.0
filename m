Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DB57F6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:20:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2016 07:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,416,1449561600"; d="scan'208";a="649015137"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2016 07:20:09 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 17:20:06 +0200
Message-Id: <1454944806-27252-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454944806-27252-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454944806-27252-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] sign_package_feed.bbclass: fix task dependencies
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
X-List-Received-Date: Mon, 08 Feb 2016 15:20:09 -0000

This dependency was already added to sign_rpm.bbclass. However, the same dep needs to be
added to sign_package_feed.bbclass, too, to cover the case where rpm
signing is disabled but package feed signing is enabled.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index d5df8af..63ca02f 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -35,3 +35,4 @@ python () {
 }
 
 do_package_index[depends] += "signing-keys:do_export_public_keys"
+do_rootfs[depends] += "signing-keys:do_export_public_keys"
-- 
2.6.2


