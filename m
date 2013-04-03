Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UNMzL-00055H-VI
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 14:40:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2013 05:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,401,1363158000"; d="scan'208";a="316242861"
Received: from adamian-desktop.rb.intel.com ([10.237.105.55])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2013 05:23:08 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 53466560C23; Wed,  3 Apr 2013 15:23:10 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: sgw@linux.intel.com, richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 15:23:08 +0300
Message-Id: <1364991788-29402-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] libproxy: add dependency on libffi
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 12:40:28 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

libproxy uses libffi, but the depends is missing

Fixes intermittent build errors.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 510c6b7..f396cc3 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
-DEPENDS = "gconf"
+DEPENDS = "gconf libffi"
 
 PR = "r5"
 
-- 
1.7.10.4



