Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A4D9577328
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893686061"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:43 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:12 +0000
Message-Id: <1d60b6f6be736474d1fe13a9974b1b27967e78cc.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 08/10] swupd-client: RDEPENDS on oe-swupd-helpers
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:43 -0000

The oe-swupd-helpers package provides scripts and units that swupd-client
calls before, during and after the update process.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/swupd/swupd-client_2.87.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/swupd/swupd-client_2.87.bb b/meta/recipes-devtools/swupd/swupd-client_2.87.bb
index a5afdd6..73bfeb1 100644
--- a/meta/recipes-devtools/swupd/swupd-client_2.87.bb
+++ b/meta/recipes-devtools/swupd/swupd-client_2.87.bb
@@ -16,9 +16,7 @@ SRC_URI[sha256sum] = "45df259a7dc2fed985ee9961e112120fc46670dd75476c3262fc6804b1
 
 DEPENDS = "glib-2.0 curl zlib bzip2 xz openssl"
 RDEPENDS_${PN} = "gzip bzip2 tar xz"
-# swupd requires at least an update-triggers target, should it be part of the
-# swupd-client package?
-RDEPENDS_${PN} = "swupd-units"
+RDEPENDS_${PN}_class-target = "oe-swupd-helpers"
 # We check /etc/os-release for the current OS version number
 RRECOMMENDS_${PN} = "os-release"
 
-- 
2.5.0


