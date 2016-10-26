Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4C30871C73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 26 Oct 2016 01:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="183964766"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2016 01:37:58 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4FD936A4006;
	Wed, 26 Oct 2016 01:37:23 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:34 +0300
Message-Id: <9fce9de1e167be4163963d67b5ce1026d4bb9fe5.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 11/16] libxfont: Upgrade 1.5.1 -> 1.5.2
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:56 -0000

Bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libxfont_1.5.1.bb => libxfont_1.5.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.1.bb => libxfont_1.5.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
index e01f331..a5694a3 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
@@ -18,8 +18,8 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "96f76ba94b4c909230bac1e2dcd551c4"
-SRC_URI[sha256sum] = "b70898527c73f9758f551bbab612af611b8a0962202829568d94f3edf4d86098"
+SRC_URI[md5sum] = "254ee42bd178d18ebc7a73aacfde7f79"
+SRC_URI[sha256sum] = "02945ea68da447102f3e6c2b896c1d2061fd115de99404facc2aca3ad7010d71"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.1.4


