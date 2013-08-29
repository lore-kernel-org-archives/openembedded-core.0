Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 23DAF6BD7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:06:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2013 16:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,986,1367996400"; d="scan'208";a="394243052"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.210])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2013 16:06:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: cristian.iorga@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 16:06:24 -0700
Message-Id: <1377817584-30537-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] packagegroup-self-hosted: Add missing python code
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
X-List-Received-Date: Thu, 29 Aug 2013 23:06:26 -0000

These are in the Toolchain list, so they should also be installed on the build appliance

[YOCTO #5061]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 429ade9..6e23ea2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -138,6 +138,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     minicom \
     mtools \
     ncurses \
+    ncurses-terminfo-base \
     neon \
     nfs-utils \
     nfs-utils-client \
@@ -158,24 +159,29 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     python-core \
     python-curses \
     python-datetime \
+    python-difflib \
     python-distutils \
     python-elementtree \
     python-email \
     python-fcntl \
     python-git \
+    python-json \
     python-logging \
     python-misc \
+    python-mmap \
     python-multiprocessing \
     python-netclient \
     python-netserver \
     python-pickle \
     python-pkgutil \
+    python-pprint \
     python-re \
     python-rpm \
     python-shell \
     python-sqlite3 \
     python-subprocess \
     python-textutils \
+    python-unittest \
     python-unixadmin \
     python-xmlrpc \
     quota \
-- 
1.8.3.1


