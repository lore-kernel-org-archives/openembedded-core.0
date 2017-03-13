Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3F41472FB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:09:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 06:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="833997090"
Received: from ahatuka-mobl1.ger.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.24.113])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2017 06:08:54 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 15:09:26 +0200
Message-Id: <20170313130926.29301-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bitbake.conf: whitelist socat as non-fatal host tool
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
X-List-Received-Date: Mon, 13 Mar 2017 13:09:20 -0000

oe-git-proxy depends on socat host tool but it's not
whitelisted and triggers a 'binary not in PATH' error.

Whitelist socat but make it a HOSTTOOLS_NONFATAL since
it's not a hard dependency.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bc115117c9..ea5309462f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ps stty ip ssh scp ping vi"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg sftp"
+HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg sftp socat"
 
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
-- 
2.11.0


