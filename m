Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvYMx-00047W-P4
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:05:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2012 09:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105753130"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.13])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2012 09:57:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, philip@balister.org,
	eric@eukrea.com
Date: Thu,  9 Feb 2012 17:57:06 +0000
Message-Id: <cover.1328809777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/4] qmake/qt4-tools-nativesdk fixes
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
X-List-Received-Date: Thu, 09 Feb 2012 18:05:20 -0000

This patchset enables building qmake for the target with other target
utilities. I also fixed a couple of build failures in the process.

In addition I've used the same method to build qmake in the
qt4-tools-nativesdk recipe. This wasn't strictly necessary, however I
think it would be good to be consistent and incidentally the resulting
qmake executable is slightly smaller.

NOTE: This patchset is an RFC - please do not merge until people have
had a chance to test. I haven't thoroughly tested these myself yet.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:

  tcmode-default: add preference for gdb/gdbserver (2012-02-08 10:16:48 -0600)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qmake-target
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qmake-target

Paul Eggleton (4):
  qt4: fix compile error in Qt 4.8.0 with gcc 4.6
  qt4: build qmake for the target
  qt4-tools-nativesdk: fix build of 4.7.4
  qt4-tools-nativesdk: improve and tidy up qmake build

 meta/recipes-qt/qt4/files/qmake-exists-check.patch |   19 ---------
 meta/recipes-qt/qt4/files/target_qmake.patch       |   16 ++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   11 +-----
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |   13 +-----
 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch |   40 ++++++++++++++++++++
 .../recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch |   19 +++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   29 +++++++++-----
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |    2 +
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb          |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   25 +++++++++++-
 13 files changed, 125 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/files/qmake-exists-check.patch
 create mode 100644 meta/recipes-qt/qt4/files/target_qmake.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch

-- 
1.7.5.4



