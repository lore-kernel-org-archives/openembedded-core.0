Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44q-0006KA-3z
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478078"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:04 +0300
Message-Id: <3c18344e8a6a4a0b7aad1d1322d02ab8accc9db1.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/12] csl-versions: fix bb.process.CmdError reference
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
X-List-Received-Date: Thu, 17 May 2012 17:01:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/csl-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index ec7a6ba..0790b8a 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -83,7 +83,7 @@ def csl_get_kernel_version(d):
 def csl_get_gdb_version(d):
 	try:
 		stdout, stderr = csl_run(d, 'gdb', '-v')
-	except CmdError:
+	except bb.process.CmdError:
 		return 'UNKNOWN'
 	else:
 		first_line = stdout.splitlines()[0]
-- 
1.7.7.6



