Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf9-0004Fx-4d
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163463"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:48 -0700
Message-Id: <9f9f3f91f4929e111ae874825f0ef3dff1074e0c.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/27] connman: use DISTRO_FEATURES to enable wifi and bluetooth
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:39 -0000

From: Anders Darander <anders@chargestorm.se>

As wifi and bluetooth is set in DISTRO_FEATURES, connman should respect this during configuring.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-connectivity/connman/connman_0.75.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
index aeff439..5a7b284 100644
--- a/meta/recipes-connectivity/connman/connman_0.75.bb
+++ b/meta/recipes-connectivity/connman/connman_0.75.bb
@@ -8,8 +8,8 @@ EXTRA_OECONF += "\
   --enable-threads \
   --enable-loopback \
   --enable-ethernet \
-  --enable-wifi \
-  --enable-bluetooth \
+  ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
+  ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
   --enable-dnsproxy \
   --disable-dhclient \
   --enable-test \
-- 
1.7.6



