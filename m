Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TyG2P-0003tn-08
	for Openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 07:11:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2013 21:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,527,1355126400"; d="scan'208";a="251573116"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2013 21:56:12 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 23 Jan 2013 21:56:09 -0800
Message-Id: <5d5324f0b338872221a92884543df7e46bae012c.1359005591.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1359005591.git.nitin.a.kamble@intel.com>
References: <cover.1359005591.git.nitin.a.kamble@intel.com>
Subject: [RFC 1/3] packagegroup-core-x11-xserver: Add XSERVERCODECS variable
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
X-List-Received-Date: Thu, 24 Jan 2013 06:11:50 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

At present its hard for the system to provide extra x11 hardware codecs.
We could lump them in with the XSERVER variable but this is suboptimal as
in some use cases the user might not want to include them in some images.

With this patch we keep our options open about separating usage of the two
in the future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-x11-xserver.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index fd6ed42..3c70c53 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -10,10 +10,12 @@ inherit packagegroup
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
+XSERVERCODECS ?= ""
 
 SUMMARY_${PN} = "X11 display server"
 RDEPENDS_${PN} = "\
     ${XSERVER} \
+    ${XSERVERCODECS} \
     "
 
 # Allow replacing task-x11-server in meta-oe
-- 
1.7.3.4



