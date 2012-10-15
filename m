Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TNtD3-0003oL-S5
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 00:32:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2012 15:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,590,1344236400"; d="scan'208";a="156486157"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.226])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Oct 2012 15:19:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2012 15:19:11 -0700
Message-Id: <1350339551-8820-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1350339551-8820-1-git-send-email-sgw@linux.intel.com>
References: <1350339551-8820-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] sato-icon-theme: update mapping program location
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
X-List-Received-Date: Mon, 15 Oct 2012 22:32:30 -0000

When we changed the /usr/libexec default to be
/usr/lib/<pn>, the icon name mapping needed to
be updated also.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 0bd4814..b07d8c3 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -12,7 +12,7 @@ inherit autotools pkgconfig allarch gtk-icon-cache
 
 FILES_${PN} += "${datadir}"
 
-EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
+EXTRA_OECONF += "--with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/icon-name-mapping"
 
 # Explictly setting "Sato" as the default icon theme to avoid flickering from
 # the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 6405359..cd34cac 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,7 +2,7 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
-- 
1.7.7.6



