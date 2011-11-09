Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNwVt-0001qx-BI
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 01:59:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2011 16:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,479,1315206000"; d="scan'208";a="34688323"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.16])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 16:53:21 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 16:53:17 -0800
Message-Id: <cover.1320799787.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/3] Switch to upstream GConf
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
X-List-Received-Date: Wed, 09 Nov 2011 00:59:37 -0000

This series' primary goal is to switch us from gconf-dbus to the upstream
GConf, where the D-Bus backend is now maintained.

To ease recipe writing I also pulled in and cleaned up the GNOME related
classes from meta-openembedded.

Cheers,
Joshua

The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (3):
  shared-mime-info: package runtime data separately
  classes/[gnome|gnomebase|mime]: enhance gnome related classes
  gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus

 meta/classes/gnome.bbclass                         |   18 +-----
 meta/classes/gnomebase.bbclass                     |   30 ++++++++++
 meta/classes/mime.bbclass                          |   58 +++++++++++++++++++
 meta/conf/distro/include/default-providers.inc     |    2 -
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch |   59 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf-dbus_705.bb         |   43 --------------
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   43 ++++++++++++++
 .../shared-mime-info/shared-mime-info.inc          |    9 ++-
 .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
 10 files changed, 200 insertions(+), 66 deletions(-)
 create mode 100644 meta/classes/gnomebase.bbclass
 create mode 100644 meta/classes/mime.bbclass
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
 delete mode 100644 meta/recipes-gnome/gnome/gconf-dbus_705.bb
 create mode 100644 meta/recipes-gnome/gnome/gconf_3.2.3.bb

-- 
1.7.7



