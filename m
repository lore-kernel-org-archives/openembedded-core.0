Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0cV3-00005r-QF
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 17:26:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2011 09:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="898712921"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2011 09:24:16 -0700
Message-Id: <d551d658a7848658f5b664c08fb0a0840369d1bc.1300465259.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1300465259.git.nitin.a.kamble@intel.com>
References: <cover.1300465259.git.nitin.a.kamble@intel.com>
Old-Date: Wed, 16 Mar 2011 13:53:36 -0700
Date: Fri, 18 Mar 2011  9:24:16 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 3/7] poky.conf: add additional Libraries to the LGPLv2 Whitelist
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
X-List-Received-Date: Fri, 18 Mar 2011 16:26:06 -0000

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
1.7.3.4



