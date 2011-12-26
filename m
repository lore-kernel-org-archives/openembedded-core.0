Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfE4J-00010d-Cq
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 18:10:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Dec 2011 09:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="90426994"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 26 Dec 2011 09:02:59 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 01:12:00 +0800
Message-Id: <2823b4e97d9aee8d4f48610ec76b42b637dce78b.1324918959.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <dab83815d71c52b28747493c70011a39a0004015.1324918959.git.shane.wang@intel.com>
References: <dab83815d71c52b28747493c70011a39a0004015.1324918959.git.shane.wang@intel.com>
In-Reply-To: <cover.1324918958.git.shane.wang@intel.com>
References: <cover.1324918958.git.shane.wang@intel.com>
Subject: [PATCH 3/5] libical: upgrade to 0.48
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
X-List-Received-Date: Mon, 26 Dec 2011 17:10:35 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../libical/{libical_0.47.bb => libical_0.48.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/libical/{libical_0.47.bb => libical_0.48.bb} (78%)

diff --git a/meta/recipes-sato/libical/libical_0.47.bb b/meta/recipes-sato/libical/libical_0.48.bb
similarity index 78%
rename from meta/recipes-sato/libical/libical_0.47.bb
rename to meta/recipes-sato/libical/libical_0.48.bb
index ee4351a..80f629c 100644
--- a/meta/recipes-sato/libical/libical_0.47.bb
+++ b/meta/recipes-sato/libical/libical_0.48.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
            file://pthread-fix.patch"
 
-SRC_URI[md5sum] = "21f7f8a21e3d857c9476be732e52dc32"
-SRC_URI[sha256sum] = "af4cbb4bb13d9ed3f2262181da9199823feba70802b15cc3e89b263d95da2888"
+SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
+SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
 
 inherit autotools
-- 
1.7.6



