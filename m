Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7F10A6212E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:33:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Nov 2015 01:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853703705"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 01:33:52 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6D04F6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:32:46 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:34:36 +0200
Message-Id: <1447839279-12119-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
References: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/6] libpcap: update to 1.7.4
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
X-List-Received-Date: Wed, 18 Nov 2015 09:33:51 -0000

Update libpcap from version 1.6.2 to 1.7.4

LICENSE checksum has changed because of the removal of additional
spaces in the file.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc                         | 2 +-
 .../libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb}                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} (82%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 0873c24..b7601b0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tcpdump.org/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=53067&atid=469577"
 SECTION = "libs/network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb b/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
similarity index 82%
rename from meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
index 611543e..8d12b25 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
@@ -3,8 +3,8 @@ require libpcap.inc
 SRC_URI += "file://aclocal.patch \
             file://libpcap-pkgconfig-support.patch \
            "
-SRC_URI[md5sum] = "5f14191c1a684a75532c739c2c4059fa"
-SRC_URI[sha256sum] = "5db3e2998f1eeba2c76da55da5d474248fe19c44f49e15cac8a796a2c7e19690"
+SRC_URI[md5sum] = "b2e13142bbaba857ab1c6894aedaf547"
+SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0"
 
 #
 # make install doesn't cover the shared lib
-- 
2.4.0


