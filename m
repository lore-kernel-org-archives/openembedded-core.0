Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RclWu-0001JE-0m
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:17:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88245194"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 14:10:39 -0800
Message-Id: <471373c7d4ff82844d381d3094b74763f10491f1.1324332440.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
Subject: [PATCH 01/10] gypsy: fix LICENSE field
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
X-List-Received-Date: Mon, 19 Dec 2011 22:17:56 -0000

Gypsy binaries are Gplv2.0 and the libraries LGPLv2.1

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-connectivity/gypsy/gypsy.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/gypsy/gypsy.inc b/meta/recipes-connectivity/gypsy/gypsy.inc
index 9b1c97e..11a7204 100644
--- a/meta/recipes-connectivity/gypsy/gypsy.inc
+++ b/meta/recipes-connectivity/gypsy/gypsy.inc
@@ -4,7 +4,7 @@ multiple clients to access GPS data from multiple GPS sources \
 concurrently.  Gypsy also hides the details of parsing NMEA from the \
 client applications, passing the data as simple values for the clients \
 to use."
-LICENSE = "GPL"
+LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
 
-- 
1.7.7.4



