Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DD7036B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 13:06:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2013 06:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,928,1367996400"; d="scan'208";a="384330571"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2013 06:06:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:08:45 +0300
Message-Id: <d70c72684197344f5d569727767b406483da1c96.1377090473.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377090473.git.cristian.iorga@intel.com>
References: <cover.1377090473.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377090473.git.cristian.iorga@intel.com>
References: <cover.1377090473.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] default-providers: Set the preferred provider for bluez
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
X-List-Received-Date: Wed, 21 Aug 2013 13:06:59 -0000

There is a need for a default provider for bluez
now that bluez5 recipe is also present.

Fixes [YOCTO #5030].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 67cc5f5..9255fd6 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -39,3 +39,4 @@ PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
 PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
+PREFERRED_PROVIDER_bluez4 ?= "bluez4"
-- 
1.8.1.2


