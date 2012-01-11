Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rko1f-0004H4-Ru
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 03:34:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jan 2012 18:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55308851"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jan 2012 18:27:18 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 18:27:11 -0800
Message-Id: <cb9f5a7ec9129d532e0648b40a133647281e0fea.1326248769.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0068c70293f7b94561ecc2403103f54cc36e70c8.1326248768.git.nitin.a.kamble@intel.com>
References: <0068c70293f7b94561ecc2403103f54cc36e70c8.1326248768.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326248768.git.nitin.a.kamble@intel.com>
References: <cover.1326248768.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/6] diffstat: upgrade from 1.54 to 1.55
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
X-List-Received-Date: Wed, 11 Jan 2012 02:34:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{diffstat_1.54.bb => diffstat_1.55.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.54.bb => diffstat_1.55.bb} (82%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.54.bb b/meta/recipes-devtools/diffstat/diffstat_1.55.bb
similarity index 82%
rename from meta/recipes-devtools/diffstat/diffstat_1.54.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.55.bb
index ab89f62..fdc2967 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.54.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.55.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
            file://dirfix.patch"
 
-SRC_URI[md5sum] = "af08bef2eb37050ceb0c4fddedb2ee36"
-SRC_URI[sha256sum] = "d8e67660ec85be597f8548ecdd088926639dac34ec7184aaf9d09c1e6ecb83e5"
+SRC_URI[md5sum] = "630d5278f1cd874dc3cc68cff3fddecf"
+SRC_URI[sha256sum] = "59a46c75a99f2c373a81880051adc43a17b71c55478691e702c61c13c6d61b55"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
1.7.6.4



