Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7cLF-0006nj-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:45:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77188053"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.185])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:36:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 00:36:30 +0000
Message-Id: <26788ad9a8af2096b129aff94ca32ed95dcf29de.1331685330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] mx: add dependencies
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
X-List-Received-Date: Wed, 14 Mar 2012 00:45:25 -0000

* Add dependency on startup-notification, which is optional but without
  it mx applications will not send startup notifications.
* Add dependencies on gdk-pixbuf and libxrandr which are usually taken
  care of, but are required and thus should be stated explicitly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/mx/mx_1.4.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mx/mx_1.4.2.bb b/meta/recipes-graphics/mx/mx_1.4.2.bb
index c50bc0f..bee65f6 100644
--- a/meta/recipes-graphics/mx/mx_1.4.2.bb
+++ b/meta/recipes-graphics/mx/mx_1.4.2.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 
 PR = "r1"
 
-DEPENDS = "clutter-1.8 dbus-glib"
+DEPENDS = "clutter-1.8 dbus-glib libxrandr gdk-pixbuf startup-notification"
 
 inherit autotools gettext
 
-- 
1.7.5.4



