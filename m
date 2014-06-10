Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE736FA5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 20:25:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2014 13:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1011,1392192000"; d="scan'208";a="526412329"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.65])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2014 13:25:57 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jun 2014 13:24:14 -0700
Message-Id: <b97d1bf2c6f7e8d73245d24c8a2bad9d47b54e20.1402431641.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1402431641.git.max.eliaser@intel.com>
References: <cover.1402431641.git.max.eliaser@intel.com>
Subject: [PATCH 1/3] texinfo: Use texinfo-replacement-native as an alias for texinfo-native.
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
X-List-Received-Date: Tue, 10 Jun 2014 20:25:56 -0000

If texinfo-native is added to ASSUME_PROVIDED, this will be needed for two
reasons. First, a world build will still build the native texinfo recipe, so
it will still get test coverage and will not rot. Second, when the target
architecture texinfo recipe is built, the native recipe must be built first
so its makedoc binary can be extracted, ASSUME_PROVIDED or no.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index c1ccaa7..be90aba 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -7,7 +7,9 @@ SECTION = "console/utils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "zlib ncurses texinfo-native"
+PROVIDES_append_class-native = " texinfo-replacement-native"
+
+DEPENDS = "zlib ncurses texinfo-replacement-native"
 DEPENDS_class-native = "zlib-native ncurses-native"
 
 TARGET_PATCH = "file://use_host_makedoc.patch"
-- 
1.8.3.2


