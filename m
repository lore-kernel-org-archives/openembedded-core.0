Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlyub-00028v-LA
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949400"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:25 -0700
Message-Id: <335e5fd685a4420a08a232028e7a2581da19cd98.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 35/35] utils.bbclass: Don't forget to pass the cmdline options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 07:52:16 -0000

This ensure that the command line options from the creation of the wrapper
are actaully passed into the wrapper.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/utils.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 9930a24..8c3a9b8 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -290,7 +290,7 @@ create_cmdline_wrapper () {
    cat <<END >$cmd
 #!/bin/sh
 realpath=\`readlink -fn \$0\`
-exec \`dirname \$realpath\`/$cmdname "\$@"
+exec \`dirname \$realpath\`/$cmdname $@ "\$@"
 END
    chmod +x $cmd
 }
-- 
1.7.3.4



