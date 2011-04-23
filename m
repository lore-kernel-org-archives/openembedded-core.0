Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO2-0005CG-5N
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 23:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="737332133"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 23:29:28 -0700
Message-Id: <bdf35c8101712ffcfa7f10d8adf4663f543fbaca.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 08:49:31 +0200
Date: Fri, 22 Apr 2011 23:29:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 33/37] gconf-dbus: add SRCREV to recipe
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:10 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* taken from meta/conf/distro/include/poky-default-revisions.inc for
  those who want gconf-dbus and are not using poky

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gnome/gconf-dbus_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb b/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
index 9fdd82c..04908c3 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
@@ -10,6 +10,7 @@ RPROVIDES_${PN}-dev = "gconf-dev"
 
 PV = "2.16.0+svnr${SRCPV}"
 
+SRCREV = "705"
 SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
 S = "${WORKDIR}/trunk"
 
-- 
1.7.1.1



