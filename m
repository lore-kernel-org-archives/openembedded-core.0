Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 09FC265E62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147359"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:29 -0700
Message-Id: <aa0deb5809f41f7e9ff276a31df4bab0ad51d559.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 10/10] xorg-config: move xorg.conf files into conf-files as bbappend
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf-files/conf-files}/genericx86-64/xorg.conf                        | 0
 .../conf-files/conf-files}/genericx86/xorg.conf                           | 0
 .../conf-files/conf-files_%.bbappend}                                     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-yocto-bsp/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/genericx86-64/xorg.conf (100%)
 rename meta-yocto-bsp/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/genericx86/xorg.conf (100%)
 rename meta-yocto-bsp/{recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend => recipes-bsp/conf-files/conf-files_%.bbappend} (100%)

diff --git a/meta-yocto-bsp/recipes-graphics/xorg-xserver/xserver-xf86-config/genericx86-64/xorg.conf b/meta-yocto-bsp/recipes-bsp/conf-files/conf-files/genericx86-64/xorg.conf
similarity index 100%
rename from meta-yocto-bsp/recipes-graphics/xorg-xserver/xserver-xf86-config/genericx86-64/xorg.conf
rename to meta-yocto-bsp/recipes-bsp/conf-files/conf-files/genericx86-64/xorg.conf
diff --git a/meta-yocto-bsp/recipes-graphics/xorg-xserver/xserver-xf86-config/genericx86/xorg.conf b/meta-yocto-bsp/recipes-bsp/conf-files/conf-files/genericx86/xorg.conf
similarity index 100%
rename from meta-yocto-bsp/recipes-graphics/xorg-xserver/xserver-xf86-config/genericx86/xorg.conf
rename to meta-yocto-bsp/recipes-bsp/conf-files/conf-files/genericx86/xorg.conf
diff --git a/meta-yocto-bsp/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/meta-yocto-bsp/recipes-bsp/conf-files/conf-files_%.bbappend
similarity index 100%
rename from meta-yocto-bsp/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
rename to meta-yocto-bsp/recipes-bsp/conf-files/conf-files_%.bbappend
-- 
1.8.3.2


