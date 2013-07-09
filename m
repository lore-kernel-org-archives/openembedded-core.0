Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF8C6B0F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:50:43 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2013 01:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1026,1363158000"; d="scan'208";a="328624365"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2013 01:50:27 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 11:57:49 +0300
Message-Id: <ff3366ce77a506f960c1ccdbee092d01679bcc6d.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <96ee91995791988598109eeb85a57ab94ea65e16.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <96ee91995791988598109eeb85a57ab94ea65e16.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 2/4] lttng-modules: rename recipe
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
X-List-Received-Date: Tue, 09 Jul 2013 08:50:43 -0000

Git packages should have _git in their recipe name and should include
git token inside the PV variable.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb => lttng-modules_git.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_git.bb
index dd35396..3a92879 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/kernel"
 inherit module
 
 SRCREV = "1b26381c19dd2d9fa41f52d8dc13b15b8dd32c7c"
-PV = "2.2.0"
+PV = "2.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.7.9.5


