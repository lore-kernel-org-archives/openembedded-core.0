Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8A55E605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:11:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 05:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,349,1496127600"; d="scan'208";a="107345944"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 12 Jul 2017 05:11:49 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7B6545807D9;
	Wed, 12 Jul 2017 05:11:48 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, gizero@gmail.com,
	otavio@ossystems.com.br
Date: Wed, 12 Jul 2017 15:11:44 +0300
Message-Id: <398dc7b3b911038111f4379d3456b158c6c2dca9.1499860838.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499860838.git.jussi.kukkonen@intel.com>
References: <cover.1499860838.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] mesa-gl: Clean recipe
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
X-List-Received-Date: Wed, 12 Jul 2017 12:11:54 -0000

Don't EXCLUDE_FROM_WORLD, mesa.inc already does this.
Don't add a non-existing path to FILESEXTRAPATHS.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
index e3604f3..b9e3b80 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
@@ -2,12 +2,8 @@ require mesa_${PV}.bb
 
 SUMMARY += " (OpenGL only, no EGL/GLES)"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/mesa:"
-
 PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
 PACKAGECONFIG ??= "dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-
-EXCLUDE_FROM_WORLD = "1"
-- 
2.1.4


