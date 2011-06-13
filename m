Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9R9-0004z8-GM
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2011 08:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="12930076"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2011 08:48:47 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:27 +0800
Message-Id: <ce3fa22555d6fe0699d7f607db06f5e8c07f445f.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 02/13] recipes: update Upstream-Status for multiple recipes' patches
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:23 -0000

lttng-ust
gnome-doc-utils

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |    2 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
index ad81c2f..44d18e7 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
@@ -1,7 +1,7 @@
 This adds the -nonet option to xsltproc invocations, which fixes
 compile errors when building the gnome-doc-utils docs.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
diff --git a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
index 7ab429c..a6aa6a7 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
@@ -6,7 +6,7 @@ this header is not needed even in eglibc case so it can be removed
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 Index: ust-0.12/libust/tracer.h
 ===================================================================
-- 
1.7.1



