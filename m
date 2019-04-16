Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0A93E7D351
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 05:58:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 22:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,355,1549958400"; d="scan'208";a="131750132"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by orsmga007.jf.intel.com with ESMTP; 15 Apr 2019 22:58:49 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 13:59:19 +0800
Message-Id: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Tue, 16 Apr 2019 05:58:50 -0000

This provides git large file storage (lfs) extension.

Include git-lfs conditionally. If git-lfs is present on host and repo
has lfs pointers, then git-lfs will be used. If git-lfs is not present
on host, it will be ignored.

[YOCTO #13198]

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7f8b043cc4..d35a6f64d9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -514,6 +514,9 @@ HOSTTOOLS_NONFATAL += "bzr"
 # Used by ssh fetcher
 HOSTTOOLS_NONFATAL += "scp"
 
+# Link to git-lfs if present
+HOSTTOOLS_NONFATAL += "git-lfs"
+
 CCACHE ??= ""
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
-- 
2.17.0


