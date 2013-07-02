Return-Path: <eflanagan@envy.jf.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 59FA961FB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 18:22:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2013 10:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,982,1363158000"; d="scan'208";a="363661430"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 10:47:16 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id r62Hjsb5009060;
	Tue, 2 Jul 2013 10:45:54 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id r62Hjoxf009059;
	Tue, 2 Jul 2013 10:45:50 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 10:45:48 -0700
Message-Id: <1372787148-9023-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] layer.conf: Bumping LAYERVERSION_core
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
X-List-Received-Date: Tue, 02 Jul 2013 18:22:57 -0000

Bumping LAYERVERSION_core to denote where meta-toolchain* is being
depreciated.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a112e86..a834765 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PRIORITY_core = "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "1"
+LAYERVERSION_core = "2"
 
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
-- 
1.7.5.4


