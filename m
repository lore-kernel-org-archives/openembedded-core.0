Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QX8cL-0006G9-IF
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:12:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2011 02:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,374,1304319600"; d="scan'208";a="18877854"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2011 02:08:30 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 17:20:34 +0800
Message-Id: <baf12b233c03a619928269bdbe6754d3e4d483e0.1308215406.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/6] systemtap: add fishriver in COMPATIBLE_MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2011 09:12:01 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 8ac4c14..0d18e1d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--prefix=${D} --with-libelf=${STAGING_DIR_TARGET} --without-rpm
 SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
 SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450|fishriver)"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.1



