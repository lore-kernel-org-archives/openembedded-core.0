Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6C13A77925
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 18:56:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 14 Mar 2017 11:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="67369503"
Received: from shersing-mobl.gar.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.0.227])
	by orsmga004.jf.intel.com with ESMTP; 14 Mar 2017 11:56:06 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 20:56:35 +0200
Message-Id: <20170314185635.2326-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] bitbake.conf: whitelist socat as non-fatal host tool
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
X-List-Received-Date: Tue, 14 Mar 2017 18:56:07 -0000

oe-git-proxy depends on socat host tool but it's not
whitelisted and triggers a 'binary not in PATH' error.

Whitelist socat but make it a HOSTTOOLS_NONFATAL since
it's not a hard dependency.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0de8a74c43..d92c5cd0ca 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ps stty ip ssh scp ping vi"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg sftp nc"
+HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg sftp nc socat"
 
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
-- 
2.11.0


