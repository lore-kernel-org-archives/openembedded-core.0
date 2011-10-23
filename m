Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RHzji-0001K1-Rc
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 17:13:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2011 08:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,394,1315206000"; d="scan'208";a="80904497"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2011 08:07:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 16:07:14 +0100
Message-Id: <cover.1319382376.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] Misc metadata fixes
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
X-List-Received-Date: Sun, 23 Oct 2011 15:13:19 -0000

The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:

  distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 13:07:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes7
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes7

Paul Eggleton (3):
  dbus: remove unused initscript
  util-linux: split out mkfs into its own package
  e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package

 meta/recipes-core/dbus/dbus.inc                    |    3 +++
 meta/recipes-core/dbus/dbus_1.4.12.bb              |    3 +++
 meta/recipes-core/util-linux/util-linux.inc        |    6 ++++--
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 ++--
 5 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.7.4.1



