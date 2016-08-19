Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC06770C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:35:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2016 08:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="1017407682"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2016 08:35:03 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:34:49 +0100
Message-Id: <e1c9ed16dca8115a052e08732ec66ce29c9da746.1471620482.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
Subject: [PATCH 4/5] security_flags: update comment header
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
X-List-Received-Date: Fri, 19 Aug 2016 15:35:03 -0000

Embelish a little on the utility of the extra compiler and linker
flags enabled by this include.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 698f4c2..295c733 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,6 +1,9 @@
-# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These 
-# don't work universally, there are recipes which can't use one, the other
-# or both so a blacklist is maintained here. The idea would be over
+# Setup extra CFLAGS and LDFLAGS which:
+# * add extra compilation checks for known security anti-patterns
+# * generate extra code to protect against various attacks
+# * harden the produced binaries to provide extra protection against attacks.
+# These don't work universally, there are recipes which can't use one, the
+# other or both so a blacklist is maintained here. The idea would be over
 # time to reduce this list to nothing.
 # From a Yocto Project perspective, this file is included and tested
 # in the DISTRO="poky-lsb" configuration.
-- 
2.7.4


