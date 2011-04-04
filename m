Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q6pQK-00080l-J2
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 21:26:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,299,1299484800"; d="scan'208";a="675105104"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
Message-Id: <603b43e614445ff5da295f4746c716d572d2992b.1301921659.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1301921659.git.nitin.a.kamble@intel.com>
References: <cover.1301921659.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 29 Mar 2011 10:29:40 -0700
Date: Mon, 04 Apr 2011  5:56:21 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] image.bbclass: make execution ldconfig verbose
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
X-List-Received-Date: Mon, 04 Apr 2011 19:26:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The failure of ldconfig was not getting logged anywhere before.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/image.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2cc17e1..95e3f4d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -113,7 +113,8 @@ fakeroot do_rootfs () {
 
 	# Run ldconfig on the image to create a valid cache 
 	# (new format for cross arch compatibility)
-	ldconfig -r ${IMAGE_ROOTFS} -c new
+	echo executing: ldconfig -r ${IMAGE_ROOTFS} -c new -v
+	ldconfig -r ${IMAGE_ROOTFS} -c new -v
 
 	# (re)create kernel modules dependencies
 	# This part is done by kernel-module-* postinstall scripts but if image do
-- 
1.7.2.2



