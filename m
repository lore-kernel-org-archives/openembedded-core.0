Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlyu8-0001t0-Nj
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949287"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:46:54 -0700
Message-Id: <d8c253770b7a955e3424817aa446008efb2c85b6.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 04/35] meta/conf/local.conf.sample: remove nonfunctional BBINCLUDELOGS setting
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:45 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This option does nothing in recent versions of BitBake, and the vast
majority of users will want the log printed out on failure anyway.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 1f66c89..62e6e3b 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -128,9 +128,6 @@ PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
 # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
 # LDFLAGS =+ "-pg"
 
-# Uncomment this if you want BitBake to emit the log if a build fails.
-BBINCLUDELOGS = "yes"
-
 # The architecture to build SDK items for, by setting this you can build SDK
 # packages for architectures other than the host i.e. building i686 packages
 # on an x86_64 host.
-- 
1.7.3.4



