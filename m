Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rb0ZL-00035L-0M
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 02:57:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Dec 2011 17:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="87466927"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2011 17:50:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:50:04 -0800
Message-Id: <cover.1323911699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/7] SSTATE_SCAN_FILES Fix with non-gplv3 and World fixes
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
X-List-Received-Date: Thu, 15 Dec 2011 01:57:11 -0000

Richard,

This patch contains a couple of fixes for world and non-gplv3 along
with the sstate fix for ensure we mangle (or "fixmepath") files that
do not fall into the standard set.

SSTATE_SCAN_FILES is defaulted to "*.la and *-configs", recipes can
append to it with SSTATE_SCAN_FILES += "<filename>".


The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (7):
  qt-mobility: Fix QA error for debug files
  ed: Fix EXTRA_OECONF to ensure right compiler is found
  sstate: Add SSTATE_SCAN_FILES
  icu: Add Makefile.inc to SSTATE_SCAN_FILES
  gmp: Add gmp.h to SSTATE_SCAN_FILES
  libtool-cross: Add libtool & libtoolize to SSTATE_SCAN_FILES
  perl: add .pl, pm, pod, sh files to SSTATE_SCANE_FILES

 meta/classes/sstate.bbclass                        |   11 ++++++++++-
 .../libtool/libtool-cross_2.4.2.bb                 |    4 +++-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    5 ++++-
 meta/recipes-extended/ed/ed_0.5.bb                 |    5 ++++-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    7 ++++---
 meta/recipes-support/gmp/gmp.inc                   |    2 ++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
 meta/recipes-support/icu/icu-3.6.inc               |    2 ++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 10 files changed, 32 insertions(+), 10 deletions(-)

-- 
1.7.6.4



