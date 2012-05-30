Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SZf0q-0001E7-3Z
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 11:16:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2012 02:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="146136457"
Received: from yocto-build3.sh.intel.com ([10.239.48.5])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2012 02:05:36 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 17:08:27 +0800
Message-Id: <cover.1338368508.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Fix browser crash on PPC
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
X-List-Received-Date: Wed, 30 May 2012 09:16:16 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
    This patch use glib as unicode backend to avoid browser crash
            
webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
target system owns different endian. ICU's community is not responsive to make
a patch for this, so glib is used as work around here.

[YOCTO #1570] got fixed


The following changes since commit f28209d9d3c67203a2c7a2b25cacfe31643d1bfa:

  cooker.py: terminate the Parser processes (2012-05-25 11:39:33 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3

Zhai Edwin (1):
  webkit-gtk: Use glib as unicode backend to avoid browser crash

 meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)



