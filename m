Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08A2265DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 20:25:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Sep 2014 13:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="393762731"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2014 13:18:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 13:24:52 -0700
Message-Id: <1412108692-17571-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] local.conf.sample.extended: Document RPM4 setup
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
X-List-Received-Date: Tue, 30 Sep 2014 20:25:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/local.conf.sample.extended | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 196590e..1995732 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -361,3 +361,14 @@
 # feed layout is used where package files are placed in <outdir>/<arch>/.
 #
 #IPK_HIERARCHICAL_FEED = "1"
+#
+
+# Using RPM4
+#
+# Currently the rootfs_rpm code has a hard depends on rpmresolve:do_populate_sysroot,
+# when using rpm4 the rpmresolve code will not compile due to a missing header file.
+# That dependency needs to be removed when using RPM4, also the PREFRRED_VERSION needs
+# to be set. This example shows how to enable rpm4
+# PREFERRED_VERSION_rpm = "4.11.2"
+# PREFERRED_VERSION_rpm-native = "4.11.2"
+# RPMROOTFSDEPENDS_remove = "rpmresolve-native:do_populate_sysroot"
-- 
1.8.3.1


