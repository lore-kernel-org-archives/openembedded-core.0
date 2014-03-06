Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 87BD86F5AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:09:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 09:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487325501"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 09:09:43 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:09:31 -0600
Message-Id: <08cd04eeca83045bd48e5212a82fd9818b889574.1394124934.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394124934.git.tom.zanussi@linux.intel.com>
References: <cover.1394124934.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 6/6] lttng-ust: Disable doc/examples in the build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Mar 2014 17:09:55 -0000

Don't build the doc examples - we don't need them and in fact they
never successfully built in previous iterations of the lttng-ust
recipe anyway.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lttng-ust/lttng-ust-doc-examples-disable.patch     | 18 ++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb           |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
new file mode 100644
index 0000000..b68a989
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Don't build the doc examples - we don't need them and in fact they
+never successfully built in previous iterations of the lttng-ust
+recipe anyway.
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+
+Index: doc/Makefile.am
+===================================================================
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = . examples
++SUBDIRS = .
+ 
+ dist_man_MANS = man/lttng-gen-tp.1 \
+ 	man/lttng-ust.3 \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
index 9f806c1..1629554 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
@@ -22,6 +22,7 @@ PV = "2.4.0"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.4 \
+           file://lttng-ust-doc-examples-disable.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.8.3.1


