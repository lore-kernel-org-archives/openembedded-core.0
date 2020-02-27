Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E1A3561144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:06:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2020 16:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="256519760"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 16:06:28 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 16:06:03 -0800
Message-Id: <20200227000603.14252-5-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] maintainers.inc: add self for atk, at-spi2-core, at-spi2-atk
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
X-List-Received-Date: Thu, 27 Feb 2020 00:06:27 -0000
Content-Transfer-Encoding: 8bit

For GUI automation purposes, strong motivation for accessibility (a11y)
via python3-dogtail and python3-pyatspi2, so taking over from Anuj.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8f612ace39..10095ffe76 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -49,9 +49,9 @@ RECIPE_MAINTAINER_pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-assimp = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-at = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-at-spi2-atk = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-at-spi2-core = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-atk = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-at-spi2-atk = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-at-spi2-core = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-atk = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-attr = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
-- 
2.24.0


