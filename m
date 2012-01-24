Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpjUg-0005rb-0u
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 17:45:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2012 08:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100029149"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2012 08:37:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 08:37:01 -0800
Message-Id: <1327423021-4038-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH] bitbake.conf: Add additional packages to WHITELIST
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
X-List-Received-Date: Tue, 24 Jan 2012 16:45:14 -0000

These additional packages show up when building a Universe build
since it includes all recipes unconditionally. Most are virtual,
but opkg shows up also.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2cc4b8f..7bf395c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -240,7 +240,7 @@ PROVIDES = ""
 PROVIDES_prepend = "${P} ${PF} ${PN} "
 RPROVIDES = ""
 
-MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/libintl-nativesdk virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
+MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/libintl-nativesdk virtual/xserver virtual/update-alternatives-native virtual/update-alternatives virtual/i586-poky-linux-gcc-initial virtual/linux-libc-headers virtual/libx11 virtual/i586-poky-linux-gcc virtual/i586-poky-linux-libc-for-gcc virtual/i586-poky-linux-gcc-intermediate virtual/libiconv virtual/update-alternatives-nativesdk virtual/libgl virtual/xserver-xf86 virtual/kernel virtual/i586-poky-linux-binutils virtual/libc linux-libc-headers linux-libc-headers-nativesdk opkg opkg-native opkg-nativesdk"
 
 SOLIBS = ".so.*"
 SOLIBS_darwin = ".*.dylib"
-- 
1.7.6.5



