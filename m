Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC1373EE5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:33:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2015 12:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,374,1427785200"; d="scan'208";a="690381495"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2015 12:33:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 22:33:10 +0300
Message-Id: <5ccc7022622345463400d9d5184fbb9ac73a93c4.1430854134.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <24c5746bad8f22cc3d79ae2e3a6ded92ae2653af.1430854134.git.jussi.kukkonen@intel.com>
References: <24c5746bad8f22cc3d79ae2e3a6ded92ae2653af.1430854134.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430854134.git.jussi.kukkonen@intel.com>
References: <cover.1430854134.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] randrproto: Upgrade 1.4.0 -> 1.4.1
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
X-List-Received-Date: Tue, 05 May 2015 19:33:26 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{randrproto_1.4.0.bb => randrproto_1.4.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{randrproto_1.4.0.bb => randrproto_1.4.1.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.4.1.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
rename to meta/recipes-graphics/xorg-proto/randrproto_1.4.1.bb
index 638e396..601de05 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.4.1.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "ce4d0b05675968e4c83e003cc809660d"
-SRC_URI[sha256sum] = "85c42e8c66a55318ddaf2ce5727beacb25cb1f8555229f778cd1da86478209cf"
+SRC_URI[md5sum] = "51ff4d45dbe8e1098740d384971805ee"
+SRC_URI[sha256sum] = "543dcb2ebb0622d8a506dcef6470c6dd066f3e3f866552a5060b91ab6129e1dc"
-- 
2.1.4


