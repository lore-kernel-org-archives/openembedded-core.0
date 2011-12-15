Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RbKrx-0005Ea-0Z
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 00:37:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87086682"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.105])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 15:30:34 -0800
Message-Id: <bb9729b5850499907686332effdaea4dee0c36bc.1323991540.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
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
X-List-Received-Date: Thu, 15 Dec 2011 23:37:47 -0000

Gypsy binaries are Gpl-2.0 and the libraries LGPL-2.0

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-connectivity/gypsy/gypsy.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/gypsy/gypsy.inc b/meta/recipes-connectivity/gypsy/gypsy.inc
index 9b1c97e..c2dead4 100644
--- a/meta/recipes-connectivity/gypsy/gypsy.inc
+++ b/meta/recipes-connectivity/gypsy/gypsy.inc
@@ -4,7 +4,7 @@ multiple clients to access GPS data from multiple GPS sources \
 concurrently.  Gypsy also hides the details of parsing NMEA from the \
 client applications, passing the data as simple values for the clients \
 to use."
-LICENSE = "GPL"
+LICENSE = "GPL-2.0 & LGPL-2.1"
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
 
-- 
1.7.7.4



