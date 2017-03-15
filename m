Return-Path: <brian.avery@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D8F70730E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489611433; x=1521147433;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=PtG95ovW+NM+jCGcaQkojmFfWAUVlt0NcMkpeIMbe2c=;
	b=dCtZax5WZcGlXVlkd4ZenyAxO/IulPVL0c1bY1sLA7DeGRpeGE/uiv0E
	Z43oAHbODDbrEO0BYXPVjCgLZ545Hw==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 13:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="60872697"
Received: from echidna.jf.intel.com ([10.54.77.142])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2017 13:57:11 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 06:48:01 -0700
Message-Id: <bdcfaa9defdcd0f799140a3946fb2bb32e5a4504.1489585481.git.brian.avery@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1489585481.git.brian.avery@intel.com>
References: <cover.1489585481.git.brian.avery@intel.com>
Subject: [PATCH 1/1] tivesdk-packagegroup-sdk-host.bb: add cmake
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
X-List-Received-Date: Wed, 15 Mar 2017 20:57:11 -0000

The Eclipse plugin uses cmake from the SDK and currently has issues
because cmake is not installed as a host tool.  This patch adds cmake as
a host tool for the sdk/esdk.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 3283e73..2ca6392 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = "\
     nativesdk-shadow \
     nativesdk-makedevs \
     nativesdk-dnf \
+    nativesdk-cmake \
     nativesdk-postinst-intercept \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     "
-- 
2.7.4


