Return-Path: <eflanagan@envy.jf.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5806007C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 22:31:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2013 15:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,983,1363158000"; d="scan'208";a="363807901"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 15:30:47 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id r62MTYPa029305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2013 15:29:34 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id r62MTX9T029304
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Jul 2013 15:29:33 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 15:29:29 -0700
Message-Id: <1372804169-29269-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2] layer.conf: Bumping LAYERVERSION_core
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
X-List-Received-Date: Tue, 02 Jul 2013 22:31:02 -0000

Bumping LAYERVERSION_core to denote where meta-toolchain* is being
depreciated.

This goes back to my RFC:

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39016

As we are removing meta-toolchain* and replacing it with bitbake
<imagename> -c populate_sdk this causes issues with those of us who
need to do automated builds both on the current development branch and
on prior development branches.

Example: For prior releases, I need to build meta-toolchain*. Without
having a simple way to figure out where this is no longer the case, I
(and other folks who run automated builds) end up having to jump
through a lot of hoops trying to figure out where this layer changed.

Utilizing LAYERVERSION_* to do it makes sense as there is a
significant change that would cause issues for build engineers.

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


