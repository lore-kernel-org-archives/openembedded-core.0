Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Aug 2019 06:58:31 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4D97F29A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 06:58:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2019 23:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; d="scan'208";a="188413946"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2019 23:51:24 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 14:53:43 +0800
Message-Id: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 15 Aug 2019 06:58:32 -0000

This provides git large file storage (lfs) extension.

Include git-lfs conditionally. If git-lfs is present on host and repo
has lfs pointers, then git-lfs will be used. If git-lfs is not present
on host, it will be ignored.

[YOCTO #13198]

(From OE-Core rev: 2968ad8514721ec06e67aaf3fd5ec7b247b3431d)

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c996301a8b..c5313ccd19 100644
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
2.17.1


