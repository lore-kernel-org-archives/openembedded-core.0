Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8ZdA-0008L3-Lg
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:03:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Mar 2012 08:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="78402255"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.171])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Mar 2012 08:55:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 15:55:00 +0000
Message-Id: <cover.1331913268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] QA fix
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
X-List-Received-Date: Fri, 16 Mar 2012 16:03:52 -0000

The following changes since commit 9950163c91412eb58c3475354cc7f87a7be33c2b:

  python-imaging: bring in fixes from meta-oe (2012-03-16 10:56:31 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt-mobility-qa
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-mobility-qa

Paul Eggleton (1):
  qt-mobility: fix QA warnings

 ...nnecessary-rpaths-from-qml_device-example.patch |   28 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    5 ++-
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch

-- 
1.7.5.4



