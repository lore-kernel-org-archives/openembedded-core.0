Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 81C26782DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:31:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="1198786822"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2017 07:31:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 17:28:10 +0300
Message-Id: <20170724142818.44403-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/11] bash-completion: upgrade to 2.7
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
X-List-Received-Date: Mon, 24 Jul 2017 14:31:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{bash-completion_2.5.bb => bash-completion_2.7.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.5.bb => bash-completion_2.7.bb} (88%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.5.bb b/meta/recipes-support/bash-completion/bash-completion_2.7.bb
similarity index 88%
rename from meta/recipes-support/bash-completion/bash-completion_2.5.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.7.bb
index dd22857a70c..7877e51d11b 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.5.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.7.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "15300010bd4034de12c3fc4f171692e3"
-SRC_URI[sha256sum] = "b0b9540c65532825eca030f1241731383f89b2b65e80f3492c5dd2f0438c95cf"
+SRC_URI[md5sum] = "28117492bdc9408438e6041683a423ce"
+SRC_URI[sha256sum] = "41ba892d3f427d4a686de32673f35401bc947a7801f684127120cdb13641441e"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
-- 
2.13.2


