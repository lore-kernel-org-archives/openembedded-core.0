Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvHSH-0000PR-EE
	for Openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 02:06:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2013 16:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="277364589"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2013 16:50:34 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 16:50:33 -0800
Message-Id: <d4a109987c600a53cc03172fb7738cf046091e48.1358297126.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fd0fcc2c7adcf22e25677147ef975616f8b9a020.1358297126.git.nitin.a.kamble@intel.com>
References: <fd0fcc2c7adcf22e25677147ef975616f8b9a020.1358297126.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1358297126.git.nitin.a.kamble@intel.com>
References: <cover.1358297126.git.nitin.a.kamble@intel.com>
Subject: [Patch v2 2/2] ia32-base.inc: Add more macros for xf86 drivers
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
X-List-Received-Date: Wed, 16 Jan 2013 01:06:15 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit adds macros for fbdev & modesetting X driver packages.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32-base.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index ab8ef65..0798bf8 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -47,3 +47,7 @@ XSERVER_IA32_I965 = "xf86-video-intel \
            "
 
 XSERVER_IA32_VESA = "xf86-video-vesa"
+
+XSERVER_IA32_FBDEV = "xf86-video-fbdev"
+
+XSERVER_IA32_MODESETTING = "xf86-video-modesetting"
-- 
1.7.3.4



