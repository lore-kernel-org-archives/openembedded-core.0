Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZV6Q-0004r4-O7
	for openembedded-core@openembedded.org; Sat, 10 Dec 2011 23:09:06 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2011 14:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100849587"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2011 14:02:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Sat, 10 Dec 2011 14:01:56 -0800
Message-Id: <cover.1323554268.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/5] Fixes related to self-hosted build
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
X-List-Received-Date: Sat, 10 Dec 2011 22:09:07 -0000

This has some changes to enable the self-hosted build to 
startup in X cleanly.

One note, the texinfo change may change if I can get it to
correctly build the native/host cross tools correctly, currently
there is a problem with that part of the build which has already
been addressed in a older patch by Joshua.

Sau!

The following changes since commit 07f94fa1d661d38b775ce2d99b84e5610c369392:

  license/copyleft: exception for ast parse (2011-12-10 00:17:25 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/oe-fix

Saul Wold (5):
  ncurses: libcurses.so should link to libncurses.so
  gdk-pixbuf: Add hicolor-icon-theme as RDEPENDS
  self-hosted: Add ext2 utilites and perl-pod for building
  texinfo: fix compile failure due target makedoc binary being used
  bitbake.conf: remove texinfo-native from ASSUME_PROVIDED

 meta/conf/bitbake.conf                             |    1 -
 meta/recipes-core/ncurses/ncurses.inc              |    5 ++-
 meta/recipes-core/tasks/task-self-hosted.bb        |   54 +++++++++++--------
 .../texinfo/texinfo-4.13a/use_host_makedoc.patch   |   37 +++++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   11 +++-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    4 ++
 6 files changed, 85 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch

-- 
1.7.6.4



