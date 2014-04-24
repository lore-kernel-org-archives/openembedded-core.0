Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA94365D26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:16:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2014 02:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,917,1389772800"; d="scan'208";a="518695483"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2014 02:15:47 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 12:19:06 +0300
Message-Id: <a6e35d48ad36d24cb95912e80ae2ba5f18af167b.1398331032.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
Subject: [PATCH 4/4] iproute2: upgrade to 3.14
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
X-List-Received-Date: Thu, 24 Apr 2014 09:16:03 -0000

- switched to ${BP} variable;
- removed parallel make restriction;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc                    | 2 --
 .../iproute2/{iproute2_3.12.0.bb => iproute2_3.14.0.bb}            | 7 +++----
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.12.0.bb => iproute2_3.14.0.bb} (51%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 568aa5f..09ea3d2 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -36,5 +36,3 @@ ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
 ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
-
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.12.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.14.0.bb
similarity index 51%
rename from meta/recipes-connectivity/iproute2/iproute2_3.12.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.14.0.bb
index 8cd9d21..ed40648 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.12.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.14.0.bb
@@ -1,12 +1,11 @@
 require iproute2.inc
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
           "
-
-SRC_URI[md5sum] = "f87386aaaecafab95607fd10e8152c68"
-SRC_URI[sha256sum] = "44f600475d27a421688cda2294efec38513473a740c24ead78eb20005f08f111"
+SRC_URI[md5sum] = "bd9d7567bbb987c88120669f5e1a1092"
+SRC_URI[sha256sum] = "bda38951c49f89ffc2e2fe85579ce616337b5d3a2f0319921fd071c838356bd4"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.9.1


