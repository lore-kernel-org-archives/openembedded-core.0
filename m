Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvWaU-0008Ty-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 18:15:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2013 09:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="277677148"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.117])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2013 09:00:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 17:00:10 +0000
Message-Id: <cover.1358355580.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v3 0/2] dropbear: allow configuring blank password option at runtime
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
X-List-Received-Date: Wed, 16 Jan 2013 17:15:50 -0000

The following changes since commit 4b63e73422ea25aba1bde0beddb02bc04948e13c:

  update-rc.d: check also that symlinks are valid (2013-01-16 12:07:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/ssh-nopw
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/ssh-nopw

Paul Eggleton (2):
  dropbear: allow configuring blank password option at runtime
  classes/image: improve debug-tweaks ssh server configuration

 meta/classes/core-image.bbclass                    |    3 -
 meta/classes/image.bbclass                         |   16 ++-
 meta/recipes-core/dropbear/dropbear.inc            |    6 +-
 .../dropbear/dropbear/allow-nopw.patch             |   19 ----
 .../dropbear/dropbear/nopw-option.patch            |  106 ++++++++++++++++++++
 5 files changed, 122 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/allow-nopw.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/nopw-option.patch

-- 
1.7.10.4



