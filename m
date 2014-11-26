Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8C6670A7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:53:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2014 00:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,461,1413270000"; d="scan'208";a="643737255"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2014 00:53:11 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 81D8D6A408D;
	Wed, 26 Nov 2014 00:52:14 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 10:44:59 +0200
Message-Id: <1416991499-22546-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] meta-yocto/distro: Updated SANITY_TESTED_DISTROS.
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
X-List-Received-Date: Wed, 26 Nov 2014 08:53:15 -0000

Removed Poky-1.4, Poky-1.5, Ubuntu-13.10, Fedora-19, CentOs-6.4,Suse-LINUX-12.2. Replaced the list of Debian-7.x with wildcard. Added Ubuntu 14.10.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta-yocto/conf/distro/poky.conf | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index e1dfea4..0e66e84 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -73,26 +73,14 @@ CONNECTIVITY_CHECK_URIS ?= " \
              http://bugzilla.yoctoproject.org/report.cgi"
 
 SANITY_TESTED_DISTROS ?= " \
-            Poky-1.4 \n \
-            Poky-1.5 \n \
             Poky-1.6 \n \
             Poky-1.7 \n \
             Ubuntu-12.04 \n \
-            Ubuntu-13.10 \n \
             Ubuntu-14.04 \n \
-            Fedora-19 \n \
+            Ubuntu-14.10 \n \
             Fedora-20 \n \
-            CentOS-6.4 \n \
             CentOS-6.5 \n \
-            Debian-7.0 \n \
-            Debian-7.1 \n \
-            Debian-7.2 \n \
-            Debian-7.3 \n \
-            Debian-7.4 \n \
-            Debian-7.5 \n \
-            Debian-7.6 \n \
-            Debian-7.7 \n \
-            SUSE-LINUX-12.2 \n \
+            Debian-7.* \n \
             openSUSE-project-12.3 \n \
             openSUSE-project-13.1 \n \
             "
-- 
2.1.0


