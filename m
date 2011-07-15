Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhiKk-0006g7-5J
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:21:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2011 06:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,535,1304319600"; d="scan'208";a="28373890"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2011 06:17:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 14:17:16 +0100
Message-Id: <cover.1310735644.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] cleanup of classes/
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
X-List-Received-Date: Fri, 15 Jul 2011 13:21:34 -0000

This set includes the removal of classes as previously discussed (briefly)
on the oe-core mailing list, as well as a minor whitespace fix for
kernel.bbclass.

The following changes since commit b975de5ea76c5f8827fb48c0c3c29902872ad3d6:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:22:59 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/classes-cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/classes-cleanup

Paul Eggleton (3):
  kernel.bbclass: minor whitespace fixes
  classes: remove obsolete classes
  classes: remove classes that don't belong in oe-core

 meta/classes/base_srpm.bbclass             |   20 -------
 meta/classes/ccdv.bbclass                  |   21 --------
 meta/classes/flow-lossage.bbclass          |    5 --
 meta/classes/kernel.bbclass                |    4 +-
 meta/classes/mozilla.bbclass               |   53 -------------------
 meta/classes/openmoko-base.bbclass         |   19 -------
 meta/classes/openmoko-panel-plugin.bbclass |    6 --
 meta/classes/openmoko.bbclass              |    3 -
 meta/classes/openmoko2.bbclass             |   31 -----------
 meta/classes/patcher.bbclass               |    7 ---
 meta/classes/singlemachine.bbclass         |   15 -----
 meta/classes/srec.bbclass                  |   28 ----------
 meta/classes/tmake.bbclass                 |   77 ----------------------------
 meta/classes/xfce.bbclass                  |   25 ---------
 meta/classes/xlibs.bbclass                 |    7 ---
 15 files changed, 2 insertions(+), 319 deletions(-)
 delete mode 100644 meta/classes/base_srpm.bbclass
 delete mode 100644 meta/classes/ccdv.bbclass
 delete mode 100644 meta/classes/flow-lossage.bbclass
 delete mode 100644 meta/classes/mozilla.bbclass
 delete mode 100644 meta/classes/openmoko-base.bbclass
 delete mode 100644 meta/classes/openmoko-panel-plugin.bbclass
 delete mode 100644 meta/classes/openmoko.bbclass
 delete mode 100644 meta/classes/openmoko2.bbclass
 delete mode 100644 meta/classes/patcher.bbclass
 delete mode 100644 meta/classes/singlemachine.bbclass
 delete mode 100644 meta/classes/srec.bbclass
 delete mode 100644 meta/classes/tmake.bbclass
 delete mode 100644 meta/classes/xfce.bbclass
 delete mode 100644 meta/classes/xlibs.bbclass

-- 
1.7.4.1



