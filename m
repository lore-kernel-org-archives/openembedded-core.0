Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 13FC6772BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893686077"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:44 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:13 +0000
Message-Id: <607c8368d4749d2ca6fd6b2a1c663f3d1064937a.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 09/10] swupd-client: enable native builds
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:45 -0000

This is useful for debugging swupd generated artefacts on the build
host i.e. `swupd hashdump`

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/swupd/swupd-client_2.87.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swupd/swupd-client_2.87.bb b/meta/recipes-devtools/swupd/swupd-client_2.87.bb
index 73bfeb1..8226624 100644
--- a/meta/recipes-devtools/swupd/swupd-client_2.87.bb
+++ b/meta/recipes-devtools/swupd/swupd-client_2.87.bb
@@ -18,7 +18,7 @@ DEPENDS = "glib-2.0 curl zlib bzip2 xz openssl"
 RDEPENDS_${PN} = "gzip bzip2 tar xz"
 RDEPENDS_${PN}_class-target = "oe-swupd-helpers"
 # We check /etc/os-release for the current OS version number
-RRECOMMENDS_${PN} = "os-release"
+RRECOMMENDS_${PN}_class-target = "os-release"
 
 inherit pkgconfig autotools-brokensep systemd
 
@@ -45,3 +45,5 @@ FILES_${PN} += "\
 
 SYSTEMD_SERVICE_${PN} = "check-update.timer check-update.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+BBCLASSEXTEND = "native"
-- 
2.5.0


