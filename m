Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHop-0001by-J7
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2011 03:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="35462731"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2011 03:35:29 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:16 +0800
Message-Id: <92a840f0c7e025e3b7ecddd52f828e1dc3afeb66.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Subject: [PATCH 6/6] eglibc-locale: Added ${MLPREFIX} for task dependency.
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
X-List-Received-Date: Fri, 05 Aug 2011 10:39:55 -0000

[YOCTO #1338] Added ${MLPREFIX} to the task dependency between
eglibc-locale:do_install and the corresponding virtual/libc's
do_populate_sysroot.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index ca3940d..b8107ee 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -62,6 +62,6 @@ do_install () {
 
 inherit libc-package
 
-do_install[depends] += "virtual/libc${PKGSUFFIX}:do_populate_sysroot"
+do_install[depends] += "virtual/${MLPREFIX}libc${PKGSUFFIX}:do_populate_sysroot"
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.0.4



