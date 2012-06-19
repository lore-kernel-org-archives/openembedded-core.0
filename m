Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11V-00027q-9k
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520416"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:56 -0700
Message-Id: <056920553482ead5dc6260668c9af70c1d904029.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 38/39] libevent: disable openssl by default
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:21 -0000

This creates a more deterministic build and also reduces the size of this library.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libevent/libevent_2.0.16.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.0.16.bb b/meta/recipes-support/libevent/libevent_2.0.16.bb
index 38d42f0..1c464ef 100644
--- a/meta/recipes-support/libevent/libevent_2.0.16.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.16.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=50aad300de703db62baae12146832b45"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz \
            file://libevent-2.0.16_fix_for_x32.patch"
@@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "a578c7bcaf3bab1cc7924bd4d219f2ea621ab8c51dfc4f886e234b6ef4
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
+EXTRA_OECONF = "--disable-openssl"
+
 inherit autotools
 
 # Needed for Debian packaging
-- 
1.7.7.6



