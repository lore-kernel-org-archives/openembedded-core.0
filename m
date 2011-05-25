Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9h0-0002N1-P7
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:43:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223535"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:23 -0700
Message-Id: <85a3bfcdb65bb9f87bf0b298af68841592d4032c.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 01/19] gail: update gail to 1.20.2
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
X-List-Received-Date: Wed, 25 May 2011 08:43:53 -0000

[YOCTO #1042]

- Added LIC_FILES_CHKSUM
- Corrected LICENSE

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnome/{gail_1.20.0.bb => gail_1.20.2.bb}       |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{gail_1.20.0.bb => gail_1.20.2.bb} (72%)

diff --git a/meta/recipes-gnome/gnome/gail_1.20.0.bb b/meta/recipes-gnome/gnome/gail_1.20.2.bb
similarity index 72%
rename from meta/recipes-gnome/gnome/gail_1.20.0.bb
rename to meta/recipes-gnome/gnome/gail_1.20.2.bb
index 2e9f857..2c86228 100644
--- a/meta/recipes-gnome/gnome/gail_1.20.0.bb
+++ b/meta/recipes-gnome/gnome/gail_1.20.2.bb
@@ -1,10 +1,14 @@
-LICENSE = "LGPL"
-SECTION = "x11/libs"
-PR = "r1"
 DESCRIPTION = "GNOME Accessibility Implementation Library"
+SECTION = "x11/libs"
+
 DEPENDS = "gtk+"
 PROVIDES = "virtual/gail"
 
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+PR = "r0"
+
 inherit gnome
 
 EXTRA_OECONF = "--disable-gtk-doc"
-- 
1.7.3.4



