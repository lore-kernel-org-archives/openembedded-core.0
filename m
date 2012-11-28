Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TdmVy-0000MK-46
	for Openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 19:37:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2012 10:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,180,1355126400"; d="scan'208";a="225937982"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2012 10:22:22 -0800
From: nitin.a.kamble@intel.com
To: meta-intel@yoctoproject.org, Openembedded-core@lists.openembedded.org,
	tom.zanussi@intel.com, darren.hart@intel.com, ross.burton@intel.com
Date: Wed, 28 Nov 2012 10:21:33 -0800
Message-Id: <ec3a3d7bdf3dbfdda2cb119f60b35fc1fc2abc70.1354126748.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <80889d89c4670fffecda4e06e85c68f73aa67ce0.1354126748.git.nitin.a.kamble@intel.com>
References: <80889d89c4670fffecda4e06e85c68f73aa67ce0.1354126748.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1354126748.git.nitin.a.kamble@intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
Subject: [meta-intel patch 2/3] xserver-psb: fix packaging issues
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
X-List-Received-Date: Wed, 28 Nov 2012 18:37:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Because of the xserver recipe upgrade in the oecore layer, the
xserver packaging defined in the .inc file is changed. And this
change breaks the packaging of this older xserver recipe.
  This commit fixes the issue by using the meta-intel
specific version of the xserver-xorg.inc file.

This fixes bug:
[Yocto #3501]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-xserver/xserver-psb-1.7.99.2.inc          |    2 +-
 .../xorg-xserver/xserver-psb_1.7.99.2.bb           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb-1.7.99.2.inc b/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb-1.7.99.2.inc
index 1fe962b..3004316 100644
--- a/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb-1.7.99.2.inc
+++ b/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb-1.7.99.2.inc
@@ -1,4 +1,4 @@
-PR = "r6"
+PR = "r7"
 
 PROTO_DEPS += "xf86driproto dri2proto"
 
diff --git a/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb b/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
index 6b946d6..4cb5cd2 100644
--- a/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
+++ b/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-xserver/xserver-xorg.inc
+require common/recipes-graphics/xorg-xserver/xserver-xorg.inc
 require xserver-psb-${PV}.inc
 
 SRC_URI[md5sum] = "cafc4e2d4ef6cf6e47f3e7dffeb3346a"
-- 
1.7.3.4



