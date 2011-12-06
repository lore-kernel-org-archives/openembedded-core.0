Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RXoRk-0005Om-6x
	for openembedded-core@openembedded.org; Tue, 06 Dec 2011 07:24:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2011 22:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83881065"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.199])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2011 22:16:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Mon,  5 Dec 2011 22:16:12 -0800
Message-Id: <afc70a8e7218041b31a53ef558904a912c23555f.1323148082.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323148082.git.sgw@linux.intel.com>
References: <cover.1323148082.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323148082.git.sgw@linux.intel.com>
References: <cover.1323148082.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] distro_tracking: fix manual entries
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
X-List-Received-Date: Tue, 06 Dec 2011 06:24:08 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 3d502ee..f53fffa 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5734,7 +5734,7 @@ RECIPE_NO_UPDATE_REASON_pn-groff = "1.18.1.4 is latest GPLv2 Version no 1.21"
 RECIPE_STATUS_pn-eglibc = "red"
 RECIPE_LATEST_VERSION_pn-eglibc = "2.13-r15508"
 RECIPE_LAST_UPDATE_pn-eglibc = "Nov 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn = "Nov 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eglibc = "Nov 16, 2011"
 
 RECIPE_STATUS_pn-lighttpd = "red"
 RECIPE_LAST_UPDATE_pn-lighttpd = "Jul 28, 2011"
@@ -5999,7 +5999,7 @@ RECIPE_STATUS_pn-ghostscript = "red"
 RECIPE_LATEST_VERSION_pn-ghostscript = "9.04"
 RECIPE_MAINTAINER_pn-ghostscript = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_LAST_UPDATE_pn-ghostscript = "Oct 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ghostscript = "Oct 19, 2011"
 
 RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
-- 
1.7.6.4



