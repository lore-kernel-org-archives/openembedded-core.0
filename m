Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2mHJ-0006Ul-DE
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:25:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Feb 2013 09:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="283126314"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.42])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2013 09:10:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 17:09:57 +0000
Message-Id: <cover.1360084153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Qmmp fix
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
X-List-Received-Date: Tue, 05 Feb 2013 17:26:00 -0000

The following change since commit 3b1beb8b15b8e3e397b3aa8320490103d4f29bac:

  dropbear: fix RPROVIDES (2013-02-04 23:19:55 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qmmp
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qmmp

Paul Eggleton (1):
  qmmp: update to 0.6.6 and fix

 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch   |   25 +++++++++++++
 .../qt-apps/qmmp/no-sessionmanager.patch           |   21 +++++++++++
 .../qt-apps/{qmmp_0.6.1.bb => qmmp_0.6.6.bb}       |   39 ++++++++++++++++----
 3 files changed, 77 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
 create mode 100644 meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
 rename meta/recipes-qt/qt-apps/{qmmp_0.6.1.bb => qmmp_0.6.6.bb} (56%)

-- 
1.7.10.4



