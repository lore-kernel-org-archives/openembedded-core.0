Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QX3A5-0006Lh-JL
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 05:22:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2011 20:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,372,1304319600"; d="scan'208";a="16853450"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.50])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2011 20:19:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2011 20:18:58 -0700
Message-Id: <cover.1308193566.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] Change gconf-dbus to a src tarball
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
X-List-Received-Date: Thu, 16 Jun 2011 03:22:29 -0000

Richard,

The current gconf-dbus has gone away, this causes issues with 
builds and autobuilder.

Sau!


The following changes since commit 34f4f9eae8c588234b29e44f5a3ea9edbc10620d:

  eglibc: bump PR for SRCREV changes (2011-06-15 14:30:23 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/gconf-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/gconf-fix

Saul Wold (1):
  gconf-dbus: Fix SRC_URI to tarball

 .../gnome/{gconf-dbus_svn.bb => gconf-dbus_705.bb} |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{gconf-dbus_svn.bb => gconf-dbus_705.bb} (69%)

-- 
1.7.3.4



