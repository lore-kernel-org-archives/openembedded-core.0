Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJY-0001in-5C
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="917582102"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2011 16:44:59 -0700
Message-Id: <dae1c0173659fa2a9651b2e2030f76ce4bc5d841.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 10:13:35 -0700
Date: Tue, 03 May 2011 16:44:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 29/33] linuxdoc-tools-native: add groff-native to DEPENDS
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
X-List-Received-Date: Tue, 03 May 2011 23:47:36 -0000

From: Saul Wold <sgw@linux.intel.com>

groff-native is needed to ensure that configure finds
the groff-native binary instead of the host's groff,
this is to ensure the correct macros are used (-ms vs -mgs)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
index fbe9219..fafa421 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://packages.debian.org/linuxdoc-tools"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fbccc46cff2379505ca4e09c7d6ccfe"
 
-DEPENDS = "openjade-native"
+DEPENDS = "groff-native openjade-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.tar.gz \
            file://disable_sgml2rtf.patch \
-- 
1.7.4.1



