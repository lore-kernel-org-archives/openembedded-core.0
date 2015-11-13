Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CA91777308
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599687049"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:11 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:47:03 +0200
Message-Id: <1525e00209c68d04aa5360e278da3c23753ec0e0.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 18/19] xkbcomp: Upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.3.0.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.3.1.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.3.0.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.3.1.bb
index efac069..1c98359 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.3.1.bb
@@ -15,5 +15,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "0012a8e3092cddf7f87b250f96bb38c5"
-SRC_URI[sha256sum] = "cfac973778fabf5216121ad60b7af8ab74ce7513af0f9260cf8c5309e1622b2a"
+SRC_URI[md5sum] = "a4d8353daf6cb0a9c47379b7413c42c6"
+SRC_URI[sha256sum] = "0304dc9e0d4ac10831a9ef5d5419722375ddbc3eac3ff4413094d57bc1f1923d"
-- 
2.1.4


