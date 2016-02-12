Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D26B56057B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 14:15:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2016 06:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,436,1449561600"; d="scan'208";a="901530706"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2016 06:15:22 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1806D6A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 07:03:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 16:18:33 +0200
Message-Id: <1455286713-7155-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] maintainers.inc: include libjpeg-turbo and mmc-utils
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
X-List-Received-Date: Fri, 12 Feb 2016 14:15:26 -0000

Include libjpeg-turbo and mmc-utils packages in the list.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-yocto/conf/distro/include/maintainers.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index de1f818..8fe87c8 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -253,7 +253,7 @@ RECIPE_MAINTAINER_pn-iputils = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-irda-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-iso-codes = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-iw = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-jpeg = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libjpeg-turbo = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -752,3 +752,4 @@ RECIPE_MAINTAINER_pn-zaurusd = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-zip = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-zlib = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-stress = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-mmc-utils = "Maxin B. John <maxin.john@intel.com>"
-- 
2.4.0


