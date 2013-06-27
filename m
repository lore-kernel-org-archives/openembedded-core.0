Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BB9C260780
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 22:43:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2013 15:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,955,1363158000"; d="scan'208";a="356926302"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2013 15:44:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 15:43:15 -0700
Message-Id: <1372372997-1604-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
References: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] packagegroups: Update for split mc packages
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
X-List-Received-Date: Thu, 27 Jun 2013 22:43:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb    | 4 ++++
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 4 ++++
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb   | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ed73617..d4e89a1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -39,6 +39,10 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     iptables \
     lsb \
     mc \
+    mc-fish \
+    mc-helpers \
+    mc-helpers-perl \
+    mc-helpers-python \
     parted \
     pseudo \
     screen \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 00405d6..47b980e 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -59,6 +59,10 @@ RDEPENDS_packagegroup-core-basic-utils = "\
     grep \
     makedevs \
     mc \
+    mc-fish \
+    mc-helpers \
+    mc-helpers-perl \
+    mc-helpers-python \
     mktemp \
     ncurses \
     net-tools \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index ed854b8..d71db26 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -50,6 +50,10 @@ RDEPENDS_packagegroup-core-sys-extended = "\
     lrzsz \
     lzo \
     mc \
+    mc-fish \
+    mc-helpers \
+    mc-helpers-perl \
+    mc-helpers-python \
     mdadm \
     minicom \
     neon \
-- 
1.8.1.4


