Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q0A0P-0005ZM-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 11:00:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Mar 2011 02:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,198,1299484800"; d="scan'208";a="614090754"
Received: from unknown (HELO localhost) ([10.255.12.145])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2011 02:58:45 -0700
Message-Id: <a38a102b1ab3a6f53e6f5fcdb79f05fa0e83b576.1300355683.git.sgw@linux.intel.com>
In-Reply-To: <cover.1300355683.git.sgw@linux.intel.com>
References: <cover.1300355683.git.sgw@linux.intel.com>
Old-Date: Wed, 16 Mar 2011 13:53:36 -0700
Date: Thu, 17 Mar 2011  2:58:45 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 4/7] poky.conf: add additional Libraries to the LGPLv2 Whitelist
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
X-List-Received-Date: Thu, 17 Mar 2011 10:00:34 -0000

From: Saul Wold <sgw@linux.intel.com>

The ligcc and gcc-runtime both are LGPLv2 libraries although they
are part of the large GCC GPLv3 code. There is clearly called out
exceptions for these libraries.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/poky.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 71e40de..eee12b7 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -131,7 +131,7 @@ EXTRAOPKGCONFIG = "poky-feed-config-opkg"
 # directly part of the distribution. 
 HOSTTOOLS_WHITELIST_GPLv3 ?= ""
 WHITELIST_GPLv3 ?= "less gnome-common"
-LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn" 
+LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc gcc-runtime" 
 
 # This is a list of packages that require a commercial license to ship
 # product. If shipped as part of an image these packages may have 
-- 
1.7.1.1



