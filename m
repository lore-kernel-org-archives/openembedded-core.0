Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd4-0001K6-Gi
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283950"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:35 -0700
Message-Id: <224ccc44258e1da96c6a3890cc4ecdf079983c57.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/51] recipes: update Upstream-Status for multiple recipes' patches
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:43 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.3.4



