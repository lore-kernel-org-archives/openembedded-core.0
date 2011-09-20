Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6A3T-0006Th-7p
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 01:48:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 16:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50889698"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2011 16:43:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 16:43:21 -0700
Message-Id: <1b783e204618a1cd2a9e46066219a9df0aa345d3.1316562083.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316562083.git.sgw@linux.intel.com>
References: <cover.1316562083.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316562083.git.sgw@linux.intel.com>
References: <cover.1316562083.git.sgw@linux.intel.com>
Subject: [RC Fixes 5/8] zypper: git repo moved to github
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
X-List-Received-Date: Tue, 20 Sep 2011 23:48:47 -0000

From: Anders Darander <anders@chargestorm.se>

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-extended/zypper/zypper_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 299fcb5..7f7ceb3 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -11,7 +11,7 @@ SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
 
-SRC_URI = "git://gitorious.org/opensuse/zypper.git;protocol=git \
+SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
            file://cmake.patch \
            file://dso_linking_change_build_fix.patch \
            file://rpm5-flag.patch \
-- 
1.7.6



