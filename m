Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63AA565C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:36:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 22 Mar 2016 09:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; d="scan'208";a="942758417"
Received: from unknown (HELO afshjern.zpn.intel.com) ([10.219.16.250])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2016 09:36:35 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 10:37:45 -0600
Message-Id: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
Cc: joshua.g.lock@intel.com, benjamin.esquivel@intel.com, aschultz@tpip.net
Subject: [PATCH] nativesdk-buildtools-perl-dummy.bb: disable ICECC
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
X-List-Received-Date: Tue, 22 Mar 2016 16:36:43 -0000

Disable ICECC, as this recipe was added for compatibility with
the extensible SDK (eSDK), and therefore does not need to be
able to be built with the distributed icecream compiler.

[YOCTO #8934]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 90784a9..b488b03 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -18,6 +18,7 @@ PERLPACKAGES = "nativesdk-perl \
                 nativesdk-perl-module-file-path"
 
 ALLOW_EMPTY_${PN} = "1"
+ICECC_DISABLED = "1"
 
 python populate_packages_prepend() {
     d.appendVar(d.expand('RPROVIDES_${PN}'), '${PERLPACKAGES}')
-- 
2.7.3


