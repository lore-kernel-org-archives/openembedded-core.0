Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgf-0008VG-8A
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495938"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:52 -0700
Message-Id: <53a109adec8c2ba909c0af1358e0939aa7726f54.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 13/21] gconf-dbus: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:45 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/gnome/gconf-dbus_705.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf-dbus_705.bb b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
index c0c2e28..52e8a08 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_705.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
@@ -10,13 +10,16 @@ RPROVIDES_${PN}-dev = "gconf-dev"
 
 #SRCREV = "705"
 #PV = "2.16.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 # This SVN repo is no longer available use a tarball mirror site until
 # we move to proper gconf recipe.
 #SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
 SRC_URI = "http://autobuilder.pokylinux.org/sources/trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz"
 
+SRC_URI[md5sum] = "dba8d534b0c6262d24817c842b36369d"
+SRC_URI[sha256sum] = "5552b1884d42d4072a199c93e35a28dc1799f9166baefbf9243394966039e416"
+
 S = "${WORKDIR}/trunk"
 
 inherit pkgconfig autotools
-- 
1.7.6.2



