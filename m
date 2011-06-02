Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QS38s-0006vH-Ha
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:20:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2011 01:17:20 -0700
X-ExtLoop1: 1
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 02 Jun 2011 01:17:19 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 16:17:16 +0800
Message-Id: <f138fb8d78955dad6cfdac015055973e8ea0ce7b.1307002336.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1307002336.git.dexuan.cui@intel.com>
References: <cover.1307002336.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307002336.git.dexuan.cui@intel.com>
References: <cover.1307002336.git.dexuan.cui@intel.com>
Subject: [PATCH 2/2] send-pull-request: fix a small typo that fails the script
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
X-List-Received-Date: Thu, 02 Jun 2011 08:20:36 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 scripts/send-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 5dfc246..4904a0d 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -73,7 +73,7 @@ while getopts "achp:t:" OPT; do
 	a)
 		AUTO_CL=1
 		# Fall through to include -c
-		;&
+		;;
 	c)
 		AUTO=1
 		GITSOBCC="--signed-off-by-cc"
-- 
1.7.2



