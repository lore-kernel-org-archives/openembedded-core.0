Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8E86B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 16:44:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2013 09:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,871,1367996400"; d="scan'208";a="362071394"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by orsmga001.jf.intel.com with ESMTP; 13 Aug 2013 09:44:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 09:44:56 -0700
Message-Id: <1376412296-7521-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1376412296-7521-1-git-send-email-sgw@linux.intel.com>
References: <1376412296-7521-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 16:44:57 -0000

This shows an example of the config fragment support that
both the linux-yocto and busybox recipes use. This example
is specific to busybox.

By adding busybox CONFIG options into a .cfg file and then
adding that .cfg file to SRC_URI the merge_config.sh script will
correctly handle these CONFIG options during the do_configure task.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
 create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend

diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
new file mode 100644
index 0000000..42c6730
--- /dev/null
+++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
@@ -0,0 +1 @@
+CONFIG_RFKILL=n
diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
new file mode 100644
index 0000000..641f04a4
--- /dev/null
+++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+SRC_URI += " \
+	    file://no_rfkill.cfg \
+           "
-- 
1.8.1.4


