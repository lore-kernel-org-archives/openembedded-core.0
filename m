Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US7O8-00042r-E6
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:01:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Apr 2013 07:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="227819750"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Apr 2013 07:44:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 15:44:04 +0100
Message-Id: <1366123444-30985-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] hicolor-icon-theme: bump PR to allow removal of duplicate from meta-gnome
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 15:01:55 -0000

The recipe in meta-gnome has PR = "r1" so make it the same here and
avoid PR going backwards for existing users of meta-gnome when the
recipe there is removed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 759c9d8..7c911e0 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -10,7 +10,7 @@ inherit gnome allarch
 
 DEPENDS = ""
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
         file://index.theme"
-- 
1.7.10.4



