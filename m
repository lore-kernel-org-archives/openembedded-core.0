Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UFMDG-0004Yg-DT
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 11:13:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2013 02:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,829,1355126400"; d="scan'208";a="277191611"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2013 02:55:55 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 61FE2560631; Tue, 12 Mar 2013 11:56:05 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 11:56:00 +0200
Message-Id: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [Patch V3] Coreutils 6.9 depends on libattr
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
X-List-Received-Date: Tue, 12 Mar 2013 10:13:56 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

We have a build dependency, so list it out.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index c0778ba..f712692 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -9,6 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
 PR = "r5"
+DEPENDS = "attr"
 DEPENDS_class-native = "gettext-native"
 
 inherit autotools gettext
-- 
1.7.10.4



