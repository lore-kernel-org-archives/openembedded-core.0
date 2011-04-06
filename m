Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q7U11-0007oM-C6
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 16:47:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Apr 2011 07:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,310,1299484800"; d="scan'208";a="675958568"
Received: from unknown (HELO helios) ([10.255.12.249])
	by fmsmga002.fm.intel.com with SMTP; 06 Apr 2011 07:45:05 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 06 Apr 2011 15:45:04 +0100
Message-Id: <cover.1302100922.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 15:42:02 +0100
Date: Wed, 06 Apr 2011 15:45:03 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/1] Update Qt4 to 4.7.2, security update
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
X-List-Received-Date: Wed, 06 Apr 2011 14:47:42 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Move Qt 4.7.x from 4.7.1 to 4.7.2 and apply security patch from OE.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: paule/qt-4.7.2
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-4.7.2

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Denys Dmytriyenko (1):
  qt4: security advisory - blacklist fraudulent comodo certificates

 ...klist-fraudulent-comodo-certificates-patch.diff |  134 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.6.3.inc                   |    1 +
 meta/recipes-qt/qt4/qt-4.7.2.inc                   |    1 +
 meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb          |    2 +-
 7 files changed, 140 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff



