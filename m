Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 474D07874D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 15:53:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jan 2018 07:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,318,1511856000"; 
   d="scan'208";a="7657691"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2018 07:53:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 17:53:40 +0200
Message-Id: <20180105155341.13893-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH 1/2] maintainers.inc: add missing entries for gst-validate, gst-examples and meson
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
X-List-Received-Date: Fri, 05 Jan 2018 15:53:44 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4fb7cd32813..bc9c7b0d8d1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -237,7 +237,8 @@ RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-grub = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-grub-efi = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-gsettings-desktop-schemas = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
-RECIPE_MAINTAINER_pn-gst-player = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
+RECIPE_MAINTAINER_pn-gst-examples = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-gst-validate = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gstreamer1.0 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gstreamer1.0-libav = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gstreamer1.0-omx = "Maxin B. John <maxin.john@intel.com>"
@@ -498,6 +499,7 @@ RECIPE_MAINTAINER_pn-menu-cache = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-mesa = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-mesa-demos = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-mesa-gl = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER_pn-meson = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-meta-environment = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-meta-environment-extsdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-meta-extsdk-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.15.1


