Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QljiA-0007Y4-R2
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:38:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2011 08:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="34658297"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.235])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 08:33:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 16:33:36 +0100
Message-Id: <dfcbc9b235c10e43b325c27ee1a1231d7aa82b44.1311694250.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] meta/conf/local.conf.sample: remove nonfunctional BBINCLUDELOGS setting
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
X-List-Received-Date: Tue, 26 Jul 2011 15:38:23 -0000

This option does nothing in recent versions of BitBake, and the vast
majority of users will want the log printed out on failure anyway.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index d8e2383..c719dab 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -117,9 +117,6 @@ PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
 # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
 # LDFLAGS =+ "-pg"
 
-# Uncomment this if you want BitBake to emit the log if a build fails.
-BBINCLUDELOGS = "yes"
-
 # The architecture to build SDK items for, by setting this you can build SDK
 # packages for architectures other than the host i.e. building i686 packages
 # on an x86_64 host.
-- 
1.7.4.1



