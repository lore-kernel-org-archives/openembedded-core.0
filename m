Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4Lx6-0004aC-Tx
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 01:34:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2011 16:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,258,1299484800"; d="scan'208";a="672587646"
Received: from unknown (HELO localhost) ([10.255.16.103])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2011 16:32:28 -0700
Message-Id: <7884f60d460e354aeda82f865f72438f51e7e48f.1301354978.git.josh@linux.intel.com>
In-Reply-To: <cover.1301354978.git.josh@linux.intel.com>
References: <cover.1301354978.git.josh@linux.intel.com>
Old-Date: Mon, 28 Mar 2011 13:15:47 +0100
Date: Tue, 29 Mar 2011  0:32:22 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 4/4] clutter-gtk: remove duplicate gtk+ DEPENDS entry
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
X-List-Received-Date: Mon, 28 Mar 2011 23:34:29 -0000

From: Joshua Lock <josh@linux.intel.com>

the inc file already specifies the gtk+ dependancy

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/clutter-gtk-1.4_git.bb                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
index 3822b31..42a1ef2 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
@@ -12,6 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "gtk+ clutter-1.4"
+DEPENDS += "clutter-1.4"
 
 EXTRA_OECONF += "--disable-introspection"
-- 
1.7.4.1



