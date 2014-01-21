Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 754B160DBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 20:41:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 12:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470314944"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 12:41:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 12:41:35 -0800
Message-Id: <1390336896-3652-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] lsbinitscripts: Update to 9.52
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
X-List-Received-Date: Tue, 21 Jan 2014 20:41:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.50.bb => lsbinitscripts_9.52.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.50.bb => lsbinitscripts_9.52.bb} (78%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
similarity index 78%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
index 347fa7f..11deae2 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.50.tar.bz2/7252642952d33be10cc00beb862c7b7b/initscripts-9.50.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/2453811ec27a781a77f309f356663d9e/initscripts-${PV}.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "7252642952d33be10cc00beb862c7b7b"
-SRC_URI[sha256sum] = "1d8fb32b9a7de0c24437acdab27d71deb58c05314f81978ec2aea574fba862e0"
+SRC_URI[md5sum] = "2453811ec27a781a77f309f356663d9e"
+SRC_URI[sha256sum] = "0b3bb828a5d3a3f210b8e606c0416813ba0d021a859658af14810865d2ee8867"
 
 inherit update-alternatives
 
-- 
1.8.3.1


