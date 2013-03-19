Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UHvBz-0005M8-Mq
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 12:59:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 04:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,872,1355126400"; d="scan'208";a="304385674"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.154])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 04:41:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 11:41:38 +0000
Message-Id: <c663d4232e8299f8ee1be3f994a10b14783a93c0.1363692967.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363692967.git.paul.eggleton@linux.intel.com>
References: <cover.1363692967.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1363692967.git.paul.eggleton@linux.intel.com>
References: <cover.1363692967.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/2] packagegroup-core-tools-debug: remove rsync
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 11:59:03 -0000

This was added for supporting Anjuta, which is no longer actively
supported; in any case the anjuta-remote-run package RDEPENDS on rsync
so it will be brought in by that if that is added.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index d49f224..a6280fb 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -24,7 +24,6 @@ RDEPENDS_${PN} = "\
     gdbserver \
     tcf-agent \
     openssh-sftp-server \
-    rsync \
     strace \
     ${MTRACE} \
     "
-- 
1.7.10.4



