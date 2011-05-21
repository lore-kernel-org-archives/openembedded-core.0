Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNr6p-0000cc-Oe
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 20:41:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2011 11:38:11 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2011 11:38:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2011 11:37:57 -0700
Message-Id: <fdcd5fdbeb13f22c478d747f5d7d03ca0a9e25d1.1306002889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
Subject: [PATCH 1/8] gail: Add LIC_FILES_CHKSUM
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
X-List-Received-Date: Sat, 21 May 2011 18:41:08 -0000

[YOCTO #1042]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/gnome/gail_1.20.0.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gail_1.20.0.bb b/meta/recipes-gnome/gnome/gail_1.20.0.bb
index 2e9f857..ab6aa1f 100644
--- a/meta/recipes-gnome/gnome/gail_1.20.0.bb
+++ b/meta/recipes-gnome/gnome/gail_1.20.0.bb
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
+PR = "r1"
+
 inherit gnome
 
 EXTRA_OECONF = "--disable-gtk-doc"
-- 
1.7.3.4



