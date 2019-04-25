Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2873C79E69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 02:25:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2019 19:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,392,1549958400"; d="scan'208";a="143401651"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2019 19:25:17 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 09:54:23 +0800
Message-Id: <1556157263-71443-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 1/2] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 25 Apr 2019 02:25:19 -0000

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
index 7f8b043..d35a6f6 100644
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
2.7.4


