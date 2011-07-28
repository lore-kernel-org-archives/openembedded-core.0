Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmRUD-0001S8-3V
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:22:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jul 2011 07:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="32570323"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.244])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 07:18:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:18:28 +0100
Message-Id: <24425d51a79827cadfb9dd114fdba45a92aea1ab.1311862525.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311862525.git.paul.eggleton@linux.intel.com>
References: <cover.1311862525.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311862525.git.paul.eggleton@linux.intel.com>
References: <cover.1311862525.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] bitbake.conf: remove PACKAGE_EXTRA_ARCHS_tune-XXX default
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
X-List-Received-Date: Thu, 28 Jul 2011 14:22:53 -0000

Because of the way BitBake handles ??= under certain circumstances, this
default setting ends up stepping all over the real setting from the arch
include file. Since virtually all arch include files or tune files define
a real value for this we shouldn't need to have a default (or it needs to
be done in a different way).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6e109ec..9c80f11 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -84,7 +84,6 @@ HOST_EXEEXT = ""
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
-PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
 
-- 
1.7.4.1



