Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD2D79002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:25:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="74762426"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2018 03:25:32 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1F482580332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:31 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:22 +0300
Message-Id: <1534933645-30369-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
References: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/6] libatomic-ops: upgrade 7.6.4 -> 7.6.6
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
X-List-Received-Date: Wed, 22 Aug 2018 10:25:31 -0000

License-Update: updated address of Free Software Foundation

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{libatomic-ops_7.6.4.bb => libatomic-ops_7.6.6.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.4.bb => libatomic-ops_7.6.6.bb} (76%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.4.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.6.bb
similarity index 76%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.4.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.6.bb
index 271721e..32d26a3 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.4.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.6.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
 SECTION = "optional"
 PROVIDES += "libatomics-ops"
 LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
-		   "
+                    "
 PV .= "+git${SRCPV}"
 SRCBRANCH ?= "release-7_6"
 
-SRCREV = "8d98e2811c2f6df99cc65e5cc6964047d8554ace"
+SRCREV = "76ffb3b87946e4c372d112d8d00786632deab934"
 SRC_URI = "git://github.com/ivmai/libatomic_ops;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


