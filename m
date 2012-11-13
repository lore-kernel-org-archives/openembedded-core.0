Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYKVR-0007Kt-PK
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:42:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 09:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="217197499"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.166])
	by azsmga001.ch.intel.com with ESMTP; 13 Nov 2012 09:28:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 17:27:55 +0000
Message-Id: <cover.1352827498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/4] First pass at implementing Smart
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
X-List-Received-Date: Tue, 13 Nov 2012 17:42:38 -0000

Since V1 that Mark originally posted, remove the BBCLASSEXTEND for
nativesdk in python-smartpm as it is currently broken when building
for nativesdk.


The following changes since commit fa7fb44d1ca2b8a57509806bde19672c68ef157d:

  mesa-demos: fix --with-glut check (2012-11-12 22:31:41 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/smart
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/smart

Mark Hatle (4):
  rpm: Slightly change the way python-rpm is constructed
  python-smartpm: Add smartpm recipe
  rpm: Add additional RPMSENSE values to python module
  python-smartpm: Add basic knowledge of RPMSENSE_MISSINGOK

 .../python/python-smartpm/smart-missingok.patch    |   43 +++++++
 .../python/python-smartpm/smart-rpm-root.patch     |   80 +++++++++++++
 .../python/python-smartpm/smartpm-rpm5-nodig.patch |   46 ++++++++
 .../python/python-smartpm_1.4.1.bb                 |  120 ++++++++++++++++++++
 .../rpm/rpm/python-rpm-rpmsense.patch              |   33 ++++++
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   27 +++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   17 ++-
 7 files changed, 360 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm_1.4.1.bb
 create mode 100644 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch

-- 
1.7.9.5



