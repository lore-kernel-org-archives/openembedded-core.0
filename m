Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SIfwb-0000Ev-85
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:49:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Apr 2012 05:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130551854"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.75])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2012 05:40:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 13:40:17 +0100
Message-Id: <1334320817-7099-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] default-distrovars: remove NO32LIBS setting
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
X-List-Received-Date: Fri, 13 Apr 2012 12:49:41 -0000

The ??= assignment in pseudo.inc effectively nullifies this ??=
assignment here, so remove it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 16b3108..c38cd35 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -37,8 +37,6 @@ COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
 
 BB_GENERATE_MIRROR_TARBALLS ??= "0"
 
-NO32LIBS ??= "1"
-
 # Default to emitting logfiles if a build fails.
 BBINCLUDELOGS ??= "yes"
 SDK_VERSION ??= "oe-core.0"
-- 
1.7.5.4



