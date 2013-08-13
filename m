Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9F26B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 16:44:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2013 09:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,871,1367996400"; d="scan'208";a="362071390"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by orsmga001.jf.intel.com with ESMTP; 13 Aug 2013 09:44:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 09:44:55 -0700
Message-Id: <1376412296-7521-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 1/2] meta-skeleton: layer.conf should also have .bbappend in BBFILES
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
X-List-Received-Date: Tue, 13 Aug 2013 16:44:57 -0000

This will allow for an example recipe with a .bbappend to be found, such as
busybox or kernel configure fragments.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-skeleton/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 99830d8..aca1633 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "skeleton"
 BBFILE_PATTERN_skeleton = "^${LAYERDIR}/"
-- 
1.8.1.4


