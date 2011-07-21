Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8h-0001FT-O1
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787093"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:53:07 -0700
Message-Id: <b00a083c5470bcfb7ae9e6c4770469dd99b65254.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/20] vte: inherit perlnative
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:48 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/vte/vte.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 6138f8c..1ff0ba0 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1+"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
 RDEPENDS_libvte = "vte-termcap"
 
-inherit gnome
+inherit gnome perlnative
 
 EXTRA_OECONF = "--disable-gtk-doc --disable-python"
 
-- 
1.7.3.4



