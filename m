Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QeKWv-0001pI-F9
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 07:20:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2011 22:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,484,1304319600"; d="scan'208";a="21962897"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2011 22:15:15 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:20:19 +0800
Message-Id: <f8bf2b9a546b9cf368da860803e4e2277015cd63.1309928392.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
Subject: [PATCH 2/3] gawk: Upgrade from 3.1.8 to 4.0.0
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
X-List-Received-Date: Wed, 06 Jul 2011 05:20:09 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../gawk/{gawk_3.1.8.bb => gawk_4.0.0.bb}          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_3.1.8.bb => gawk_4.0.0.bb} (85%)

diff --git a/meta/recipes-extended/gawk/gawk_3.1.8.bb b/meta/recipes-extended/gawk/gawk_4.0.0.bb
similarity index 85%
rename from meta/recipes-extended/gawk/gawk_3.1.8.bb
rename to meta/recipes-extended/gawk/gawk_4.0.0.bb
index 7c83ed5..1a2f361 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.8.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.0.bb
@@ -15,8 +15,8 @@ PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "35937a0f83f0efe7a8c2dee635624784"
-SRC_URI[sha256sum] = "2146b3cc7a2d2b16a9457e73f14a3cb51a4292575425ed8f16f7e0a5e4f1a50d"
+SRC_URI[md5sum] = "51e417b71287629940051e6f652c6492"
+SRC_URI[sha256sum] = "c3a7cf7d976e05c6a1d8a9b3f14fa55d4304707408ddafb1396212653ea00be5"
 
 inherit autotools gettext update-alternatives
 
-- 
1.6.3.3



