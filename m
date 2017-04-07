Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4608D77D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491545382; x=1523081382;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=2PauwGYisoG7Xg3PRC905M4eUW+U3ZJri6sY1iwhT3s=;
	b=eIwlPtQMGJAf67mnDCekJ3HNdOQ7ggld4p0sYDRYLDBN3h2jVlDSmELa
	OjbZILVHESWhYOg7Psscd+SyRF0Rmg==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 23:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,163,1488873600"; d="scan'208";a="1132428018"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 23:09:41 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DFF206A4080;
	Thu,  6 Apr 2017 23:09:31 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 09:09:33 +0300
Message-Id: <dfedca71b6debe323a679e497dc5f35b637a4929.1491483222.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491483222.git.jussi.kukkonen@intel.com>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] mkfontdir: Remove x11 requirement
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
X-List-Received-Date: Fri, 07 Apr 2017 06:09:40 -0000

Build does not need libx11, so also does not need the distro feature.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
index a453e24..371d9a1 100644
--- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
@@ -11,6 +11,10 @@ files."
 PE = "1"
 PR = "${INC_PR}.0"
 
+# We don't actually need x11 as xorg-app-common claims
+DEPENDS = "util-macros-native"
+REQUIRED_DISTRO_FEATURES = ""
+
 RDEPENDS_${PN} += "mkfontscale"
 RDEPENDS_${PN}_class-native += "mkfontscale-native"
 
-- 
2.1.4


