Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A642171BD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649416"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:59 +0300
Message-Id: <177a91d5013450a5bc9085a914da629b16aadf98.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/23] systemd: do not depend on SGML stack
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:44 -0000

I couldn't find any reference whatsoever to it in the source tree.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index f675036..542f99d 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline libcap libcgroup qemu-native util-linux"
+DEPENDS = "kmod intltool-native gperf-native acl readline libcap libcgroup qemu-native util-linux"
 
 SECTION = "base/shell"
 
-- 
2.9.3


