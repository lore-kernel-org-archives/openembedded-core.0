Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfC3O-0005bk-55
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 16:01:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Dec 2011 06:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106108404"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 26 Dec 2011 06:54:01 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Dec 2011 22:56:32 +0800
Message-Id: <febb6ad1f47873fb6ffce94541408a9d4460198f.1324911024.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
References: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
In-Reply-To: <cover.1324911023.git.shane.wang@intel.com>
References: <cover.1324911023.git.shane.wang@intel.com>
Subject: [PATCH 12/13] libpcap: upgrade to 1.2.0
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
X-List-Received-Date: Mon, 26 Dec 2011 15:01:30 -0000

This patch is to upgrade libpcap to 1.2.0.
The values of the macro definitions are duplicated with the new code, so change them into other values.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libpcap-1.1.1 => libpcap-1.2.0}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    4 ++--
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../libpcap/{libpcap_1.1.1.bb => libpcap_1.2.0.bb} |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.1.1 => libpcap-1.2.0}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.1.1 => libpcap-1.2.0}/ieee80215-arphrd.patch (91%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.1.1.bb => libpcap_1.2.0.bb} (73%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap-1.2.0/aclocal.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.1.1/aclocal.patch
rename to meta/recipes-connectivity/libpcap/libpcap-1.2.0/aclocal.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap-1.2.0/ieee80215-arphrd.patch
similarity index 91%
rename from meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch
rename to meta/recipes-connectivity/libpcap/libpcap-1.2.0/ieee80215-arphrd.patch
index 8041d7a..2f5cd21 100644
--- a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap-1.2.0/ieee80215-arphrd.patch
@@ -9,10 +9,10 @@ Index: libpcap-1.0.0/pcap-linux.c
  		//handle->md.cooked = 1;
  		break;
 +#ifndef ARPHRD_IEEE80215
-+#define ARPHRD_IEEE80215 804
++#define ARPHRD_IEEE80215 805
 +#endif
 +#ifndef ARPHRD_IEEE80215_PHY
-+#define ARPHRD_IEEE80215_PHY 805
++#define ARPHRD_IEEE80215_PHY 806
 +#endif
 +
 +    case ARPHRD_IEEE80215:
diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 84001e5..6051bbc 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
 DEPENDS = "flex-native bison-native"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.2.0.bb
similarity index 73%
rename from meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.2.0.bb
index 2700bb7..bc7c03b 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.2.0.bb
@@ -5,8 +5,8 @@ PR = "${INC_PR}.0"
 SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch"
 
-SRC_URI[md5sum] = "1bca27d206970badae248cfa471bbb47"
-SRC_URI[sha256sum] = "508cca15547e55d1318498b838456a21770c450beb2dc7d7d4a96d90816e5a85"
+SRC_URI[md5sum] = "dfb8aa690b7a29821bfa183025436569"
+SRC_URI[sha256sum] = "702ac51cfaa5c17d6b92771b22835d58eda4dc9e1f596c80a0b031e4c45c07d6"
 
 #
 # make install doesn't cover the shared lib
-- 
1.7.6



